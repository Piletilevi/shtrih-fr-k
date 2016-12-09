unit fmuDocCc;

interface

uses
  // VCL
  StdCtrls, Controls, Classes, SysUtils, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocCc }

  TfmDocCc = class(TPage)
    edtStringforPrinting: TEdit;
    lblStringforPrinting: TLabel;
    lblDiscountOnCheck: TLabel;
    edtDiscountOnCheck: TEdit;
    edtSumm4: TEdit;
    lblSumm4: TLabel;
    lblSumm3: TLabel;
    edtSumm3: TEdit;
    edtSumm2: TEdit;
    edtSumm1: TEdit;
    lblSumm1: TLabel;
    lblSumm2: TLabel;
    cbTax4: TComboBox;
    cbTax3: TComboBox;
    cbTax2: TComboBox;
    cbTax1: TComboBox;
    lblTax1: TLabel;
    lblTax2: TLabel;
    lblTax3: TLabel;
    lblTax4: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocCc }

procedure TfmDocCc.ExecuteCommand(var ResultCode, Count: Integer);
begin
  Count := Count + ReadTable(14,1,1,17);
  ResultCode := Driver.StandardCloseCheckOnSlipDocument;
end;

procedure TfmDocCc.UpdateObject;
begin
  Driver.Summ1 := StrToCurr(edtSumm1.Text);
  Driver.Summ2 := StrToCurr(edtSumm2.Text);
  Driver.Summ3 := StrToCurr(edtSumm3.Text);
  Driver.Summ4 := StrToCurr(edtSumm4.Text);
  Driver.Tax1 := cbTax1.ItemIndex;
  Driver.Tax2 := cbTax2.ItemIndex;
  Driver.Tax3 := cbTax3.ItemIndex;
  Driver.Tax4 := cbTax4.ItemIndex;
  Driver.DiscountOnCheck := StrToFloat(edtDiscountOnCheck.Text);
  Driver.StringforPrinting := edtStringforPrinting.Text;
end;

end.
