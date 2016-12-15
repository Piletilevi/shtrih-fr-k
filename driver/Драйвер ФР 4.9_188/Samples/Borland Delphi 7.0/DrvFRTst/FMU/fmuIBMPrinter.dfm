object fmIBMPrinter: TfmIBMPrinter
  Left = 298
  Top = 206
  AutoScroll = False
  Caption = #1055#1088#1080#1085#1090#1077#1088' IBM'
  ClientHeight = 183
  ClientWidth = 389
  Color = clBtnFace
  Constraints.MinHeight = 211
  Constraints.MinWidth = 397
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    389
    183)
  PixelsPerInch = 96
  TextHeight = 13
  object btnGetShortIBMStatus: TButton
    Left = 280
    Top = 40
    Width = 105
    Height = 25
    Hint = 'GetShortIBMStatus'
    Anchors = [akTop, akRight]
    Caption = #1050#1088#1072#1090#1082#1080#1081' '#1079#1072#1087#1088#1086#1089
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGetShortIBMStatusClick
  end
  object Memo: TMemo
    Left = 8
    Top = 8
    Width = 265
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object btnGetIBMStatus: TButton
    Left = 280
    Top = 8
    Width = 105
    Height = 25
    Hint = 'GetIBMStatus'
    Anchors = [akTop, akRight]
    Caption = #1044#1083#1080#1085#1085#1099#1081' '#1079#1072#1087#1088#1086#1089
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnGetIBMStatusClick
  end
  object btnClear: TBitBtn
    Left = 280
    Top = 72
    Width = 105
    Height = 25
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnClearClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000130B0000130B00000000000000000000D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3000000000000
      000000000000000000000000000000000000D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D380808080808080808080808080808080808080808080
      8080D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000D3D3D3D2D2D2D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
      8080808080D3D3D3D2D2D2D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
      8080FFFFFF808080D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3000000000000
      000000000000000000000000000000000000FFFFFFFFFFFF000000D3D3D3D3D3
      D3D3D3D3D4D4D4D3D3D380808080808080808080808080808080808080808080
      8080FFFFFFFFFFFF808080D3D3D3D3D3D3D3D3D3D4D4D4D3D3D3D3D3D3000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF808080FFFFFFFFFFFF808080D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      000000FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF0000
      00D4D4D4D3D3D3D3D3D3D3D3D3D3D3D3808080FEFEFEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF808080FFFFFFFFFFFF808080D4D4D4D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
      FF000000D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3808080FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FFFFFFFF000000D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3808080FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080D3D3D3D3D3D3D3D3D3
      D3D3D3D2D2D2D3D3D3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00FFFFFF000000D3D3D3D3D3D3D3D3D3D3D3D3D2D2D2D3D3D3808080FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF000000000000D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3808080FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D4D4D4D3D3D30000000000000000000000000000000000
      00000000000000D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D4D4D4D3D3D380
      8080808080808080808080808080808080808080808080D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3}
    Margin = 5
    NumGlyphs = 2
  end
end
