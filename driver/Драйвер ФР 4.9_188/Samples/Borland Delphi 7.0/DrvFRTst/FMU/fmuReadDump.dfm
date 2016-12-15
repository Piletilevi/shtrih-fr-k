object fmReadDump: TfmReadDump
  Left = 347
  Top = 259
  AutoScroll = False
  Caption = #1044#1072#1084#1087
  ClientHeight = 306
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    643
    306)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDeviceCode: TLabel
    Left = 8
    Top = 20
    Width = 63
    Height = 13
    Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086':'
  end
  object cbDeviceCode: TComboBox
    Left = 80
    Top = 16
    Width = 177
    Height = 21
    Hint = 'DeviceCode'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Items.Strings = (
      #1053#1072#1082#1086#1087#1080#1090#1077#1083#1100' '#1060#1055'1'
      #1053#1072#1082#1086#1087#1080#1090#1077#1083#1100' '#1060#1055'2'
      #1063#1072#1089#1099
      #1069#1085#1077#1088#1075#1086#1085#1077#1079#1072#1074#1080#1089#1080#1084#1072#1103' '#1087#1072#1084#1103#1090#1100
      #1055#1088#1086#1094#1077#1089#1089#1086#1088' '#1060#1055
      #1055#1072#1084#1103#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084
      #1054#1087#1077#1088#1072#1090#1080#1074#1085#1072#1103' '#1087#1072#1084#1103#1090#1100)
  end
  object grpBlockRequest: TGroupBox
    Left = 8
    Top = 44
    Width = 627
    Height = 161
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1086#1073#1083#1086#1095#1085#1099#1081' '#1076#1086#1089#1090#1091#1087
    TabOrder = 1
    DesignSize = (
      627
      161)
    object lblData: TLabel
      Left = 8
      Top = 64
      Width = 68
      Height = 13
      Caption = #1041#1083#1086#1082' '#1076#1072#1085#1085#1099#1093':'
    end
    object lblBlockNumber: TLabel
      Left = 8
      Top = 44
      Width = 110
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1073#1083#1086#1082#1072' '#1076#1072#1085#1085#1099#1093':'
    end
    object lblBlockCount: TLabel
      Left = 8
      Top = 20
      Width = 141
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1083#1086#1082#1086#1074' '#1076#1072#1085#1085#1099#1093':'
    end
    object btnDampRequest: TButton
      Left = 170
      Top = 120
      Width = 145
      Height = 25
      Hint = 'DampRequest'
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1088#1086#1089' '#1076#1072#1084#1087#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnDampRequestClick
    end
    object Memo: TMemo
      Left = 152
      Top = 64
      Width = 467
      Height = 49
      Hint = 'DataBlock'
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
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 2
      WordWrap = False
    end
    object edtBlockCount: TEdit
      Left = 152
      Top = 16
      Width = 467
      Height = 21
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1083#1086#1082#1086#1074' '#1076#1072#1085#1085#1099#1093
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object edtBlockNumber: TEdit
      Left = 152
      Top = 40
      Width = 467
      Height = 21
      Hint = 'DataBlockNumber'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object btnGetData: TBitBtn
      Left = 322
      Top = 120
      Width = 145
      Height = 25
      Hint = 'GetData'
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnGetDataClick
      NumGlyphs = 2
    end
    object btnInterruptDataStream: TBitBtn
      Left = 474
      Top = 120
      Width = 145
      Height = 25
      Hint = 'InterruptDataStream'
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1074#1099#1076#1072#1095#1091' '#1076#1072#1085#1085#1099#1093
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnInterruptDataStreamClick
      NumGlyphs = 2
    end
  end
  object grpAllBlocks: TGroupBox
    Left = 8
    Top = 210
    Width = 627
    Height = 87
    Anchors = [akLeft, akTop, akRight]
    Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1074#1089#1077#1093' '#1073#1083#1086#1082#1086#1074
    TabOrder = 2
    DesignSize = (
      627
      87)
    object lblCount: TLabel
      Left = 9
      Top = 36
      Width = 90
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1073#1083#1086#1082#1086#1074':'
      Visible = False
    end
    object btnStart: TBitBtn
      Left = 473
      Top = 16
      Width = 145
      Height = 25
      Hint = #1047#1072#1082#1072#1095#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1072#1095#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnStartClick
      NumGlyphs = 2
    end
    object btnStop: TBitBtn
      Left = 473
      Top = 50
      Width = 145
      Height = 25
      Hint = #1055#1088#1077#1088#1074#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnStopClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080
        8080808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object btnViewData: TBitBtn
      Left = 169
      Top = 50
      Width = 145
      Height = 25
      Hint = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnViewDataClick
      NumGlyphs = 2
    end
    object ProgressBar: TProgressBar
      Left = 9
      Top = 24
      Width = 456
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Step = 1
      TabOrder = 0
      Visible = False
    end
    object btnSaveDump: TBitBtn
      Left = 321
      Top = 50
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 4
      OnClick = btnSaveDumpClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
        9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
        D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
        4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
        E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
        D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
        4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
        DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
        CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
        6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
        A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
        CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
        6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
        CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
        6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
        CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
        6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
        97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
        3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object dlgSave: TSaveDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'(*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 136
    Top = 256
  end
end
