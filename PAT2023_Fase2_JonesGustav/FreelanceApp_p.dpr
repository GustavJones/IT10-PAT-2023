program FreelanceApp_p;

uses
  Vcl.Forms,
  FreelanceApp_u in 'FreelanceApp_u.pas' {frmFreelanceApp},
  Signup_u in 'Signup_u.pas' {frmSignup},
  Login_u in 'Login_u.pas' {frmLogin},
  TaskEditor_u in 'TaskEditor_u.pas' {frmTaskEditor},
  ApplicationInformation_u in 'ApplicationInformation_u.pas' {frmApplicationInformation},
  FileIO_u in 'FileIO_u.pas',
  Parser_u in 'Parser_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFreelanceApp, frmFreelanceApp);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmTaskEditor, frmTaskEditor);
  Application.CreateForm(TfrmApplicationInformation, frmApplicationInformation);
  Application.Run;
end.
