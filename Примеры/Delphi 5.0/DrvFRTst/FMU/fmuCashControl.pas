unit fmuCashControl;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, WinSock, ExtCtrls, Buttons,
  // This
  untPages, WSockets, untUtil;

type
  TfmCashControl = class(TPage)
    Memo: TMemo;
    btnClear: TBitBtn;
    lblCashControl: TLabel;
    Bevel1: TBevel;
    lblProtocol: TLabel;
    rbTCP: TRadioButton;
    rbUDP: TRadioButton;
    lblPort: TLabel;
    edtPort: TEdit;
    btnOpenPort: TBitBtn;
    btnClosePort: TBitBtn;
    procedure btnOpenPortClick(Sender: TObject);
    procedure btnClosePortClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnOpenPortMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FCount: Integer;
    FStrings: TStrings;
    FUDPServer: TUDPServer;
    FTCPServer: TTCPServer;
    procedure ServerData(Sender: TObject; Socket: TSocket);
    property UDPServer: TUDPServer read FUDPServer;
    property TCPServer: TTCPServer read FTCPServer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  fmCashControl: TfmCashControl;

implementation

{$R *.DFM}

function StrToHex(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
  begin
    if i <> 1 then Result := Result + ' ';
    Result := Result + IntToHex(Ord(S[i]), 2);
  end;
end;

{ TfmMain }

constructor TfmCashControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUDPServer := TUDPServer.Create(Self);
  FTCPServer := TTCPServer.Create(Self);
  FUDPServer.OnData := ServerData;
  FTCPServer.OnData := ServerData;
  FStrings := TStringList.Create;
end;

destructor TfmCashControl.Destroy;
begin
  FStrings.Free;
  inherited Destroy;
end;

procedure TfmCashControl.ServerData(Sender: TObject; Socket: TSocket);
var
  Data: string;
  SockAddrIn: TSockAddrIn;
begin
  if Sender is TTCPServer then
  begin
    Data := (Sender as TTCPServer).Read(Socket);
  end else
  begin
    Data := (Sender as TUDPServer).Read(Socket, SockAddrIn);
  end;
  Memo.Lines.Text := Memo.Lines.Text + Data;
end;

procedure TfmCashControl.btnOpenPortClick(Sender: TObject);
begin
  if rbTCP.Checked then
  begin
    TCPServer.Close;
    TCPServer.Port := edtPort.Text;
    TCPServer.Open;
  end else
  begin
    UDPServer.Close;
    UDPServer.Port := edtPort.Text;
    UDPServer.Open;
  end;
end;

procedure TfmCashControl.btnClosePortClick(Sender: TObject);
begin
  UDPServer.Close;
  TCPServer.Close;
end;

procedure TfmCashControl.btnClearClick(Sender: TObject);
begin
  Memo.Clear;
  FStrings.Clear;
  FCount := 0;
end;

procedure TfmCashControl.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
  begin
    rbTCP.Color := clBtnFace;
    rbUDP.Color := clBtnFace;
    edtPort.Color := clWindow;
  end;
end;

procedure TfmCashControl.btnOpenPortMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rbTCP.Color := InColor;
    rbUDP.Color := InColor;
    edtPort.Color := InColor;
  end;
end;

end.
