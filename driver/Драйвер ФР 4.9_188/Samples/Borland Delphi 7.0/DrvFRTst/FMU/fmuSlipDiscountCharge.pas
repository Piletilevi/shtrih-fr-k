unit fmuSlipDiscountCharge;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons,
  Spin,
  // This
  untPages, untDriver, untUtil, untTypes, Grids, ValEdit, untTestParams;

type
  { TfmSlipDiscount }

  TfmSlipDiscountCharge = class(TPage)
    lblCount: TLabel;
    btnStdDiscount: TBitBtn;
    btnDiscount: TBitBtn;
    btnCharge: TButton;
    btnStdCharge: TButton;
    vleParams: TValueListEditor;
    btnLoadFromTables: TButton;
    btnDefaultValues: TButton;
    btnSaveToTables: TButton;
    seCount: TSpinEdit;
    procedure btnDiscountClick(Sender: TObject);
    procedure btnStdDiscountClick(Sender: TObject);
    procedure vleParamsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnChargeClick(Sender: TObject);
    procedure btnStdChargeClick(Sender: TObject);
    procedure btnLoadFromTablesClick(Sender: TObject);
    procedure btnDefaultValuesClick(Sender: TObject);
    procedure btnSaveToTablesClick(Sender: TObject);
    procedure vleParamsSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormResize(Sender: TObject);
  private
    function LoadFromTables:Integer;
    function SaveToTables: Integer; 
  public
    procedure UpdatePage; override;
    procedure UpdateObject; override;

    procedure Initialize; override;
  end;

implementation

{$R *.DFM}


const

  C_Summ = 'Сумма';
  C_Tax = 'Налог';
  C_Tax1 = 'Налог 1';
  C_Tax2 = 'Налог 2';
  C_Tax3 = 'Налог 3';
  C_Tax4 = 'Налог 4';
  C_StringForPrinting = 'Строка';

const
  DiscountChargeSlipExParams: array[0..11] of TIntParam = (
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

{ TfmSlipDiscount }

procedure TfmSlipDiscountCharge.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(vleParams.Cells[1, Row + 9]));
  end;

begin
  // Основные параметры
  Driver.OperationBlockFirstString := seCount.Value;
  Driver.Summ1 := StrToCurr(VLE_GetPropertyValue(vleParams, C_Summ));
  Driver.StringForPrinting := VLE_GetPropertyValue(vleParams, C_StringForPrinting);
  Driver.Tax1 := VLE_GetPickPropertyValue(vleParams, C_Tax1);
  Driver.Tax2 := VLE_GetPickPropertyValue(vleParams, C_Tax2);
  Driver.Tax3 := VLE_GetPickPropertyValue(vleParams, C_Tax3);
  Driver.Tax4 := VLE_GetPickPropertyValue(vleParams, C_Tax4);

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

procedure TfmSlipDiscountCharge.btnDiscountClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.DiscountOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.StringQuantityinOperation;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.UpdatePage;
begin
  seCount.Value := Driver.OperationBlockFirstString;
end;

procedure TfmSlipDiscountCharge.btnStdDiscountClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.StandardDiscountOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.ReadTableDef(15,1,1,2);
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.btnChargeClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.ChargeOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.StringQuantityinOperation;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.btnStdChargeClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.StandardChargeOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.ReadTableDef(15,1,1,2);
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.Initialize;
var
  i: Integer;
begin
  VLE_AddSeparator(vleParams, 'Основные');
  VLE_AddProperty(vleParams, C_Summ, '100');
  for i := 1 to 4 do
    VLE_AddPickProperty(vleParams, Format('%s %d', [C_Tax, i]), 'Нет',
      ['Нет', '1 группа', '2 группа', '3 группа', '4 группа'], [0, 1, 2, 3, 4]);
  VLE_AddProperty(vleParams, C_StringForPrinting, 'Строка для печати');
  VLE_AddSeparator(vleParams, 'Дополнительные');
  for i := Low(DiscountChargeSlipExParams) to High(DiscountChargeSlipExParams) do
    VLE_AddProperty(vleParams, DiscountChargeSlipExParams[i].Name, IntToStr(DiscountChargeSlipExParams[i].Value));
  // Если были загружены настройки, записываем их в контрол
  if TestParams.ParamsLoaded then
    StringToVLEParams(vleParams, TestParams.SlipDiscountCharge.Text)
  else
    TestParams.SlipDiscountCharge.Text := VLEParamsToString(vleParams);
end;

function TfmSlipDiscountCharge.LoadFromTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 15;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Result := Driver.ReadTable;
      if Result = 0 then
        vleParams.Cells[1, i + 8] := IntToSTr(Driver.ValueOfFieldInteger);
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.vleParamsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  VLE_DrawCell(Sender, ACol, ARow, Rect, State);
end;


procedure TfmSlipDiscountCharge.btnLoadFromTablesClick(Sender: TObject);
begin
  Check(LoadFromTables);
end;

procedure TfmSlipDiscountCharge.btnDefaultValuesClick(Sender: TObject);
begin
  vleParams.Strings.Text := '';
  Initialize;
end;

procedure TfmSlipDiscountCharge.btnSaveToTablesClick(Sender: TObject);
begin
  Check(SaveToTables);
end;

function TfmSlipDiscountCharge.SaveToTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 15;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Driver.ValueOfFieldInteger := StrToInt(vleParams.Cells[1, i + 8]);
      Result := Driver.WriteTable;
      if Result <> 0 then Exit;
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipDiscountCharge.vleParamsSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  TestParams.SlipDiscountCharge.Text := VLEParamsToString(vleParams);
end;

procedure TfmSlipDiscountCharge.FormResize(Sender: TObject);
begin
  if vleParams.Width > 392 then
    vleParams.DisplayOptions := vleParams.DisplayOptions + [doAutoColResize]
  else
    vleParams.DisplayOptions := vleParams.DisplayOptions - [doAutoColResize];
end;

end.
