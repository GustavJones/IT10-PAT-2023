unit ApplicationInformation_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmApplicationInformation = class(TForm)
    lblStatusHeading: TLabel;
    lblLinesOfCode: TLabel;
    lblComments: TLabel;
    redComments: TRichEdit;
    lblStatus: TLabel;
    bmbClose: TBitBtn;
    lblTotalCost: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApplicationInformation: TfrmApplicationInformation;

implementation

{$R *.dfm}

end.
