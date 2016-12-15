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
      AddLine('������ ������ � ������', Driver.PrintWidth);
      AddLine('������ ������� � ������', Driver.CharWidth);
      AddLine('������ ������� � ������', Driver.CharHeight);
      AddLine('���������� �������', Driver.FontCount);
      if Driver.CharWidth > 0 then
      begin
        CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
        AddLine('�������� � ������', CharCount);
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
    // ����� 1 ���� ������
    Driver.FontType := 1;
    if Driver.GetFontMetrics = 0 then
    begin
      Memo.Lines.Add('');
      AddLine('���������� �������', Driver.FontCount);
      Count := Driver.FontCount;
      for i := 1 to Count do
      begin
        Driver.FontType := i;
        if Driver.GetFontMetrics <> 0 then Break;
        Memo.Lines.Add(' ' + StringOfChar('-', 33));
        AddLine('����� ������', i);
        AddLine('������ ������ � ������', Driver.PrintWidth);
        AddLine('������ ������� � ������', Driver.CharWidth);
        AddLine('������ ������� � ������', Driver.CharHeight);
        if Driver.CharWidth > 0 then
        begin
          CharCount := Trunc(Driver.PrintWidth/Driver.CharWidth);
          AddLine('�������� � ������', CharCount);
        end;
      end;
    end;
    // ������������ Memo �� ������
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    EnableButtons(True);
    Memo.Lines.EndUpdate;
  end;
end;

end.
