unit fmuEKLZ2;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, Forms, Sysutils, ExtCtrls, Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmEKLZ2 = class(TPage)
    gbStatus: TGroupBox;
    Memo: TMemo;
    btnGetEKLZSerialNumber: TButton;
    btnGetEKLZVersion: TButton;
    btnGetEKLZCode2Status: TButton;
    btnGetEKLZCode1Status: TButton;
    lblResultCode: TLabel;
    lblEKLZResultCode: TLabel;
    edtEKLZResultCode: TEdit;
    btnSetEKLZResultCode: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure btnGetEKLZSerialNumberClick(Sender: TObject);
    procedure btnGetEKLZCode1StatusClick(Sender: TObject);
    procedure btnGetEKLZCode2StatusClick(Sender: TObject);
    procedure btnGetEKLZVersionClick(Sender: TObject);
    procedure btnSetEKLZResultCodeClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSetEKLZResultCodeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;

implementation

{$R *.DFM}

{ TfmEKLZ2 }

procedure TfmEKLZ2.btnGetEKLZSerialNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZSerialNumber = 0 then
    begin
      Memo.Lines.Add('');
      Memo.Lines.Add(' Заводской номер: ' + Driver.EKLZNumber);
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ2.btnGetEKLZCode1StatusClick(Sender: TObject);

  procedure EKLZFlagsToMemo;
  const
    DocType: array [0..3] of string = ('продажа', 'покупка', 'возврат продажи', 'возврат покупки');
    BS:	array [Boolean] of string = ('нет', 'да');
  var
    Flags: Integer;
  begin
    Flags := Driver.EKLZFlags;
    with Memo do
    begin
      Lines.Add('  <T> Тип документа: ' + DocType[Flags and $3]);
      Lines.Add('  <I> Открыт архив: ' + BS[Flags and $4=$4]);
      Lines.Add('  <F> Выполнена активизация: ' + BS[Flags and $8=$8]);
      Lines.Add('  <W> Режим отчета: ' + BS[Flags and $10=$10]);
      Lines.Add('  <D> Открыт документ: ' + BS[Flags and $20=$20]);
      Lines.Add('  <S> Открыта смена: ' + BS[Flags and $40=$40]);
      Lines.Add('  <A> Ошибка устройства: ' + BS[Flags and $80=$80]);
    end;
  end;

begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZCode1Report = 0 then
    begin
      with Memo do
      begin
        Lines.Add('');
        Lines.Add(' Дата                 : ' + DateToStr(Driver.LastKPKDate));
        Lines.Add(' Время                : ' + TimeToStr(Driver.LastKPKTime));
        Lines.Add(' Итог                 : ' + CurrToStr(Driver.LastKPKDocumentResult));
        Lines.Add(' Номер КПК            : ' + IntToStr(Driver.LastKPKNumber));
        Lines.Add(' Заводской номер ЭКЛЗ : ' + Driver.EKLZNumber);
        Lines.Add(' Флаги (' + IntToStr(Driver.EKLZFlags)+')');
      end;
      EKLZFlagsToMemo;
      // Прокручиваем Memo на начало
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ2.btnGetEKLZCode2StatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZCode2Report = 0 then
    begin
      with Memo do
      begin
        Lines.Add('');
        Lines.Add(' Номер смены     : ' + IntToStr(Driver.SessionNumber));
        Lines.Add(' Продажа         : ' + CurrToStr(Driver.Summ1));
        Lines.Add(' Покупка         : ' + CurrToStr(Driver.Summ2));
        Lines.Add(' Возврат продаж  : ' + CurrToStr(Driver.Summ3));
        Lines.Add(' Возврат покупок : ' + CurrToStr(Driver.Summ4));
      end;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ2.btnGetEKLZVersionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Memo.Clear;
    if Driver.GetEKLZVersion = 0 then
    begin
      Memo.Lines.Add('');
      Memo.Lines.Add(' Версия: ' + Driver.EKLZVersion);
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ2.btnSetEKLZResultCodeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.EKLZResultCode := StrToInt(edtEKLZResultCode.Text);
    Driver.SetEKLZResultCode;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
    edtEKLZResultCode.Color := clWindow;
end;

procedure TfmEKLZ2.btnSetEKLZResultCodeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtEKLZResultCode.Color := InColor;
end;

end.
