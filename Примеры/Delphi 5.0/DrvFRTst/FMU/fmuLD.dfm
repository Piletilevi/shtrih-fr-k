object fmLD: TfmLD
  Left = 198
  Top = 217
  Width = 480
  Height = 315
  Caption = 'ЛУ'
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
  object lblLDIndex: TLabel
    Left = 16
    Top = 204
    Width = 41
    Height = 13
    Caption = 'Индекс:'
  end
  object lblLDCount: TLabel
    Left = 16
    Top = 180
    Width = 62
    Height = 13
    Caption = 'Количество:'
  end
  object lblBaudRate: TLabel
    Left = 16
    Top = 108
    Width = 51
    Height = 13
    Caption = 'Скорость:'
  end
  object lblComNumber: TLabel
    Left = 16
    Top = 84
    Width = 53
    Height = 13
    Caption = 'СOM порт:'
  end
  object lblLDNumber: TLabel
    Left = 16
    Top = 60
    Width = 37
    Height = 13
    Caption = 'Номер:'
  end
  object lblLDName: TLabel
    Left = 16
    Top = 36
    Width = 53
    Height = 13
    Caption = 'Название:'
  end
  object lblTimeout: TLabel
    Left = 16
    Top = 132
    Width = 46
    Height = 13
    Caption = 'Таймаут:'
  end
  object lblComputer: TLabel
    Left = 16
    Top = 156
    Width = 61
    Height = 13
    Caption = 'Компьютер:'
  end
  object lblLD: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Работа с ЛУ'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 96
    Top = 8
    Width = 373
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtLDName: TEdit
    Left = 80
    Top = 32
    Width = 185
    Height = 21
    Hint = 'LDName'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtLDNumber: TEdit
    Left = 80
    Top = 56
    Width = 185
    Height = 21
    Hint = 'LDNumber'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1'
  end
  object cbComNumber: TComboBox
    Left = 80
    Top = 80
    Width = 185
    Height = 21
    Hint = 'LDComNumber'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11'
      'COM12'
      'COM13'
      'COM14'
      'COM15'
      'COM16'
      'COM17'
      'COM18'
      'COM19'
      'COM20'
      'COM21'
      'COM22'
      'COM23'
      'COM24'
      'COM25'
      'COM26'
      'COM27'
      'COM28'
      'COM29'
      'COM30'
      'COM31'
      'COM32')
  end
  object cbBaudRate: TComboBox
    Left = 80
    Top = 104
    Width = 185
    Height = 21
    Hint = 'LDBaudrate'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      '2400'
      '4800'
      '9600'
      '19200'
      '38400'
      '57600'
      '115200')
  end
  object edtLDCount: TEdit
    Left = 80
    Top = 176
    Width = 185
    Height = 21
    Hint = 'LDCount'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
  end
  object edtLDIndex: TEdit
    Left = 80
    Top = 200
    Width = 185
    Height = 21
    Hint = 'LDIndex'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '0'
  end
  object edtTimeout: TEdit
    Left = 80
    Top = 128
    Width = 185
    Height = 21
    Hint = 'LDTimeout'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '100'
  end
  object edtComputerName: TEdit
    Left = 80
    Top = 152
    Width = 169
    Height = 21
    Hint = 'LDComputerName'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object btnComputerName: TButton
    Left = 248
    Top = 152
    Width = 17
    Height = 23
    Hint = 'Обзор'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnComputerNameClick
    OnMouseMove = btnComputerNameMouseMove
  end
  object btnAddLD: TBitBtn
    Left = 280
    Top = 32
    Width = 185
    Height = 25
    Hint = 'AddLD'
    Anchors = [akTop, akRight]
    Caption = 'Добавить ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnAddLDClick
    OnMouseMove = btnAddLDMouseMove
    NumGlyphs = 2
  end
  object btnDeleteLD: TBitBtn
    Left = 280
    Top = 64
    Width = 185
    Height = 25
    Hint = 'DeleteLD'
    Anchors = [akTop, akRight]
    Caption = 'Удалить ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnDeleteLDClick
    OnMouseMove = btnDeleteLDMouseMove
    NumGlyphs = 2
  end
  object btnSetParamLD: TBitBtn
    Left = 280
    Top = 160
    Width = 185
    Height = 25
    Hint = 'SetParamLD'
    Anchors = [akTop, akRight]
    Caption = 'Установить параметры ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnSetParamLDClick
    OnMouseMove = btnSetParamLDMouseMove
    NumGlyphs = 2
  end
  object btnGetParamLD: TBitBtn
    Left = 280
    Top = 192
    Width = 185
    Height = 25
    Hint = 'GetParamLD'
    Anchors = [akTop, akRight]
    Caption = 'Получить параметры ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnGetParamLDClick
    OnMouseMove = btnGetParamLDMouseMove
    NumGlyphs = 2
  end
  object btnSetActiveLD: TBitBtn
    Left = 280
    Top = 224
    Width = 185
    Height = 25
    Hint = 'SetActiveLD'
    Anchors = [akTop, akRight]
    Caption = 'Установить активное ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = btnSetActiveLDClick
    OnMouseMove = btnSetActiveLDMouseMove
    NumGlyphs = 2
  end
  object btnGetActiveLD: TBitBtn
    Left = 280
    Top = 256
    Width = 185
    Height = 25
    Hint = 'GetActiveLD'
    Anchors = [akTop, akRight]
    Caption = 'Получить активное ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = btnGetActiveLDClick
    OnMouseMove = btnGetActiveLDMouseMove
    NumGlyphs = 2
  end
  object btnGetCountLD: TBitBtn
    Left = 280
    Top = 96
    Width = 185
    Height = 25
    Hint = 'GetCountLD'
    Anchors = [akTop, akRight]
    Caption = 'Количество ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnGetCountLDClick
    OnMouseMove = btnGetCountLDMouseMove
  end
  object btnEnumLD: TBitBtn
    Left = 280
    Top = 128
    Width = 185
    Height = 25
    Hint = 'EnumLD'
    Anchors = [akTop, akRight]
    Caption = 'Перечислить ЛУ'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnEnumLDClick
    OnMouseMove = btnEnumLDMouseMove
  end
end
