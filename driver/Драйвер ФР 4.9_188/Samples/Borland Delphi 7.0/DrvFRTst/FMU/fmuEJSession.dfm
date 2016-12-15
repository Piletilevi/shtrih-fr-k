object fmEJSession: TfmEJSession
  Left = 602
  Top = 201
  AutoScroll = False
  Caption = #1048#1090#1086#1075#1080
  ClientHeight = 330
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    464
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object lblSessionNumber: TLabel
    Left = 8
    Top = 12
    Width = 74
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Memo: TMemo
    Left = 8
    Top = 40
    Width = 449
    Height = 211
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
  end
  object btnGetEKLZJournal: TBitBtn
    Left = 8
    Top = 264
    Width = 169
    Height = 25
    Hint = 'GetEKLZJournal'
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1087#1088#1086#1089' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1081' '#1083#1077#1085#1090#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGetEKLZJournalClick
  end
  object btnStop: TBitBtn
    Left = 360
    Top = 264
    Width = 97
    Height = 25
    Hint = #1055#1088#1077#1088#1074#1072#1090#1100
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnStopClick
  end
  object btnGetEKLZSessionTotal: TBitBtn
    Left = 184
    Top = 264
    Width = 169
    Height = 25
    Hint = 'GetEKLZSessionTotal'
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1087#1088#1086#1089' '#1080#1090#1086#1075#1086#1074' '#1089#1084#1077#1085#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnGetEKLZSessionTotalClick
  end
  object btnEKLZJournalOnSessionNumber: TBitBtn
    Left = 184
    Top = 296
    Width = 169
    Height = 25
    Hint = 'ReadEKLZSessionTotal'
    Anchors = [akRight, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1080#1090#1086#1075#1086#1074' '#1089#1084#1077#1085#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnEKLZJournalOnSessionNumberClick
  end
  object btnReadEKLZJournal: TBitBtn
    Left = 8
    Top = 296
    Width = 169
    Height = 25
    Hint = 'EKLZJournalOnSessionNumber'
    Anchors = [akRight, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1081' '#1083#1077#1085#1090#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnReadEKLZJournalClick
  end
  object seSessionNumber: TSpinEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 22
    Hint = 'SessionNumber'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Value = 1
  end
end
