unit fmuDocFill;

interface

uses
  // VCL
  ExtCtrls, ComCtrls, StdCtrls, Controls, Classes, SysUtils,
  // This
  untPages, untDriver;

type

  { TfmDocFill }

  TfmDocFill = class(TPage)
    StringforPrinting: TMemo;
    Panel1: TPanel;
    lblStringNumber: TLabel;
    lblStringforPrinting: TLabel;
    edtStringNumber: TEdit;
    udStringNumber: TUpDown;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

procedure TfmDocFill.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.FillSlipDocumentWithUnfiscalInfo;
end;

procedure TfmDocFill.UpdateObject;
begin
  Driver.StringNumber := StrToInt(edtStringNumber.Text);
  Driver.StringforPrinting := StringforPrinting.Text;
end;

end.
