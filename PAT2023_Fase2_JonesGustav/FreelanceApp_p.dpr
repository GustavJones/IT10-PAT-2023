program FreelanceApp_p;

uses
  Vcl.Forms,
  FreelanceApp_u in 'FreelanceApp_u.pas' {frmFreelanceApp},
  Signup_u in 'Signup_u.pas' {frmSignup},
  Login_u in 'Login_u.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFreelanceApp, frmFreelanceApp);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
