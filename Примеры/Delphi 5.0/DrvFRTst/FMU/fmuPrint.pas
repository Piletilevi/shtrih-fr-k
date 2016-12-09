unit fmuPrint;

interface

uses
  // VCL
  Windows, ComCtrls, StdCtrls, Controls, ExtCtrls, Classes, SysUtils, Graphics,
  Buttons,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmPrint = class(TPage)
    edtStringForPrinting: TEdit;
    lblStringForPrinting: TLabel;
    lblFontType: TLabel;
    edtFontType: TEdit;
    udFontType: TUpDown;
    chbUseJournalRibbon: TCheckBox;
    chbUseReceiptRibbon: TCheckBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    lblCutType: TLabel;
    rbFullCut: TRadioButton;
    rbPartialCut: TRadioButton;
    Bevel3: TBevel;
    Label3: TLabel;
    edtStringQuantity: TEdit;
    lblStringQuantity: TLabel;
    udStringQuantity: TUpDown;
    btnPrintString: TBitBtn;
    btnCutCheck: TBitBtn;
    btnFeedDocument: TBitBtn;
    btnContinuePrint: TBitBtn;
    btnPrintCliche: TBitBtn;
    btnPrintWideString: TBitBtn;
    btnPrintStringWithFont: TBitBtn;
    procedure btnContinuePrintClick(Sender: TObject);
    procedure btnCutCheckClick(Sender: TObject);
    procedure btnFeedDocumentClick(Sender: TObject);
    procedure btnInterruptTestClick(Sender: TObject);
    procedure btnPrintStringClick(Sender: TObject);
    procedure btnPrintWideStringClick(Sender: TObject);
    procedure btnPrintStringWithFontClick(Sender: TObject);
    procedure btnPrintClicheClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnPrintStringMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnPrintStringWithFontMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCutCheckMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFeedDocumentMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  end;


implementation

{$R *.DFM}

procedure TfmPrint.btnContinuePrintClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.ContinuePrint;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnCutCheckClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.CutType := rbPartialCut.Checked;
    Driver.Password := DriverManager.Password;
    Driver.CutCheck;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnFeedDocumentClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.UseReceiptRibbon := chbUseReceiptRibbon.Checked;
    Driver.UseJournalRibbon := chbUseJournalRibbon.Checked;
    Driver.StringQuantity := StrToInt(edtStringQuantity.Text);
    Driver.FeedDocument;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnInterruptTestClick(Sender: TObject);
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

procedure TfmPrint.btnPrintStringClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.UseReceiptRibbon := chbUseReceiptRibbon.Checked;
    Driver.UseJournalRibbon := chbUseJournalRibbon.Checked;
    Driver.StringForPrinting := edtStringForPrinting.Text;
    Driver.PrintString;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnPrintWideStringClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.UseReceiptRibbon := chbUseReceiptRibbon.Checked;
    Driver.UseJournalRibbon := chbUseJournalRibbon.Checked;
    Driver.StringforPrinting := edtStringforPrinting.Text;
    Driver.PrintWideString;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnPrintStringWithFontClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.UseReceiptRibbon := chbUseReceiptRibbon.Checked;
    Driver.UseJournalRibbon := chbUseJournalRibbon.Checked;
    Driver.StringForPrinting := edtStringForPrinting.Text;
    Driver.FontType := StrToInt(edtFontType.Text);
    Driver.PrintStringWithFont;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.btnPrintClicheClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintCliche;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrint.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    chbUseReceiptRibbon.Color := clBtnFace;
    chbUseJournalRibbon.Color := clBtnFace;
    rbFullCut.Color := clBtnFace;
    rbPartialCut.Color := clBtnFace;
    edtStringForPrinting.Color := clWindow;
    edtFontType.Color := clWindow;
    edtStringQuantity.Color := clWindow;
  end;
end;

procedure TfmPrint.btnPrintStringMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    chbUseReceiptRibbon.Color := InColor;
    chbUseJournalRibbon.Color := InColor;
    edtStringForPrinting.Color := InColor;
  end;
end;

procedure TfmPrint.btnPrintStringWithFontMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtFontType.Color := InColor;
    chbUseReceiptRibbon.Color := InColor;
    chbUseReceiptRibbon.Color := InColor;
    chbUseJournalRibbon.Color := InColor;
    edtStringForPrinting.Color := InColor;
  end;
end;

procedure TfmPrint.btnCutCheckMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    rbFullCut.Color := InColor;
    rbPartialCut.Color := InColor;
  end;
end;

procedure TfmPrint.btnFeedDocumentMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtStringQuantity.Color := InColor;
end;

end.

