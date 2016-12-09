object fmDocDsEx: TfmDocDsEx
  Left = 403
  Top = 221
  Width = 389
  Height = 283
  Caption = 'Скидка ПД2'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 85
    Height = 13
    Caption = 'Скидка на ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 104
    Top = 8
    Width = 274
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 316
    Height = 26
    Caption = 
      'Операция скидки на подкладном документе с конфигурацией'#13#10'элемент' +
      'ов, задаваемой в свойствах.'
  end
  object Grid: TStringGrid
    Left = 16
    Top = 64
    Width = 353
    Height = 193
    Hint = 'Конфигурация'
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    DefaultColWidth = 200
    DefaultRowHeight = 18
    RowCount = 13
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goThumbTracking]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ColWidths = (
      200
      67)
    RowHeights = (
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      17)
  end
end
