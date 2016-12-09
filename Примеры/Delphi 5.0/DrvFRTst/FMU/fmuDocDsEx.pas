unit fmuDocDsEx;

interface

uses
  // VCL
  Classes, Controls, Grids, SysUtils, ExtCtrls, StdCtrls,
  // This
  untPages, untTypes, untDriver;

type

  { TfmDocDsEx }

  TfmDocDsEx = class(TPage)
    Grid: TStringGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure FormResize(Sender: TObject);
  private
    procedure Initialize;
  public
    constructor Create(AOwner: TComponent); override;
    procedure UpdateObject; override;
    function LoadDefaults: Boolean; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

const
  DiscountChargeSlipEx: array[0..11] of TIntParam = (
    (Name: 'Кол-во строк в операции'; Value: 2),
    (Name: 'Строка текста'; Value: 0),
    (Name: 'Строка названия операции'; Value: 1),
    (Name: 'Строка суммы'; Value: 2),
    (Name: 'Шрифт текста'; Value: 1),
    (Name: 'Шрифт названия операции'; Value: 1),
    (Name: 'Шрифт суммы'; Value: 1),
    (Name: 'Кол-во символов текста'; Value: 40),
    (Name: 'Кол-во символов суммы'; Value: 40),
    (Name: 'Смещение текста'; Value: 1),
    (Name: 'Смещение названия суммы'; Value: 1),
    (Name: 'Смещение суммы'; Value: 1)
  );

{ TfmDocDsEx }

constructor TfmDocDsEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

procedure TfmDocDsEx.Initialize;
var
  i: Integer;
begin
  Grid.RowCount := 12;
  for i := Low(DiscountChargeSlipEx) to High(DiscountChargeSlipEx) do
  begin
    Grid.Cells[0,i] := DiscountChargeSlipEx[i].Name;
    Grid.Cells[1,i] := IntToStr(DiscountChargeSlipEx[i].Value);
  end;
end;

procedure TfmDocDsEx.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(Grid.Cells[1,Row]));
  end;

begin
  Driver.StringQuantityinOperation := GetVal(0);
  Driver.TextStringNumber := GetVal(1);
  Driver.OperationNameStringNumber := GetVal(2);
  Driver.SummStringNumber := GetVal(3);
  Driver.TextFont := GetVal(4);
  Driver.OperationNameFont := GetVal(5);
  Driver.SummFont := GetVal(6);
  Driver.TextSymbolNumber := GetVal(7);
  Driver.SummSymbolNumber := GetVal(8);
  Driver.TextOffset := GetVal(9);
  Driver.OperationnameOffset := GetVal(10);
  Driver.SummOffset := GetVal(11);
end;

function TfmDocDsEx.LoadDefaults: Boolean;
var
  i: Integer;
begin
  Driver.TableNumber := 15;
  Result := Driver.GetTableStruct = 0;
  if not Result then Exit;
  Driver.RowNumber := 1;
  for i:=1 to Driver.FieldNumber do
  begin
    Driver.FieldNumber := i;
    Result := Driver.ReadTable = 0;
    if not Result then Exit;
    Grid.Cells[1, i-1] := IntToSTr(Driver.ValueOfFieldInteger);
  end;
end;

procedure TfmDocDsEx.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.DiscountOnSlipDocument;
  if ResultCode = 0 then Count := Count + Driver.StringQuantityinOperation;
end;

procedure TfmDocDsEx.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.75*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.25*(Grid.Width-24));
end;

end.
