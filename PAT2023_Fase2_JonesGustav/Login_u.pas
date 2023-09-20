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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  btnLogIn.SetFocus;
end;

end.
