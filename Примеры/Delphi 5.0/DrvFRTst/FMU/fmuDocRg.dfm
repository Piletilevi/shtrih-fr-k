object fmDocRg: TfmDocRg
  Left = 330
  Top = 252
  Width = 447
  Height = 237
  Caption = 'Регистрация ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblStringForPrinting: TLabel
    Left = 16
    Top = 172
    Width = 39
    Height = 13
    Caption = 'Строка:'
  end
  object lblTax4: TLabel
    Left = 240
    Top = 132
    Width = 40
    Height = 13
    Caption = 'Налог4:'
  end
  object lblTax3: TLabel
    Left = 240
    Top = 108
    Width = 40
    Height = 13
    Caption = 'Налог3:'
  end
  object lblTax2: TLabel
    Left = 240
    Top = 84
    Width = 40
    Height = 13
    Caption = 'Налог2:'
  end
  object lblTax1: TLabel
    Left = 240
    Top = 60
    Width = 40
    Height = 13
    Caption = 'Налог1:'
  end
  object lblDepartment: TLabel
    Left = 16
    Top = 120
    Width = 31
    Height = 13
    Caption = 'Отдел'
  end
  object lblQuantity: TLabel
    Left = 16
    Top = 96
    Width = 62
    Height = 13
    Caption = 'Количество:'
  end
  object lblPrice: TLabel
    Left = 16
    Top = 72
    Width = 29
    Height = 13
    Caption = 'Цена:'
  end
  object Bevel1: TBevel
    Left = 216
    Top = 8
    Width = 220
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 197
    Height = 13
    Caption = 'Стандартная регистрация на ПД'
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
    Width = 323
    Height = 13
    Caption = 'Стандартная операция регистрации на подкладном документе.'
  end
  object edtStringForPrinting: TEdit
    Left = 88
    Top = 168
    Width = 338
    Height = 21
    Hint = 'StringForPrinting'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = 'Строка для печати'
  end
  object cbTax4: TComboBox
    Left = 312
    Top = 128
    Width = 97
    Height = 21
    Hint = 'Tax4'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax3: TComboBox
    Left = 312
    Top = 104
    Width = 97
    Height = 21
    Hint = 'Tax3'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax2: TComboBox
    Left = 312
    Top = 80
    Width = 97
    Height = 21
    Hint = 'Tax2'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax1: TComboBox
    Left = 312
    Top = 56
    Width = 97
    Height = 21
    Hint = 'Tax1'
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
  object edtQuantity: TEdit
    Left = 88
    Top = 92
    Width = 97
    Height = 21
    Hint = 'Quantity'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1'
  end
  object edtPrice: TEdit
    Left = 88
    Top = 68
    Width = 97
    Height = 21
    Hint = 'Price'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '100'
  end
  object edtDepartment: TEdit
    Left = 88
    Top = 116
    Width = 81
    Height = 21
    Hint = 'Department'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '0'
  end
  object udDepartment: TUpDown
    Left = 169
    Top = 116
    Width = 15
    Height = 21
    Associate = edtDepartment
    Min = 0
    Max = 16
    Position = 0
    TabOrder = 3
    Wrap = False
  end
end
