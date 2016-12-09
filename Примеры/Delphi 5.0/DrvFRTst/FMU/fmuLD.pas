unit fmuLD;

interface

uses
  // VCL
  StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons, Graphics,
  // This
  untPages, CompName, untDriver, TestManager, untUtil;

type
  TfmLD = class(TPage)
    lblLDIndex: TLabel;
    lblLDCount: TLabel;
    lblBaudRate: TLabel;
    lblComNumber: TLabel;
    lblLDNumber: TLabel;
    lblLDName: TLabel;
    edtLDName: TEdit;
    edtLDNumber: TEdit;
    cbComNumber: TComboBox;
    cbBaudRate: TComboBox;
    edtLDCount: TEdit;
    edtLDIndex: TEdit;
    lblTimeout: TLabel;
    edtTimeout: TEdit;
    lblComputer: TLabel;
    edtComputerName: TEdit;
    btnComputerName: TButton;
    lblLD: TLabel;
    Bevel1: TBevel;
    btnAddLD: TBitBtn;
    btnDeleteLD: TBitBtn;
    btnSetParamLD: TBitBtn;
    btnGetParamLD: TBitBtn;
    btnSetActiveLD: TBitBtn;
    btnGetActiveLD: TBitBtn;
    btnGetCountLD: TBitBtn;
    btnEnumLD: TBitBtn;
    procedure btnAddLDClick(Sender: TObject);
    procedure btnDeleteLDClick(Sender: TObject);
    procedure btnGetCountLDClick(Sender: TObject);
    procedure btnEnumLDClick(Sender: TObject);
    procedure btnSetParamLDClick(Sender: TObject);
    procedure btnGetParamLDClick(Sender: TObject);
    procedure btnSetActiveLDClick(Sender: TObject);
    procedure btnGetActiveLDClick(Sender: TObject);
    procedure btnComputerNameClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSetParamLDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnComputerNameMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnDeleteLDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnAddLDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetCountLDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnEnumLDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetParamLDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnGetActiveLDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnSetActiveLDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    procedure SetLDParams;
    procedure GetLDParams;
  end;

implementation

{$R *.DFM}

procedure TfmLD.SetLDParams;
begin
  Driver.LDName := edtLDName.Text;
  Driver.LDBaudrate := cbBaudRate.ItemIndex;
  Driver.LDComNumber := cbComNumber.ItemIndex+1;
  Driver.LDComputerName := edtComputerName.Text;
  Driver.LDTimeout := StrToInt(edtTimeout.Text);
end;

procedure TfmLD.GetLDParams;
begin
  edtLDName.Text := Driver.LDName;
  edtLDNumber.Text := IntToStr(Driver.LDNumber);
  cbComNumber.ItemIndex := Driver.LDComNumber-1;
  cbBaudRate.ItemIndex := Driver.LDBaudrate;
  edtLDCount.Text := IntToStr(Driver.LDCount);
  edtLDIndex.Text := IntToStr(Driver.LDIndex);
  edtComputerName.Text := Driver.LDComputerName;
  edtTimeout.Text := IntToStr(Driver.LDTimeout);
end;

procedure TfmLD.btnAddLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    SetLDParams;
    Driver.AddLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnDeleteLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.LDNumber := StrToInt(edtLDNumber.Text);
    Driver.DeleteLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnGetCountLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.GetCountLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnEnumLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.LDIndex := StrToInt(edtLDIndex.Text);
    Driver.EnumLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnSetParamLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.LDNumber := StrToInt(edtLDNumber.Text);
    SetLDParams;
    Driver.SetParamLD;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnGetParamLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.LDNumber := StrToInt(edtLDNumber.Text);
    Driver.GetParamLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnSetActiveLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.LDNumber := StrToInt(edtLDNumber.Text);
    Driver.SetActiveLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnGetActiveLDClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.GetActiveLD;
    GetLDParams;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmLD.btnComputerNameClick(Sender: TObject);
var
  ComputerName: string;
begin
  if BrowseComputer(Handle, ComputerName, 'Укажите имя компьютера', -1) then
    edtComputerName.Text := ComputerName;
end;

procedure TfmLD.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtLDName.Color := clWindow;
    edtLDNumber.Color := clWindow;
    cbComNumber.Color := clWindow;
    cbBaudRate.Color := clWindow;
    edtLDCount.Color := clBtnFace;
    edtLDIndex.Color := clWindow;
    edtTimeout.Color := clWindow;
    edtComputerName.Color := clWindow;
  end;
end;

procedure TfmLD.btnSetParamLDMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLDNumber.Color := InColor;
    edtLDName.Color := InColor;
    cbComNumber.Color := InColor;
    cbBaudRate.Color := InColor;
    edtComputerName.Color := InColor;
    edtTimeout.Color := InColor;
  end;
end;

procedure TfmLD.btnComputerNameMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtComputerName.Color := InColor;
end;

procedure TfmLD.btnAddLDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtLDName.Color := InColor;
    cbBaudRate.Color := InColor;
    cbComNumber.Color := InColor;
    edtComputerName.Color := InColor;
    edtTimeout.Color := InColor;
    edtLDCount.Color := OutColor;
    edtLDIndex.Color := OutColor;
    edtLDNumber.Color := OutColor;
  end;
end;

procedure TfmLD.btnDeleteLDMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    edtLDNumber.Color := InColor;
end;

procedure TfmLD.btnGetCountLDMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    edtLDCount.Color := OutColor;
end;

procedure TfmLD.btnEnumLDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtLDIndex.Color := InColor;
    edtLDNumber.Color := OutColor;
    edtLDName.Color := OutColor;
    cbComNumber.Color := OutColor;
    cbBaudRate.Color := OutColor;
    edtComputerName.Color := OutColor;
    edtTimeout.Color := OutColor;
  end;
end;

procedure TfmLD.btnGetParamLDMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLDNumber.Color := InColor;
    edtLDName.Color := OutColor;
    cbComNumber.Color := OutColor;
    cbBaudRate.Color := OutColor;
    edtComputerName.Color := OutColor;
    edtTimeout.Color := OutColor;
  end;
end;

procedure TfmLD.btnGetActiveLDMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLDNumber.Color := OutColor;
    edtLDIndex.Color := OutColor;
  end;
end;

procedure TfmLD.btnSetActiveLDMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtLDNumber.Color := InColor;
end;

end.
