object fmNI: TfmNI
  Left = 235
  Top = 130
  Width = 479
  Height = 329
  Caption = 'НИ'
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
  object lblLD: TLabel
    Left = 8
    Top = 8
    Width = 133
    Height = 13
    Caption = 'Налоговый инспектор'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 152
    Top = 8
    Width = 316
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblLastSessionNumber: TLabel
    Left = 8
    Top = 178
    Width = 86
    Height = 13
    Caption = 'Конечная смена:'
  end
  object lblFirstSessionNumber: TLabel
    Left = 8
    Top = 154
    Width = 93
    Height = 13
    Caption = 'Начальная смена:'
  end
  object lblLastSessionDate: TLabel
    Left = 8
    Top = 128
    Width = 77
    Height = 13
    Caption = 'Конечная дата:'
  end
  object lblFirstSessionDate: TLabel
    Left = 8
    Top = 106
    Width = 84
    Height = 13
    Caption = 'Начальная дата:'
  end
  object lblDate: TLabel
    Left = 8
    Top = 200
    Width = 103
    Height = 13
    Caption = 'Дата фискализации'
  end
  object lblSessionNumber: TLabel
    Left = 8
    Top = 272
    Width = 190
    Height = 13
    Caption = 'Номер смены перед фискализацией:'
  end
  object lblFreeRegistration: TLabel
    Left = 8
    Top = 250
    Width = 202
    Height = 13
    Caption = 'Количество оставшихся фискализаций:'
  end
  object lblRegistrationNumber: TLabel
    Left = 8
    Top = 226
    Width = 114
    Height = 13
    Caption = 'Номер фискализации:'
  end
  object lblINN: TLabel
    Left = 8
    Top = 82
    Width = 27
    Height = 13
    Caption = 'ИНН:'
  end
  object lblRNM: TLabel
    Left = 8
    Top = 58
    Width = 27
    Height = 13
    Caption = 'РНМ:'
  end
  object lblNewPasswordTI: TLabel
    Left = 8
    Top = 34
    Width = 95
    Height = 13
    Caption = 'Новый пароль НИ:'
  end
  object btnFiscalization: TButton
    Left = 296
    Top = 112
    Width = 169
    Height = 25
    Hint = 'Fiscalization'
    Caption = 'Фискализация'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnFiscalizationClick
    OnMouseMove = btnFiscalizationMouseMove
  end
  object btnGetFiscalizationParameters: TButton
    Left = 296
    Top = 144
    Width = 169
    Height = 25
    Hint = 'GetFiscalizationParameters'
    Caption = 'Параметры фискализации'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnGetFiscalizationParametersClick
    OnMouseMove = btnGetFiscalizationParametersMouseMove
  end
  object btnGetRangeDatesAndSessions: TButton
    Left = 296
    Top = 176
    Width = 169
    Height = 25
    Hint = 'GetRangeDatesAndSessions'
    Caption = 'Получить диапазон дат и смен'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnGetRangeDatesAndSessionsClick
    OnMouseMove = btnGetRangeDatesAndSessionsMouseMove
  end
  object btnFiscalReportforDatesRange: TButton
    Left = 296
    Top = 208
    Width = 169
    Height = 25
    Hint = 'FiscalReportforDatesRange'
    Caption = 'Отчёт по диапазону дат'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = btnFiscalReportforDatesRangeClick
    OnMouseMove = btnFiscalReportforDatesRangeMouseMove
  end
  object btnFiscalReportforSessionRange: TButton
    Left = 296
    Top = 240
    Width = 169
    Height = 25
    Hint = 'FiscalReportforSessionRange'
    Caption = 'Отчёт по диапазону смен'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = btnFiscalReportforSessionRangeClick
    OnMouseMove = btnFiscalReportforSessionRangeMouseMove
  end
  object btnInterruptFullReport: TButton
    Left = 296
    Top = 272
    Width = 169
    Height = 25
    Hint = 'InterruptFullReport'
    Caption = 'Прервать полный отчёт'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = btnInterruptFullReportClick
  end
  object rgReportType: TRadioGroup
    Left = 328
    Top = 24
    Width = 105
    Height = 65
    Hint = 'ReportType'
    Caption = 'Тип отчета'
    ItemIndex = 0
    Items.Strings = (
      'короткий'
      'длинный')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object edtNewPasswordTI: TEdit
    Left = 128
    Top = 32
    Width = 161
    Height = 21
    Hint = 'NewPasswordTI'
    MaxLength = 8
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0'
  end
  object edtRNM: TEdit
    Left = 128
    Top = 56
    Width = 161
    Height = 21
    Hint = 'RNM'
    MaxLength = 12
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '0'
  end
  object edtINN: TEdit
    Left = 128
    Top = 80
    Width = 161
    Height = 21
    Hint = 'INN'
    MaxLength = 12
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '0'
  end
  object edtRegistrationNumber: TEdit
    Left = 128
    Top = 224
    Width = 161
    Height = 21
    Hint = 'RegistrationNumber'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '1'
  end
  object edtFreeRegistration: TEdit
    Left = 216
    Top = 248
    Width = 73
    Height = 21
    Hint = 'FreeRegistration'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
  end
  object edtSessionNumber: TEdit
    Left = 216
    Top = 272
    Width = 73
    Height = 21
    Hint = 'SessionNumber'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
  end
  object edtDate: TEdit
    Left = 128
    Top = 200
    Width = 161
    Height = 21
    Hint = 'Date'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
  end
  object dtpFirstSessionDate: TDateTimePicker
    Left = 128
    Top = 104
    Width = 161
    Height = 21
    Hint = 'FirstSessionDate'
    CalAlignment = dtaLeft
    Date = 37963.8656132292
    Time = 37963.8656132292
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dtpLastSessionDate: TDateTimePicker
    Left = 128
    Top = 128
    Width = 161
    Height = 21
    Hint = 'LastSessionDate'
    CalAlignment = dtaLeft
    Date = 37963.8656132292
    Time = 37963.8656132292
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object edtFirstSessionNumber: TEdit
    Left = 128
    Top = 152
    Width = 161
    Height = 21
    Hint = 'FirstSessionNumber'
    MaxLength = 5
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = '1'
  end
  object edtLastSessionNumber: TEdit
    Left = 128
    Top = 176
    Width = 161
    Height = 21
    Hint = 'LastSessionNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = '1'
  end
end
