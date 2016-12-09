object fmConnect: TfmConnect
  Left = 323
  Top = 257
  Width = 525
  Height = 323
  Caption = 'Параметры связи'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPortNumber: TLabel
    Left = 64
    Top = 190
    Width = 49
    Height = 13
    Caption = 'Порт ФР:'
  end
  object Image1: TImage
    Left = 8
    Top = 112
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      055449636F6E0000010001002020100000000000E80200001600000028000000
      2000000040000000010004000000000080020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF00007F8870000000000000000000000000007F88700000000000000000
      00000000007F8870000000000000000000000000007F88700000000000000000
      00000000007F8887000000000000000000000000007F88887777777777700000
      000000000007F88888888888888770000000000000007F888888888888888700
      00000000000007FFFFFFFFFFFF88887000000000000000777777777777F88870
      000000000000000000000000007F88870000000000000000000000000007F887
      0000000000000000000000000007F8870000000000000000000000000007F887
      0000000000000000000000000007777700000000000000000000000000000000
      00000000000000000000000000777777770000000000000000000000F8888888
      87770000000000000000007F8888888888777000000000000000007FF8888888
      87877000000000000000007F8888888888777000000000000000007FF8888888
      87877000000000000000007F8888888878777000000000000000007FF8888887
      87877000000000000000007F887878787877700000000000000007F777777777
      777770000000000000007F8888888888888887700000000000007F8888888888
      888888700000000000007F88888888888888887000000000000007FFFFFFFFFF
      FFFFFF00000000000000008B38B38B38B38B3000000000000000008838838838
      83883000C0FFFFFFC0FFFFFFC0FFFFFFC0FFFFFFC0001FFFC00007FFE00003FF
      F00001FFF80000FFFC0000FFFFFFC07FFFFFE07FFFFFE07FFFFFE07FFFFFE07F
      FFFFC03FFFFF000FFFFE0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003
      FFFC0003FFFC0003FFF80001FFF00000FFF00000FFF00000FFF80001FFFC0003
      FFFC0003}
  end
  object lblCOMNumber: TLabel
    Left = 64
    Top = 116
    Width = 28
    Height = 13
    Caption = 'Порт:'
  end
  object lblTimeout: TLabel
    Left = 64
    Top = 166
    Width = 46
    Height = 13
    Caption = 'Таймаут:'
  end
  object lblBaudRate: TLabel
    Left = 64
    Top = 140
    Width = 51
    Height = 13
    Caption = 'Скорость:'
  end
  object Label1: TLabel
    Left = 8
    Top = 91
    Width = 31
    Height = 13
    Caption = 'Связь'
  end
  object Bevel: TBevel
    Left = 64
    Top = 96
    Width = 449
    Height = 17
    Shape = bsTopLine
  end
  object lblComputerName: TLabel
    Left = 64
    Top = 36
    Width = 91
    Height = 13
    Caption = 'Имя компьютера:'
  end
  object Image2: TImage
    Left = 8
    Top = 32
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      055449636F6E0000010001002020100000000000E80200001600000028000000
      2000000040000000010004000000000080020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000033
      3330000000000000000000000000003FBB308888000000000000000000FFFF3F
      BB30FFFF00000000000000000077773FFF307777000000000000000000000033
      33300000000000000000000000000007F0000000000000000000000000000007
      F0000000000000000000000000000007F0000000000000000000000000000007
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000777777777777700000000000
      000000007F8888880008700000000000000000007FFFFFFFFFFF700000000000
      0000000007000000000070000000000000000000078888888887077777777000
      00000000078777777787088800087000000000000780000000870FFFFFFF7000
      00000000078000000087000000007000000000000780F0000087088888870000
      000000000780F000008707777787000000000000078000000087000000870000
      0000000007888888888700000087000000000000007777777777F00000870000
      00000000000000000780F0000087000000000000000000000780000000870000
      0000000000000000078888888887000000000000000000000077777777770000
      00000000FFFFFFFFFFFFFFFFFFFFFC0FFFFFC000FF07FC00FEFFC000FEFFC000
      FEFFFC0FFEFFFE5FFEFFFE5FFEFFFE5FFEFFFE5FFEFFFFFFFFFFFFFF8007FFFF
      0003FFBF0003FFBF0003FFBF800007BF800003BF8000027F800003FF800003FF
      800007FF800007FF800007FF800007FFC00007FFFF8007FFFF8007FFFF8007FF
      FFC00FFF}
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Сервер'
  end
  object Bevel1: TBevel
    Left = 64
    Top = 16
    Width = 449
    Height = 17
    Shape = bsTopLine
  end
  object btnGetExchangeParam: TButton
    Left = 368
    Top = 112
    Width = 145
    Height = 25
    Caption = 'Получить параметры'
    TabOrder = 12
    OnClick = btnGetExchangeParamClick
  end
  object btnSetExchangeParam: TButton
    Left = 368
    Top = 144
    Width = 145
    Height = 25
    Caption = 'Установить параметры'
    TabOrder = 13
    OnClick = btnSetExchangeParamClick
  end
  object edtPortNumber: TEdit
    Left = 128
    Top = 184
    Width = 89
    Height = 21
    MaxLength = 3
    TabOrder = 8
    Text = '0'
  end
  object udPortNumber: TUpDown
    Left = 217
    Top = 184
    Width = 15
    Height = 21
    Associate = edtPortNumber
    Min = 0
    Max = 32767
    Position = 0
    TabOrder = 9
    Wrap = False
  end
  object btnConnect: TButton
    Left = 240
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Установить связь'
    TabOrder = 10
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 240
    Top = 144
    Width = 121
    Height = 25
    Caption = 'Разорвать связь'
    TabOrder = 11
    OnClick = btnDisconnectClick
  end
  object cbCOMNumber: TComboBox
    Left = 128
    Top = 112
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
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
    Left = 128
    Top = 136
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
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
    Left = 128
    Top = 160
    Width = 89
    Height = 21
    TabOrder = 6
    Text = '50'
  end
  object udTimeout: TUpDown
    Left = 217
    Top = 160
    Width = 15
    Height = 21
    Associate = edtTimeout
    Min = 0
    Max = 32767
    Position = 50
    TabOrder = 7
    Wrap = False
  end
  object btnServerConnect: TButton
    Left = 368
    Top = 32
    Width = 145
    Height = 25
    Caption = 'Подключиться к серверу'
    TabOrder = 2
    OnClick = btnServerConnectClick
  end
  object edtComputerName: TEdit
    Left = 160
    Top = 32
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnComputerName: TButton
    Left = 336
    Top = 32
    Width = 24
    Height = 24
    Caption = '...'
    TabOrder = 1
    OnClick = btnComputerNameClick
  end
  object btnServerDisconnect: TButton
    Left = 368
    Top = 64
    Width = 145
    Height = 25
    Caption = 'Отключиться от сервера'
    TabOrder = 3
    OnClick = btnServerDisconnectClick
  end
  object btnLockPort: TButton
    Left = 240
    Top = 176
    Width = 121
    Height = 25
    Caption = 'Занять порт'
    TabOrder = 14
    OnClick = btnLockPortClick
  end
  object btnUnlockPort: TButton
    Left = 240
    Top = 208
    Width = 121
    Height = 25
    Caption = 'Освободить порт'
    TabOrder = 15
    OnClick = btnUnlockPortClick
  end
  object btnAdminUnlockPort: TButton
    Left = 368
    Top = 176
    Width = 147
    Height = 25
    Caption = 'Освободить порт (админ.)'
    TabOrder = 16
    OnClick = btnAdminUnlockPortClick
  end
  object btnAdminUnlockPorts: TButton
    Left = 368
    Top = 208
    Width = 147
    Height = 25
    Caption = 'Освободить порты (админ.)'
    TabOrder = 17
    OnClick = btnAdminUnlockPortsClick
  end
  object btnCreateDriver: TButton
    Left = 240
    Top = 240
    Width = 121
    Height = 25
    Caption = 'Создать драйвер'
    TabOrder = 18
  end
  object btnDeleteDriver: TButton
    Left = 368
    Top = 240
    Width = 145
    Height = 25
    Caption = 'Удалить драйвер'
    TabOrder = 19
  end
end
