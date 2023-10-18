unit Parser_u;

interface

function ReadEntry(sEntry: String; iPropertyIndex: Integer): String;
function GetEntryCount(sEntry : String) : Integer;
function WriteEntry(sEntry : String; sValue: String; iPropertyIndex: Integer): String;

implementation

function ReadEntry(sEntry: String; iPropertyIndex: Integer): String;
var
  i, j, k, l : Integer;
  iPropertyCount : Integer;
  iPropertyPos : Integer;
  iKeyQuoteCount, iValueQuoteCount : Integer;
  iKeyStartPos: Integer;
  iValueEndPos : Integer;
  bHasKey, bHasValue : Boolean;
  sOutput: String;
begin
  if (iPropertyIndex > GetEntryCount(sEntry)) then // Check if entry index is less than entry count
  begin
    exit;
  end;

  iPropertyCount := 0;
  iPropertyPos := 0;
  iKeyQuoteCount := 0;
  iValueQuoteCount := 0;
  iKeyStartPos := 0;
  iValueEndPos := 0;
  bHasKey := False;
  bHasValue := False;

  sOutput := '';

  for i := 1 to Length(sEntry) do // Loop through text
  begin
    if (iPropertyCount = iPropertyIndex) and (sEntry[i - 1] = ':') then
    begin
      iPropertyPos := i - 1; // Get Selected KeyValue pair position
    end;

    if (sEntry[i] = ':') then // Check for key value pairs
    begin
      Inc(iPropertyCount);
    end;
  end;

  j := iPropertyPos;
  while not (bHasKey) do // Loop through text
  begin
    if (sEntry[j] = '"') then
    begin
      Inc(iKeyQuoteCount);
      if (iKeyQuoteCount = 2) then
      begin
        iKeyStartPos := j;
        bHasKey := True;
      end;
    end;

    Dec(j);
  end;

  k := iPropertyPos;
  while not (bHasValue) do
  begin
    if (sEntry[k] = '"') then
    begin
      Inc(iValueQuoteCount);
      if (iValueQuoteCount = 2) then
      begin
        iValueEndPos := k;
        bHasValue := True;
      end;
    end;

    for l := iKeyStartPos to iValueEndPos do
    begin
      sOutput := sOutput + sEntry[l];
    end;

    Inc(k);
  end;

  Result := sOutput;

end;

function GetEntryCount(sEntry : String) : Integer;
var
  i, iEntryCount : Integer;
begin
  iEntryCount := 0;

  for i := 1 to Length(sEntry) do // Loop through text
  begin
    if (sEntry[i] = ':') then // Check for key value pairs
    begin
      Inc(iEntryCount);
    end;
  end;

  Result := iEntryCount;
end;

function WriteEntry(sEntry : String; sValue: String; iPropertyIndex: Integer): String;
var
  i, iPropertyCount, iPropertyPos : Integer;
  iValueQuoteCount : Integer;
  iValueStartPos, iValueEndPos : Integer;
  bSetValue : Boolean;

  sOutput : String;
begin
  iPropertyCount := 0;
  iPropertyPos := 0;
  bSetValue := False;

  for i := 1 to Length(sEntry) do // Loop through text
  begin
    if (iPropertyCount = iPropertyIndex) and (sEntry[i - 1] = ':') then
    begin
      iPropertyPos := i - 1; // Get Selected KeyValue pair position
    end;

    if (sEntry[i] = ':') then // Check for key value pairs
    begin
      Inc(iPropertyCount);
    end;
  end;

  i := iPropertyPos;
  while not (bSetValue) do
  begin
    if (sEntry[i] = '"') then
    begin
      Inc(iValueQuoteCount);
      if (iValueQuoteCount = 2) then
      begin
        iValueEndPos := i;
      end
      else if (iValueQuoteCount = 1) then
      begin
        iValueStartPos := i;
      end;
    end;
  end;

  Result := sOutput;
end;

end.
