unit FreelanceApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFreelanceApp: TfrmFreelanceApp;

implementation

{$R *.dfm}

end.
