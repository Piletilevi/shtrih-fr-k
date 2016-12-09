unit fmuDocCB;

interface

uses
  // VCL
  ExtCtrls, Classes, Controls, StdCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocCB }

  TfmDocCB = class(TPage)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  public
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;


implementation

{$R *.DFM}

{ TfmDocCB }

procedure TfmDocCB.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ClearSlipDocumentBuffer;
end;

end.
