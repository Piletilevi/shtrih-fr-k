object fmConnectionTest: TfmConnectionTest
  Left = 311
  Top = 152
  AutoScroll = False
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1074#1103#1079#1080
  ClientHeight = 308
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  DesignSize = (
    636
    308)
  PixelsPerInch = 96
  TextHeight = 13
  object grpCheckConnection: TGroupBox
    Left = 8
    Top = 8
    Width = 617
    Height = 201
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1074#1103#1079#1080
    TabOrder = 0
    DesignSize = (
      617
      201)
    object lblRepCount2: TLabel
      Left = 16
      Top = 24
      Width = 112
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1074#1090#1086#1088#1086#1074':'
    end
    object lblRepCount: TLabel
      Left = 135
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblErrCount2: TLabel
      Left = 16
      Top = 48
      Width = 103
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1096#1080#1073#1086#1082':'
    end
    object lblErrCount: TLabel
      Left = 135
      Top = 48
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblSpeed: TLabel
      Left = 16
      Top = 72
      Width = 106
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1086#1084#1072#1085#1076'/c:'
    end
    object lblTxSpeed: TLabel
      Left = 135
      Top = 72
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label1: TLabel
      Left = 16
      Top = 120
      Width = 87
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1096#1080#1073#1086#1082':'
    end
    object lblErrRate: TLabel
      Left = 135
      Top = 120
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblTimeLeft2: TLabel
      Left = 16
      Top = 144
      Width = 108
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1072', '#1089#1077#1082#1091#1085#1076':'
    end
    object lblTimeLeft: TLabel
      Left = 135
      Top = 144
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label2: TLabel
      Left = 16
      Top = 96
      Width = 108
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1082#1086#1084#1072#1085#1076#1099', '#1084#1089'.:'
    end
    object lblCommandTime: TLabel
      Left = 135
      Top = 96
      Width = 6
      Height = 13
      Caption = '0'
    end
    object btnStart: TButton
      Left = 454
      Top = 24
      Width = 153
      Height = 25
      Hint = #1053#1072#1095#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1095#1072#1090#1100
      TabOrder = 1
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 454
      Top = 56
      Width = 153
      Height = 25
      Hint = #1055#1088#1077#1088#1074#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100
      Enabled = False
      TabOrder = 2
      OnClick = btnStopClick
    end
    object chbStopOnError: TCheckBox
      Left = 16
      Top = 176
      Width = 177
      Height = 17
      Hint = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1077
      Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1077
      TabOrder = 0
    end
  end
  object grpConnectionTest: TGroupBox
    Left = 8
    Top = 216
    Width = 617
    Height = 84
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1077#1089#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
    TabOrder = 1
    DesignSize = (
      617
      84)
    object lblTime: TLabel
      Left = 8
      Top = 56
      Width = 87
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1072', '#1084#1089':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTest: TLabel
      Left = 8
      Top = 28
      Width = 285
      Height = 13
      Caption = #1058#1077#1089#1090' '#1087#1077#1095#1072#1090#1072#1077#1090' 100 '#1089#1090#1088#1086#1082' '#1080' '#1074#1099#1076#1072#1077#1090' '#1086#1073#1097#1077#1077' '#1074#1088#1077#1084#1103' '#1087#1077#1095#1072#1090#1080'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnTestConnect: TBitBtn
      Left = 454
      Top = 28
      Width = 153
      Height = 25
      Hint = #1058#1077#1089#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1058#1077#1089#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnTestConnectClick
      NumGlyphs = 2
    end
    object edtTime: TEdit
      Left = 104
      Top = 52
      Width = 81
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
end
