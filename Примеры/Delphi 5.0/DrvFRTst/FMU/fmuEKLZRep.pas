unit fmuEKLZRep;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, SysUtils, Buttons, Graphics,
  // This
  untPages, fmuData, untDriver, TestManager, untUtil;

type
  TfmEKLZRep = class(TPage)
    rgReportType: TRadioGroup;
    edtDepartment: TEdit;
    udDepartment: TUpDown;
    dtpFirstSessionDate: TDateTimePicker;
    dtpLastSessionDate: TDateTimePicker;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    btnGetEKLZDepartmentReportInDatesRange: TButton;
    btnGetEKLZSessionReportInDatesRange: TButton;
    Bevel1: TBevel;
    lblFirstSessionNumber: TLabel;
    edtFirstSessionNumber: TEdit;
    lblLastSessionNumber: TLabel;
    edtLastSessionNumber: TEdit;
    btnGetEKLZDepartmentReportInSessionsRange: TButton;
    btnGetEKLZSessionReportInSessionsRange: TButton;
    Bevel2: TBevel;
    lblStopEKLZDocumentPrinting: TLabel;
    lblUDescription: TLabel;
    edtUDescription: TEdit;
    lblDepartment: TLabel;
    Label1: TLabel;
    Bevel3: TBevel;
    btnShowData: TBitBtn;
    btnGetEKLZData: TBitBtn;
    Bevel4: TBevel;
    procedure btnGetEKLZDepartmentReportInDatesRangeClick(Sender: TObject);
    procedure btnGetEKLZDepartmentReportInSessionsRangeClick(Sender: TObject);
    procedure btnGetEKLZSessionReportInDatesRangeClick(Sender: TObject);
    procedure btnGetEKLZSessionReportInSessionsRangeClick(Sender: TObject);
    procedure btnGetEKLZDataClick(Sender: TObject);
    procedure btnShowDataClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetEKLZSessionReportInDatesRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetEKLZDepartmentReportInDatesRangeMouseMove(
      Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnGetEKLZDepartmentReportInSessionsRangeMouseMove(
      Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnGetEKLZSessionReportInSessionsRangeMouseMove(
      Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    fmData: TfmData;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

constructor TfmEKLZRep.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fmData := TfmData.Create(Self);
end;

procedure TfmEKLZRep.btnGetEKLZDepartmentReportInDatesRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.Department := StrToInt(edtDepartment.Text);
    Driver.FirstSessionDate := dtpFirstSessionDate.Date;
    Driver.LastSessionDate := dtpLastSessionDate.Date;

    if Driver.GetEKLZDepartmentReportInDatesRange = 0 then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;

    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep.btnGetEKLZDepartmentReportInSessionsRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.Department := StrToInt(edtDepartment.Text);
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    if Driver.GetEKLZDepartmentReportInSessionsRange = 0 then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep.btnGetEKLZSessionReportInDatesRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.FirstSessionDate := dtpFirstSessionDate.Date;
    Driver.LastSessionDate := dtpLastSessionDate.Date;
    if Driver.GetEKLZSessionReportInDatesRange = 0 Then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep.btnGetEKLZSessionReportInSessionsRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    if Driver.GetEKLZSessionReportInSessionsRange=0 Then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep.btnGetEKLZDataClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZData = 0 then
      fmData.Memo.Lines.Add(Driver.EKLZData);
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep.btnShowDataClick(Sender: TObject);
begin
  fmData.Show;
end;

procedure TfmEKLZRep.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := clBtnFace;
    edtDepartment.Color := clWindow;
    dtpFirstSessionDate.Color := clWindow;
    dtpLastSessionDate.Color := clWindow;
    edtFirstSessionNumber.Color := clWindow;
    edtLastSessionNumber.Color := clWindow;
    edtUDescription.Color := clBtnFace;
  end;
end;

procedure TfmEKLZRep.btnGetEKLZDepartmentReportInDatesRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtDepartment.Color := InColor;
    dtpFirstSessionDate.Color := InColor;
    dtpLastSessionDate.Color := InColor;
    edtUDescription.Color := OutColor;
  end;
end;

procedure TfmEKLZRep.btnGetEKLZSessionReportInDatesRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    dtpFirstSessionDate.Color := InColor;
    dtpLastSessionDate.Color := InColor;
    edtUDescription.Color := OutColor;
  end;
end;

procedure TfmEKLZRep.btnGetEKLZDepartmentReportInSessionsRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtDepartment.Color := InColor;
    edtFirstSessionNumber.Color := InColor;
    edtLastSessionNumber.Color := InColor;
    edtUDescription.Color := OutColor;
  end;
end;

procedure TfmEKLZRep.btnGetEKLZSessionReportInSessionsRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtFirstSessionNumber.Color := InColor;
    edtLastSessionNumber.Color := InColor;
    edtUDescription.Color := OutColor;
  end;
end;

end.
