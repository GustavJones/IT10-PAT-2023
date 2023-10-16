unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

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
  sUsername : String;
  sPassword : String;
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

  bLogin := True;

  // Login Function Call

  ShowMessage('Login Complete');

  Close;
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
