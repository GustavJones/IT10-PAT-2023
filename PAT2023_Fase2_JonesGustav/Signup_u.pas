unit Signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Samples.Spin, FileIO_u;

type
  TfrmSignup = class(TForm)
    edtUsername: TEdit;
    pnlSignUp: TPanel;
    edtPassword: TEdit;
    lblCrededentials: TLabel;
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
    bIsUser: Boolean;
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

procedure TfrmSignup.btnSignUpClick(Sender: TObject);
var
  sName: String;
  sUsername: String;
  sPassword: String;
  sPassword2: String;
  sFileContent: String;

  iAge: Integer;

const
  FileNameStr = 'accounts.txt';
begin
  iAge := sedAge.Value;
  sName := edtName.Text;
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  sPassword2 := edtConfirmPassword.Text;

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

  if (sPassword = sPassword2) and (FileIO_u.FileExists(FileNameStr)) then
  begin
    sFileContent := FileIO_u.ReadFile(FileNameStr);
    FileIO_u.WriteFile(FileNameStr, sFileContent + sUsername + sPassword);
    bLogin := True;
    Close;
    ShowMessage('Sign Up Complete!');
  end
  else
  begin
    FileIO_u.CreateFile(FileNameStr);
    FileIO_u.WriteFile(FileNameStr, sUsername + sPassword);
    bLogin := True;
    Close;
    ShowMessage('Sign Up Complete!');
  end;
end;

procedure TfrmSignup.FormActivate(Sender: TObject);
begin
  btnSignUp.SetFocus;
  bPFSelect := False;
  bLogin := False;
  bIsUser := True;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.FormCreate(Sender: TObject);
begin
  bPFSelect := False;
  bLogin := False;
  bIsUser := True;
end;

procedure TfrmSignup.imgPF1Click(Sender: TObject);
begin
  imgPF1.Picture.LoadFromFile('images\profiles\pf1_Clicked.png');
  bPFSelect := True;

  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF2Click(Sender: TObject);
begin
  imgPF2.Picture.LoadFromFile('images\profiles\pf2_Clicked.png');
  bPFSelect := True;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF3Click(Sender: TObject);
begin
  imgPF3.Picture.LoadFromFile('images\profiles\pf3_Clicked.png');
  bPFSelect := True;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF4Click(Sender: TObject);
begin
  imgPF4.Picture.LoadFromFile('images\profiles\pf4_Clicked.png');
  bPFSelect := True;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF5Click(Sender: TObject);
begin
  imgPF5.Picture.LoadFromFile('images\profiles\pf5_Clicked.png');
  bPFSelect := True;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
end;

end.
