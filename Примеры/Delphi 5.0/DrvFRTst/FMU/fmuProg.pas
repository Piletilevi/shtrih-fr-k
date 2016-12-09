unit fmuProg;

interface

uses
  // VCL
  ComCtrls, Controls, StdCtrls, ExtCtrls, Classes, SysUtils,
  Buttons, Graphics,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  { TfmProg }

  TfmProg = class(TPage)
    rgPointPosition: TRadioGroup;
    gbDate: TGroupBox;
    dtpDate: TDateTimePicker;
    btnCurrentDate: TButton;
    btnConfirmDate: TButton;
    gbTime: TGroupBox;
    dtpTime: TDateTimePicker;
    btnCurrentTime: TButton;
    gbSerialNumber: TGroupBox;
    edtSerialNumber: TEdit;
    gbLicense: TGroupBox;
    edtLicense: TEdit;
    btnSetSerialNumber: TBitBtn;
    btnReadLicense: TBitBtn;
    btnWriteLicense: TBitBtn;
    btnSetPointPosition: TBitBtn;
    btnSetTime: TBitBtn;
    btnSetDate: TBitBtn;
    procedure btnCurrentTimeClick(Sender: TObject);
    procedure btnSetTimeClick(Sender: TObject);
    procedure btnCurrentDateClick(Sender: TObject);
    procedure btnSetDateClick(Sender: TObject);
    procedure btnConfirmDateClick(Sender: TObject);
    procedure btnSetSerialNumberClick(Sender: TObject);
    procedure btnReadLicenseClick(Sender: TObject);
    procedure btnWriteLicenseClick(Sender: TObject);
    procedure btnSetPointPositionClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSetPointPositionMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSetSerialNumberMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCurrentDateMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnSetDateMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnWriteLicenseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnReadLicenseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnCurrentTimeMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnSetTimeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  end;


implementation

{$R *.DFM}

{ TfmProg }

procedure TfmProg.btnCurrentTimeClick(Sender: TObject);
begin
  dtpTime.Time := Time;
end;

procedure TfmProg.btnCurrentDateClick(Sender: TObject);
begin
  dtpDate.Date := Date;
end;

procedure TfmProg.btnSetTimeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Time := dtpTime.Time;
    Driver.SetTime;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnSetDateClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Date := dtpDate.Date;
    Driver.SetDate;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnConfirmDateClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Date := dtpDate.Date;
    Driver.ConfirmDate;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnSetSerialNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SerialNumber := edtSerialNumber.Text;
    Driver.SetSerialNumber;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnReadLicenseClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.ReadLicense = 0 then
      edtLicense.Text := GetLicense(Driver.License)
    else edtLicense.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnWriteLicenseClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.License := edtLicense.Text;
    Driver.WriteLicense;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.btnSetPointPositionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PointPosition := Boolean(rgPointPosition.ItemIndex);
    Driver.SetPointPosition;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmProg.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    rgPointPosition.Color := clBtnFace;
    dtpDate.Color := clWindow;
    dtpTime.Color := clWindow;
    edtSerialNumber.Color := clWindow;
    edtLicense.Color := clWindow;
  end;
end;

procedure TfmProg.btnSetPointPositionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    rgPointPosition.Color := InColor;
end;

procedure TfmProg.btnSetSerialNumberMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtSerialNumber.Color := InColor;
end;

procedure TfmProg.btnCurrentDateMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    dtpDate.Color := OutColor;
end;

procedure TfmProg.btnSetDateMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    dtpDate.Color := InColor;
end;

procedure TfmProg.btnWriteLicenseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtLicense.Color := InColor;
end;

procedure TfmProg.btnReadLicenseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtLicense.Color := OutColor;
end;

procedure TfmProg.btnCurrentTimeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    dtpTime.Color := OutColor;
end;

procedure TfmProg.btnSetTimeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    dtpTime.Color := InColor;
end;

end.
