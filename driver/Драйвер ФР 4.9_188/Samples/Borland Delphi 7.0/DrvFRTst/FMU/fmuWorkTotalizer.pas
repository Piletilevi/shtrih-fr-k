unit fmuWorkTotalizer;

interface

uses
    // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Buttons,
  // This
  untPages, untUtil, untDriver, untTypes;

type
  { TfmWorkTotalizer }

  TfmWorkTotalizer = class(TPage)
    Memo: TMemo;
    btnRead: TBitBtn;
    btnStop: TButton;
    btnReadAll: TButton;
    procedure btnReadClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnReadAllClick(Sender: TObject);
  private
    FStopFlag: Boolean;
    procedure AddRegisters;
    procedure AddAllRegisters;
    procedure AddCaption(S: string);
    procedure Terminate(const Message: string);
    procedure AddOperationRegisters(S: string; L: Integer; H: Integer);
  end;

implementation


{$R *.DFM}

{ TfmWorkTotalizer }

procedure TfmWorkTotalizer.AddCaption(S: string);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add(S);
  Memo.Lines.Add(' ' + StringOfChar('-', 54));
end;

procedure TfmWorkTotalizer.AddOperationRegisters(S: string; L: Integer; H: Integer);
var
  i: Integer;
  RegisterName: string;
begin
  AddCaption(S);
  for i := L to H do
  begin
    if FStopFlag then
      Terminate('<Прервано пользователем>');
    Driver.RegisterNumber := i;
    if Driver.GetOperationReg <> 0 then
    begin
      Terminate(Format('<Прервано в результате ошибки: %d %s>',
                  [Driver.ResultCode, Driver.ResultCodeDescription]));
    end;
    if i in [0..High(OperationRegisterName)] then
      RegisterName := OperationRegisterName[i]
    else
      RegisterName := '<Описание недоступно>';

    Memo.Lines.Add(Format(' %3d.%-45s : %s',
      [i+1, RegisterName, CurrToStr(Driver.ContentsOfOperationRegister)]));
    Application.ProcessMessages;
  end;
end;

procedure TfmWorkTotalizer.AddRegisters;
begin
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
  AddOperationRegisters(' Количество аннулированных чеков по :', $B3, $B6);
  AddOperationRegisters(' Количество нефискальных документов :', $B7, $B8);
  AddOperationRegisters(' Сквозной номер :', $B9, $B9);
end;

procedure TfmWorkTotalizer.AddAllRegisters;
var
  i: Integer;
begin
  for i := 0 to 255 do
  begin
    if FStopFlag then
      Terminate('<Прервано пользователем>');
    Driver.RegisterNumber := i;
    if Driver.GetOperationReg <> 0 then
    begin
      Terminate(Format('<Прервано в результате ошибки: %d %s>',
                  [Driver.ResultCode, Driver.ResultCodeDescription]));
    end;
    Memo.Lines.Add(Format(' %3d.%-48s : %s',
      [i+1, Driver.NameOperationReg, CurrToStr(Driver.ContentsOfOperationRegister)]));
    Application.ProcessMessages;
  end;
end;

procedure TfmWorkTotalizer.btnReadClick(Sender: TObject);
begin
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    try
      FStopFlag := False;
      Memo.Clear;
      AddCaption(' ОПЕРАЦИОННЫЕ РЕГИСТРЫ:');
      AddRegisters;
      // Прокручиваем Memo на начало
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on E:EAbort do
        Memo.Lines.Add(E.Message);
    end;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmWorkTotalizer.btnStopClick(Sender: TObject);
begin
  FStopFlag := True;
end;

procedure TfmWorkTotalizer.btnReadAllClick(Sender: TObject);
begin
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    try
      FStopFlag := False;
      Memo.Clear;
      AddCaption(' ОПЕРАЦИОННЫЕ РЕГИСТРЫ:');
      AddAllRegisters;
      // Прокручиваем Memo на начало
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on EAbort do
        Memo.Lines.Add('<Прервано пользователем>');
    end;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmWorkTotalizer.Terminate(const Message: string);
begin
  raise EAbort.Create(Message);
end;

end.
