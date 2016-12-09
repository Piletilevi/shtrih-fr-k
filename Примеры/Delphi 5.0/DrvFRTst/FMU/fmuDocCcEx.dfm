object fmDocCcEx: TfmDocCcEx
  Left = 335
  Top = 229
  Width = 394
  Height = 210
  Caption = 'Закрытие чека ПД2'
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
    Width = 82
    Height = 13
    Caption = 'Закрытие ПД'
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
    Width = 279
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 274
    Height = 26
    Caption = 
      'Операция закрытия чека на подкладном документе с'#13#10'конфигурацией ' +
      'элементов, задаваемой в свойствах.'
  end
  object Grid: TStringGrid
    Left = 16
    Top = 64
    Width = 361
    Height = 116
    Hint = 'Конфигурация'
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    DefaultColWidth = 200
    DefaultRowHeight = 18
    RowCount = 21
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goThumbTracking]
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 0
    ColWidths = (
      200
      67)
    RowHeights = (
      18
      18
      18
      19
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
      18
      18
      18
      18
      18)
  end
end
