unit TaskEditor_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls;

type
  TfrmTaskEditor = class(TForm)
    sedLinesOfCode: TSpinEdit;
    lblProjectName: TLabel;
    redDescription: TRichEdit;
    lblDescription: TLabel;
    lblLinesOfCode: TLabel;
    chkCompleted: TCheckBox;
    btnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTaskEditor: TfrmTaskEditor;

implementation

{$R *.dfm}

end.
