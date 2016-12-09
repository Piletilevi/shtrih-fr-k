object fmRecpt: TfmRecpt
  Left = 295
  Top = 263
  Width = 295
  Height = 226
  Caption = 'Выдача чека (Киоск-ФР)'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOutputReceipt0: TButton
    Left = 136
    Top = 8
    Width = 145
    Height = 25
    Hint = 'OutputReceipt0'
    Anchors = [akTop, akRight]
    Caption = 'Выдать чек'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOutputReceipt0Click
  end
  object btnGetECRStatus: TButton
    Left = 136
    Top = 168
    Width = 145
    Height = 25
    Hint = 'GetECRStatus'
    Anchors = [akTop, akRight]
    Caption = 'Получить состояние'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnGetECRStatusClick
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 129
    Height = 199
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object btnOpenScreen: TButton
    Left = 136
    Top = 104
    Width = 145
    Height = 25
    Hint = 'OpenScreen'
    Anchors = [akTop, akRight]
    Caption = 'Открыть заслонку'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnOpenScreenClick
  end
  object btnCloseScreen: TButton
    Left = 136
    Top = 136
    Width = 145
    Height = 25
    Hint = 'CloseScreen'
    Anchors = [akTop, akRight]
    Caption = 'Закрыть заслонку'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnCloseScreenClick
  end
  object btnOutputReceipt1: TButton
    Left = 136
    Top = 40
    Width = 145
    Height = 25
    Hint = 'OutputReceipt1'
    Anchors = [akTop, akRight]
    Caption = 'Фиксировать чек'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnOutputReceipt1Click
  end
  object btnOutputReceipt2: TButton
    Left = 136
    Top = 72
    Width = 145
    Height = 25
    Hint = 'OutputReceipt2'
    Anchors = [akTop, akRight]
    Caption = 'Выдать чек с фиксацией'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnOutputReceipt2Click
  end
end
