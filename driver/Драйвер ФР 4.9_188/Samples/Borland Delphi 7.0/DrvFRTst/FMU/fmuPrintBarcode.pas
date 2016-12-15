unit fmuPrintBarcode;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, 
  // This
  untPages, untUtil, untDriver, Spin;

type
  { TfmPrintBarcode }

  TfmPrintBarcode = class(TPage)
    lblData: TLabel;
    edtBarcode: TEdit;
    lblBarWidth: TLabel;
    chbCutPaper: TCheckBox;
    chbPrintMaxWidth: TCheckBox;
    btnPrintBarcodeLine: TButton;
    btnPrintBarcodeGraph: TButton;
    cbBarcodeAlignment: TComboBox;
    lblBarcodeType: TLabel;
    lblBarcodeAlignment: TLabel;
    seBarWidth: TSpinEdit;
    btnPrintBarcode: TButton;
    cbPrintBarcodeText: TComboBox;
    lblPrintBarcodeText: TLabel;
    seLineNumber: TSpinEdit;
    lblLineNumber: TLabel;
    cbBarcodeType: TComboBox;
    procedure btnPrintBarcodeLineClick(Sender: TObject);
    procedure btnPrintBarcodeGraphClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnPrintBarcodeClick(Sender: TObject);
  private
    procedure CutPaper;
    procedure PrintMaxWidthLine;
    procedure PrintMaxWidthGraph;
    procedure Check(ResultCode: Integer);
  public
    procedure Initialize; override;
  end;

implementation

{$R *.DFM}

{ TfmPrintBarcode }

procedure TfmPrintBarcode.Initialize;
begin
  cbBarcodeType.Items.Text := 'Code128A'#13#10'Code128B'#13#10'Code128C';
  cbBarcodeType.ItemIndex := 0;
  cbBarcodeAlignment.Items.Text := 'По центру'#13#10'Влево'#13#10'Вправо';;
  cbBarcodeAlignment.ItemIndex := 0;
end;

// Печать максимальной ширины

procedure TfmPrintBarcode.PrintMaxWidthGraph;
const
  Count = 10;
var
  i: Integer;
begin
  if not chbPrintMaxWidth.Checked then Exit;
  Sleep(100);
  // Загрузка изображения
  Driver.LineData := StringOfChar(#$FF, 80);
  for i := 0 to Count-1 do
  begin
    Driver.LineNumber := i + 1;
    Check(Driver.LoadLineData);
  end;
  Driver.FirstLineNumber := 1;
  Driver.LastLineNumber := Count;
  Check(Driver.Draw);
end;

procedure TfmPrintBarcode.PrintMaxWidthLine;
var
  Count: Integer; // количество байт
begin
  if not chbPrintMaxWidth.Checked then Exit;
  // Узнаем ширину печати
  Driver.FontType := 1;
  Check(Driver.GetFontMetrics);
  Count := Driver.PrintWidth div 8;
  // Печатаем
  Driver.LineNumber := 10;
  Driver.LineData := StringOfChar(#$FF, Count);
  Check(Driver.PrintLine);
end;

procedure TfmPrintBarcode.btnPrintBarcodeGraphClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.UseReceiptRibbon := True;
    // Печать штрих-кода
    Driver.LineNumber := seLineNumber.Value;
    Driver.Barcode := edtBarcode.Text;
    Driver.BarcodeType := cbBarcodeType.ItemIndex;
    Driver.BarWidth := seBarWidth.Value;
    Driver.BarcodeAlignment := cbBarcodeAlignment.ItemIndex;
    Driver.PrintBarcodeText := cbPrintBarcodeText.ItemIndex;
    Check(Driver.PrintBarcodeGraph);
    // Максимальная ширина
    PrintMaxWidthGraph;
    CutPaper;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrintBarcode.CutPaper;
begin
  if chbCutPaper.Checked then
  begin
    // Промотка
    Driver.UseJournalRibbon := False;
    Driver.UseReceiptRibbon := True;
    Driver.UseSlipDocument := False;
    Driver.StringQuantity := 10;
    Check(Driver.FeedDocument);
    // Отрезка
    Driver.CutType := True;
    Check(Driver.CutCheck);
    Sleep(100);
  end;
end;

procedure TfmPrintBarcode.btnPrintBarcodeLineClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.UseReceiptRibbon := True;
    // Печать штрих-кода
    Driver.LineNumber := seLineNumber.Value;
    Driver.Barcode := edtBarcode.Text;
    Driver.BarcodeType := cbBarcodeType.ItemIndex;
    Driver.BarWidth := seBarWidth.Value;
    Driver.BarcodeAlignment := cbBarcodeAlignment.ItemIndex;
    Driver.PrintBarcodeText := cbPrintBarcodeText.ItemIndex;
    Check(Driver.PrintBarcodeLine);
    // Максимальная ширина
    PrintMaxWidthLine;
    // Отрезка
    CutPaper;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrintBarcode.btnTestClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.FontType := 3;
    Driver.StringForPrinting := StringOfChar('Ш', 90);
    Check(Driver.PrintStringWithFont);
    Check(Driver.PrintString);

    // Заявленная ширина печати - 576 точек. Проверяем
    Driver.StringForPrinting := 'Полная ширина печати. 576 точек';
    Check(Driver.PrintString);
    Driver.LineNumber := 50;
    Driver.LineData := StringOfChar(#$FF, 72);
    Check(Driver.PrintLine);
    Driver.LineNumber := 50;
    Driver.LineData := #1 + StringOfChar(#0, 68) + #$80#$FF#$FF;
    Check(Driver.PrintLine);

    // Левая граница первая бит
    Driver.StringForPrinting := 'Левая граница. Точка 1 печатается';
    Check(Driver.PrintString);
    Driver.LineNumber := 50;
    Driver.LineData := #1 + StringOfChar(#0, 71);
    Check(Driver.PrintLine);
    // Правая граница
    Driver.StringForPrinting := 'Правая граница. Точка 576 печатается';
    Check(Driver.PrintString);
    Driver.LineNumber := 50;
    Driver.LineData := StringOfChar(#0, 71) + #$80;
    Check(Driver.PrintLine);
    // Вывод
    Driver.StringForPrinting := 'Вывод - ширина печати 560 точек, а не 576';
    Check(Driver.PrintString);
    CutPaper;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmPrintBarcode.Check(ResultCode: Integer);
begin
  if ResultCode <> 0 then Abort;
end;

procedure TfmPrintBarcode.btnPrintBarcodeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.BarCode := edtBarcode.Text;
    Check(Driver.PrintBarCode);
    // Максимальная ширина
    PrintMaxWidthLine;
    // Отрезка
    CutPaper;
  finally
    EnableButtons(True);
  end;
end;

end.

