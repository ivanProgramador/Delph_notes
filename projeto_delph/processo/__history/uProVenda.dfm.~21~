inherited frmProVenda: TfrmProVenda
  Caption = 'Venda'
  ClientWidth = 1018
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1034
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 1018
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      ExplicitWidth = 1010
      inherited pnlListagemTopo: TPanel
        Width = 1010
        StyleElements = [seFont, seClient, seBorder]
        inherited lblIndice: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited grdListagem: TDBGrid
        Width = 1010
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Width = 474
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Width = 136
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 1010
      object Label4: TLabel
        Left = 176
        Top = 11
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label2: TLabel
        Left = 16
        Top = 63
        Width = 43
        Height = 15
        Caption = 'Produto'
      end
      object edtVendaId: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 140
        Height = 23
        EditLabel.Width = 79
        EditLabel.Height = 15
        EditLabel.Caption = 'Numero Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object lkpCliente: TDBLookupComboBox
        Left = 176
        Top = 32
        Width = 553
        Height = 23
        KeyField = 'clienteId'
        ListField = 'descricao'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 744
        Top = 32
        Width = 121
        Height = 23
        ClickKey = 114
        DialogTitle = 'Selecione a data:'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 112
        Width = 1010
        Height = 370
        Align = alBottom
        TabOrder = 3
        object Panel2: TPanel
          Left = 1
          Top = 328
          Width = 1008
          Height = 41
          Align = alBottom
          TabOrder = 0
          ExplicitLeft = 176
          ExplicitTop = 216
          ExplicitWidth = 185
          object Label1: TLabel
            AlignWithMargins = True
            Left = 812
            Top = 14
            Width = 104
            Height = 16
            Caption = 'Valor da venda: '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValor: TCurrencyEdit
            Left = 922
            Top = 6
            Width = 75
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 42
          Width = 1008
          Height = 286
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 504
          ExplicitTop = 120
          ExplicitWidth = 185
          ExplicitHeight = 41
          object grdItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 1006
            Height = 284
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 1008
          Height = 41
          Align = alTop
          TabOrder = 2
          ExplicitLeft = 232
          ExplicitTop = 72
          ExplicitWidth = 185
        end
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 83
        Width = 473
        Height = 23
        KeyField = 'produtoId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsProdutos
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 504
        Top = 83
        Width = 86
        Height = 23
        DisplayFormat = ',0.00;-R$ ,0.00'
        TabOrder = 5
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 603
        Top = 83
        Width = 94
        Height = 23
        DisplayFormat = ',0.00;-R$ ,0.00'
        TabOrder = 6
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 714
        Top = 83
        Width = 87
        Height = 23
        DisplayFormat = ',0.00;-R$ ,0.00'
        TabOrder = 7
      end
      object BitBtn1: TBitBtn
        Left = 820
        Top = 81
        Width = 187
        Height = 25
        Caption = '&Novo'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
          4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
          B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
          C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
          6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
          53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
          D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
          F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
          0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
          DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
          F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
          C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
          E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
          FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
          C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
          EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
          CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
          F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
          CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
          17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 8
        OnClick = btnNovoClick
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 1018
    StyleElements = [seFont, seClient, seBorder]
    inherited btnFechar: TBitBtn
      Left = 927
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT '
      '  vendas.vendaId,'
      '  vendas.clienteId,'
      '  clientes.nome,'
      '  vendas.dataVenda,'
      '  vendas.totalVenda'
      'FROM '
      '  vendas'
      '  INNER JOIN'
      '  clientes '
      'ON'
      '  clientes.clienteId = vendas.clienteId;')
    Left = 956
    Top = 34
    object qryListagemvendaId: TZIntegerField
      DisplayLabel = 'Numero venda'
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object qryListagemclienteId: TZIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object qryListagemnome: TZUnicodeStringField
      DisplayLabel = 'Nome cliente'
      FieldName = 'nome'
      Size = 100
    end
    object qryListagemdataVenda: TZDateTimeField
      DisplayLabel = 'Data venda'
      FieldName = 'dataVenda'
    end
    object qryListagemtotalVenda: TZFMTBCDField
      DisplayLabel = 'Total da venda'
      FieldName = 'totalVenda'
      Precision = 18
      Size = 5
    end
  end
  inherited dtsListagem: TDataSource
    Left = 896
  end
end
