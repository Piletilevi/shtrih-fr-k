unit fmuServer;

interface

uses
  // VCL
  Windows, StdCtrls, ComCtrls, Controls, ExtCtrls, Graphics, Classes, SysUtils,
  // This
  untPages, untUtil, CompName, untDriver, TestManager, Buttons;

type

  { TfmServer }

  TfmServer = class(TPage)
    lblComputerName: TLabel;
    edtComputerName: TEdit;
    lblCOMNumber: TLabel;
    cbCOMNumber: TComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    btnServerConnect: TBitBtn;
    btnServerDisconnect: TBitBtn;
    btnLockPort: TBitBtn;
    btnAdminUnlockPort: TBitBtn;
    btnUnlockPort: TBitBtn;
    btnAdminUnlockPorts: TBitBtn;
    btnDeleteDriver: TBitBtn;
    btnCreateDriver: TBitBtn;
    btnComputerName: TBitBtn;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnComputerNameClick(Sender: TObject);
    procedure btnServerConnectClick(Sender: TObject);
    procedure btnServerDisconnectClick(Sender: TObject);
    procedure btnLockPortClick(Sender: TObject);
    procedure btnUnlockPortClick(Sender: TObject);
    procedure btnAdminUnlockPortClick(Sender: TObject);
    procedure btnAdminUnlockPortsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCreateDriverClick(Sender: TObject);
    procedure btnDeleteDriverClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnLockPortMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnComputerNameMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnServerConnectMouseMove(Sender: TObject;
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

{ TfmServer }

procedure TfmServer.btnConnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ComNumber := cbComNumber.ItemIndex + 1;
    Driver.Connect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmServer.btnDisconnectClick(Sender: TObject);
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

procedure TfmServer.btnComputerNameClick(Sender: TObject);
var
  ComputerName: string;
begin
  if BrowseComputer(Handle, ComputerName, 'Укажите имя компьютера', -1) then
    edtComputerName.Text := ComputerName;
end;

procedure TfmServer.btnServerConnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ComputerName := edtComputerName.Text;
    Driver.ServerConnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmServer.btnServerDisconnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ServerDisconnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmServer.btnLockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ComNumber := cbComNumber.ItemIndex + 1;
    Driver.LockPort;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmServer.btnUnlockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.UnlockPort;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmServer.btnAdminUnlockPortClick(Sender: TObject);
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

procedure TfmServer.btnAdminUnlockPortsClick(Sender: TObject);
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

procedure TfmServer.FormShow(Sender: TObject);
begin
  cbComNumber.ItemIndex := Driver.ComNumber-1;
  edtComputerName.Text := Driver.ComputerName;
end;

procedure TfmServer.btnCreateDriverClick(Sender: TObject);
begin
  Driver;
end;

procedure TfmServer.btnDeleteDriverClick(Sender: TObject);
begin
  FreeDriver;
end;

procedure TfmServer.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtComputerName.Color := clWindow;
    cbCOMNumber.Color := clWindow;
  end;
end;

procedure TfmServer.btnLockPortMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    cbCOMNumber.Color := InColor;
end;

procedure TfmServer.btnComputerNameMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtComputerName.Color := OutColor;
end;

procedure TfmServer.btnServerConnectMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtComputerName.Color := InColor;
end;

end.
