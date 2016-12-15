{Имитатор типа "Массив 1С:Предприятия"}

unit OleArray1C;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, DrvFRTst1C_TLB, StdVcl;

type
  { TArray1C }

  TArray1C = class(TAutoObject, IArray1C)
  private
    FData: array[0..50] of OleVariant;
  public
    function Get(Index: Integer): OleVariant; safecall;
    procedure Set_(Index: Integer; Value: OleVariant); safecall;
  end;

implementation

uses ComServ;

function TArray1C.Get(Index: Integer): OleVariant;
begin
  if Index = 5 then
    Result := string(FData[Index])
  else
  Result := FData[Index];
end;

procedure TArray1C.Set_(Index: Integer; Value: OleVariant);
begin
  if Index = 5 then
    FData[Index] := string(Value)
  else
  FData[Index] := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TArray1C, Class_Array1C,
    ciMultiInstance, tmApartment);
end.
