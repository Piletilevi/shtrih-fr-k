unit fmuFullStatus;

interface

uses
  // VCL
  Windows, Forms, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Messages,
  Buttons, Dialogs,
  // This
  untPages, untUtil, untDriver, untTypes, GlobalConst;

type
  { TfmFullStatus }

  TfmFullStatus = class(TPage)
    Memo: TMemo;
    btnFullEcrStatus: TButton;
    btnSaveToFile: TBitBtn;
    dlgSave: TSaveDialog;
    btnInterrupt: TButton;
    procedure btnFullEcrStatusClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInterruptClick(Sender: TObject);
  private
    FStop: Boolean;
    procedure AddTables;
    procedure AddSeparator;
    procedure AddDeviceFlags;
    procedure AddFullStatus;
    procedure AddShortStatus;
    procedure AddDeviceMetrics;
    procedure AddCashTotalizers;
    procedure AddWorkTotalizers;
    procedure AddLine(V1, V2: Variant);
    procedure Check2(AResultCode: Integer);
    procedure AddMemoLine(const S: string);
    procedure AddBool(const ValueName: string; Value: Boolean);
    procedure AddLineWidth(V1, V2: Variant; TextWidth: Integer);
  end;

  { EStopException }

  EStopException = class(Exception);

implementation

{$R *.DFM}

{ TfmFullStatus }

const
  DescriptionWidth = 33;

procedure TfmFullStatus.AddMemoLine(const S: string);
begin
  Memo.Lines.Add(' ' + S);
end;

procedure TfmFullStatus.AddLineWidth(V1, V2: Variant; TextWidth: Integer);
begin
  AddMemoLine(Format('%-*s: %s', [TextWidth, String(V1), String(V2)]));
end;

procedure TfmFullStatus.AddLine(V1, V2: Variant);
begin
  AddLineWidth(V1, V2, 24);
end;

procedure TfmFullStatus.AddBool(const ValueName: string; Value: Boolean);
const
  BoolToStr: array [Boolean] of string = ('[���]', '[��]');
begin
  AddLineWidth(ValueName, BoolToStr[Value], DescriptionWidth);
end;

procedure TfmFullStatus.AddSeparator;
begin
  AddMemoLine(StringOfChar('-', 52));
end;

procedure TfmFullStatus.AddDeviceFlags;
begin
  AddSeparator;
  AddLine('�����', Format('%.4xh, %d', [Driver.ECRFlags, Driver.ECRFlags]));
  AddSeparator;
  AddBool('����������� �������� ����������', Driver.QuantityPointPosition);
  AddBool('������ �� ������ �� ����������', Driver.PresenterOut);
  AddBool('������ �� ����� � ����������', Driver.PresenterIn);
  AddBool('���� ����� ���������', Driver.IsEKLZOverflow);
  AddBool('�������� ���� ������', Driver.IsDrawerOpen);
  AddBool('������ ������� �������', Driver.LidPositionSensor);
  AddBool('����� ������������ ���� ������', Driver.ReceiptRibbonLever);
  AddBool('����� ������������ ������� ������', Driver.JournalRibbonLever);
  AddBool('���������� ������ ����', Driver.ReceiptRibbonOpticalSensor);
  AddBool('���������� ������ �������', Driver.JournalRibbonOpticalSensor);
  AddBool('���� ����', Driver.EKLZIsPresent);
  AddBool('2 ����� ����� ������� � ����', Driver.PointPosition);
  AddBool('������ ������ ��', Driver.SlipDocumentIsPresent);
  AddBool('������� ������ ��', Driver.SlipDocumentIsMoving);
  AddBool('����� ������� �����', Driver.ReceiptRibbonIsPresent);
  AddBool('����� ����������� �����', Driver.JournalRibbonIsPresent);
end;

procedure TfmFullStatus.AddFullStatus;
begin
  Check2(Driver.GetDeviceMetrics);
  Check2(Driver.GetECRStatus);

  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' ������ ���������:');
  AddSeparator;
  Memo.Lines.Add(' �����: ');
  Memo.Lines.Add(' ' + Format('%d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
  // �� ��������
  AddSeparator;
  AddLine('������ ��', Driver.ECRSoftVersion);
  AddLine('������ ��', Driver.ECRBuild);
  AddLine('���� ��', Driver.ECRSoftDate);
  // �� ��
  AddSeparator;
  AddLine('������ �� ��', Driver.FMSoftVersion);
  AddLine('������ �� ��', Driver.FMBuild);
  AddLine('���� �� ��', Driver.FMSoftDate);
  // ������
  AddSeparator;
  AddLine('�������� ' + DeviceName, Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
  AddLine('������ ������', Driver.ECRModeStatus);
  AddLine('����� � ����', Driver.LogicalNumber);
  AddLine('����� ���������', Driver.OpendocumentNumber);
  AddLine('���� ' + DeviceName, Driver.PortNumber);
  AddLine('���������� ������������', Driver.RegistrationNumber);
  AddLine('�������� ������������', Driver.FreeRegistration);
  AddLine('��������� �������� �����', Driver.SessionNumber);
  AddLine('��������� ������� � ��', Driver.FreeRecordInFM);
  AddLine('����', Driver.Date);
  AddLine('�����', Driver.Time);
  AddLine('��������� �����', GetSerialNumber(Driver.SerialNumber));
  AddLine('���', GetINN(Driver.INN));
  // ����� ����������
  AddDeviceFlags;
  // ����� ��
  AddSeparator;
  AddLine('����� ��', Format('%.2xh, %d', [Driver.FMFlags, Driver.FMFlags]));
  AddSeparator;
  AddBool('24 ���� � �� ���������', Driver.IsFM24HoursOver);
  AddBool('����� � �� �������', Driver.IsFMSessionOpen);
  AddBool('��������� ������ � �� ����������', Driver.IsLastFMRecordCorrupted);
  AddBool('������� �� �������� ����� 80 %', Driver.IsBatteryLow);
  AddBool('������������ ��', Driver.FMOverflow);
  AddBool('�������� �������', Driver.LicenseIsPresent);
  AddBool('�� 2 ����', Driver.FM2IsPresent);
  AddBool('�� 1 ����', Driver.FM1IsPresent);
  AddSeparator;
  // ������������ Memo �� ������
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmFullStatus.AddShortStatus;
begin
  Check2(Driver.GetDeviceMetrics);
  Check2(Driver.GetShortECRStatus);
  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' ������� ������ ���������:');
  AddSeparator;
  Memo.Lines.Add(' �����:');
  Memo.Lines.Add(Format(' %d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
  AddSeparator;
  AddLine('�������� ' + DeviceName, Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
  AddLine('������ ������', Driver.ECRModeStatus);
  AddLine('���������� �������� � ����', Driver.QuantityOfOperations);
  AddLine('���������� �������, �', Driver.BatteryVoltage);
  AddLine('���������� ���������, �', Driver.PowerSourceVoltage);
  AddLine('������ ��', Driver.FMResultCode);
  AddLine('������ ����', Driver.EKLZResultCode);
  // ����� ����������
  AddDeviceFlags;
  AddSeparator;
  // ������������ Memo �� ������
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmFullStatus.AddDeviceMetrics;
begin
  Check2(Driver.GetDeviceMetrics);

  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' ��������� ����������:');
  AddSeparator;
  Memo.Lines.Add(' ������� ��������    : '+ IntToStr(Driver.UCodePage));
  Memo.Lines.Add(' �������� ���������� : '+ Driver.UDescription);
  Memo.Lines.Add(' ������ ���������    : '+ IntToStr(Driver.UMajorProtocolVersion));
  Memo.Lines.Add(' ��������� ��������� : '+ IntToStr(Driver.UMinorProtocolVersion));
  Memo.Lines.Add(' ��� ����������      : '+ IntToStr(Driver.UMajorType));
  Memo.Lines.Add(' ������ ����������   : '+ IntToStr(Driver.UMinorType));
  Memo.Lines.Add(' ������ ����������   : '+ IntToStr(Driver.UModel));
end;

procedure TfmFullStatus.btnFullEcrStatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    FStop := False;
    btnInterrupt.Enabled := True;
    Memo.Clear;
    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(' ������ ���������');
    AddSeparator;
    try
      AddFullStatus;
      AddShortStatus;
      AddDeviceMetrics;
      AddTables;
      AddCashTotalizers;
      AddWorkTotalizers;
      AddSeparator;
      // ������������ Memo �� ������
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on E: EAbort do
        Memo.Lines.Add(Format('<�������� � ����� � �������: %d (%s)>', [Driver.ResultCode, Driver.ResultCodeDescription]));
      on E: EStopException do
        Memo.Lines.Add(E.Message)
    end;
  finally
    EnableButtons(True);
    FStop := True;
  end;
end;

procedure TfmFullStatus.btnSaveToFileClick(Sender: TObject);
begin
  if not dlgSave.Execute then Exit;
  Memo.Lines.SaveToFile(dlgSave.FileName);
end;

procedure TfmFullStatus.AddCashTotalizers;

  procedure AddCaption(S: string);
  begin
    Memo.Lines.Add('');
    Memo.Lines.Add(S);
    Memo.Lines.Add(' ' + StringOfChar('-', 52));
  end;

  procedure AddCashRegisters(S: string; L: Integer; H: Integer);
  var
    i: Integer;
    RegisterName: string;
  begin
    AddCaption(S);
    for i := L to H do
    begin
      Driver.RegisterNumber := i;
      Check2(Driver.GetCashReg);

      if i in [0..High(CashRegisterName)] then
        RegisterName := CashRegisterName[i]
      else
        RegisterName := '';

      Memo.Lines.Add(Format(' %3d.%-44s : %s',
        [i+1, RegisterName, CurrToStr(Driver.ContentsOfCashRegister)]))
    end;
  end;

begin
  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' �������� ��������:');
  AddSeparator;
  AddCashRegisters(' ����������:', $00, $57);
  AddCashRegisters(' ������ ��:', $58, $67);
  AddCashRegisters(' ���������� ��:', $68, $77);
  AddCashRegisters(' ����������:', $78, $78);
  AddCashRegisters(' ����������:', $79, $D0);
  AddCashRegisters(' ������ ��:', $D1, $E0);
  AddCashRegisters(' ���������� ��:', $E1, $F0);
  AddCashRegisters(' ����������:', $F1, $F3);
  AddCashRegisters(' ������������ �����:', $F4, $F4);
  AddCashRegisters(' �����:', $F5, $F8);
end;

procedure TfmFullStatus.AddWorkTotalizers;

  procedure AddCaption(S: string);
  begin
    Memo.Lines.Add('');
    Memo.Lines.Add(S);
    Memo.Lines.Add(' ' + StringOfChar('-', 52));
  end;

  procedure AddOperationRegisters(S: string; L: Integer; H: Integer);
  var
    i: Integer;
    RegisterName: string;
  begin
    AddCaption(S);
    for i := L to H do
    begin
      Driver.RegisterNumber := i;
      Check2(Driver.GetOperationReg);
      if i in [0..High(OperationRegisterName)] then
        RegisterName := OperationRegisterName[i]
      else
        RegisterName := '';

      Memo.Lines.Add(Format(' %3d.%-44s : %s',
        [i+1, RegisterName, CurrToStr(Driver.ContentsOfOperationRegister)]))
    end;
  end;

begin
  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' ������������ ��������:');
  AddSeparator;
  AddOperationRegisters(' ����������:', $00, $93);
  AddOperationRegisters(' �����:', $94, $97);
  AddOperationRegisters(' �������� �����', $98, $98);
  AddOperationRegisters(' ����������:', $99, $9A);
  AddOperationRegisters(' �����:', $9B, $9C);
  AddOperationRegisters(' ����������:', $9D, $9D);
  AddOperationRegisters(' �����:', $9E, $A5);
  AddOperationRegisters(' ����������:', $A6, $A8);
  AddOperationRegisters(' ���������� ������� ��:', $A9, $B0);
  AddOperationRegisters(' ���������� :', $B1, $B1);
  AddOperationRegisters(' ����� ������ �� :', $B2, $B2);
end;

procedure TfmFullStatus.AddTables;

  function AddTable(ATableNumber: Integer): Integer;
  var
    Row: Integer;
    Field: Integer;
    RowN: Integer;
    FieldN: Integer;
    FieldName: string;
  begin
    Check2(0);
    Driver.TableNumber := ATableNumber;
    Result := Driver.GetTableStruct;
    if Result <> 0 then Exit;
    RowN := Driver.RowNumber;
    FieldN := Driver.FieldNumber;
    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(Format(' ������� %d. %s. �����:%d �����:%d',
      [Driver.TableNumber, Driver.TableName, RowN, FieldN]));
    Memo.Lines.Add(' ���.����. ������������:��������');
    AddSeparator;
    Driver.TableNumber := ATableNumber;
    Result := Driver.GetTableStruct;
    if (Result <> 0) then Exit;
    RowN := Driver.RowNumber;
    FieldN := Driver.FieldNumber;
    for  Row := 1 to RowN do
    begin
      Driver.RowNumber := Row;
      for Field := 1 to FieldN do
      begin
        Check2(0);
        Driver.FieldNumber := Field;
        Result := Driver.GetFieldStruct;
        if Result <> 0 then Exit;
        FieldName := Driver.FieldName;
        Result := Driver.ReadTable;
        if Result <> 0 then Exit;
        Memo.Lines.Add(Format(' %.2d.%.2d. %s:%s', [Row, Field, FieldName, Driver.ValueOfFieldString]));
        Driver.FieldName;
      end;
      AddSeparator;
    end;
  end;

var
  i: Integer;
  Res: Integer;
begin
  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' �������:');
  AddSeparator;
  i := 1;
  Res := 0;
  while True do
  begin
    Res := AddTable(i);
    if (Res <> 0) then
      Break;
    Inc(i);
  end;
  if Res = $5D then
    Res := 0;
  Check(Res);
end;

procedure TfmFullStatus.FormCreate(Sender: TObject);
begin
  FStop := False;
end;

procedure TfmFullStatus.btnInterruptClick(Sender: TObject);
begin
  FStop := True;
end;

procedure TfmFullStatus.Check2(AResultCode: Integer);
begin
  Application.ProcessMessages;
  if FStop then raise EStopException.Create('<�������� �������������>');
  Check(AResultCode);
end;

end.

