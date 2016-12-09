unit fmuFont;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, Graphics,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmFont = class(TPage)
    Memo: TMemo;
    btnGetFontMetrics: TButton;
    lblFontType: TLabel;
    edtFontType: TEdit;
    udFontType: TUpDown;
    btnGetFontsMetrics: TButton;
    lblTapeType: TLabel;
    cbTapeType: TComboBox;
    procedure btnGetFontMetricsClick(Sender: TObject);
    procedure btnGetFontsMetricsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetFontMetricsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

{$R *.DFM}

{ TfmECRSt }

procedure TfmFont.btnGetFontMetricsClick(Sender: TObject);
var
  CharCount: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    if cbTapeType.ItemIndex = 0 then
    begin
      Driver.UseReceiptRibbon := True;
      Driver.UseJournalRibbon := False;
    end else
    begin
      Driver.UseReceiptRibbon := False;
      Driver.UseJournalRibbon := True;
    end;
    Driver.FontType := StrToInt(edtFontType.Text);
    if Driver.GetFontMetrics = 0 then
    begin
      Memo.Lines.Add('Ширина печати в точках: ' + IntToStr(Driver.PrintWidth));
      Memo.Lines.Add('Ширина символа в точках: ' + IntToStr(Driver.CharWidth));
      Memo.Lines.Add('Высота символа в точках: ' + IntToStr(Driver.CharHeight));
      Memo.Lines.Add('Количество шрифтов в ФР: ' + IntToStr(Driver.FontCount));
      if Driver.CharWidth > 0 then
      begin
        CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
        Memo.Lines.Add('Количество символов в строке: ' + IntToStr(CharCount));
      end;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFont.btnGetFontsMetricsClick(Sender: TObject);
var
  i: Integer;
  Count: Integer;
  CharCount: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    if cbTapeType.ItemIndex = 0 then
    begin
      Driver.UseReceiptRibbon := True;
      Driver.UseJournalRibbon := False;
    end else
    begin
      Driver.UseReceiptRibbon := False;
      Driver.UseJournalRibbon := True;
    end;
    Driver.FontType := 1; // Шрифт 1 есть всегда
    if Driver.GetFontMetrics = 0 then
    begin
      Memo.Lines.Add('Количество шрифтов в ФР: ' + IntToStr(Driver.FontCount));
      Count := Driver.FontCount;
      for i := 1 to Count do
      begin
      Driver.FontType := i;
      if Driver.GetFontMetrics = 0 then
      begin
        with Memo do
        begin
          Lines.Add('Шрифт ' + IntToStr(i));
          Lines.Add('Ширина печати в точках: ' + IntToStr(Driver.PrintWidth));
          Lines.Add('Ширина символа в точках: ' + IntToStr(Driver.CharWidth));
          Lines.Add('Высота символа в точках: ' + IntToStr(Driver.CharHeight));
          if Driver.CharWidth > 0 then
          begin
            CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
            Memo.Lines.Add('Количество символов в строке: ' + IntToStr(CharCount));
          end;
        end;
      end else
        Break;
      end;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmFont.FormCreate(Sender: TObject);
begin
 cbTapeType.ItemIndex := 0;
end;

procedure TfmFont.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtFontType.Color := clWindow;
    cbTapeType.Color := clWindow;
  end;
end;

procedure TfmFont.btnGetFontMetricsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtFontType.Color := InColor;
    cbTapeType.Color := InColor;
  end;  
end;

end.
