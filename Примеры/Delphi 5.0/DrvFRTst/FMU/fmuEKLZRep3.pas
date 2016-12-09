unit fmuEKLZRep3;

interface

uses
  // VCL
  Controls, StdCtrls, ExtCtrls, ComCtrls, Classes, SysUtils, Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmEKLZRep3 = class(TPage)
    rgReportType: TRadioGroup;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    udDepartment: TUpDown;
    lblStartDate: TLabel;
    dtpStartDate: TDateTimePicker;
    lblEndDate: TLabel;
    dtpEndDate: TDateTimePicker;
    btnEKLZDepartmentReportInDatesRange: TButton;
    btnEKLZSessionReportInDatesRange: TButton;
    Bevel1: TBevel;
    lblFirstSessionNumber: TLabel;
    edtFirstSessionNumber: TEdit;
    lblLastSessionNumber: TLabel;
    edtLastSessionNumber: TEdit;
    btnEKLZDepartmentReportInSessionsRange: TButton;
    btnEKLZSessionReportInSessionsRange: TButton;
    Label1: TLabel;
    Bevel2: TBevel;
    procedure btnEKLZDepartmentReportInDatesRangeClick(Sender: TObject);
    procedure btnEKLZDepartmentReportInSessionsRangeClick(Sender: TObject);
    procedure btnEKLZSessionReportInDatesRangeClick(Sender: TObject);
    procedure btnEKLZSessionReportInSessionsRangeClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnEKLZDepartmentReportInSessionsRangeMouseMove(
      Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnEKLZDepartmentReportInDatesRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEKLZSessionReportInDatesRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEKLZSessionReportInSessionsRangeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

{$R *.DFM}

procedure TfmEKLZRep3.btnEKLZDepartmentReportInDatesRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex <> 0;
    Driver.Department := StrToInt(edtDepartment.Text);
    Driver.FirstSessionDate := dtpStartDate.Date;
    Driver.LastSessionDate := dtpEndDate.Date;
    Driver.EKLZDepartmentReportInDatesRange;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep3.btnEKLZDepartmentReportInSessionsRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.Department := StrToInt(edtDepartment.Text);
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    Driver.EKLZDepartmentReportInSessionsRange;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep3.btnEKLZSessionReportInDatesRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.FirstSessionDate := dtpStartDate.Date;
    Driver.LastSessionDate := dtpEndDate.Date;
    Driver.EKLZSessionReportInDatesRange;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep3.btnEKLZSessionReportInSessionsRangeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ReportType := rgReportType.ItemIndex > 0;
    Driver.FirstSessionNumber := StrToInt(edtFirstSessionNumber.Text);
    Driver.LastSessionNumber := StrToInt(edtLastSessionNumber.Text);
    Driver.EKLZSessionReportInSessionsRange;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := clBtnFace;
    edtDepartment.Color := clWindow;
    dtpStartDate.Color := clWindow;
    dtpEndDate.Color := clWindow;
    edtFirstSessionNumber.Color := clWindow;
    edtLastSessionNumber.Color := clWindow;
  end;
end;

procedure TfmEKLZRep3.btnEKLZDepartmentReportInDatesRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtDepartment.Color := InColor;
    dtpStartDate.Color := InColor;
    dtpEndDate.Color := InColor;
  end;
end;

procedure TfmEKLZRep3.btnEKLZSessionReportInDatesRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    dtpStartDate.Color := InColor;
    dtpEndDate.Color := InColor;
  end;
end;

procedure TfmEKLZRep3.btnEKLZDepartmentReportInSessionsRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtDepartment.Color := InColor;
    edtFirstSessionNumber.Color := InColor;
    edtLastSessionNumber.Color := InColor;
  end;
end;

procedure TfmEKLZRep3.btnEKLZSessionReportInSessionsRangeMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rgReportType.Color := InColor;
    edtFirstSessionNumber.Color := InColor;
    edtLastSessionNumber.Color := InColor;
  end;
end;

end.
