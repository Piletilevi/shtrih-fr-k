unit fmuCashControl;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, WinSock, ExtCtrls, Buttons,
  // This
  untPages, WSockets, untUtil;

type
  { TfmCashControl }

  TfmCashControl = class(TPage)
    gbCashControlServer: TGroupBox;
    lblProtocol: TLabel;
    lblPort: TLabel;
    Memo: TMemo;
    rbTCP: TRadioButton;
    rbUDP: TRadioButton;
    edtPort: TEdit;
    btnOpenPort: TBitBtn;
    btnClosePort: TBitBtn;
    procedure btnOpenPortClick(Sender: TObject);
    procedure btnClosePortClick(Sender: TObject);
  private
    FUDPServer: TUDPServer;
    FTCPServer: TTCPServer;
    procedure ServerData(Sender: TObject; Socket: TSocket);
    property UDPServer: TUDPServer read FUDPServer;
    property TCPServer: TTCPServer read FTCPServer;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fmCashControl: TfmCashControl;

implementation

{$R *.DFM}

function DosToStr(const S: string): string;
begin
  Result := S;
  OemToCharBuff(PChar(Result), PChar(Result), Length(Result));
end;

{ TfmCashControl }

constructor TfmCashControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUDPServer := TUDPServer.Create(Self);
  FTCPServer := TTCPServer.Create(Self);
  FUDPServer.OnData := ServerData;
  FTCPServer.OnData := ServerData;
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

  Memo.Lines.Text := Memo.Lines.Text + DosToStr(Data);
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

  btnOpenPort.Enabled := False;
  btnClosePort.Enabled := True;
  btnClosePort.SetFocus;
end;

procedure TfmCashControl.btnClosePortClick(Sender: TObject);
begin
  UDPServer.Close;
  TCPServer.Close;

  btnClosePort.Enabled := False;
  btnOpenPort.Enabled := True;
  btnOpenPort.SetFocus;
end;

end.
