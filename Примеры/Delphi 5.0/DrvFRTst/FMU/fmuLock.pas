unit fmuLock;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untDriver, TestManager;
type
  TfmLock = class(TPage)
    Bevel1: TBevel;
    lblRepCount2: TLabel;
    lblRepCount: TLabel;
    lblErrCount2: TLabel;
    lblErrCount: TLabel;
    lblSpeed: TLabel;
    lblTxSpeed: TLabel;
    Label1: TLabel;
    lblErrRate: TLabel;
    lblTimeLeft2: TLabel;
    lblTimeLeft: TLabel;
    Label2: TLabel;
    lblCommandTime: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    chbStopOnError: TCheckBox;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    StopFlag: Boolean;
  end;

implementation

{$R *.DFM}

procedure TfmLock.btnStartClick(Sender: TObject);
  procedure Wait(T2: DWORD);
  var
    T1: DWORD;
  begin
    T1 := GetTickCount;
    repeat
      Application.ProcessMessages;
    until GetTickCount - T1 > T2;
  end;
var
  i: Integer;
  Speed: Integer;
  ErrRate: Double;
  TimeLeft: DWORD;
  TickCount: DWORD;
  ProcessID: DWORD;
  RepCount: Integer;
  ErrCount: Integer;
  ResultCode: Integer;
begin
  RepCount := 0;
  ErrCount := 0;
  ResultCode := 0;
  StopFlag := False;
  btnStop.Enabled := True;
  btnStart.Enabled := False;
  TickCount := GetTickCount;
  try
    repeat
      Inc(RepCount);
      DriverManager.StartTest;
      try
        ResultCode := Driver.LockPort;
      except
      end;
      if ResultCode <> 0 then
      begin
        ResultCode := 0;
        Wait(100);
      end else
      try
        GetWindowThreadProcessId(Application.Handle, @ProcessID);
        Driver.StringForPrinting := '-------------------------------';
        ResultCode := Driver.PrintString;
        Driver.WaitForPrinting;
        for i := 1 to 10 do
        begin
          Driver.StringForPrinting :=
          IntToStr(i)+': Строка для печати(ID:'+IntToStr(ProcessID)+')';
          ResultCode := Driver.PrintString;
          Driver.WaitForPrinting;
          if ResultCode <> 0 then Break;
        end;
        Driver.CutType := True;
        Driver.FeedDocument;
        Driver.CutCheck;
      finally
        Driver.UnlockPort;
        Wait(500); // Чтобы другие тоже могли захватить порт
      end;

      if ResultCode <> 0 then Inc(ErrCount);

      TimeLeft := GetTickCount - TickCount;
      if TimeLeft = 0 then Continue;

      Speed := Trunc(RepCount*1000/TimeLeft);
      ErrRate := ErrCount*100/RepCount;

      lblRepCount.Caption := IntToStr(RepCount);
      lblErrCount.Caption := IntToStr(ErrCount);
      lblTxSpeed.Caption := IntToStr(Speed);
      lblErrRate.Caption := Format('%.2f', [ErrRate]);
      lblTimeLeft.Caption := IntToStr(Trunc(TimeLeft/1000));
      lblCommandTime.Caption := IntToStr(Trunc(TimeLeft/RepCount));
      DriverManager.StopTest;
      UpdatePage;
      Application.ProcessMessages;
      if (ResultCode <> 0)and(chbStopOnError.Checked) then Exit;
    until StopFlag;
  finally
    Driver.Disconnect;
    btnStop.Enabled := False;
    btnStart.Enabled := True;
  end;
end;

procedure TfmLock.btnStopClick(Sender: TObject);
begin
  StopFlag := True;
end;

procedure TfmLock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopFlag := True;
end;

end.
