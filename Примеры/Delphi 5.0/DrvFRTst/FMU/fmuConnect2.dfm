object fmConnect: TfmConnect
  Left = 258
  Top = 204
  Width = 470
  Height = 202
  Caption = 'Связь'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Связь'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 56
    Top = 8
    Width = 403
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btnConnect: TBitBtn
    Left = 216
    Top = 40
    Width = 153
    Height = 25
    Hint = 'Connect'
    Anchors = [akTop, akRight]
    Caption = 'Установить связь'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnConnectClick
    OnMouseMove = btnConnectMouseMove
    NumGlyphs = 2
  end
  object btnDisconnect: TBitBtn
    Left = 216
    Top = 72
    Width = 153
    Height = 25
    Hint = 'Disconnect'
    Anchors = [akTop, akRight]
    Caption = 'Разорвать связь'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnDisconnectClick
    NumGlyphs = 2
  end
  object btnGetExchangeParam: TBitBtn
    Left = 216
    Top = 112
    Width = 153
    Height = 25
    Hint = 'GetExchangeParam'
    Anchors = [akTop, akRight]
    Caption = 'Получить параметры'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnGetExchangeParamClick
    OnMouseMove = btnGetExchangeParamMouseMove
    NumGlyphs = 2
  end
  object btnSetExchangeParam: TBitBtn
    Left = 216
    Top = 144
    Width = 153
    Height = 25
    Hint = 'SetExchangeParam'
    Anchors = [akTop, akRight]
    Caption = 'Установить параметры'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnSetExchangeParamClick
    OnMouseMove = btnSetExchangeParamMouseMove
    NumGlyphs = 2
  end
  object gbParams: TGroupBox
    Left = 16
    Top = 32
    Width = 193
    Height = 137
    Caption = 'Параметры'
    TabOrder = 0
    object lblCOMNumber: TLabel
      Left = 16
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Порт:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblBaudRate: TLabel
      Left = 16
      Top = 44
      Width = 51
      Height = 13
      Caption = 'Скорость:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTimeout: TLabel
      Left = 16
      Top = 68
      Width = 46
      Height = 13
      Caption = 'Таймаут:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPortNumber: TLabel
      Left = 16
      Top = 92
      Width = 49
      Height = 13
      Caption = 'Порт ФР:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbCOMNumber: TComboBox
      Left = 96
      Top = 16
      Width = 81
      Height = 21
      Hint = 'ComNumber'
      Style = csDropDownList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Left = 96
      Top = 40
      Width = 81
      Height = 21
      Hint = 'BaudRate'
      Style = csDropDownList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Items.Strings = (
        '2400'
        '4800'
        '9600'
        '19200'
        '38400'
        '57600'
        '115200')
    end
    object edtTimeout: TEdit
      Left = 96
      Top = 64
      Width = 65
      Height = 21
      Hint = 'Timeout'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '50'
    end
    object udTimeout: TUpDown
      Left = 160
      Top = 64
      Width = 16
      Height = 21
      Min = 0
      Max = 32767
      ParentShowHint = False
      Position = 50
      ShowHint = True
      TabOrder = 3
      Wrap = False
    end
    object edtPortNumber: TEdit
      Left = 96
      Top = 88
      Width = 65
      Height = 21
      Hint = 'PortNumber'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = '0'
    end
    object udPortNumber: TUpDown
      Left = 160
      Top = 88
      Width = 16
      Height = 21
      Min = 0
      Max = 32767
      ParentShowHint = False
      Position = 0
      ShowHint = True
      TabOrder = 5
      Wrap = False
    end
  end
end
