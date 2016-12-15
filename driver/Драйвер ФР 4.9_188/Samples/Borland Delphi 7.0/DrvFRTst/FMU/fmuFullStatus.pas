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
  BoolToStr: array [Boolean] of string = ('[нет]', '[да]');
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
  AddLine('Флаги', Format('%.4xh, %d', [Driver.ECRFlags, Driver.ECRFlags]));
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

procedure TfmFullStatus.AddFullStatus;
begin
  Check2(Driver.GetDeviceMetrics);
  Check2(Driver.GetECRStatus);

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
  AddLine('Подрежим ' + DeviceName, Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
  AddLine('Статус режима', Driver.ECRModeStatus);
  AddLine('Номер в зале', Driver.LogicalNumber);
  AddLine('Номер документа', Driver.OpendocumentNumber);
  AddLine('Порт ' + DeviceName, Driver.PortNumber);
  AddLine('Количество фискализаций', Driver.RegistrationNumber);
  AddLine('Осталось фискализаций', Driver.FreeRegistration);
  AddLine('Последняя закрытая смена', Driver.SessionNumber);
  AddLine('Свободных записей в ФП', Driver.FreeRecordInFM);
  AddLine('Дата', Driver.Date);
  AddLine('Время', Driver.Time);
  AddLine('Заводской номер', GetSerialNumber(Driver.SerialNumber));
  AddLine('ИНН', GetINN(Driver.INN));
  // Флаги устройства
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
  AddBool('ФП 2 есть', Driver.FM2IsPresent);
  AddBool('ФП 1 есть', Driver.FM1IsPresent);
  AddSeparator;
  // Прокручиваем Memo на начало
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmFullStatus.AddShortStatus;
begin
  Check2(Driver.GetDeviceMetrics);
  Check2(Driver.GetShortECRStatus);
  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' Краткий запрос состояния:');
  AddSeparator;
  Memo.Lines.Add(' Режим:');
  Memo.Lines.Add(Format(' %d, %s', [Driver.ECRMode, Driver.ECRModeDescription]));
  AddSeparator;
  AddLine('Подрежим ' + DeviceName, Format('%d, %s', [Driver.ECRAdvancedMode, Driver.ECRAdvancedModeDescription]));
  AddLine('Статус режима', Driver.ECRModeStatus);
  AddLine('Количество операций в чеке', Driver.QuantityOfOperations);
  AddLine('Напряжение батареи, В', Driver.BatteryVoltage);
  AddLine('Напряжение источника, В', Driver.PowerSourceVoltage);
  AddLine('Ошибка ФП', Driver.FMResultCode);
  AddLine('Ошибка ЭКЛЗ', Driver.EKLZResultCode);
  // Флаги устройства
  AddDeviceFlags;
  AddSeparator;
  // Прокручиваем Memo на начало
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmFullStatus.AddDeviceMetrics;
begin
  Check2(Driver.GetDeviceMetrics);

  Memo.Lines.Add('');
  AddSeparator;
  Memo.Lines.Add(' Параметры устройства:');
  AddSeparator;
  Memo.Lines.Add(' Кодовая страница    : '+ IntToStr(Driver.UCodePage));
  Memo.Lines.Add(' Описание устройства : '+ Driver.UDescription);
  Memo.Lines.Add(' Версия протокола    : '+ IntToStr(Driver.UMajorProtocolVersion));
  Memo.Lines.Add(' Подверсия протокола : '+ IntToStr(Driver.UMinorProtocolVersion));
  Memo.Lines.Add(' Тип устройства      : '+ IntToStr(Driver.UMajorType));
  Memo.Lines.Add(' Подтип устройства   : '+ IntToStr(Driver.UMinorType));
  Memo.Lines.Add(' Модель устройства   : '+ IntToStr(Driver.UModel));
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
    Memo.Lines.Add(' Полное состояние');
    AddSeparator;
    try
      AddFullStatus;
      AddShortStatus;
      AddDeviceMetrics;
      AddTables;
      AddCashTotalizers;
      AddWorkTotalizers;
      AddSeparator;
      // Прокручиваем Memo на начало
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on E: EAbort do
        Memo.Lines.Add(Format('<Прервано в связи с ошибкой: %d (%s)>', [Driver.ResultCode, Driver.ResultCodeDescription]));
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
  Memo.Lines.Add(' ДЕНЕЖНЫЕ РЕГИСТРЫ:');
  AddSeparator;
  AddCashRegisters(' Накопление:', $00, $57);
  AddCashRegisters(' Оборот по:', $58, $67);
  AddCashRegisters(' Накопления по:', $68, $77);
  AddCashRegisters(' Наличность:', $78, $78);
  AddCashRegisters(' Накопление:', $79, $D0);
  AddCashRegisters(' Оборот по:', $D1, $E0);
  AddCashRegisters(' Накопления по:', $E1, $F0);
  AddCashRegisters(' Накопление:', $F1, $F3);
  AddCashRegisters(' Необнуляемая сумма:', $F4, $F4);
  AddCashRegisters(' Сумма:', $F5, $F8);
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
  Memo.Lines.Add(' ОПЕРАЦИОННЫЕ РЕГИСТРЫ:');
  AddSeparator;
  AddOperationRegisters(' Количество:', $00, $93);
  AddOperationRegisters(' Номер:', $94, $97);
  AddOperationRegisters(' Сквозной номер', $98, $98);
  AddOperationRegisters(' Количество:', $99, $9A);
  AddOperationRegisters(' Номер:', $9B, $9C);
  AddOperationRegisters(' Количество:', $9D, $9D);
  AddOperationRegisters(' Номер:', $9E, $A5);
  AddOperationRegisters(' Количество:', $A6, $A8);
  AddOperationRegisters(' Количество отчетов по:', $A9, $B0);
  AddOperationRegisters(' Количество :', $B1, $B1);
  AddOperationRegisters(' Номер отчета по :', $B2, $B2);
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
    Memo.Lines.Add(Format(' ТАБЛИЦА %d. %s. Рядов:%d Полей:%d',
      [Driver.TableNumber, Driver.TableName, RowN, FieldN]));
    Memo.Lines.Add(' Ряд.Поле. Наименование:Значение');
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
  Memo.Lines.Add(' ТАБЛИЦЫ:');
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
  if FStop then raise EStopException.Create('<Прервано пользователем>');
  Check(AResultCode);
end;

end.

