unit fmuEJStatus;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, Forms, Sysutils, ExtCtrls, Graphics,
  // This
  untPages, untUtil, untDriver;

type
  { TfmEJStatus }

  TfmEJStatus = class(TPage)
    Memo: TMemo;
    btnGetEJCode1Status: TButton;
    btnGetEJCode2Status: TButton;
    btnEJVersion: TButton;
    btnGetEJSerialNumber: TButton;
    btnGetAll: TButton;
    procedure btnGetEJSerialNumberClick(Sender: TObject);
    procedure btnGetEJCode1StatusClick(Sender: TObject);
    procedure btnGetEJCode2StatusClick(Sender: TObject);
    procedure btnEJVersionClick(Sender: TObject);
    procedure btnGetAllClick(Sender: TObject);
  private
    procedure AddSeparator;
    procedure GetEKLZVersion;
    procedure GetEKLZCode1Status;
    procedure GetEKLZCode2Status;
    procedure GetEKLZSerialNumber;
  end;

implementation

{$R *.DFM}

{ TfmEJStatus }

procedure TfmEJStatus.btnGetEJSerialNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZSerialNumber;
    AddSeparator;    
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnGetEJCode1StatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode1Status;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnGetEJCode2StatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode2Status;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnEJVersionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZVersion;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.GetEKLZCode1Status;

  procedure EKLZFlagsToMemo;
  const
    DocType: array [0..3] of string = ('продажа', 'покупка', 'возврат продажи',
      'возврат покупки');
    BoolToStr:	array [Boolean] of string = ('[нет]', '[да]');
  var
    Flags: Integer;
  begin
    Flags := Driver.EKLZFlags;
    Memo.Lines.Add('  <T> Тип документа         : ' + DocType[Flags and $3]);
    Memo.Lines.Add('  <I> Открыт архив          : ' + BoolToStr[Flags and $4=$4]);
    Memo.Lines.Add('  <F> Выполнена активизация : ' + BoolToStr[Flags and $8=$8]);
    Memo.Lines.Add('  <W> Режим отчета          : ' + BoolToStr[Flags and $10=$10]);
    Memo.Lines.Add('  <D> Открыт документ       : ' + BoolToStr[Flags and $20=$20]);
    Memo.Lines.Add('  <S> Открыта смена         : ' + BoolToStr[Flags and $40=$40]);
    Memo.Lines.Add('  <A> Ошибка устройства     : ' + BoolToStr[Flags and $80=$80]);
  end;

begin
  Check(Driver.GetEKLZCode1Report);
  AddSeparator;
  Memo.Lines.Add(' Дата                 : ' + DateToStr(Driver.LastKPKDate));
  Memo.Lines.Add(' Время                : ' + TimeToStr(Driver.LastKPKTime));
  Memo.Lines.Add(' Итог                 : ' + CurrToStr(Driver.LastKPKDocumentResult));
  Memo.Lines.Add(' Номер КПК            : ' + IntToStr(Driver.LastKPKNumber));
  Memo.Lines.Add(' Заводской номер ЭКЛЗ : ' + Driver.EKLZNumber);
  AddSeparator;
  Memo.Lines.Add(' Флаги (' + IntToStr(Driver.EKLZFlags)+')');
  EKLZFlagsToMemo;
  // Прокручиваем Memo на начало
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmEJStatus.GetEKLZCode2Status;
begin
  Check(Driver.GetEKLZCode2Report);
  AddSeparator;
  Memo.Lines.Add(' Номер смены     : ' + IntToStr(Driver.SessionNumber));
  Memo.Lines.Add(' Продажа         : ' + CurrToStr(Driver.Summ1));
  Memo.Lines.Add(' Покупка         : ' + CurrToStr(Driver.Summ2));
  Memo.Lines.Add(' Возврат продаж  : ' + CurrToStr(Driver.Summ3));
  Memo.Lines.Add(' Возврат покупок : ' + CurrToStr(Driver.Summ4));
end;

procedure TfmEJStatus.GetEKLZSerialNumber;
begin
  Check(Driver.GetEKLZSerialNumber);
  AddSeparator;
  Memo.Lines.Add(' Заводской номер : ' + Driver.EKLZNumber);
end;

procedure TfmEJStatus.GetEKLZVersion;
begin
  Check(Driver.GetEKLZVersion);
  AddSeparator;
  Memo.Lines.Add(' Версия          : ' + Driver.EKLZVersion);
end;

procedure TfmEJStatus.btnGetAllClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode1Status;
    GetEKLZCode2Status;
    GetEKLZVersion;
    GetEKLZSerialNumber;
    AddSeparator;
    // Прокручиваем Memo на начало
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.AddSeparator;
begin
  Memo.Lines.Add(' ' + StringOfChar('-', 36));
end;

end.
