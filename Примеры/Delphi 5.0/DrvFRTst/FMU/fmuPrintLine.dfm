object fmPrintLine: TfmPrintLine
  Left = 291
  Top = 155
  Width = 489
  Height = 281
  Caption = 'Печать линии'
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
  object Bevel1: TBevel
    Left = 184
    Top = 8
    Width = 294
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblPrintLine: TLabel
    Left = 8
    Top = 8
    Width = 170
    Height = 13
    Caption = 'Печать произвольной линии'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLineData: TLabel
    Left = 16
    Top = 36
    Width = 69
    Height = 13
    Caption = 'Данные, Hex:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblLineNumber: TLabel
    Left = 16
    Top = 68
    Width = 110
    Height = 13
    Caption = 'Количество, 0..65535:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblBlackLine: TLabel
    Left = 8
    Top = 136
    Width = 127
    Height = 13
    Caption = 'Печать черной линии'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 144
    Top = 136
    Width = 334
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lblLineCount: TLabel
    Left = 16
    Top = 164
    Width = 95
    Height = 13
    Caption = 'Количество линий:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblByteCount: TLabel
    Left = 16
    Top = 196
    Width = 95
    Height = 13
    Caption = 'Длина линии, байт'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtLineData: TEdit
    Left = 144
    Top = 32
    Width = 330
    Height = 21
    Hint = 'LineData'
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
    Text = 'FF FF FF FF FF FF FF FF FF FF FF FF '
  end
  object edtLineNumber: TEdit
    Left = 144
    Top = 64
    Width = 330
    Height = 21
    Hint = 'LineNumber'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '20'
  end
  object btnPrintLine: TButton
    Left = 368
    Top = 96
    Width = 107
    Height = 25
    Hint = 'PrintLine'
    Anchors = [akTop, akRight]
    Caption = 'Печать линии'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnPrintLineClick
    OnMouseMove = btnPrintLineMouseMove
  end
  object edtLineCount: TEdit
    Left = 144
    Top = 160
    Width = 330
    Height = 21
    Hint = 'LineNumber'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '20'
  end
  object edtByteCount: TEdit
    Left = 144
    Top = 192
    Width = 330
    Height = 21
    Hint = 'Длина линии'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '20'
  end
  object btnBlackLine: TButton
    Left = 368
    Top = 224
    Width = 105
    Height = 25
    Hint = 'PrintLine'
    Anchors = [akTop, akRight]
    Caption = 'Печать линии'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnBlackLineClick
    OnMouseMove = btnBlackLineMouseMove
  end
end
