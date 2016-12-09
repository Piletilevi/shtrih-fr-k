object fmFont: TfmFont
  Left = 350
  Top = 163
  Width = 538
  Height = 187
  Caption = 'Шрифты'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblFontType: TLabel
    Left = 376
    Top = 12
    Width = 79
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Номер шрифта:'
  end
  object lblTapeType: TLabel
    Left = 376
    Top = 44
    Width = 34
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Лента:'
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 369
    Height = 162
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnGetFontMetrics: TButton
    Left = 376
    Top = 72
    Width = 145
    Height = 25
    Hint = 'Параметры шрифта'
    Anchors = [akTop, akRight]
    Caption = 'Параметры шрифта'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnGetFontMetricsClick
    OnMouseMove = btnGetFontMetricsMouseMove
  end
  object edtFontType: TEdit
    Left = 464
    Top = 8
    Width = 41
    Height = 21
    Hint = 'FontType'
    Anchors = [akTop, akRight]
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1'
  end
  object udFontType: TUpDown
    Left = 505
    Top = 8
    Width = 15
    Height = 21
    Anchors = [akTop, akRight]
    Associate = edtFontType
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 2
    Wrap = False
  end
  object btnGetFontsMetrics: TButton
    Left = 376
    Top = 104
    Width = 145
    Height = 25
    Hint = 'Параметры шрифтов'
    Anchors = [akTop, akRight]
    Caption = 'Параметры шрифтов'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnGetFontsMetricsClick
    OnMouseMove = btnGetFontMetricsMouseMove
  end
  object cbTapeType: TComboBox
    Left = 424
    Top = 40
    Width = 97
    Height = 21
    Hint = 'Тип ленты'
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      'чековая'
      'контрольная')
  end
end
