object fmECRReg: TfmECRReg
  Left = 211
  Top = 178
  Width = 487
  Height = 367
  Caption = 'Регистры ККМ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblRegisterNumber: TLabel
    Left = 16
    Top = 36
    Width = 86
    Height = 13
    Caption = 'Номер регистра:'
  end
  object lblNameOperationReg: TLabel
    Left = 16
    Top = 60
    Width = 102
    Height = 13
    Caption = 'Название регистра:'
  end
  object lblContents: TLabel
    Left = 16
    Top = 84
    Width = 117
    Height = 13
    Caption = 'Содержимое регистра:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Регистры ККМ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 104
    Top = 8
    Width = 373
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object edtRegisterNumber: TEdit
    Left = 144
    Top = 32
    Width = 329
    Height = 21
    Hint = 'RegisterNumber'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0'
  end
  object edtRegName: TEdit
    Left = 144
    Top = 56
    Width = 329
    Height = 21
    Hint = 'Название регистра'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object edtRegContent: TEdit
    Left = 144
    Top = 80
    Width = 329
    Height = 21
    Hint = 'Содержимое регистра'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
  end
  object btnGetOperationReg: TButton
    Left = 144
    Top = 104
    Width = 161
    Height = 25
    Hint = 'GetOperationReg'
    Anchors = [akTop, akRight]
    Caption = 'Операционный регистр'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnGetOperationRegClick
    OnMouseMove = btnGetRegMouseMove
  end
  object btnGetCashReg: TButton
    Left = 312
    Top = 104
    Width = 161
    Height = 25
    Hint = 'GetCashReg'
    Anchors = [akTop, akRight]
    Caption = 'Денежный регистр'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnGetCashRegClick
    OnMouseMove = btnGetRegMouseMove
  end
  object btnGetOperationRegs: TButton
    Left = 144
    Top = 296
    Width = 161
    Height = 25
    Hint = 'GetOperationReg'
    Anchors = [akTop, akRight]
    Caption = 'Все операционные регистры'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnGetOperationRegsClick
  end
  object Grid: TStringGrid
    Left = 16
    Top = 136
    Width = 457
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    ColCount = 3
    DefaultColWidth = 320
    FixedCols = 0
    RowCount = 257
    TabOrder = 5
    ColWidths = (
      28
      328
      78)
  end
  object btnGetCashRegs: TButton
    Left = 312
    Top = 296
    Width = 161
    Height = 25
    Hint = 'GetCashReg'
    Anchors = [akTop, akRight]
    Caption = 'Все денежные регистры'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnGetCashRegsClick
  end
end
