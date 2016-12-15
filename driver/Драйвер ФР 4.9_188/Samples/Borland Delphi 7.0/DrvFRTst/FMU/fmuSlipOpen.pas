unit fmuSlipOpen;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, SysUtils, Buttons,
  Spin,
  // This
  untPages, untDriver, Grids, ValEdit, untUtil, untTypes, untTestParams;

type
  { TfmSlipOpen }

  TfmSlipOpen = class(TPage)
    btnStdExecute: TBitBtn;
    lblCount: TLabel;
    btnExecute: TBitBtn;
    vleParams: TValueListEditor;
    btnLoadFromTables: TButton;
    btnDefaultValues: TButton;
    btnSaveToTables: TButton;
    seCount: TSpinEdit;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnStdExecuteClick(Sender: TObject);
    procedure vleParamsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnLoadFromTablesClick(Sender: TObject);
    procedure btnDefaultValuesClick(Sender: TObject);
    procedure btnSaveToTablesClick(Sender: TObject);
    procedure vleParamsSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormResize(Sender: TObject);
  private
    function GetItem(const AName: string): Integer;
    function GetPickItem(const AName: string): Integer;
    function LoadFromTables: Integer;
    function SaveToTables: Integer;
  public
    procedure UpdatePage; override;
    procedure UpdateObject; override;
    procedure Initialize; override;
  end;

implementation

{$R *.DFM}

const
  C_CopyType = 'Дублирование печати';
  C_CheckType = 'Тип чека';
  C_CopyOffset1 = 'Смещение 1';
  C_CopyOffset2 = 'Смещение 2';
  C_CopyOffset3 = 'Смещение 3';
  C_CopyOffset4 = 'Смещение 4';
  C_CopyOffset5 = 'Смещение 5';
  C_NumberOfCopies = 'Количество копий';

const
  OpenSlipParams: array[0..5] of TIntParam =(
    (Name: C_NumberOfCopies; Value: 1),
    (Name: C_CopyOffset1; Value: 1),
    (Name: C_CopyOffset2; Value: 1),
    (Name: C_CopyOffset3; Value: 1),
    (Name: C_CopyOffset4; Value: 5),
    (Name: C_CopyOffset5; Value: 7)
  );

  OpenSlipExParams: array[0..12] of TIntParam =(
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

{ TfmSlipOpen }

procedure TfmSlipOpen.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(vleParams.Cells[1, Row + 11]));
  end;

begin
  // Основные
  Driver.CopyType := GetPickItem(C_CopyType);
  Driver.CheckType := GetPickItem(C_CheckType);
  Driver.CopyOffset1 := GetItem(C_CopyOffset1);
  Driver.CopyOffset2 := GetItem(C_CopyOffset2);
  Driver.CopyOffset3 := GetItem(C_CopyOffset3);
  Driver.CopyOffset4 := GetItem(C_CopyOffset4);
  Driver.CopyOffset5 := GetItem(C_CopyOffset5);
  Driver.OperationBlockFirstString := seCount.Value;
  Driver.NumberOfCopies := GetItem(C_NumberOfCopies);
  // Дополнительные
  Driver.ClicheFont := GetVal(0);
  Driver.HeaderFont := GetVal(1);
  Driver.EKLZFont := GetVal(2);
  Driver.KPKFont := GetVal(3);
  Driver.ClicheStringNumber := GetVal(4);
  Driver.HeaderStringNumber := GetVal(5);
  Driver.EKLZStringNumber := GetVal(6);
  Driver.FMStringNumber := GetVal(7);
  Driver.ClicheOffset := GetVal(8);
  Driver.HeaderOffset := GetVal(9);
  Driver.EKLZOffset := GetVal(10);
  Driver.KPKOffset := GetVal(11);
  Driver.FMOffset := GetVal(12);
end;

procedure TfmSlipOpen.btnExecuteClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.OpenFiscalSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.HeaderStringNumber + 3;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipOpen.UpdatePage;
begin
  seCount.Value := Driver.OperationBlockFirstString;
end;

procedure TfmSlipOpen.btnStdExecuteClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.OpenStandardFiscalSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.ReadTableDef(12,1,6,6) + 3;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipOpen.Initialize;
var
  i: Integer;
begin
  VLE_AddSeparator(vleParams, 'Основные');
  VLE_AddPickProperty(vleParams, C_CheckType, 'Продажа',
    ['Продажа', 'Покупка', 'Возврат продажи', 'Возврат покупки'], [0, 1, 2, 3]);
  VLE_AddPickProperty(vleParams, C_CopyType, 'Колонки',
    ['Колонки', 'Блоки строк'], [0, 1]);
  for i := Low(OpenSlipParams) to High(OpenSlipParams) do
    VLE_AddProperty(vleParams, OpenSlipParams[i].Name, IntToStr(OpenSlipParams[i].Value) );
  VLE_AddSeparator(vleParams, 'Дополнительные');
  for i := Low(OpenSlipExParams) to High(OpenSlipExParams) do
    VLE_AddProperty(vleParams, OpenSlipExParams[i].Name, IntToStr(OpenSlipExParams[i].Value) );
  // Если были загружены настройки, записываем их в контрол
  if TestParams.ParamsLoaded then
    StringToVLEParams(vleParams, TestParams.SlipOpen.Text)
  else
    TestParams.SlipOpen.Text := VLEParamsToString(vleParams);
end;

function TfmSlipOpen.GetItem(const AName: string): Integer;
begin
  Result := StrToInt(VLE_GetPropertyValue(vleParams, AName));
end;

function TfmSlipOpen.GetPickItem(const AName: string): Integer;
begin
  Result := VLE_GetPickPropertyValue(vleParams, AName);
end;

procedure TfmSlipOpen.vleParamsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  VLE_DrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TfmSlipOpen.btnDefaultValuesClick(Sender: TObject);
begin
  vleParams.Strings.Text := '';
  Initialize;
end;

procedure TfmSlipOpen.btnLoadFromTablesClick(Sender: TObject);
begin
  LoadFromTables;
end;

function TfmSlipOpen.LoadFromTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 12;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Result := Driver.ReadTable;
      if Result = 0 then
        vleParams.Cells[1, i + 10] := IntToSTr(Driver.ValueOfFieldInteger);
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

function TfmSlipOpen.SaveToTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 12;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Driver.ValueOfFieldInteger := StrToInt(vleParams.Cells[1, i + 10]);
      Result := Driver.WriteTable;
      if Result <> 0 then Exit;
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipOpen.btnSaveToTablesClick(Sender: TObject);
begin
  Check(SaveToTables);
end;

procedure TfmSlipOpen.vleParamsSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  TestParams.SlipOpen.Text := VLEParamsToString(vleParams);
end;

procedure TfmSlipOpen.FormResize(Sender: TObject);
begin
  if vleParams.Width > 392 then
    vleParams.DisplayOptions := vleParams.DisplayOptions + [doAutoColResize]
  else
    vleParams.DisplayOptions := vleParams.DisplayOptions - [doAutoColResize];
end;

end.
