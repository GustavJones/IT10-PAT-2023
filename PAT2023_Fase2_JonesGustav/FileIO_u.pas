unit FileIO_u;

interface

uses System.IOUtils;

function ReadFile(sFileName: string): string;
procedure WriteFile(sFileName: String; sText: String);
procedure ClearFile(sFileName: String);

implementation

function ReadFile(sFileName: string): string;
var
  FileToRead: TextFile;
  sOutput: string;
begin
  // sOutput := TFile.ReadAllText(sFileName); // Kort Pad
  AssignFile(FileToRead, sFileName);
  Reset(FileToRead);
  Read(FileToRead, sOutput);
  Close(FileToRead);

  Result := sOutput;
end;

procedure WriteFile(sFileName: String; sText: String);
var
  FileToWrite: TextFile;
begin
  // TFile.WriteAllText(sFileName, sText); // Kort Pad
  AssignFile(FileToWrite, sFileName);
  Rewrite(FileToWrite);
  Write(FileToWrite, sText);
  Close(FileToWrite);
end;

procedure ClearFile(sFileName: String);
var
  FileToClear: TextFile;
begin
  // TFile.WriteAllText(sFileName, ''); // Kort Pad
  AssignFile(FileToClear, sFileName);
  Rewrite(FileToClear);
  Write(FileToClear, '');
  Close(FileToClear);
end;

end.
