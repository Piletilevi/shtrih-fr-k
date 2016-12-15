object fmPrintBuffer: TfmPrintBuffer
  Left = 438
  Top = 194
  AutoScroll = False
  Caption = #1041#1091#1092#1077#1088
  ClientHeight = 386
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    487
    386)
  PixelsPerInch = 96
  TextHeight = 13
  object lblLineNumber: TLabel
    Left = 8
    Top = 14
    Width = 75
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080':'
  end
  object lblPrintBufferFormat: TLabel
    Left = 8
    Top = 46
    Width = 83
    Height = 13
    Caption = #1060#1086#1088#1084#1072#1090' '#1089#1090#1088#1086#1082#1080':'
  end
  object Memo: TMemo
    Left = 8
    Top = 72
    Width = 297
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
    WordWrap = False
  end
  object btnReadPrintBufferLineNumber: TButton
    Left = 316
    Top = 8
    Width = 163
    Height = 25
    Hint = 'ReadPrintBufferLineNumber'
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnReadPrintBufferLineNumberClick
  end
  object btnClearPrintBuffer: TButton
    Left = 316
    Top = 72
    Width = 163
    Height = 25
    Hint = 'ClearPrintBuffer'
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088' '#1087#1077#1095#1072#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnClearPrintBufferClick
  end
  object btnReadPrintBuffer: TButton
    Left = 316
    Top = 105
    Width = 163
    Height = 25
    Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1077#1089#1100' '#1073#1091#1092#1077#1088
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1077#1089#1100' '#1073#1091#1092#1077#1088
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnReadPrintBufferClick
  end
  object btnReadPrintBufferLine: TButton
    Left = 316
    Top = 40
    Width = 163
    Height = 25
    Hint = 'ReadPrintBufferLine'
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1087#1086' '#1085#1086#1084#1077#1088#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnReadPrintBufferLineClick
  end
  object cbPrintBufferFormat: TComboBox
    Left = 101
    Top = 42
    Width = 204
    Height = 21
    Hint = 'PrintBufferFormat'
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = #1041#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
    Items.Strings = (
      #1041#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1089#1090
      #1042#1089#1077' '#1089#1080#1084#1074#1086#1083#1099)
  end
  object btnClear: TButton
    Left = 316
    Top = 169
    Width = 163
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 8
    OnClick = btnClearClick
  end
  object btnStop: TButton
    Left = 316
    Top = 137
    Width = 163
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100
    Enabled = False
    TabOrder = 7
    OnClick = btnStopClick
  end
  object seLineNumber: TSpinEdit
    Left = 101
    Top = 9
    Width = 204
    Height = 22
    Hint = 'LineNumber'
    Anchors = [akLeft, akTop, akRight]
    MaxValue = 65535
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Value = 0
  end
end
