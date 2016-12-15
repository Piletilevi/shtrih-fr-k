unit fmuEJSession;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,
  // This
  untPages, untDriver, Spin;
type
  TfmEJSession = class(TPage)
    Memo: TMemo;
    btnGetEKLZJournal: TBitBtn;
    btnStop: TBitBtn;
    lblSessionNumber: TLabel;
    btnGetEKLZSessionTotal: TBitBtn;
    btnEKLZJournalOnSessionNumber: TBitBtn;
    btnReadEKLZJournal: TBitBtn;
    seSessionNumber: TSpinEdit;
    procedure btnGetEKLZJournalClick(Sender: TObject);
    procedure btnGetEKLZSessionTotalClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnEKLZJournalOnSessionNumberClick(Sender: TObject);
    procedure btnReadEKLZJournalClick(Sender: TObject);
  private
    FStopFlag: Boolean;
    procedure GetEKLZData;
    procedure Check2(ResultCode: Integer);
  end;

implementation

{$R *.DFM}

///////////////////////////////////////////////////////////////////////////////
// Некоторый эксперт написал что неправильно выдавать ошибку
// Хорошо, ошибка будет просто очищаться в драйвере

procedure TfmEJSession.Check2(ResultCode: Integer);
begin
  if ResultCode <> 0 then
  begin
    if ResultCode = $A9 then
      Driver.ClearResult;

    Abort;
  end;
end;

procedure TfmEJSession.GetEKLZData;
begin
  Memo.Lines.Add('');
  Memo.Lines.Add(' Тип ККМ: ' + Driver.UDescription);
  Memo.Lines.Add('');
  repeat
    Check2(Driver.GetEKLZData);
    Memo.Lines.Add(' ' + Driver.EKLZData);
    Application.ProcessMessages;
  until FStopFlag;
  Driver.EKLZInterrupt;
end;

procedure TfmEJSession.btnGetEKLZJournalClick(Sender: TObject);
begin
  FStopFlag := False;
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    Memo.Clear;
    Driver.SessionNumber := seSessionNumber.Value;
    Check(Driver.GetEKLZJournal);
    GetEKLZData;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmEJSession.btnGetEKLZSessionTotalClick(Sender: TObject);
begin
  FStopFlag := False;
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    Memo.Clear;
    Driver.SessionNumber := seSessionNumber.Value;
    Check(Driver.GetEKLZSessionTotal);
    GetEKLZData;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmEJSession.btnStopClick(Sender: TObject);
begin
  FStopFlag := True;
end;

procedure TfmEJSession.btnEKLZJournalOnSessionNumberClick(
  Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.SessionNumber := seSessionNumber.Value;
    Driver.ReadEKLZSessionTotal;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJSession.btnReadEKLZJournalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.SessionNumber := seSessionNumber.Value;
    Driver.EKLZJournalOnSessionNumber;
  finally
    EnableButtons(True);
  end;
end;

end.
