object fmEJStatus: TfmEJStatus
  Left = 290
  Top = 339
  Anchors = [akLeft, akTop, akRight]
  AutoScroll = False
  Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
  ClientHeight = 270
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    374
    270)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 193
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object btnGetEJCode1Status: TButton
    Left = 136
    Top = 208
    Width = 121
    Height = 25
    Hint = 'GetEKLZCode1Report'
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1082#1086#1076#1091' 1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnGetEJCode1StatusClick
  end
  object btnGetEJCode2Status: TButton
    Left = 136
    Top = 240
    Width = 121
    Height = 25
    Hint = 'GetEKLZCode2Report'
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1082#1086#1076#1091' 2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnGetEJCode2StatusClick
  end
  object btnEJVersion: TButton
    Left = 8
    Top = 208
    Width = 121
    Height = 25
    Hint = 'GetEKLZVersion'
    Anchors = [akRight, akBottom]
    Caption = #1042#1077#1088#1089#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnEJVersionClick
  end
  object btnGetEJSerialNumber: TButton
    Left = 8
    Top = 240
    Width = 121
    Height = 25
    Hint = 'GetEKLZSerialNumber'
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGetEJSerialNumberClick
  end
  object btnGetAll: TButton
    Left = 264
    Top = 208
    Width = 105
    Height = 25
    Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1089#1077
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1089#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnGetAllClick
  end
end
