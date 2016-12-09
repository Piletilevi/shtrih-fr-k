object fmGraph: TfmGraph
  Left = 344
  Top = 176
  Width = 489
  Height = 345
  Caption = 'Графика'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblFirstLineNumber: TLabel
    Left = 16
    Top = 34
    Width = 114
    Height = 13
    Caption = 'Номер первой строки:'
  end
  object lblLastLineNumber: TLabel
    Left = 16
    Top = 60
    Width = 132
    Height = 13
    Caption = 'Номер последней строки:'
  end
  object lblBarcode: TLabel
    Left = 16
    Top = 84
    Width = 55
    Height = 13
    Caption = 'Штрих-код:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Графика'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 72
    Top = 8
    Width = 406
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btnDraw: TButton
    Tag = 12
    Left = 328
    Top = 32
    Width = 145
    Height = 25
    Hint = 'Draw'
    Anchors = [akTop, akRight]
    Caption = 'Печать картинки'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnDrawClick
    OnMouseMove = btnDrawMouseMove
  end
  object edtBarcode: TEdit
    Left = 120
    Top = 80
    Width = 121
    Height = 21
    Hint = 'Barcode'
    MaxLength = 12
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '0'
  end
  object btnLoadImage: TButton
    Left = 328
    Top = 224
    Width = 145
    Height = 25
    Hint = 'LoadLineData'
    Anchors = [akTop, akRight]
    Caption = 'Загрузка картинки'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnLoadImageClick
  end
  object btnPrintBarcode: TButton
    Tag = 13
    Left = 328
    Top = 64
    Width = 145
    Height = 25
    Hint = 'PrintBarcode'
    Anchors = [akTop, akRight]
    Caption = 'Печать штрих-кода'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnPrintBarcodeClick
    OnMouseMove = btnPrintBarcodeMouseMove
  end
  object btnDrawEx: TButton
    Left = 328
    Top = 96
    Width = 145
    Height = 25
    Hint = 'DrawEx'
    Anchors = [akTop, akRight]
    Caption = 'Расширенная печать'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnDrawExClick
    OnMouseMove = btnDrawMouseMove
  end
  object btnLoadLineDataEx: TButton
    Left = 328
    Top = 256
    Width = 145
    Height = 25
    Hint = 'LoadLineDataEx'
    Anchors = [akTop, akRight]
    Caption = 'Расширенная загрузка'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnLoadLineDataExClick
  end
  object btnWideLoadLineData: TButton
    Left = 328
    Top = 288
    Width = 145
    Height = 25
    Hint = 'WideLoadLineData'
    Anchors = [akTop, akRight]
    Caption = 'Загрузка одной командой'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnWideLoadLineDataClick
  end
  object btnMonochrome1: TButton
    Left = 328
    Top = 160
    Width = 145
    Height = 25
    Hint = 'Монохромизировать1'
    Anchors = [akTop, akRight]
    Caption = 'Монохромизировать1'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnMonochrome1Click
  end
  object btnMonochrome2: TButton
    Left = 328
    Top = 192
    Width = 145
    Height = 25
    Hint = 'Монохромизировать2'
    Anchors = [akTop, akRight]
    Caption = 'Монохромизировать2'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnMonochrome2Click
  end
  object edtFirstLineNumber: TEdit
    Left = 160
    Top = 32
    Width = 65
    Height = 21
    Hint = 'FirstLineNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '1'
  end
  object udFirstLineNumber: TUpDown
    Left = 225
    Top = 32
    Width = 15
    Height = 21
    Associate = edtFirstLineNumber
    Min = 0
    Max = 32767
    Position = 1
    TabOrder = 1
    Wrap = False
  end
  object edtLastLineNumber: TEdit
    Left = 160
    Top = 56
    Width = 65
    Height = 21
    Hint = 'LastLineNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '200'
  end
  object udLastLineNumber: TUpDown
    Left = 225
    Top = 56
    Width = 15
    Height = 21
    Associate = edtLastLineNumber
    Min = 0
    Max = 32767
    Position = 200
    TabOrder = 3
    Wrap = False
  end
  object pnlImage: TPanel
    Left = 16
    Top = 128
    Width = 307
    Height = 153
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 5
    object Image: TImage
      Left = 1
      Top = 1
      Width = 305
      Height = 151
      Align = alClient
    end
  end
  object ProgressBar: TProgressBar
    Left = 16
    Top = 287
    Width = 305
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Min = 0
    Max = 200
    Step = 1
    TabOrder = 15
    Visible = False
  end
  object btnOpenPicture: TBitBtn
    Left = 328
    Top = 128
    Width = 145
    Height = 25
    Hint = 'Открыть файл'
    Anchors = [akTop, akRight]
    Caption = 'Открыть файл'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnOpenPictureClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000000000000000000000000000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      FF0000FF0000FF0000FF80808080808080808080808080808080808080808080
      80808080808080808080800000FF0000FF0000FF0000FF0000FF000000000000
      0084840084840084840084840084840084840084840084840084840000000000
      FF0000FF0000FF0000FF808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C08080800000FF0000FF0000FF0000FF00000000FFFF
      0000000084840084840084840084840084840084840084840084840084840000
      000000FF0000FF0000FF808080E2E2E2808080C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000FF0000FF0000FF000000FFFFFF
      00FFFF0000000084840084840084840084840084840084840084840084840084
      840000000000FF0000FF808080FFFFFFE2E2E2808080C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000FF0000FF00000000FFFF
      FFFFFF00FFFF0000000084840084840084840084840084840084840084840084
      840084840000000000FF808080E2E2E2FFFFFFE2E2E2808080C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000FF000000FFFFFF
      00FFFFFFFFFF00FFFF0000000000000000000000000000000000000000000000
      00000000000000000000808080FFFFFFE2E2E2FFFFFFE2E2E280808080808080
      808080808080808080808080808080808080808080808080808000000000FFFF
      FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000000000FF0000
      FF0000FF0000FF0000FF808080E2E2E2FFFFFFE2E2E2FFFFFFE2E2E2FFFFFFE2
      E2E2FFFFFFE2E2E28080800000FF0000FF0000FF0000FF0000FF000000FFFFFF
      00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000FF0000
      FF0000FF0000FF0000FF808080FFFFFFE2E2E2FFFFFFE2E2E2FFFFFFE2E2E2FF
      FFFFE2E2E2FFFFFF8080800000FF0000FF0000FF0000FF0000FF00000000FFFF
      FFFFFF00FFFF0000000000000000000000000000000000000000000000FF0000
      FF0000FF0000FF0000FF808080E2E2E2FFFFFFE2E2E280808080808080808080
      80808080808080808080800000FF0000FF0000FF0000FF0000FF0000FF000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      000000000000000000FF0000FF8080808080808080800000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF8080808080808080800000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF8080808080800000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000
      000000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF8080800000FF0000FF0000FF8080800000FF8080800000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000000000000000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF8080808080808080800000FF0000FF0000FF0000FF}
    Margin = 10
    NumGlyphs = 2
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 16
    Top = 248
  end
end
