unit fmuPresenter;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untUtil, untDriver;

type
  { TfmPresenter }

  TfmPresenter = class(TPage)
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

{ TfmPresenter }

procedure TfmPresenter.btnOutputReceipt0Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ReceiptOutputType := 0;
    Driver.OutputReceipt;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPresenter.btnGetECRStatusClick(Sender: TObject);

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
    ResultCode := Driver.GetECRStatus;

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

procedure TfmPresenter.btnOpenScreenClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.OpenScreen;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPresenter.btnCloseScreenClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.CloseScreen;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPresenter.btnOutputReceipt1Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ReceiptOutputType := 1;
    Driver.OutputReceipt;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPresenter.btnOutputReceipt2Click(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ReceiptOutputType := 2;
    Driver.OutputReceipt;
  finally
    EnableButtons(True);
  end;
end;

end.
