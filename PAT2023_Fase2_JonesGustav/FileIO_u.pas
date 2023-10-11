unit FileIO_u;

interface

function ReadFile(sFileName : string): string;

implementation

function ReadFile(sFileName : string): string;
var
  FileToRead : TextFILE;
  sOutput : string;
begin
  AssignFile(FileToRead, sFileName);
  Reset(FileToRead);	

  Readln(FileToRead, sOutput);
  Result := sOutput;
end;

end.
