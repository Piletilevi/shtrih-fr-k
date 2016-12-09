unit fmuDocAdEx;

interface

uses
  // VCL
  Classes, Controls, Grids, SysUtils, ExtCtrls, StdCtrls,
  // This
  untPages, untTypes, untDriver;

type
  TfmDocAdEx = class(TPage)
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
  AdditionChargeSlipEx: array[0..11] of TIntParam = (
    (Name: '���-�� ����� � ��������'; Value: 2),
    (Name: '������ ������'; Value: 0),
    (Name: '������ �������� ��������'; Value: 1),
    (Name: '������ �����'; Value: 2),
    (Name: '����� ������'; Value: 1),
    (Name: '����� �������� ��������'; Value: 1),
    (Name: '����� �����'; Value: 1),
    (Name: '���-�� �������� ������'; Value: 40),
    (Name: '���-�� �������� �����'; Value: 40),
    (Name: '�������� ������'; Value: 1),
    (Name: '�������� �������� �����'; Value: 1),
    (Name: '�������� �����'; Value: 1)
  );

{ TfmDocAdEx }

constructor TfmDocAdEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

procedure TfmDocAdEx.Initialize;
var
  i: Integer;
begin
  Grid.RowCount := 12;
  for i := Low(AdditionChargeSlipEx) to High(AdditionChargeSlipEx) do
  begin
    Grid.Cells[0,i] := AdditionChargeSlipEx[i].Name;
    Grid.Cells[1,i] := IntToStr(AdditionChargeSlipEx[i].Value);
  end;
end;

procedure TfmDocAdEx.UpdateObject;

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

function TfmDocAdEx.LoadDefaults: Boolean;
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
    Grid.Cells[1, i] := IntToSTr(Driver.ValueOfFieldInteger);
  end;
end;

procedure TfmDocAdEx.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ChargeOnSlipDocument;
  if ResultCode = 0 then Count := Count + Driver.StringQuantityinOperation;
end;

procedure TfmDocAdEx.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.75*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.25*(Grid.Width-24));
end;

end.
