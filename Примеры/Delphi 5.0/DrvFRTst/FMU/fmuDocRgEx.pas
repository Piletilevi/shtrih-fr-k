unit fmuDocRgEx;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls,
  // This
  untPages, untTypes, untDriver;

type

  { TfmDocRgEx }

  TfmDocRgEx = class(TPage)
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
  RegSlipEx: array[0..20] of TIntParam =(
    (Name: 'Формат целого кол-ва'; Value: 1),
    (Name: 'Количество строк в операции'; Value: 3),
    (Name: 'Строка текста'; Value: 1),
    (Name: 'Строка произведения кол-ва на цену'; Value: 2),
    (Name: 'Строка суммы'; Value: 3),
    (Name: 'Строка отдела'; Value: 2),
    (Name: 'Шрифт текста'; Value: 1),
    (Name: 'Шрифт кол-ва'; Value: 1),
    (Name: 'Шрифт знака умножения'; Value: 1),
    (Name: 'Шрифт цены'; Value: 1),
    (Name: 'Шрифт суммы'; Value: 1),
    (Name: 'Шрифт отдела'; Value: 1),
    (Name: 'Кол-во символов текста'; Value: 40),
    (Name: 'Кол-во символов кол-ва'; Value: 14),
    (Name: 'Кол-во символов цены'; Value: 14),
    (Name: 'Кол-во символов суммы'; Value: 14),
    (Name: 'Кол-во символов отдела'; Value: 40),
    (Name: 'Смещение текста'; Value: 1),
    (Name: 'Смещение произведения кол-ва на цену'; Value: 20),
    (Name: 'Смещение суммы'; Value: 1),
    (Name: 'Смещение отдела'; Value: 1)
  );

{ TfmDocRgEx }

constructor TfmDocRgEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

procedure TfmDocRgEx.Initialize;
var
  i: Integer;
begin
  for i := Low(RegSlipEx) to High(RegSlipEx) do
  begin
    Grid.Cells[0,i] := RegSlipEx[i].Name;
    Grid.Cells[1,i] := IntToStr(RegSlipEx[i].Value);
  end;
end;

procedure TfmDocRgEx.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(Grid.Cells[1,Row]));
  end;

begin
  Driver.Quantityformat := GetVal(0);
  Driver.StringQuantityinOperation := GetVal(1);
  Driver.TextStringNumber := GetVal(2);
  Driver.QuantityStringNumber := GetVal(3);
  Driver.SummStringNumber := GetVal(4);
  Driver.DepartmentStringNumber := GetVal(5);
  Driver.TextFont := GetVal(6);
  Driver.QuantityFont := GetVal(7);
  Driver.MultiplicationFont := GetVal(8);
  Driver.PriceFont := GetVal(9);
  Driver.SummFont := GetVal(10);
  Driver.DepartmentFont := GetVal(11);
  Driver.TextSymbolNumber := GetVal(12);
  Driver.QuantitySymbolNumber := GetVal(13);
  Driver.PriceSymbolNumber := GetVal(14);
  Driver.SummSymbolNumber := GetVal(15);
  Driver.DepartmentSymbolNumber := GetVal(16);
  Driver.TextOffset := GetVal(17);
  Driver.QuantityOffset := GetVal(18);
  Driver.SummOffset := GetVal(19);
  Driver.DepartmentOffset := GetVal(20);
end;

function TfmDocRgEx.LoadDefaults: Boolean;
var
  i: Integer;
begin
  Driver.TableNumber := 13;
  Result := Driver.GetTableStruct = 0;
  if not Result then Exit;

  Driver.RowNumber := 1;
  for i := 1 to Driver.FieldNumber do
  begin
    Driver.FieldNumber := i;
    Result := Driver.ReadTable = 0;
    if not Result then Exit;
    Grid.Cells[1, i-1] := IntToStr(Driver.ValueOfFieldInteger);
  end;
end;

procedure TfmDocRgEx.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.RegistrationOnSlipDocument;
  if ResultCode = 0 then Count := Count + Driver.StringQuantityinOperation;
end;

procedure TfmDocRgEx.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.75*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.25*(Grid.Width-24));
end;

end.
