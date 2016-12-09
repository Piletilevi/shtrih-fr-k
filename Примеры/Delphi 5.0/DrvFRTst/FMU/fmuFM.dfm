object fmFM: TfmFM
  Left = 272
  Top = 148
  Width = 463
  Height = 339
  Caption = 'ФП'
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
  object lblSumm1: TLabel
    Left = 200
    Top = 34
    Width = 49
    Height = 13
    Caption = 'Продажа:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSumm3: TLabel
    Left = 200
    Top = 58
    Width = 46
    Height = 13
    Caption = 'Покупка:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSumm2: TLabel
    Left = 200
    Top = 82
    Width = 86
    Height = 13
    Caption = 'Возврат продаж:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSumm4: TLabel
    Left = 200
    Top = 108
    Width = 89
    Height = 13
    Caption = 'Возврат покупок:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 129
    Height = 13
    Caption = 'Сумма записей в ФП'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 160
    Top = 8
    Width = 292
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 176
    Width = 148
    Height = 13
    Caption = 'Последняя запись в ФП'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 176
    Top = 176
    Width = 276
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblFMType: TLabel
    Left = 24
    Top = 204
    Width = 22
    Height = 13
    Caption = 'Тип:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblFMDate: TLabel
    Left = 24
    Top = 226
    Width = 29
    Height = 13
    Caption = 'Дата:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 16
    Top = 256
    Width = 436
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btnInitFM: TButton
    Left = 200
    Top = 280
    Width = 185
    Height = 25
    Hint = 'InitFM'
    Caption = 'Инициализировать ФП'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnInitFMClick
  end
  object rgFMType: TRadioGroup
    Left = 24
    Top = 32
    Width = 161
    Height = 57
    Hint = 'TypeOfSumOfEntriesFM'
    Caption = 'Тип'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'все записи'
      'после посл. фискал.')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtSumm1: TEdit
    Left = 296
    Top = 32
    Width = 81
    Height = 21
    Hint = 'Summ1'
    TabStop = False
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
    Left = 296
    Top = 56
    Width = 81
    Height = 21
    Hint = 'Summ2'
    TabStop = False
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
    Left = 296
    Top = 80
    Width = 81
    Height = 21
    Hint = 'Summ3'
    TabStop = False
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
    Left = 296
    Top = 106
    Width = 81
    Height = 21
    Hint = 'Summ4'
    TabStop = False
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
  object edtFMType: TEdit
    Left = 64
    Top = 200
    Width = 89
    Height = 21
    Hint = 'TypeOfLastEntryFM'
    TabStop = False
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
    TabOrder = 6
  end
  object edtFMDate: TEdit
    Left = 64
    Top = 224
    Width = 89
    Height = 21
    Hint = 'Date'
    TabStop = False
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
    TabOrder = 7
  end
  object btnGetFMRecordsSum: TBitBtn
    Left = 200
    Top = 144
    Width = 185
    Height = 25
    Hint = 'GetFMRecordsSum'
    Caption = 'Получить сумму записей ФП'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnGetFMRecordsSumClick
    OnMouseMove = btnGetFMRecordsSumMouseMove
    NumGlyphs = 2
  end
  object btnGetLastFMRecordDate: TBitBtn
    Left = 200
    Top = 224
    Width = 185
    Height = 25
    Hint = 'GetLastFMRecordDate'
    Caption = 'Дата последней записи в ФП'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnGetLastFMRecordDateClick
    OnMouseMove = btnGetLastFMRecordDateMouseMove
    NumGlyphs = 2
  end
end
