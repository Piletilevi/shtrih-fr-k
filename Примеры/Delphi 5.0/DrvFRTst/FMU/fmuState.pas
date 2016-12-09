unit fmuState;

interface

uses
  // VCL
  Windows, Forms, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Messages,
  Buttons,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmState = class(TPage)
    Memo: TMemo;
    btnShortECRState: TButton;
    btnECRState: TButton;
    procedure btnECRStateClick(Sender: TObject);
    procedure btnShortECRStateClick(Sender: TObject);
    procedure btnECRFlagsClick(Sender: TObject);
  private
    procedure ShowECRFlags;
    procedure ShowFMFlags;
  end;

implementation

{$R *.DFM}

function BoolToStr(Value: Boolean): string;
begin
  if Value then Result := '[x]'
  else Result := '[ ]';
end;

{ TfmState }

procedure TfmState.ShowECRFlags;

  function GetECRFlagStr(NBit: Integer): string;
  begin
    case NBit of
      0: Result := BoolToStr(Driver.JournalRibbonIsPresent);
      1: Result := BoolToStr(Driver.ReceiptRibbonIsPresent);
      2: Result := BoolToStr(Driver.SlipDocumentIsMoving);
      3: Result := BoolToStr(Driver.SlipDocumentIsPresent);
      4: Result := BoolToStr(Driver.PointPosition);
      5: Result := BoolToStr(Driver.EKLZIsPresent);
      6: Result := BoolToStr(Driver.JournalRibbonOpticalSensor);
      7: Result := BoolToStr(Driver.ReceiptRibbonOpticalSensor);
      8: Result := BoolToStr(Driver.JournalRibbonLever);
      9: Result := BoolToStr(Driver.ReceiptRibbonLever);
      10: Result := BoolToStr(Driver.LidPositionSensor);
      11: Result := BoolToStr(Driver.isDrawerOpen);
      12: Result := BoolToStr(Driver.isPrinterRightSensorFailure);
      13: Result := BoolToStr(Driver.isPrinterLeftSensorFailure);
      14: Result := BoolToStr(Driver.IsEKLZOverflow);
      15: Result := BoolToStr(Driver.QuantityPointPosition);
      16: Result := BoolToStr(Driver.PresenterIn);
      17: Result := BoolToStr(Driver.PresenterOut);
      else Result := '������������ ����� ����';
    end;
  end;

  procedure AddBt(NBit: Integer; BitName: string);
  begin
    Memo.Lines.Add(#9+GetECRFlagStr(NBit)+' '+BitName);
  end;

begin
  AddBt(0, '����� ������������� �������');
  AddBt(1, '����� ������� �����');
  AddBt(2, '������� ������ ��');
  AddBt(3, '������ ������ ��');
  AddBt(4, '��������� ���������� �����: 2 �����');
  AddBt(5, '���� ����');
  AddBt(6, '���������� ������ ������������� �������');
  AddBt(7, '���������� ������ ������� �����');
  AddBt(8, '����� ������������ ������������� ������� ������');
  AddBt(9, '����� ������������ ������� ����� ������');
  AddBt(10, '������ ������� �� �������');
  AddBt(11, '�������� ���� ������');
  AddBt(12, '����� ������� ������� ��������');
  AddBt(13, '����� ������ ������� ��������');
  AddBt(14, '���� ����� ���������');
  AddBt(15, '����������� �������� ����������');
  AddBt(16, '������ �� ����� � ����������');
  AddBt(17, '������ �� ������ �� ����������');
end;



procedure TfmState.btnECRStateClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    ResultCode := Driver.GetECRStatus;
    UpdatePage;

    if ResultCode = 0 then
    begin
      with Memo do
      begin
        Lines.Add('');
        Lines.Add(Format('  1. ����� ��%s:  %s, %s', [#9#9#9#9, Driver.ECRMode, Driver.ECRModeDescription]));
        Lines.Add(Format('  2. �������� ��%s:  %s, %s', [#9#9#9#9, Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
        Lines.Add(Format('  3. ������ ������%s:  %s', [#9#9#9#9, Driver.ECRModeStatus]));
        Lines.Add(Format('  4.  ����� ��� � ����%s:  %s', [#9#9#9, Driver.LogicalNumber]));
        Lines.Add(Format('  5.  ����� ���������%s:  %s', [#9#9#9, Driver.OpendocumentNumber]));
        Lines.Add(Format('  6.  ���� ��%s:  %s', [#9#9#9#9, Driver.PortNumber]));
        Lines.Add(Format('  7.  ���������� ������������%s:  %s', [#9#9, Driver.RegistrationNumber]));
        Lines.Add(Format('  8.  ���������� ���������� ������������%s:  %s', [#9, Driver.FreeRegistration]));
        Lines.Add(Format('  9.  ��������� �������� �����%s:  %s', [#9#9, Driver.SessionNumber]));
        Lines.Add(Format('  10. ��������� ������� � ��%s:  %s', [#9#9, Driver.FreeRecordInFM]));
        Lines.Add(Format('  11. ����%s:  %s', [#9#9#9#9, Driver.Date]));
        Lines.Add(Format('  12. �����%s:  %s', [#9#9#9#9, Driver.Time]));
        Lines.Add(Format('  13. ��������� �����%s:  %s', [#9#9#9, GetSerialNumber(Driver.SerialNumber)]));
        Lines.Add(Format('  14. ���%s:  %s', [#9#9#9#9, GetINN(Driver.INN)]));
        Lines.Add('  15. �� ��');
        Lines.Add(Format('          ������%s:  %s', [#9#9#9#9, Driver.ECRSoftVersion]));
        Lines.Add(Format('          ������%s:  %s', [#9#9#9#9, Driver.ECRBuild]));
        Lines.Add(Format('          ����%s:  %s', [#9#9#9#9, Driver.ECRSoftDate]));
        Lines.Add('  16. �� ��');
        Lines.Add(Format('          ������%s:  %s', [#9#9#9#9, Driver.FMSoftVersion]));
        Lines.Add(Format('          ������%s:  %s', [#9#9#9#9, Driver.FMBuild]));
        Lines.Add(Format('          ����%s:  %s', [#9#9#9#9, Driver.FMSoftDate]));
        Lines.Add(Format('  17. ����� �� (%s)', [Driver.ECRFlags]));
        ShowECRFlags;
        Lines.Add(Format('  18. ����� �� (%s)', [Driver.FMFlags]));
        ShowFMFlags;
        // ������������ Memo �� ������
        SelStart := 0;
        SelLength := 0;
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState.btnShortECRStateClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    ResultCode := Driver.GetShortECRStatus;
    UpdatePage;

    if ResultCode = 0 then
    begin
      with Memo do
      begin
        Lines.Add('');
        Lines.Add(Format('  1. ����� ��%s:  %s, %s', [#9#9#9, Driver.ECRMode, Driver.ECRModeDescription]));
        Lines.Add(Format('  2. �������� ��%s:  %s, %s', [#9#9#9, Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
        Lines.Add(Format('  3. ������ ������%s:  %s', [#9#9#9, Driver.ECRModeStatus]));
        Lines.Add(Format('  4. ���������� �������� � ����%s:  %s', [#9, Driver.QuantityOfOperations]));
        Lines.Add(Format('  5. ���������� �������%s:  %s �', [#9#9, Driver.BatteryVoltage]));
        Lines.Add(Format('  6. ���������� ��������� �������%s:  %s �', [#9, Driver.PowerSourceVoltage]));
        Lines.Add(Format('  7. ������ ��%s:  %s', [#9#9#9, Driver.FMResultCode]));
        Lines.Add(Format('  8. ������ ����%s:  %s', [#9#9#9, Driver.EKLZResultCode]));
        Lines.Add(Format('  9. ����� �� (%s)', [Driver.ECRFlags]));
        ShowECRFlags;
        // ������������ Memo �� ������
        SelStart := 0;
        SelLength := 0;
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState.btnECRFlagsClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    ResultCode := Driver.GetECRStatus;
    UpdatePage;
    if ResultCode = 0 then
      ShowECRFlags;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState.ShowFMFlags;

  function GetFMFlagStr(NBit: Integer): string;
  begin
    case NBit of
      0: Result := BoolToStr(Driver.FM1IsPresent);
      1: Result := BoolToStr(Driver.FM2IsPresent);
      2: Result := BoolToStr(Driver.LicenseIsPresent);
      3: Result := BoolToStr(Driver.FMOverflow);
      4: Result := BoolToStr(Driver.IsBatteryLow);
      5: Result := BoolToStr(Driver.IsLastFMRecordCorrupted);
      6: Result := BoolToStr(Driver.IsFMSessionOpen);
      7: Result := BoolToStr(Driver.IsFM24HoursOver);
      else Result := '������������ ����� ����';
    end;
  end;

  procedure AddBt(NBit: Integer; BitName: string);
  begin
    Memo.Lines.Add(#9+GetFMFlagStr(NBit)+' '+BitName);
  end;

begin
  AddBt(0, '��1 ����');
  AddBt(1, '��2 ����');
  AddBt(2, '�������� �������');
  AddBt(3, '������������ ��');
  AddBt(4, '������� �� �������� ����� 80 %');
  AddBt(5, '��������� ������ � �� ����������');
  AddBt(6, '����� � �� �������');
  AddBt(7, '24 ���� � �� ���������');
end;

end.
