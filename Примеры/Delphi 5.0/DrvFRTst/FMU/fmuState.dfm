object fmState: TfmState
  Left = 329
  Top = 173
  Width = 399
  Height = 353
  Caption = '���������'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 385
    Height = 289
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object btnShortECRState: TButton
    Left = 271
    Top = 296
    Width = 114
    Height = 25
    Hint = 'GetShortECRStatus'
    Anchors = [akRight, akBottom]
    Caption = '������� ������'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnShortECRStateClick
  end
  object btnECRState: TButton
    Left = 151
    Top = 296
    Width = 114
    Height = 25
    Hint = 'GetECRStatus'
    Anchors = [akRight, akBottom]
    Caption = '��������� ���'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnECRStateClick
  end
end
