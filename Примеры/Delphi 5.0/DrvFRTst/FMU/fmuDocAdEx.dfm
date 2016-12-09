object fmDocAdEx: TfmDocAdEx
  Left = 311
  Top = 215
  Width = 456
  Height = 290
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Надбавка ПД2'
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
    Width = 100
    Height = 13
    Caption = 'Надбавка на ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 120
    Top = 8
    Width = 325
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 328
    Height = 26
    Caption = 
      'Операция надбавки на подкладном документе с конфигурацией'#13#10'элеме' +
      'нтов, задаваемой в свойствах.'
  end
  object Grid: TStringGrid
    Left = 16
    Top = 64
    Width = 417
    Height = 197
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
      247
      193)
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
      17
      18
      18
      18)
  end
end
