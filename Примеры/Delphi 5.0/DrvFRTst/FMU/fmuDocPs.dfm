object fmDocPs: TfmDocPs
  Left = 352
  Top = 209
  Width = 472
  Height = 275
  Caption = '������ ��'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrint2: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = '������ ��'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrint: TLabel
    Left = 16
    Top = 32
    Width = 325
    Height = 13
    Caption = '����� �� ������ ����������� ������ ����������� ���������.'
  end
  object Bevel1: TBevel
    Left = 88
    Top = 8
    Width = 373
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object rgInfoType: TRadioGroup
    Left = 184
    Top = 64
    Width = 161
    Height = 89
    Hint = 'InfoType'
    Caption = '���'
    ItemIndex = 2
    Items.Strings = (
      '������ ������������'
      '������ ����������'
      '���')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgIsClearUnfiscalInfo: TRadioGroup
    Left = 16
    Top = 64
    Width = 161
    Height = 89
    Hint = 'IsClearUnfiscalInfo'
    Caption = '������������ ����������'
    ItemIndex = 0
    Items.Strings = (
      '�������'
      '�� �������')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
end
