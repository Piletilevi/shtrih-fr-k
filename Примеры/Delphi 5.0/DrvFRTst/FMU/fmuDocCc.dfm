object fmDocCc: TfmDocCc
  Left = 375
  Top = 243
  Width = 366
  Height = 263
  Caption = '�������� ���� ��'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblStringforPrinting: TLabel
    Left = 16
    Top = 192
    Width = 36
    Height = 13
    Caption = '������'
  end
  object lblDiscountOnCheck: TLabel
    Left = 16
    Top = 168
    Width = 40
    Height = 13
    Caption = '������:'
  end
  object lblSumm4: TLabel
    Left = 16
    Top = 140
    Width = 43
    Height = 13
    Caption = '�����4:'
  end
  object lblSumm3: TLabel
    Left = 16
    Top = 116
    Width = 43
    Height = 13
    Caption = '�����3:'
  end
  object lblSumm1: TLabel
    Left = 16
    Top = 68
    Width = 43
    Height = 13
    Caption = '�����1:'
  end
  object lblSumm2: TLabel
    Left = 16
    Top = 92
    Width = 43
    Height = 13
    Caption = '�����2:'
  end
  object lblTax1: TLabel
    Left = 176
    Top = 68
    Width = 40
    Height = 13
    Caption = '�����1:'
  end
  object lblTax2: TLabel
    Left = 176
    Top = 92
    Width = 40
    Height = 13
    Caption = '�����2:'
  end
  object lblTax3: TLabel
    Left = 176
    Top = 116
    Width = 40
    Height = 13
    Caption = '�����3:'
  end
  object lblTax4: TLabel
    Left = 176
    Top = 140
    Width = 40
    Height = 13
    Caption = '�����4:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 161
    Height = 13
    Caption = '����������� �������� ��'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 176
    Top = 8
    Width = 179
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 334
    Height = 13
    Caption = '����������� �������� �������� ���� �� ���������� ���������.'
  end
  object edtStringforPrinting: TEdit
    Left = 64
    Top = 184
    Width = 281
    Height = 21
    Hint = 'StringforPrinting'
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = '������ ��� ������'
  end
  object edtDiscountOnCheck: TEdit
    Left = 64
    Top = 160
    Width = 81
    Height = 21
    Hint = 'DiscountOnCheck'
    MaxLength = 5
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '0'
  end
  object edtSumm4: TEdit
    Left = 64
    Top = 136
    Width = 81
    Height = 21
    Hint = 'Summ4'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '0'
  end
  object edtSumm3: TEdit
    Left = 64
    Top = 112
    Width = 81
    Height = 21
    Hint = 'Summ3'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '0'
  end
  object edtSumm2: TEdit
    Left = 64
    Top = 88
    Width = 81
    Height = 21
    Hint = 'Summ2'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '0'
  end
  object edtSumm1: TEdit
    Left = 64
    Top = 64
    Width = 81
    Height = 21
    Hint = 'Summ1'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '100'
  end
  object cbTax4: TComboBox
    Left = 224
    Top = 136
    Width = 81
    Height = 21
    Hint = 'Tax4'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Items.Strings = (
      '���'
      '1 ������'
      '2 ������'
      '3 ������'
      '4 ������')
  end
  object cbTax3: TComboBox
    Left = 224
    Top = 112
    Width = 81
    Height = 21
    Hint = 'Tax3'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Items.Strings = (
      '���'
      '1 ������'
      '2 ������'
      '3 ������'
      '4 ������')
  end
  object cbTax2: TComboBox
    Left = 224
    Top = 88
    Width = 81
    Height = 21
    Hint = 'Tax2'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Items.Strings = (
      '���'
      '1 ������'
      '2 ������'
      '3 ������'
      '4 ������')
  end
  object cbTax1: TComboBox
    Left = 224
    Top = 64
    Width = 81
    Height = 21
    Hint = 'Tax1'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Items.Strings = (
      '���'
      '1 ������'
      '2 ������'
      '3 ������'
      '4 ������')
  end
end
