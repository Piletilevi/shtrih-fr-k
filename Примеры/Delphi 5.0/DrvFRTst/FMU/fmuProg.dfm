object fmProg: TfmProg
  Left = 239
  Top = 176
  Width = 479
  Height = 338
  Caption = '����������������'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object rgPointPosition: TRadioGroup
    Left = 8
    Top = 240
    Width = 153
    Height = 65
    Hint = 'PointPosition'
    Caption = '���������� �����'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      '0 ������'
      '2 �����')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object gbDate: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 113
    Caption = '����'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnMouseMove = FormMouseMove
    object dtpDate: TDateTimePicker
      Left = 16
      Top = 16
      Width = 113
      Height = 21
      Hint = 'Date'
      CalAlignment = dtaLeft
      Date = 37963.7171785417
      Time = 37963.7171785417
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnCurrentDate: TButton
      Left = 136
      Top = 16
      Width = 137
      Height = 25
      Hint = '������� ����'
      Caption = '������� ����'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCurrentDateClick
      OnMouseMove = btnCurrentDateMouseMove
    end
    object btnConfirmDate: TButton
      Left = 136
      Top = 80
      Width = 137
      Height = 25
      Hint = 'ConfirmDate'
      Caption = '����������� ����'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnConfirmDateClick
      OnMouseMove = btnSetDateMouseMove
    end
    object btnSetDate: TBitBtn
      Left = 136
      Top = 48
      Width = 137
      Height = 25
      Hint = 'SetDate'
      Anchors = [akTop, akRight]
      Caption = '���������� ����'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSetDateClick
      OnMouseMove = btnSetDateMouseMove
      NumGlyphs = 2
    end
  end
  object gbTime: TGroupBox
    Left = 8
    Top = 128
    Width = 281
    Height = 105
    Caption = '�����'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnMouseMove = FormMouseMove
    object dtpTime: TDateTimePicker
      Left = 16
      Top = 16
      Width = 113
      Height = 21
      Hint = 'Time'
      CalAlignment = dtaLeft
      Date = 37963.7163174653
      Time = 37963.7163174653
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkTime
      ParseInput = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnCurrentTime: TButton
      Left = 136
      Top = 16
      Width = 137
      Height = 25
      Hint = '������� �����'
      Caption = '������� �����'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCurrentTimeClick
      OnMouseMove = btnCurrentTimeMouseMove
    end
    object btnSetTime: TBitBtn
      Left = 136
      Top = 48
      Width = 137
      Height = 25
      Hint = 'SetTime'
      Anchors = [akTop, akRight]
      Caption = '���������� �����'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSetTimeClick
      OnMouseMove = btnSetTimeMouseMove
      NumGlyphs = 2
    end
  end
  object gbSerialNumber: TGroupBox
    Left = 296
    Top = 8
    Width = 169
    Height = 113
    Caption = '��������� �����'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnMouseMove = FormMouseMove
    object edtSerialNumber: TEdit
      Left = 16
      Top = 16
      Width = 145
      Height = 21
      Hint = 'SerialNumber'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '0'
    end
    object btnSetSerialNumber: TBitBtn
      Left = 54
      Top = 40
      Width = 107
      Height = 25
      Hint = 'SetSerialNumber'
      Anchors = [akTop, akRight]
      Caption = '��������'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnSetSerialNumberClick
      OnMouseMove = btnSetSerialNumberMouseMove
      NumGlyphs = 2
    end
  end
  object gbLicense: TGroupBox
    Left = 296
    Top = 128
    Width = 169
    Height = 105
    Hint = '���������'
    Caption = '��������'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnMouseMove = FormMouseMove
    object edtLicense: TEdit
      Left = 16
      Top = 16
      Width = 145
      Height = 21
      Hint = 'License'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '0'
    end
    object btnReadLicense: TBitBtn
      Left = 54
      Top = 40
      Width = 107
      Height = 25
      Hint = 'ReadLicense'
      Anchors = [akTop, akRight]
      Caption = '���������'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnReadLicenseClick
      OnMouseMove = btnReadLicenseMouseMove
      NumGlyphs = 2
    end
    object btnWriteLicense: TBitBtn
      Left = 54
      Top = 72
      Width = 107
      Height = 25
      Hint = 'WriteLicense'
      Anchors = [akTop, akRight]
      Caption = '��������'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnWriteLicenseClick
      OnMouseMove = btnWriteLicenseMouseMove
      NumGlyphs = 2
    end
  end
  object btnSetPointPosition: TBitBtn
    Left = 168
    Top = 248
    Width = 193
    Height = 25
    Hint = 'SetPointPosition'
    Caption = '���������� ��������� �����'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnSetPointPositionClick
    OnMouseMove = btnSetPointPositionMouseMove
    NumGlyphs = 2
  end
end
