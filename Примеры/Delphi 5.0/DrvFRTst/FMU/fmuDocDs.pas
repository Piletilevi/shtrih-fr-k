unit fmuDocDs;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocDs }

  TfmDocDs = class(TPage)
    lblSumm1: TLabel;
    edtSumm1: TEdit;
    cbTax1: TComboBox;
    lblTax1: TLabel;
    cbTax2: TComboBox;
    lblTax2: TLabel;
    cbTax3: TComboBox;
    lblTax3: TLabel;
    lblTax4: TLabel;
    cbTax4: TComboBox;
    edtStringForPrinting: TEdit;
    lblStringForPrinting: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocDs }

procedure TfmDocDs.ExecuteCommand(var ResultCode, Count: Integer);
begin
  Count := Count + ReadTable(15,1,1,2);
  ResultCode := Driver.StandardDiscountOnSlipDocument;
end;

procedure TfmDocDs.UpdateObject;
begin
  Driver.Summ1 := StrToCurr(edtSumm1.Text);
  Driver.Tax1 := cbTax1.ItemIndex;
  Driver.Tax2 := cbTax2.ItemIndex;
  Driver.Tax3 := cbTax3.ItemIndex;
  Driver.Tax4 := cbTax4.ItemIndex;
  Driver.StringForPrinting := edtStringForPrinting.Text;
end;

end.
