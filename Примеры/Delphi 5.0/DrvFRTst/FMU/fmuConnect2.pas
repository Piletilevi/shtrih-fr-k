unit fmuConnect2;

interface

uses
  // VCL
  Windows, StdCtrls, ComCtrls, Controls, ExtCtrls, Graphics, Classes, SysUtils,
  Buttons,
  // This
  untPages, untUtil, CompName, untDriver, TestManager;
type
  TfmConnect = class(TPage)
    Label1: TLabel;
    Bevel1: TBevel;
    btnConnect: TBitBtn;
    btnDisconnect: TBitBtn;
    btnGetExchangeParam: TBitBtn;
    btnSetExchangeParam: TBitBtn;
    gbParams: TGroupBox;
    lblCOMNumber: TLabel;
    lblBaudRate: TLabel;
    lblTimeout: TLabel;
    lblPortNumber: TLabel;
    cbCOMNumber: TComboBox;
    cbBaudRate: TComboBox;
    edtTimeout: TEdit;
    udTimeout: TUpDown;
    edtPortNumber: TEdit;
    udPortNumber: TUpDown;
    procedure btnGetExchangeParamClick(Sender: TObject);
    procedure btnSetExchangeParamClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnAdminUnlockPortClick(Sender: TObject);
    procedure btnAdminUnlockPortsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnConnectMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetExchangeParamMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSetExchangeParamMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;

implementation

{$R *.DFM}

function GetCompName: string;
var
  Size: DWORD;
  LocalMachine: array [0..MAX_COMPUTERNAME_LENGTH] of char;
begin
  Size := Sizeof(LocalMachine);
  if GetComputerName(LocalMachine, Size) then
    Result := LocalMachine else Result := '';
end;

{ TfmECRSt }

procedure TfmConnect.btnGetExchangeParamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PortNumber := StrToInt(edtPortNumber.Text);
    if Driver.GetExchangeParam = 0 then
    begin
      udTimeout.Position := Driver.Timeout;
      edtTimeout.Text := IntToStr(Driver.Timeout);
      cbBaudRate.ItemIndex := Driver.BaudRate;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnSetExchangeParamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Timeout := StrToInt(edtTimeout.Text);
    Driver.BaudRate := cbBaudRate.ItemIndex;
    Driver.PortNumber := StrToInt(edtPortNumber.Text);
    Driver.SetExchangeParam;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnConnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ComNumber := cbCOMNumber.ItemIndex + 1;
    Driver.BaudRate := cbBaudRate.ItemIndex;
    Driver.Timeout := StrToInt(edtTimeout.Text);
    Driver.Connect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnDisconnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Disconnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnAdminUnlockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.AdminUnlockPort;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnAdminUnlockPortsClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.AdminUnlockPorts;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.FormShow(Sender: TObject);
begin
  udTimeout.Position := Driver.Timeout;
  edtTimeout.Text := IntToStr(Driver.Timeout);
  cbBaudRate.ItemIndex := Driver.BaudRate;
  cbCOMNumber.ItemIndex := Driver.ComNumber-1;
end;

procedure TfmConnect.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    cbCOMNumber.Color := clWindow;
    cbBaudRate.Color := clWindow;
    edtTimeout.Color := clWindow;
    edtPortNumber.Color := clWindow;
  end;
end;

procedure TfmConnect.btnConnectMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    cbCOMNumber.Color := InColor;
    cbBaudRate.Color := InColor;
    edtTimeout.Color := InColor;
  end;
end;

procedure TfmConnect.btnGetExchangeParamMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtPortNumber.Color := OutColor;
    cbBaudRate.Color := OutColor;
    edtTimeout.Color := OutColor;
  end;
end;

procedure TfmConnect.btnSetExchangeParamMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtPortNumber.Color := InColor;
    cbBaudRate.Color := InColor;
    edtTimeout.Color := InColor;
  end;  
end;

end.
