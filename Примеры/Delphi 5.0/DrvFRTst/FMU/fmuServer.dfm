object fmServer: TfmServer
  Left = 372
  Top = 223
  Width = 424
  Height = 283
  Caption = 'Сервер'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblComputerName: TLabel
    Left = 16
    Top = 44
    Width = 91
    Height = 13
    Caption = 'Имя компьютера:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblCOMNumber: TLabel
    Left = 16
    Top = 76
    Width = 53
    Height = 13
    Caption = 'COM порт:'
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
    Width = 44
    Height = 13
    Caption = 'Сервер'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 64
    Top = 8
    Width = 349
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtComputerName: TEdit
    Left = 160
    Top = 40
    Width = 211
    Height = 21
    Hint = 'ComputerName'
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
  end
  object cbCOMNumber: TComboBox
    Left = 160
    Top = 72
    Width = 211
    Height = 21
    Hint = 'ComNumber'
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
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
  object btnServerConnect: TBitBtn
    Left = 8
    Top = 120
    Width = 193
    Height = 25
    Hint = 'ServerConnect'
    Anchors = [akTop, akRight]
    Caption = 'Подключиться к серверу'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnServerConnectClick
    OnMouseMove = btnServerConnectMouseMove
    NumGlyphs = 2
  end
  object btnServerDisconnect: TBitBtn
    Left = 208
    Top = 120
    Width = 193
    Height = 25
    Hint = 'ServerDisconnect'
    Anchors = [akTop, akRight]
    Caption = 'Отключиться от сервера'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnServerDisconnectClick
    NumGlyphs = 2
  end
  object btnLockPort: TBitBtn
    Left = 8
    Top = 152
    Width = 193
    Height = 25
    Hint = 'LockPort'
    Anchors = [akTop, akRight]
    Caption = 'Занять порт'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnLockPortClick
    OnMouseMove = btnLockPortMouseMove
    NumGlyphs = 2
  end
  object btnAdminUnlockPort: TBitBtn
    Left = 208
    Top = 152
    Width = 193
    Height = 25
    Hint = 'AdminUnlockPort'
    Anchors = [akTop, akRight]
    Caption = 'Освободить порт (администратор)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnAdminUnlockPortClick
    NumGlyphs = 2
  end
  object btnUnlockPort: TBitBtn
    Left = 8
    Top = 184
    Width = 193
    Height = 25
    Hint = 'UnlockPort'
    Anchors = [akTop, akRight]
    Caption = 'Освободить порт'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnUnlockPortClick
    NumGlyphs = 2
  end
  object btnAdminUnlockPorts: TBitBtn
    Left = 208
    Top = 184
    Width = 193
    Height = 25
    Hint = 'AdminUnlockPorts'
    Anchors = [akTop, akRight]
    Caption = 'Освободить порты (администратор)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnAdminUnlockPortsClick
    NumGlyphs = 2
  end
  object btnDeleteDriver: TBitBtn
    Left = 208
    Top = 216
    Width = 193
    Height = 25
    Hint = 'Удалить драйвер'
    Anchors = [akTop, akRight]
    Caption = 'Удалить драйвер'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnDeleteDriverClick
    NumGlyphs = 2
  end
  object btnCreateDriver: TBitBtn
    Left = 8
    Top = 216
    Width = 193
    Height = 25
    Hint = 'Создать драйвер'
    Anchors = [akTop, akRight]
    Caption = 'Создать драйвер'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnCreateDriverClick
    NumGlyphs = 2
  end
  object btnComputerName: TBitBtn
    Left = 376
    Top = 40
    Width = 25
    Height = 25
    Hint = 'Обзор'
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnComputerNameClick
    OnMouseMove = btnComputerNameMouseMove
  end
end
