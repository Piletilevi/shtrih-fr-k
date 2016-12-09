unit fmuDocCfg;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, Grids, SysUtils,
  // This
  untPages, untDriver;

type

  { TfmDocCfg }

  TfmDocCfg = class(TPage)
    Grid: TStringGrid;
    edtSlipDocumentWidth: TEdit;
    udSlipDocumentWidth: TUpDown;
    cbPrintingAlignment: TComboBox;
    edtSlipDocumentLength: TEdit;
    udSlipDocumentLength: TUpDown;
    lblSlipDocumentWidth: TLabel;
    lblSlipDocumentLength: TLabel;
    lblPrintingAlignment: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  private
    procedure Initialize;
  public
    constructor Create(AOwner: TComponent); override;
    function LoadDefaults: Boolean; override;
    procedure UpdateObject; override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); override;
  end;

implementation

{$R *.DFM}

{ TfmDocCfg }

constructor TfmDocCfg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;


procedure TfmDocCfg.Initialize;
var
  i: Integer;
begin
  cbPrintingAlignment.ItemIndex := 0;
  Grid.RowCount := 199;
  for i := 0 to 198 do
  begin
    Grid.Cells[0,i] := Format('Интервал между строками: %d и %d', [i+1, i+2]);
    Grid.Cells[1,i] := '24';
  end;
end;

procedure TfmDocCfg.UpdateObject;
var
  S: string;
  i: Integer;
begin
  Driver.SlipDocumentWidth := StrToInt(edtSlipDocumentWidth.Text);
  Driver.SlipDocumentLength := StrToInt(edtSlipDocumentLength.Text);
  Driver.PrintingAlignment := cbPrintingAlignment.ItemIndex;
  S := '';
  for i := 0 to 198 do
    S := S + Chr(StrToInt(Trim(Grid.Cells[1,i])));
  Driver.SlipStringIntervals := S;
end;

function TfmDocCfg.LoadDefaults: Boolean;
var
  i: Integer;
  Value: Integer;
begin
  Driver.TableNumber := 11;
  Result := Driver.GetTableStruct = 0;
  if not Result then Exit;
  Driver.FieldNumber := 1;
  for i:=1 to Driver.RowNumber do
  begin
    Driver.RowNumber := i;
    Result := Driver.ReadTable = 0;
    if not Result then Exit;
    Grid.Cells[1, i-1] := IntToSTr(Driver.ValueOfFieldInteger);
  end;
  // параметры ПД
  Driver.TableNumber := 10;
  Result := Driver.GetTableStruct = 0;
  if not Result then Exit;
  Driver.RowNumber := 1;
  // Ширина ПД
  Driver.FieldNumber := 1;
  Result := Driver.ReadTable = 0;
  if not Result then Exit;
  Value := Driver.ValueOfFieldInteger;
  udSlipDocumentWidth.Position := Value;
  edtSlipDocumentWidth.Text := IntToStr(Value);
  // Длина ПД
  Driver.FieldNumber := 2;
  Result := Driver.ReadTable = 0;
  if not Result then Exit;
  Value := Driver.ValueOfFieldInteger;
  udSlipDocumentLength.Position := Value;
  edtSlipDocumentLength.Text := IntToStr(Value);
  // Ориентация печати
  Driver.FieldNumber := 3;
  Result := Driver.ReadTable = 0;
  if not Result then Exit;
  Value := Driver.ValueOfFieldInteger;
  cbPrintingAlignment.ItemIndex := Value;
end;

procedure TfmDocCfg.ExecuteCommand(var ResultCode, Count: Integer);
begin
  ResultCode := Driver.ConfigureSlipDocument;
end;

end.
