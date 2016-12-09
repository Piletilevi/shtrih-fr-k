object fmDocSpEx: TfmDocSpEx
  Left = 241
  Top = 181
  Width = 480
  Height = 295
  Caption = 'Открытие ПД2'
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
    Caption = 'Открытие ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 96
    Top = 8
    Width = 373
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label3: TLabel
    Left = 16
    Top = 32
    Width = 396
    Height = 26
    Caption = 
      'Открытие фискального подкладного документа с конфигурацией элеме' +
      'нтов,'#13#10'задаваемой в свойствах.'
  end
  object Grid: TStringGrid
    Left = 16
    Top = 64
    Width = 441
    Height = 201
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
      18)
  end
end
