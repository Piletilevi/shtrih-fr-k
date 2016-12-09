object fmEKLZ2: TfmEKLZ2
  Left = 319
  Top = 121
  Width = 529
  Height = 347
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Состояние ЭКЛЗ'
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
  object lblResultCode: TLabel
    Left = 16
    Top = 264
    Width = 216
    Height = 13
    Caption = 'Команда позволяет вернуть ошибку ЭКЛЗ'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblEKLZResultCode: TLabel
    Left = 16
    Top = 294
    Width = 63
    Height = 13
    Caption = 'Код ошибки:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 248
    Width = 71
    Height = 13
    Caption = 'Код ошибки'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 88
    Top = 248
    Width = 429
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object gbStatus: TGroupBox
    Left = 8
    Top = 8
    Width = 509
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Состояние ЭКЛЗ'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Memo: TMemo
      Left = 8
      Top = 16
      Width = 361
      Height = 201
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object btnGetEKLZSerialNumber: TButton
      Left = 376
      Top = 112
      Width = 126
      Height = 25
      Hint = 'GetEKLZSerialNumber'
      Anchors = [akTop, akRight]
      Caption = 'Заводской номер'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnGetEKLZSerialNumberClick
    end
    object btnGetEKLZVersion: TButton
      Left = 376
      Top = 80
      Width = 126
      Height = 25
      Hint = 'GetEKLZVersion'
      Anchors = [akTop, akRight]
      Caption = 'Версия'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnGetEKLZVersionClick
    end
    object btnGetEKLZCode2Status: TButton
      Left = 376
      Top = 48
      Width = 126
      Height = 25
      Hint = 'GetEKLZCode2Report'
      Anchors = [akTop, akRight]
      Caption = 'Состояние по коду 2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnGetEKLZCode2StatusClick
    end
    object btnGetEKLZCode1Status: TButton
      Left = 376
      Top = 16
      Width = 126
      Height = 25
      Hint = 'GetEKLZCode1Report'
      Anchors = [akTop, akRight]
      Caption = 'Состояние по коду 1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnGetEKLZCode1StatusClick
    end
  end
  object edtEKLZResultCode: TEdit
    Left = 88
    Top = 290
    Width = 97
    Height = 21
    Hint = 'EKLZResultCode'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '0'
  end
  object btnSetEKLZResultCode: TButton
    Left = 376
    Top = 288
    Width = 137
    Height = 25
    Hint = 'SetEKLZResultCode'
    Anchors = [akTop, akRight]
    Caption = 'Установить код ошибки'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnSetEKLZResultCodeClick
    OnMouseMove = btnSetEKLZResultCodeMouseMove
  end
end
