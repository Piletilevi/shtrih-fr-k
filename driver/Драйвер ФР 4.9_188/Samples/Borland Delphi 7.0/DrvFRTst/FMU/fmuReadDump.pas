unit fmuReadDump;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Buttons, Graphics, Dialogs,
  // This
  untPages, untUtil, fmuDump, untDriver;

type
  { TfmReadDump }

  TfmReadDump = class(TPage)
    lblDeviceCode: TLabel;
    cbDeviceCode: TComboBox;
    grpBlockRequest: TGroupBox;
    lblData: TLabel;
    lblBlockNumber: TLabel;
    lblBlockCount: TLabel;
    btnDampRequest: TButton;
    Memo: TMemo;
    edtBlockCount: TEdit;
    edtBlockNumber: TEdit;
    btnGetData: TBitBtn;
    btnInterruptDataStream: TBitBtn;
    grpAllBlocks: TGroupBox;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    btnViewData: TBitBtn;
    ProgressBar: TProgressBar;
    lblCount: TLabel;
    dlgSave: TSaveDialog;
    btnSaveDump: TBitBtn;
    procedure btnDampRequestClick(Sender: TObject);
    procedure btnGetDataClick(Sender: TObject);
    procedure btnInterruptDataStreamClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnViewDataClick(Sender: TObject);
    procedure btnSaveDumpClick(Sender: TObject);
  private
    FDump: string;
    FCount: Integer;
    FStopFlag: Boolean;
    procedure ReadData;
  end;

implementation

uses fmuMain;

{$R *.DFM}

{ TfmReadDump }

procedure TfmReadDump.ReadData;
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

procedure TfmReadDump.btnDampRequestClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.DeviceCode := cbDeviceCode.ItemIndex + 1;
    if Driver.DampRequest = 0 then
      edtBlockCount.Text := IntToStr(Driver.DataBlockNumber)
    else
      edtBlockCount.Clear;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmReadDump.btnGetDataClick(Sender: TObject);
var
  Index: Integer;
begin
  Memo.Clear;
  EnableButtons(False);
  try
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
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmReadDump.btnInterruptDataStreamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.InterruptDataStream;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmReadDump.btnStartClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.DeviceCode := cbDeviceCode.ItemIndex + 1;
    if Driver.DampRequest = 0 then
    begin
      FCount := Driver.DataBlockNumber;
      FStopFlag := False;
      ReadData;
    end;
  finally
    TfmMain(Owner).SetPage(Self); { !!! }
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmReadDump.btnStopClick(Sender: TObject);
begin
  FStopFlag := True;
  EnableButtons(True);
  btnStop.Enabled := False;
  ProgressBar.Visible := False;
end;

procedure TfmReadDump.btnViewDataClick(Sender: TObject);
var
  DeviceRec: TDeviceRec;
begin
  DeviceRec.Code := Driver.DeviceCode;
  DeviceRec.Description := Driver.DeviceCodeDescription;
  ShowDumpDlg(Self, FDump, DeviceRec);
end;

procedure TfmReadDump.btnSaveDumpClick(Sender: TObject);
var
  Stream: TFileStream;
begin
  if not dlgSave.Execute then Exit;
  Stream := TFileStream.Create(dlgSave.FileName, fmCreate);
  try
    Stream.Write(FDump[1], Length(FDump));
  finally
    Stream.Free;
  end;
end;

end.
