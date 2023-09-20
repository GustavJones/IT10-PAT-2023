unit Signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

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
    btnPickProfile: TButton;
    procedure FormActivate(Sender: TObject);
    procedure imgPF1Click(Sender: TObject);
    procedure imgPF2Click(Sender: TObject);
    procedure imgPF3Click(Sender: TObject);
    procedure imgPF4Click(Sender: TObject);
    procedure imgPF5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

procedure TfrmSignup.FormActivate(Sender: TObject);
begin
  btnSignUp.SetFocus;

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF1Click(Sender: TObject);
begin
  imgPF1.Picture.LoadFromFile('images\profiles\pf1_Clicked.png');

  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF2Click(Sender: TObject);
begin
  imgPF2.Picture.LoadFromFile('images\profiles\pf2_Clicked.png');

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF3Click(Sender: TObject);
begin
  imgPF3.Picture.LoadFromFile('images\profiles\pf3_Clicked.png');

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF4Click(Sender: TObject);
begin
  imgPF4.Picture.LoadFromFile('images\profiles\pf4_Clicked.png');

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF5.Picture.LoadFromFile('images\profiles\pf5.png');
end;

procedure TfrmSignup.imgPF5Click(Sender: TObject);
begin
  imgPF5.Picture.LoadFromFile('images\profiles\pf5_Clicked.png');

  imgPF1.Picture.LoadFromFile('images\profiles\pf1.png');
  imgPF2.Picture.LoadFromFile('images\profiles\pf2.png');
  imgPF3.Picture.LoadFromFile('images\profiles\pf3.png');
  imgPF4.Picture.LoadFromFile('images\profiles\pf4.png');
end;

end.
