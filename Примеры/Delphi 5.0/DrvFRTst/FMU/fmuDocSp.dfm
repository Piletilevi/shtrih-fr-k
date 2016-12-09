object fmDocSp: TfmDocSp
  Left = 321
  Top = 255
  Width = 408
  Height = 259
  Caption = 'Открытие ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCheckType: TLabel
    Left = 16
    Top = 84
    Width = 48
    Height = 13
    Caption = 'Тип чека:'
  end
  object lblNumberOfCopies: TLabel
    Left = 208
    Top = 84
    Width = 95
    Height = 13
    Caption = 'Количество копий:'
  end
  object lblCopyOffset1: TLabel
    Left = 208
    Top = 108
    Width = 66
    Height = 13
    Caption = 'Смещение 1:'
  end
  object lblCopyOffset2: TLabel
    Left = 208
    Top = 132
    Width = 66
    Height = 13
    Caption = 'Смещение 2:'
  end
  object lblCopyOffset3: TLabel
    Left = 208
    Top = 156
    Width = 66
    Height = 13
    Caption = 'Смещение 3:'
  end
  object lblCopyOffset4: TLabel
    Left = 208
    Top = 180
    Width = 66
    Height = 13
    Caption = 'Смещение 4:'
  end
  object lblCopyOffset5: TLabel
    Left = 208
    Top = 204
    Width = 66
    Height = 13
    Caption = 'Смещение 5:'
  end
  object Bevel1: TBevel
    Left = 184
    Top = 8
    Width = 213
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 167
    Height = 13
    Caption = 'Открытие стандартного ПД'
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
    Width = 320
    Height = 13
    Caption = 'Открытие стандартного фискального подкладного документа.'
  end
  object cbCheckType: TComboBox
    Left = 72
    Top = 80
    Width = 121
    Height = 21
    Hint = 'CheckType'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Items.Strings = (
      'продажа'
      'покупка'
      'возврат продажи'
      'возврат покупки')
  end
  object rgCopyType: TRadioGroup
    Left = 16
    Top = 112
    Width = 177
    Height = 65
    Hint = 'CopyType'
    Caption = 'Дублирование печати'
    ItemIndex = 0
    Items.Strings = (
      'колонки'
      'блоки строк')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtNumberOfCopies: TEdit
    Left = 312
    Top = 80
    Width = 65
    Height = 21
    Hint = 'NumberOfCopies'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '1'
  end
  object udNumberOfCopies: TUpDown
    Left = 377
    Top = 80
    Width = 15
    Height = 21
    Associate = edtNumberOfCopies
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 3
    Wrap = False
  end
  object edtCopyOffset1: TEdit
    Left = 312
    Top = 104
    Width = 65
    Height = 21
    Hint = 'CopyOffset1'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '1'
  end
  object udCopyOffset1: TUpDown
    Left = 377
    Top = 104
    Width = 15
    Height = 21
    Associate = edtCopyOffset1
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 5
    Wrap = False
  end
  object edtCopyOffset2: TEdit
    Left = 312
    Top = 128
    Width = 65
    Height = 21
    Hint = 'CopyOffset2'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = '1'
  end
  object udCopyOffset2: TUpDown
    Left = 377
    Top = 128
    Width = 15
    Height = 21
    Associate = edtCopyOffset2
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 7
    Wrap = False
  end
  object edtCopyOffset3: TEdit
    Left = 312
    Top = 152
    Width = 65
    Height = 21
    Hint = 'CopyOffset3'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '5'
  end
  object udCopyOffset3: TUpDown
    Left = 377
    Top = 152
    Width = 15
    Height = 21
    Associate = edtCopyOffset3
    Min = 0
    Max = 255
    Position = 5
    TabOrder = 9
    Wrap = False
  end
  object edtCopyOffset4: TEdit
    Left = 312
    Top = 176
    Width = 65
    Height = 21
    Hint = 'CopyOffset4'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Text = '5'
  end
  object udCopyOffset4: TUpDown
    Left = 377
    Top = 176
    Width = 15
    Height = 21
    Associate = edtCopyOffset4
    Min = 0
    Max = 255
    Position = 5
    TabOrder = 11
    Wrap = False
  end
  object edtCopyOffset5: TEdit
    Left = 312
    Top = 200
    Width = 65
    Height = 21
    Hint = 'CopyOffset5'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Text = '7'
  end
  object udCopyOffset5: TUpDown
    Left = 377
    Top = 200
    Width = 15
    Height = 21
    Associate = edtCopyOffset5
    Min = 0
    Max = 255
    Position = 7
    TabOrder = 13
    Wrap = False
  end
end
