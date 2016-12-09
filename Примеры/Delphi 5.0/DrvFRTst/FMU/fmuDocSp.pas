unit fmuDocSp;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, SysUtils, 
  // This
  untPages, untDriver, Grids;

type

  { TfmDocSp }

  TfmDocSp = class(TPage)
    cbCheckType: TComboBox;
    lblCheckType: TLabel;
    rgCopyType: TRadioGroup;
    lblNumberOfCopies: TLabel;
    lblCopyOffset1: TLabel;
    edtNumberOfCopies: TEdit;
    udNumberOfCopies: TUpDown;
    edtCopyOffset1: TEdit;
    udCopyOffset1: TUpDown;
    lblCopyOffset2: TLabel;
    edtCopyOffset2: TEdit;
    udCopyOffset2: TUpDown;
    lblCopyOffset3: TLabel;
    edtCopyOffset3: TEdit;
    udCopyOffset3: TUpDown;
    lblCopyOffset4: TLabel;
    edtCopyOffset4: TEdit;
    udCopyOffset4: TUpDown;
    lblCopyOffset5: TLabel;
    edtCopyOffset5: TEdit;
    udCopyOffset5: TUpDown;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocSp }

procedure TfmDocSp.ExecuteCommand(var ResultCode, Count: Integer);
begin
  Count := Count + ReadTable(12,1,6,6) + 3;
  ResultCode := Driver.OpenStandardFiscalSlipDocument;
end;

procedure TfmDocSp.UpdateObject;
begin
  Driver.CheckType := cbCheckType.ItemIndex;
  Driver.CopyType := rgCopyType.ItemIndex;
  Driver.NumberOfCopies := StrToInt(edtNumberOfCopies.Text);
  Driver.CopyOffset1 := StrToInt(edtCopyOffset1.Text);
  Driver.CopyOffset2 := StrToInt(edtCopyOffset2.Text);
  Driver.CopyOffset3 := StrToInt(edtCopyOffset3.Text);
  Driver.CopyOffset4 := StrToInt(edtCopyOffset4.Text);
  Driver.CopyOffset5 := StrToInt(edtCopyOffset5.Text);
end;

end.
