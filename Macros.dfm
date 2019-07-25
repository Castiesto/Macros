object Form1: TForm1
  Left = 832
  Top = 0
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = #1050#1083#1080#1082#1077#1088' v1.0'
  ClientHeight = 325
  ClientWidth = 383
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Capt: TButton
    Left = 0
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Settings'
    TabOrder = 0
    OnClick = CaptClick
  end
  object clicker: TTimer
    Enabled = False
    OnTimer = clickerTimer
    Left = 248
    Top = 56
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 248
    Top = 104
  end
end
