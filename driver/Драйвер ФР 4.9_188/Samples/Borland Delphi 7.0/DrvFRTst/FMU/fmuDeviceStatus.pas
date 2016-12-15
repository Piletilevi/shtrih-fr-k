unit fmuDeviceStatus;

interface

uses
  // VCL
  Windows, Forms, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Messages,
  Buttons, Dialogs, Variants,
  // This
  untPages, untUtil, untDriver, DrvFRLib_TLB, GlobalConst;

type
  { TfmDeviceStatus }

  TfmDeviceStatus = class(TPage)
    Memo: TMemo;
    btnEcrStatus: TButton;
    btnShortEcrStatus: TButton;
    btnDeviceMetrics: TButton;
    btnResetPrinter: TButton;
    btnGetModelParams: TButton;
    btnDriverVersion: TButton;
    procedure btnEcrStatusClick(Sender: TObject);
    procedure btnShortEcrStatusClick(Sender: TObject);
    procedure btnDeviceMetricsClick(Sender: TObject);
    procedure btnResetPrinterClick(Sender: TObject);
    procedure btnGetModelParamsClick(Sender: TObject);
    procedure btnDriverVersionClick(Sender: TObject);
  private
    procedure AddDeviceFlags;
    procedure AddSeparator;
    procedure AddLine(V1, V2: Variant);
    procedure AddMemoLine(const S: string);
    procedure AddBool(const ValueName: string; Value: Boolean);
    procedure AddLineWidth(V1, V2: Variant; TextWidth: Integer);
  end;

implementation

{$R *.DFM}

{ TfmDeviceStatus }

const
  DescriptionWidth = 33;

procedure TfmDeviceStatus.AddMemoLine(const S: string);
begin
  Memo.Lines.Add(' ' + S);
end;

procedure TfmDeviceStatus.AddLineWidth(V1, V2: Variant; TextWidth: Integer);
begin
  AddMemoLine(Format('%-*s: %s', [TextWidth, String(V1), String(V2)]));
end;

procedure TfmDeviceStatus.AddLine(V1, V2: Variant);
begin
  AddLineWidth(V1, V2, 24);
end;

procedure TfmDeviceStatus.AddBool(const ValueName: string; Value: Boolean);
const
  BoolToStr: array [Boolean] of string = ('[���]', '[��]');
begin
  AddLineWidth(ValueName, BoolToStr[Value], DescriptionWidth);
end;

procedure TfmDeviceStatus.AddSeparator;
begin
  AddMemoLine(StringOfChar('-', 40));
end;

procedure TfmDeviceStatus.AddDeviceFlags;
begin
  AddSeparator;
  AddLine('����� ' + DeviceName, Format('%.4xh, %d', [Driver.ECRFlags, Driver.ECRFlags]));
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

procedure TfmDeviceStatus.btnEcrStatusClick(Sender: TObject);
begin
  EnableButtons(False);
  Memo.Lines.BeginUpdate;
  try
    Memo.Clear;
    if Driver.GetECRStatus <> 0 then Exit;

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
    AddLine('��������', Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
    AddLine('������ ������', Driver.ECRModeStatus);
    AddLine('����� ��� � ����', Driver.LogicalNumber);
    AddLine('����� ���������', Driver.OpendocumentNumber);
    AddLine('����� �����', Driver.PortNumber);
    AddLine('���������� ������������', Driver.RegistrationNumber);
    AddLine('�������� ������������', Driver.FreeRegistration);
    AddLine('��������� �������� �����', Driver.SessionNumber);
    AddLine('��������� ������� � ��', Driver.FreeRecordInFM);
    AddLine('����', Driver.Date);
    AddLine('�����', Driver.Time);
    AddLine('��������� �����', GetSerialNumber(Driver.SerialNumber));
    AddLine('���', GetINN(Driver.INN));
    // �����
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
    AddBool('��2 ����', Driver.FM2IsPresent);
    AddBool('��1 ����', Driver.FM1IsPresent);
    AddSeparator;
    // ������������ Memo �� ������
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    Memo.Lines.EndUpdate;
    EnableButtons(True);
  end;
end;

procedure TfmDeviceStatus.btnShortEcrStatusClick(Sender: TObject);
begin
  EnableButtons(False);
  Memo.Lines.BeginUpdate;
  try
    Memo.Clear;
    if Driver.GetShortECRStatus <> 0 then Exit;

    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(' ������� ������ ���������:');
    AddSeparator;
    Memo.Lines.Add(' �����:');
    Memo.Lines.Add(Format(' %d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
    AddSeparator;
    AddLine('��������', Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
    AddLine('������ ������', Driver.ECRModeStatus);
    AddLine('���������� �������� � ����', Driver.QuantityOfOperations);
    AddLine('���������� �������, �', Driver.BatteryVoltage);
    AddLine('���������� ���������, �', Driver.PowerSourceVoltage);
    AddLine('������ ��', Driver.FMResultCode);
    AddLine('������ ����', Driver.EKLZResultCode);
    // ����� ��������
    AddDeviceFlags;
    AddSeparator;
    // ������������ Memo �� ������
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    Memo.Lines.EndUpdate;
    EnableButtons(True);
  end;
end;

procedure TfmDeviceStatus.btnDeviceMetricsClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    if Driver.GetDeviceMetrics <> 0 then Exit;

    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(' ��������� ��������:');
    AddSeparator;
    Memo.Lines.Add(' ������� ��������    : '+ IntToStr(Driver.UCodePage));
    Memo.Lines.Add(' �������� ���������� : '+ Driver.UDescription);
    Memo.Lines.Add(' ������ ���������    : '+ IntToStr(Driver.UMajorProtocolVersion));
    Memo.Lines.Add(' ��������� ��������� : '+ IntToStr(Driver.UMinorProtocolVersion));
    Memo.Lines.Add(' ��� ����������      : '+ IntToStr(Driver.UMajorType));
    Memo.Lines.Add(' ������ ����������   : '+ IntToStr(Driver.UMinorType));
    Memo.Lines.Add(' ������ ����������   : '+ IntToStr(Driver.UModel));
  finally
    EnableButtons(True);
  end;
end;

procedure TfmDeviceStatus.btnResetPrinterClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    repeat
      // ������ ���������
      if Driver.UModel > 2 then
        Check(Driver.GetShortECRStatus)
      else
        Check(Driver.GetECRStatus);
      case Driver.ECRAdvancedMode of
        0:
          begin
            case Driver.ECRMode of
              1: Check(Driver.InterruptDataStream);
              5: begin
                   ShowMessage('������� ������������ ��-�� ����� ������������� ' +
                     '������ ���������� ����������');
                   Exit;
                 end;
              6: Check(Driver.ConfirmDate);
              8: Check(Driver.CancelCheck);
              9: begin
                   ShowMessage('������� ��������� � ������ ���������������� ���������');
                   Exit;
                 end;
              10: Check(Driver.InterruptTest);
              11, 12, 14: Sleep(1000);
            else
              Exit;
            end;
          end;
        3: Check(Driver.ContinuePrint);
        4, 5: Sleep(1000);
      else
        Break;
      end;
    until false;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmDeviceStatus.btnGetModelParamsClick(Sender: TObject);

  procedure AddLine(V1, V2: Variant);
  const
    BoolToStr: array [Boolean] of string = ('[���]', '[��]');
  begin
    if VarType(V2) = varBoolean then
      AddLineWidth(V1, BoolToStr[Boolean(V2)], 44)
    else
      AddLineWidth(V1, V2, 44);
  end;

var
  i: Integer;
begin
  EnableButtons(False);
  Memo.Lines.BeginUpdate;
  try
    Memo.Clear;
    if Driver.GetDeviceMetrics <> 0 then Exit;
    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(' ��������� ������:');
    AddSeparator;

    for i := 1 to 26 do
    begin
      Driver.ModelParamNumber := i;
      if Driver.ReadModelParamValue <> 0 then Exit;
      if Driver.ReadModelParamDescription <> 0 then Exit;
      AddLine(Driver.ModelParamDescription, Driver.ModelParamValue);
    end;

  finally
    EnableButtons(True);
    Memo.Lines.EndUpdate;
  end;
end;

procedure TfmDeviceStatus.btnDriverVersionClick(Sender: TObject);
begin
  EnableButtons(False);
  Memo.Lines.BeginUpdate;
  try
    Memo.Clear;
    Memo.Lines.Add('');
    AddSeparator;
    Memo.Lines.Add(' ������ ��������:');
    AddSeparator;
    AddLineWidth('������', Driver.DriverMajorVersion, 14);
    AddLineWidth('���������', Driver.DriverMinorVersion, 14);
    AddLineWidth('�����', Driver.DriverRelease, 14);
    AddLineWidth('������', Driver.DriverBuild, 14);
    AddLineWidth('������ ������', Driver.DriverVersion, 14);
  finally
    EnableButtons(True);
    Memo.Lines.EndUpdate;
  end;
end;

end.
