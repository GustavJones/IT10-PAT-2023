unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Math, UITypes,
  Login_u, Signup_u, Help_u;

type
  TfrmFreelanceApp = class(TForm)
    pgcPages: TPageControl;
    lblTitle: TLabel;
    bmbClose: TBitBtn;
    pnlBottom: TPanel;
    tsApply: TTabSheet;
    bmbHelp: TBitBtn;
    tsCheckout: TTabSheet;
    lblApplyTitle: TLabel;
    btnApplyNext: TButton;
    pnlApplyBottom: TPanel;
    edtTaskName: TEdit;
    tsAccount: TTabSheet;
    redDescription: TRichEdit;
    lblDescription: TLabel;
    btnEditGUI: TButton;
    bmbSignOut: TBitBtn;
    dtpDueDate: TDateTimePicker;
    lblDueDate: TLabel;
    btnApply: TButton;
    bmbReset: TBitBtn;
    imgAccount: TImage;
    btnSignUp: TButton;
    btnLogin: TButton;
    procedure bmbLoginClick(Sender: TObject);
    procedure bmbSignUpClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bmbCloseClick(Sender: TObject);
    procedure bmbSignOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure bmbHelpClick(Sender: TObject);
    procedure btnAccountNextClick(Sender: TObject);
  private
  var
    iDefaultWidth: Integer;
    iDefaultHeight: Integer;
    rWidthScale: Real;
    rHeightScale: Real;
  public
  var
    bLoggedIn : Boolean;
  end;

var
  frmFreelanceApp: TfrmFreelanceApp;

implementation

{$R *.dfm}

procedure TfrmFreelanceApp.bmbCloseClick(Sender: TObject);
var
  iExit: Integer;
begin
  iExit := MessageDlg('Are you sure you want to exit?', mtInformation, mbYesNo, 0);

  if iExit = idYes then
  begin
    frmFreelanceApp.Close;
  end;
end;

procedure TfrmFreelanceApp.bmbHelpClick(Sender: TObject);
begin
  frmHelp.Show;
end;

procedure TfrmFreelanceApp.bmbLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.bmbSignOutClick(Sender: TObject);
var
  iSignOut : Integer;
begin
  iSignOut := MessageDlg('Are you sure you want to sign out?', mtInformation, mbYesNo, 0);

  if iSignOut = idYes then
  begin
    bLoggedIn := False;

    tsApply.TabVisible := False;
    tsCheckout.TabVisible := False;

    bmbSignOut.Enabled := False;
  end;

end;

procedure TfrmFreelanceApp.bmbSignUpClick(Sender: TObject);
begin
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.btnAccountNextClick(Sender: TObject);
begin
  pgcPages.TabIndex := pgcPages.TabIndex + 1;
end;

procedure TfrmFreelanceApp.btnLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.btnSignUpClick(Sender: TObject);
begin
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.FormActivate(Sender: TObject);
begin
  bLoggedIn	:= frmLogin.bSuccess;

  if bLoggedIn then
  begin
    tsApply.TabVisible := True;
    tsCheckout.TabVisible := True;

    bmbSignOut.Enabled := True;
  end;
end;

procedure TfrmFreelanceApp.FormCreate(Sender: TObject);
begin
  iDefaultWidth := ClientWidth;
  iDefaultHeight := ClientHeight;
end;

procedure TfrmFreelanceApp.FormResize(Sender: TObject);
begin
  rWidthScale := (ClientWidth / iDefaultWidth);
  rHeightScale := (ClientHeight / iDefaultHeight);

  lblTitle.Font.Size := Trunc(rWidthScale * 25);

//  btnLogin.Margins.Left := Trunc(rWidthScale * 180);
//  btnLogin.Margins.Right := Trunc(rWidthScale * 180);
//
//  btnSignUp.Margins.Left := Trunc(rWidthScale * 180);
//  btnSignUp.Margins.Right := Trunc(rWidthScale * 180);

end;

end.
