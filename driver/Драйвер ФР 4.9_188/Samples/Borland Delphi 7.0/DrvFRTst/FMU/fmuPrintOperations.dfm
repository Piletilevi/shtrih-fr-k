object fmPrintOperations: TfmPrintOperations
  Left = 336
  Top = 194
  AutoScroll = False
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 299
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    500
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object grpFeed: TGroupBox
    Left = 5
    Top = 5
    Width = 486
    Height = 85
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1076#1074#1080#1085#1091#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
    TabOrder = 0
    DesignSize = (
      486
      85)
    object lblStringQuantity: TLabel
      Left = 16
      Top = 27
      Width = 94
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnFeedDocument: TButton
      Left = 309
      Top = 21
      Width = 162
      Height = 25
      Hint = 'FeedDocument'
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1076#1074#1080#1085#1091#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnFeedDocumentClick
    end
    object chbUseReceiptRibbon2: TCheckBox
      Left = 28
      Top = 56
      Width = 105
      Height = 17
      Hint = 'UseReceiptRibbon'
      Anchors = [akTop, akRight]
      Caption = #1063#1077#1082#1086#1074#1072#1103' '#1083#1077#1085#1090#1072
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
      TabOrder = 1
    end
    object chbUseJournalRibbon2: TCheckBox
      Left = 131
      Top = 56
      Width = 116
      Height = 17
      Hint = 'UseJournalRibbon'
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1083#1077#1085#1090#1072
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
      TabOrder = 2
    end
    object seStringQuantity: TSpinEdit
      Left = 155
      Top = 23
      Width = 138
      Height = 22
      Hint = 'StringQuantity'
      Anchors = [akLeft, akTop, akRight]
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 15
    end
    object chkUseSlipDocument: TCheckBox
      Left = 256
      Top = 56
      Width = 41
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1055#1044
      TabOrder = 3
    end
  end
  object grpContinuePrint: TGroupBox
    Left = 5
    Top = 152
    Width = 486
    Height = 48
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1087#1077#1095#1072#1090#1100
    TabOrder = 2
    DesignSize = (
      486
      48)
    object btnContinuePrint: TButton
      Left = 309
      Top = 13
      Width = 162
      Height = 25
      Hint = 'ContinuePrint'
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1087#1077#1095#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnContinuePrintClick
    end
  end
  object grpTechTest: TGroupBox
    Left = 5
    Top = 206
    Width = 486
    Height = 56
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1077#1089#1090#1086#1074#1099#1081' '#1087#1088#1086#1075#1086#1085
    TabOrder = 3
    DesignSize = (
      486
      56)
    object lblPeriod: TLabel
      Left = 8
      Top = 24
      Width = 138
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1075#1086#1085#1072' '#1074' '#1084#1080#1085#1091#1090#1072#1093':'
    end
    object btnStartTechTest: TButton
      Left = 309
      Top = 19
      Width = 76
      Height = 25
      Hint = 'Test'
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1095#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnStartTechTestClick
    end
    object btnStopTechTest: TButton
      Left = 395
      Top = 19
      Width = 76
      Height = 25
      Hint = 'InterruptTest'
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnStopTechTestClick
    end
    object sePeriod: TSpinEdit
      Left = 155
      Top = 20
      Width = 142
      Height = 22
      Hint = 'RunningPeriod'
      Anchors = [akLeft, akTop, akRight]
      MaxValue = 99
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 1
    end
  end
  object grpCutCheck: TGroupBox
    Left = 5
    Top = 96
    Width = 486
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = #1054#1090#1088#1077#1079#1072#1090#1100' '#1095#1077#1082
    TabOrder = 1
    DesignSize = (
      486
      49)
    object lblCutType: TLabel
      Left = 16
      Top = 22
      Width = 66
      Height = 13
      Caption = #1058#1080#1087' '#1086#1090#1088#1077#1079#1082#1080':'
    end
    object cbCutType: TComboBox
      Left = 155
      Top = 18
      Width = 138
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #1087#1086#1083#1085#1072#1103
      Items.Strings = (
        #1087#1086#1083#1085#1072#1103
        #1085#1077#1087#1086#1083#1085#1072#1103)
    end
    object btnCutCheck: TButton
      Left = 309
      Top = 16
      Width = 162
      Height = 25
      Hint = 'CutCheck'
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1088#1077#1079#1072#1090#1100' '#1095#1077#1082
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCutCheckClick
    end
  end
end
