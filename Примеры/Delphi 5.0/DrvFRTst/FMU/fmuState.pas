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
      else Result := 'Неправильный номер бита';
    end;
  end;

  procedure AddBt(NBit: Integer; BitName: string);
  begin
    Memo.Lines.Add(#9+GetECRFlagStr(NBit)+' '+BitName);
  end;

begin
  AddBt(0, 'Рулон операционного журнала');
  AddBt(1, 'Рулон чековой ленты');
  AddBt(2, 'Верхний датчик ПД');
  AddBt(3, 'Нижний датчик ПД');
  AddBt(4, 'Положение десятичной точки: 2 знака');
  AddBt(5, 'ЭКЛЗ есть');
  AddBt(6, 'Оптический датчик операционного журнала');
  AddBt(7, 'Оптический датчик чековой ленты');
  AddBt(8, 'Рычаг термоголовки операционного журнала опущен');
  AddBt(9, 'Рычаг термоголовки чековой ленты опущен');
  AddBt(10, 'Крышка корпуса ФР поднята');
  AddBt(11, 'Денежный ящик открыт');
  AddBt(12, 'Отказ правого датчика принтера');
  AddBt(13, 'Отказ левого датчика принтера');
  AddBt(14, 'ЭКЛЗ почти заполнена');
  AddBt(15, 'Увеличенная точность количества');
  AddBt(16, 'Бумага на входе в накопитель');
  AddBt(17, 'Бумага на выходе из накопителя');
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
        Lines.Add(Format('  1. Режим ФР%s:  %s, %s', [#9#9#9#9, Driver.ECRMode, Driver.ECRModeDescription]));
        Lines.Add(Format('  2. Подрежим ФР%s:  %s, %s', [#9#9#9#9, Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
        Lines.Add(Format('  3. Статус режима%s:  %s', [#9#9#9#9, Driver.ECRModeStatus]));
        Lines.Add(Format('  4.  Номер ККМ в зале%s:  %s', [#9#9#9, Driver.LogicalNumber]));
        Lines.Add(Format('  5.  Номер документа%s:  %s', [#9#9#9, Driver.OpendocumentNumber]));
        Lines.Add(Format('  6.  Порт ФР%s:  %s', [#9#9#9#9, Driver.PortNumber]));
        Lines.Add(Format('  7.  Количество фискализаций%s:  %s', [#9#9, Driver.RegistrationNumber]));
        Lines.Add(Format('  8.  Количество оставшихся фискализаций%s:  %s', [#9, Driver.FreeRegistration]));
        Lines.Add(Format('  9.  Последняя закрытая смена%s:  %s', [#9#9, Driver.SessionNumber]));
        Lines.Add(Format('  10. Свободных записей в ФП%s:  %s', [#9#9, Driver.FreeRecordInFM]));
        Lines.Add(Format('  11. Дата%s:  %s', [#9#9#9#9, Driver.Date]));
        Lines.Add(Format('  12. Время%s:  %s', [#9#9#9#9, Driver.Time]));
        Lines.Add(Format('  13. Заводской номер%s:  %s', [#9#9#9, GetSerialNumber(Driver.SerialNumber)]));
        Lines.Add(Format('  14. ИНН%s:  %s', [#9#9#9#9, GetINN(Driver.INN)]));
        Lines.Add('  15. ПО ФР');
        Lines.Add(Format('          Версия%s:  %s', [#9#9#9#9, Driver.ECRSoftVersion]));
        Lines.Add(Format('          Сборка%s:  %s', [#9#9#9#9, Driver.ECRBuild]));
        Lines.Add(Format('          Дата%s:  %s', [#9#9#9#9, Driver.ECRSoftDate]));
        Lines.Add('  16. ПО ФП');
        Lines.Add(Format('          Версия%s:  %s', [#9#9#9#9, Driver.FMSoftVersion]));
        Lines.Add(Format('          Сборка%s:  %s', [#9#9#9#9, Driver.FMBuild]));
        Lines.Add(Format('          Дата%s:  %s', [#9#9#9#9, Driver.FMSoftDate]));
        Lines.Add(Format('  17. Флаги ФР (%s)', [Driver.ECRFlags]));
        ShowECRFlags;
        Lines.Add(Format('  18. Флаги ФП (%s)', [Driver.FMFlags]));
        ShowFMFlags;
        // Прокручиваем Memo на начало
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
        Lines.Add(Format('  1. Режим ФР%s:  %s, %s', [#9#9#9, Driver.ECRMode, Driver.ECRModeDescription]));
        Lines.Add(Format('  2. Подрежим ФР%s:  %s, %s', [#9#9#9, Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
        Lines.Add(Format('  3. Статус режима%s:  %s', [#9#9#9, Driver.ECRModeStatus]));
        Lines.Add(Format('  4. Количество операций в чеке%s:  %s', [#9, Driver.QuantityOfOperations]));
        Lines.Add(Format('  5. Напряжение батареи%s:  %s В', [#9#9, Driver.BatteryVoltage]));
        Lines.Add(Format('  6. Напряжение источника питания%s:  %s В', [#9, Driver.PowerSourceVoltage]));
        Lines.Add(Format('  7. Ошибка ФП%s:  %s', [#9#9#9, Driver.FMResultCode]));
        Lines.Add(Format('  8. Ошибка ЭКЛЗ%s:  %s', [#9#9#9, Driver.EKLZResultCode]));
        Lines.Add(Format('  9. Флаги ФР (%s)', [Driver.ECRFlags]));
        ShowECRFlags;
        // Прокручиваем Memo на начало
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
      else Result := 'Неправильный номер бита';
    end;
  end;

  procedure AddBt(NBit: Integer; BitName: string);
  begin
    Memo.Lines.Add(#9+GetFMFlagStr(NBit)+' '+BitName);
  end;

begin
  AddBt(0, 'ФП1 есть');
  AddBt(1, 'ФП2 есть');
  AddBt(2, 'Лицензия введена');
  AddBt(3, 'Переполнение ФП');
  AddBt(4, 'Батарея ФП заряжена более 80 %');
  AddBt(5, 'Последняя запись в ФП повреждена');
  AddBt(6, 'Смена в ФП открыта');
  AddBt(7, '24 часа в ФП кончились');
end;

end.
