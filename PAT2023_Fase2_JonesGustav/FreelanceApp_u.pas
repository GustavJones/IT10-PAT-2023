unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Math, UITypes,
  Login_u, Signup_u, Help_u, TaskEditor_u, ApplicationInformation_u, Vcl.Samples.Spin;

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
    bmbApplyReset: TBitBtn;
    imgAccount: TImage;
    btnLogin: TButton;
    btnSignUp: TButton;
    tsGUICreator: TTabSheet;
    lblInformation: TLabel;
    ltbCheckoutItems: TListBox;
    btnApplicationInformation: TButton;
    btnHome: TButton;
    tsAccountH: TTabSheet;
    imgAccountProfile: TImage;
    lblAccountWelcome: TLabel;
    btnChangePassword: TButton;
    pnlAccountHBottom: TPanel;
    btnAccountHNext: TButton;
    pnlCheckoutBottom: TPanel;
    btnCheckoutNext: TButton;
    btnCheckoutCreateGUI: TButton;
    bmbCheckoutReset: TBitBtn;
    btnCheckoutHome: TButton;
    btnApplyBack: TButton;
    btnCheckoutBack: TButton;
    pnlGUICreatorBottom: TPanel;
    bmbGUICreatorReset: TBitBtn;
    btnGUICreatorHome: TButton;
    btnGUICreatorBack: TButton;
    tsTaskList: TTabSheet;
    lstTaskListItems: TListBox;
    pnlTaskListBottom: TPanel;
    btnTaskListNext: TButton;
    bmbTaskListReset: TBitBtn;
    btnTaskListHome: TButton;
    btnTaskListBack: TButton;
    btnTaskListEdit: TButton;
    pnlGUICreatorForm: TPanel;
    pnlGUICreatorObjectList: TPanel;
    lblGUICreatorLabel: TLabel;
    btnGUICreatorButton: TButton;
    pnlGUICreatorPanel: TPanel;
    edtGUICreatorEdit: TEdit;
    chkGUICreatorCheckbox: TCheckBox;
    sedGUICreatorSpinEdit: TSpinEdit;
    pnlGUICreatorObjectEditor: TPanel;
    tsPriceEditor: TTabSheet;
    lblPriceEditorConsultFee: TLabel;
    edtPriceEditorPricePerLine: TEdit;
    lblPriceEditorPricePerLine: TLabel;
    edtPriceEditorConsultFee: TEdit;
    imgMoneyIcon: TImage;
    pnlPriceEditorBottom: TPanel;
    bmbPriceEditorReset: TBitBtn;
    btnPriceEditorHome: TButton;
    btnPriceEditorBack: TButton;
    sedPosX: TSpinEdit;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bmbCloseClick(Sender: TObject);
    procedure bmbSignOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure bmbHelpClick(Sender: TObject);
    procedure btnEditGUIClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure bmbResetClick(Sender: TObject);
    procedure btnTaskListEditClick(Sender: TObject);
    procedure btnApplicationInformationClick(Sender: TObject);
  private
  var
    iDefaultWidth: Integer;
    iDefaultHeight: Integer;
    rWidthScale: Real;
    rHeightScale: Real;

    bIsUser : Boolean;
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

procedure TfrmFreelanceApp.bmbResetClick(Sender: TObject);
begin
  //
end;

procedure TfrmFreelanceApp.bmbSignOutClick(Sender: TObject);
var
  iSignOut : Integer;
begin
  iSignOut := MessageDlg('Are you sure you want to sign out?', mtInformation, mbYesNo, 0);

  if iSignOut = idYes then
  begin
    bLoggedIn := False;
    frmLogin.bLogin := False;

    tsApply.TabVisible := False;
    tsCheckout.TabVisible := False;
    tsGUICreator.TabVisible := False;
    tsAccount.TabVisible := True;

    pgcPages.TabIndex := + 1;

    tsAccountH.TabVisible := False;

    bmbSignOut.Enabled := False;
  end;

end;

procedure TfrmFreelanceApp.btnNextClick(Sender: TObject);
begin
  pgcPages.TabIndex := pgcPages.TabIndex + 1;
end;

procedure TfrmFreelanceApp.btnApplicationInformationClick(Sender: TObject);
begin
  frmApplicationInformation.Show;
end;

procedure TfrmFreelanceApp.btnBackClick(Sender: TObject);
begin
  pgcPages.TabIndex := pgcPages.TabIndex - 1;
end;

procedure TfrmFreelanceApp.btnEditGUIClick(Sender: TObject);
begin
  pgcPages.TabIndex := pgcPages.PageCount - 4;
end;

procedure TfrmFreelanceApp.btnHomeClick(Sender: TObject);
begin
  pgcPages.TabIndex := 0;
end;

procedure TfrmFreelanceApp.btnLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.btnSignUpClick(Sender: TObject);
begin
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.btnTaskListEditClick(Sender: TObject);
begin
  frmTaskEditor.Show;
end;

procedure TfrmFreelanceApp.FormActivate(Sender: TObject);
begin
  bLoggedIn	:= frmLogin.bLogin;

  if (bLoggedIn) and (bIsUser) then
  begin
    tsApply.TabVisible := True;
    tsCheckout.TabVisible := True;
    tsGUICreator.TabVisible := True;
    tsAccountH.TabVisible := True;

    pgcPages.TabIndex := pgcPages.TabIndex - 1;
    tsAccount.TabVisible := False;

    bmbSignOut.Enabled := True;
  end
  else if (bLoggedIn) and not (bIsUser) then       
  begin
    tsPriceEditor.TabVisible := True;
    tsTaskList.TabVisible := True;
    tsAccountH.TabVisible := True;

    pgcPages.TabIndex := pgcPages.TabIndex - 1;
    tsAccount.TabVisible := False;
  end;
end;

procedure TfrmFreelanceApp.FormCreate(Sender: TObject);
begin
  iDefaultWidth := ClientWidth;
  iDefaultHeight := ClientHeight;

  bIsUser := True; // User Override (Temporary)
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
