program FreelanceApp_p;

uses
  Vcl.Forms,
  FreelanceApp_u in 'FreelanceApp_u.pas' {frmFreelanceApp},
  Login_u in 'Login_u.pas' {frmLogin},
  Signup_u in 'Signup_u.pas' {frmSignup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFreelanceApp, frmFreelanceApp);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.Run;
end.
