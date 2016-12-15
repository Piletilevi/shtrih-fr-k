object fmPrintBarcodePrinter: TfmPrintBarcodePrinter
  Left = 359
  Top = 266
  Anchors = [akLeft, akTop, akRight]
  AutoScroll = False
  Caption = #1064#1090#1088#1080#1093#1082#1086#1076' 2'
  ClientHeight = 330
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    612
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object lblData: TLabel
    Left = 8
    Top = 12
    Width = 101
    Height = 13
    Caption = #1044#1072#1085#1085#1099#1077' '#1096#1090#1088#1080#1093#1082#1086#1076#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblBarWidth: TLabel
    Left = 8
    Top = 44
    Width = 115
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072' '#1096#1090#1088#1080#1093#1072', '#1090#1086#1095#1077#1082':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblBarcodeType: TLabel
    Left = 8
    Top = 76
    Width = 79
    Height = 13
    Caption = #1058#1080#1087' '#1096#1090#1088#1080#1093#1082#1086#1076#1072':'
  end
  object lblLineNumber: TLabel
    Left = 8
    Top = 109
    Width = 132
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072' '#1096#1090#1088#1080#1093#1082#1086#1076#1072', '#1090#1086#1095#1077#1082':'
  end
  object lblFontType: TLabel
    Left = 8
    Top = 141
    Width = 56
    Height = 13
    Caption = #1064#1088#1080#1092#1090' HRI'
  end
  object lblHRIPosition: TLabel
    Left = 8
    Top = 173
    Width = 69
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103' HRI:'
  end
  object edtBarcode: TEdit
    Left = 152
    Top = 8
    Width = 227
    Height = 21
    Hint = 'Barcode'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4096
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '12345678901234567890'
  end
  object seBarWidth: TSpinEdit
    Left = 152
    Top = 40
    Width = 227
    Height = 22
    Hint = 'BarWidth'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Value = 2
  end
  object seLineNumber: TSpinEdit
    Left = 152
    Top = 104
    Width = 227
    Height = 22
    Hint = 'LineNumber'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 1199
    MinValue = 0
    TabOrder = 2
    Value = 100
  end
  object btnPrintBarcodeUsingPrinter: TButton
    Left = 386
    Top = 8
    Width = 218
    Height = 25
    Hint = 'PrintBarcodeUsingPrinter'
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1095#1072#1090#1100' '#1096#1090#1088#1080#1093#1082#1086#1076#1072' '#1089#1088#1077#1076#1089#1090#1074#1072#1084#1080' '#1087#1088#1080#1085#1090#1077#1088#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnPrintBarcodeUsingPrinterClick
  end
  object seFontType: TSpinEdit
    Left = 152
    Top = 136
    Width = 227
    Height = 22
    Hint = 'FontType'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Value = 0
  end
  object seHRIPosition: TSpinEdit
    Left = 152
    Top = 168
    Width = 227
    Height = 22
    Hint = 'HRIPosition'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Value = 0
  end
  object chbCutPaper: TCheckBox
    Left = 152
    Top = 200
    Width = 209
    Height = 17
    Hint = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1086#1090#1088#1077#1079#1082#1091
    Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1086#1090#1088#1077#1079#1082#1091
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 6
  end
  object cbBarcodeType: TComboBox
    Left = 152
    Top = 72
    Width = 227
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 7
  end
  object chbPrintMaxWidth: TCheckBox
    Left = 152
    Top = 224
    Width = 233
    Height = 17
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1091#1102' '#1096#1080#1088#1080#1085#1091
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
end
