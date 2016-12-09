unit fmuDocPs;

interface

uses
  // VCL
  Classes, Controls, StdCtrls, ExtCtrls,
  // This
  untPages, untDriver;

type
  { TfmDocPs }

  TfmDocPs = class(TPage)
    rgInfoType: TRadioGroup;
    rgIsClearUnfiscalInfo: TRadioGroup;
    lblPrint2: TLabel;
    lblPrint: TLabel;
    Bevel1: TBevel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;


implementation

{$R *.DFM}

{ TfmDocPs }

procedure TfmDocPs.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.PrintSlipDocument;
  if ResultCode = 0 then Count := 0;
end;

procedure TfmDocPs.UpdateObject;
begin
  Driver.IsClearUnfiscalInfo := Boolean(rgIsClearUnfiscalInfo.ItemIndex);
  Driver.InfoType := rgInfoType.ItemIndex;
end;

end.
