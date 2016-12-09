object fmDocDs: TfmDocDs
  Left = 400
  Top = 259
  Width = 438
  Height = 248
  Caption = 'Скидка ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblSumm1: TLabel
    Left = 16
    Top = 66
    Width = 37
    Height = 13
    Caption = 'Сумма:'
  end
  object lblTax1: TLabel
    Left = 16
    Top = 90
    Width = 40
    Height = 13
    Caption = 'Налог1:'
  end
  object lblTax2: TLabel
    Left = 16
    Top = 114
    Width = 40
    Height = 13
    Caption = 'Налог2:'
  end
  object lblTax3: TLabel
    Left = 16
    Top = 138
    Width = 40
    Height = 13
    Caption = 'Налог3:'
  end
  object lblTax4: TLabel
    Left = 16
    Top = 162
    Width = 40
    Height = 13
    Caption = 'Налог4:'
  end
  object lblStringForPrinting: TLabel
    Left = 16
    Top = 190
    Width = 39
    Height = 13
    Caption = 'Строка:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 164
    Height = 13
    Caption = 'Стандартная скидка на ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 295
    Height = 13
    Caption = 'Стандартная операция скидки на подкладном документе.'
  end
  object Bevel1: TBevel
    Left = 192
    Top = 8
    Width = 235
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtSumm1: TEdit
    Left = 72
    Top = 64
    Width = 81
    Height = 21
    Hint = 'Summ1'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '100'
  end
  object cbTax1: TComboBox
    Left = 72
    Top = 88
    Width = 81
    Height = 21
    Hint = 'Tax1'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax2: TComboBox
    Left = 72
    Top = 112
    Width = 81
    Height = 21
    Hint = 'Tax2'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax3: TComboBox
    Left = 72
    Top = 136
    Width = 81
    Height = 21
    Hint = 'Tax3'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax4: TComboBox
    Left = 72
    Top = 160
    Width = 81
    Height = 21
    Hint = 'Tax4'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object edtStringForPrinting: TEdit
    Left = 72
    Top = 188
    Width = 345
    Height = 21
    Hint = 'StringForPrinting'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = 'Строка для печати'
  end
end
