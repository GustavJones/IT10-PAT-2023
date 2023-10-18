unit Parser_u;

interface

function ReadEntry(sRawData: String; iPropertyIndex: Integer): String;

implementation

function ReadEntry(sRawData: String; iPropertyIndex: Integer): String;
var
  i, j, k, l : Integer;
  iKeyCount : Integer;
  iKeyPos : Integer;
  iKeyQuoteCount, iValueQuoteCount : Integer;
  iKeyStartPos: Integer;
  iValueEndPos : Integer;
  bHasKey, bHasValue : Boolean;
  sOutput: String;
begin
  iKeyCount := 0;
  iKeyPos := 0;
  iKeyQuoteCount := 0;
  iValueQuoteCount := 0;
  iKeyStartPos := 0;
  iValueEndPos := 0;
  bHasKey := False;
  bHasValue := False;

  sOutput := '';

  for i := 1 to Length(sRawData) do // Loop through text
  begin
    if (iKeyCount = iPropertyIndex) and (sRawData[i - 1] = ':') then
    begin
      iKeyPos := i - 1; // Get Selected KeyValue pair position
    end;

    if (sRawData[i] = ':') then // Check for key value pairs
    begin
      Inc(iKeyCount);
    end;
  end;

  j := iKeyPos;
  while not (bHasKey) do // Loop through text
  begin
    if (sRawData[j] = '"') then
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

  k := iKeyPos;
  while not (bHasValue) do
  begin
    if (sRawData[k] = '"') then
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
      sOutput := sOutput + sRawData[l];
    end;

    Inc(k);
  end;

  Result := sOutput;

end;

end.
