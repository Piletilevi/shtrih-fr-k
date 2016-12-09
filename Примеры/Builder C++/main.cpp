//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#include <oleauto.hpp>

TForm1 *Form1;
Variant  ECR;
//סגמיסעגא ט לועמהû הנאיגונא
PropertyGet error("ResultCode");
PropertyGet errorDesc("ResultCodeDescription");
PropertyGet operatornum("OperatorNumber");
PropertyGet change("Change");
Procedure  beep("Beep");
Procedure  sp("ShowProperties");
Procedure  connect("Connect");
Procedure  disconnect("Disconnect");
Procedure  sale("Sale");
Procedure  returnsale("ReturnSale");
Procedure  buy("Buy");
Procedure  storno("Storno");
Procedure  returnbuy("ReturnBuy");
Procedure  discount("Discount");
Procedure  stornodiscount("StornoDiscount");
Procedure  charge("Charge");
Procedure  stornocharge("StornoCharge");
Procedure  closecheck("CloseCheck");
Procedure  reportwithcleaning("PrintReportWithCleaning");
Procedure  reportwithoutcleaning("PrintReportWithoutCleaning");
Procedure  cancelcheck("CancelCheck");

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
   cbTax1->ItemIndex = 0;
   cbTax2->ItemIndex = 0;
   cbTax3->ItemIndex = 0;
   cbTax4->ItemIndex = 0;

   ECR = Variant::CreateObject("AddIn.DrvFR");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnShowPropertiesClick(TObject *Sender)
{
   ECR.Exec(sp);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnConnectClick(TObject *Sender)
{
   ECR.Exec(connect);
   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
  ECR = Unassigned;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnDisconnectClick(TObject *Sender)
{
   ECR.Exec(disconnect);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnBeepClick(TObject *Sender)
{
   PropertySet password("Password");

   password << StrToInt(edPassword->Text);
   ECR.Exec(password);
   ECR.Exec(beep);
   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::btnSaleClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet price("Price");
   PropertySet quantity("Quantity");
   PropertySet store("Department");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   price << edPrice->Text;
   quantity << edQuantity->Text;
   store << edStore->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(price);
   ECR.Exec(quantity);
   ECR.Exec(store);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(sale);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnReturnSaleClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet price("Price");
   PropertySet quantity("Quantity");
   PropertySet store("Department");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   price << edPrice->Text;
   quantity << edQuantity->Text;
   store << edStore->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(price);
   ECR.Exec(quantity);
   ECR.Exec(store);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(returnsale);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnBuyClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet price("Price");
   PropertySet quantity("Quantity");
   PropertySet store("Department");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   price << edPrice->Text;
   quantity << edQuantity->Text;
   store << edStore->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(price);
   ECR.Exec(quantity);
   ECR.Exec(store);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(buy);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnReturnBuyClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet price("Price");
   PropertySet quantity("Quantity");
   PropertySet store("Department");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   price << edPrice->Text;
   quantity << edQuantity->Text;
   store << edStore->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(price);
   ECR.Exec(quantity);
   ECR.Exec(store);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(returnbuy);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnStornoClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet price("Price");
   PropertySet quantity("Quantity");
   PropertySet store("Department");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   price << edPrice->Text;
   quantity << edQuantity->Text;
   store << edStore->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(price);
   ECR.Exec(quantity);
   ECR.Exec(store);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(storno);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnDiscountClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet summ("Summ1");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   summ << edSumm->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(summ);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(discount);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnStornoDiscountClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet summ("Summ1");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   summ << edSumm->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(summ);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(stornodiscount);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnChargeClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet summ("Summ1");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   summ << edSumm->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(summ);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(charge);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnStornoChargeClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet summ("Summ1");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   summ << edSumm->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(summ);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(stornocharge);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnCloseCheckClick(TObject *Sender)
{
   PropertySet password("Password");
   PropertySet summ1("Summ1");
   PropertySet summ2("Summ2");
   PropertySet summ3("Summ3");
   PropertySet summ4("Summ4");
   PropertySet tax1("Tax1");
   PropertySet tax2("Tax2");
   PropertySet tax3("Tax3");
   PropertySet tax4("Tax4");
   PropertySet string("StringForPrinting");

   password << edPassword->Text;
   summ1 << edSumm1->Text;
   summ2 << edSumm2->Text;
   summ3 << edSumm3->Text;
   summ4 << edSumm4->Text;
   tax1 << cbTax1->ItemIndex;
   tax2 << cbTax2->ItemIndex;
   tax3 << cbTax3->ItemIndex;
   tax4 << cbTax4->ItemIndex;
   string << edString->Text;

   ECR.Exec(password);
   ECR.Exec(summ1);
   ECR.Exec(summ2);
   ECR.Exec(summ3);
   ECR.Exec(summ4);
   ECR.Exec(tax1);
   ECR.Exec(tax2);
   ECR.Exec(tax3);
   ECR.Exec(tax4);
   ECR.Exec(string);

   ECR.Exec(closecheck);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
   edChange->Text = ECR.Exec(change);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnCancelCheckClick(TObject *Sender)
{
   PropertySet password("Password");
   
   password << StrToInt(edPassword->Text);
   ECR.Exec(password);

   ECR.Exec(cancelcheck);

   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnPrintReportWithoutCleaningClick(TObject *Sender)
{
   PropertySet password("Password");

   password << StrToInt(edPassword->Text);
   ECR.Exec(password);
   ECR.Exec(reportwithoutcleaning);
   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnPrintReportWithCleaningClick(TObject *Sender)
{
   PropertySet password("Password");

   password << StrToInt(edPassword->Text);
   ECR.Exec(password);
   ECR.Exec(reportwithcleaning);
   Variant res = ECR.Exec(error);
   Variant resDesc = ECR.Exec(errorDesc);
   edError->Text = IntToStr(int(res)) + ": " + resDesc;
   edOperatorNumber->Text = ECR.Exec(operatornum);
}
//---------------------------------------------------------------------------

