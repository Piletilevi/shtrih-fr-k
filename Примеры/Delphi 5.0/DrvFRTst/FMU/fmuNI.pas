unit fmuNI;

interface

uses
  // VCL
  Windows, ComCtrls, Controls, StdCtrls, ExtCtrls, Classes, SysUtils, Graphics,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmNI = class(TPage)
    btnFiscalization: TButton;
    btnGetFiscalizationParameters: TButton;
    btnGetRangeDatesAndSessions: TButton;
    btnFiscalReportforDatesRange: TButton;
    btnFiscalReportforSessionRange: TButton;
    btnInterruptFullReport: TButton;
    rgReportType: TRadioGroup;
    lblLD: TLabel;
    Bevel1: TBevel;
    edtNewPasswordTI: TEdit;
    edtRNM: TEdit;
    edtINN: TEdit;
    edtRegistrationNumber: TEdit;
    edtFreeRegistration: TEdit;
    edtSessionNumber: TEdit;
    edtDate: TEdit;
    dtpFirstSessionDate: TDateTimePicker;
    dtpLastSessionDate: TDateTimePicker;
    edtFirstSessionNumber: TEdit;
    edtLastSessionNumber: TEdit;
    lblLastSessionNumber: TLabel;
    lblFirstSessionNumber: TLabel;
    lblLastSessionDate: TLabel;
    lblFirstSessionDate: TLabel;
    lblDate: TLabel;
    lblSessionNumber: TLabel;
    lblFreeRegistration: TLabel;
    lblRegistrationNumber: TLabel;
    lblINN: TLabel;
    lblRNM: TLabel;
    lblNewPasswordTI: TLabel;
    procedure btnFiscalizationClick(Sender: TObject);
    procedure btnGetFiscalizationParametersClick(Sender: TObject);
    procedure btnGetRangeDatesAndSessionsClick(Sender: TObject);
    procedure btnFiscalReportforDatesRangeClick(Sender: TObject);
    procedure btnFiscalReportforSessionRangeClick(Sender: TObject);
    procedure btnInterruptFullReportClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFiscalizationMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetFiscalizationParametersMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetRangeDatesAndSessionsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFiscalReportforDatesRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFiscalReportforSessionRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

{$R *.DFM}

procedure TfmNI.btnFiscalizationClick(Sender: TObject);
begin
  if not ConfirmFiscalization(Handle) then Exit;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.NewPasswordTI := StrToInt(edtNewPasswordTI.Text);
    Driver.RNM := edtRNM.Text;
    Driver.INN := edtINN.Text;
    if Driver.Fiscalization = 0 then
    begin
      edtRegistrationNumber.Text := IntToStr(Driver.RegistrationNumber);
      edtFreeRegistration.Text := IntToStr(Driver.FreeRegistration);
      edtSessionNumber.Text := IntToStr(Driver.SessionNumber);
      edtDate.Text := DateToStr(Driver.Date);
    end else
    begin
      edtFreeRegistration.Clear;
      edtSessionNumber.Clear;
      edtDate.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.btnGetFiscalizationParametersClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.RegistrationNumber := StrToInt(edtRegistrationNumber.Text);
    if Driver.GetFiscalizationParameters = 0 then
    begin
      edtNewPasswordTI.Text := IntToStr(Driver.NewPasswordTI);
      edtRNM.Text := GetRNM(Driver.RNM);
      edtINN.Text := GetINN(Driver.INN);
      edtSessionNumber.Text := IntToStr(Driver.SessionNumber);
      edtDate.Text := DateToStr(Driver.Date);
    end else
    begin
      edtDate.Clear;
      edtSessionNumber.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.btnGetRangeDatesAndSessionsClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetRangeDatesAndSessions = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.btnFiscalReportforDatesRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := Boolean(rgReportType.ItemIndex);
    Driver.FirstSessionDate := dtpFirstSessionDate.Date;
    Driver.LastSessionDate := dtpLastSessionDate.Date;
    if Driver.FiscalReportforDatesRange = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.btnFiscalReportforSessionRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := Boolean(rgReportType.ItemIndex);
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    if Driver.FiscalReportforSessionRange = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.btnInterruptFullReportClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InterruptFullReport;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmNI.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := clBtnFace;
    edtLastSessionNumber.Color := clWindow;
    edtFirstSessionNumber.Color := clWindow;
    edtNewPasswordTI.Color := clWindow;
    edtRNM.Color := clWindow;
    edtINN.Color := clWindow;
    edtRegistrationNumber.Color := clWindow;
    edtFreeRegistration.Color := clBtnFace;
    edtSessionNumber.Color := clBtnFace;
    edtDate.Color := clBtnFace;
    dtpFirstSessionDate.Color := clWindow;
    dtpLastSessionDate.Color := clWindow;
  end;
end;

procedure TfmNI.btnFiscalizationMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtNewPasswordTI.Color := InColor;
    edtRNM.Color := InColor;
    edtINN.Color := InColor;
    edtRegistrationNumber.Color := OutColor;
    edtFreeRegistration.Color := OutColor;
    edtSessionNumber.Color := OutColor;
    edtDate.Color := OutColor;
  end;
end;

procedure TfmNI.btnGetFiscalizationParametersMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtRegistrationNumber.Color := InColor;
    edtNewPasswordTI.Color := OutColor;
    edtRNM.Color := OutColor;
    edtINN.Color := OutColor;
    edtSessionNumber.Color := OutColor;
    edtDate.Color := OutColor;
  end;
end;

procedure TfmNI.btnGetRangeDatesAndSessionsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLastSessionNumber.Color := OutColor;
    edtFirstSessionNumber.Color := OutColor;
    dtpFirstSessionDate.Color := OutColor;
    dtpLastSessionDate.Color := OutColor;
  end;
end;

procedure TfmNI.btnFiscalReportforDatesRangeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtSessionNumber.Color := InColor;
    edtRegistrationNumber.Color := InColor;
    dtpFirstSessionDate.Color := InColor;
    dtpLastSessionDate.Color := InColor;
    edtLastSessionNumber.Color := OutColor;
    edtFirstSessionNumber.Color := OutColor;
  end;
end;

procedure TfmNI.btnFiscalReportforSessionRangeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtSessionNumber.Color := InColor;
    edtRegistrationNumber.Color := InColor;
    edtLastSessionNumber.Color := InColor;
    edtFirstSessionNumber.Color := InColor;
    dtpFirstSessionDate.Color := OutColor;
    dtpLastSessionDate.Color := OutColor;
  end;
end;

end.
