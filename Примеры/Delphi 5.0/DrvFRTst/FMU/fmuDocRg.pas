unit fmuDocRg;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocRg }

  TfmDocRg = class(TPage)
    edtStringForPrinting: TEdit;
    lblStringForPrinting: TLabel;
    cbTax4: TComboBox;
    lblTax4: TLabel;
    cbTax3: TComboBox;
    lblTax3: TLabel;
    cbTax2: TComboBox;
    lblTax2: TLabel;
    lblTax1: TLabel;
    cbTax1: TComboBox;
    lblDepartment: TLabel;
    lblQuantity: TLabel;
    edtQuantity: TEdit;
    edtPrice: TEdit;
    lblPrice: TLabel;
    edtDepartment: TEdit;
    udDepartment: TUpDown;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocRg }

procedure TfmDocRg.ExecuteCommand(var ResultCode, Count: Integer);
begin
  Count := Count + ReadTable(13,1,2,3);
  ResultCode := Driver.StandardRegistrationOnSlipDocument;
end;

procedure TfmDocRg.UpdateObject;
begin
  Driver.Price := StrToCurr(edtPrice.Text);
  Driver.Quantity := StrToFloat(edtQuantity.Text);
  Driver.Department := StrToInt(edtDepartment.Text);
  Driver.Tax1 := cbTax1.ItemIndex;
  Driver.Tax2 := cbTax2.ItemIndex;
  Driver.Tax3 := cbTax3.ItemIndex;
  Driver.Tax4 := cbTax4.ItemIndex;
  Driver.StringForPrinting := edtStringForPrinting.Text;
end;

end.
