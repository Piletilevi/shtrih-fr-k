unit fmuReceipt;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Graphics,
  // This
  untPages, untUtil, untDriver, Spin;

type
  { TfmReceipt }

  TfmReceipt = class(TPage)
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
    edtNumber: TEdit;
    edtName: TEdit;
    Label50: TLabel;
    Label1: TLabel;
    cbNumber: TComboBox;
    lblNumber: TLabel;
    btnSaleEx: TButton;
    seDepartment: TSpinEdit;
    btnBeep: TButton;
    edtSumm1: TEdit;
    btnCloseCheckKPK: TButton;
    lblKPKStr: TLabel;
    edtKPKStr: TEdit;
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
    procedure btnBeepClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnCloseCheckKPKClick(Sender: TObject);
  private
    procedure SetParams;
    function GetPrintWidth: Integer;
  end;

implementation

{$R *.DFM}

{ TfmReceipt }

function TfmReceipt.GetPrintWidth: Integer;
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

procedure TfmReceipt.SetParams;

var
  S: string;
  W: Integer;
begin
  CheckIntStr(edtSumm1.Text, '—ÛÏÏ‡ 1');
  CheckIntStr(edtPrice.Text, '÷ÂÌ‡');
  CheckIntStr(edtQuantity.Text, ' ÓÎË˜ÂÒÚ‚Ó');
  CheckIntStr(edtNumber.Text, 'ÕÓÏÂ');

  Driver.Summ1 := StrToCurr(edtSumm1.text);
  Driver.Price := StrToCurr(edtPrice.text);
  Driver.Quantity := StrToFloat(edtQuantity.Text);
  Driver.Department := seDepartment.Value;
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

procedure TfmReceipt.btnSaleClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    UpdateObject;
    SetParams;
    Driver.Sale;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnBuyClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Buy;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnStornoClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Storno;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnReturnSaleClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.ReturnSale;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnReturnBuyClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.ReturnBuy;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnCheckSubTotalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    if Driver.CheckSubTotal = 0 then
      edtCheckSubTotal.Text := FloatToStr(Driver.Summ1)
    else
      edtCheckSubTotal.Clear;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnCashInComeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    CheckIntStr(edtSumm1.Text, '—ÛÏÏ‡ 1');
    Driver.Summ1 := StrToCurr(edtSumm1.Text);
    Driver.CashInCome;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnCashOutComeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    CheckIntStr(edtSumm1.Text, '—ÛÏÏ‡ 1');
    Driver.Summ1 := StrToCurr(edtSumm1.text);
    Driver.CashOutCome;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnChargeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Charge;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnStornoChargeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.StornoCharge;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnDiscountClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.Discount;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnStornoDiscountClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.StornoDiscount;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnOpenCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.CheckType := cbCheckType.ItemIndex;
    Driver.OpenCheck;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnCloseCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    CheckIntStr(edtSumm1.Text, '—ÛÏÏ‡ 1');
    CheckIntStr(edtSumm2.Text, '—ÛÏÏ‡ 2');
    CheckIntStr(edtSumm3.Text, '—ÛÏÏ‡ 3');
    CheckIntStr(edtSumm4.Text, '—ÛÏÏ‡ 4');
    CheckIntStr(edtDiscountOnCheck.Text, '—ÍË‰Í‡ Ì‡ ˜ÂÍ');

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
    if Driver.CloseCheck <> 0 then
      edtChange.Clear
    else
      edtChange.Text := CurrToStr(Driver.Change);
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnSysAdminCancelCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.SysAdminCancelCheck;
    Driver.OperationBlockFirstString := 0;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnRepeatDocumentClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.RepeatDocument;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnCancelCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.CancelCheck;
    Driver.OperationBlockFirstString := 0;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.cbNumberChange(Sender: TObject);
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

procedure TfmReceipt.FormCreate(Sender: TObject);
begin
  cbNumber.ItemIndex := 0;
  cbNumberChange(Self);
end;

procedure TfmReceipt.btnSaleExClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    SetParams;
    Driver.SaleEx;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.btnBeepClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Beep;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmReceipt.FormResize(Sender: TObject);
var
  W: Integer;
begin
  W := btnSale.Left - edtSumm1.Left - 7;
  edtSumm1.Width := W;
  edtSumm2.Width := W;
  edtSumm3.Width := W;
  edtSumm4.Width := W;
  edtCheckSubTotal.Width := W;
  edtChange.Width := W;
  edtDiscountOnCheck.Width := btnSale.Left - edtDiscountOnCheck.Left - 7;
  edtKPKStr.Width := W;
end;

procedure TfmReceipt.btnCloseCheckKPKClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    CheckIntStr(edtSumm1.Text, '—ÛÏÏ‡ 1');
    CheckIntStr(edtSumm2.Text, '—ÛÏÏ‡ 2');
    CheckIntStr(edtSumm3.Text, '—ÛÏÏ‡ 3');
    CheckIntStr(edtSumm4.Text, '—ÛÏÏ‡ 4');
    CheckIntStr(edtDiscountOnCheck.Text, '—ÍË‰Í‡ Ì‡ ˜ÂÍ');

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
    if Driver.CloseCheckWithKPK <> 0 then
    begin
      edtChange.Clear;
      edtKPKStr.Clear;
    end
    else
    begin
      edtChange.Text := CurrToStr(Driver.Change);
      edtKPKStr.Text := Driver.KPKStr;
    end;
  finally
    EnableButtons(True);
  end;
end;

end.
