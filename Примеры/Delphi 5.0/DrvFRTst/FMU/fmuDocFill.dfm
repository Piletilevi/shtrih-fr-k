object fmDocFill: TfmDocFill
  Left = 405
  Top = 266
  Width = 408
  Height = 240
  Caption = 'Заполнение буфера ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringforPrinting: TMemo
    Left = 0
    Top = 113
    Width = 400
    Height = 100
    Hint = 'StringforPrinting'
    Align = alClient
    MaxLength = 247
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblStringNumber: TLabel
      Left = 16
      Top = 68
      Width = 75
      Height = 13
      Caption = 'Номер строки:'
    end
    object lblStringforPrinting: TLabel
      Left = 16
      Top = 96
      Width = 39
      Height = 13
      Caption = 'Строка:'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 142
      Height = 13
      Caption = 'Заполнение буфера ПД'
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
      Width = 237
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 379
      Height = 13
      Caption = 
        'Заполнение буфера подкладного документа нефискальной информацией' +
        '.'
    end
    object edtStringNumber: TEdit
      Left = 104
      Top = 64
      Width = 65
      Height = 21
      Hint = 'StringNumber'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '1'
    end
    object udStringNumber: TUpDown
      Left = 169
      Top = 64
      Width = 15
      Height = 21
      Associate = edtStringNumber
      Min = 1
      Max = 32767
      Position = 1
      TabOrder = 1
      Wrap = False
    end
  end
end
