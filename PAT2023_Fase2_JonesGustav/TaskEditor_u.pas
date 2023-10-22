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
  redComments.Lines.Clear;
  sTaskName := Copy(lblProjectName.Caption, Length('Project Name: ') + 1, Length(lblProjectName.Caption) - Length('Project Name: '));

  sFileInput := FileIO_u.ReadFile(sTaskName + '.json');

  sComments := Parser_u.ReadEntryValue(sFileInput, 6);
  iPrevNewlinePos := 1;

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
  iLinesNum : Integer;
  bCompleted : Boolean;

  sFileInput : String;
  i : Integer;
begin
  sTaskName := Copy(lblProjectName.Caption, Length('Project Name: ') + 1, Length(lblProjectName.Caption) - Length('Project Name: '));

  for i := 1 to redComments.Lines.Count do
  begin
    sComments := sComments + redComments.Lines[i] + '\n';
  end;

  iLinesNum := sedLinesOfCode.Value;
  bCompleted := chkCompleted.Checked;

  sFileInput := FileIO_u.ReadFile(sTaskName + '.json');
  sFileInput := Parser_u.WriteEntryValue(sFileInput, sComments, 6);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, IntToStr(iLinesNum), 5);
  sFileInput := Parser_u.WriteEntryValue(sFileInput, IntToStr(iLinesNum), 5);

  if (bCompleted) then
  begin
    sFileInput := Parser_u.WriteEntryValue(sFileInput, '1', 4);
  end
  else
  begin
    sFileInput := Parser_u.WriteEntryValue(sFileInput, '0', 4);
  end;

  FileIO_u.WriteFile(sTaskName + '.json', sFileInput);
end;

procedure TfrmTaskEditor.chkPriorityMouseLeave(Sender: TObject);
begin
  chkPriority.Checked := bPriority;
end;

end.
