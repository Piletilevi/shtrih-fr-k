unit fmuDocCl;

interface

uses
  // VCL
  ComCtrls, Controls, StdCtrls, Classes, SysUtils, ExtCtrls,
  // This
  untPages, untDriver;

type

  { TfmDocCl }

  TfmDocCl = class(TPage)
    lblStringNumber: TLabel;
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

{ TfmDocCl }

procedure TfmDocCl.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ClearSlipDocumentBufferString;
end;

procedure TfmDocCl.UpdateObject;
begin
  Driver.StringNumber := StrToInt(edtStringNumber.Text);
end;

end.
