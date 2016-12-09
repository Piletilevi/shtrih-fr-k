unit fmuBel;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Graphics,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmBel = class(TPage)
    btnGetLongSerialNumberAndLongRNM: TButton;
    btnSetLongSerialNumber: TButton;
    btnFiscalizationWithLongRNM: TButton;
    edtDate: TEdit;
    edtSessionNumber: TEdit;
    edtFreeRegistration: TEdit;
    edtRegistrationNumber: TEdit;
    edtINN: TEdit;
    edtNewPasswordTI: TEdit;
    edtRNM: TEdit;
    edtSerialNumber: TEdit;
    lblSerialNumber: TLabel;
    lblRNM: TLabel;
    lblNewPasswordTI: TLabel;
    lblINN: TLabel;
    lblRegistrationNumber: TLabel;
    lblFreeRegistration: TLabel;
    lblSessionNumber: TLabel;
    lblDate: TLabel;
    btnFiscParams: TButton;
    lblLD: TLabel;
    Bevel1: TBevel;
    procedure btnGetLongSerialNumberAndLongRNMClick(Sender: TObject);
    procedure btnSetLongSerialNumberClick(Sender: TObject);
    procedure btnFiscalizationWithLongRNMClick(Sender: TObject);
    procedure btnFiscParamsClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetLongSerialNumberAndLongRNMMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSetLongSerialNumberMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFiscalizationWithLongRNMMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFiscParamsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  end;

implementation

{$R *.DFM}

procedure TfmBel.btnGetLongSerialNumberAndLongRNMClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetLongSerialNumberAndLongRNM = 0 then
    begin
      edtRNM.Text := GetRNM(Driver.RNM);
      edtSerialNumber.Text := GetSerialNumber(Driver.SerialNumber);
    end else
    begin
      edtRNM.Clear;
      edtSerialNumber.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmBel.btnSetLongSerialNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SerialNumber := edtSerialNumber.Text;
    Driver.SetLongSerialNumber;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmBel.btnFiscalizationWithLongRNMClick(Sender: TObject);
begin
  if not ConfirmFiscalization(Handle) then Exit;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.NewPasswordTI := StrToInt(edtNewPasswordTI.Text);
    Driver.RNM := edtRNM.Text;
    Driver.INN := edtINN.Text;
    if Driver.FiscalizationWithLongRNM = 0 then
    begin
      edtRegistrationNumber.Text := IntToStr(Driver.RegistrationNumber);
      edtFreeRegistration.Text := IntToStr(Driver.FreeRegistration);
      edtSessionNumber.Text := IntToStr(Driver.SessionNumber);
      edtDate.Text := DateToStr(Driver.Date);
    end
    else begin
      edtFreeRegistration.Clear;
      edtSessionNumber.Clear;
      edtDate.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmBel.btnFiscParamsClick(Sender: TObject);
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

procedure TfmBel.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtRegistrationNumber.Color := clWindow;
    edtINN.Color := clWindow;
    edtNewPasswordTI.Color := clWindow;
    edtRNM.Color := clWindow;
    edtSerialNumber.Color := clWindow;
    edtFreeRegistration.Color := clBtnFace;
    edtSessionNumber.Color := clBtnFace;
    edtDate.Color := clBtnFace;
  end;
end;

procedure TfmBel.btnGetLongSerialNumberAndLongRNMMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtRNM.Color := OutColor;
    edtSerialNumber.Color := OutColor;
  end;
end;

procedure TfmBel.btnSetLongSerialNumberMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtSerialNumber.Color := InColor;
end;

procedure TfmBel.btnFiscalizationWithLongRNMMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtINN.Color := InColor;
    edtRNM.Color := InColor;
    edtNewPasswordTI.Color := InColor;
    edtDate.Color := OutColor;
    edtSessionNumber.Color := OutColor;
    edtFreeRegistration.Color := OutColor;
    edtRegistrationNumber.Color := OutColor;
  end;
end;

procedure TfmBel.btnFiscParamsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtRegistrationNumber.Color := InColor;
    edtINN.Color := OutColor;
    edtRNM.Color := OutColor;
    edtDate.Color := OutColor;
    edtNewPasswordTI.Color := OutColor;
    edtSessionNumber.Color := OutColor;
  end;
end;

end.
