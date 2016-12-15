object fmPrintAttribute: TfmPrintAttribute
  Left = 340
  Top = 291
  AutoScroll = False
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
  ClientHeight = 228
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    489
    228)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAttrinuteNumber: TLabel
    Left = 8
    Top = 14
    Width = 129
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072', 0..255:'
  end
  object lblAttributeValue: TLabel
    Left = 8
    Top = 38
    Width = 107
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1072':'
  end
  object btnPrintAttribute: TButton
    Left = 289
    Top = 8
    Width = 193
    Height = 25
    Hint = 'PrintAttribute'
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1095#1072#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnPrintAttributeClick
  end
  object btnPrintAttributes: TButton
    Left = 289
    Top = 40
    Width = 193
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1095#1072#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = btnPrintAttributesClick
  end
  object seAttributeNumber: TSpinEdit
    Left = 144
    Top = 9
    Width = 137
    Height = 22
    Hint = 'AttributeNumber'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Value = 1
  end
  object memAttribute: TMemo
    Left = 144
    Top = 40
    Width = 137
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'test1')
    MaxLength = 4096
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
