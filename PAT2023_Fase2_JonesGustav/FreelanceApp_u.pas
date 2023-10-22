unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Math, UITypes, Vcl.Samples.Spin,
  Login_u, Signup_u, TaskEditor_u, ApplicationInformation_u, Parser_u,
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
    bmbSignOut: TBitBtn;
    dtpApplyDueDate: TDateTimePicker;
    lblApplyDueDate: TLabel;
    btnApply: TButton;
    bmbApplyReset: TBitBtn;
    imgAccountAccount: TImage;
    btnAccountLogin: TButton;
    btnAccountSignUp: TButton;
    lblCheckoutInformation: TLabel;
    lstCheckoutItems: TListBox;
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
    btnCheckoutHome: TButton;
    btnApplyBack: TButton;
    btnCheckoutBack: TButton;
    tsTaskList: TTabSheet;
    lstTaskListItems: TListBox;
    pnlTaskListBottom: TPanel;
    btnTaskListNext: TButton;
    btnTaskListHome: TButton;
    btnTaskListBack: TButton;
    btnTaskListEdit: TButton;
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
    procedure btnNextClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure bmbResetClick(Sender: TObject);
    procedure btnTaskListEditClick(Sender: TObject);
    procedure btnCheckoutApplicationInformationClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnAccountHChangePasswordClick(Sender: TObject);
    procedure btnPriceEditorSaveClick(Sender: TObject);
  private
  var
    sUsername: String;
    bIsUser: Boolean;
    iProfilePicIndex: Integer;

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
  iExit := MessageDlg('Are you sure you want to exit?', mtInformation, mbYesNo, 0); // Exit dialog

  if iExit = idYes then
  begin
    frmFreelanceApp.Close;
  end;
end;

procedure TfrmFreelanceApp.bmbHelpClick(Sender: TObject);
begin
  // Shows help on all pages

  if (pgcPages.ActivePage = tsAccount) then
  begin
    ShowMessage('Press Sign up to create an account or log in');
  end
  else if (pgcPages.ActivePage = tsAccountH) then
  begin
    ShowMessage('Press Change Password to change your account password');
  end
  else if (pgcPages.ActivePage = tsApply) then
  begin
    ShowMessage('Enter task details and press apply to create a task for a developer');
  end
  else if (pgcPages.ActivePage = tsCheckout) then
  begin
    ShowMessage('Select a task and press Display Application Information to monitor task info');
  end
  else if (pgcPages.ActivePage = tsTaskList) then
  begin
    ShowMessage('Select a task and press Edit Task to edit task info');
  end
  else if (pgcPages.ActivePage = tsPriceEditor) then
  begin
    ShowMessage('Enter desired prices for your service and save to user account');
  end;
end;

procedure TfrmFreelanceApp.bmbResetClick(Sender: TObject);
begin
  // Resets All input fields
  edtApplyTaskName.Text := '';
  redApplyDescription.Lines.Clear;
  chkApplyPriority.Checked := False;

  edtPriceEditorPricePerLine.Text	:= '';
  edtPriceEditorConsultFee.Text := '';
  edtPriceEditorPriorityCost.Text	 := '';
end;

procedure TfrmFreelanceApp.bmbSignOutClick(Sender: TObject);
var
  iSignOut: Integer;
begin
  // Disable tabsheets and return to home page

  iSignOut := MessageDlg('Are you sure you want to sign out?', mtInformation,
    mbYesNo, 0);

  if iSignOut = idYes then
  begin
    bLoggedIn := False;
    frmLogin.bLogin := False;
    frmSignup.bLogin := False;

    tsApply.TabVisible := False;
    tsCheckout.TabVisible := False;

    tsCheckout.TabVisible := False;
    tsTaskList.TabVisible := False;
    tsPriceEditor.TabVisible := False;
    tsAccount.TabVisible := True;

    pgcPages.TabIndex := 1;

    tsAccountH.TabVisible := False;

    bmbSignOut.Enabled := False;
  end;

end;

procedure TfrmFreelanceApp.btnNextClick(Sender: TObject);
begin
  // Moves tabsheet index up 1
  pgcPages.TabIndex := pgcPages.TabIndex + 1;
end;

procedure TfrmFreelanceApp.btnPriceEditorSaveClick(Sender: TObject);
var
  sFileInput : String;
  dTemp : Double;
begin
  sFileInput := FileIO_u.ReadFile(sUsername + '.json'); // Read User file

  // Check if data is type double (AKA real)
  if not (TryStrToFloat(edtPriceEditorPricePerLine.Text, dTemp)) then
  begin
    ShowMessage('Enter Correct Desimal value at Price Per Line');
    exit;
  end;

  if not (TryStrToFloat(edtPriceEditorConsultFee.Text, dTemp)) then
  begin
    ShowMessage('Enter Correct Desimal value at Consult Fee');
    exit;
  end;

  if not (TryStrToFloat(edtPriceEditorPriorityCost.Text, dTemp)) then
  begin
    ShowMessage('Enter Correct Desimal value at Priority Cost');
    exit;
  end;

  sFileInput := Parser_u.WriteEntryValue(sFileInput, edtPriceEditorPricePerLine.Text, 7);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, edtPriceEditorConsultFee.Text, 8);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, edtPriceEditorPriorityCost.Text, 9);

  // Write Prices to user file
  FileIO_u.WriteFile(sUsername + '.json', sFileInput);

  ShowMessage('Success!');
end;

procedure TfrmFreelanceApp.btnCheckoutApplicationInformationClick
  (Sender: TObject);
var
  sFileInput: String;
  sComments: String;
  i, iPrevNewlinePos: Integer;

  rCost: Real;

begin
  iPrevNewlinePos := 1;

  if (lstCheckoutItems.ItemIndex = -1) then // Checks if task is selected
  begin
    ShowMessage('Please select a task');
    exit;
  end;

  sFileInput := FileIO_u.ReadFile(lstCheckoutItems.Items[lstCheckoutItems.ItemIndex] + '.json'); // Read Task File

  // Update Output components
  if (Parser_u.ReadEntryValue(sFileInput, 4) = '0') then
  begin
    frmApplicationInformation.lblStatus.Caption := 'In Progress';
  end
  else
  begin
    frmApplicationInformation.lblStatus.Caption := 'Completed';
  end;

  frmApplicationInformation.lblLinesOfCode.Caption := 'Lines Of Code: ' +
    Parser_u.ReadEntryValue(sFileInput, 5);

  sComments := Parser_u.ReadEntryValue(sFileInput, 6);

  frmApplicationInformation.redComments.Clear;

  for i := 1 to Length(sComments) do // Output Comments from file to redComments
  begin
    if (sComments[i] = '\') then
    begin
      if (i <> Length(sComments)) and (sComments[i + 1] = 'n') then

        frmApplicationInformation.redComments.Lines.Add(Copy(sComments, iPrevNewlinePos, i - iPrevNewlinePos));
      iPrevNewlinePos := i + 2;
    end;
  end;

  rCost := StrToFloat(Parser_u.ReadEntryValue(sFileInput, 7));

  frmApplicationInformation.lblTotalCost.Caption := 'Total Cost: ' + FloatToStrF(rCost, ffCurrency, 10, 2); // Output Cost

  frmApplicationInformation.Show;
end;

procedure TfrmFreelanceApp.btnBackClick(Sender: TObject);
begin
  // Moves tabsheets down 1
  pgcPages.TabIndex := pgcPages.TabIndex - 1;
end;

procedure TfrmFreelanceApp.btnHomeClick(Sender: TObject);
begin
  // Goes to home page
  pgcPages.TabIndex := 0;
end;

procedure TfrmFreelanceApp.btnAccountHChangePasswordClick(Sender: TObject);
var
  sFileContent: String;
  sPassword: String;
  sOutput: String;
begin
  // Get User File and input
  sFileContent := FileIO_u.ReadFile(sUsername + '.json');
  sPassword := InputBox('Change Password', 'Enter a new Password: ', 'Password');

  // Data Validation
  if (sPassword = '') then
  begin
    ShowMessage('No Password entered. Aborting');
    exit;
  end;

  // Write password to user file
  sOutput := Parser_u.WriteEntryValue(sFileContent, sPassword, 2);
  FileIO_u.WriteFile(sUsername + '.json', sOutput);
end;

procedure TfrmFreelanceApp.btnAccountLoginClick(Sender: TObject);
begin
  // Show log in dialog
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.btnAccountSignUpClick(Sender: TObject);
begin
  // Show Sign up dialog
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.btnApplyClick(Sender: TObject);
var
  sTaskName: String;
  sDescription: String;
  dDueDate: TDate;
  bPriority: Boolean;
  i: Integer;
  sOutput: String;
  sUserOutput: String;
  sTaskList: String;
begin
  sTaskName := edtApplyTaskName.Text;

  // Length Check
  if (Length(sTaskName) < 1) or (Length(sTaskName) > 50) then
  begin
    ShowMessage('Incorrect Task Name Length. Must be between 1 and 50 words');
    exit;
  end;

  // Check for special characters
  for i := 1 to Length(sTaskName) do
  begin
    if (sTaskName[i] in ['@', '#', '$', '%', '^', '*', '(', ')']) then
    begin
      ShowMessage('Please remove special character from task name');
      exit;
    end;
  end;

  for i := 1 to redApplyDescription.Lines.Count do
  begin
    sDescription := sDescription + redApplyDescription.Lines[i - 1] + '\n';
  end;

  dDueDate := dtpApplyDueDate.Date;
  bPriority := chkApplyPriority.Checked;

  // Input validation
  if (sTaskName = '') then
  begin
    ShowMessage('Please enter a name');
    exit;
  end;

  if (sDescription = '') then
  begin
    ShowMessage('Please enter a description');
    exit;
  end;

  if (dDueDate <= Date()) then
  begin
    ShowMessage('Please request date in the future');
    exit;
  end;

  // Create File text for task
  sOutput := Parser_u.CreateEntry('Description,Date,Priority,Status,LinesOfCode,Comments,TotalCost');
  sOutput := Parser_u.WriteEntryValue(sOutput, sDescription, 1);
  sOutput := Parser_u.WriteEntryValue(sOutput, DateToStr(dDueDate), 2);

  if (bPriority) then
  begin
    sOutput := Parser_u.WriteEntryValue(sOutput, 'True', 3);
  end
  else
  begin
    sOutput := Parser_u.WriteEntryValue(sOutput, 'False', 3);
  end;

  sOutput := Parser_u.WriteEntryValue(sOutput, '0', 4);
  sOutput := Parser_u.WriteEntryValue(sOutput, '0', 5);
  sOutput := Parser_u.WriteEntryValue(sOutput, '0', 7);

  // Create file and write created text to it
  FileIO_u.CreateFile(sTaskName + '.json');
  FileIO_u.WriteFile(sTaskName + '.json', sOutput);

  ShowMessage('Application Requested! Thanks For using Code Hub Marketplace');
  lstCheckoutItems.Items.Add(sTaskName);
  sUserOutput := FileIO_u.ReadFile(sUsername + '.json'); // Get User File

  sTaskList := Parser_u.ReadEntryValue(sUserOutput, 6);

  // Add task to user file
  if (sTaskList = '') then
  begin
    sUserOutput := Parser_u.WriteEntryValue(sUserOutput, sTaskName, 6);
  end
  else
  begin
    sUserOutput := Parser_u.WriteEntryValue(sUserOutput,
      sTaskList + ',' + sTaskName, 6);
  end;

  FileIO_u.WriteFile(sUsername + '.json', sUserOutput);

  // Add file to global tasks.txt
  FileIO_u.WriteFile('tasks.txt', FileIO_u.ReadFile('tasks.txt') +
    sTaskName + #10);
end;

procedure TfrmFreelanceApp.btnTaskListEditClick(Sender: TObject);
var
  sFileInput : String;
  sTaskName : String;
  sDescription : String;
  sDescriptionLine : String;
  sComments : String;
  sCommentsLine : String;
  bPriority : Boolean;

  iLinesOfCode : Integer;
  rPricePerLine : Real;
  rConsultFee : Real;
  rPriorityFee : Real;
  rCost : Real;
  rTotalCost : Real;

  i, iPrevNewlinePos : Integer;
begin
  // Edit Requested tasks
  iPrevNewlinePos := 1;
  frmTaskEditor.lblProjectName.Caption := 'Project Name: ';
  frmTaskEditor.redDescription.Lines.Clear;
  frmTaskEditor.redComments.Lines.Clear;
  frmTaskEditor.chkPriority.Checked := False;
  frmTaskEditor.sedLinesOfCode.Value := 0;

  if (lstTaskListItems.ItemIndex = -1) then // Check if task is selected
  begin
    ShowMessage('Please Select a task');
    exit;
  end;

  sTaskName := lstTaskListItems.Items[lstTaskListItems.ItemIndex]; // Get Taskname

  frmTaskEditor.lblProjectName.Caption := 'Project Name: ' + sTaskName;

  sFileInput := FileIO_u.ReadFile(sTaskName + '.json'); // Read Task File
  sDescription := Parser_u.ReadEntryValue(sFileInput, 1);

  for i := 1 to Length(sDescription) do // Output Description from file to redDescription
  begin
    if (i < Length(sDescription)) and (sDescription[i] = '\') and (sDescription[i + 1] = 'n') then
    begin
      sDescriptionLine := Copy(sDescription, iPrevNewlinePos, i - iPrevNewlinePos);
      if (sDescriptionLine = '') then
      begin
        frmTaskEditor.redDescription.Lines.Add('');
      end
      else
        frmTaskEditor.redDescription.Lines.Add(sDescriptionLine);
      iPrevNewlinePos := i + 2;
    end;
  end;

  sComments := Parser_u.ReadEntryValue(sFileInput, 6);
  iPrevNewlinePos := 1;

  for i := 1 to Length(sComments) do // Output Comments from file to redComments
  begin
    if (i < Length(sComments)) and (sComments[i] = '\') and (sComments[i + 1] = 'n') then
    begin
      sCommentsLine := Copy(sComments, iPrevNewlinePos, i - iPrevNewlinePos);
      if (sCommentsLine = '') then
      begin
        frmTaskEditor.redComments.Lines.Add('');
      end
      else
        frmTaskEditor.redComments.Lines.Add(sCommentsLine);
      iPrevNewlinePos := i + 2;
    end;
  end;

  if (Parser_u.ReadEntryValue(sFileInput, 3) = 'True') then // Get Priority status
  begin
    bPriority := True;
  end
  else
  begin
    bPriority := False;
  end;

  iLinesOfCode := StrToInt(Parser_u.ReadEntryValue(sFileInput, 5));

  frmTaskEditor.bPriority := bPriority;
  frmTaskEditor.chkPriority.Checked := bPriority;
  frmTaskEditor.sedLinesOfCode.Value := iLinesOfCode;
  if (Parser_u.ReadEntryValue(sFileInput, 4) = '0') then
  begin
    frmTaskEditor.chkCompleted.Checked := False;
  end
  else
  begin
    frmTaskEditor.chkCompleted.Checked := True;
  end;

  rPricePerLine := 0; // Initialize Cost calc variables
  rConsultFee := 0;
  rPriorityFee := 0;

  rCost := 0;
  rTotalCost := 0;

  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 7) = '') then // Reads Prices from file
    rPricePerLine := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 7));
  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 8) = '') then
    rConsultFee := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 8));
  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 9) = '') then
    rPriorityFee := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 9));

  rCost := iLinesOfCode * rPricePerLine; // Calculate costs
  rTotalCost := rCost + rConsultFee;

  if (bPriority) then
  begin
    rTotalCost := rTotalCost + rPriorityFee;
  end;

  if (iLinesOfCode < 100) then
  begin
    rTotalCost := 0;
  end;

  sFileInput := Parser_u.WriteEntryValue(sFileInput, FloatToStr(rTotalCost), 7);
  FileIO_u.WriteFile(sTaskName + '.json', sFileInput);

  frmTaskEditor.lblTotalCost.Caption := 'Total Cost: ' + FloatToStrF(rTotalCost, ffCurrency, 10, 2); // Output Cost
  frmTaskEditor.sUsername := sUsername;

  frmTaskEditor.Show;
end;

procedure TfrmFreelanceApp.FormActivate(Sender: TObject);
var
  sName: String;
  sTasks: String;
  i, iPrevNewlinePos: Integer;
begin
  // Updates all forms when switching between eachother

  iPrevNewlinePos := 1;

  if not(FileIO_u.FileExists('tasks.txt')) then // Check if tasks.txt exists
  begin
    FileIO_u.CreateFile('tasks.txt');
  end;

  if (frmLogin.bLogin) or (frmSignup.bLogin) then // Check if Login
    bLoggedIn := True
  else
    bLoggedIn := False;

  if not(frmLogin.bIsUser) or not(frmSignup.bIsUser) then // Get Login status
    // Check account type
    bIsUser := False
  else if (frmLogin.bIsUser) and (frmSignup.bIsUser) then
    bIsUser := True;

  if (frmLogin.sUsername <> '') then // Get Username
  begin
    sUsername := frmLogin.sUsername;
  end
  else if (frmSignup.sUsername <> '') then
  begin
    sUsername := frmSignup.sUsername;
  end;

  if (frmLogin.iProfilePicIndex <> -1) then // Get PF index
  begin
    iProfilePicIndex := frmLogin.iProfilePicIndex;
  end
  else if (frmSignup.iProfilePicIndex <> -1) then
  begin
    iProfilePicIndex := frmSignup.iProfilePicIndex;
  end;

  if (bLoggedIn) and (bIsUser) then // Activate tabsheets
  begin
    tsApply.TabVisible := True;
    tsCheckout.TabVisible := True;
    tsAccountH.TabVisible := True;

    tsPriceEditor.TabVisible := False;
    tsTaskList.TabVisible := False;

    lstCheckoutItems.Items.Clear;
    sTasks := Parser_u.ReadEntryValue
      (FileIO_u.ReadFile(sUsername + '.json'), 6);

    for i := 1 to Length(sTasks) do // Update Task List
    begin
      if (sTasks[i] = ',') then
      begin
        lstCheckoutItems.Items.Add(Copy(sTasks, iPrevNewlinePos,
          i - iPrevNewlinePos));
        iPrevNewlinePos := i + 1;
      end
      else if (i = Length(sTasks)) then
      begin
        lstCheckoutItems.Items.Add(Copy(sTasks, iPrevNewlinePos,
          i - iPrevNewlinePos + 1));
      end;
    end;

    sName := Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 1);

    lblAccountHWelcome.Caption := 'Welcome ' + sName;

    case iProfilePicIndex of // Sets profile pic
      1:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf1.png');
      2:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf2.png');
      3:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf3.png');
      4:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf4.png');
      5:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf5.png');
    end;

    pgcPages.TabIndex := pgcPages.TabIndex - 1;
    tsAccount.TabVisible := False;

    bmbSignOut.Enabled := True;
  end
  else if (bLoggedIn) and not(bIsUser) then
  begin
    tsPriceEditor.TabVisible := True;
    tsTaskList.TabVisible := True;
    tsAccountH.TabVisible := True;

    tsApply.TabVisible := False;
    tsCheckout.TabVisible := False;
    tsAccount.TabVisible := False;

    lstTaskListItems.Items.Clear;
    sTasks := FileIO_u.ReadFile('tasks.txt');

    for i := 1 to Length(sTasks) do // Update Task List
    begin
      if (sTasks[i] = #10) then
      begin
        lstTaskListItems.Items.Add(Copy(sTasks, iPrevNewlinePos,
          i - iPrevNewlinePos));
        iPrevNewlinePos := i + 1;
      end
      else if (i = Length(sTasks)) then
      begin
        lstTaskListItems.Items.Add(Copy(sTasks, iPrevNewlinePos,
          i - iPrevNewlinePos + 1));
      end;
    end;

    // Updates Prices from file
    edtPriceEditorPricePerLine.Text := Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 7);
    edtPriceEditorConsultFee.Text := Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 8);
    edtPriceEditorPriorityCost.Text := Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 9);

    sName := Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUsername + '.json'), 1);
    lblAccountHWelcome.Caption := 'Welcome ' + sName;

    case iProfilePicIndex of // Sets profile pic
      1:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf1.png');
      2:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf2.png');
      3:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf3.png');
      4:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf4.png');
      5:
        imgAccountHProfile.Picture.LoadFromFile('images\profiles\pf5.png');
    end;

    pgcPages.TabIndex := pgcPages.TabIndex - 1;

    bmbSignOut.Enabled := True;
  end;

end;

procedure TfrmFreelanceApp.FormCreate(Sender: TObject);
begin
  // Get Original size on startup
  iDefaultWidth := ClientWidth;
  iDefaultHeight := ClientHeight;
end;

procedure TfrmFreelanceApp.FormResize(Sender: TObject);
begin
  // Resizes the application font when window resizes

  rWidthScale := (ClientWidth / iDefaultWidth);
  rHeightScale := (ClientHeight / iDefaultHeight);

  lblTitle.Font.Size := Trunc(rWidthScale * 25);
end;

end.
