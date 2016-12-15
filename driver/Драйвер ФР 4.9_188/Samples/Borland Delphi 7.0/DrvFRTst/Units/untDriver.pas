unit untDriver;

interface

uses
  // VCL
  Classes, SysUtils, Forms, ActiveX, ComObj,
  // This
  DrvFRLib_TLB, Fields;

type
  { TDriver }

  TDriver = class(TDrvFR)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ReadTableDef(ATableNumber, ARowNumber, AFieldNumber,
      ADefValue: Integer): Integer;

  end;

procedure FreeDriver;
function Driver: TDriver;

implementation

uses
  Windows, fmuMain;

function GetParamsFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.dat');
end;

var
  FDriver: TDriver = nil;

procedure FreeDriver;
begin
  FDriver.Free;
  FDriver := nil;
end;

function Driver: TDriver;
begin
  if FDriver = nil then
  try
    FDriver := TDriver.Create(nil);
  except
    on E: Exception do
    begin
      E.Message := 'Ошибка создания объекта драйвера: ' + E.Message;
      raise;
    end;
  end;
  Result := FDriver;
end;

function DriverIsNil: Boolean;
begin
  Result := FDriver = nil;
end;

{ TDriver }

constructor TDriver.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDriver.Destroy;
begin
  inherited Destroy;
end;

function TDriver.ReadTableDef(ATableNumber, ARowNumber, AFieldNumber,
  ADefValue: Integer): Integer;
begin
  RowNumber := ARowNumber;
  TableNumber := ATableNumber;
  FieldNumber := AFieldNumber;
  if ReadTable = 0 then
    Result := ValueOfFieldInteger
  else
    Result := ADefValue;
end;

end.
