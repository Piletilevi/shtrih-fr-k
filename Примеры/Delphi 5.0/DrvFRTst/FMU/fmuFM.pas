unit fmuFM;

interface

uses
  // VCL
  ExtCtrls, StdCtrls, Controls, Classes, SysUtils, Buttons, Graphics, 
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmFM = class(TPage)
    btnInitFM: TButton;
    rgFMType: TRadioGroup;
    lblSumm1: TLabel;
    lblSumm3: TLabel;
    lblSumm2: TLabel;
    lblSumm4: TLabel;
    edtSumm1: TEdit;
    edtSumm3: TEdit;
    edtSumm2: TEdit;
    edtSumm4: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    lblFMType: TLabel;
    edtFMType: TEdit;
    lblFMDate: TLabel;
    edtFMDate: TEdit;
    Bevel3: TBevel;
    btnGetFMRecordsSum: TBitBtn;
    btnGetLastFMRecordDate: TBitBtn;
    procedure btnGetFMRecordsSumClick(Sender: TObject);
    procedure btnGetLastFMRecordDateClick(Sender: TObject);
    procedure btnInitFMClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetFMRecordsSumMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetLastFMRecordDateMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

{$R *.DFM}

{ TfmFM }

procedure TfmFM.btnGetFMRecordsSumClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TypeOfSumOfEntriesFM := Boolean(rgFMType.ItemIndex);
    if Driver.GetFMRecordsSum = 0 then
    begin
      edtSumm1.Text := CurrToStr(Driver.Summ1);
      edtSumm2.Text := CurrToStr(Driver.Summ3);
      edtSumm3.Text := CurrToStr(Driver.Summ2);
      edtSumm4.Text := CurrToStr(Driver.Summ4);
    end else
    begin
      edtSumm1.Clear;
      edtSumm2.Clear;
      edtSumm3.Clear;
      edtSumm4.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFM.btnGetLastFMRecordDateClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetLastFMRecordDate = 0 then
    begin
      if Driver.TypeOfLastEntryFM then edtFMType.Text := 'Смен. итог'
      else edtFMType.Text := 'Фискал.';
      edtFMDate.Text := DateToStr(Driver.Date);
    end
    else begin
      edtFMType.Clear;
      edtFMDate.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFM.btnInitFMClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InitFM;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFM.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    rgFMType.Color := clBtnFace;
    edtSumm1.Color := clBtnFace;
    edtSumm3.Color := clBtnFace;
    edtSumm2.Color := clBtnFace;
    edtSumm4.Color := clBtnFace;
    edtFMType.Color := clBtnFace;
    edtFMDate.Color := clBtnFace;
  end;
end;

procedure TfmFM.btnGetFMRecordsSumMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgFMType.Color := InColor;
    edtSumm1.Color := OutColor;
    edtSumm2.Color := OutColor;
    edtSumm3.Color := OutColor;
    edtSumm4.Color := OutColor;
  end;
end;

procedure TfmFM.btnGetLastFMRecordDateMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtFMType.Color := OutColor;
    edtFMDate.Color := OutColor;
  end;
end;

end.
