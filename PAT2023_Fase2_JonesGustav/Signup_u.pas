unit Signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Samples.Spin, FileIO_u, Parser_u;

type
  TfrmSignup = class(TForm)
    edtUsername: TEdit;
    pnlSignUp: TPanel;
    edtPassword: TEdit;
    lblCredentials: TLabel;
    edtConfirmPassword: TEdit;
    btnSignUp: TButton;
    pnlIcons: TPanel;
    edtName: TEdit;
    imgPF1: TImage;
    imgPF2: TImage;
    imgPF3: TImage;
    imgPF5: TImage;
    imgPF4: TImage;
    rgpUserType: TRadioGroup;
    gpbProfiles: TGroupBox;
    sedAge: TSpinEdit;
    lblAge: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure imgPF1Click(Sender: TObject);
    procedure imgPF2Click(Sender: TObject);
    procedure imgPF3Click(Sender: TObject);
    procedure imgPF4Click(Sender: TObject);
    procedure imgPF5Click(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  var
    bPFSelect: Boolean;
  public
  var
    bLogin: Boolean;
    sUsername: String;
    iProfilePicIndex: Integer;
    bIsUser: Boolean;
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

procedure TfrmSignup.btnSignUpClick(Sender: TObject);
var
  sName: String;
  sPassword: String;
  sPassword2: String;

  iAge: Integer;

  sEntry: String;
begin
  iAge := sedAge.Value;
  sName := edtName.Text;
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  sPassword2 := edtConfirmPassword.Text;

  // Validation
  if (rgpUserType.ItemIndex = 0) then
  begin
    bIsUser := True;
  end
  else if (rgpUserType.ItemIndex = 1) then
  begin
    bIsUser := False;
  end;

  if not(iAge in [18 .. 125]) then
  begin
    ShowMessage
      ('Error: User must be older than 18 and younger than 125 years old');
    exit;
  end;

  if (sName = '') then
  begin
    ShowMessage('Enter a valid Name');
    exit;
  end;

  if (sUsername = '') then
  begin
    ShowMessage('Enter a valid Username');
    exit;
  end;

  if (sPassword = '') then
  begin
    ShowMessage('Enter a valid Password');
    exit;
  end;

  if (sPassword2 = '') then
  begin
    ShowMessage('Please confirm Password');
    exit;
  end;

  if (rgpUserType.ItemIndex = -1) then
  begin
    ShowMessage('Select account type');
    exit;
  end;

  if not(bPFSelect) then
  begin
    ShowMessage('Select Profile Picture');
    exit;
  end;

  if not(sPassword = sPassword2) then
  begin
    ShowMessage('Re-enter password correctly');
    exit;
  end;

  if (FileIO_u.FileExists(sUsername + '.json')) then
  begin
    ShowMessage('Account Exists');
    exit;
  end
  else
  begin
    FileIO_u.CreateFile(sUsername + '.json');
  end;

  // Create user file text
  sEntry := Parser_u.CreateEntry('Name,Password,Age,UserType,ProfilePic,Tasks,PPL,ConsultFee,PriorityCost');

  sEntry := Parser_u.WriteEntryValue(sEntry, sName, 1);
  sEntry := Parser_u.WriteEntryValue(sEntry, sPassword, 2);
  sEntry := Parser_u.WriteEntryValue(sEntry, IntToStr(iAge), 3);

  if (bIsUser) then
  begin
    sEntry := Parser_u.WriteEntryValue(sEntry, '1', 4);
  end
  else
  begin
    sEntry := Parser_u.WriteEntryValue(sEntry, '2', 4);
  end;

  sEntry := Parser_u.WriteEntryValue(sEntry, IntToStr(iProfilePicIndex), 5);

  // Write user file
  FileIO_u.WriteFile(sUsername + '.json', sEntry);

  bLogin := True;
  Close;
  ShowMessage('Sign Up Complete!');
end;

procedure TfrmSignup.FormActivate(Sender: TObject);
begin
  // Set default values
  btnSignUp.SetFocus;
  bPFSelect := False;
  sUsername := '';
  iProfilePicIndex := -1;
  bLogin := False;
  bIsUser := True;

  edtUsername.Text := '';
  edtPassword.Text := '';
  edtConfirmPassword.Text := '';
  edtName.Text := '';
  rgpUserType.ItemIndex := -1;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.FormCreate(Sender: TObject);
begin
  iProfilePicIndex := -1;
  bPFSelect := False;
  bLogin := False;
  bIsUser := True;
end;

procedure TfrmSignup.imgPF1Click(Sender: TObject);
begin
  // Change selected profile pic
  imgPF1.Picture.LoadFromFile('images\profiles\pf1_Clicked.png');
  bPFSelect := True;
  iProfilePicIndex := 1;

  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF2Click(Sender: TObject);
begin
  // Change selected profile pic
  imgPF2.Picture.LoadFromFile('images\profiles\pf2_Clicked.png');
  bPFSelect := True;
  iProfilePicIndex := 2;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF3Click(Sender: TObject);
begin
  // Change selected profile pic
  imgPF3.Picture.LoadFromFile('images\profiles\pf3_Clicked.png');
  bPFSelect := True;
  iProfilePicIndex := 3;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF4Click(Sender: TObject);
begin
  // Change selected profile pic
  imgPF4.Picture.LoadFromFile('images\profiles\pf4_Clicked.png');
  bPFSelect := True;
  iProfilePicIndex := 4;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF5Click(Sender: TObject);
begin
  // Change selected profile pic
  imgPF5.Picture.LoadFromFile('images\profiles\pf5_Clicked.png');
  bPFSelect := True;
  iProfilePicIndex := 5;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
end;

end.
