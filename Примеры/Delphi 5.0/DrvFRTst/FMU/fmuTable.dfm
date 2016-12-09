object fmTable: TfmTable
  Left = 176
  Top = 126
  Width = 520
  Height = 357
  Caption = 'Таблицы'
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
  object lblValue: TLabel
    Left = 16
    Top = 104
    Width = 51
    Height = 13
    Caption = 'Значение:'
  end
  object lblRowNumber: TLabel
    Left = 16
    Top = 60
    Width = 64
    Height = 13
    Caption = 'Номер ряда:'
  end
  object lblTableNumber: TLabel
    Left = 16
    Top = 36
    Width = 83
    Height = 13
    Caption = 'Номер таблицы:'
  end
  object lblFieldNumber: TLabel
    Left = 16
    Top = 84
    Width = 64
    Height = 13
    Caption = 'Номер поля:'
  end
  object lblTables: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Таблицы'
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
    Width = 437
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Memo: TMemo
    Left = 16
    Top = 152
    Width = 299
    Height = 169
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object edtValue: TEdit
    Left = 16
    Top = 120
    Width = 299
    Height = 21
    Hint = 'Значение'
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = '0123456789012345678901234567890123456789'
  end
  object edtRowNumber: TEdit
    Left = 104
    Top = 56
    Width = 49
    Height = 21
    Hint = 'RowNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '1'
  end
  object edtFieldNumber: TEdit
    Left = 104
    Top = 80
    Width = 49
    Height = 21
    Hint = 'FieldNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '1'
  end
  object edtTableNumber: TEdit
    Left = 104
    Top = 32
    Width = 49
    Height = 21
    Hint = 'TableNumber'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '1'
  end
  object udTableNumber: TUpDown
    Left = 153
    Top = 32
    Width = 15
    Height = 21
    Associate = edtTableNumber
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 1
    Wrap = False
  end
  object udFieldNumber: TUpDown
    Left = 153
    Top = 80
    Width = 15
    Height = 21
    Associate = edtFieldNumber
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 5
    Wrap = False
  end
  object udRowNumber: TUpDown
    Left = 153
    Top = 56
    Width = 15
    Height = 21
    Associate = edtRowNumber
    Min = 0
    Max = 255
    Position = 1
    TabOrder = 3
    Wrap = False
  end
  object btnGetTableStruct: TBitBtn
    Left = 328
    Top = 32
    Width = 177
    Height = 25
    Hint = 'GetTableStruct'
    Anchors = [akTop, akRight]
    Caption = 'Получить структуру таблицы'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnGetTableStructClick
    OnMouseMove = btnGetTableStructMouseMove
    NumGlyphs = 2
  end
  object btnGetFieldStruct: TBitBtn
    Left = 328
    Top = 64
    Width = 177
    Height = 25
    Hint = 'GetFieldStruct'
    Anchors = [akTop, akRight]
    Caption = 'Получить структуру поля'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnGetFieldStructClick
    OnMouseMove = btnGetFieldStructMouseMove
    NumGlyphs = 2
  end
  object btnReadTable: TBitBtn
    Left = 328
    Top = 96
    Width = 177
    Height = 25
    Hint = 'ReadTable'
    Anchors = [akTop, akRight]
    Caption = 'Прочитать таблицу'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnReadTableClick
    OnMouseMove = btnReadTableMouseMove
    NumGlyphs = 2
  end
  object btnWriteTable: TBitBtn
    Left = 328
    Top = 128
    Width = 177
    Height = 25
    Hint = 'WriteTable'
    Anchors = [akTop, akRight]
    Caption = 'Записать таблицу'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnWriteTableClick
    OnMouseMove = btnWriteTableMouseMove
    NumGlyphs = 2
  end
  object btnInitTable: TBitBtn
    Left = 328
    Top = 160
    Width = 177
    Height = 25
    Hint = 'InitTable'
    Anchors = [akTop, akRight]
    Caption = 'Инициализировать таблицы'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnInitTableClick
  end
end
