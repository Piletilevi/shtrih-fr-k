unit untUtil;

interface

uses
  // VCL
  Windows, SysUtils, Controls, Registry, StdCtrls, ExtCtrls, ComCtrls, Classes,
  Graphics, ValEdit, Grids, Spin;

// Чтобы контрол не сохранялся в реестре, необходимо установить его tag со
// значением TAG_DONTSAVECONTROL
const TAG_DONTSAVECONTROL = 1000;

function StrToHex(const S: string): string;
function GetINN(const S: string): string;
function GetRNM(const S: string): string;
function GetLicense(const S: string): string;
function GetSerialNumber(const S: string): string;
function ConfirmFiscalization(Wnd: THandle): Boolean;
procedure CenterClientSite(AChildWnd, AParentWnd: HWND);
function FMFlagsToStr(NBits: Integer; Driver: OleVariant): string;
function ECRFlagsToStr(NBits: Integer; Driver: OleVariant): string;

procedure LoadControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);
procedure SaveControlParams(const Path: string; Control: TWinControl; Reg: TRegistry);

procedure VLE_SETPickPropertyValue(AVLE: TValueListEditor; AName: string; AValue: Integer);
function VLE_GetPickPropertyValue(AVLE: TValueListEditor; AName: string): Integer;
function VLE_GetPropertyValue(AVLE: TValueListEditor; AName: string): string;
procedure VLE_AddProperty(AVLE: TValueListEditor; AName: string; AValueDef: string);
procedure VLE_AddPickProperty(AVLE: TValueListEditor; AName: string; AValueDef: string;
  APickItemNames: array of string; APickItemValues: array of Integer);
procedure VLE_AddSeparator(AVLE: TValueListEditor; AName: string);
procedure VLE_SetPropertyValue(AVLE: TValueListEditor; AName: string; AValue: string);
procedure VLE_DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
function VLEParamsToString(AVLE: TValueListEditor): string;
procedure StringToVLEParams(AVLE: TValueListEditor; AStr: string);
procedure CheckIntStr(const AStr: string; const Msg: string);

implementation

function StrToHex(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    Result := Result + IntToHex(Ord(S[i]), 2) + ' ';
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
      if Item.Tag = TAG_DONTSAVECONTROL then
        Continue;
      ValueName := Path + '.' + Item.Name;
      LoadControlParams(ValueName, Item as TWinControl, Reg);
      if Reg.ValueExists(ValueName) then
      begin
        if Item is TUpDown then
          TUpDown(Item).Position := Reg.ReadInteger(ValueName);
        if Item is TEdit and (not TEdit(Item).ReadOnly) then
          TEdit(Item).Text := Reg.ReadString(ValueName);
        if Item is TMemo and (not TMemo(Item).ReadOnly) then
          TMemo(Item).Text := Reg.ReadString(ValueName);
        if Item is TSpinEdit then
          TSpinEdit(Item).Value := Reg.ReadInteger(ValueName);
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
  MemoItem: TMemo;
  Item: TComponent;
  ValueName: string;
begin
  for i := 0 to Control.ControlCount-1 do
  begin
    Item := Control.Controls[i];
    if Item is TWinControl then
    begin
      if TWinControl(Item).Tag = TAG_DONTSAVECONTROL then
        Continue;
      ValueName := Path + '.' + Item.Name;
      SaveControlParams(ValueName, Item as TWinControl, Reg);

      if Item is TUpDown then
        Reg.WriteInteger(ValueName, TUpDown(Item).Position);

      if Item is TEdit then
      begin
        EditItem := Item as TEdit;
        // В реестр записываем не более 4 кб
        if not EditItem.ReadOnly then
          Reg.WriteString(ValueName, Copy(EditItem.Text, 1, 4096));
      end;

      if Item is TMemo then
      begin
        MemoItem := Item as TMemo;
        // В реестр записываем не более 4 кб
        if not MemoItem.ReadOnly then
          Reg.WriteString(ValueName, Copy(MemoItem.Text, 1, 4096));
      end;

      if Item is TSpinEdit then
        Reg.WriteInteger(ValueName, TSpinEdit(Item).Value);

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

procedure CenterClientSite(AChildWnd, AParentWnd: HWND);
var
  ChildRect: TRect;
  ParentRect: TRect;
  ChildWidth, ChildHeight: Integer;
  ParentWidth, ParentHeight: Integer;
begin
  if IsWindow(AParentWnd) then
  begin
    GetWindowRect(AChildWnd, ChildRect);
    GetWindowRect(AParentWnd, ParentRect);
    ChildWidth := ChildRect.Right - ChildRect.Left;
    ChildHeight := ChildRect.Bottom - ChildRect.Top;
    ParentWidth := ParentRect.Right - ParentRect.Left;
    ParentHeight := ParentRect.Bottom - ParentRect.Top;

    MoveWindow(AChildWnd, ParentRect.Left + (ParentWidth - ChildWidth) div 2,
      ParentRect.Top + (ParentHeight - ChildHeight) div 2, ChildWidth,
      ChildHeight, TRUE);
  end;
end;

procedure VLE_AddPickProperty(AVLE: TValueListEditor; AName: string; AValueDef: string;
  APickItemNames: array of string; APickItemValues: array of Integer);
var
  i: Integer;
begin
  if not Assigned(AVLE) then
    Exit;
  AVLE.InsertRow(AName, AValueDef, True);
  if High(APickItemNames) = 0 then
    Exit;
  if High(APickItemNames) <> High(APickItemValues) then
    Exit;
  for i := 0 to High(APickItemnames) do
  begin
    AVLE.ItemProps[AName].EditStyle := esPickList;
    AVLE.ItemProps[AName].ReadOnly := True;
    AVLE.ItemProps[AName].PickList.AddObject(APickItemNames[i],
      TObject(APickItemValues[i]));
  end;
end;

procedure VLE_AddProperty(AVLE: TValueListEditor; AName: string; AValueDef: string);
begin
  VLE_AddPickProperty(AVLE, AName, AValueDef, [], []);
end;

function VLE_GetPropertyValue(AVLE: TValueListEditor; AName: string): string;
begin
  Result := AVLE.Values[AName];
end;

function VLE_GetPickPropertyValue(AVLE: TValueListEditor; AName: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to AVLE.ItemProps[AName].PickList.Count - 1 do
    if AVLE.ItemProps[AName].PickList.Strings[i] = AVLE.Values[AName] then
    begin
      Result := Integer(AVLE.ItemProps[AName].PickList.Objects[i]);
      Break;
    end;
end;

procedure VLE_SetPropertyValue(AVLE: TValueListEditor; AName: string; AValue: string);
begin
  AVLE.Values[AName] := AValue;
end;

procedure VLE_SETPickPropertyValue(AVLE: TValueListEditor; AName: string; AValue: Integer);
var
  i: Integer;
begin
  for i := 0 to AVLE.ItemProps[AName].PickList.Count - 1 do
    if Integer(AVLE.ItemProps[AName].PickList.Objects[i]) = AValue then
    begin
      AVLE.Values[AName] := AVLE.ItemProps[AName].PickList.Strings[i];
      Break;
    end;
end;

procedure VLE_AddSeparator(AVLE: TValueListEditor; AName: string);
begin
   AVLE.InsertRow('|;separator;|' + AName, '', True);
   AVLE.ItemProps['|;separator;|' + AName].ReadOnly := True;
end;

procedure VLE_DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  HT: Integer;
  HR: Integer;
  s: string;
  VLE: TValueListEditor;
begin
  if Sender is TValueListEditor then
    VLE := TValueListEditor(Sender)
  else
    Exit;

  if Pos('|;separator;|', VLE.Cells[ACol, ARow]) > 0 then
  begin
    VLE.Canvas.Brush.Color := VLE.Canvas.Pen.Color;
    VLE.Canvas.Rectangle(Rect);
    VLE.Canvas.Font.Style := [fsBold];
    HR := Rect.Bottom - Rect.Top;
    HT := VLE.Canvas.TextHeight(VLE.Cells[ACol, ARow]);
    s := VLE.Cells[ACol, ARow];
    Delete(s, 1, 13);
    VLE.Canvas.TextOut(Rect.Left + 10, Rect.Top + (HR-HT) div 2, s);
  end;
end;

function VLEParamsToString(AVLE: TValueListEditor): string;
var
  i: Integer;
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    for i := 1 to AVLE.RowCount - 1 do
      SL.Add(AVLE.Cells[1, i]);
    Result := SL.Text;
  finally
    SL.Free;
  end;
end;

procedure StringToVLEParams(AVLE: TValueListEditor; AStr: string);
var
  i: Integer;
  SL: TStringList;
begin
  SL := TStringList.Create;
  SL.Text := AStr;
  try
    if SL.Count <> (AVLE.RowCount - 1) then Exit;
    for i := 1 to AVLE.RowCount - 1 do
    begin
      AVLE.Cells[1, i] := SL[i - 1];
    end;
  finally
    SL.Free;
  end;
end;

procedure CheckIntStr(const AStr: string; const Msg: string);
begin
  if Length(AStr) > 1024 then
    raise Exception.Create(Format('Некорректное значение в поле "%s"', [Msg]));
end;

end.
