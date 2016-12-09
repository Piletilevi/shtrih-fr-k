unit fmuDocReprint;

interface

uses
  // VCL
  Classes, Controls, StdCtrls, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocReprint }

  TfmDocReprint = class(TPage)
    lblReprint: TLabel;
    Bevel1: TBevel;
    lblReprint2: TLabel;
  public
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocReprint }

procedure TfmDocReprint.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ReprintSlipDocument;
  if ResultCode = 0 then Count := 0;
end;

end.
