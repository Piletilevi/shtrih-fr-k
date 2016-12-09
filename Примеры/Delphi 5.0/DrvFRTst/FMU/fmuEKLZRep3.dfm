object fmEKLZRep3: TfmEKLZRep3
  Left = 292
  Top = 213
  Width = 465
  Height = 288
  Caption = 'Печать отчетов ЭКЛЗ'
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
  object lblDepartment: TLabel
    Left = 256
    Top = 52
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
  object lblStartDate: TLabel
    Left = 24
    Top = 108
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
    Left = 24
    Top = 132
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
    Left = 24
    Top = 152
    Width = 409
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblFirstSessionNumber: TLabel
    Left = 24
    Top = 196
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
    Left = 24
    Top = 220
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 246
    Height = 13
    Caption = 'Печать отчетов в диапазонах дат и смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 264
    Top = 8
    Width = 190
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object rgReportType: TRadioGroup
    Left = 24
    Top = 36
    Width = 209
    Height = 45
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtDepartment: TEdit
    Left = 304
    Top = 48
    Width = 81
    Height = 21
    Hint = 'Department'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '0'
  end
  object udDepartment: TUpDown
    Left = 385
    Top = 48
    Width = 15
    Height = 21
    Associate = edtDepartment
    Min = 0
    Max = 16
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object dtpStartDate: TDateTimePicker
    Left = 120
    Top = 104
    Width = 97
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dtpEndDate: TDateTimePicker
    Left = 120
    Top = 128
    Width = 97
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object btnEKLZDepartmentReportInDatesRange: TButton
    Left = 232
    Top = 96
    Width = 201
    Height = 25
    Hint = 'EKLZDepartmentReportInDatesRange'
    Anchors = [akTop, akRight]
    Caption = 'Отчет по отделам в диапазоне дат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnEKLZDepartmentReportInDatesRangeClick
    OnMouseMove = btnEKLZDepartmentReportInDatesRangeMouseMove
  end
  object btnEKLZSessionReportInDatesRange: TButton
    Left = 232
    Top = 128
    Width = 201
    Height = 25
    Hint = 'EKLZSessionReportInDatesRange'
    Anchors = [akTop, akRight]
    Caption = 'Отчет по сменам в диапазоне дат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnEKLZSessionReportInDatesRangeClick
    OnMouseMove = btnEKLZSessionReportInDatesRangeMouseMove
  end
  object edtFirstSessionNumber: TEdit
    Left = 120
    Top = 192
    Width = 97
    Height = 21
    Hint = 'FirstSessionNumber'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = '1'
  end
  object edtLastSessionNumber: TEdit
    Left = 120
    Top = 216
    Width = 97
    Height = 21
    Hint = 'LastSessionNumber'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '1'
  end
  object btnEKLZDepartmentReportInSessionsRange: TButton
    Left = 232
    Top = 184
    Width = 201
    Height = 25
    Hint = 'EKLZDepartmentReportInSessionsRange'
    Anchors = [akTop, akRight]
    Caption = 'Отчет по отделам в диапазоне смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnEKLZDepartmentReportInSessionsRangeClick
    OnMouseMove = btnEKLZDepartmentReportInSessionsRangeMouseMove
  end
  object btnEKLZSessionReportInSessionsRange: TButton
    Left = 232
    Top = 216
    Width = 201
    Height = 25
    Hint = 'EKLZSessionReportInSessionsRange'
    Anchors = [akTop, akRight]
    Caption = 'Отчет по сменам в диапазоне смен'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnEKLZSessionReportInSessionsRangeClick
    OnMouseMove = btnEKLZSessionReportInSessionsRangeMouseMove
  end
end
