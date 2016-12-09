object fmEKLZRep2: TfmEKLZRep2
  Left = 534
  Top = 120
  Width = 480
  Height = 347
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Отчеты ЭКЛЗ (2)'
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
  object lblUDescription: TLabel
    Left = 8
    Top = 300
    Width = 48
    Height = 13
    Caption = 'Тип ККМ:'
  end
  object Label1: TLabel
    Left = 16
    Top = 152
    Width = 171
    Height = 13
    Caption = 'Запрос итога активизации ЭКЛЗ.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 112
    Top = 136
    Width = 357
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 8
    Top = 136
    Width = 95
    Height = 13
    Caption = 'Итог активации'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblStopEKLZDocumentPrinting: TLabel
    Left = 8
    Top = 216
    Width = 241
    Height = 13
    Caption = 'Возврат очередной строки снимаемого отчёта.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 8
    Top = 200
    Width = 461
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblKPKNumber: TLabel
    Left = 16
    Top = 108
    Width = 62
    Height = 13
    Caption = 'Номер КПК:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 107
    Height = 13
    Caption = 'Документ по КПК'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 120
    Top = 88
    Width = 349
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Отчеты по смене'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = 120
    Top = 8
    Width = 349
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblSessionNumber: TLabel
    Left = 16
    Top = 44
    Width = 74
    Height = 13
    Caption = 'Номер смены:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel5: TBevel
    Left = 8
    Top = 264
    Width = 461
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtUDescription: TEdit
    Left = 64
    Top = 296
    Width = 403
    Height = 21
    Hint = 'UDescription'
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
  end
  object btnGetEKLZActivizationResult: TButton
    Left = 239
    Top = 168
    Width = 226
    Height = 25
    Hint = 'GetEKLZActivizationResult'
    Anchors = [akTop, akRight]
    Caption = 'Запрос итога активизации'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnGetEKLZActivizationResultClick
    OnMouseMove = btnGetEKLZActivizationResultMouseMove
  end
  object edtKPKNumber: TEdit
    Left = 104
    Top = 104
    Width = 97
    Height = 21
    Hint = 'KPKNumber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '0'
  end
  object btnGetEKLZDocument: TButton
    Left = 240
    Top = 104
    Width = 225
    Height = 25
    Hint = 'GetEKLZDocument'
    Anchors = [akTop, akRight]
    Caption = 'Прочитать документ по номеру КПК'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnGetEKLZDocumentClick
    OnMouseMove = btnGetEKLZDocumentMouseMove
  end
  object edtSessionNumber: TEdit
    Left = 104
    Top = 40
    Width = 97
    Height = 21
    Hint = 'SessionNumber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '1'
  end
  object btnGetEKLZJournal: TButton
    Left = 240
    Top = 24
    Width = 225
    Height = 25
    Hint = 'GetEKLZJournal'
    Anchors = [akTop, akRight]
    Caption = 'Запрос контрольной ленты'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnGetEKLZJournalClick
    OnMouseMove = btnGetEKLZSessionMouseMove
  end
  object btnGetEKLZSessionTotal: TButton
    Left = 240
    Top = 56
    Width = 225
    Height = 25
    Hint = 'GetEKLZSessionTotal'
    Anchors = [akTop, akRight]
    Caption = 'Запрос итогов смены по номеру смены'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGetEKLZSessionTotalClick
    OnMouseMove = btnGetEKLZSessionMouseMove
  end
  object btnGetEKLZData: TBitBtn
    Left = 240
    Top = 232
    Width = 193
    Height = 25
    Hint = 'GetEKLZData'
    Anchors = [akTop, akRight]
    Caption = 'Запрос данных'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnGetEKLZDataClick
    NumGlyphs = 2
    Spacing = 10
  end
  object btnShowData: TBitBtn
    Left = 440
    Top = 232
    Width = 25
    Height = 25
    Hint = 'Просмотр'
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnShowDataClick
    NumGlyphs = 2
  end
end
