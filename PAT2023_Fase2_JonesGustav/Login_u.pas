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
    bSuccess: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLogInClick(Sender: TObject);
begin
  bSuccess := True;

  Close;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  bSuccess := False;

  btnLogIn.SetFocus;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  bSuccess := False;
end;

end.
