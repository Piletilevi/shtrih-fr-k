unit fmuRecpt;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmRecpt = class(TPage)
    btnOutputReceipt0: TButton;
    btnGetECRStatus: TButton;
    Memo: TMemo;
    btnOpenScreen: TButton;
    btnCloseScreen: TButton;
    btnOutputReceipt1: TButton;
    btnOutputReceipt2: TButton;
    procedure btnOutputReceipt0Click(Sender: TObject);
    procedure btnGetECRStatusClick(Sender: TObject);
    procedure btnOpenScreenClick(Sender: TObject);
    procedure btnCloseScreenClick(Sender: TObject);
    procedure btnOutputReceipt1Click(Sender: TObject);
    procedure btnOutputReceipt2Click(Sender: TObject);
  end;

implementation

{$R *.DFM}

procedure TfmRecpt.btnOutputReceipt0Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReceiptOutputType := 0;
    Driver.OutputReceipt;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRecpt.btnGetECRStatusClick(Sender: TObject);

  function BoolToStr(Value: Boolean): string;
  begin
    if Value then Result := '<есть>'
    else Result := '<нет>';
  end;

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
        Lines.Add('Бумага на входе в накопитель ' + BoolToStr(Driver.PresenterIn));
        Lines.Add('Бумага на выходе из накопителя ' + BoolToStr(Driver.PresenterOut));
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRecpt.btnOpenScreenClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.OpenScreen;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRecpt.btnCloseScreenClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.CloseScreen;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRecpt.btnOutputReceipt1Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReceiptOutputType := 1;
    Driver.OutputReceipt;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRecpt.btnOutputReceipt2Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReceiptOutputType := 2;
    Driver.OutputReceipt;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

end.
