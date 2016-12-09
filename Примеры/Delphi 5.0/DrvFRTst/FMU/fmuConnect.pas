unit fmuConnect;

interface

uses
  // VCL
  Windows, StdCtrls, ComCtrls, Controls, ExtCtrls, Graphics, Classes, SysUtils,
  // This
  untPages, untUtil, CompName;

type
  TfmConnect = class(TPage)
    btnGetExchangeParam: TButton;
    btnSetExchangeParam: TButton;
    edtPortNumber: TEdit;
    lblPortNumber: TLabel;
    udPortNumber: TUpDown;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Image1: TImage;
    lblCOMNumber: TLabel;
    cbCOMNumber: TComboBox;
    cbBaudRate: TComboBox;
    edtTimeout: TEdit;
    lblTimeout: TLabel;
    lblBaudRate: TLabel;
    udTimeout: TUpDown;
    Label1: TLabel;
    Bevel: TBevel;
    lblComputerName: TLabel;
    btnServerConnect: TButton;
    edtComputerName: TEdit;
    btnComputerName: TButton;
    btnServerDisconnect: TButton;
    Image2: TImage;
    Label2: TLabel;
    Bevel1: TBevel;
    btnLockPort: TButton;
    btnUnlockPort: TButton;
    btnAdminUnlockPort: TButton;
    btnAdminUnlockPorts: TButton;
    btnCreateDriver: TButton;
    btnDeleteDriver: TButton;
    procedure btnGetExchangeParamClick(Sender: TObject);
    procedure btnSetExchangeParamClick(Sender: TObject);
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
    Start;
    Driver.Password := Password;
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
    Start;
    Driver.Password := Password;
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
    Start;
    Driver.Password := Password;
    Driver.ComNumber := cbComNumber.ItemIndex + 1;
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
    Start;
    Driver.Password := Password;
    Driver.Disconnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnComputerNameClick(Sender: TObject);
var
  ComputerName: string;
begin
  if BrowseComputer(Handle, ComputerName, 'Укажите имя компьютера', -1) then
    edtComputerName.Text := ComputerName;
end;

procedure TfmConnect.btnServerConnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Start;
    Driver.Password := Password;
    Driver.ComputerName := edtComputerName.Text;
    Driver.ServerConnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnServerDisconnectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Start;
    Driver.Password := Password;
    Driver.ServerDisconnect;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnLockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Start;
    Driver.Password := Password;
    Driver.ComNumber := cbComNumber.ItemIndex + 1;
    Driver.LockPort;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnUnlockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Start;
    Driver.Password := Password;
    Driver.UnlockPort;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmConnect.btnAdminUnlockPortClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Start;
    Driver.Password := Password;
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
    Start;
    Driver.Password := Password;
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
  cbComNumber.ItemIndex := Driver.ComNumber-1;
  edtComputerName.Text := Driver.ComputerName;
end;

end.
