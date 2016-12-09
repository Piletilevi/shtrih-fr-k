object fmRep: TfmRep
  Left = 328
  Top = 208
  Width = 480
  Height = 345
  Caption = 'Отчеты'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrintDepartmentReport: TButton
    Left = 8
    Top = 48
    Width = 177
    Height = 25
    Hint = 'PrintDepartmentReport'
    Anchors = [akTop, akRight]
    Caption = 'Снять отчёт по отделам'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnPrintDepartmentReportClick
  end
  object btnPrintReportWithCleaning: TButton
    Left = 8
    Top = 80
    Width = 177
    Height = 25
    Hint = 'PrintReportWithCleaning'
    Anchors = [akTop, akRight]
    Caption = 'Снять отчёт с гашением'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnPrintReportWithCleaningClick
  end
  object btnPrintTaxReport: TButton
    Left = 8
    Top = 112
    Width = 177
    Height = 25
    Hint = 'PrintTaxReport'
    Anchors = [akTop, akRight]
    Caption = 'Снять отчет по налогам'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnPrintTaxReportClick
  end
  object btnPrintOperationReg: TButton
    Left = 8
    Top = 144
    Width = 177
    Height = 25
    Hint = 'PrintOperationReg'
    Anchors = [akTop, akRight]
    Caption = 'Печать операционных регистров'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnPrintOperationRegClick
  end
  object btnPrintReportWithoutCleaning: TButton
    Left = 8
    Top = 176
    Width = 177
    Height = 25
    Hint = 'PrintReportWithoutCleaning'
    Anchors = [akTop, akRight]
    Caption = 'Снять отчёт без гашения'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnPrintReportWithoutCleaningClick
  end
  object btnOpenSession: TButton
    Left = 8
    Top = 16
    Width = 177
    Height = 25
    Hint = 'OpenSession'
    Anchors = [akTop, akRight]
    Caption = 'Открыть смену'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnOpenSessionClick
  end
  object btnPrintZReportInBuffer: TButton
    Left = 192
    Top = 16
    Width = 233
    Height = 25
    Hint = 'PrintZReportInBuffer'
    Anchors = [akTop, akRight]
    Caption = 'Снять отчёт с гашением в буфер'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnPrintZReportInBufferClick
  end
  object btnPrintZReportFromBuffer: TButton
    Left = 192
    Top = 48
    Width = 233
    Height = 25
    Hint = 'PrintZReportFromBuffer'
    Anchors = [akTop, akRight]
    Caption = 'Распечатать отчёт с гашением из буфера'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnPrintZReportFromBufferClick
  end
end
