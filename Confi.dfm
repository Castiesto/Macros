object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 308
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 29
    Height = 13
    Caption = #1058#1077#1082#1089#1090
  end
  object Button1: TButton
    Left = 219
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 149
    Top = 24
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = #1050#1088#1080#1095#1072#1097#1080#1081' '#1090#1077#1082#1089#1090
    Items.Strings = (
      #1050#1088#1080#1095#1072#1097#1080#1081' '#1090#1077#1082#1089#1090
      #1052#1072#1082#1088#1086#1089
      #1051#1086#1075' '#1084#1099#1096#1080
      #1050#1083#1080#1082#1077#1088)
  end
  object Edit1: TEdit
    Left = 8
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
