unit Parser_u;

interface

function CreateEntry(sKeysSepByComma: String): String;
function ReadEntryKey(sEntry: String; iPropertyIndex: Integer): String;
function ReadEntryValue(sEntry: String; iPropertyIndex: Integer): String;
function GetPropertyCount(sEntry: String): Integer;
function GetPropertyIndex(sEntry: String; sKey: String): Integer;
function WriteEntryValue(sEntry: String; sValue: String;
  iPropertyIndex: Integer): String;
function WriteEntryKey(sEntry: String; sKey: String;
  iPropertyIndex: Integer): String;

implementation

function CreateEntry(sKeysSepByComma: String): String;
var
  i, j, iOffset: Integer;
  iKeysCount: Integer;
  iCommaPos: Integer;
  sKey: String;
  sOutput: String;
  bFoundComma: Boolean;
begin
  // Intitialize
  iKeysCount := 1;
  iOffset := 1;
  iCommaPos := 0;
  sKey := '';
  sOutput := '{' + #10;
  bFoundComma := False;

  i := 1;
  while (i <> Length(sKeysSepByComma)) do // loop through keys string to get keys amount
  begin
    if (sKeysSepByComma[i] = ',') then
    begin
      Inc(iKeysCount);
    end;

    Inc(i);
  end;

  // Create output formatted text
  for i := 1 to iKeysCount do
  begin
    j := iOffset;
    while not(bFoundComma) do // Get Comma positions
    begin
      if (sKeysSepByComma[j] = ',') then
      begin
        iCommaPos := j;
        bFoundComma := True;
      end
      else if (j = Length(sKeysSepByComma)) then
      begin
        iCommaPos := j + 1;
        bFoundComma := True;
      end;

      Inc(j);
    end;

    for j := iOffset to iCommaPos - 1 do // Get key
    begin
      sKey := sKey + sKeysSepByComma[j]
    end;

    sOutput := sOutput + '    "' + sKey + '": ""'; // Output formatted key value pair

    if (i <> iKeysCount) then // Adds newline if needed
    begin
      sOutput := sOutput + ',' + #10;
    end
    else
    begin
      sOutput := sOutput + #10 + '}';
    end;

    iOffset := iCommaPos + 1;
    bFoundComma := False;
    sKey := '';
  end;

  // Output formatted text
  Result := sOutput;
end;

function ReadEntryKey(sEntry: String; iPropertyIndex: Integer): String;
var
  i, j, k, l, m, n: Integer;
  iPropertyCount: Integer;
  iPropertyPos: Integer;
  iKeyQuoteCount, iValueQuoteCount: Integer;
  iKeyStartPos: Integer;
  iValueEndPos: Integer;
  bHasKey, bHasValue: Boolean;
  sOutput, sKeyOutput: String;
  iOutputKeyStart, iOutputKeyEnd: Integer;
  iOutputKeyMidPos, iOutputQuoteCount: Integer;
begin
  if (iPropertyIndex > GetPropertyCount(sEntry)) then
  // Check if entry index is less than entry count
  begin
    exit;
  end;
  // Initialize
  iPropertyCount := 0;
  iPropertyPos := 0;
  iKeyQuoteCount := 0;
  iValueQuoteCount := 0;
  iKeyStartPos := 0;
  iValueEndPos := 0;
  bHasKey := False;
  bHasValue := False;

  sOutput := '';
  sKeyOutput := '';
  iOutputKeyStart := 0;
  iOutputKeyEnd := 0;
  iOutputKeyMidPos := 0;
  iOutputQuoteCount := 0;

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

  // Get Key Start pos
  j := iPropertyPos;
  while not(bHasKey) do // Loop through text
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

  // Get Value end pos
  k := iPropertyPos;
  while not(bHasValue) do
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

  // Get Key value pair middle pos
  for m := 1 to Length(sOutput) do
  begin
    if (sOutput[m] = ':') then
    begin
      iOutputKeyMidPos := m;
    end;
  end;

  // Get Seperate start and end pos for key
  for m := iOutputKeyMidPos downto 1 do
  begin
    if (sOutput[m] = '"') then
    begin
      Inc(iOutputQuoteCount);

      if (iOutputQuoteCount = 1) then
        iOutputKeyEnd := m
      else if (iOutputQuoteCount = 2) then
        iOutputKeyStart := m;
    end;
  end;

  // Get Key string
  for n := iOutputKeyStart + 1 to iOutputKeyEnd - 1 do
  begin
    sKeyOutput := sKeyOutput + sOutput[n];
  end;

  // Output key string
  Result := sKeyOutput;

end;

function ReadEntryValue(sEntry: String; iPropertyIndex: Integer): String;
var
  i, j, k, l, m, n: Integer;
  iPropertyCount: Integer;
  iPropertyPos: Integer;
  iKeyQuoteCount, iValueQuoteCount: Integer;
  iKeyStartPos: Integer;
  iValueEndPos: Integer;
  bHasKey, bHasValue: Boolean;
  sOutput, sValueOutput: String;
  iOutputValueStart, iOutputValueEnd: Integer;
  iOutputValueMidPos, iOutputQuoteCount: Integer;
begin
  if (iPropertyIndex > GetPropertyCount(sEntry)) then
  // Check if entry index is less than entry count
  begin
    exit;
  end;

  // Initialize
  iPropertyCount := 0;
  iPropertyPos := 0;
  iKeyQuoteCount := 0;
  iValueQuoteCount := 0;
  iKeyStartPos := 0;
  iValueEndPos := 0;
  bHasKey := False;
  bHasValue := False;

  sOutput := '';
  sValueOutput := '';
  iOutputValueStart := 0;
  iOutputValueEnd := 0;
  iOutputValueMidPos := 0;
  iOutputQuoteCount := 0;

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

  // Get Key start pos
  j := iPropertyPos;
  while not(bHasKey) do // Loop through text
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

  // Get value end pos
  k := iPropertyPos;
  while not(bHasValue) do
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

  // Get Key value pair middle pos
  for m := 1 to Length(sOutput) do
  begin
    if (sOutput[m] = ':') then
    begin
      iOutputValueMidPos := m;
    end;
  end;

  // Get start and end pos for value
  for m := iOutputValueMidPos to Length(sOutput) do
  begin
    if (sOutput[m] = '"') then
    begin
      Inc(iOutputQuoteCount);

      if (iOutputQuoteCount = 1) then
        iOutputValueStart := m
      else if (iOutputQuoteCount = 2) then
        iOutputValueEnd := m;
    end;
  end;

  // Extract value from text
  for n := iOutputValueStart + 1 to iOutputValueEnd - 1 do
  begin
    sValueOutput := sValueOutput + sOutput[n];
  end;

  // Output value
  Result := sValueOutput;

end;

function GetPropertyCount(sEntry: String): Integer;
var
  i, iEntryCount: Integer;
begin
  iEntryCount := 0;

  // Check for amount of : to indicate key value pairs
  for i := 1 to Length(sEntry) do // Loop through text
  begin
    if (sEntry[i] = ':') then // Check for key value pairs
    begin
      Inc(iEntryCount);
    end;
  end;

  Result := iEntryCount;
end;

function GetPropertyIndex(sEntry: String; sKey: String): Integer;
var
  i: Integer;
  iKeyPos: Integer;
  iQuoteCount: Integer;
  iPropertyCount: Integer;
  iPropertyPos: Integer;
  bPropertyPos: Boolean;
  bPropertyIndex: Boolean;
begin
  iKeyPos := Pos(sKey, sEntry); // Get Key pos in text
  iQuoteCount := 0;
  iPropertyCount := 0;
  iPropertyPos := 0;
  bPropertyPos := False;
  bPropertyIndex := False;

  // Get Key value pair pos
  i := iKeyPos;
  while not(bPropertyPos) do
  begin
    if (sEntry[i] = '"') then
    begin
      Inc(iQuoteCount);
    end;

    if (sEntry[i] = ':') and (iQuoteCount = 1) then
    begin
      iPropertyPos := i;
      bPropertyPos := True;
    end;

    Inc(i);
  end;

  // Count key value pairs till at iPropertyPos
  i := 1;
  while not(bPropertyIndex) do
  begin
    if (sEntry[i] = ':') then
    begin
      Inc(iPropertyCount);
    end;

    if (i = iPropertyPos) then
    begin
      bPropertyIndex := True;
    end;

    Inc(i);
  end;

  // Output count
  Result := iPropertyCount;
end;

function WriteEntryValue(sEntry: String; sValue: String;
  iPropertyIndex: Integer): String;
var
  i, j, iPropertyCount, iPropertyPos: Integer;
  iValueQuoteCount: Integer;
  iValueStartPos, iValueEndPos: Integer;
  bHasValue: Boolean;
begin
  iPropertyCount := 0;
  iPropertyPos := 0;
  iValueQuoteCount := 0;
  iValueStartPos := 0;
  iValueEndPos := 0;
  bHasValue := False;

  // Get Property pos and Count
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

  // Get Value Start and end pos
  i := iPropertyPos;
  while not(bHasValue) do
  begin
    if (sEntry[i] = '"') then
    begin
      Inc(iValueQuoteCount);
      if (iValueQuoteCount = 2) then
      begin
        iValueEndPos := i;
        bHasValue := True;
      end
      else if (iValueQuoteCount = 1) then
      begin
        iValueStartPos := i;
      end;
    end;

    Inc(i);
  end;

  // Delete old value
  Delete(sEntry, iValueStartPos, iValueEndPos - iValueStartPos + 1);

  // Replace new value
  Insert('"' + sValue + '"', sEntry, iValueStartPos);

  Result := sEntry;
end;

function WriteEntryKey(sEntry: String; sKey: String;
  iPropertyIndex: Integer): String;
var
  i, j, iPropertyCount, iPropertyPos: Integer;
  iKeyQuoteCount: Integer;
  iKeyStartPos, iKeyEndPos: Integer;
  bHasKey: Boolean;
begin
  iPropertyCount := 0;
  iPropertyPos := 0;
  iKeyQuoteCount := 0;
  iKeyStartPos := 0;
  iKeyEndPos := 0;
  bHasKey := False;

  // Get property count and pos
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

  // Get key start and end pos
  i := iPropertyPos;
  while not(bHasKey) do
  begin
    if (sEntry[i] = '"') then
    begin
      Inc(iKeyQuoteCount);
      if (iKeyQuoteCount = 2) then
      begin
        iKeyStartPos := i;
        bHasKey := True;
      end
      else if (iKeyQuoteCount = 1) then
      begin
        iKeyEndPos := i;
      end;
    end;

    Dec(i);
  end;

  // Delete old key
  Delete(sEntry, iKeyStartPos, iKeyEndPos - iKeyStartPos + 1);

  // Replace new key
  Insert('"' + sKey + '"', sEntry, iKeyStartPos);

  Result := sEntry;
end;

end.
