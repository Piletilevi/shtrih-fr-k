unit fmuSlipClose;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons, ComCtrls,
  Spin, Grids, ValEdit,
  // This
  untPages, untDriver, untUtil, untTypes, untTestParams;

type
  { TfmSlipClose }

  TfmSlipClose = class(TPage)
    lblCount: TLabel;
    btnStandardCloseCheckOnSlipDocument: TBitBtn;
    btnCloseCheckOnSlipDocument: TBitBtn;
    vleParams: TValueListEditor;
    btnLoadFromTables: TButton;
    btnDefaultValues: TButton;
    btnSaveToTables: TButton;
    seCount: TSpinEdit;
    procedure btnCloseCheckOnSlipDocumentClick(Sender: TObject);
    procedure btnStandardCloseCheckOnSlipDocumentClick(Sender: TObject);
    procedure vleParamsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnLoadFromTablesClick(Sender: TObject);
    procedure btnDefaultValuesClick(Sender: TObject);
    procedure btnSaveToTablesClick(Sender: TObject);
    procedure vleParamsSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormResize(Sender: TObject);
  private
    function GetFloatItem(const AName: string): Double;
    function GetCurrItem(const AName: string): Currency;
    function LoadFromTables: Integer;
    function SaveToTables: Integer;
  public
    procedure UpdatePage; override;
    procedure UpdateObject; override;
    procedure Initialize; override;
  end;

implementation

uses Forms;

{$R *.DFM}

const
  C_StringForPrinting = '������';
  C_Summ1 = 'C���� 1';
  C_Summ2 = '����� 2';
  C_Summ3 = '����� 3';
  C_Summ4 = '����� 4';
  C_DiscountOnCheck = '������';
  C_Tax = '�����';
  C_Tax1 = '����� 1';
  C_Tax2 = '����� 2';
  C_Tax3 = '����� 3';
  C_Tax4 = '����� 4';

const
  CloseSlipParams: array[0..4] of TIntParam = (
    (Name: C_Summ1; Value: 100),
    (Name: C_Summ2; Value: 0),
    (Name: C_Summ3; Value: 0),
    (Name: C_Summ4; Value: 0),
    (Name: C_DiscountOnCheck; Value: 0)
  );

  CloseSlipExParams: array[0..109] of TIntParam = (
    (Name: '���������� ����� � ��������'; Value: 17),
    (Name: '������ �����'; Value: 2),
    (Name: '������ ������'; Value: 1),
    (Name: '������ ��������'; Value: 3),
    (Name: '������ ������ 2'; Value: 4),
    (Name: '������ ������ 3'; Value: 5),
    (Name: '������ ������ 4'; Value: 6),
    (Name: '������ �����'; Value: 7),
    (Name: '������ ������� �� ������ �'; Value: 8),
    (Name: '������ ������� �� ������ �'; Value: 9),
    (Name: '������ ������� �� ������ �'; Value: 10),
    (Name: '������ ������� �� ������ �'; Value: 11),
    (Name: '������ ����� �� ������ �'; Value: 12),
    (Name: '������ ����� �� ������ �'; Value: 13),
    (Name: '������ ����� �� ������ �'; Value: 14),
    (Name: '������ ����� �� ������ �'; Value: 15),
    (Name: '������ ����� �� ���������� ������'; Value: 16),
    (Name: '������ ����� ������'; Value: 17),
    (Name: '����� ������'; Value: 1),
    (Name: '����� "����"'; Value: 2),
    (Name: '����� ����� �����'; Value: 2),
    (Name: '����� "���������"'; Value: 1),
    (Name: '����� ����� ��������'; Value: 1),
    (Name: '����� �������� ���� ������ 2'; Value: 1),
    (Name: '����� ����� ���� ������ 2'; Value: 1),
    (Name: '����� �������� ���� ������ 3'; Value: 1),
    (Name: '����� ����� ���� ������ 3'; Value: 1),
    (Name: '����� �������� ���� ������ 4'; Value: 1),
    (Name: '����� ����� ���� ������ 4'; Value: 1),
    (Name: '����� "�����"'; Value: 1),
    (Name: '����� ����� �����'; Value: 1),
    (Name: '����� �������� ������ �'; Value: 1),
    (Name: '����� ������� ������ �'; Value: 1),
    (Name: '����� ������ ������ �'; Value: 1),
    (Name: '����� ����� ������ �'; Value: 1),
    (Name: '����� �������� ������ �'; Value: 1),
    (Name: '����� ������� ������ �'; Value: 1),
    (Name: '����� ������ ������ �'; Value: 1),
    (Name: '����� ����� ������ �'; Value: 1),
    (Name: '����� �������� ������ �'; Value: 1),
    (Name: '����� ������� ������ �'; Value: 1),
    (Name: '����� ������ ������ �'; Value: 1),
    (Name: '����� ����� ������ �'; Value: 1),
    (Name: '����� �������� ������ �'; Value: 1),
    (Name: '����� ������� ������ �'; Value: 1),
    (Name: '����� ������ ������ �'; Value: 1),
    (Name: '����� ����� ������ �'; Value: 1),
    (Name: '����� "�����"'; Value: 1),
    (Name: '����� ����� �� ���������� ������'; Value: 1),
    (Name: '����� ������ � %'; Value: 1),
    (Name: '����� ����� ������'; Value: 1),
    (Name: '���������� �������� ������'; Value: 40),
    (Name: '���������� �������� ����� �����'; Value: 40),
    (Name: '���������� �������� ����� ��������'; Value: 40),
    (Name: '���������� �������� ����� ���� ������ 2'; Value: 40),
    (Name: '���������� �������� ����� ���� ������ 3'; Value: 40),
    (Name: '���������� �������� ����� ���� ������ 4'; Value: 40),
    (Name: '���������� �������� ����� �����'; Value: 40),
    (Name: '���������� �������� �������� ������ �'; Value: 40),
    (Name: '���������� �������� ������� ������ �'; Value: 40),
    (Name: '���������� �������� ������ ������ �'; Value: 40),
    (Name: '���������� �������� ����� ������ �'; Value: 40),
    (Name: '���������� �������� �������� ������ �'; Value: 40),
    (Name: '���������� �������� ������� ������ �'; Value: 40),
    (Name: '���������� �������� ������ ������ �'; Value: 40),
    (Name: '���������� �������� ����� ������ �'; Value: 40),
    (Name: '���������� �������� �������� ������ �'; Value: 40),
    (Name: '���������� �������� ������� ������ �'; Value: 40),
    (Name: '���������� �������� ������ ������ �'; Value: 40),
    (Name: '���������� �������� ����� ������ �'; Value: 40),
    (Name: '���������� �������� �������� ������ �'; Value: 40),
    (Name: '���������� �������� ������� ������ �'; Value: 40),
    (Name: '���������� �������� ������ ������ �'; Value: 40),
    (Name: '���������� �������� ����� ������ �'; Value: 40),
    (Name: '���������� �������� ����� �� ���������� ������'; Value: 40),
    (Name: '���������� �������� ������ � %'; Value: 40),
    (Name: '���������� �������� ����� ������'; Value: 40),
    (Name: '�������� ������'; Value: 1),
    (Name: '�������� "����"'; Value: 1),
    (Name: '�������� ����� �����'; Value: 10),
    (Name: '�������� "���������"'; Value: 2),
    (Name: '�������� ����� ��������'; Value: 20),
    (Name: '�������� �������� ���� ������ 2'; Value: 2),
    (Name: '�������� ����� ���� ������ 2'; Value: 20),
    (Name: '�������� �������� ���� ������ 3'; Value: 2),
    (Name: '�������� ����� ���� ������ 3'; Value: 20),
    (Name: '�������� �������� ���� ������ 4'; Value: 2),
    (Name: '�������� ����� ���� ������ 4'; Value: 20),
    (Name: '�������� "�����"'; Value: 1),
    (Name: '�������� ����� �����'; Value: 20),
    (Name: '�������� �������� ������ �'; Value: 1),
    (Name: '�������� ������� ������ �'; Value: 1),
    (Name: '�������� ������ ������ �'; Value: 1),
    (Name: '�������� ����� ������ �'; Value: 1),
    (Name: '�������� �������� ������ �'; Value: 1),
    (Name: '�������� ������� ������ �'; Value: 1),
    (Name: '�������� ������ ������ �'; Value: 1),
    (Name: '�������� ����� ������ �'; Value: 1),
    (Name: '�������� �������� ������ �'; Value: 1),
    (Name: '�������� ������� ������ �'; Value: 1),
    (Name: '�������� ������ ������ �'; Value: 1),
    (Name: '�������� ����� ������ �'; Value: 1),
    (Name: '�������� �������� ������ �'; Value: 1),
    (Name: '�������� ������� ������ �'; Value: 1),
    (Name: '�������� ������ ������ �'; Value: 1),
    (Name: '�������� ����� ������ �'; Value: 1),
    (Name: '�������� "�����"'; Value: 1),
    (Name: '�������� ����� �� ���������� ������'; Value: 20),
    (Name: '�������� ������ � %'; Value: 1),
    (Name: '�������� ����� ������'; Value: 20)
  );


{ TfmSlipClose }

procedure TfmSlipClose.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(vleParams.Cells[1, Row + 13]));
  end;

begin
  // �������� ���������
  Driver.OperationBlockFirstString := seCount.Value;
  Driver.Summ1 := GetCurrItem(C_Summ1);
  Driver.Summ2 := GetCurrItem(C_Summ2);
  Driver.Summ3 := GetCurrItem(C_Summ3);
  Driver.Summ4 := GetCurrItem(C_Summ4);
  Driver.DiscountOnCheck := GetFloatItem(C_DiscountOnCheck);
  Driver.StringForPrinting := VLE_GetPropertyValue(vleParams, C_StringForPrinting);
  Driver.Tax1 := VLE_GetPickPropertyValue(vleParams, C_Tax1);
  Driver.Tax2 := VLE_GetPickPropertyValue(vleParams, C_Tax2);
  Driver.Tax3 := VLE_GetPickPropertyValue(vleParams, C_Tax3);
  Driver.Tax4 := VLE_GetPickPropertyValue(vleParams, C_Tax4);
  // �������������� ���������
  Driver.StringQuantityinOperation := GetVal(0);
  Driver.TotalStringNumber := GetVal(1);
  Driver.TextStringNumber := GetVal(2);
  Driver.Summ1StringNumber := GetVal(3);
  Driver.Summ2StringNumber := GetVal(4);
  Driver.Summ3StringNumber := GetVal(5);
  Driver.Summ4StringNumber := GetVal(6);
  Driver.ChangeStringNumber := GetVal(7);
  Driver.Tax1TurnOverStringNumber := GetVal(8);
  Driver.Tax2TurnOverStringNumber := GetVal(9);
  Driver.Tax3TurnOverStringNumber := GetVal(10);
  Driver.Tax4TurnOverStringNumber := GetVal(11);
  Driver.Tax1SumStringNumber := GetVal(12);
  Driver.Tax2SumStringNumber := GetVal(13);
  Driver.Tax3SumStringNumber := GetVal(14);
  Driver.Tax4SumStringNumber := GetVal(15);
  Driver.SubTotalStringNumber := GetVal(16);
  Driver.DiscountOnCheckStringNumber := GetVal(17);
  Driver.TextFont := GetVal(18);
  Driver.TotalFont := GetVal(19);
  Driver.TotalSumFont := GetVal(20);
  Driver.Summ1NameFont := GetVal(21);
  Driver.Summ1Font := GetVal(22);
  Driver.Summ2NameFont := GetVal(23);
  Driver.Summ2Font := GetVal(24);
  Driver.Summ3NameFont := GetVal(25);
  Driver.Summ3Font := GetVal(26);
  Driver.Summ4NameFont := GetVal(27);
  Driver.Summ4Font := GetVal(28);
  Driver.ChangeFont := GetVal(29);
  Driver.ChangeSumFont := GetVal(30);
  Driver.Tax1NameFont := GetVal(31);
  Driver.Tax1TurnOverFont := GetVal(32);
  Driver.Tax1RateFont := GetVal(33);
  Driver.Tax1SumFont := GetVal(34);
  Driver.Tax2NameFont := GetVal(35);
  Driver.Tax2TurnOverFont := GetVal(36);
  Driver.Tax2RateFont := GetVal(37);
  Driver.Tax2SumFont := GetVal(38);
  Driver.Tax3NameFont := GetVal(39);
  Driver.Tax3TurnOverFont := GetVal(40);
  Driver.Tax3RateFont := GetVal(41);
  Driver.Tax3SumFont := GetVal(42);
  Driver.Tax4NameFont := GetVal(43);
  Driver.Tax4TurnOverFont := GetVal(44);
  Driver.Tax4RateFont := GetVal(45);
  Driver.Tax4SumFont := GetVal(46);
  Driver.SubTotalFont := GetVal(47);
  Driver.SubTotalSumFont := GetVal(48);
  Driver.DiscountOnCheckFont := GetVal(49);
  Driver.DiscountOnCheckSumFont := GetVal(50);
  Driver.TextSymbolNumber := GetVal(51);
  Driver.TotalSymbolNumber := GetVal(52);
  Driver.Summ1SymbolNumber := GetVal(53);
  Driver.Summ2SymbolNumber := GetVal(54);
  Driver.Summ3SymbolNumber := GetVal(55);
  Driver.Summ4SymbolNumber := GetVal(56);
  Driver.ChangeSymbolNumber := GetVal(57);
  Driver.Tax1NameSymbolNumber := GetVal(58);
  Driver.Tax1TurnOverSymbolNumber := GetVal(59);
  Driver.Tax1RateSymbolNumber := GetVal(60);
  Driver.Tax1SumSymbolNumber := GetVal(61);
  Driver.Tax2NameSymbolNumber := GetVal(62);
  Driver.Tax2TurnOverSymbolNumber := GetVal(63);
  Driver.Tax2RateSymbolNumber := GetVal(64);
  Driver.Tax2SumSymbolNumber := GetVal(65);
  Driver.Tax3NameSymbolNumber := GetVal(66);
  Driver.Tax3TurnOverSymbolNumber := GetVal(67);
  Driver.Tax3RateSymbolNumber := GetVal(68);
  Driver.Tax3SumSymbolNumber := GetVal(69);
  Driver.Tax4NameSymbolNumber := GetVal(70);
  Driver.Tax4TurnOverSymbolNumber := GetVal(71);
  Driver.Tax4RateSymbolNumber := GetVal(72);
  Driver.Tax4SumSymbolNumber := GetVal(73);
  Driver.SubTotalSymbolNumber := GetVal(74);
  Driver.DiscountOnCheckSymbolNumber := GetVal(75);
  Driver.DiscountOnCheckSumSymbolNumber := GetVal(76);
  Driver.TextOffset := GetVal(77);
  Driver.TotalOffset := GetVal(78);
  Driver.TotalSumOffset := GetVal(79);
  Driver.Summ1NameOffset := GetVal(80);
  Driver.Summ1Offset := GetVal(81);
  Driver.Summ2NameOffset := GetVal(82);
  Driver.Summ2Offset := GetVal(83);
  Driver.Summ3NameOffset := GetVal(84);
  Driver.Summ3Offset := GetVal(85);
  Driver.Summ4NameOffset := GetVal(86);
  Driver.Summ4Offset := GetVal(87);
  Driver.ChangeOffset := GetVal(88);
  Driver.ChangeSumOffset := GetVal(89);
  Driver.Tax1NameOffset := GetVal(90);
  Driver.Tax1TurnOverOffset := GetVal(91);
  Driver.Tax1RateOffset := GetVal(92);
  Driver.Tax1SumOffset := GetVal(93);
  Driver.Tax2NameOffset := GetVal(94);
  Driver.Tax2TurnOverOffset := GetVal(95);
  Driver.Tax2RateOffset := GetVal(96);
  Driver.Tax2SumOffset := GetVal(97);
  Driver.Tax3NameOffset := GetVal(98);
  Driver.Tax3TurnOverOffset := GetVal(99);
  Driver.Tax3RateOffset := GetVal(100);
  Driver.Tax3SumOffset := GetVal(101);
  Driver.Tax4NameOffset := GetVal(102);
  Driver.Tax4TurnOverOffset := GetVal(103);
  Driver.Tax4RateOffset := GetVal(104);
  Driver.Tax4SumOffset := GetVal(105);
  Driver.SubTotalOffset := GetVal(106);
  Driver.SubTotalSumOffset := GetVal(107);
  Driver.DiscountOnCheckOffset := GetVal(108);
  Driver.DiscountOnCheckSumOffset := GetVal(109);
end;

procedure TfmSlipClose.btnCloseCheckOnSlipDocumentClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.CloseCheckOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.StringQuantityinOperation;
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipClose.UpdatePage;
begin
  seCount.Value := Driver.OperationBlockFirstString;
end;

procedure TfmSlipClose.btnStandardCloseCheckOnSlipDocumentClick(Sender: TObject);
var
  Count: Integer;
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.StandardCloseCheckOnSlipDocument);
    Count := Driver.OperationBlockFirstString;
    Count := Count + Driver.ReadTableDef(14,1,1,17);
    Driver.OperationBlockFirstString := Count;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipClose.Initialize;
var
  i: Integer;
begin
  VLE_AddSeparator(vleParams, '��������');
  for i := Low(CloseSlipParams) to High(CloseSlipParams) do
    VLE_AddProperty(vleParams, CloseSlipParams[i].Name, IntToStr(CloseSlipParams[i].Value));
  for i := 1 to 4 do
    VLE_AddPickProperty(vleParams, Format('%s %d', [C_Tax, i]), '���',
      ['���', '1 ������', '2 ������', '3 ������', '4 ������'], [0, 1, 2, 3, 4]);
  VLE_AddProperty(vleParams, C_StringForPrinting, '������ ��� ������');
  VLE_AddSeparator(vleParams, '��������������');
  for i := Low(CloseSlipExParams) to High(CloseSlipExParams) do
    VLE_AddProperty(vleParams, CloseSlipExParams[i].Name, IntToStr(CloseSlipExParams[i].Value));
  // ���� ���� ��������� ���������, ���������� �� � �������
  if TestParams.ParamsLoaded then
    StringToVLEParams(vleParams, TestParams.SlipClose.Text)
  else
    TestParams.SlipClose.Text := VLEParamsToString(vleParams);
end;

function TfmSlipClose.LoadFromTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 14;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Result := Driver.ReadTable;
      if Result = 0 then
        vleParams.Cells[1, i + 12] := IntToSTr(Driver.ValueOfFieldInteger);
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipClose.vleParamsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  VLE_DrawCell(Sender, ACol, ARow, Rect, State);
end;

procedure TfmSlipClose.btnLoadFromTablesClick(Sender: TObject);
begin
  Check(LoadFromTables);
end;

procedure TfmSlipClose.btnDefaultValuesClick(Sender: TObject);
begin
  vleParams.Strings.Text := '';
  Initialize;
end;

procedure TfmSlipClose.btnSaveToTablesClick(Sender: TObject);
begin
  Check(SaveToTables);
end;

function TfmSlipClose.SaveToTables: Integer;
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.TableNumber := 14;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    Driver.RowNumber := 1;
    for i := 1 to Driver.FieldNumber do
    begin
      Driver.FieldNumber := i;
      Driver.ValueOfFieldInteger := StrToInt(vleParams.Cells[1, i + 12]);
      Result := Driver.WriteTable;
      if Result <> 0 then Exit;
    end;
    Updatepage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSlipClose.vleParamsSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  TestParams.SlipClose.Text := VLEParamsToString(vleParams);
end;

procedure TfmSlipClose.FormResize(Sender: TObject);
begin
  if vleParams.Width > 392 then
    vleParams.DisplayOptions := vleParams.DisplayOptions + [doAutoColResize]
  else
    vleParams.DisplayOptions := vleParams.DisplayOptions - [doAutoColResize];
end;

function TfmSlipClose.GetFloatItem(const AName: string): Double;
begin
  Result := StrToFloat(VLE_GetPropertyValue(vleParams, AName));
end;

function TfmSlipClose.GetCurrItem(const AName: string): Currency;
begin
  Result := StrToCurr(VLE_GetPropertyValue(vleParams, AName));
end;

end.
