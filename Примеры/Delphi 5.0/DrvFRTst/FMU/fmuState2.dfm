object fmState2: TfmState2
  Left = 279
  Top = 247
  Width = 407
  Height = 224
  Caption = 'Параметры'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblDrawer: TLabel
    Left = 232
    Top = 140
    Width = 88
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Денежный ящик:'
  end
  object btnBeep: TButton
    Left = 232
    Top = 104
    Width = 161
    Height = 25
    Hint = 'Beep'
    Anchors = [akTop, akRight]
    Caption = 'Гудок'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnBeepClick
  end
  object btnResetSettings: TButton
    Left = 232
    Top = 72
    Width = 161
    Height = 25
    Hint = 'ResetSettings'
    Anchors = [akTop, akRight]
    Caption = 'Технологическое обнуление'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnResetSettingsClick
  end
  object btnResetSummary: TButton
    Left = 232
    Top = 40
    Width = 161
    Height = 25
    Hint = 'ResetSummary'
    Anchors = [akTop, akRight]
    Caption = 'Общее гашение'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnResetSummaryClick
  end
  object btnDeviceMetrics: TButton
    Tag = 1
    Left = 232
    Top = 8
    Width = 161
    Height = 25
    Hint = 'GetDeviceMetrics'
    Anchors = [akTop, akRight]
    Caption = 'Параметры устройства'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnDeviceMetricsClick
  end
  object edtDrawer: TEdit
    Left = 328
    Top = 136
    Width = 45
    Height = 21
    Hint = 'DrawerNumber'
    Anchors = [akTop, akRight]
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = '0'
  end
  object udDrawer: TUpDown
    Left = 373
    Top = 136
    Width = 15
    Height = 21
    Anchors = [akTop, akRight]
    Associate = edtDrawer
    Min = 0
    Position = 0
    TabOrder = 6
    Wrap = False
  end
  object btnOpenDrawer: TButton
    Tag = 2
    Left = 232
    Top = 168
    Width = 161
    Height = 25
    Hint = 'OpenDrawer'
    Anchors = [akTop, akRight]
    Caption = 'Открыть денежный ящик'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnOpenDrawerClick
    OnMouseMove = btnOpenDrawerMouseMove
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 217
    Height = 197
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = False
  end
end
