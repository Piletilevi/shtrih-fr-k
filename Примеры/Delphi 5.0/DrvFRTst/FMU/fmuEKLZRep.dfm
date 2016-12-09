object fmEKLZRep: TfmEKLZRep
  Left = 360
  Top = 316
  Width = 558
  Height = 354
  Caption = 'Отчеты ЭКЛЗ'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblStartDate: TLabel
    Left = 16
    Top = 92
    Width = 84
    Height = 13
    Caption = 'Начальная дата:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblEndDate: TLabel
    Left = 16
    Top = 116
    Width = 77
    Height = 13
    Caption = 'Конечная дата:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 136
    Width = 529
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblFirstSessionNumber: TLabel
    Left = 16
    Top = 172
    Width = 93
    Height = 13
    Caption = 'Начальная смена:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblLastSessionNumber: TLabel
    Left = 16
    Top = 196
    Width = 86
    Height = 13
    Caption = 'Конечная смена:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 16
    Top = 224
    Width = 529
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblStopEKLZDocumentPrinting: TLabel
    Left = 16
    Top = 238
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
  object lblUDescription: TLabel
    Left = 16
    Top = 300
    Width = 48
    Height = 13
    Caption = 'Тип ККМ:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblDepartment: TLabel
    Left = 256
    Top = 44
    Width = 34
    Height = 13
    Caption = 'Отдел:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 197
    Height = 13
    Caption = 'Отчеты в диапазонах дат и смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 216
    Top = 8
    Width = 331
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Bevel4: TBevel
    Left = 16
    Top = 280
    Width = 529
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object rgReportType: TRadioGroup
    Left = 16
    Top = 27
    Width = 185
    Height = 46
    Hint = 'ReportType'
    Caption = 'Тип отчета'
    Columns = 2
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'короткий'
      'полный')
    ParentFont = False
    TabOrder = 0
  end
  object edtDepartment: TEdit
    Left = 296
    Top = 40
    Width = 81
    Height = 21
    Hint = 'Department'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
  end
  object udDepartment: TUpDown
    Left = 377
    Top = 40
    Width = 16
    Height = 21
    Min = 0
    Max = 16
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object dtpFirstSessionDate: TDateTimePicker
    Left = 112
    Top = 88
    Width = 89
    Height = 21
    Hint = 'FirstSessionDate'
    CalAlignment = dtaLeft
    Date = 37963.7946821181
    Time = 37963.7946821181
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 3
  end
  object dtpLastSessionDate: TDateTimePicker
    Left = 112
    Top = 112
    Width = 89
    Height = 21
    Hint = 'LastSessionDate'
    CalAlignment = dtaLeft
    Date = 37963.7946821181
    Time = 37963.7946821181
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 4
  end
  object btnGetEKLZDepartmentReportInDatesRange: TButton
    Left = 304
    Top = 80
    Width = 241
    Height = 25
    Hint = 'GetEKLZDepartmentReportInDatesRange'
    Anchors = [akTop, akRight]
    Caption = 'Запрос отчета по отделам в диапазоне дат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnGetEKLZDepartmentReportInDatesRangeClick
    OnMouseMove = btnGetEKLZDepartmentReportInDatesRangeMouseMove
  end
  object btnGetEKLZSessionReportInDatesRange: TButton
    Left = 304
    Top = 112
    Width = 241
    Height = 25
    Hint = 'GetEKLZSessionReportInDatesRange'
    Anchors = [akTop, akRight]
    Caption = 'Запрос отчета по сменам в диапазоне дат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnGetEKLZSessionReportInDatesRangeClick
    OnMouseMove = btnGetEKLZSessionReportInDatesRangeMouseMove
  end
  object edtFirstSessionNumber: TEdit
    Left = 112
    Top = 168
    Width = 89
    Height = 21
    Hint = 'FirstSessionNumber'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 7
    Text = '1'
  end
  object edtLastSessionNumber: TEdit
    Left = 112
    Top = 192
    Width = 89
    Height = 21
    Hint = 'LastSessionNumber'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 8
    Text = '1'
  end
  object btnGetEKLZDepartmentReportInSessionsRange: TButton
    Left = 304
    Top = 160
    Width = 241
    Height = 25
    Hint = 'GetEKLZDepartmentReportInSessionsRange'
    Anchors = [akTop, akRight]
    Caption = 'Запрос отчета по отделам в диапазоне смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnGetEKLZDepartmentReportInSessionsRangeClick
    OnMouseMove = btnGetEKLZDepartmentReportInSessionsRangeMouseMove
  end
  object btnGetEKLZSessionReportInSessionsRange: TButton
    Left = 304
    Top = 192
    Width = 241
    Height = 25
    Hint = 'GetEKLZSessionReportInSessionsRange'
    Anchors = [akTop, akRight]
    Caption = 'Запрос отчета по сменам в диапазоне смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnGetEKLZSessionReportInSessionsRangeClick
    OnMouseMove = btnGetEKLZSessionReportInSessionsRangeMouseMove
  end
  object btnShowData: TBitBtn
    Left = 520
    Top = 256
    Width = 25
    Height = 25
    Hint = 'Просмотр'
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnShowDataClick
    NumGlyphs = 2
  end
  object btnGetEKLZData: TBitBtn
    Left = 304
    Top = 256
    Width = 209
    Height = 25
    Hint = 'GetEKLZData'
    Anchors = [akTop, akRight]
    Caption = 'Запрос данных'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnGetEKLZDataClick
    NumGlyphs = 2
    Spacing = 10
  end
  object edtUDescription: TEdit
    Left = 120
    Top = 296
    Width = 425
    Height = 21
    Hint = 'UDescription'
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
  end
end
