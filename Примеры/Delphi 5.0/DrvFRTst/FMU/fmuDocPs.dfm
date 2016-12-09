object fmDocPs: TfmDocPs
  Left = 352
  Top = 209
  Width = 472
  Height = 275
  Caption = 'Печать ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrint2: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Печать ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrint: TLabel
    Left = 16
    Top = 32
    Width = 325
    Height = 13
    Caption = 'Вывод на печать содержимого буфера подкладного документа.'
  end
  object Bevel1: TBevel
    Left = 88
    Top = 8
    Width = 373
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object rgInfoType: TRadioGroup
    Left = 184
    Top = 64
    Width = 161
    Height = 89
    Hint = 'InfoType'
    Caption = 'Тип'
    ItemIndex = 2
    Items.Strings = (
      'только нефискальная'
      'только фискальная'
      'вся')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgIsClearUnfiscalInfo: TRadioGroup
    Left = 16
    Top = 64
    Width = 161
    Height = 89
    Hint = 'IsClearUnfiscalInfo'
    Caption = 'Нефискальная информация'
    ItemIndex = 0
    Items.Strings = (
      'очищать'
      'не очищать')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
end
