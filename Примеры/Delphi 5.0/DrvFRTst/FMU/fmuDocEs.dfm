object fmDocEs: TfmDocEs
  Left = 352
  Top = 209
  Width = 434
  Height = 257
  Caption = 'Выбросить ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Caption = 'Выбросить ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 112
    Top = 8
    Width = 311
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 167
    Height = 13
    Caption = 'Выброс подкладного документа.'
  end
  object rgEjectDirection: TRadioGroup
    Left = 16
    Top = 64
    Width = 89
    Height = 65
    Hint = 'EjectDirection'
    Caption = 'Направление'
    ItemIndex = 0
    Items.Strings = (
      'вниз'
      'вверх')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
end
