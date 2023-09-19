unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Math,
  Login_u, Signup_u;

type
  TfrmFreelanceApp = class(TForm)
    pgcPages: TPageControl;
    lblTitle: TLabel;
    bmbClose: TBitBtn;
    pnlBottom: TPanel;
    tsApply: TTabSheet;
    bmbHelp: TBitBtn;
    tsCheckout: TTabSheet;
    bmbSignUp: TBitBtn;
    lblApplyTitle: TLabel;
    btnApplyNext: TButton;
    pnlApplyBottom: TPanel;
    edtTaskName: TEdit;
    edtDescription: TEdit;
    tsHome: TTabSheet;
    bmbLogin: TBitBtn;
    imgHomeImage: TImage;
    procedure bmbLoginClick(Sender: TObject);
    procedure bmbSignUpClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    var
      iDefaultWidth : Integer;
      iDefaultHeight : Integer;
      rWidthScale : Real;
      rHeightScale : Real;
  public
    { Public declarations }
  end;

var
  frmFreelanceApp: TfrmFreelanceApp;

implementation

{$R *.dfm}

procedure TfrmFreelanceApp.bmbLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmFreelanceApp.bmbSignUpClick(Sender: TObject);
begin
  frmSignup.Show;
end;

procedure TfrmFreelanceApp.FormActivate(Sender: TObject);
begin
  iDefaultWidth := ClientWidth;
  iDefaultHeight := ClientHeight;
end;

procedure TfrmFreelanceApp.FormResize(Sender: TObject);
begin
  rWidthScale := (ClientWidth / iDefaultWidth);
  rHeightScale := (ClientHeight / iDefaultHeight);

  lblTitle.Font.Size := Trunc(rWidthScale	* 25);

  bmbLogin.Margins.Left := Trunc(rWidthScale * 180);
  bmbLogin.Margins.Right := Trunc(rWidthScale * 180);

  bmbSignUp.Margins.Left := Trunc(rWidthScale * 180);
  bmbSignUp.Margins.Right := Trunc(rWidthScale * 180);

end;

end.
