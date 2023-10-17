unit Parser_u;

interface

function ReadEntry(sRawData : String; iPropertyIndex : Integer) : String;

implementation

function ReadEntry(sRawData : String; iPropertyIndex : Integer) : String;
var
    i, j, k, l, iKeyEnd : Integer;
    sOutput : String;
begin
  for i := 1 to Length(sRawData) do
  begin

    if (sRawData[i] = '{') and (sRawData[i + 1] = #10) then
    begin

        for j := i + 2 to Length(sRawData) do
        begin

          if (sRawData[j] = ' ') and (sRawData[j + 1] = ' ' ) and (sRawData[j + 2] = ' ' ) and (sRawData[j + 3] = ' ' ) then
          begin

            for k := j + 5 to Length(sRawData) do
            begin

              if (sRawData[k] = '"') then
              begin
                iKeyEnd := k;
              end;
            end;

            for l := j + 5 to iKeyEnd do
            begin
              sOutput := sOutput + sRawData[l];
            end;

            Result := sOutput;
          end;
        end;    
    end;
  end;

end;

end.
