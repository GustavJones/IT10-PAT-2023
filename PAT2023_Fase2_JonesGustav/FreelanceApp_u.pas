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
