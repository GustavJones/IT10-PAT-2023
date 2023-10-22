unit TaskEditor_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, Vcl.Buttons, Parser_u, FileIO_u;

type
  TfrmTaskEditor = class(TForm)
    sedLinesOfCode: TSpinEdit;
    lblProjectName: TLabel;
    redDescription: TRichEdit;
    lblDescription: TLabel;
    lblLinesOfCode: TLabel;
    chkCompleted: TCheckBox;
    btnSave: TButton;
    lblComments: TLabel;
    redComments: TRichEdit;
    bmbReset: TBitBtn;
    lblTotalCost: TLabel;
    chkPriority: TCheckBox;
    procedure chkPriorityMouseLeave(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bmbResetClick(Sender: TObject);
  private

  public
    bPriority : Boolean;
    sUsername : String;
  end;

var
  frmTaskEditor: TfrmTaskEditor;

implementation

{$R *.dfm}

procedure TfrmTaskEditor.bmbResetClick(Sender: TObject);
var
  sFileInput : String;
  sTaskName : String;
  sComments : String;
  sCommentsLine : String;
  iPrevNewlinePos : Integer;
  i : Integer;
begin
  // Clears comments and get taskname
  redComments.Lines.Clear;
  sTaskName := Copy(lblProjectName.Caption, Length('Project Name: ') + 1, Length(lblProjectName.Caption) - Length('Project Name: '));

  // Read task file
  sFileInput := FileIO_u.ReadFile(sTaskName + '.json');

  sComments := Parser_u.ReadEntryValue(sFileInput, 6);
  iPrevNewlinePos := 1;

  // Output comments from file to redComments
  for i := 1 to Length(sComments) do
  begin
    if (i < Length(sComments)) and (sComments[i] = '\') and (sComments[i + 1] = 'n') then
    begin
      sCommentsLine := Copy(sComments, iPrevNewlinePos, i - iPrevNewlinePos);
      if (sCommentsLine = '') then
      begin
        redComments.Lines.Add('');
      end
      else
        redComments.Lines.Add(sCommentsLine);
      iPrevNewlinePos := i + 2;
    end;
  end;

  // Get Priority status
  if (Parser_u.ReadEntryValue(sFileInput, 3) = 'True') then
  begin
    bPriority := True;
  end
  else
  begin
    bPriority := False;
  end;

  chkPriority.Checked := bPriority;
  sedLinesOfCode.Value := StrToInt(Parser_u.ReadEntryValue(sFileInput, 5));
  if (Parser_u.ReadEntryValue(sFileInput, 4) = '0') then
  begin
    chkCompleted.Checked := False;
  end
  else
  begin
    chkCompleted.Checked := True;
  end;
end;

procedure TfrmTaskEditor.btnSaveClick(Sender: TObject);
var
  sTaskName : String;
  sComments : String;
  iLinesOfCode : Integer;
  rPricePerLine, rConsultFee, rPriorityFee : Real;
  rCost, rTotalCost : Real;
  bCompleted : Boolean;

  sFileInput : String;
  i : Integer;
begin
  // Get Taskname
  sTaskName := Copy(lblProjectName.Caption, Length('Project Name: ') + 1, Length(lblProjectName.Caption) - Length('Project Name: '));

  // Read comments from redComments
  for i := 1 to redComments.Lines.Count do
  begin
    if not (redComments.Lines[i - 1] = '') then
    begin
      sComments := sComments + redComments.Lines[i - 1] + '\n';
    end;
  end;

  iLinesOfCode := sedLinesOfCode.Value;
  bCompleted := chkCompleted.Checked;

  // Read Task file
  sFileInput := FileIO_u.ReadFile(sTaskName + '.json');
  sFileInput := Parser_u.WriteEntryValue(sFileInput, sComments, 6);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, IntToStr(iLinesOfCode), 5);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, IntToStr(iLinesOfCode), 5);

  if (bCompleted) then
  begin
    sFileInput := Parser_u.WriteEntryValue(sFileInput, '1', 4);
  end
  else
  begin
    sFileInput := Parser_u.WriteEntryValue(sFileInput, '0', 4);
  end;

  // Intitialize price variables
  rPricePerLine := 0;
  rConsultFee := 0;
  rPriorityFee := 0;

  rCost := 0;
  rTotalCost := 0;

  // Read prices from file
  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 7) = '') then
    rPricePerLine := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 7));
  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 8) = '') then
    rConsultFee := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 8));
  if not (Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 9) = '') then
    rPriorityFee := StrToFloat(Parser_u.ReadEntryValue(FileIO_u.ReadFile(sUserName + '.json'), 9));

  // Calculate cost
  rCost := iLinesOfCode * rPricePerLine;
  rTotalCost := rCost + rConsultFee;

  if (StrToBool(Parser_u.ReadEntryValue(sFileInput, 3))) then
  begin
    rTotalCost := rTotalCost + rPriorityFee;
  end;

  sFileInput := Parser_u.WriteEntryValue(sFileInput, FloatToStr(rTotalCost), 7);

  // Output cost
  lblTotalCost.Caption := 'Total Cost: ' + FloatToStrF(rTotalCost, ffCurrency, 10, 2);

  // Update cost in file
  FileIO_u.WriteFile(sTaskName + '.json', sFileInput);
end;

procedure TfrmTaskEditor.chkPriorityMouseLeave(Sender: TObject);
begin
  // Change priority to default set value if changed
  chkPriority.Checked := bPriority;
end;

end.
