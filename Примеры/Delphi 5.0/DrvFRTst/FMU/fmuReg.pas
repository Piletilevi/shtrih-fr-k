unit fmuReg;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmReg = class(TPage)
    btnSale: TButton;
    btnReturnSale: TButton;
    btnReturnBuy: TButton;
    btnBuy: TButton;
    btnStorno: TButton;
    btnCheckSubTotal: TButton;
    btnCashOutCome: TButton;
    btnCashInCome: TButton;
    btnCharge: TButton;
    btnStornoCharge: TButton;
    btnStornoDiscount: TButton;
    btnDiscount: TButton;
    btnOpenCheck: TButton;
    btnCloseCheck: TButton;
    btnRepeatDocument: TButton;
    btnSysAdminCancelCheck: TButton;
    btnCancelCheck: TButton;
    edtStringForPrint: TEdit;
    lblStringForPrint: TLabel;
    edtChange: TEdit;
    edtCheckSubTotal: TEdit;
    edtDiscountOnCheck: TEdit;
    cbTax4: TComboBox;
    cbTax3: TComboBox;
    cbTax2: TComboBox;
    cbTax1: TComboBox;
    edtSumm4: TEdit;
    edtSumm3: TEdit;
    edtSumm2: TEdit;
    edtSumm1: TEdit;
    lblSumm1: TLabel;
    lblSumm2: TLabel;
    lblSumm3: TLabel;
    lblSumm4: TLabel;
    lblTax1: TLabel;
    lblTax2: TLabel;
    lblTax3: TLabel;
    lblTax4: TLabel;
    lblDiscountOnCheck: TLabel;
    lblCheckSubTotal: TLabel;
    lblChange: TLabel;
    cbCheckType: TComboBox;
    lblCheckType: TLabel;
    lblDepartment: TLabel;
    edtQuantity: TEdit;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    edtPrice: TEdit;
    edtDepartment: TEdit;
    udDepartment: TUpDown;
    edtNumber: TEdit;
    edtName: TEdit;
    Label50: TLabel;
    Label1: TLabel;
    cbNumber: TComboBox;
    lblNumber: TLabel;
    btnSaleEx: TButton;
    procedure btnSaleClick(Sender: TObject);
    procedure btnBuyClick(Sender: TObject);
    procedure btnStornoClick(Sender: TObject);
    procedure btnReturnSaleClick(Sender: TObject);
    procedure btnReturnBuyClick(Sender: TObject);
    procedure btnCheckSubTotalClick(Sender: TObject);
    procedure btnCashInComeClick(Sender: TObject);
    procedure btnCashOutComeClick(Sender: TObject);
    procedure btnChargeClick(Sender: TObject);
    procedure btnStornoChargeClick(Sender: TObject);
    procedure btnDiscountClick(Sender: TObject);
    procedure btnStornoDiscountClick(Sender: TObject);
    procedure btnOpenCheckClick(Sender: TObject);
    procedure btnCloseCheckClick(Sender: TObject);
    procedure btnSysAdminCancelCheckClick(Sender: TObject);
    procedure btnRepeatDocumentClick(Sender: TObject);
    procedure btnCancelCheckClick(Sender: TObject);
    procedure cbNumberChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaleExClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RegMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCheckSubTotalMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCashComeMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnOpenCheckMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCloseCheckMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    procedure SetParams;
    function GetPrintWidth: Integer;
  end;

implementation

{$R *.DFM}

function TfmReg.GetPrintWidth: Integer;
begin
  case Driver.UModel of
     0: Result := 36;   // ÿ“–»’-‘–-‘
     1: Result := 36;   // ÿ“–»’-‘–-‘ ( ‡Á‡ıÒÚ‡Ì)
     2: Result := 24;   // ›À¬≈—-Ã»Õ»-‘–-‘
     3: Result := 20;   // ‘≈À» —-– ‘
     4: Result := 36;   // ÿ“–»’-‘–- 
     5: Result := 40;   // ÿ“–»’-950 
     6: Result := 32;   // ›À¬≈—-‘–- 
     7: Result := 50;   // ÿ“–»’-Ã»Õ»-‘–- 
     8: Result := 36;   // ÿ“–»’-‘–-‘ (¡ÂÎÓÛÒÒËˇ)
     9: Result := 48;   // ÿ“–»’- ŒÃ¡Œ-‘–-  ‚ÂÒËË 1
    10: Result := 40;   // ‘ËÒÍ‡Î¸Ì˚È ·ÎÓÍ ÿÚËı-POS-‘
    11: Result := 40;   // ÿÚËı950K ‚ÂÒËˇ 2
    12: Result := 40; 	// ÿ“–»’- ŒÃ¡Œ-‘–-  ‚ÂÒËË 2
    14: Result := 50; 	// ÿ“–»’-Ã»Õ»-‘–-  2
  else
    Result := 40;
  end;
end;

procedure TfmReg.SetParams;

var
  S: string;
  W: Integer;
begin
  Driver.Password := DriverManager.Password;
  Driver.Summ1 := StrToCurr(edtSumm1.text);
  Driver.Price := StrToCurr(edtPrice.text);
  Driver.Quantity := StrToFloat(edtQuantity.Text);
  Driver.Department := StrToInt(edtDepartment.Text);
  Driver.Tax1 := cbTax1.ItemIndex;
  Driver.Tax2 := cbTax2.ItemIndex;
  Driver.Tax3 := cbTax3.ItemIndex;
  Driver.Tax4 := cbTax4.ItemIndex;

  Driver.Connect;
  W := GetPrintWidth;
  case cbNumber.ItemIndex of
    0: S := edtName.Text;
    1: S := Format('%-*.*s%-4s%3d',[W-8, W-9, edtName.Text, '“– ', StrToInt(edtNumber.Text)]);
    2: S := Format('%-*.*s%-5s%4d',[W-9, W-10, edtName.Text, '—◊≈“', StrToInt(edtNumber.Text)]);
  end;
  Driver.StringforPrinting := S;
end;

procedure TfmReg.btnSaleClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Sale;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnBuyClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Buy;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnStornoClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Storno;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnReturnSaleClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.ReturnSale;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnReturnBuyClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.ReturnBuy;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnCheckSubTotalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.CheckSubTotal = 0 then
      edtCheckSubTotal.Text := FloatToStr(Driver.Summ1)
    else
      edtCheckSubTotal.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnCashInComeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Summ1 := StrToCurr(edtSumm1.Text);
    Driver.CashInCome;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnCashOutComeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Summ1 := StrToCurr(edtSumm1.text);
    Driver.CashOutCome;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnChargeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Charge;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnStornoChargeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.StornoCharge;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnDiscountClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Discount;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnStornoDiscountClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.StornoDiscount;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnOpenCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.CheckType := cbCheckType.ItemIndex;
    Driver.OpenCheck;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnCloseCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Summ1 := StrToCurr(edtSumm1.Text);
    Driver.Summ2 := StrToCurr(edtSumm2.Text);
    Driver.Summ3 := StrToCurr(edtSumm3.Text);
    Driver.Summ4 := StrToCurr(edtSumm4.Text);
    Driver.Tax1 := cbTax1.ItemIndex;
    Driver.Tax2 := cbTax2.ItemIndex;
    Driver.Tax3 := cbTax3.ItemIndex;
    Driver.Tax4 := cbTax4.ItemIndex;
    Driver.DiscountOnCheck := StrToFloat(edtDiscountOnCheck.Text);
    Driver.StringforPrinting := edtStringForPrint.Text;
    if Driver.CloseCheck <> 0 then edtChange.Clear
    else edtChange.Text := CurrToStr(Driver.Change);
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnSysAdminCancelCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SysAdminCancelCheck;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnRepeatDocumentClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.RepeatDocument;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.btnCancelCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.CancelCheck;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.cbNumberChange(Sender: TObject);
begin
  if cbNumber.ItemIndex = 0 then
  begin
    edtNumber.Enabled := False;
    edtNumber.Color := clBtnFace;
  end else
  begin
    edtNumber.Enabled := True;
    edtNumber.Color := clWindow;
  end;
end;

procedure TfmReg.FormCreate(Sender: TObject);
begin
  cbNumber.ItemIndex := 0;
end;

procedure TfmReg.btnSaleExClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.SaleEx;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReg.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    cbCheckType.Color := clWindow;
    edtQuantity.Color := clWindow;
    edtPrice.Color := clWindow;
    edtDepartment.Color := clWindow;
    edtNumber.Color := clWindow;
    edtName.Color := clWindow;
    cbNumber.Color := clWindow;
    edtStringForPrint.Color := clWindow;
    edtChange.Color := clBtnFace;
    edtCheckSubTotal.Color := clBtnFace;
    edtDiscountOnCheck.Color := clWindow;
    cbTax4.Color := clWindow;
    cbTax3.Color := clWindow;
    cbTax2.Color := clWindow;
    cbTax1.Color := clWindow;
    edtSumm4.Color := clWindow;
    edtSumm3.Color := clWindow;
    edtSumm2.Color := clWindow;
    edtSumm1.Color := clWindow;
  end;
end;

procedure TfmReg.RegMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtSumm1.Color := InColor;
    edtPrice.Color := InColor;
    edtQuantity.Color := InColor;
    edtDepartment.Color := InColor;
    cbTax1.Color := InColor;
    cbTax2.Color := InColor;
    cbTax3.Color := InColor;
    cbTax4.Color := InColor;
    cbNumber.Color := InColor;
    edtNumber.Color := InColor;
    edtName.Color := InColor;
  end;
end;

procedure TfmReg.btnCheckSubTotalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtCheckSubTotal.Color := OutColor;
end;

procedure TfmReg.btnCashComeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtSumm1.Color := InColor;
end;

procedure TfmReg.btnOpenCheckMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    cbCheckType.Color := InColor;
end;

procedure TfmReg.btnCloseCheckMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtSumm1.Color := InColor;
    edtSumm2.Color := InColor;
    edtSumm3.Color := InColor;
    edtSumm4.Color := InColor;
    cbTax1.Color := InColor;
    cbTax2.Color := InColor;
    cbTax3.Color := InColor;
    cbTax4.Color := InColor;
    edtDiscountOnCheck.Color := InColor;
    edtChange.Color := OutColor;
    edtStringForPrint.Color := InColor;
  end;
end;

end.
