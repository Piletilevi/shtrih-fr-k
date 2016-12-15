unit fmuTotalizers;

interface

uses
    // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Graphics, Grids,
  // This
  untPages, untUtil, untDriver, Spin;

type
  { TfmTotalizers }

  TfmTotalizers = class(TPage)
    lblRegisterNumber: TLabel;
    lblNameOperationReg: TLabel;
    edtRegName: TEdit;
    lblContents: TLabel;
    edtRegContent: TEdit;
    btnGetOperationReg: TButton;
    btnGetCashReg: TButton;
    seRegisterNumber: TSpinEdit;
    procedure btnGetOperationRegClick(Sender: TObject);
    procedure btnGetCashRegClick(Sender: TObject);
  end;

implementation

{$R *.DFM}

{ TfmTotalizers }

procedure TfmTotalizers.btnGetOperationRegClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.RegisterNumber := seRegisterNumber.Value;
    if Driver.GetOperationReg = 0 then
    begin
      edtRegName.Text := Driver.NameOperationReg;
      edtRegContent.Text := CurrToStr(Driver.ContentsOfOperationRegister);
    end else
    begin
      edtRegName.Clear;
      edtRegContent.Clear;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTotalizers.btnGetCashRegClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.RegisterNumber := seRegisterNumber.Value;
    if Driver.GetCashReg = 0 then
    begin
      edtRegName.Text := Driver.NameCashReg;
      edtRegContent.Text := CurrToStr(Driver.ContentsOfCashRegister);
    end else
    begin
      edtRegName.Clear;
      edtRegContent.Clear;
    end;
  finally
    EnableButtons(True);
  end;
end;

end.
