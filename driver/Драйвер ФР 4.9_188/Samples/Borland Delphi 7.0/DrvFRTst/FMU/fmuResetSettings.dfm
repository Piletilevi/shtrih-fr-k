object fmResetSettings: TfmResetSettings
  Left = 334
  Top = 136
  AutoScroll = False
  Caption = #1054#1073#1085#1091#1083#1077#1085#1080#1077
  ClientHeight = 167
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnResetSummary: TButton
    Left = 8
    Top = 40
    Width = 177
    Height = 25
    Hint = 'ResetSummary'
    Caption = #1054#1073#1097#1077#1077' '#1075#1072#1096#1077#1085#1080#1077
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnResetSummaryClick
  end
  object btnResetSettings: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Hint = 'ResetSettings'
    Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1091#1083#1077#1085#1080#1077
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnResetSettingsClick
  end
end
