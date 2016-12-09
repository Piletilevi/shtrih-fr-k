object fmDocCfg: TfmDocCfg
  Left = 407
  Top = 284
  Width = 439
  Height = 336
  Caption = 'Конфигурация ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblSlipDocumentWidth: TLabel
    Left = 16
    Top = 71
    Width = 42
    Height = 13
    Caption = 'Ширина:'
  end
  object lblSlipDocumentLength: TLabel
    Left = 16
    Top = 95
    Width = 36
    Height = 13
    Caption = 'Длина:'
  end
  object lblPrintingAlignment: TLabel
    Left = 152
    Top = 71
    Width = 64
    Height = 13
    Caption = 'Ориентация:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Конфигурация ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 128
    Top = 8
    Width = 300
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 412
    Height = 26
    Caption = 
      'Установка значений конфигурации подкладного документа, параметры' +
      ' которой'#13#10'указываются в свойствах.'
  end
  object Grid: TStringGrid
    Left = 16
    Top = 121
    Width = 273
    Height = 185
    Hint = 'SlipStringIntervals'
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 2
    DefaultColWidth = 200
    DefaultRowHeight = 18
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goThumbTracking]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    ColWidths = (
      200
      67)
    RowHeights = (
      18)
  end
  object edtSlipDocumentWidth: TEdit
    Left = 72
    Top = 67
    Width = 57
    Height = 21
    Hint = 'SlipDocumentWidth'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0'
  end
  object udSlipDocumentWidth: TUpDown
    Left = 129
    Top = 67
    Width = 15
    Height = 21
    Associate = edtSlipDocumentWidth
    Min = 0
    Max = 32767
    Position = 0
    TabOrder = 1
    Wrap = False
  end
  object cbPrintingAlignment: TComboBox
    Left = 224
    Top = 67
    Width = 57
    Height = 21
    Hint = 'PrintingAlignment'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Items.Strings = (
      '0'
      '90'
      '180'
      '270')
  end
  object edtSlipDocumentLength: TEdit
    Left = 72
    Top = 91
    Width = 57
    Height = 21
    Hint = 'SlipDocumentLength'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '0'
  end
  object udSlipDocumentLength: TUpDown
    Left = 129
    Top = 91
    Width = 15
    Height = 21
    Associate = edtSlipDocumentLength
    Min = 0
    Max = 32767
    Position = 0
    TabOrder = 4
    Wrap = False
  end
end
