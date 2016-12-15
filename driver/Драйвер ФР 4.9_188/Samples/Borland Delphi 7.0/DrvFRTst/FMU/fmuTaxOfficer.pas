unit fmuTaxOfficer;

interface

uses
  // VCL
  Windows, ComCtrls, Controls, StdCtrls, ExtCtrls, Classes, SysUtils,
  Graphics, Dialogs,
  // This
  untPages, untUtil, untDriver;

type
  { TfmTaxOfficer }

  TfmTaxOfficer = class(TPage)
    btnFiscalization: TButton;
    btnGetFiscalizationParameters: TButton;
    btnGetRangeDatesAndSessions: TButton;
    btnFiscalReportforDatesRange: TButton;
    btnFiscalReportforSessionRange: TButton;
    btnInterruptFullReport: TButton;
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
    cbReportType: TComboBox;
    lblReportType: TLabel;
    btnOperationalTaxReport: TButton;
    procedure btnFiscalizationClick(Sender: TObject);
    procedure btnGetFiscalizationParametersClick(Sender: TObject);
    procedure btnGetRangeDatesAndSessionsClick(Sender: TObject);
    procedure btnFiscalReportforDatesRangeClick(Sender: TObject);
    procedure btnFiscalReportforSessionRangeClick(Sender: TObject);
    procedure btnInterruptFullReportClick(Sender: TObject);
    procedure btnOperationalTaxReportClick(Sender: TObject);
    procedure edtNewPasswordTIKeyPress(Sender: TObject; var Key: Char);
  private
    function ConfirmNI: Boolean;  
  end;

implementation

{$R *.DFM}

{ TfmTaxOfficer }

procedure TfmTaxOfficer.btnFiscalizationClick(Sender: TObject);
begin
  if not ConfirmFiscalization(Handle) then Exit;
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    CheckIntStr(edtNewPasswordTI.Text, 'Новый пароль НИ');
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
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.btnGetFiscalizationParametersClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    CheckIntStr(edtRegistrationNumber.Text, 'Номер фискализации');
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
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.btnGetRangeDatesAndSessionsClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    if Driver.GetRangeDatesAndSessions = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.btnFiscalReportforDatesRangeClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    Driver.ReportType := Boolean(cbReportType.ItemIndex);
    Driver.FirstSessionDate := dtpFirstSessionDate.Date;
    Driver.LastSessionDate := dtpLastSessionDate.Date;
    if Driver.FiscalReportforDatesRange = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.btnFiscalReportforSessionRangeClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    CheckIntStr(edtFirstSessionNumber.Text, 'Начальная смена');
    CheckIntStr(edtLastSessionNumber.Text, 'Конечная смена');
    Driver.ReportType := Boolean(cbReportType.ItemIndex);
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    if Driver.FiscalReportforSessionRange = 0 then
    begin
      edtFirstSessionNumber.Text := IntToStr(Driver.FirstSessionNumber);
      edtLastSessionNumber.Text := IntToStr(Driver.LastSessionNumber);
      dtpFirstSessionDate.Date := Driver.FirstSessionDate;
      dtpLastSessionDate.Date := Driver.LastSessionDate;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.btnInterruptFullReportClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;

  EnableButtons(False);
  try
    Driver.InterruptFullReport;
  finally
    EnableButtons(True);
  end;
end;

function TfmTaxOfficer.ConfirmNI: Boolean;
begin
  if Driver.EnteredTaxPassword = Driver.Password then
  begin
    Result := True;
    Exit;
  end;
  Result := MessageBox(Handle,
    PChar(Format('Будет введен пароль налогового инспектора (%d)'+#13+#10+
    'В случае ошибки принтер будет заблокирован до ввода правильного пароля.'
    +#13+#10+'Продолжить?', [Driver.Password])),
    'Внимание!',
    MB_ICONEXCLAMATION or MB_YESNO) = ID_YES;
end;

procedure TfmTaxOfficer.btnOperationalTaxReportClick(Sender: TObject);
begin
  if not ConfirmNI then Exit;
  EnableButtons(False);
  try
    Driver.PrintOperationalTaxReport;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTaxOfficer.edtNewPasswordTIKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(VK_TAB), Chr(VK_DELETE), Chr(VK_BACK)]) then
    Key := #0;
end;

end.
