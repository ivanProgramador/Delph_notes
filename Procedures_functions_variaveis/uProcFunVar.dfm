object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Delph'
  ClientHeight = 459
  ClientWidth = 729
  Color = clGray
  TransparentColorValue = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object btnPrimeiro: TButton
    Left = 24
    Top = 8
    Width = 265
    Height = 25
    Caption = 'visualizar valores'
    TabOrder = 0
    OnClick = btnPrimeiroClick
  end
  object btnSegundo: TButton
    Left = 472
    Top = 8
    Width = 225
    Height = 25
    Caption = 'Passagem de parametros'
    TabOrder = 1
    OnClick = btnSegundoClick
  end
  object memo: TMemo
    Left = 24
    Top = 56
    Width = 673
    Height = 377
    Lines.Strings = (
      '')
    TabOrder = 2
  end
end
