unit fmuECRReg;

interface

uses
    // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Graphics,
  // This
  untPages, untUtil, untDriver, TestManager, Grids;

type
  TfmECRReg = class(TPage)
    lblRegisterNumber: TLabel;
    edtRegisterNumber: TEdit;
    lblNameOperationReg: TLabel;
    edtRegName: TEdit;
    lblContents: TLabel;
    edtRegContent: TEdit;
    btnGetOperationReg: TButton;
    btnGetCashReg: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    btnGetOperationRegs: TButton;
    Grid: TStringGrid;
    btnGetCashRegs: TButton;
    procedure btnGetOperationRegClick(Sender: TObject);
    procedure btnGetCashRegClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetRegMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetOperationRegsClick(Sender: TObject);
    procedure btnGetCashRegsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

constructor TfmECRReg.Create;
begin
  inherited Create(AOwner);
  Grid.Cells[0,0] := '№';
  Grid.Cells[1,0] := 'Имя регистра';
  Grid.Cells[2,0] := 'Содержимое';
end;

procedure TfmECRReg.btnGetOperationRegClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.RegisterNumber := StrToInt(edtRegisterNumber.Text);
    if Driver.GetOperationReg = 0 then
    begin
      edtRegName.Text := Driver.NameOperationReg;
      edtRegContent.Text := CurrToStr(Driver.ContentsOfOperationRegister);
    end else
    begin
      edtRegName.Clear;
      edtRegContent.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECRReg.btnGetCashRegClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.RegisterNumber := StrToInt(edtRegisterNumber.Text);
    if Driver.GetCashReg = 0 then
    begin
      edtRegName.Text := Driver.NameCashReg;
      edtRegContent.Text := CurrToStr(Driver.ContentsOfCashRegister);
    end else
    begin
      edtRegName.Clear;
      edtRegContent.Clear;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECRReg.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtRegisterNumber.Color := clWindow;
    edtRegName.Color := clBtnFace;
    edtRegContent.Color := clBtnFace;
  end;
end;

procedure TfmECRReg.btnGetRegMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtRegisterNumber.Color := InColor;
    edtRegName.Color := OutColor;
    edtRegContent.Color := OutColor;
  end;
end;

procedure TfmECRReg.btnGetOperationRegsClick(Sender: TObject);
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Grid.RowCount := 256;
    for i := 1 to 256 do
    begin
      Driver.RegisterNumber := i-1;
      if Driver.GetOperationReg = 0 then
      begin
        Grid.Cells[0,i] := IntToStr(i-1);
        Grid.Cells[1,i] := Driver.NameOperationReg;
        Grid.Cells[2,i] := CurrToStr(Driver.ContentsOfOperationRegister);
      end else
      begin
        Grid.RowCount := i;
        Break;
      end;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECRReg.btnGetCashRegsClick(Sender: TObject);
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Grid.RowCount := 256;
    for i := 1 to 256 do
    begin
      Driver.RegisterNumber := i-1;
      if Driver.GetCashReg = 0 then
      begin
        Grid.Cells[0,i] := IntToStr(i-1);
        Grid.Cells[1,i] := Driver.NameCashReg;
        Grid.Cells[2,i] := CurrToStr(Driver.ContentsOfCashRegister);
      end else
      begin
        Grid.RowCount := i;
        Break;
      end;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmECRReg.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := Round(0.05*(Grid.Width-24));
  Grid.ColWidths[1] := Round(0.77*(Grid.Width-24));
  Grid.ColWidths[2] := Round(0.18*(Grid.Width-24));
end;

end.
