unit fmuDocSpEx;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls,
  // This
  untPages, untTypes, untDriver;

type

  { TfmDocSpEx }

  TfmDocSpEx = class(TPage)
    Grid: TStringGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
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
  OpenSlipEx: array[0..12] of TIntParam =(
    (Name: 'Шрифт клише'; Value: 1),
    (Name: 'Шрифт заголовка документа'; Value: 1),
    (Name: 'Шрифт номера ЭКЛЗ'; Value: 1),
    (Name: 'Шрифт КПК и номера КПК'; Value: 1),
    (Name: 'Строка клише'; Value: 1),
    (Name: 'Строка заголовка документа'; Value: 3),
    (Name: 'Строка номера ЭКЛЗ'; Value: 4),
    (Name: 'Строка признака ФП'; Value: 5),
    (Name: 'Смещение клише'; Value: 1),
    (Name: 'Смещение заголовка документа'; Value: 1),
    (Name: 'Смещение номера ЭКЛЗ'; Value: 1),
    (Name: 'Смещение КПК и номера КПК'; Value: 1),
    (Name: 'Смещение признака ФП'; Value: 1)
  );

{ TfmDocSpEx }

constructor TfmDocSpEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;


procedure TfmDocSpEx.Initialize;
var
  i: Integer;
begin
  for i := Low(OpenSlipEx) to High(OpenSlipEx) do
  begin
    Grid.Cells[0,i] := OpenSlipEx[i].Name;
    Grid.Cells[1,i] := IntToStr(OpenSlipEx[i].Value);
  end;
end;

procedure TfmDocSpEx.UpdateObject;
begin
  Driver.ClicheFont := StrToInt(Trim(Grid.Cells[1,0]));
  Driver.HeaderFont := StrToInt(Trim(Grid.Cells[1,1]));
  Driver.EKLZFont := StrToInt(Trim(Grid.Cells[1,2]));
  Driver.KPKFont := StrToInt(Trim(Grid.Cells[1,3]));
  Driver.ClicheStringNumber := StrToInt(Trim(Grid.Cells[1,4]));
  Driver.HeaderStringNumber := StrToInt(Trim(Grid.Cells[1,5]));
  Driver.EKLZStringNumber := StrToInt(Trim(Grid.Cells[1,6]));
  Driver.FMStringNumber := StrToInt(Trim(Grid.Cells[1,7]));
  Driver.ClicheOffset := StrToInt(Trim(Grid.Cells[1,8]));
  Driver.HeaderOffset := StrToInt(Trim(Grid.Cells[1,9]));
  Driver.EKLZOffset := StrToInt(Trim(Grid.Cells[1,10]));
  Driver.KPKOffset := StrToInt(Trim(Grid.Cells[1,11]));
  Driver.FMOffset := StrToInt(Trim(Grid.Cells[1,12]));
end;

function TfmDocSpEx.LoadDefaults: Boolean;
var
  i: Integer;
begin
  Driver.TableNumber := 12;
  Result := Driver.GetTableStruct = 0;
  if not Result then Exit;
  Driver.RowNumber := 1;
  for i := 1 to Driver.FieldNumber do
  begin
    Driver.FieldNumber := i;
    Result := Driver.ReadTable = 0;
    if Result then
      Grid.Cells[1, i-1] := IntToSTr(Driver.ValueOfFieldInteger);
  end;
end;

procedure TfmDocSpEx.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.OpenFiscalSlipDocument;
  if ResultCode = 0 then
    Count := Count + Driver.HeaderStringNumber + 3;
end;

procedure TfmDocSpEx.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.75*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.25*(Grid.Width-24));
end;

end.
