unit fmuDocCcEx;

interface

uses
  // VCL
  Classes, Controls, Grids, SysUtils, ExtCtrls, StdCtrls,
  // This
  untPages, untTypes, untDriver;

type
  { TfmDocCcEx }

  TfmDocCcEx = class(TPage)
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
  CloseCheckSlipEx: array[0..109] of TIntParam = (
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

{ TfmDocCcEx }

constructor TfmDocCcEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

procedure TfmDocCcEx.Initialize;
var
  i: Integer;
begin
  Grid.RowCount := 110;
  for i := Low(CloseCheckSlipEx) to High(CloseCheckSlipEx) do
  begin
    Grid.Cells[0,i] := CloseCheckSlipEx[i].Name;
    Grid.Cells[1,i] := IntToStr(CloseCheckSlipEx[i].Value);
  end;
end;

procedure TfmDocCcEx.UpdateObject;

  function GetVal(Row: Integer): Integer;
  begin
    Result := StrToInt(Trim(Grid.Cells[1,Row]));
  end;

begin
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

function TfmDocCcEx.LoadDefaults: Boolean;
var
  i: Integer;
begin
  Driver.TableNumber := 14;
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


procedure TfmDocCcEx.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.CloseCheckOnSlipDocument;
  if ResultCode = 0 then Count := Count + Driver.StringQuantityinOperation;
end;

procedure TfmDocCcEx.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.75*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.25*(Grid.Width-24));
end;

end.
