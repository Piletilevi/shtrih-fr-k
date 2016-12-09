object fmEKLZ3: TfmEKLZ3
  Left = 232
  Top = 131
  Width = 479
  Height = 354
  Caption = 'Операции с ЭКЛЗ'
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
  object Bevel2: TBevel
    Left = 96
    Top = 0
    Width = 372
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Активизация'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblActivization: TLabel
    Left = 16
    Top = 24
    Width = 407
    Height = 26
    Caption = 
      'Активизация ЭКЛЗ . Результат проведения активизации может быть з' +
      'апрошен'#13#10'командой печати итога активизации ЭКЛЗ.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 232
    Width = 83
    Height = 13
    Caption = 'Прекращение'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 104
    Top = 224
    Width = 364
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 248
    Width = 409
    Height = 39
    Caption = 
      'Отмена всех команд, принятых ЭКЛЗ в процессе оформления  незавер' +
      'шенных '#13#10'документов продажи, покупки, возврата продажи, возврата' +
      ' покупки, либо '#13#10'досрочно прекращается запрошенный до этого отче' +
      'т от ЭКЛЗ.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblArchive: TLabel
    Left = 16
    Top = 112
    Width = 442
    Height = 39
    Caption = 
      'Инициализация и закрытие архива. Закрытие архива – процедура, за' +
      'вершающая'#13#10'функционирование ЭКЛЗ в составе ККМ во всех режимах, ' +
      'кроме чтения информации.'#13#10'Для тестирования целостности архива  с' +
      'лужит соответствующая команда.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblTestNumber: TLabel
    Left = 312
    Top = 166
    Width = 68
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Номер теста:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 96
    Width = 36
    Height = 13
    Caption = 'Архив'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = 56
    Top = 88
    Width = 412
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btnEKLZActivization: TButton
    Left = 248
    Top = 56
    Width = 105
    Height = 25
    Hint = 'EKLZActivization'
    Anchors = [akTop, akRight]
    Caption = 'Активизация'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnEKLZActivizationClick
  end
  object btnEKLZActivizationResult: TButton
    Left = 360
    Top = 56
    Width = 105
    Height = 25
    Hint = 'EKLZActivizationResult'
    Anchors = [akTop, akRight]
    Caption = 'Итог активизации'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnEKLZActivizationResultClick
  end
  object btnInitEKLZArchive: TButton
    Left = 16
    Top = 192
    Width = 137
    Height = 25
    Hint = 'InitEKLZArchive'
    Anchors = [akTop, akRight]
    Caption = 'Инициализация архива'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnInitEKLZArchiveClick
  end
  object btnCloseEKLZArchive: TButton
    Left = 160
    Top = 192
    Width = 137
    Height = 25
    Hint = 'CloseEKLZArchive'
    Anchors = [akTop, akRight]
    Caption = 'Закрытие архива'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnCloseEKLZArchiveClick
  end
  object btnTestEKLZArchiveIntegrity: TButton
    Left = 304
    Top = 192
    Width = 161
    Height = 25
    Hint = 'TestEKLZArchiveIntegrity'
    Anchors = [akTop, akRight]
    Caption = 'Тест целостности архива'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnTestEKLZArchiveIntegrityClick
    OnMouseMove = btnTestEKLZArchiveIntegrityMouseMove
  end
  object edtTestNumber: TEdit
    Left = 392
    Top = 162
    Width = 73
    Height = 21
    Hint = 'TestNumber'
    Anchors = [akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '1'
  end
  object btnEKLZInterrupt: TBitBtn
    Left = 304
    Top = 296
    Width = 161
    Height = 25
    Hint = 'EKLZInterrupt'
    Anchors = [akTop, akRight]
    Caption = 'Прекращение'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnEKLZInterruptClick
    NumGlyphs = 2
  end
end
