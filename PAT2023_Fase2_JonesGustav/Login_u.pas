unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, FileIO_u, Parser_u;

type
  TfrmLogin = class(TForm)
    pnlSignUp: TPanel;
    lblLogIn: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnLogIn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  var
    bLogin: Boolean;
    sUsername : String;
    iProfilePicIndex : Integer;
    bIsUser: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLogInClick(Sender: TObject);
var
  sPassword: String;

  sFileContents: String;
begin
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;

  if (sUsername = '') then
  begin
    ShowMessage('Enter a username');
    exit;
  end;

  if (sPassword = '') then
  begin
    ShowMessage('Enter a password');
    exit;
  end;

  if not(FileIO_u.FileExists(sUsername + '.json')) then
  begin
    ShowMessage('Account Not Found');
    exit;
  end;

  sFileContents := FileIO_u.ReadFile(sUsername + '.json'); // Get Account details from file

  if not(Parser_u.ReadEntryValue(sFileContents, 2) = sPassword) then // Check if passwords match
  begin
    ShowMessage('Passwords don'' t match ');
    exit;
  end;

  if (StrToInt(Parser_u.ReadEntryValue(sFileContents, 4)) = 1) then // Gets User type
    bIsUser := True
  else if (StrToInt(Parser_u.ReadEntryValue(sFileContents, 4)) = 2) then
    bIsUser := False;

  iProfilePicIndex := StrToInt(Parser_u.ReadEntryValue(sFileContents, 5)); // Get User Profile Picture
  
  bLogin := True;
  ShowMessage('Login Complete');
  Close;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  sUsername := '';
  iProfilePicIndex := -1;
  bLogin := False;
  bIsUser := True;

  edtUsername.Text := '';
  edtPassword.Text := '';

  btnLogIn.SetFocus;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  sUsername := '';
  iProfilePicIndex := -1;
  bLogin := False;
  bIsUser := True;
end;

end.
