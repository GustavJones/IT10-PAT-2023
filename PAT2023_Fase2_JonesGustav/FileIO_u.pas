unit FileIO_u;

interface

uses System.SysUtils;

function FileExists(sFileName: String): Boolean;
function ReadFile(sFileName: string): string;
procedure WriteFile(sFileName: String; sText: String);
procedure ClearFile(sFileName: String);
procedure CreateFile(sFileName: String);

implementation

function ReadFile(sFileName: string): string;
var
  FileToRead: TextFile;
  sOutput, sTemp: string;
begin
  AssignFile(FileToRead, sFileName);
  Reset(FileToRead);
  while not(Eof(FileToRead)) do
  begin
    ReadLn(FileToRead, sTemp);
    sOutput := sOutput + sTemp + #10;
  end;
  Close(FileToRead);

  Result := sOutput;
end;

procedure WriteFile(sFileName: String; sText: String);
var
  i, iPrevNewlinePos: Integer;
  sOutput: String;
  FileToWrite: TextFile;
begin
  iPrevNewlinePos := 0;

  AssignFile(FileToWrite, sFileName);
  Rewrite(FileToWrite);

  for i := 1 to Length(sText) do
  begin
    if (sText[i] = #10) then
    begin
      Inc(iPrevNewlinePos);
      sOutput := Copy(sText, iPrevNewlinePos, i - iPrevNewlinePos);
      WriteLn(FileToWrite, sOutput);
      iPrevNewlinePos := i;
    end
    else if (i = Length(sText)) then
    begin
      sOutput := Copy(sText, iPrevNewlinePos + 1, i - iPrevNewlinePos + 1);
      Write(FileToWrite, sOutput);
      iPrevNewlinePos := i;
    end;
  end;

  // Write(FileToWrite, sText);
  Close(FileToWrite);
end;

procedure ClearFile(sFileName: String);
var
  FileToClear: TextFile;
begin
  AssignFile(FileToClear, sFileName);
  Rewrite(FileToClear);
  Write(FileToClear, '');
  Close(FileToClear);
end;

function FileExists(sFileName: String): Boolean;
begin
  if (System.SysUtils.FileExists(sFileName)) then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure CreateFile(sFileName: String);
var
  FileToCreate: File;
begin
  System.SysUtils.FileClose(System.SysUtils.FileCreate(sFileName));
end;

end.
