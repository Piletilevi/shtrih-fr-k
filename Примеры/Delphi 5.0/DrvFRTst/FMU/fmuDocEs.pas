unit fmuDocEs;

interface

uses
  // VCL
  Classes, Controls, StdCtrls, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocEs }

  TfmDocEs = class(TPage)
    rgEjectDirection: TRadioGroup;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  public
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocEs }

procedure TfmDocEs.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.EjectSlipDocument;
end;

procedure TfmDocEs.UpdateObject;
begin
  Driver.EjectDirection := rgEjectDirection.ItemIndex;
end;

end.
