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
    bIsUser: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLogInClick(Sender: TObject);
var
  sUsername: String;
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

  sFileContents := FileIO_u.ReadFile(sUsername + '.json');

  if not(Parser_u.ReadEntryValue(sFileContents, 2) = sPassword) then
  begin
    ShowMessage('Passwords don'' t match ');
    exit;
  end
  else
  begin
    bLogin := True;
    ShowMessage('Login Complete');
    Close;
  end;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  bLogin := False;
  bIsUser := True;

  btnLogIn.SetFocus;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  bLogin := False;
  bIsUser := True;
end;

end.
