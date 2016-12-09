unit fmuTest;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, ComCtrls,
  // This
  untPages, untDriver, TestManager, Buttons, untUtil;

type
  { TfmTest }

  TfmTest = class(TPage)
    lblRepCount2: TLabel;
    lblRepCount: TLabel;
    lblErrCount2: TLabel;
    lblErrCount: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    chbStopOnError: TCheckBox;
    lblSpeed: TLabel;
    lblTxSpeed: TLabel;
    Label1: TLabel;
    lblErrRate: TLabel;
    Bevel1: TBevel;
    lblTimeLeft2: TLabel;
    lblTimeLeft: TLabel;
    Label2: TLabel;
    lblCommandTime: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    lblTime: TLabel;
    lblTest: TLabel;
    btnTestConnect: TBitBtn;
    edtTime: TEdit;
    Bevel3: TBevel;
    Label4: TLabel;
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTestConnectClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnTestConnectMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    StopFlag: Boolean;
  end;

implementation

{$R *.DFM}

{ TfmTest }

procedure TfmTest.btnStartClick(Sender: TObject);
var
  Speed: Integer;
  ErrRate: Double;
  TimeLeft: DWORD;
  TickCount: DWORD;
  RepCount: Integer;
  ErrCount: Integer;
  ResultCode: Integer;
begin
  RepCount := 0;
  ErrCount := 0;
  StopFlag := False;
  btnStop.Enabled := True;
  btnStart.Enabled := False;
  TickCount := GetTickCount;
  try
    repeat
      Inc(RepCount);
      DriverManager.StartTest;
      ResultCode := Driver.GetShortECRStatus;
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

procedure TfmTest.btnStopClick(Sender: TObject);
begin
  StopFlag := True;
end;

procedure TfmTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopFlag := True;
end;

procedure TfmTest.btnTestConnectClick(Sender: TObject);
var
  T: DWORD;
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.StringForPrinting := 'Строка для печати';
    T := GetTickCount;
    for i := 1 to 100 do
      if Driver.PrintString <> 0 then Break;
    Driver.CutType := True;
    Driver.CutCheck;
    edtTime.Text := IntToStr(GetTickCount - T);
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTest.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
    edtTime.Color := clBtnFace;
end;

procedure TfmTest.btnTestConnectMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtTime.Color := OutColor;
end;

end.
