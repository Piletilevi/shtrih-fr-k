object fmDocCl: TfmDocCl
  Left = 352
  Top = 209
  Width = 471
  Height = 296
  Caption = 'Очистка строки буфера ПД'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblStringNumber: TLabel
    Left = 16
    Top = 68
    Width = 75
    Height = 13
    Caption = 'Номер строки:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 165
    Height = 13
    Caption = 'Очистка строки буфера ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 184
    Top = 8
    Width = 276
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 445
    Height = 13
    Caption = 
      'Очистка строки в области нефискальной информации буфера подкладн' +
      'ого документа.'
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
