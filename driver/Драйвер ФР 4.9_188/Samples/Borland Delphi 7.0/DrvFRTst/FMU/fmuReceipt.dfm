object fmReceipt: TfmReceipt
  Left = 437
  Top = 262
  AutoScroll = False
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 320
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    548
    320)
  PixelsPerInch = 96
  TextHeight = 13
  object lblStringForPrint: TLabel
    Left = 8
    Top = 213
    Width = 39
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072':'
  end
  object lblSumm1: TLabel
    Left = 144
    Top = 12
    Width = 43
    Height = 13
    Caption = #1057#1091#1084#1084#1072'1:'
  end
  object lblSumm2: TLabel
    Left = 144
    Top = 36
    Width = 43
    Height = 13
    Caption = #1057#1091#1084#1084#1072'2:'
  end
  object lblSumm3: TLabel
    Left = 144
    Top = 60
    Width = 43
    Height = 13
    Caption = #1057#1091#1084#1084#1072'3:'
  end
  object lblSumm4: TLabel
    Left = 144
    Top = 84
    Width = 43
    Height = 13
    Caption = #1057#1091#1084#1084#1072'4:'
  end
  object lblTax1: TLabel
    Left = 8
    Top = 84
    Width = 40
    Height = 13
    Caption = #1053#1072#1083#1086#1075'1:'
  end
  object lblTax2: TLabel
    Left = 8
    Top = 108
    Width = 40
    Height = 13
    Caption = #1053#1072#1083#1086#1075'2:'
  end
  object lblTax3: TLabel
    Left = 8
    Top = 132
    Width = 40
    Height = 13
    Caption = #1053#1072#1083#1086#1075'3:'
  end
  object lblTax4: TLabel
    Left = 8
    Top = 156
    Width = 40
    Height = 13
    Caption = #1053#1072#1083#1086#1075'4:'
  end
  object lblDiscountOnCheck: TLabel
    Left = 144
    Top = 108
    Width = 83
    Height = 13
    Caption = #1057#1082#1080#1076#1082#1072' '#1085#1072' '#1095#1077#1082',%'
  end
  object lblCheckSubTotal: TLabel
    Left = 144
    Top = 132
    Width = 47
    Height = 13
    Caption = #1055#1086#1076#1099#1090#1086#1075':'
  end
  object lblChange: TLabel
    Left = 144
    Top = 156
    Width = 30
    Height = 13
    Caption = #1057#1076#1072#1095#1072
  end
  object lblCheckType: TLabel
    Left = 8
    Top = 60
    Width = 22
    Height = 13
    Caption = #1058#1080#1087':'
  end
  object lblDepartment: TLabel
    Left = 8
    Top = 36
    Width = 34
    Height = 13
    Caption = #1054#1090#1076#1077#1083':'
  end
  object lblQuantity: TLabel
    Left = 8
    Top = 189
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object lblPrice: TLabel
    Left = 8
    Top = 12
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label50: TLabel
    Left = 8
    Top = 237
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 285
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
    WordWrap = True
  end
  object lblNumber: TLabel
    Left = 8
    Top = 261
    Width = 80
    Height = 13
    Caption = #1042#1074#1086#1076#1080#1090#1100' '#1085#1086#1084#1077#1088':'
  end
  object lblKPKStr: TLabel
    Left = 168
    Top = 285
    Width = 25
    Height = 13
    Caption = #1050#1055#1050':'
  end
  object btnSale: TButton
    Tag = 14
    Left = 327
    Top = 8
    Width = 105
    Height = 25
    Hint = 'Sale'
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1086#1076#1072#1078#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = btnSaleClick
  end
  object btnReturnSale: TButton
    Tag = 14
    Left = 439
    Top = 8
    Width = 105
    Height = 25
    Hint = 'ReturnSale'
    Anchors = [akTop, akRight]
    Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1072#1078#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    OnClick = btnReturnSaleClick
  end
  object btnReturnBuy: TButton
    Tag = 14
    Left = 439
    Top = 38
    Width = 105
    Height = 25
    Hint = 'ReturnBuy'
    Anchors = [akTop, akRight]
    Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1082#1091#1087#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    OnClick = btnReturnBuyClick
  end
  object btnBuy: TButton
    Tag = 14
    Left = 327
    Top = 38
    Width = 105
    Height = 25
    Hint = 'Buy'
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1082#1091#1087#1082#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    OnClick = btnBuyClick
  end
  object btnStorno: TButton
    Tag = 14
    Left = 327
    Top = 68
    Width = 105
    Height = 25
    Hint = 'Storno'
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1086#1088#1085#1086
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = btnStornoClick
  end
  object btnCheckSubTotal: TButton
    Tag = 15
    Left = 439
    Top = 68
    Width = 105
    Height = 25
    Hint = 'CheckSubTotal'
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1076#1099#1090#1086#1075' '#1095#1077#1082#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnClick = btnCheckSubTotalClick
  end
  object btnCashOutCome: TButton
    Tag = 16
    Left = 439
    Top = 98
    Width = 105
    Height = 25
    Hint = 'CashOutCome'
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1087#1083#1072#1090#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    OnClick = btnCashOutComeClick
  end
  object btnCashInCome: TButton
    Tag = 16
    Left = 327
    Top = 98
    Width = 105
    Height = 25
    Hint = 'CashInCome'
    Anchors = [akTop, akRight]
    Caption = #1042#1085#1077#1089#1077#1085#1080#1077
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
    OnClick = btnCashInComeClick
  end
  object btnCharge: TButton
    Tag = 17
    Left = 327
    Top = 128
    Width = 105
    Height = 25
    Hint = 'Charge'
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    OnClick = btnChargeClick
  end
  object btnStornoCharge: TButton
    Tag = 17
    Left = 439
    Top = 128
    Width = 105
    Height = 25
    Hint = 'StornoCharge'
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1086#1088#1085#1086' '#1085#1072#1076#1073#1072#1074#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
    OnClick = btnStornoChargeClick
  end
  object btnStornoDiscount: TButton
    Tag = 17
    Left = 439
    Top = 158
    Width = 105
    Height = 25
    Hint = 'StornoDiscount'
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1086#1088#1085#1086' '#1089#1082#1080#1076#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnClick = btnStornoDiscountClick
  end
  object btnDiscount: TButton
    Tag = 17
    Left = 327
    Top = 158
    Width = 105
    Height = 25
    Hint = 'Discount'
    Anchors = [akTop, akRight]
    Caption = #1057#1082#1080#1076#1082#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 30
    OnClick = btnDiscountClick
  end
  object btnOpenCheck: TButton
    Tag = 19
    Left = 327
    Top = 188
    Width = 105
    Height = 25
    Hint = 'OpenCheck'
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1095#1077#1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 32
    OnClick = btnOpenCheckClick
  end
  object btnCloseCheck: TButton
    Tag = 18
    Left = 439
    Top = 188
    Width = 105
    Height = 25
    Hint = 'CloseCheck'
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1095#1077#1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 33
    OnClick = btnCloseCheckClick
  end
  object btnRepeatDocument: TButton
    Left = 327
    Top = 218
    Width = 105
    Height = 25
    Hint = 'RepeatDocument'
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1074#1090#1086#1088
    ParentShowHint = False
    ShowHint = True
    TabOrder = 34
    OnClick = btnRepeatDocumentClick
  end
  object btnSysAdminCancelCheck: TButton
    Left = 440
    Top = 278
    Width = 104
    Height = 25
    Hint = 'SysAdminCancelCheck'
    Anchors = [akTop, akRight]
    Caption = #1040#1076#1084'. '#1086#1090#1084#1077#1085#1072' '#1095#1077#1082#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 39
    OnClick = btnSysAdminCancelCheckClick
  end
  object btnCancelCheck: TButton
    Left = 439
    Top = 218
    Width = 105
    Height = 25
    Hint = 'CancelCheck'
    Anchors = [akTop, akRight]
    Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 35
    OnClick = btnCancelCheckClick
  end
  object edtStringForPrint: TEdit
    Left = 96
    Top = 209
    Width = 225
    Height = 21
    Hint = 'StringforPrinting'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 4096
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    Text = #1057#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
  end
  object edtChange: TEdit
    Left = 200
    Top = 152
    Width = 122
    Height = 21
    Hint = 'Change'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 13
  end
  object edtCheckSubTotal: TEdit
    Left = 200
    Top = 128
    Width = 122
    Height = 21
    Hint = #1055#1086#1076#1099#1090#1086#1075' '#1095#1077#1082#1072
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 12
  end
  object edtDiscountOnCheck: TEdit
    Left = 232
    Top = 104
    Width = 90
    Height = 21
    Hint = 'DiscountOnCheck'
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Text = '0'
  end
  object cbTax4: TComboBox
    Left = 56
    Top = 152
    Width = 81
    Height = 21
    Hint = 'Tax4'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      '1 '#1075#1088#1091#1087#1087#1072
      '2 '#1075#1088#1091#1087#1087#1072
      '3 '#1075#1088#1091#1087#1087#1072
      '4 '#1075#1088#1091#1087#1087#1072)
  end
  object cbTax3: TComboBox
    Left = 56
    Top = 128
    Width = 81
    Height = 21
    Hint = 'Tax3'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      '1 '#1075#1088#1091#1087#1087#1072
      '2 '#1075#1088#1091#1087#1087#1072
      '3 '#1075#1088#1091#1087#1087#1072
      '4 '#1075#1088#1091#1087#1087#1072)
  end
  object cbTax2: TComboBox
    Left = 56
    Top = 104
    Width = 81
    Height = 21
    Hint = 'Tax2'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      '1 '#1075#1088#1091#1087#1087#1072
      '2 '#1075#1088#1091#1087#1087#1072
      '3 '#1075#1088#1091#1087#1087#1072
      '4 '#1075#1088#1091#1087#1087#1072)
  end
  object cbTax1: TComboBox
    Left = 56
    Top = 80
    Width = 81
    Height = 21
    Hint = 'Tax1'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = #1085#1077#1090
    Items.Strings = (
      #1085#1077#1090
      '1 '#1075#1088#1091#1087#1087#1072
      '2 '#1075#1088#1091#1087#1087#1072
      '3 '#1075#1088#1091#1087#1087#1072
      '4 '#1075#1088#1091#1087#1087#1072)
  end
  object edtSumm4: TEdit
    Left = 200
    Top = 80
    Width = 122
    Height = 21
    Hint = 'Summ4'
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Text = '0'
  end
  object edtSumm3: TEdit
    Left = 200
    Top = 56
    Width = 122
    Height = 21
    Hint = 'Summ3'
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Text = '0'
  end
  object edtSumm2: TEdit
    Left = 200
    Top = 32
    Width = 122
    Height = 21
    Hint = 'Summ2'
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '0'
  end
  object cbCheckType: TComboBox
    Left = 56
    Top = 56
    Width = 81
    Height = 21
    Hint = 'CheckType'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = #1087#1088#1086#1076#1072#1078#1072
    Items.Strings = (
      #1087#1088#1086#1076#1072#1078#1072
      #1087#1086#1082#1091#1087#1082#1072
      #1074#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1072#1078#1080
      #1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1082#1091#1087#1082#1080)
  end
  object edtQuantity: TEdit
    Left = 96
    Top = 185
    Width = 225
    Height = 21
    Hint = 'Quantity'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    Text = '1'
  end
  object edtPrice: TEdit
    Left = 56
    Top = 8
    Width = 81
    Height = 21
    Hint = 'Price'
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '100'
  end
  object edtNumber: TEdit
    Left = 96
    Top = 281
    Width = 65
    Height = 21
    Hint = #1053#1086#1084#1077#1088
    MaxLength = 100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object edtName: TEdit
    Left = 96
    Top = 233
    Width = 225
    Height = 21
    Hint = #1053#1072#1079#1074#1072#1085#1080#1077
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    MaxLength = 4096
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Text = #1041#1091#1083#1082#1072
  end
  object cbNumber: TComboBox
    Left = 96
    Top = 257
    Width = 225
    Height = 21
    Hint = #1042#1074#1086#1076#1080#1090#1100' '#1085#1086#1084#1077#1088
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    Text = #1073#1077#1079' '#1085#1086#1084#1077#1088#1072
    OnChange = cbNumberChange
    Items.Strings = (
      #1073#1077#1079' '#1085#1086#1084#1077#1088#1072
      #8470' '#1058#1056#1050
      #8470' '#1089#1095#1077#1090#1072)
  end
  object btnSaleEx: TButton
    Left = 327
    Top = 248
    Width = 105
    Height = 25
    Hint = 'SaleEx'
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1086#1076#1072#1078#1072' ('#1058#1086#1095#1085#1086')'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 36
    OnClick = btnSaleExClick
  end
  object seDepartment: TSpinEdit
    Left = 56
    Top = 32
    Width = 81
    Height = 22
    Hint = 'Department'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Value = 1
  end
  object btnBeep: TButton
    Left = 439
    Top = 248
    Width = 105
    Height = 25
    Hint = 'Beep'
    Anchors = [akTop, akRight]
    Caption = #1043#1091#1076#1086#1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 37
    OnClick = btnBeepClick
  end
  object edtSumm1: TEdit
    Left = 200
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 100
    TabOrder = 7
    Text = '0'
  end
  object btnCloseCheckKPK: TButton
    Left = 327
    Top = 278
    Width = 105
    Height = 25
    Hint = 'CloseCheckWithKPK'
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1082#1088'. '#1095#1077#1082#1072' c '#1050#1055#1050
    ParentShowHint = False
    ShowHint = True
    TabOrder = 38
    OnClick = btnCloseCheckKPKClick
  end
  object edtKPKStr: TEdit
    Left = 200
    Top = 281
    Width = 121
    Height = 21
    Hint = 'KPKStr'
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 19
  end
end
