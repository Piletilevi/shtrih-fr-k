unit fmuDocCD;

interface

uses
  // VCL
  ExtCtrls, Classes, Controls, StdCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocCD }

  TfmDocCD = class(TPage)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  public
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocCD }

procedure TfmDocCD.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ConfigureStandardSlipDocument;
end;

end.
