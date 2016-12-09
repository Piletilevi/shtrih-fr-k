unit fmuPrintBarcode;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untUtil, ComCtrls, untDriver;

type
  TfmPrintBarcode = class(TPage)
    lblData: TLabel;
    edtBarcode: TEdit;
    lblBarWidth: TLabel;
    edtBarWidth: TEdit;
    udBarWidth: TUpDown;
    chbCutPaper: TCheckBox;
    chbPrintMaxWidth: TCheckBox;
    rgBarcodeType: TRadioGroup;
    rgBarcodeAlignment: TRadioGroup;
    btnPrintBarcodeLine: TButton;
    btnPrintBarcodeGraph: TButton;
    lblPrintBarcode: TLabel;
    Bevel1: TBevel;
    procedure btnPrintBarcodeLineClick(Sender: TObject);
    procedure btnPrintBarcodeGraphClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnPrintBarcodeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure CutPaper;
    procedure Initialize;
    procedure PrintMaxWidthLine;
    procedure PrintMaxWidthGraph;
    procedure Check(ResultCode: Integer);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

constructor TfmPrintBarcode.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

procedure TfmPrintBarcode.Initialize;
begin
  rgBarcodeType.Items.Text := Driver.BarcodeTypes;
  rgBarcodeType.ItemIndex := 2;
  rgBarcodeAlignment.Items.Text := Driver.BarcodeAlignments;
  rgBarcodeAlignment.ItemIndex := 0;
end;

// Печать максимальной ширины

procedure TfmPrintBarcode.PrintMaxWidthGraph;
const
  Count = 10;
var
  i: Integer;
begin
  if not chbPrintMaxWidth.Checked then Exit;
  // Загрузка изображения
  Driver.LineData := StringOfChar(#$FF, 80);
  for i := 0 to Count-1 do
  begin
    Driver.LineNumber := i;
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
    // Максимальная ширина
    PrintMaxWidthGraph;
    // Печать штрих-кода
    Driver.LineNumber := 100;
    Driver.Barcode := edtBarcode.Text;
    Driver.BarcodeType := rgBarcodeType.ItemIndex;
    Driver.BarWidth := StrToInt(edtBarWidth.Text);
    Driver.BarcodeAlignment := rgBarcodeAlignment.ItemIndex;
    Check(Driver.PrintBarcodeGraph);
    CutPaper;
  finally
    UpdatePage;
    EnableButtons(True);
  end;
end;

procedure TfmPrintBarcode.CutPaper;
begin
  if chbCutPaper.Checked then
  begin
    // Промотка
    Driver.StringQuantity := 10;
    Check(Driver.FeedDocument);
    // Отрезка
    Driver.CutType := True;
    Check(Driver.CutCheck);
  end;
end;

procedure TfmPrintBarcode.btnPrintBarcodeLineClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.UseReceiptRibbon := True;
    // Максимальная ширина
    PrintMaxWidthLine;
    // Печать штрих-кода
    Driver.LineNumber := 100;
    Driver.Barcode := edtBarcode.Text;
    Driver.BarcodeType := rgBarcodeType.ItemIndex;
    Driver.BarWidth := StrToInt(edtBarWidth.Text);
    Driver.BarcodeAlignment := rgBarcodeAlignment.ItemIndex;
    Driver.PrintBarcodeLine;
    CutPaper;
  finally
    UpdatePage;
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
    UpdatePage;
    EnableButtons(True);
  end;
end;

procedure TfmPrintBarcode.Check(ResultCode: Integer);
begin
  if ResultCode <> 0 then Abort;
end;

procedure TfmPrintBarcode.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtBarcode.Color := clWindow;
    edtBarWidth.Color := clWindow;
    chbCutPaper.Color := clBtnFace;
    chbPrintMaxWidth.Color := clBtnFace;
    rgBarcodeType.Color := clBtnFace;
    rgBarcodeAlignment.Color := clBtnFace;
  end;
end;

procedure TfmPrintBarcode.btnPrintBarcodeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtBarcode.Color := InColor;
    edtBarWidth.Color := InColor;
    chbCutPaper.Color := InColor;
    chbPrintMaxWidth.Color := InColor;
    rgBarcodeType.Color := InColor;
    rgBarcodeAlignment.Color := InColor;
  end;
end;

end.

