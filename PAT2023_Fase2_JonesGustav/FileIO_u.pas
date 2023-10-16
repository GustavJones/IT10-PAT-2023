unit FileIO_u;

interface

uses System.SysUtils;

function FileExists(sFileName : String) : Boolean;
function ReadFile(sFileName: string): string;
procedure WriteFile(sFileName: String; sText: String);
procedure ClearFile(sFileName: String);
procedure CreateFile(sFileName : String);

implementation

function ReadFile(sFileName: string): string;
var
  FileToRead: TextFile;
  sOutput, sTemp: string;
begin
  AssignFile(FileToRead, sFileName);
  Reset(FileToRead);
  while not (Eof(FileToRead)) do
  begin
    ReadLn(FileToRead, sTemp);
    sOutput := sOutput + sTemp;
  end;
  Close(FileToRead);

  Result := sOutput;
end;

procedure WriteFile(sFileName: String; sText: String);
var
  FileToWrite: TextFile;
begin
  AssignFile(FileToWrite, sFileName);
  Rewrite(FileToWrite);
  Write(FileToWrite, sText);
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

function FileExists(sFileName : String) : Boolean;
var
  FileToCheck : TextFile;
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

procedure CreateFile(sFileName : String);
var
  FileToCreate: TextFile;
begin
  System.SysUtils.FileCreate(sFileName);
end;

end.
