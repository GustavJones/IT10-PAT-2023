unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Math, UITypes, Vcl.Samples.Spin,
  Login_u, Signup_u, Help_u, TaskEditor_u, ApplicationInformation_u, Parser_u,
  FileIO_u;

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
    edtApplyTaskName: TEdit;
    tsAccount: TTabSheet;
    redApplyDescription: TRichEdit;
    lblApplyDescription: TLabel;
    btnEditGUI: TButton;
    bmbSignOut: TBitBtn;
    dtpApplyDueDate: TDateTimePicker;
    lblApplyDueDate: TLabel;
    btnApply: TButton;
    bmbApplyReset: TBitBtn;
    imgAccountAccount: TImage;
    btnAccountLogin: TButton;
    btnAccountSignUp: TButton;
    tsGUICreator: TTabSheet;
    lblCheckoutInformation: TLabel;
    ltbCheckoutItems: TListBox;
    btnCheckoutApplicationInformation: TButton;
    btnHome: TButton;
    tsAccountH: TTabSheet;
    imgAccountHProfile: TImage;
    lblAccountHWelcome: TLabel;
    btnAccountHChangePassword: TButton;
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
    imgPriceEditorMoneyIcon: TImage;
    pnlPriceEditorBottom: TPanel;
    bmbPriceEditorReset: TBitBtn;
    btnPriceEditorHome: TButton;
    btnPriceEditorBack: TButton;
    sedGUICreatorPosX: TSpinEdit;
    lblGUICreatorPosX: TLabel;
    lblGUICreatorPosY: TLabel;
    sedGUICreatorPosY: TSpinEdit;
    lblGUICreatorCaption: TLabel;
    edtGUICreatorCaption: TEdit;
    btnPriceEditorSave: TButton;
    pnlPriceEditorTop: TPanel;
    lblPriceEditorPriorityCost: TLabel;
    edtPriceEditorPriorityCost: TEdit;
    chkApplyPriority: TCheckBox;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bmbCloseClick(Sender: TObject);
    procedure bmbSignOutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAccountSignUpClick(Sender: TObject);
    procedure btnAccountLoginClick(Sender: TObject);
    procedure bmbHelpClick(Sender: TObject);
    procedure btnEditGUIClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure bmbResetClick(Sender: TObject);
    procedure btnTaskListEditClick(Sender: TObject);
    procedure btnCheckoutApplicationInformationClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnAccountHChangePasswordClick(Sender: TObject);
  private
  var
    sUsername : String;
    bIsUser: Boolean;
    iProfilePicIndex : Integer;

    iDefaultWidth: Integer;
    iDefaultHeight: Integer;
    rWidthScale: Real;
    rHeightScale: Real;
  public
  var
    bLoggedIn: Boolean;
  end;

var
  frmFreelanceApp: TfrmFreelanceApp;

implementation

{$R *.dfm}

procedure TfrmFreelanceApp.bmbCloseClick(Sender: TObject);
var
  iExit: Integer;
begin
  iExit := MessageDlg('Are you sure you want to exit?', mtInformation,
    mbYesNo, 0);

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
  iSignOut: Integer;
begin
  iSignOut := MessageDlg('Are you sure you want to sign out?', mtInformation,
    mbYesNo, 0);

  if iSignOut = idYes then
  begin
    bLoggedIn := False;
    frmLogin.bLogin := False;

    tsApply.TabVisible := False;
    tsCheckout.TabVisible := False;
    tsGUICreator.TabVisible := False;
    tsAccount.TabVisible := True;

    pgcPages.TabIndex := +1;

    tsAccountH.TabVisible := False;

    bmbSignOut.Enabled := False;
  end;

end;

procedure TfrmFreelanceApp.btnNextClick(Sender: TObject);
begin
  pgcPages.TabIndex := pgcPages.TabIndex + 1;
end;

procedure TfrmFreelanceApp.btnCheckoutApplicationInformationClick
  (Sender: TObject);
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

procedure TfrmFreelanceApp.btnAccountHChangePasswordClick(Sender: TObject);
var
  sRawData: String;
begin
  sRawData := FileIO_u.ReadFile('example.json');
  // ShowMessage(Parser_u.CreateEntry('Name,Date,Description'));
  // ShowMessage(Parser_u.ReadEntryKey(sRawData, 2));
  // ShowMessage(Parser_u.ReadEntryValue(sRawData, 2));
  // ShowMessage(Parser_u.WriteEntryValue(sRawData, 'Test value', 2));
  // ShowMessage(Parser_u.WriteEntryKey(sRawData, 'Test key', 2));
  // ShowMessage(IntToStr(Parser_u.GetPropertyIndex(sRawData, 'Description')));
  // ShowMessage(IntToStr(Parser_u.GetEntryCount(sRawData)));
  // ShowMessage(Parser_u.ReadEntry(sRawData, 2));
end;

procedure TfrmFreelanceApp.btnAccountLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.btnAccountSignUpClick(Sender: TObject);
begin
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.btnApplyClick(Sender: TObject);
var
  sName: String;
  sDescription: String;
  dDate: TDate;
  bPriority: Boolean;
  i: Integer;
begin
  sName := edtApplyTaskName.Text;
  for i := 1 to redApplyDescription.Lines.Count do
  begin
    sDescription := sDescription + redApplyDescription.Lines[i];
  end;

  // sDescription := redApplyDescription.Lines;
  dDate := dtpApplyDueDate.Date;
  bPriority := chkApplyPriority.Checked;
end;

procedure TfrmFreelanceApp.btnTaskListEditClick(Sender: TObject);
begin
  frmTaskEditor.Show;
end;

procedure TfrmFreelanceApp.FormActivate(Sender: TObject);
begin
  if (frmLogin.bLogin) or (frmSignup.bLogin) then // Check if Login
    bLoggedIn := True;

  if not(frmLogin.bIsUser) or not(frmSignup.bIsUser) then // Check account type
    bIsUser := False
  else if (frmLogin.bIsUser) and (frmSignup.bIsUser) then
    bIsUser := True;

  if (frmLogin.sUsername <> '') then
  begin
    sUsername := frmLogin.sUsername;
  end
  else if (frmSignup.sUsername <>) then
  begin
    sUsername := frmSignup.sUsername;
  end;

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
  else if (bLoggedIn) and not(bIsUser) then
  begin
    tsPriceEditor.TabVisible := True;
    tsTaskList.TabVisible := True;
    tsAccountH.TabVisible := True;

    pgcPages.TabIndex := pgcPages.TabIndex - 1;
    tsAccount.TabVisible := False;

    bmbSignOut.Enabled := True;
  end;
end;

procedure TfrmFreelanceApp.FormCreate(Sender: TObject);
begin
  iDefaultWidth := ClientWidth;
  iDefaultHeight := ClientHeight;

  bIsUser := False; // User Override (Temporary)
end;

procedure TfrmFreelanceApp.FormResize(Sender: TObject);
begin
  rWidthScale := (ClientWidth / iDefaultWidth);
  rHeightScale := (ClientHeight / iDefaultHeight);

  lblTitle.Font.Size := Trunc(rWidthScale * 25);

  // btnLogin.Margins.Left := Trunc(rWidthScale * 180);
  // btnLogin.Margins.Right := Trunc(rWidthScale * 180);
  //
  // btnSignUp.Margins.Left := Trunc(rWidthScale * 180);
  // btnSignUp.Margins.Right := Trunc(rWidthScale * 180);

end;

end.
