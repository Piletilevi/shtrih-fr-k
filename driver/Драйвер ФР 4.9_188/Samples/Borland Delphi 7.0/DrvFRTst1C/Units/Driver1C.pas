
{ Тест интерфейса в соответствии с "Требованиями к разработке драйверов для
  фискальных регистраторов" компании 1С}

unit Driver1C;

interface
uses
// VCL
   Windows, Classes, ComObj, SysUtils, Variants, ActiveX, Types,
// This
   LanguageExtender,
   DrvFRLib_TLB;

type
  TDriver1C = class
  private
    FDriver: IDrvFR1C;
    FRunTime: Cardinal;
    function GetDriver: IDrvFR1C;
    procedure DoChange(ARes: Boolean);
    procedure AddLine(const S: string);
    property Driver: IDrvFR1C read GetDriver;
  public
    FDeviceID: WideString;
    FName: WideString;
    FQuantity: Double;
    FPrice: Double;
    FAmount: Double;
    FDepartment: Integer;
    FTax: Single;
    FIsFiscalCheck: WordBool;
    FIsReturnCheck: WordBool;
    FCancelOpenedCheck: WordBool;
    FCheckNumber: Integer;
    FSessionNumber: Integer;
    FTextString: WideString;
    FErrorDescription: WideString;
    FCash: Double;
    FPayByCard: Double;
    FPayByCredit: Double;
    FValuesArray: IDispatch;
    FAdditionalDescription: WideString;
    FOutList: TStringList;
    FOnChange: TNotifyEvent;
    FLogoValuesArray: IDispatch;
    FLogoFileName: string;
    FCenterLogo: Boolean;
    FLogoSize: Integer;

    procedure CashInOutcome;
    procedure Close;
    procedure CloseCheck;
    procedure DeviceTest;
    procedure GetLastError;
    procedure GetVersion;
    procedure Open;
    procedure OpenCheck;
    procedure PrintFiscalString;
    procedure PrintNonFiscalString;
    procedure PrintXReport;
    procedure PrintZReport;
    procedure CancelCheck;
    procedure CheckPrintingStatus;
    procedure ContinuePrinting;
    procedure ClearOutList;
    procedure PrintTestFiscalReceipt;
    procedure PrintTestNonFiscalReceipt;
    procedure TestError;
    procedure OpenCashDrawer(CashDrawerID: Integer);
    procedure LoadLogo;

    constructor Create;
    destructor Destroy; override;
  end;

const
  C_PORT = 0;
  C_SPEED = 1;
  C_USERPASSWORD = 2;
  C_ADMINPASSWORD = 3;
  C_TIMEOUT = 4;
  C_SERIALNUMBER = 5;
  C_TAX1 = 6;
  C_TAX2 = 7;
  C_TAX3 = 8;
  C_TAX4 = 9;
  C_CLOSESESSION = 10;
  C_ENABLELOG = 11;
  C_PAYNAME1 = 12;
  C_PAYNAME2 = 13;
  C_PRINTLOGO = 14;
  C_LOGOSIZE = 15;
  C_CONNECTION_TYPE = 16;
  C_COMPUTERNAME = 17;
  C_IPADDRESS = 18;
  C_TCPPORT = 19;

implementation

const
  IDRVFR1C_GUID: TGUID = '{129C1D7A-384D-4CD6-9F28-7CF321FF9D04}';
  OpenCheckID = 13;

function GetIntParamValue(V: Variant; Index: Integer; var Value: Integer): Boolean;
begin
  Result := True;
  try
    Value := Integer(V.Get(Index));
  except
    Result := False;
  end;
end;

function GetIntParamValueAsString(V: Variant; Index: Integer): string;
var
  Value: Integer;
begin
  if GetIntParamValue(V, Index, Value) then
    Result := IntToStr(Value)
  else
    Result := '<??>';
end;

function GetBoolParamValue(V: Variant; Index: Integer;
  var Value: Boolean): Boolean;
begin
  Result := True;
  try
    Value := Boolean(V.Get(Index));
  except
    Result := False;
  end;
end;

function GetBoolParamValueAsString(V: Variant; Index: Integer): string;
var
  Value: Boolean;
begin
  if GetBoolParamValue(V, Index, Value) then
    Result := SysUtils.BoolToStr(Value, True)
  else
    Result := '<??>';
end;

function GetSingleParamValue(V: Variant; Index: Integer;
  var Value: Single): Boolean;
begin
  Result := True;
  try
    Value := Single(V.Get(Index));
  except
    Result := False;
  end;
end;

function GetSingleParamValueAsString(V: Variant; Index: Integer): string;
var
  Value: Single;
begin
  if GetSingleParamValue(V, Index, Value) then
    Result := Format('%.2f', [Value])
  else
    Result := '<??>'
end;

function GetStrParamValue(V: Variant; Index: Integer;
  var Value: string): Boolean;
begin
  Result := True;
  try
    Value := string(V.Get(Index));
  except
    Result := False;
  end;
end;

function GetStrParamValueAsString(V: Variant; Index: Integer): string;
var
  Value: string;
begin
  if GetStrParamValue(V, Index, Value) then
    Result := Value
  else
    Result := '<??>';
end;

function ValuesArrayToStr(const AValuesArray: IDispatch; AOut: Boolean = False): string;
var
  V: Variant;
  sPort: string;
  sSpeed: string;
  sUserPassword: string;
  sAdminPassword: string;
  sTimeout: string;
  sTax1: string;
  sTax2: string;
  sTax3: string;
  sTax4: string;
  sCloseSession: string;
  sEnableLog: string;
  sPayName1: string;
  sPayName2: string;
  sPrintLogo: string;
  sLogoSize: string;
  sConnectionType: string;
  sComputerName: string;
  sIPAddress: string;
  sTCPPort: string;
begin
  V := AValuesArray;

  sPort := GetIntParamValueAsString(V, C_PORT);

  sSpeed := GetIntParamValueAsString(V, C_SPEED);

  sUserPassword :=  GetStrParamValueAsString(V, C_USERPASSWORD);

  sAdminPassword := GetStrParamValueAsString(V, C_ADMINPASSWORD);

  sTimeout := GetIntParamValueAsString(V, C_TIMEOUT);

  sTax1 := GetSingleParamValueAsString(V, C_TAX1);

  sTax2 := GetSingleParamValueAsString(V, C_TAX2);

  sTax3 := GetSingleParamValueAsString(V, C_TAX3);

  sTax4 := GetSingleParamValueAsString(V, C_TAX4);

  sCloseSession :=  GetBoolParamValueAsString(V, C_CLOSESESSION);

  sEnableLog := GetBoolParamValueAsString(V, C_ENABLELOG);

  sPayName1 := GetStrParamValueAsString(V, C_PAYNAME1);

  sPayName2 := GetStrParamValueAsString(V, C_PAYNAME2);

  sPrintLogo := GetBoolParamValueAsString(V, C_PRINTLOGO);

  sLogoSize := GetIntParamValueAsString(V, C_LOGOSIZE);

  sConnectionType := GetIntParamValueAsString(V, C_CONNECTION_TYPE);

  sComputerName := GetStrParamValueAsString(V, C_COMPUTERNAME);

  sIPAddress := GetStrParamValueAsString(V, C_IPADDRESS);

  sTCPPort := GetIntParamValueAsString(V, C_TCPPORT);

  Result := 'Port: ' + sPort + '; Speed: ' + sSpeed + '; UserPassword: ' + sUserPassword +
            '; AdminPassword: ' + sAdminPassword + '; Timeout: ' + sTimeout +
            '; Tax1: ' + sTax1 + '; Tax2: ' + sTax2 + '; Tax3: ' + sTax3 + '; Tax4: ' + sTax4 +
            '; CloseSession: ' + sCloseSession + '; EnableLog: ' + sEnableLog +
            '; PayName1: ' + sPayName1 + '; PayName2: ' + sPayName2 +
            '; PrintLogo: ' + sPrintLogo + '; LogoSize: ' + sLogoSize +
            '; ConnectionType: ' + sConnectionType + '; ComputerName: ' + sComputerName +
            '; IPAddress: ' + sIPAddress + '; TCPPort: ' + sTCPPort;

  if AOut then
    Result := Result + '; SerialNumber: ' + GetStrParamValueAsString(V, C_SERIALNUMBER);
end;

function LogoValuesArrayToStr(const AValuesArray: IDispatch): string;
var
  V: Variant;
  sPort: string;
  sSpeed: string;
  sUserPassword: string;
  sTimeout: string;
  sConnectionType: string;
  sComputerName: string;
  sIPAddress: string;
  sTCPPort: string;
begin
  V := AValuesArray;

  sPort := GetIntParamValueAsString(V, 0);

  sSpeed := GetIntParamValueAsString(V, 1);

  sUserPassword :=  GetStrParamValueAsString(V, 2);

  sTimeout := GetIntParamValueAsString(V, 3);

  sConnectionType := GetIntParamValueAsString(V, 4);

  sComputerName := GetStrParamValueAsString(V, 5);

  sIPAddress := GetStrParamValueAsString(V, 6);

  sTCPPort := GetIntParamValueAsString(V, 7);

  Result := 'Port: ' + sPort + '; Speed: ' + sSpeed + '; Userpassword: ' + sUserPassword +
            '; Timeout: ' + sTimeout +
            '; ConnectionType: ' + sConnectionType + '; ComputerName: ' + sComputerName +
            '; IPAddress: ' + sIPAddress + '; TCPPort: ' + sTCPPort;
end;

{ TDriver1C }

procedure TDriver1C.CancelCheck;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.CancelCheck(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['CancelCheck', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.CashInOutcome;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.CashInOutcome(FDeviceID, FAmount);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s, %.2f):%s', ['CashInOutcome', FDeviceID, FAmount, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.CheckPrintingStatus;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.CheckPrintingStatus(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['CheckPrintingStatus', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.Close;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.Close(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['Close', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.CloseCheck;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.CloseCheck(FDeviceID, FCash, FPayByCard, FPayByCredit);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s, Cash:%.2f, PayByCard:%.2f, PayByCredit:%.2f):%s',
    ['CloseCheck', FDeviceID, FCash, FPayByCard, FPayByCredit, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.ContinuePrinting;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.ContinuePrinting(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['ContinuePrinting', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.DeviceTest;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.DeviceTest(FValuesArray, FAdditionalDescription);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(ValuesArray:(%s), %s):%s',
    ['DeviceTest', ValuesArrayToStr(FValuesArray), FAdditionalDescription, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.GetLastError;
var
  Err: Integer;
  Desc: WideString;
begin
   FRunTime := GetTickCount;
   Err := Driver.GetLastError(Desc);
   FRunTime := GetTickCount - FRunTime;
   AddLine(Format('%s(%s):%d', ['GetLastError', Desc, Err]));
   DoChange(True);
end;

procedure TDriver1C.GetVersion;
var
  S: string;
begin
  FRunTime := GetTickCount;
  S := Driver.GetVersion;
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s:%s', ['GetVersion', S]));
  DoChange(True);
end;

procedure TDriver1C.Open;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.Open(FValuesArray, FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(ValuesArray:(%s), DeviceID = %s):%s',
    ['Open', ValuesArrayToStr(FValuesArray), FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.OpenCheck;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.OpenCheck(FDeviceID, FIsFiscalCheck, FIsReturnCheck, FCancelOpenedCheck,
    FCheckNumber, FSessionNumber);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s, IsFiscalCheck:%s, IsReturnCheck: %s, CancelopenedCheck: %s,' +
    'CheckNumber = %d, SessionNumber = %d):%s',
    ['OpenCheck', FDeviceID, BoolToStr(FIsFiscalCheck, True), BoolToStr(FIsReturnCheck, True),
    BoolToStr(FCancelOpenedCheck, True), FCheckNumber, FSessionNumber, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.PrintFiscalString;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.PrintFiscalString(FDeviceID, FName, FQuantity, FPrice, FAmount, FDepartment, FTax);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s, Name:%s, Quantity:%.3f, Price:%.2f, Amount:%.2f, Department:%d, Tax:%.2f):%s',
    ['PrintFiscalSTring', FDeviceID, FName, FQuantity, FPrice, FAmount, FDepartment, FTax, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.PrintNonFiscalString;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.PrintNonFiscalString(FDeviceID, FTextString);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s, TextString:%s):%s',
    ['PrintNonFiscalString', FDeviceID, FTextString, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.PrintXReport;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.PrintXReport(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['PrintXReport', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.PrintZReport;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.PrintZReport(FDeviceID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s):%s', ['PrintZReport', FDeviceID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.DoChange(ARes: Boolean);
var
  Err: Integer;
  Desc: WideString;
begin
  if ARes then
  begin
    AddLine(Format('Операция выполнена успешно. Время выполнения: %dмс', [FRunTime]));
    if Assigned(FOnchange) then
      FOnChange(Self);
    Exit;
  end;
  Err := Driver.GetLastError(Desc);
  AddLine(Format('Ошибка: %d %s', [Err, Desc]));
  FOnChange(Self);
  Abort;
end;

function TDriver1C.GetDriver: DrvFR1C;
begin
  if FDriver = nil then
    FDriver := CreateOleObject('Addin.DrvFR1C') as IDrvFR1C;
  Result := FDriver;
end;

constructor TDriver1C.Create;
begin
  inherited;
  FOutList := TStringList.Create;
end;

destructor TDriver1C.Destroy;
begin
  FOutList.Free;
  inherited;
end;

procedure TDriver1C.ClearOutList;
begin
  FOutList.Clear;
  DoChange(True);
end;

procedure TDriver1C.PrintTestFiscalReceipt;
var
  i: Integer;
  V: Variant;
{  Time1: Cardinal;
  Time2: Cardinal;}
begin
  {Time1 := GetTickCount;}
  FIsFiscalCheck := True;
  FIsReturnCheck := False;
  FCancelOpenedCheck := True;
  OpenCheck;
  for i := 1 to 5 do
  begin
    FTextString := Format('Нефискальная строка %d', [i]);
    PrintNonFiscalString;
  end;
  V := FValuesArray;
  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Позиция 1
  FName := 'Продукт 1';
  FQuantity := 1.123;
  FPrice := 34.15;
  FAmount := FPrice * FQuantity - 5.45; // Скидка 5.45
  FDepartment := 1;
  FTax := V.Get(6);
  PrintFiscalString;

  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Позиция 2
  FName := 'Продукт 2';
  FQuantity := 2.432;
  FPrice := 4.35;
  FAmount := FPrice * FQuantity + 1.23; // Надбавка 1.23
  FDepartment := 2;
  FTax := V.Get(7);
  PrintFiscalString;

  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Позиция 3
  FName := 'Продукт 3';
  FQuantity := 7.812;
  FPrice := 0.15;
  FAmount := FPrice * FQuantity - 0.12; // Скидка 0.12
  FDepartment := 3;
  FTax := V.Get(8);
  PrintFiscalString;

  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Позиция 4
  FName := 'Продукт 4'#13'Строка 2'#13#10'Строка 3';
  FQuantity := 3.512;
  FPrice := 12.75;
  FAmount := FPrice * FQuantity + 1.2; // Надбавка 1.2
  FDepartment := 4;
  FTax := V.Get(9);
  PrintFiscalString;

  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Позиция 5
  FName := 'Продукт 5 01234567890123456789012345678901234567890123456789' +
    '01234567890123456789012345678901234567890123456789' +
    'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  FQuantity := 1.123;
  FPrice := 34.15;
  FAmount := FPrice * FQuantity; // Без скидки
  FDepartment := 5;
  FTax := 0;
  PrintFiscalString;

  FTextString := '------------------------------';
  PrintNonFiscalString;

  // Закрываем чек
  FCash := 250.45;
  FPayByCard := 1.34;
  FPayByCredit := 3.45;
  CloseCheck;
{  Time2 := GetTickCount;
  FTextString := 'Чек напечатан за ' + IntToStr(Time2 - Time1) + ' мс';
  PrintNonFiscalString;}
end;


procedure TDriver1C.PrintTestNonFiscalReceipt;
begin
  FIsFiscalCheck := False;
  FIsReturnCheck := False;
  FCancelOpenedCheck := True;
  OpenCheck;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  FTextString := '01234567890123456789012345678901234567890123456789' +
    '01234567890123456789012345678901234567890123456789';
  PrintNonFiscalString;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  FTextString := 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчш' +
    'щъыьэюя';
  PrintNonFiscalString;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  FTextString := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  PrintNonFiscalString;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  FTextString := 'Cъешь ещё этих мягких французских булок, да выпей чаю.';
  PrintNonFiscalString;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  FTextString := 'Строка 1'#13'Строка 2'#13'Строка 3'#13#10'Строка 4'#13 +
    'Строка 5 012345678901234567890123456789012345678901234567890123456789';
  PrintNonFiscalString;
  FTextString := '------------------------------';
  PrintNonFiscalString;
  CloseCheck;
end;

// Тест ошибки при вызове метода CallAsFunc с неправильными параметрами
procedure TDriver1C.TestError;
var
  Obj: ILanguageExtender ;
  RetValue: OleVariant;
  Params: Variant;
begin
  Obj := Driver as ILanguageExtender;
  Params := VarArrayCreate([0, 5], varVariant);
  Params[0] := WideString('1'); // DeviceID
  Params[1] := WordBool(True); // IsFiscalcheck
  Params[2] := WordBool(False); // IsReturnCheck
  Params[3] := WordBool(False); // CancelOpenedCheck
  Params[4] := WideString('0'); // CheckNumber [OUT] -- Ошибочный параметр
  Params[5] := Integer(0); // SessionNumber [OUT]
  AddLine(Format('CallAsFunc: 0x%.8x', [Obj.CallAsFunc(OpenCheckID,
                       RetValue, PSafeArray(TVarData(Params).VArray))]));
  FOnChange(Self);
end;

procedure TDriver1C.OpenCashDrawer(CashDrawerID: Integer);
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.OpenCashDrawer(FDeviceID, CashDrawerID);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('%s(%s,%d):%s', ['OpenCashDrawer', FDeviceID,
    CashDrawerID, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.LoadLogo;
var
  Res: Boolean;
begin
  FRunTime := GetTickCount;
  Res := Driver.LoadLogo(FLogoValuesArray, FLogoFileName, FCenterLogo, FLogoSize, FAdditionalDescription);
  FRunTime := GetTickCount - FRunTime;
  AddLine(Format('LoadLogo(ValuesArray:(%s), LogoFileName: %s, CenterLogo: %s, LogoSize: %d, AdditionalDesctiption: %s):%s',
    [LogoValuesArrayToStr(FLogoValuesArray), FLogoFileName, BoolToStr(FCenterLogo, True), FLogoSize, FAdditionalDescription, BoolToStr(Res, True)]));
  DoChange(Res);
end;

procedure TDriver1C.AddLine(const S: string);
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Time, Hour, Min, Sec, MSec);
  FOutList.Add(Format('[%.2d:%.2d:%.2d.%.3d] ',[Hour, Min, Sec, MSec]) + S);
end;

end.
