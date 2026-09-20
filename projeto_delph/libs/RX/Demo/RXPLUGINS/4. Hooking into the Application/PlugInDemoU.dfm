object Form1: TForm1
  Left = 332
  Top = 165
  Caption = 'Sample Plugin Host Application'
  ClientHeight = 245
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 29
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ExplicitWidth = 413
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 226
    Width = 405
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 211
    ExplicitWidth = 413
  end
  object ListBox1: TListBox
    Left = 0
    Top = 29
    Width = 405
    Height = 197
    Align = alClient
    ItemHeight = 13
    TabOrder = 2
  end
  object uilPluginManager: TRxPluginManager
    Extension = 'dll'
    Left = 44
    Top = 44
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 44
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Plugin1: TMenuItem
      Caption = '&Plug-in'
      object GenerateExecption1: TMenuItem
        Caption = 'Generate Exception'
        OnClick = GenerateExecption1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
end
