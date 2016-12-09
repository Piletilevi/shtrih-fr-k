object fmDocReprint: TfmDocReprint
  Left = 301
  Top = 202
  Width = 393
  Height = 207
  Hint = ']'
  Caption = 'Допечать ПД'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblReprint: TLabel
    Left = 16
    Top = 32
    Width = 366
    Height = 13
    Caption = 
      'Перепечатать ПД в случае останова печати после нештатной ситуаци' +
      'и.'
  end
  object Bevel1: TBevel
    Left = 96
    Top = 8
    Width = 286
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblReprint2: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Допечать ПД'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
