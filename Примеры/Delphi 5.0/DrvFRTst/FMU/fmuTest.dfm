object fmTest: TfmTest
  Left = 311
  Top = 152
  Width = 386
  Height = 358
  Caption = 'Проверка связи'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 32
    Width = 225
    Height = 161
    Shape = bsFrame
  end
  object lblRepCount2: TLabel
    Left = 24
    Top = 48
    Width = 112
    Height = 13
    Caption = 'Количество повторов:'
  end
  object lblRepCount: TLabel
    Left = 152
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblErrCount2: TLabel
    Left = 24
    Top = 72
    Width = 103
    Height = 13
    Caption = 'Количество ошибок:'
  end
  object lblErrCount: TLabel
    Left = 152
    Top = 72
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblSpeed: TLabel
    Left = 24
    Top = 96
    Width = 106
    Height = 13
    Caption = 'Скорость, команд/c:'
  end
  object lblTxSpeed: TLabel
    Left = 152
    Top = 96
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label1: TLabel
    Left = 24
    Top = 144
    Width = 87
    Height = 13
    Caption = 'Процент ошибок:'
  end
  object lblErrRate: TLabel
    Left = 152
    Top = 144
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblTimeLeft2: TLabel
    Left = 24
    Top = 168
    Width = 108
    Height = 13
    Caption = 'Время теста, секунд:'
  end
  object lblTimeLeft: TLabel
    Left = 152
    Top = 168
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 24
    Top = 120
    Width = 108
    Height = 13
    Caption = 'Время команды, мс.:'
  end
  object lblCommandTime: TLabel
    Left = 152
    Top = 120
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Bevel2: TBevel
    Left = 120
    Top = 240
    Width = 255
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label3: TLabel
    Left = 8
    Top = 240
    Width = 103
    Height = 13
    Caption = 'Тест соединения'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 16
    Top = 288
    Width = 87
    Height = 13
    Caption = 'Время теста, мс:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblTest: TLabel
    Left = 16
    Top = 264
    Width = 285
    Height = 13
    Caption = 'Тест печатает 100 строк и выдает общее время печати.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 120
    Top = 8
    Width = 255
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 13
    Caption = 'Проверка связи'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnStart: TButton
    Left = 248
    Top = 32
    Width = 75
    Height = 25
    Hint = 'Начать'
    Caption = 'Начать'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 248
    Top = 64
    Width = 75
    Height = 25
    Hint = 'Прервать'
    Caption = 'Прервать'
    Enabled = False
    TabOrder = 1
    OnClick = btnStopClick
  end
  object chbStopOnError: TCheckBox
    Left = 16
    Top = 200
    Width = 177
    Height = 17
    Hint = 'Остановка при ошибке'
    Caption = 'Остановка при ошибке'
    TabOrder = 2
  end
  object btnTestConnect: TBitBtn
    Left = 208
    Top = 288
    Width = 153
    Height = 25
    Hint = 'Тест соединения'
    Anchors = [akTop, akRight]
    Caption = 'Тест соединения'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnTestConnectClick
    OnMouseMove = btnTestConnectMouseMove
    NumGlyphs = 2
  end
  object edtTime: TEdit
    Left = 112
    Top = 288
    Width = 81
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
end
