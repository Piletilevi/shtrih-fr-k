unit untUtil;

interface

uses
  // VCL
  Windows, SysUtils, Controls, Registry, StdCtrls, ExtCtrls, ComCtrls, Classes,
  Graphics;

function StrToHex(const S: string): string;
function HexToStr(const S: string): string;
function GetINN(const S: string): string;
function GetRNM(const S: string): string;
function GetLicense(const S: string): string;
function GetSerialNumber(const S: string): string;
function ConfirmFiscalization(Wnd: THandle): Boolean;
function FMFlagsToStr(NBits: Integer; Driver: OleVariant): string;
function ECRFlagsToStr(NBits: Integer; Driver: OleVariant): string;

procedure LoadControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);
procedure SaveControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);

const
  HighLighting = False;
  InColor  = $99FF99;
  OutColor = $CCFFFF;

implementation

function StrToHex(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    Result := Result + IntToHex(Ord(S[i]), 2) + ' ';
end;

function HexToStr(const S: string): string;

  function HexStrToChar(const Value: string): Char;
  begin
    if Length(Value) in [1..2] then
      Result := Chr(StrToInt('$'+Value))
    else
      raise Exception.Create('Недопустимый символ в строке');
  end;

var
  Data: string;
  Digit: string;
  Index: Integer;
begin
  Data := Trim(S) + ' ';
  Result := '';
  Index := Pos(' ', Data);
  while  Index > 0 do
  begin
    Digit := Copy(Data, 1, Index-1);
    Data := Copy(Data, Index + 1, Length(Data));
    Result := Result + HexStrToChar(Digit);
    Index := Pos(' ', Data);
  end;
end;

function GetINN(const S: string): string;
begin
  Result := S;
  if Result = '' then Result := 'не задан'
end;

function GetRNM(const S: string): string;
begin
  Result := S;
  if Result = '' then Result := 'не задан'
end;

function GetLicense(const S: string): string;
begin
  Result := S;
  if Result = '' then Result := 'не введена'
end;

function GetSerialNumber(const S: string): string;
begin
  Result := S;
  if Result = '' then Result := 'не введен'
end;

function ECRFlagsToStr(NBits: Integer; Driver: OleVariant): string;

const BitStr:array[0..15,False..True]of string=(
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<0 знаков>','<2 знака>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<поднят>','<опущен>'),
  ('<поднят>','<опущен>'),
  ('<опущена>','<поднята>'),
  ('<закрыт>','<открыт>'),
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<нет>','<да>'),
  ('<6 знаков>','<3 знака>'));
begin
  Case NBits of
    0: Result := BitStr[0,Boolean(Driver.JournalRibbonIsPresent)];
    1: Result := BitStr[1,Boolean(Driver.ReceiptRibbonIsPresent)];
    2: Result := BitStr[3,Boolean(Driver.SlipDocumentIsMoving)];
    3: Result := BitStr[2,Boolean(Driver.SlipDocumentIsPresent)];
    4: Result := BitStr[4,Boolean(Driver.PointPosition)];
    5: Result := BitStr[5,Boolean(Driver.EKLZIsPresent)];
    6: Result := BitStr[6,Boolean(Driver.JournalRibbonOpticalSensor)];
    7: Result := BitStr[7,Boolean(Driver.ReceiptRibbonOpticalSensor)];
    8: Result := BitStr[8,Boolean(Driver.JournalRibbonLever)];
    9: Result := BitStr[9,Boolean(Driver.ReceiptRibbonLever)];
    10: Result := BitStr[10,Boolean(Driver.LidPositionSensor)];
    11: Result := BitStr[11,Boolean(Driver.isDrawerOpen)];
    12: Result := BitStr[12,Boolean(Driver.isPrinterRightSensorFailure)];
    13: Result := BitStr[13,Boolean(Driver.isPrinterLeftSensorFailure)];
    14: Result := BitStr[14,Boolean(Driver.IsEKLZOverflow)];
    15: Result := BitStr[15,Boolean(Driver.QuantityPointPosition)];
    else Result := 'Неправильный номер бита';
  end;
end;

function FMFlagsToStr(NBits: Integer; Driver: OleVariant): string;

const BitStr:array[0..7,False..True]of string=(
  ('<нет>','<есть>'),
  ('<нет>','<есть>'),
  ('<не введена>','<введена>'),
  ('<нет>','<есть>'),
  ('< <80% >','< >80% >'),
  ('<корректна>','<повреждена>'),
  ('<закрыта>','<открыта>'),
  ('<не кончились>','<кончились>')
  );
begin
  Case NBits of
    0: Result := BitStr[0,Boolean(Driver.FM1IsPresent)];
    1: Result := BitStr[1,Boolean(Driver.FM2IsPresent)];
    2: Result := BitStr[2,Boolean(Driver.LicenseIsPresent)];
    3: Result := BitStr[3,Boolean(Driver.FMOverflow)];
    4: Result := BitStr[4,Boolean(Driver.IsBatteryLow)];
    5: Result := BitStr[5,Boolean(Driver.IsLastFMRecordCorrupted)];
    6: Result := BitStr[6,Boolean(Driver.IsFMSessionOpen)];
    7: Result := BitStr[7,Boolean(Driver.IsFM24HoursOver)];
    else Result := 'Неправильный номер бита';
  end;
end;

function ConfirmFiscalization(Wnd: THandle): Boolean;
var
  S: string;
begin
  S := 'Фискализацию аппарата нельзя отменить.'#13#10+
    'Вы хотите продолжить?';
  Result := MessageBox(Wnd, PChar(S), 'Внимание!',
    MB_ICONEXCLAMATION or MB_YESNO or MB_DEFBUTTON2) = ID_YES;
end;

procedure LoadControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);
var
  i: Integer;
  Item: TControl;
  ValueName: string;
begin
  for i := 0 to Control.ControlCount-1 do
  begin
    Item := Control.Controls[i];
    if Item is TWinControl then
    begin
      ValueName := Path + '.' + Item.Name;
      LoadControlParams(ValueName, Item as TWinControl, Reg);
      if Reg.ValueExists(ValueName) then
      begin
        if Item is TEdit and (not TEdit(Item).ReadOnly) then
          TEdit(Item).Text := Reg.ReadString(ValueName);
        if Item is TComboBox then
          TComboBox(Item).ItemIndex := Reg.ReadInteger(ValueName);
        if Item is TCheckBox then
          TCheckBox(Item).Checked := Reg.ReadBool(ValueName);
        if Item is TRadioGroup then
          TRadioGroup(Item).ItemIndex := Reg.ReadInteger(ValueName);
        if Item is TDateTimePicker then
          TDateTimePicker(Item).DateTime := Reg.ReadDateTime(ValueName);
      end;
    end;
  end;
end;

procedure SaveControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);
var
  i: Integer;
  EditItem: TEdit;
  Item: TComponent;
  ValueName: string;
begin
  for i := 0 to Control.ControlCount-1 do
  begin
    Item := Control.Controls[i];
    if Item is TWinControl then
    begin
      ValueName := Path + '.' + Item.Name;
      SaveControlParams(ValueName, Item as TWinControl, Reg);
      if Item is TEdit then
      begin
        EditItem := Item as TEdit;
        if not EditItem.ReadOnly then
        Reg.WriteString(ValueName, EditItem.Text);
      end;

      if Item is TComboBox then
        Reg.WriteInteger(ValueName, TComboBox(Item).ItemIndex);

      if Item is TCheckBox then
        Reg.WriteBool(ValueName, TCheckBox(Item).Checked);

      if Item is TRadioGroup then
        Reg.WriteInteger(ValueName, TRadioGroup(Item).ItemIndex);

      if Item is TDateTimePicker then
        Reg.WriteDateTime(ValueName, TDateTimePicker(Item).DateTime);
    end;
  end;
end;

function RGBToColor(RGB: DWORD): TColor;
begin
  Result := (RGB and $FF) shl 16 or
            (RGB and $FF00) or
            (RGB shr 16);
end;

end.
