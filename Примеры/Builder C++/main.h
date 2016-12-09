//---------------------------------------------------------------------------

#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TButton *btnShowProperties;
        TButton *btnConnect;
        TButton *btnDisconnect;
        TLabel *Label1;
        TEdit *edError;
        TLabel *Label2;
        TEdit *edPrice;
        TLabel *Label3;
        TButton *btnBeep;
        TEdit *edQuantity;
        TLabel *Label4;
        TEdit *edPassword;
        TLabel *Label5;
        TEdit *edStore;
        TLabel *Label6;
        TComboBox *cbTax1;
        TLabel *Label7;
        TComboBox *cbTax2;
        TLabel *Label8;
        TComboBox *cbTax3;
        TLabel *Label9;
        TComboBox *cbTax4;
        TLabel *Label10;
        TEdit *edString;
        TButton *btnSale;
        TButton *btnBuy;
        TButton *btnReturnSale;
        TButton *btnReturnBuy;
        TLabel *Label11;
        TEdit *edOperatorNumber;
        TButton *btnStorno;
        TLabel *Label12;
        TEdit *edSumm1;
        TEdit *edSumm2;
        TEdit *edSumm3;
        TEdit *edSumm4;
        TLabel *Label13;
        TLabel *Label14;
        TLabel *Label15;
        TButton *btnCloseCheck;
        TLabel *Label16;
        TEdit *edSumm;
        TLabel *Label17;
        TEdit *edChange;
        TButton *btnPrintReportWithCleaning;
        TButton *btnPrintReportWithoutCleaning;
        TButton *btnDiscount;
        TButton *btnStornoDiscount;
        TButton *btnCharge;
        TButton *btnStornoCharge;
        TButton *btnCancelCheck;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall btnShowPropertiesClick(TObject *Sender);
        void __fastcall btnConnectClick(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall btnDisconnectClick(TObject *Sender);
        void __fastcall btnBeepClick(TObject *Sender);
        void __fastcall btnSaleClick(TObject *Sender);
        void __fastcall btnReturnSaleClick(TObject *Sender);
        void __fastcall btnBuyClick(TObject *Sender);
        void __fastcall btnReturnBuyClick(TObject *Sender);
        void __fastcall btnStornoClick(TObject *Sender);
        void __fastcall btnDiscountClick(TObject *Sender);
        void __fastcall btnStornoDiscountClick(TObject *Sender);
        void __fastcall btnChargeClick(TObject *Sender);
        void __fastcall btnStornoChargeClick(TObject *Sender);
        void __fastcall btnCloseCheckClick(TObject *Sender);
        void __fastcall btnCancelCheckClick(TObject *Sender);
        void __fastcall btnPrintReportWithoutCleaningClick(
          TObject *Sender);
        void __fastcall btnPrintReportWithCleaningClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
