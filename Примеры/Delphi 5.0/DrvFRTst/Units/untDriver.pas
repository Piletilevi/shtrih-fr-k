unit untDriver;

interface

uses
  // VCL
  ComObj, SysUtils;

procedure FreeDriver;
function Driver: OleVariant;
function ReadTable(TableNumber, RowNumber, FieldNumber,
  DefValue: Integer): Integer;

implementation

var
  FDriver: OleVariant;

function Driver: OleVariant;
begin
  if VarIsEmpty(FDriver) then
    FDriver := CreateOleObject('Addin.DrvFR');
  Result := FDriver;
end;

procedure FreeDriver;
begin
  VarClear(FDriver);
end;

function ReadTable(TableNumber, RowNumber, FieldNumber,
  DefValue: Integer): Integer;
begin
  Driver.TableNumber := TableNumber;
  Driver.RowNumber := RowNumber;
  Driver.FieldNumber := FieldNumber;
  if Driver.ReadTable = 0 then
    Result := Driver.ValueOfFieldInteger
  else
    Result := DefValue;
end;

end.
