object fmPrintBarcode: TfmPrintBarcode
  Left = 187
  Top = 121
  Width = 490
  Height = 282
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Печать штрих-кода'
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
  object lblData: TLabel
    Left = 8
    Top = 44
    Width = 104
    Height = 13
    Caption = 'Данные штрих-кода:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblBarWidth: TLabel
    Left = 8
    Top = 84
    Width = 115
    Height = 13
    Caption = 'Ширина штриха, точек:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblPrintBarcode: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 13
    Caption = 'Печать штрих-кода'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 136
    Top = 8
    Width = 343
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtBarcode: TEdit
    Left = 136
    Top = 40
    Width = 313
    Height = 21
    Hint = 'Barcode'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '12345678901234567890'
  end
  object edtBarWidth: TEdit
    Left = 136
    Top = 80
    Width = 65
    Height = 21
    Hint = 'BarWidth'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '2'
  end
  object udBarWidth: TUpDown
    Left = 201
    Top = 80
    Width = 15
    Height = 21
    Associate = edtBarWidth
    Min = 1
    Position = 2
    TabOrder = 2
    Wrap = False
  end
  object chbCutPaper: TCheckBox
    Left = 8
    Top = 112
    Width = 209
    Height = 17
    Hint = 'Выполнять отрезку'
    Caption = 'Выполнять отрезку'
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 3
  end
  object chbPrintMaxWidth: TCheckBox
    Left = 8
    Top = 136
    Width = 209
    Height = 17
    Hint = 'Печатать максимальную ширину'
    Caption = 'Печатать максимальную ширину'
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 4
  end
  object rgBarcodeType: TRadioGroup
    Left = 8
    Top = 160
    Width = 193
    Height = 89
    Hint = 'BarcodeTypes'
    Caption = 'Тип кода'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      'Code 128A'
      'Code 128B'
      'Code 128C')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object rgBarcodeAlignment: TRadioGroup
    Left = 216
    Top = 160
    Width = 193
    Height = 89
    Hint = 'BarcodeAlignments'
    Caption = 'Выравнивание'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      'По центру'
      'Влево'
      'Вправо')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object btnPrintBarcodeLine: TButton
    Left = 264
    Top = 80
    Width = 186
    Height = 25
    Hint = 'PrintBarcodeLine'
    Anchors = [akTop, akRight]
    Caption = 'Печать штрих-кода линией'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnPrintBarcodeLineClick
    OnMouseMove = btnPrintBarcodeMouseMove
  end
  object btnPrintBarcodeGraph: TButton
    Left = 264
    Top = 112
    Width = 186
    Height = 25
    Hint = 'PrintBarcodeGraph'
    Anchors = [akTop, akRight]
    Caption = 'Печать штрих-кода графикой'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnPrintBarcodeGraphClick
    OnMouseMove = btnPrintBarcodeMouseMove
  end
end
