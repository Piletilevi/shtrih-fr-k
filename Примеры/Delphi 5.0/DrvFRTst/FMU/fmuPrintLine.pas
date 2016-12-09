unit fmuPrintLine;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untUtil, ComCtrls, untDriver;

type
  TfmPrintLine = class(TPage)
    Bevel1: TBevel;
    lblPrintLine: TLabel;
    lblLineData: TLabel;
    lblLineNumber: TLabel;
    edtLineData: TEdit;
    edtLineNumber: TEdit;
    btnPrintLine: TButton;
    lblBlackLine: TLabel;
    Bevel2: TBevel;
    lblLineCount: TLabel;
    lblByteCount: TLabel;
    edtLineCount: TEdit;
    edtByteCount: TEdit;
    btnBlackLine: TButton;
    procedure btnPrintLineClick(Sender: TObject);
    procedure btnBlackLineClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnPrintLineMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnBlackLineMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  end;

implementation

{$R *.DFM}

{ TfmPrintLine }

procedure TfmPrintLine.btnPrintLineClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.LineData := HexToStr(edtLineData.Text);
    Driver.LineNumber := StrToInt(edtLineNumber.Text);
    Driver.PrintLine;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrintLine.btnBlackLineClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.LineData := StringOfChar(#$FF, StrToInt(edtByteCount.Text));
    Driver.LineNumber := StrToInt(edtLineCount.Text);
    Driver.PrintLine;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrintLine.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLineData.Color := clWindow;
    edtLineNumber.Color := clWindow;
    edtLineCount.Color := clWindow;
    edtByteCount.Color := clWindow;
  end;
end;

procedure TfmPrintLine.btnPrintLineMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLineData.Color := InColor;
    edtLineNumber.Color := InColor;
  end;
end;

procedure TfmPrintLine.btnBlackLineMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtLineCount.Color := InColor;
    edtByteCount.Color := InColor;
  end;
end;

end.

