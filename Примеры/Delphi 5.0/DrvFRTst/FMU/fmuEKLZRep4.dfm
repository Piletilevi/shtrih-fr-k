object fmEKLZRep4: TfmEKLZRep4
  Left = 300
  Top = 158
  Width = 451
  Height = 275
  Caption = 'Печать отчетов ЭКЛЗ (2)'
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
  object lblStopEKLZDocumentPrinting: TLabel
    Left = 16
    Top = 192
    Width = 349
    Height = 13
    Caption = 'Прерывание печати документа ЭКЛЗ (кроме сокращенных отчетов).'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 176
    Width = 110
    Height = 13
    Caption = 'Печать документа'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 128
    Top = 176
    Width = 312
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 8
    Top = 96
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
  object Bevel2: TBevel
    Left = 128
    Top = 96
    Width = 312
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblKPKNumber: TLabel
    Left = 32
    Top = 126
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
  object lblSessionNumber: TLabel
    Left = 24
    Top = 54
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
  object Label3: TLabel
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
  object Bevel3: TBevel
    Left = 120
    Top = 8
    Width = 320
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtKPKNumber: TEdit
    Left = 112
    Top = 122
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
  object btnReadEKLZDocumentOnKPK: TButton
    Left = 216
    Top = 120
    Width = 201
    Height = 25
    Hint = 'ReadEKLZDocumentOnKPK'
    Anchors = [akTop, akRight]
    Caption = 'Документ по номеру КПК'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnReadEKLZDocumentOnKPKClick
    OnMouseMove = btnReadEKLZDocumentOnKPKMouseMove
  end
  object btnReadEKLZSessionTotal: TButton
    Left = 216
    Top = 32
    Width = 201
    Height = 25
    Hint = 'ReadEKLZSessionTotal'
    Anchors = [akTop, akRight]
    Caption = 'Итог смены по смене'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnReadEKLZSessionTotalClick
    OnMouseMove = btnEKLZSessionMouseMove
  end
  object btnEKLZJournalOnSessionNumber: TButton
    Left = 216
    Top = 64
    Width = 201
    Height = 25
    Hint = 'EKLZJournalOnSessionNumber'
    Anchors = [akTop, akRight]
    Caption = 'Контрольная лента по смене'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnEKLZJournalOnSessionNumberClick
    OnMouseMove = btnEKLZSessionMouseMove
  end
  object edtSessionNumber: TEdit
    Left = 112
    Top = 50
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
  object btnStopEKLZDocumentPrinting: TBitBtn
    Left = 216
    Top = 216
    Width = 201
    Height = 25
    Hint = 'StopEKLZDocumentPrinting'
    Anchors = [akTop, akRight]
    Caption = 'Прервать печать документа'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnStopEKLZDocumentPrintingClick
    NumGlyphs = 2
  end
end
