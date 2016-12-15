unit fmuConnection;

interface

uses
  // VCL
  Windows, StdCtrls, ComCtrls, Controls, ExtCtrls, Graphics, Classes, SysUtils,
  Buttons,
  // This
  untPages, untUtil, CompName, untDriver, Spin;

type
  { TfmConnect }

  TfmConnection = class(TPage)
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
    seTimeout: TSpinEdit;
    sePortNumber: TSpinEdit;
    chkConnected: TCheckBox;
    btnWaitConnection: TButton;
    lblConnectionTimeout: TLabel;
    seConnectionTimeout: TSpinEdit;
    btnWaitForPrinting: TButton;
    btnWaitForCheckClose: TButton;
    procedure btnGetExchangeParamClick(Sender: TObject);
    procedure btnSetExchangeParamClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnAdminUnlockPortClick(Sender: TObject);
    procedure btnAdminUnlockPortsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkConnectedClick(Sender: TObject);
    procedure btnWaitConnectionClick(Sender: TObject);
    procedure btnWaitForPrintingClick(Sender: TObject);
    procedure btnWaitForCheckCloseClick(Sender: TObject);
  public
    procedure UpdatePage; override;
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

{ TfmConnect }

procedure TfmConnection.btnGetExchangeParamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.PortNumber := sePortNumber.Value;
    if Driver.GetExchangeParam = 0 then
    begin
      seTimeout.Value := Driver.Timeout;
      cbBaudRate.ItemIndex := Driver.BaudRate;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnSetExchangeParamClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Timeout := seTimeout.Value;
    Driver.BaudRate := cbBaudRate.ItemIndex;
    Driver.PortNumber := sePortNumber.Value;
    Driver.SetExchangeParam;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnConnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ComNumber := cbCOMNumber.ItemIndex + 1;
    Driver.BaudRate := cbBaudRate.ItemIndex;
    Driver.Timeout := seTimeout.Value;
    Driver.Connect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnDisconnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Disconnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnAdminUnlockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.AdminUnlockPort;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnAdminUnlockPortsClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.AdminUnlockPorts;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.FormShow(Sender: TObject);
begin
  seTimeout.Value := Driver.Timeout;
  cbBaudRate.ItemIndex := Driver.BaudRate;
  cbCOMNumber.ItemIndex := Driver.ComNumber-1;
  seConnectionTimeout.Value := Driver.ConnectionTimeout;
end;

procedure TfmConnection.chkConnectedClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Connected := chkConnected.Checked;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.UpdatePage;
begin
  chkConnected.Checked := Driver.Connected;
end;

procedure TfmConnection.btnWaitConnectionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ConnectionTimeout := seConnectionTimeout.Value;
    Driver.WaitConnection;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnWaitForPrintingClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ConnectionTimeout := seConnectionTimeout.Value;
    Driver.WaitForPrinting;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnection.btnWaitForCheckCloseClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ConnectionTimeout := seConnectionTimeout.Value;
    Driver.WaitForCheckClose;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

end.
