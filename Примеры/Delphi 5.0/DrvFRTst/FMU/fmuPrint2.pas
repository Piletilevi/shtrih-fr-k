unit fmuPrint2;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, SysUtils, Buttons, Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmPrint2 = class(TPage)
    Bevel1: TBevel;
    Label1: TLabel;
    edtOpenDocumentNumber: TEdit;
    lblOpenDocumentNumber: TLabel;
    lblDocumentName: TLabel;
    lblDocumentNumber: TLabel;
    edtDocumentNumber: TEdit;
    edtDocumentName: TEdit;
    lblRunningPeriod: TLabel;
    edtRunningPeriod: TEdit;
    udRunningPeriod: TUpDown;
    Label2: TLabel;
    Bevel2: TBevel;
    btnPrintDocumentTitle: TBitBtn;
    btnTest: TBitBtn;
    btnInterruptTest: TBitBtn;
    procedure btnInterruptTestClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnPrintDocumentTitleClick(Sender: TObject);
    procedure btnPrintDocumentTitleMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnTestMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  end;


implementation

{$R *.DFM}

procedure TfmPrint2.btnTestClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.RunningPeriod := StrToInt(edtRunningPeriod.Text);
    Driver.Test;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint2.btnInterruptTestClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InterruptTest;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint2.btnPrintDocumentTitleClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.DocumentNumber := StrToInt(edtDocumentNumber.Text);
    Driver.DocumentName := edtDocumentName.Text;
    ResultCode := Driver.PrintDocumentTitle;
    UpdatePage;

    if ResultCode = 0 then
      edtOpenDocumentNumber.Text := IntToStr(Driver.OpenDocumentNumber)
    else
      edtOpenDocumentNumber.Clear;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  edtDocumentNumber.Color := clWindow;
  edtDocumentName.Color := clWindow;
  edtOpenDocumentNumber.Color := clBtnFace;
  edtRunningPeriod.Color := clWindow;
end;

procedure TfmPrint2.btnPrintDocumentTitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtDocumentNumber.Color := InColor;
    edtDocumentName.Color := InColor;
    edtOpenDocumentNumber.Color := OutColor;
  end;
end;

procedure TfmPrint2.btnTestMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if HighLighting then
    edtRunningPeriod.Color := InColor;
end;

end.
