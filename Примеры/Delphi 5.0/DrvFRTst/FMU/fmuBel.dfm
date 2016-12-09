object fmBel: TfmBel
  Left = 272
  Top = 218
  Width = 476
  Height = 329
  Caption = 'Беларусь'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblSerialNumber: TLabel
    Left = 16
    Top = 36
    Width = 142
    Height = 13
    Caption = 'Длинный заводской номер:'
  end
  object lblRNM: TLabel
    Left = 16
    Top = 60
    Width = 77
    Height = 13
    Caption = 'Длинный РНМ:'
  end
  object lblNewPasswordTI: TLabel
    Left = 16
    Top = 84
    Width = 95
    Height = 13
    Caption = 'Новый пароль НИ:'
  end
  object lblINN: TLabel
    Left = 16
    Top = 104
    Width = 24
    Height = 13
    Caption = 'ИНН'
  end
  object lblRegistrationNumber: TLabel
    Left = 16
    Top = 132
    Width = 114
    Height = 13
    Caption = 'Номер фискализации:'
  end
  object lblFreeRegistration: TLabel
    Left = 16
    Top = 156
    Width = 202
    Height = 13
    Caption = 'Количество оставшихся фискализаций:'
  end
  object lblSessionNumber: TLabel
    Left = 16
    Top = 180
    Width = 190
    Height = 13
    Caption = 'Номер смены перед фискализацией:'
  end
  object lblDate: TLabel
    Left = 16
    Top = 204
    Width = 106
    Height = 13
    Caption = 'Дата фискализации:'
  end
  object lblLD: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Беларусь'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 72
    Top = 8
    Width = 393
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btnGetLongSerialNumberAndLongRNM: TButton
    Left = 16
    Top = 240
    Width = 193
    Height = 25
    Hint = 'GetLongSerialNumberAndLongRNM'
    Anchors = [akTop, akRight]
    Caption = 'Получить заводской номер и РНМ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnGetLongSerialNumberAndLongRNMClick
    OnMouseMove = btnGetLongSerialNumberAndLongRNMMouseMove
  end
  object btnSetLongSerialNumber: TButton
    Left = 16
    Top = 272
    Width = 193
    Height = 25
    Hint = 'SetLongSerialNumber'
    Anchors = [akTop, akRight]
    Caption = 'Установить заводской номер'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnSetLongSerialNumberClick
    OnMouseMove = btnSetLongSerialNumberMouseMove
  end
  object btnFiscalizationWithLongRNM: TButton
    Left = 216
    Top = 240
    Width = 193
    Height = 25
    Hint = 'FiscalizationWithLongRNM'
    Anchors = [akTop, akRight]
    Caption = 'Фискализировать с РНМ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnFiscalizationWithLongRNMClick
    OnMouseMove = btnFiscalizationWithLongRNMMouseMove
  end
  object edtDate: TEdit
    Left = 232
    Top = 200
    Width = 177
    Height = 21
    Hint = 'Date'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
  end
  object edtSessionNumber: TEdit
    Left = 232
    Top = 176
    Width = 177
    Height = 21
    Hint = 'SessionNumber'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
  end
  object edtFreeRegistration: TEdit
    Left = 232
    Top = 152
    Width = 177
    Height = 21
    Hint = 'FreeRegistration'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  object edtRegistrationNumber: TEdit
    Left = 232
    Top = 128
    Width = 177
    Height = 21
    Hint = 'RegistrationNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '1'
  end
  object edtINN: TEdit
    Left = 232
    Top = 104
    Width = 177
    Height = 21
    Hint = 'INN'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '0'
  end
  object edtNewPasswordTI: TEdit
    Left = 232
    Top = 80
    Width = 177
    Height = 21
    Hint = 'NewPasswordTI'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '0'
  end
  object edtRNM: TEdit
    Left = 232
    Top = 56
    Width = 177
    Height = 21
    Hint = 'RNM'
    MaxLength = 8
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtSerialNumber: TEdit
    Left = 232
    Top = 32
    Width = 177
    Height = 21
    Hint = 'SerialNumber'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object btnFiscParams: TButton
    Left = 216
    Top = 272
    Width = 193
    Height = 25
    Hint = 'GetFiscalizationParameters'
    Anchors = [akTop, akRight]
    Caption = 'Получить параметры фискализации'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnFiscParamsClick
    OnMouseMove = btnFiscParamsMouseMove
  end
end
