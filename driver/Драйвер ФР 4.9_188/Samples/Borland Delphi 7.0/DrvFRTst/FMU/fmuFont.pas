unit fmuFont;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, Graphics,
  // This
  untPages, untUtil, untDriver, Spin;

type
  { TfmFont }

  TfmFont = class(TPage)
    Memo: TMemo;
    btnGetFontMetrics: TButton;
    lblFontType: TLabel;
    btnGetFontsMetrics: TButton;
    seFontType: TSpinEdit;
    procedure btnGetFontMetricsClick(Sender: TObject);
    procedure btnGetFontsMetricsClick(Sender: TObject);
  private
    procedure AddLine(V1, V2: Variant);
    procedure AddLineWidth(V1, V2: Variant; TextWidth: Integer);
  end;

implementation

{$R *.DFM}

{ TfmFont }

procedure TfmFont.AddLineWidth(V1, V2: Variant; TextWidth: Integer);
begin
  Memo.Lines.Add(Format(' %-*s: %s', [TextWidth, String(V1), String(V2)]));
end;

procedure TfmFont.AddLine(V1, V2: Variant);
begin
  AddLineWidth(V1, V2, 24);
end;

procedure TfmFont.btnGetFontMetricsClick(Sender: TObject);
var
  CharCount: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.FontType := seFontType.Value;
    if Driver.GetFontMetrics = 0 then
    begin
      Memo.Lines.Add('');
      AddLine('Ширина печати в точках', Driver.PrintWidth);
      AddLine('Ширина символа в точках', Driver.CharWidth);
      AddLine('Высота символа в точках', Driver.CharHeight);
      AddLine('Количество шрифтов', Driver.FontCount);
      if Driver.CharWidth > 0 then
      begin
        CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
        AddLine('Символов в строке', CharCount);
      end;
    end;
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
  Memo.Lines.BeginUpdate;
  try
    Memo.Clear;
    // Шрифт 1 есть всегда
    Driver.FontType := 1;
    if Driver.GetFontMetrics = 0 then
    begin
      Memo.Lines.Add('');
      AddLine('Количество шрифтов', Driver.FontCount);
      Count := Driver.FontCount;
      for i := 1 to Count do
      begin
        Driver.FontType := i;
        if Driver.GetFontMetrics <> 0 then Break;
        Memo.Lines.Add(' ' + StringOfChar('-', 33));
        AddLine('Номер шрифта', i);
        AddLine('Ширина печати в точках', Driver.PrintWidth);
        AddLine('Ширина символа в точках', Driver.CharWidth);
        AddLine('Высота символа в точках', Driver.CharHeight);
        if Driver.CharWidth > 0 then
        begin
          CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
          AddLine('Символов в строке', CharCount);
        end;
      end;
    end;
    // Прокручиваем Memo на начало
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    EnableButtons(True);
    Memo.Lines.EndUpdate;
  end;
end;

end.
