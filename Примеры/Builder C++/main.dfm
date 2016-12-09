object Form1: TForm1
  Left = 192
  Top = 107
  Width = 596
  Height = 425
  Caption = 'Тест драйвера ФР'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 368
    Width = 40
    Height = 13
    Caption = 'Ошибка'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 26
    Height = 13
    Caption = 'Цена'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 34
    Height = 13
    Caption = 'Кол-во'
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Пароль'
  end
  object Label5: TLabel
    Left = 8
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Отдел'
  end
  object Label6: TLabel
    Left = 8
    Top = 224
    Width = 37
    Height = 13
    Caption = 'Налог1'
  end
  object Label7: TLabel
    Left = 8
    Top = 248
    Width = 37
    Height = 13
    Caption = 'Налог2'
  end
  object Label8: TLabel
    Left = 8
    Top = 272
    Width = 37
    Height = 13
    Caption = 'Налог3'
  end
  object Label9: TLabel
    Left = 8
    Top = 296
    Width = 37
    Height = 13
    Caption = 'Налог4'
  end
  object Label10: TLabel
    Left = 144
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Строка'
  end
  object Label11: TLabel
    Left = 8
    Top = 320
    Width = 90
    Height = 13
    Caption = 'Номер оператора'
  end
  object Label12: TLabel
    Left = 8
    Top = 104
    Width = 40
    Height = 13
    Caption = 'Сумма1'
  end
  object Label13: TLabel
    Left = 8
    Top = 128
    Width = 40
    Height = 13
    Caption = 'Сумма2'
  end
  object Label14: TLabel
    Left = 8
    Top = 152
    Width = 40
    Height = 13
    Caption = 'Сумма3'
  end
  object Label15: TLabel
    Left = 8
    Top = 176
    Width = 40
    Height = 13
    Caption = 'Сумма4'
  end
  object Label16: TLabel
    Left = 8
    Top = 200
    Width = 37
    Height = 13
    Caption = 'Скидка'
  end
  object Label17: TLabel
    Left = 8
    Top = 344
    Width = 30
    Height = 13
    Caption = 'Сдача'
  end
  object btnShowProperties: TButton
    Left = 472
    Top = 8
    Width = 115
    Height = 25
    Caption = 'Настройка свойств'
    TabOrder = 0
    OnClick = btnShowPropertiesClick
  end
  object btnConnect: TButton
    Left = 472
    Top = 40
    Width = 113
    Height = 25
    Caption = 'Подключить'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 472
    Top = 72
    Width = 113
    Height = 25
    Caption = 'Отключить'
    TabOrder = 2
    OnClick = btnDisconnectClick
  end
  object edError: TEdit
    Left = 56
    Top = 368
    Width = 529
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edPrice: TEdit
    Left = 56
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 4
    Text = '100'
  end
  object btnBeep: TButton
    Left = 472
    Top = 104
    Width = 113
    Height = 25
    Caption = 'Гудок'
    TabOrder = 5
    OnClick = btnBeepClick
  end
  object edQuantity: TEdit
    Left = 56
    Top = 56
    Width = 81
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object edPassword: TEdit
    Left = 56
    Top = 8
    Width = 81
    Height = 21
    MaxLength = 8
    TabOrder = 7
    Text = '30'
  end
  object edStore: TEdit
    Left = 56
    Top = 80
    Width = 81
    Height = 21
    TabOrder = 8
    Text = '1'
  end
  object cbTax1: TComboBox
    Left = 56
    Top = 224
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    Items.Strings = (
      'Нет'
      'Налог1'
      'Налог2'
      'Налог3'
      'Налог4')
  end
  object cbTax2: TComboBox
    Left = 56
    Top = 248
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    Items.Strings = (
      'Нет'
      'Налог1'
      'Налог2'
      'Налог3'
      'Налог4')
  end
  object cbTax3: TComboBox
    Left = 56
    Top = 272
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    Items.Strings = (
      'Нет'
      'Налог1'
      'Налог2'
      'Налог3'
      'Налог4')
  end
  object cbTax4: TComboBox
    Left = 56
    Top = 296
    Width = 81
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      'Нет'
      'Налог1'
      'Налог2'
      'Налог3'
      'Налог4')
  end
  object edString: TEdit
    Left = 192
    Top = 8
    Width = 273
    Height = 21
    TabOrder = 13
    Text = 'Строка для печати'
  end
  object btnSale: TButton
    Left = 144
    Top = 32
    Width = 105
    Height = 25
    Caption = 'Продажа'
    TabOrder = 14
    OnClick = btnSaleClick
  end
  object btnBuy: TButton
    Left = 144
    Top = 96
    Width = 105
    Height = 25
    Caption = 'Покупка'
    TabOrder = 15
    OnClick = btnBuyClick
  end
  object btnReturnSale: TButton
    Left = 144
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Возврат продажи'
    TabOrder = 16
    OnClick = btnReturnSaleClick
  end
  object btnReturnBuy: TButton
    Left = 144
    Top = 128
    Width = 105
    Height = 25
    Caption = 'Возврат покупки'
    TabOrder = 17
    OnClick = btnReturnBuyClick
  end
  object edOperatorNumber: TEdit
    Left = 104
    Top = 320
    Width = 33
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object btnStorno: TButton
    Left = 144
    Top = 160
    Width = 105
    Height = 25
    Caption = 'Сторно'
    TabOrder = 19
    OnClick = btnStornoClick
  end
  object edSumm1: TEdit
    Left = 56
    Top = 104
    Width = 81
    Height = 21
    TabOrder = 20
    Text = '1000'
  end
  object edSumm2: TEdit
    Left = 56
    Top = 128
    Width = 81
    Height = 21
    TabOrder = 21
    Text = '0'
  end
  object edSumm3: TEdit
    Left = 56
    Top = 152
    Width = 81
    Height = 21
    TabOrder = 22
    Text = '0'
  end
  object edSumm4: TEdit
    Left = 56
    Top = 176
    Width = 81
    Height = 21
    TabOrder = 23
    Text = '0'
  end
  object btnCloseCheck: TButton
    Left = 144
    Top = 320
    Width = 105
    Height = 25
    Caption = 'Закрытие чека'
    TabOrder = 24
    OnClick = btnCloseCheckClick
  end
  object edSumm: TEdit
    Left = 56
    Top = 200
    Width = 81
    Height = 21
    TabOrder = 25
    Text = '100'
  end
  object edChange: TEdit
    Left = 48
    Top = 344
    Width = 89
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 26
  end
  object btnPrintReportWithCleaning: TButton
    Left = 256
    Top = 288
    Width = 161
    Height = 25
    Caption = 'Суточный отчет с гашением'
    TabOrder = 27
    OnClick = btnPrintReportWithCleaningClick
  end
  object btnPrintReportWithoutCleaning: TButton
    Left = 256
    Top = 256
    Width = 161
    Height = 25
    Caption = 'Суточный отчет без гашения'
    TabOrder = 28
    OnClick = btnPrintReportWithoutCleaningClick
  end
  object btnDiscount: TButton
    Left = 144
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Скидка'
    TabOrder = 29
    OnClick = btnDiscountClick
  end
  object btnStornoDiscount: TButton
    Left = 144
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Сторно скидки'
    TabOrder = 30
    OnClick = btnStornoDiscountClick
  end
  object btnCharge: TButton
    Left = 144
    Top = 256
    Width = 105
    Height = 25
    Caption = 'Надбавка'
    TabOrder = 31
    OnClick = btnChargeClick
  end
  object btnStornoCharge: TButton
    Left = 144
    Top = 288
    Width = 105
    Height = 25
    Caption = 'Сторно надбавки'
    TabOrder = 32
    OnClick = btnStornoChargeClick
  end
  object btnCancelCheck: TButton
    Left = 256
    Top = 320
    Width = 161
    Height = 25
    Caption = 'Аннулирование чека'
    TabOrder = 33
    OnClick = btnCancelCheckClick
  end
end
