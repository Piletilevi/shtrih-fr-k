object fmLock: TfmLock
  Left = 307
  Top = 207
  Width = 386
  Height = 264
  Caption = '������ c �����������'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 225
    Height = 161
    Shape = bsFrame
  end
  object lblRepCount2: TLabel
    Left = 16
    Top = 24
    Width = 112
    Height = 13
    Caption = '���������� ��������:'
  end
  object lblRepCount: TLabel
    Left = 144
    Top = 24
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblErrCount2: TLabel
    Left = 16
    Top = 48
    Width = 103
    Height = 13
    Caption = '���������� ������:'
  end
  object lblErrCount: TLabel
    Left = 144
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblSpeed: TLabel
    Left = 16
    Top = 72
    Width = 106
    Height = 13
    Caption = '��������, ������/c:'
  end
  object lblTxSpeed: TLabel
    Left = 144
    Top = 72
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label1: TLabel
    Left = 16
    Top = 120
    Width = 87
    Height = 13
    Caption = '������� ������:'
  end
  object lblErrRate: TLabel
    Left = 144
    Top = 120
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblTimeLeft2: TLabel
    Left = 16
    Top = 144
    Width = 108
    Height = 13
    Caption = '����� �����, ������:'
  end
  object lblTimeLeft: TLabel
    Left = 144
    Top = 144
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 108
    Height = 13
    Caption = '����� �������, ��.:'
  end
  object lblCommandTime: TLabel
    Left = 144
    Top = 96
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnStart: TButton
    Left = 240
    Top = 8
    Width = 75
    Height = 25
    Hint = '������'
    Caption = '������'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 240
    Top = 40
    Width = 75
    Height = 25
    Hint = '��������'
    Caption = '��������'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnStopClick
  end
  object chbStopOnError: TCheckBox
    Left = 8
    Top = 176
    Width = 177
    Height = 17
    Hint = '��������� ��� ������'
    Caption = '��������� ��� ������'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
end
