object fmPrintTest: TfmPrintTest
  Left = 307
  Top = 207
  AutoScroll = False
  Caption = #1058#1077#1089#1090#1099
  ClientHeight = 311
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    506
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object grpPrintLock: TGroupBox
    Left = 8
    Top = 8
    Width = 489
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1077#1095#1072#1090#1100' '#1089' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1086#1081
    TabOrder = 0
    DesignSize = (
      489
      153)
    object lblRepCount2: TLabel
      Left = 16
      Top = 24
      Width = 112
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1074#1090#1086#1088#1086#1074':'
    end
    object lblRepCount: TLabel
      Left = 144
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblErrCount2: TLabel
      Left = 16
      Top = 41
      Width = 103
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1096#1080#1073#1086#1082':'
    end
    object lblErrCount: TLabel
      Left = 144
      Top = 41
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblSpeed: TLabel
      Left = 16
      Top = 58
      Width = 106
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1086#1084#1072#1085#1076'/c:'
    end
    object lblTxSpeed: TLabel
      Left = 144
      Top = 58
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label1: TLabel
      Left = 16
      Top = 92
      Width = 87
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1096#1080#1073#1086#1082':'
    end
    object lblErrRate: TLabel
      Left = 144
      Top = 92
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblTimeLeft2: TLabel
      Left = 16
      Top = 109
      Width = 108
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1072', '#1089#1077#1082#1091#1085#1076':'
    end
    object lblTimeLeft: TLabel
      Left = 144
      Top = 109
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label2: TLabel
      Left = 16
      Top = 75
      Width = 108
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1082#1086#1084#1072#1085#1076#1099', '#1084#1089'.:'
    end
    object lblCommandTime: TLabel
      Left = 144
      Top = 75
      Width = 6
      Height = 13
      Caption = '0'
    end
    object btnStartPrintWithLock: TButton
      Left = 312
      Top = 16
      Width = 169
      Height = 25
      Hint = #1053#1072#1095#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1095#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnStartPrintWithLockClick
    end
    object btnStopPrintWithLock: TButton
      Left = 312
      Top = 48
      Width = 169
      Height = 25
      Hint = #1055#1088#1077#1088#1074#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnStopPrintWithLockClick
    end
    object chbStopOnError: TCheckBox
      Left = 16
      Top = 128
      Width = 177
      Height = 17
      Hint = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1077
      Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object grpSpeedPrintTest: TGroupBox
    Left = 8
    Top = 168
    Width = 489
    Height = 82
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1077#1095#1072#1090#1080
    TabOrder = 1
    DesignSize = (
      489
      82)
    object lblStringCount: TLabel
      Left = 8
      Top = 22
      Width = 94
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082':'
    end
    object lblSpeed_: TLabel
      Left = 8
      Top = 54
      Width = 146
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1077#1095#1072#1090#1080', '#1089#1090#1088#1086#1082'/'#1089#1077#1082':'
    end
    object lblSpeedPrinting: TLabel
      Left = 160
      Top = 54
      Width = 6
      Height = 13
      Caption = '0'
    end
    object btnStartSpeedPrintTest: TButton
      Left = 312
      Top = 16
      Width = 169
      Height = 25
      Hint = #1058#1077#1089#1090' '#1089#1082#1086#1088#1086#1089#1090#1080' '#1087#1077#1095#1072#1090#1080
      Anchors = [akTop, akRight]
      Caption = #1058#1077#1089#1090' '#1089#1082#1086#1088#1086#1089#1090#1080' '#1087#1077#1095#1072#1090#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnStartSpeedPrintTestClick
    end
    object btnStopSpeedPrintTest: TButton
      Left = 312
      Top = 48
      Width = 169
      Height = 25
      Hint = #1055#1088#1077#1088#1074#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnStopSpeedPrintTestClick
    end
    object sePrintCount: TSpinEdit
      Left = 112
      Top = 18
      Width = 191
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 1
    end
  end
  object grpTestFonts: TGroupBox
    Left = 8
    Top = 256
    Width = 489
    Height = 47
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1077#1089#1090' '#1087#1077#1095#1072#1090#1080' '#1096#1088#1080#1092#1090#1086#1074
    TabOrder = 2
    DesignSize = (
      489
      47)
    object btnFonts: TButton
      Left = 312
      Top = 14
      Width = 169
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1058#1077#1089#1090' '#1087#1077#1095#1072#1090#1080' '#1096#1088#1080#1092#1090#1086#1074
      TabOrder = 0
      OnClick = btnFontsClick
    end
  end
end
