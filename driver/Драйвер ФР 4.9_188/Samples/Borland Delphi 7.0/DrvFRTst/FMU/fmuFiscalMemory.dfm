object fmFiscalMemory: TfmFiscalMemory
  Left = 272
  Top = 148
  AutoScroll = False
  Caption = #1060#1055
  ClientHeight = 308
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    543
    308)
  PixelsPerInch = 96
  TextHeight = 13
  object grpRecordsSum: TGroupBox
    Left = 8
    Top = 6
    Width = 529
    Height = 160
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1091#1084#1084#1072' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1060#1055
    TabOrder = 0
    DesignSize = (
      529
      160)
    object lblSumm1: TLabel
      Left = 16
      Top = 54
      Width = 49
      Height = 13
      Caption = #1055#1088#1086#1076#1072#1078#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumm3: TLabel
      Left = 16
      Top = 80
      Width = 46
      Height = 13
      Caption = #1055#1086#1082#1091#1087#1082#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumm2: TLabel
      Left = 16
      Top = 106
      Width = 86
      Height = 13
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1072#1078':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumm4: TLabel
      Left = 16
      Top = 132
      Width = 89
      Height = 13
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1082#1091#1087#1086#1082':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblType: TLabel
      Left = 16
      Top = 28
      Width = 22
      Height = 13
      Caption = #1058#1080#1087':'
    end
    object edtSumm1: TEdit
      Left = 120
      Top = 50
      Width = 193
      Height = 21
      Hint = 'Summ1'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object edtSumm3: TEdit
      Left = 120
      Top = 102
      Width = 193
      Height = 21
      Hint = 'Summ2'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object edtSumm2: TEdit
      Left = 120
      Top = 76
      Width = 193
      Height = 21
      Hint = 'Summ3'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object edtSumm4: TEdit
      Left = 120
      Top = 128
      Width = 193
      Height = 21
      Hint = 'Summ4'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object btnGetFMRecordsSum: TBitBtn
      Left = 326
      Top = 24
      Width = 193
      Height = 25
      Hint = 'GetFMRecordsSum'
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1079#1072#1087#1080#1089#1077#1081' '#1060#1055
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnGetFMRecordsSumClick
      NumGlyphs = 2
    end
    object cbFMType: TComboBox
      Left = 120
      Top = 24
      Width = 193
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Items.Strings = (
        #1074#1089#1077' '#1079#1072#1087#1080#1089#1080
        #1087#1086#1089#1083#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1092#1080#1089#1082#1072#1083#1080#1079#1072#1094#1080#1080)
    end
  end
  object grpLastFMRecord: TGroupBox
    Left = 8
    Top = 167
    Width = 529
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100' '#1074' '#1060#1055
    TabOrder = 1
    DesignSize = (
      529
      86)
    object lblFMType: TLabel
      Left = 16
      Top = 32
      Width = 22
      Height = 13
      Caption = #1058#1080#1087':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFMDate: TLabel
      Left = 16
      Top = 58
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtFMType: TEdit
      Left = 120
      Top = 28
      Width = 193
      Height = 21
      Hint = 'TypeOfLastEntryFM'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object edtFMDate: TEdit
      Left = 120
      Top = 54
      Width = 193
      Height = 21
      Hint = 'Date'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object btnGetLastFMRecordDate: TBitBtn
      Left = 326
      Top = 26
      Width = 193
      Height = 25
      Hint = 'GetLastFMRecordDate'
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080' '#1074' '#1060#1055
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnGetLastFMRecordDateClick
      NumGlyphs = 2
    end
  end
  object grpInitFM: TGroupBox
    Left = 8
    Top = 255
    Width = 529
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1060#1055
    TabOrder = 2
    DesignSize = (
      529
      49)
    object btnInitFM: TButton
      Left = 326
      Top = 16
      Width = 193
      Height = 25
      Hint = 'InitFM'
      Anchors = [akTop, akRight]
      Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1060#1055
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnInitFMClick
    end
  end
end
