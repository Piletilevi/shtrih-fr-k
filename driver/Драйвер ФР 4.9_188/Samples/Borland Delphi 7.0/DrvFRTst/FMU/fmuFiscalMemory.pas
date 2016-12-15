unit fmuFiscalMemory;

interface

uses
  // VCL
  ExtCtrls, StdCtrls, Controls, Classes, SysUtils, Buttons, Graphics, 
  // This
  untPages, untUtil, untDriver;

type
  { TfmFiscalMemory }

  TfmFiscalMemory = class(TPage)
    grpRecordsSum: TGroupBox;
    lblSumm1: TLabel;
    lblSumm3: TLabel;
    lblSumm2: TLabel;
    lblSumm4: TLabel;
    edtSumm1: TEdit;
    edtSumm3: TEdit;
    edtSumm2: TEdit;
    edtSumm4: TEdit;
    btnGetFMRecordsSum: TBitBtn;
    cbFMType: TComboBox;
    lblType: TLabel;
    grpLastFMRecord: TGroupBox;
    lblFMType: TLabel;
    edtFMType: TEdit;
    lblFMDate: TLabel;
    edtFMDate: TEdit;
    btnGetLastFMRecordDate: TBitBtn;
    grpInitFM: TGroupBox;
    btnInitFM: TButton;
    procedure btnGetFMRecordsSumClick(Sender: TObject);
    procedure btnGetLastFMRecordDateClick(Sender: TObject);
    procedure btnInitFMClick(Sender: TObject);
  end;

implementation

{$R *.DFM}

{ TfmFiscalMemory }

procedure TfmFiscalMemory.btnGetFMRecordsSumClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.TypeOfSumOfEntriesFM := Boolean(cbFMType.ItemIndex);
    if Driver.GetFMRecordsSum = 0 then
    begin
      edtSumm1.Text := CurrToStr(Driver.Summ1);
      edtSumm2.Text := CurrToStr(Driver.Summ2);
      edtSumm3.Text := CurrToStr(Driver.Summ3);
      edtSumm4.Text := CurrToStr(Driver.Summ4);
    end else
    begin
      edtSumm1.Clear;
      edtSumm2.Clear;
      edtSumm3.Clear;
      edtSumm4.Clear;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFiscalMemory.btnGetLastFMRecordDateClick(Sender: TObject);
begin
  EnableButtons(False);
  try
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
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFiscalMemory.btnInitFMClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.InitFM;
  finally
    EnableButtons(True);
  end;
end;

end.
