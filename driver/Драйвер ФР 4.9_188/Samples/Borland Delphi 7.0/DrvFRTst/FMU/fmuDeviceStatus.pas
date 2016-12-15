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
  BoolToStr: array [Boolean] of string = ('[нет]', '[да]');
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
  AddLine('Флаги ' + DeviceName, Format('%.4xh, %d', [Driver.ECRFlags, Driver.ECRFlags]));
  AddSeparator;
  AddBool('Увеличенная точность количества', Driver.QuantityPointPosition);
  AddBool('Бумага на выходе из накопителя', Driver.PresenterOut);
  AddBool('Бумага на входе в накопитель', Driver.PresenterIn);
  AddBool('ЭКЛЗ почти заполнена', Driver.IsEKLZOverflow);
  AddBool('Денежный ящик открыт', Driver.IsDrawerOpen);
  AddBool('Крышка корпуса поднята', Driver.LidPositionSensor);
  AddBool('Рычаг термоголовки чека опущен', Driver.ReceiptRibbonLever);
  AddBool('Рычаг термоголовки журнала опущен', Driver.JournalRibbonLever);
  AddBool('Оптический датчик чека', Driver.ReceiptRibbonOpticalSensor);
  AddBool('Оптический датчик журнала', Driver.JournalRibbonOpticalSensor);
  AddBool('ЭКЛЗ есть', Driver.EKLZIsPresent);
  AddBool('2 знака после запятой в цене', Driver.PointPosition);
  AddBool('Нижний датчик ПД', Driver.SlipDocumentIsPresent);
  AddBool('Верхний датчик ПД', Driver.SlipDocumentIsMoving);
  AddBool('Рулон чековой ленты', Driver.ReceiptRibbonIsPresent);
  AddBool('Рулон контрольной ленты', Driver.JournalRibbonIsPresent);
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
    Memo.Lines.Add(' Запрос состояния:');
    AddSeparator;
    Memo.Lines.Add(' Режим: ');
    Memo.Lines.Add(' ' + Format('%d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
    // ПО принтера
    AddSeparator;
    AddLine('Версия ПО', Driver.ECRSoftVersion);
    AddLine('Сборка ПО', Driver.ECRBuild);
    AddLine('Дата ПО', Driver.ECRSoftDate);
    // ПО ФП
    AddSeparator;
    AddLine('Версия ПО ФП', Driver.FMSoftVersion);
    AddLine('Сборка ПО ФП', Driver.FMBuild);
    AddLine('Дата ПО ФП', Driver.FMSoftDate);
    // Режимы
    AddSeparator;
    AddLine('Подрежим', Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
    AddLine('Статус режима', Driver.ECRModeStatus);
    AddLine('Номер ККМ в зале', Driver.LogicalNumber);
    AddLine('Номер документа', Driver.OpendocumentNumber);
    AddLine('Номер порта', Driver.PortNumber);
    AddLine('Количество фискализаций', Driver.RegistrationNumber);
    AddLine('Осталось фискализаций', Driver.FreeRegistration);
    AddLine('Последняя закрытая смена', Driver.SessionNumber);
    AddLine('Свободных записей в ФП', Driver.FreeRecordInFM);
    AddLine('Дата', Driver.Date);
    AddLine('Время', Driver.Time);
    AddLine('Заводской номер', GetSerialNumber(Driver.SerialNumber));
    AddLine('ИНН', GetINN(Driver.INN));
    // Флаги
    AddDeviceFlags;
    // Флаги ФП
    AddSeparator;
    AddLine('Флаги ФП', Format('%.2xh, %d', [Driver.FMFlags, Driver.FMFlags]));
    AddSeparator;
    AddBool('24 часа в ФП кончились', Driver.IsFM24HoursOver);
    AddBool('Смена в ФП открыта', Driver.IsFMSessionOpen);
    AddBool('Последняя запись в ФП повреждена', Driver.IsLastFMRecordCorrupted);
    AddBool('Батарея ФП заряжена более 80 %', Driver.IsBatteryLow);
    AddBool('Переполнение ФП', Driver.FMOverflow);
    AddBool('Лицензия введена', Driver.LicenseIsPresent);
    AddBool('ФП2 есть', Driver.FM2IsPresent);
    AddBool('ФП1 есть', Driver.FM1IsPresent);
    AddSeparator;
    // Прокручиваем Memo на начало
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
    Memo.Lines.Add(' Краткий запрос состояния:');
    AddSeparator;
    Memo.Lines.Add(' Режим:');
    Memo.Lines.Add(Format(' %d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
    AddSeparator;
    AddLine('Подрежим', Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
    AddLine('Статус режима', Driver.ECRModeStatus);
    AddLine('Количество операций в чеке', Driver.QuantityOfOperations);
    AddLine('Напряжение батареи, В', Driver.BatteryVoltage);
    AddLine('Напряжение источника, В', Driver.PowerSourceVoltage);
    AddLine('Ошибка ФП', Driver.FMResultCode);
    AddLine('Ошибка ЭКЛЗ', Driver.EKLZResultCode);
    // Флаги принтера
    AddDeviceFlags;
    AddSeparator;
    // Прокручиваем Memo на начало
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
    Memo.Lines.Add(' Параметры принтера:');
    AddSeparator;
    Memo.Lines.Add(' Кодовая страница    : '+ IntToStr(Driver.UCodePage));
    Memo.Lines.Add(' Описание устройства : '+ Driver.UDescription);
    Memo.Lines.Add(' Версия протокола    : '+ IntToStr(Driver.UMajorProtocolVersion));
    Memo.Lines.Add(' Подверсия протокола : '+ IntToStr(Driver.UMinorProtocolVersion));
    Memo.Lines.Add(' Тип устройства      : '+ IntToStr(Driver.UMajorType));
    Memo.Lines.Add(' Подтип устройства   : '+ IntToStr(Driver.UMinorType));
    Memo.Lines.Add(' Модель устройства   : '+ IntToStr(Driver.UModel));
  finally
    EnableButtons(True);
  end;
end;

procedure TfmDeviceStatus.btnResetPrinterClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    repeat
      // Запрос состояния
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
                   ShowMessage('Принтер заблокирован из-за ввода неправильного ' +
                     'пароля налогового инспектора');
                   Exit;
                 end;
              6: Check(Driver.ConfirmDate);
              8: Check(Driver.CancelCheck);
              9: begin
                   ShowMessage('Принтер находится в режиме технологического обнуления');
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
    BoolToStr: array [Boolean] of string = ('[нет]', '[да]');
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
    Memo.Lines.Add(' Параметры Модели:');
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
    Memo.Lines.Add(' Версия драйвера:');
    AddSeparator;
    AddLineWidth('Версия', Driver.DriverMajorVersion, 14);
    AddLineWidth('Подверсия', Driver.DriverMinorVersion, 14);
    AddLineWidth('Релиз', Driver.DriverRelease, 14);
    AddLineWidth('Сборка', Driver.DriverBuild, 14);
    AddLineWidth('Полная версия', Driver.DriverVersion, 14);
  finally
    EnableButtons(True);
    Memo.Lines.EndUpdate;
  end;
end;

end.
