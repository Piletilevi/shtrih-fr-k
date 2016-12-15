object fmCashControl: TfmCashControl
  Left = 320
  Top = 156
  AutoScroll = False
  Caption = 'CashControl'
  ClientHeight = 326
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    416
    326)
  PixelsPerInch = 96
  TextHeight = 13
  object gbCashControlServer: TGroupBox
    Left = 8
    Top = 8
    Width = 403
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1077#1088#1074#1077#1088' CashControl'
    TabOrder = 0
    DesignSize = (
      403
      313)
    object lblProtocol: TLabel
      Left = 8
      Top = 284
      Width = 52
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083':'
    end
    object lblPort: TLabel
      Left = 176
      Top = 284
      Width = 28
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1086#1088#1090':'
    end
    object Memo: TMemo
      Left = 8
      Top = 24
      Width = 387
      Height = 249
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object rbTCP: TRadioButton
      Left = 72
      Top = 282
      Width = 49
      Height = 17
      Hint = 'TCP'
      Anchors = [akLeft, akBottom]
      Caption = 'TCP'
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
    end
    object rbUDP: TRadioButton
      Left = 120
      Top = 282
      Width = 49
      Height = 17
      Hint = 'UDP'
      Anchors = [akLeft, akBottom]
      Caption = 'UDP'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object edtPort: TEdit
      Left = 216
      Top = 280
      Width = 89
      Height = 21
      Hint = #1055#1086#1088#1090
      Anchors = [akLeft, akBottom]
      MaxLength = 100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '4000'
    end
    object btnOpenPort: TBitBtn
      Left = 320
      Top = 280
      Width = 35
      Height = 25
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1088#1090
      Anchors = [akLeft, akBottom]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnOpenPortClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFFF0000FFFFFFFFFFFF00000F
        FFFFFFFFFF0000FFFFFFFFFFFF000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnClosePort: TBitBtn
      Left = 360
      Top = 280
      Width = 33
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1086#1088#1090
      Anchors = [akLeft, akBottom]
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnClosePortClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000
        FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
end
