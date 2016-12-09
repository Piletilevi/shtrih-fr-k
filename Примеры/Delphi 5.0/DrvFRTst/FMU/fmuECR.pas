unit fmuECR;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Buttons, Graphics,
  // This
  untPages, untUtil, fmuDump, untDriver, TestManager;

type
  TfmECR = class(TPage)
    btnDampRequest: TButton;
    Memo: TMemo;
    lblData: TLabel;
    lblBlockNumber: TLabel;
    lblBlockCount: TLabel;
    lblDeviceCode: TLabel;
    cbDeviceCode: TComboBox;
    edtBlockCount: TEdit;
    edtBlockNumber: TEdit;
    ProgressBar: TProgressBar;
    lblCount: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    btnViewData: TBitBtn;
    btnGetData: TBitBtn;
    btnInterruptDataStream: TBitBtn;
    procedure btnDampRequestClick(Sender: TObject);
    procedure btnGetDataClick(Sender: TObject);
    procedure btnInterruptDataStreamClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnViewDataClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnDampRequestMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnGetDataMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnStartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FDump: string;
    FCount: Integer;
    FStopFlag: Boolean;
    procedure ReadData;
  end;

implementation

{$R *.DFM}

procedure TfmECR.ReadData;
var
  S: string;
  i: Integer;
  ResultCode: Integer;
  ResultCodeDescription: string;
begin
  try
    FDump := '';
    ResultCode := 0;
    FStopFlag := False;
    btnStop.Enabled := True;
    ProgressBar.Max := FCount;
    ProgressBar.Position := 0;
    ProgressBar.Visible := True;
    lblCount.Visible := True;

    for i := 1 to FCount do
    begin
      if FStopFlag then Break;
      ResultCode := Driver.GetData;
      if ResultCode = 0 then
      begin
        FDump := FDump + Driver.DataBlock;
        ProgressBar.Position := i;
        lblCount.Caption := 'Получено блоков: ' + IntToStr(i);
      end else
      begin
        ResultCode := Driver.ResultCode;
        ResultCodeDescription := Driver.ResultCodeDescription;
        S := Format('Ошибка ККМ %d: %s'#13#10'Продолжить?',
          [ResultCode, ResultCodeDescription]);

        if MessageBox(Handle, PChar(S), PChar(Application.Title),
          MB_ICONEXCLAMATION or MB_OKCANCEL) = ID_CANCEL then Break;
      end;
      Application.ProcessMessages;
    end;
    if ResultCode = 0 then Driver.InterruptDataStream;
    btnStart.Enabled := True;
    btnStop.Enabled := False;
    ProgressBar.Visible := False;
    lblCount.Visible := False;
  except
    on E: Exception do Application.ShowException(E);
  end;
end;

procedure TfmECR.btnDampRequestClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.DeviceCode := cbDeviceCode.ItemIndex + 1;
    if Driver.DampRequest = 0 then
      edtBlockCount.Text := IntToStr(Driver.DataBlockNumber)
    else
      edtBlockCount.Clear;

    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECR.btnGetDataClick(Sender: TObject);
var
  Index: Integer;
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetData = 0 then
    begin
      edtBlockNumber.Text := IntToStr(Driver.DataBlockNumber);
      Index := 1;
      repeat
        Memo.Lines.Add(StrToHex(Copy(Driver.DataBlock, Index, 16)));
        Index := Index +16;
      until Index > Length(Driver.DataBlock);
    end else
    begin
      edtBlockNumber.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECR.btnInterruptDataStreamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InterruptDataStream;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECR.btnStartClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.DeviceCode := cbDeviceCode.ItemIndex + 1;
    if Driver.DampRequest = 0 then
    begin
      FCount := Driver.DataBlockNumber;
      FStopFlag := False;
      ReadData;
    end;
  finally
    EnableButtons(True);
    UpdatePage;
  end;
end;

procedure TfmECR.btnStopClick(Sender: TObject);
begin
  FStopFlag := True;
  EnableButtons(True);
  btnStop.Enabled := False;
  ProgressBar.Visible := False;
end;

procedure TfmECR.btnViewDataClick(Sender: TObject);
var
  DeviceRec: TDeviceRec;
begin
  DeviceRec.Code := Driver.DeviceCode;
  DeviceRec.Description := Driver.DeviceCodeDescription;
  ShowDumpDlg(Self, FDump, DeviceRec);
end;

procedure TfmECR.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    cbDeviceCode.Color := clWindow;
    edtBlockCount.Color := clBtnFace;
    edtBlockNumber.Color := clBtnFace;
    Memo.Color := clBtnFace;
  end;
end;

procedure TfmECR.btnDampRequestMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    cbDeviceCode.Color := InColor;
    edtBlockCount.Color := OutColor;
  end;
end;

procedure TfmECR.btnGetDataMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
  begin
    edtBlockNumber.Color := OutColor;
    Memo.Color := OutColor;
  end;
end;

procedure TfmECR.btnStartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
    cbDeviceCode.Color := InColor;
end;

end.
