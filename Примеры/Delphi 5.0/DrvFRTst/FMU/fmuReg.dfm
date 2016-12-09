object fmReg: TfmReg
  Left = 370
  Top = 173
  Width = 488
  Height = 352
  Caption = 'Регистрация'
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
  object lblStringForPrint: TLabel
    Left = 8
    Top = 212
    Width = 39
    Height = 13
    Caption = 'Строка:'
  end
  object lblSumm1: TLabel
    Left = 160
    Top = 12
    Width = 43
    Height = 13
    Caption = 'Сумма1:'
  end
  object lblSumm2: TLabel
    Left = 160
    Top = 36
    Width = 43
    Height = 13
    Caption = 'Сумма2:'
  end
  object lblSumm3: TLabel
    Left = 160
    Top = 60
    Width = 43
    Height = 13
    Caption = 'Сумма3:'
  end
  object lblSumm4: TLabel
    Left = 160
    Top = 84
    Width = 43
    Height = 13
    Caption = 'Сумма4:'
  end
  object lblTax1: TLabel
    Left = 8
    Top = 84
    Width = 40
    Height = 13
    Caption = 'Налог1:'
  end
  object lblTax2: TLabel
    Left = 8
    Top = 108
    Width = 40
    Height = 13
    Caption = 'Налог2:'
  end
  object lblTax3: TLabel
    Left = 8
    Top = 132
    Width = 40
    Height = 13
    Caption = 'Налог3:'
  end
  object lblTax4: TLabel
    Left = 8
    Top = 156
    Width = 40
    Height = 13
    Caption = 'Налог4:'
  end
  object lblDiscountOnCheck: TLabel
    Left = 160
    Top = 108
    Width = 83
    Height = 13
    Caption = 'Скидка на чек,%'
  end
  object lblCheckSubTotal: TLabel
    Left = 160
    Top = 132
    Width = 47
    Height = 13
    Caption = 'Подытог:'
  end
  object lblChange: TLabel
    Left = 160
    Top = 156
    Width = 30
    Height = 13
    Caption = 'Сдача'
  end
  object lblCheckType: TLabel
    Left = 8
    Top = 60
    Width = 22
    Height = 13
    Caption = 'Тип:'
  end
  object lblDepartment: TLabel
    Left = 8
    Top = 36
    Width = 34
    Height = 13
    Caption = 'Отдел:'
  end
  object lblQuantity: TLabel
    Left = 8
    Top = 188
    Width = 62
    Height = 13
    Caption = 'Количество:'
  end
  object lblPrice: TLabel
    Left = 8
    Top = 12
    Width = 29
    Height = 13
    Caption = 'Цена:'
  end
  object Label50: TLabel
    Left = 8
    Top = 236
    Width = 53
    Height = 13
    Caption = 'Название:'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 284
    Width = 37
    Height = 13
    Caption = 'Номер:'
    WordWrap = True
  end
  object lblNumber: TLabel
    Left = 8
    Top = 260
    Width = 80
    Height = 13
    Caption = 'Вводить номер:'
  end
  object btnSale: TButton
    Tag = 14
    Left = 288
    Top = 8
    Width = 73
    Height = 25
    Hint = 'Sale'
    Caption = 'Продажа'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = btnSaleClick
    OnMouseMove = RegMouseMove
  end
  object btnReturnSale: TButton
    Tag = 14
    Left = 368
    Top = 8
    Width = 97
    Height = 25
    Hint = 'ReturnSale'
    Caption = 'Возврат продажи'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    OnClick = btnReturnSaleClick
    OnMouseMove = RegMouseMove
  end
  object btnReturnBuy: TButton
    Tag = 14
    Left = 368
    Top = 40
    Width = 97
    Height = 25
    Hint = 'ReturnBuy'
    Caption = 'Возврат покупки'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    OnClick = btnReturnBuyClick
    OnMouseMove = RegMouseMove
  end
  object btnBuy: TButton
    Tag = 14
    Left = 288
    Top = 40
    Width = 73
    Height = 25
    Hint = 'Buy'
    Caption = 'Покупка'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    OnClick = btnBuyClick
    OnMouseMove = RegMouseMove
  end
  object btnStorno: TButton
    Tag = 14
    Left = 288
    Top = 72
    Width = 73
    Height = 25
    Hint = 'Storno'
    Caption = 'Сторно'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = btnStornoClick
    OnMouseMove = RegMouseMove
  end
  object btnCheckSubTotal: TButton
    Tag = 15
    Left = 368
    Top = 72
    Width = 97
    Height = 25
    Hint = 'CheckSubTotal'
    Caption = 'Подытог чека'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnClick = btnCheckSubTotalClick
    OnMouseMove = btnCheckSubTotalMouseMove
  end
  object btnCashOutCome: TButton
    Tag = 16
    Left = 368
    Top = 104
    Width = 97
    Height = 25
    Hint = 'CashOutCome'
    Caption = 'Выплата'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    OnClick = btnCashOutComeClick
    OnMouseMove = btnCashComeMouseMove
  end
  object btnCashInCome: TButton
    Tag = 16
    Left = 288
    Top = 104
    Width = 73
    Height = 25
    Hint = 'CashInCome'
    Caption = 'Внесение'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
    OnClick = btnCashInComeClick
    OnMouseMove = btnCashComeMouseMove
  end
  object btnCharge: TButton
    Tag = 17
    Left = 288
    Top = 136
    Width = 73
    Height = 25
    Hint = 'Charge'
    Caption = 'Надбавка'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    OnClick = btnChargeClick
    OnMouseMove = RegMouseMove
  end
  object btnStornoCharge: TButton
    Tag = 17
    Left = 368
    Top = 136
    Width = 97
    Height = 25
    Hint = 'StornoCharge'
    Caption = 'Сторно надбавки'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
    OnClick = btnStornoChargeClick
    OnMouseMove = RegMouseMove
  end
  object btnStornoDiscount: TButton
    Tag = 17
    Left = 368
    Top = 168
    Width = 97
    Height = 25
    Hint = 'StornoDiscount'
    Caption = 'Сторно скидки'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnClick = btnStornoDiscountClick
    OnMouseMove = RegMouseMove
  end
  object btnDiscount: TButton
    Tag = 17
    Left = 288
    Top = 168
    Width = 73
    Height = 25
    Hint = 'Discount'
    Caption = 'Скидка'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 30
    OnClick = btnDiscountClick
    OnMouseMove = RegMouseMove
  end
  object btnOpenCheck: TButton
    Tag = 19
    Left = 288
    Top = 200
    Width = 73
    Height = 25
    Hint = 'OpenCheck'
    Caption = 'Открыть чек'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 32
    OnClick = btnOpenCheckClick
    OnMouseMove = btnOpenCheckMouseMove
  end
  object btnCloseCheck: TButton
    Tag = 18
    Left = 368
    Top = 200
    Width = 97
    Height = 25
    Hint = 'CloseCheck'
    Caption = 'Закрыть чек'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 33
    OnClick = btnCloseCheckClick
    OnMouseMove = btnCloseCheckMouseMove
  end
  object btnRepeatDocument: TButton
    Left = 288
    Top = 232
    Width = 73
    Height = 25
    Hint = 'RepeatDocument'
    Caption = 'Повтор'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 34
    OnClick = btnRepeatDocumentClick
  end
  object btnSysAdminCancelCheck: TButton
    Left = 288
    Top = 296
    Width = 177
    Height = 25
    Hint = 'SysAdminCancelCheck'
    Caption = 'Отмена чека администратором'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 37
    OnClick = btnSysAdminCancelCheckClick
  end
  object btnCancelCheck: TButton
    Left = 368
    Top = 232
    Width = 97
    Height = 25
    Hint = 'CancelCheck'
    Caption = 'Аннулировать'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 35
    OnClick = btnCancelCheckClick
  end
  object edtStringForPrint: TEdit
    Left = 96
    Top = 208
    Width = 185
    Height = 21
    Hint = 'StringforPrinting'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Text = 'Строка для печати'
  end
  object edtChange: TEdit
    Left = 216
    Top = 152
    Width = 65
    Height = 21
    Hint = 'Change'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 15
  end
  object edtCheckSubTotal: TEdit
    Left = 216
    Top = 128
    Width = 65
    Height = 21
    Hint = 'Подытог чека'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 14
  end
  object edtDiscountOnCheck: TEdit
    Left = 248
    Top = 104
    Width = 33
    Height = 21
    Hint = 'DiscountOnCheck'
    MaxLength = 5
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Text = '0'
  end
  object cbTax4: TComboBox
    Left = 56
    Top = 152
    Width = 97
    Height = 21
    Hint = 'Tax4'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax3: TComboBox
    Left = 56
    Top = 128
    Width = 97
    Height = 21
    Hint = 'Tax3'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax2: TComboBox
    Left = 56
    Top = 104
    Width = 97
    Height = 21
    Hint = 'Tax2'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object cbTax1: TComboBox
    Left = 56
    Top = 80
    Width = 97
    Height = 21
    Hint = 'Tax1'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Items.Strings = (
      'нет'
      '1 группа'
      '2 группа'
      '3 группа'
      '4 группа')
  end
  object edtSumm4: TEdit
    Left = 216
    Top = 80
    Width = 65
    Height = 21
    Hint = 'Summ4'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Text = '0'
  end
  object edtSumm3: TEdit
    Left = 216
    Top = 56
    Width = 65
    Height = 21
    Hint = 'Summ3'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Text = '0'
  end
  object edtSumm2: TEdit
    Left = 216
    Top = 32
    Width = 65
    Height = 21
    Hint = 'Summ2'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Text = '0'
  end
  object edtSumm1: TEdit
    Left = 216
    Top = 8
    Width = 65
    Height = 21
    Hint = 'Summ1'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Text = '100'
  end
  object cbCheckType: TComboBox
    Left = 56
    Top = 56
    Width = 97
    Height = 21
    Hint = 'CheckType'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      'продажа'
      'покупка'
      'возврат продажи'
      'возврат покупки')
  end
  object edtQuantity: TEdit
    Left = 96
    Top = 184
    Width = 185
    Height = 21
    Hint = 'Quantity'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '1'
  end
  object edtPrice: TEdit
    Left = 56
    Top = 8
    Width = 97
    Height = 21
    Hint = 'Price'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '100'
  end
  object edtDepartment: TEdit
    Left = 56
    Top = 32
    Width = 81
    Height = 21
    Hint = 'Department'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1'
  end
  object udDepartment: TUpDown
    Left = 137
    Top = 32
    Width = 15
    Height = 21
    Associate = edtDepartment
    Min = 0
    Max = 16
    Position = 1
    TabOrder = 2
    Wrap = False
  end
  object edtNumber: TEdit
    Left = 96
    Top = 280
    Width = 185
    Height = 21
    Hint = 'Номер'
    MaxLength = 4
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object edtName: TEdit
    Left = 96
    Top = 232
    Width = 185
    Height = 21
    Hint = 'Название'
    AutoSize = False
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    Text = 'Булка'
  end
  object cbNumber: TComboBox
    Left = 96
    Top = 256
    Width = 185
    Height = 21
    Hint = 'Вводить номер'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnChange = cbNumberChange
    Items.Strings = (
      'без номера'
      '№ ТРК'
      '№ счета')
  end
  object btnSaleEx: TButton
    Left = 288
    Top = 264
    Width = 177
    Height = 25
    Hint = 'SaleEx'
    Caption = 'Продажа (Точно)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 36
    OnClick = btnSaleExClick
    OnMouseMove = RegMouseMove
  end
end
