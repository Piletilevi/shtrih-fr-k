unit fmuMain;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, ComCtrls, Grids, ValEdit,
  // This
  Driver1C, OleArray1C, VLEUtil;

type
  TForm1 = class(TForm)
    memInfo: TMemo;
    edtDeviceID: TEdit;
    lblDeviceID: TLabel;
    btnTestError: TButton;
    pgcLoadLogo: TPageControl;
    tsCommon: TTabSheet;
    tsReceipt: TTabSheet;
    btnGetVersion: TButton;
    btnGetLastError: TButton;
    btnClose: TButton;
    btnOpen: TButton;
    btnPrintXReport: TButton;
    btnPrintZReport: TButton;
    btnCashInOutcome: TButton;
    btnDeviceTest: TButton;
    grpOpenCheck: TGroupBox;
    lblCheckNumber: TLabel;
    lblSessionNumber: TLabel;
    chkIsFiscalCheck: TCheckBox;
    chkIsReturnCheck: TCheckBox;
    chkCancelOpenedCheck: TCheckBox;
    edtCheckNumber: TEdit;
    edtSessionNumber: TEdit;
    grpCloseCheck: TGroupBox;
    lblCash: TLabel;
    lblPayByCard: TLabel;
    lblPayByCredit: TLabel;
    edtCash: TEdit;
    edtPayByCard: TEdit;
    edtPayByCredit: TEdit;
    grpPrintNonFiscalString: TGroupBox;
    lblTextString: TLabel;
    edtTextString: TEdit;
    tsTest: TTabSheet;
    grpTestCheck: TGroupBox;
    btnTestFiscalReceipt: TButton;
    btnTestNonFiscalReceipt: TButton;
    tsFiscalString: TTabSheet;
    grpPrintFiscalString: TGroupBox;
    lblName: TLabel;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    lblAmount: TLabel;
    lblDepartment: TLabel;
    lblTax: TLabel;
    edtName: TEdit;
    edtQuantity: TEdit;
    edtPrice: TEdit;
    edtAmount: TEdit;
    edtDepartment: TEdit;
    edtTax: TEdit;
    btnPrintFiscalString: TButton;
    btnCancelCheck: TButton;
    btnPrintNonFiscalString: TButton;
    btnOpenCheck: TButton;
    btnCloseCheck: TButton;
    btnCheckPaperStatus: TButton;
    btnContinuePrinting: TButton;
    Button1: TButton;
    bllCashDrawerID: TLabel;
    edtCashDrawerID: TEdit;
    dlgOpen: TOpenDialog;
    tsLoadLogo: TTabSheet;
    grp1: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    edtLogoFileName: TEdit;
    chkCenterLogo: TCheckBox;
    btnOpenImage: TButton;
    btnLoadLogo: TButton;
    edtLogoSize: TEdit;
    vleParams: TValueListEditor;
    grpOpoen: TGroupBox;
    Splitter1: TSplitter;
    pnlTop: TPanel;
    vleLogo: TValueListEditor;
    procedure FormDestroy(Sender: TObject);
    procedure btnGetVersionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetLastErrorClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintXReportClick(Sender: TObject);
    procedure btnPrintZReportClick(Sender: TObject);
    procedure btnCashInOutcomeClick(Sender: TObject);
    procedure btnOpenCheckClick(Sender: TObject);
    procedure btnPrintFiscalStringClick(Sender: TObject);
    procedure btnCloseCheckClick(Sender: TObject);
    procedure btnCancelCheckClick(Sender: TObject);
    procedure btnPrintNonFiscalStringClick(Sender: TObject);
    procedure btnDeviceTestClick(Sender: TObject);
    procedure btnCheckPaperStatusClick(Sender: TObject);
    procedure btnContinuePrintingClick(Sender: TObject);
    procedure btnTestFiscalReceiptClick(Sender: TObject);
    procedure btnTestNonFiscalReceiptClick(Sender: TObject);
    procedure btnTestErrorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnLoadLogoClick(Sender: TObject);
    procedure btnOpenImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vleParamsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    FDriver: TDriver1C;
    FValuesArray: TArray1C;
    FLogoValuesArray: TArray1C;

    procedure SetValues;
    function GetDriver: TDriver1C;
    procedure UpdateForm(Sender: TObject);
    procedure Initialize;

    property Driver: TDriver1C read GetDriver;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDriver.Free;
end;

function TForm1.GetDriver: TDriver1C;
begin
  if FDriver = nil then
  begin
    FDriver := TDriver1C.Create;
    FDriver.FOnChange := UpdateForm;
  end;
  Result := FDriver;
end;

procedure TForm1.UpdateForm(Sender: TObject);
var
  V: Variant;
  decimalsep: Char;
begin
  decimalsep := DecimalSeparator;
  DecimalSeparator := ',';
  try
    memInfo.Text := Driver.FOutList.Text;
    SendMessage(memInfo.Handle, EM_LINESCROLL, 0, memInfo.Lines.Count-1);
    edtDeviceID.Text := Driver.FDeviceID;
    edtCheckNumber.Text := IntToStr(Driver.FCheckNumber);
    edtSessionNumber.Text := IntToStr(Driver.FSessionNumber);
    edtLogoSize.Text := IntToStr(Driver.FLogoSize);

    V := Driver.FValuesArray;
    try
      VLE_SetPropertyValue(vleParams, 'SerialNumber', V.Get(C_SERIALNUMBER));
      VLE_SetPropertyValue(vleParams, 'LogoSize', IntToStr(Driver.FLogoSize));
    except
      memInfo.Lines.Add('Œ¯Ë·Í‡ ‚ Ô‡‡ÏÂÚ‡ı ÔÓ‰ÍÎ˛˜ÂÌËˇ!');
    end;
  finally
    DecimalSeparator := decimalsep;
  end;
end;

procedure TForm1.btnGetVersionClick(Sender: TObject);
begin
  SetValues;
  Driver.GetVersion;
end;

procedure TForm1.SetValues;
var
  decimalsep: Char;
begin
  decimalsep := DecimalSeparator;
  DecimalSeparator := ',';
  try
    Driver.FDeviceID := edtDeviceID.Text;
    Driver.FName := edtName.Text;
    Driver.FQuantity := StrToFloat(edtQuantity.Text);
    Driver.FPrice := StrToFloat(edtPrice.Text);
    Driver.FAmount := StrToFloat(edtAmount.Text);
    Driver.FDepartment := StrToInt(edtDepartment.Text);
    Driver.FTax := StrToFloat(edtTax.Text);
    Driver.FIsFiscalCheck := chkIsFiscalCheck.Checked;
    Driver.FIsReturnCheck := chkIsReturnCheck.Checked;
    Driver.FCancelOpenedCheck := chkCancelOpenedCheck.Checked;
    Driver.FTextString := edtTextString.Text;
    Driver.FCash := StrToFloat(edtCash.Text);
    Driver.FPayByCard := StrToFloat(edtPayByCard.Text);
    Driver.FPayByCredit := StrToFloat(edtPayByCredit.Text);

    FValuesArray.Set_(C_PORT, StrToInt(VLE_GetPropertyValue(vleParams, 'Port')));
    FValuesArray.Set_(C_SPEED, VLE_GetPickPropertyValue(vleParams, 'Speed'));
    FValuesArray.Set_(C_USERPASSWORD, VLE_GetPropertyValue(vleParams, 'UserPassword'));
    FValuesArray.Set_(C_ADMINPASSWORD, VLE_GetPropertyValue(vleParams, 'AdminPassword'));
    FValuesArray.Set_(C_TIMEOUT, StrToInt(VLE_GetPropertyValue(vleParams, 'Timeout')));
    FValuesArray.Set_(C_SERIALNUMBER, '');
    FValuesArray.Set_(C_TAX1, StrToFloat(VLE_GetPropertyValue(vleParams, 'Tax1')));
    FValuesArray.Set_(C_TAX2, StrToFloat(VLE_GetPropertyValue(vleParams, 'Tax2')));
    FValuesArray.Set_(C_TAX3, StrToFloat(VLE_GetPropertyValue(vleParams, 'Tax3')));
    FValuesArray.Set_(C_TAX4, StrToFloat(VLE_GetPropertyValue(vleParams, 'Tax4')));
    FValuesArray.Set_(C_CLOSESESSION, VLE_GetPickPropertyValue(vleParams, 'CloseSession') = 1);
    FValuesArray.Set_(C_ENABLELOG, VLE_GetPickPropertyValue(vleParams, 'EnableLog') = 1);
    FValuesArray.Set_(C_PAYNAME1, VLE_GetPropertyValue(vleParams, 'PayName1'));
    FValuesArray.Set_(C_PAYNAME2, VLE_GetPropertyValue(vleParams, 'PayName2'));
    FValuesArray.Set_(C_PRINTLOGO, VLE_GetPickPropertyValue(vleParams, 'PrintLogo') = 1);
    FValuesArray.Set_(C_LOGOSIZE, StrToInt(VLE_GetPropertyValue(vleParams, 'LogoSize')));
    FValuesArray.Set_(C_CONNECTION_TYPE, VLE_GetPickPropertyValue(vleParams, 'ConnectionType'));
    FValuesArray.Set_(C_COMPUTERNAME, VLE_GetPropertyValue(vleParams, 'ComputerName'));
    FValuesArray.Set_(C_IPADDRESS, VLE_GetPropertyValue(vleParams, 'IPAddress'));
    FValuesArray.Set_(C_TCPPORT, StrToInt(VLE_GetPropertyValue(vleParams, 'TCPPort')));

    FLogoValuesArray.Set_(0, StrToInt(VLE_GetPropertyValue(vleLogo, 'Port')));
    FLogoValuesArray.Set_(1, VLE_GetPickPropertyValue(vleLogo, 'Speed'));
    FLogoValuesArray.Set_(2, VLE_GetPropertyValue(vleLogo, 'UserPassword'));
    FLogoValuesArray.Set_(3, StrToInt(VLE_GetPropertyValue(vleLogo, 'Timeout')));
    FLogoValuesArray.Set_(4, VLE_GetPickPropertyValue(vleLogo, 'ConnectionType'));
    FLogoValuesArray.Set_(5, VLE_GetPropertyValue(vleLogo, 'ComputerName'));
    FLogoValuesArray.Set_(6, VLE_GetPropertyValue(vleLogo, 'IPAddress'));
    FLogoValuesArray.Set_(7, StrToInt(VLE_GetPropertyValue(vleLogo, 'TCPPort')));

    Driver.FValuesArray := FValuesArray;
    Driver.FLogoValuesArray := FLogoValuesArray;
    Driver.FCenterLogo := chkCenterLogo.Checked;
    Driver.FLogoFileName := edtLogoFileName.Text;
    Driver.FLogoSize := StrToInt(VLE_GetPropertyValue(vleParams, 'LogoSize'));
  finally
    DecimalSeparator := decimalsep;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FValuesArray := TArray1C.Create;
  FLogoValuesArray := TArray1C.Create;
end;

procedure TForm1.btnGetLastErrorClick(Sender: TObject);
begin
  SetValues;
  Driver.GetLastError;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  SetValues;
  Driver.Open;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  SetValues;
  Driver.Close;
end;

procedure TForm1.btnPrintXReportClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintXReport;
end;

procedure TForm1.btnPrintZReportClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintZReport;
end;

procedure TForm1.btnCashInOutcomeClick(Sender: TObject);
begin
  SetValues;
  Driver.CashInOutcome;
end;

procedure TForm1.btnOpenCheckClick(Sender: TObject);
begin
  SetValues;
  Driver.OpenCheck;
end;

procedure TForm1.btnPrintFiscalStringClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintFiscalString;
end;

procedure TForm1.btnCloseCheckClick(Sender: TObject);
begin
  SetValues;
  Driver.CloseCheck;
end;

procedure TForm1.btnCancelCheckClick(Sender: TObject);
begin
  SetValues;
  Driver.CancelCheck;
end;

procedure TForm1.btnPrintNonFiscalStringClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintNonFiscalString;
end;

procedure TForm1.btnDeviceTestClick(Sender: TObject);
begin
  SetValues;
  Driver.DeviceTest;
end;

procedure TForm1.btnCheckPaperStatusClick(Sender: TObject);
begin
  SetValues;
  Driver.CheckPrintingStatus;
end;

procedure TForm1.btnContinuePrintingClick(Sender: TObject);
begin
  SetValues;
  Driver.ContinuePrinting;
end;

procedure TForm1.btnTestFiscalReceiptClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintTestFiscalReceipt;
end;

procedure TForm1.btnTestNonFiscalReceiptClick(Sender: TObject);
begin
  SetValues;
  Driver.PrintTestNonFiscalReceipt;
end;

procedure TForm1.btnTestErrorClick(Sender: TObject);
begin
  Driver.TestError;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetValues;
  Driver.OpenCashDrawer(StrToInt(edtCashDrawerID.Text));
end;

procedure TForm1.btnLoadLogoClick(Sender: TObject);
begin
  SetValues;
  Driver.LoadLogo;
end;

procedure TForm1.btnOpenImageClick(Sender: TObject);
begin
  if not dlgOpen.Execute then Exit;
  edtLogoFileName.Text := dlgOpen.FileName;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Initialize;
  SetValues;
end;

procedure TForm1.Initialize;
begin
  VLE_AddPickProperty(vleParams, 'ConnectionType', 'Local', ['Local', 'TCP', 'DCOM'], [0, 1, 2]);
  VLE_AddProperty(vleParams, 'Port', '1');
  VLE_AddPickProperty(vleParams, 'Speed', '19200', ['2400', '4800', '9600', '19200', '38400', '57600', '115200'], [2400, 4800, 9600, 19200, 38400, 57600, 115200]);
  VLE_AddProperty(vleParams, 'UserPassword', '1');
  VLE_AddProperty(vleParams, 'AdminPassword', '30');
  VLE_AddProperty(vleParams, 'Timeout', '100');
  VLE_AddProperty(vleParams, 'ComputerName', '');
  VLE_AddProperty(vleParams, 'IPAddress', '');
  VLE_AddProperty(vleParams, 'TCPPort', '211');
  VLE_AddProperty(vleParams, 'SerialNumber', '');
  VLE_AddProperty(vleParams, 'Tax1', '12,32');
  VLE_AddProperty(vleParams, 'Tax2', '15,4');
  VLE_AddProperty(vleParams, 'Tax3', '0,45');
  VLE_AddProperty(vleParams, 'Tax4', '1,34');
  VLE_AddProperty(vleParams, 'PayName1', 'œÀ¿“. ¿–“Œ…');
  VLE_AddProperty(vleParams, 'PayName2', ' –≈ƒ»“ŒÃ');
  VLE_AddPickProperty(vleParams, 'PrintLogo', 'False',  ['True', 'False'], [1, 0]);
  VLE_AddProperty(vleParams, 'LogoSize', '0');
  VLE_AddPickProperty(vleParams, 'CloseSession', 'False',  ['True', 'False'], [1, 0]);
  VLE_AddPickProperty(vleParams, 'EnableLog', 'True',  ['True', 'False'], [1, 0]);

  VLE_AddPickProperty(vleLogo, 'ConnectionType', 'Local', ['Local', 'TCP', 'DCOM'], [0, 1, 2]);
  VLE_AddProperty(vleLogo, 'Port', '1');
  VLE_AddPickProperty(vleLogo, 'Speed', '19200', ['2400', '4800', '9600', '19200', '38400', '57600', '115200'], [2400, 4800, 9600, 19200, 38400, 57600, 115200]);
  VLE_AddProperty(vleLogo, 'UserPassword', '1');
  VLE_AddProperty(vleLogo, 'Timeout', '100');
  VLE_AddProperty(vleLogo, 'ComputerName', '');
  VLE_AddProperty(vleLogo, 'IPAddress', '');
  VLE_AddProperty(vleLogo, 'TCPPort', '211');
end;

procedure TForm1.vleParamsDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  VLE_DrawCell(Sender, ACol, ARow, Rect, State);
end;

end.
