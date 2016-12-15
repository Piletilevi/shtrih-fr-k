unit fmuSlipRegistration;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons,
  Dialogs, Spin,
  // This
  untPages, untDriver, untUtil, untTypes, Grids, ValEdit, untTestParams;


type
  { TfmSlipRegistration }

  TfmSlipRegistration = class(TPage)
    btnStdRegistration: TBitBtn;
    btnRegistration: TBitBtn;
    vleParams: TValueListEditor;
    btnLoadFromTables: TButton;
    lblCount: TLabel;
    btnDefaultValues: TButton;
    btnSaveToTables: TButton;
    seCount: TSpinEdit;
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnStdRegistrationClick(Sender: TObject);
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
    function GetFloatItem(const AName: string): Double;
    function GetCurrItem(const AName: string): Currency;
    function LoadFromTables: Integer;
    function SaveToTables: Integer;
  public
    procedure Initialize; override;
    procedure UpdatePage; override;
    procedure UpdateObject; override;
  end;

implementation

{$R *.DFM}

const
  C_Quantity = '����������';
  C_Price = '����';
  C_Department = '�����';
  C_Tax = '�����';
  C_Tax1 = '����� 1';
  C_Tax2 = '����� 2';
  C_Tax3 = '����� 3';
  C_Tax4 = '����� 4';
  C_StringForPrinting = '������';

const
  RegSlipParams: array[0..2] of TIntParam = (
    (Name: C_Quantity; Value: 1),
    (Name: C_Price; Value: 100),
    (Name: C_Department; Value: 0)
  );

const
  RegSlipExParams: array[0..20] of TIntParam = (
    (Name: '������ ������ ���-��'; Value: 1),
    (Name: '���������� ����� � ��������'; Value: 3),
    (Name: '������ ������'; Value: 1),
    (Name: '������ ������������ ���-�� �� ����'; Value: 2),
    (Name: '������ �����'; Value: 3),
    (Name: '������ ������'; Value: 2),
    (Name: '����� ������'; Value: 1),
    (Name: '����� ���-��'; Value: 1),
    (Name: '����� ����� ���������'; Value: 1),
    (Name: '����� ����'; Value: 1),
    (Name: '����� �����'; Value: 1),
    (Name: '����� ������'; Value: 1),
    (Name: '���-�� �������� ������'; Value: 40),
    (Name: '���-�� �������� ���-��'; Value: 14),
    (Name: '���-�� �������� ����'; Value: 14),
    (Name: '���-�� �������� �����'; Value: 14),
    (Name: '���-�� �������� ������'; Value: 40),
    (Name: '�������� ������'; Value: 1),
    (Name: '�������� ������������ ���-�� �� ����'; Value: 20),
    (Name: '�������� �����'; Value: 1),
    (Name: '�������� ������'; Value: 1)
  );

{ TfmSlipRegistration }

procedure TfmSlipRegistration.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(vleParams.Cells[1, Row + 11]));
  end;

begin
  // �������� ���������
  Driver.OperationBlockFirstString := seCount.Value;
  Driver.Quantity := GetFloatItem(C_Quantity);
  Driver.Price := GetCurrItem(C_Price);
  Driver.Department := GetItem(C_Department);
  Driver.StringForPrinting := VLE_GetPropertyValue(vleParams, C_StringForPrinting);
  Driver.Tax1 := VLE_GetPickPropertyValue(vleParams, C_Tax1);
  Driver.Tax2 := VLE_GetPickPropertyValue(vleParams, C_Tax2);
  Driver.Tax3 := VLE_GetPickPropertyValue(vleParams, C_Tax3);
  Driver.Tax4 := VLE_GetPickPropertyValue(vleParams, C_Tax4);
  // �������������� ���������
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

procedure TfmSlipRegistration.btnRegistrationClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.RegistrationOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.StringQuantityinOperation;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipRegistration.UpdatePage;
begin
  seCount.Value := Driver.OperationBlockFirstString;
end;

procedure TfmSlipRegistration.btnStdRegistrationClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.StandardRegistrationOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.ReadTableDef(13,1,2,3);
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipRegistration.Initialize;
var
  i: Integer;
begin
  VLE_AddSeparator(vleParams, '��������');
  for i := Low(RegSlipParams) to High(RegSlipParams) do
    VLE_AddProperty(vleParams, RegSlipParams[i].Name, IntToStr(RegSlipParams[i].Value));
  for i := 1 to 4 do
    VLE_AddPickProperty(vleParams, Format('%s %d', [C_Tax, i]), '���',
      ['���', '1 ������', '2 ������', '3 ������', '4 ������'], [0, 1, 2, 3, 4]);
  VLE_AddProperty(vleParams, C_StringForPrinting, '������ ��� ������');
  VLE_AddSeparator(vleParams, '��������������');
  for i := Low(RegSlipExParams) to High(RegSlipExParams) do
    VLE_AddProperty(vleParams, RegSlipExParams[i].Name, IntToStr(RegSlipExParams[i].Value));
  // ���� ���� ��������� ���������, ���������� �� � �������
  if TestParams.ParamsLoaded then
    StringToVLEParams(vleParams, TestParams.SlipRegistration.Text)
  else
    TestParams.SlipRegistration.Text := VLEParamsToString(vleParams);
end;

function TfmSlipRegistration.LoadFromTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 13;
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

function TfmSlipRegistration.GetItem(const AName: string): Integer;
begin
  Result := StrToInt(VLE_GetPropertyValue(vleParams, AName));
end;

function TfmSlipRegistration.GetFloatItem(const AName: string): Double;
begin
  Result := StrToFloat(VLE_GetPropertyValue(vleParams, AName));
end;

function TfmSlipRegistration.GetCurrItem(const AName: string): Currency;
begin
  Result := StrToCurr(VLE_GetPropertyValue(vleParams, AName));
end;

procedure TfmSlipRegistration.vleParamsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  VLE_DrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TfmSlipRegistration.btnLoadFromTablesClick(Sender: TObject);
begin
  Check(LoadFromTables);
end;

procedure TfmSlipRegistration.btnDefaultValuesClick(Sender: TObject);
begin
  vleParams.Strings.Text := '';
  Initialize;
end;

procedure TfmSlipRegistration.btnSaveToTablesClick(Sender: TObject);
begin
  Check(SaveToTables);
end;

function TfmSlipRegistration.SaveToTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 13;
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

procedure TfmSlipRegistration.vleParamsSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  TestParams.SlipRegistration.Text := VLEParamsToString(vleParams);
end;

procedure TfmSlipRegistration.FormResize(Sender: TObject);
begin
  if vleParams.Width > 392 then
    vleParams.DisplayOptions := vleParams.DisplayOptions + [doAutoColResize]
  else
    vleParams.DisplayOptions := vleParams.DisplayOptions - [doAutoColResize];
end;

end.
