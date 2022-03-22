inherited fCad_Configuracao: TfCad_Configuracao
  Caption = 'Configura'#231#245'es do Sistema'
  ClientHeight = 628
  Font.Name = 'Segoe UI'
  Font.Style = []
  ExplicitTop = -96
  ExplicitWidth = 800
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 573
    ActivePage = TabSheet9
    ExplicitHeight = 573
    inherited tabCadastro: TTabSheet
      Caption = '&1.Empresa'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 545
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 786
        Height = 545
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 0
        object TabSheet5: TTabSheet
          HelpType = htKeyword
          Caption = 'Configura'#231#245'es'
          object GroupBox10: TGroupBox
            Left = 5
            Top = 67
            Width = 250
            Height = 80
            Caption = 'Sistema'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object ckSim: TCheckBox
              Left = 8
              Top = 34
              Width = 226
              Height = 17
              Caption = 'Enviar estat'#237'stica de uso do Sistema'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 1
            end
            object DBCheckBox1: TDBCheckBox
              Left = 8
              Top = 17
              Width = 174
              Height = 17
              Caption = '&Reporta Erros do Sistema'
              DataField = 'CSIS_REPORTA_ERROS'
              DataSource = dmConfiguracao.dsConfiguracao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 778
            Height = 62
            Align = alTop
            Caption = 'Empresa'
            TabOrder = 0
            object Label1: TLabel
              Left = 6
              Top = 15
              Width = 38
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = edtCod_Empr
              Transparent = True
            end
            object Label2: TLabel
              Left = 111
              Top = 15
              Width = 43
              Height = 13
              Caption = 'Empresa'
              FocusControl = DBEdit2
              Transparent = True
            end
            object Label7: TLabel
              Left = 623
              Top = 15
              Width = 25
              Height = 13
              Caption = 'CNPJ'
              FocusControl = DBEdit1
              Transparent = True
            end
            object edtCod_Empr: TDBEdit
              Left = 6
              Top = 31
              Width = 100
              Height = 21
              TabStop = False
              Color = clGradientInactiveCaption
              DataField = 'CSIS_EMPR_ID'
              DataSource = dmConfiguracao.dsConfiguracao
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 111
              Top = 31
              Width = 507
              Height = 21
              TabStop = False
              Color = clGradientInactiveCaption
              DataField = 'EMPR_RAZAO_SOCIAL'
              DataSource = dmConfiguracao.dsConfiguracao
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit1: TDBEdit
              Left = 623
              Top = 31
              Width = 150
              Height = 21
              TabStop = False
              Color = clGradientInactiveCaption
              DataField = 'EMPR_CNPJ'
              DataSource = dmConfiguracao.dsConfiguracao
              ReadOnly = True
              TabOrder = 2
            end
          end
          object GroupBox11: TGroupBox
            Left = 264
            Top = 67
            Width = 250
            Height = 80
            Caption = 'Financeiro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object DBCheckBox2: TDBCheckBox
              Left = 8
              Top = 17
              Width = 217
              Height = 17
              Caption = '&Visualizar Dados Financeiros'
              DataField = 'CSIS_VISUAL_FINANCEIRO'
              DataSource = dmConfiguracao.dsConfiguracao
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 523
            Top = 67
            Width = 250
            Height = 80
            Caption = 'Tipo Menu'
            DataField = 'CSIS_TIPO_MENU'
            DataSource = dmConfiguracao.dsConfiguracao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Items.Strings = (
              'Menu Vertical'
              'Menu Horizontal')
            ParentFont = False
            TabOrder = 3
            Values.Strings = (
              '2'
              '1')
          end
          object DBCheckBox16: TDBCheckBox
            Left = 5
            Top = 153
            Width = 250
            Height = 17
            Caption = 'Replica Cad. Cliente/Fornecedor'
            DataField = 'CSIS_REPLICA_CLIENTE_FORNECEDOR'
            DataSource = dmConfiguracao.dsConfiguracao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox17: TDBCheckBox
            Left = 5
            Top = 169
            Width = 250
            Height = 17
            Caption = 'Ocultar Clientes (Cad. Clientes)'
            DataField = 'CSIS_OCULTA_CLIENTES'
            DataSource = dmConfiguracao.dsConfiguracao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Financeiro'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 5
        Top = 5
        Width = 251
        Height = 60
        Caption = '&Juro e Mora Padr'#227'o'
        TabOrder = 0
        object Label3: TLabel
          Left = 62
          Top = 15
          Width = 42
          Height = 13
          Caption = 'Multa %'
        end
        object Label4: TLabel
          Left = 171
          Top = 15
          Width = 39
          Height = 13
          Caption = 'Mora %'
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 8
          Top = 30
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_JURO'
          DataSource = dmConfiguracao.dsConfiguracao
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object RxDBCalcEdit2: TRxDBCalcEdit
          Left = 115
          Top = 30
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_MORA'
          DataSource = dmConfiguracao.dsConfiguracao
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 266
        Top = 5
        Width = 251
        Height = 60
        Caption = 'Aviso % de &Comprometimento da Renda'
        TabOrder = 1
        object edtVlrRenda: TRxDBCalcEdit
          Left = 8
          Top = 30
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_PERCENTE_RENDA'
          DataSource = dmConfiguracao.dsConfiguracao
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = edtVlrRendaKeyPress
        end
      end
      object GroupBox13: TGroupBox
        Left = 528
        Top = 5
        Width = 251
        Height = 60
        Caption = 'Meta para o Ano'
        TabOrder = 2
        object RxDBCalcEdit4: TRxDBCalcEdit
          Left = 8
          Top = 30
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_VLR_META_ANO'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object DBCheckBox12: TDBCheckBox
        Left = 5
        Top = 487
        Width = 340
        Height = 17
        Caption = 'Filtrar registros pelo Plano de Contas Principal (Default)'
        DataField = 'CSIS_FILTRAR_PLANO_CONTAS_PAI'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox13: TDBCheckBox
        Left = 5
        Top = 504
        Width = 356
        Height = 17
        Caption = 'Vincular Cart'#227'o de Cr'#233'dito/D'#233'bito (C. Pagar / C. Receber)'
        DataField = 'CSIS_VINCULAR_CARTAO_CREDITO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object GroupBox6: TGroupBox
        Left = 5
        Top = 67
        Width = 774
        Height = 132
        Caption = 'Fundos de Reserva (%)'
        TabOrder = 3
        object Label5: TLabel
          Left = 7
          Top = 26
          Width = 163
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. de Reserva Livre :'
        end
        object Label8: TLabel
          Left = 7
          Top = 52
          Width = 163
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. de Reserva de Lucro :'
        end
        object Label6: TLabel
          Left = 279
          Top = 52
          Width = 156
          Height = 13
          Caption = '* Aplicado sobre Receita Bruta'
        end
        object Label10: TLabel
          Left = 7
          Top = 79
          Width = 163
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. de Reserva de Legal :'
        end
        object Label11: TLabel
          Left = 279
          Top = 79
          Width = 252
          Height = 13
          Caption = '* Aplicado sobre Receita L'#237'quida (Limitado a 20%)'
        end
        object Label12: TLabel
          Left = 7
          Top = 106
          Width = 163
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'F. de Reserva Estatut'#225'rias :'
        end
        object RxDBCalcEdit5: TRxDBCalcEdit
          Left = 173
          Top = 22
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_PERC_FUNDO_RESERVA'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBCheckBox14: TDBCheckBox
          Left = 279
          Top = 24
          Width = 183
          Height = 17
          Caption = 'Aplicar sobre Receita L'#237'quida'
          DataField = 'CSIS_APLICA_FDR_VLR_LIQUIDO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object RxDBCalcEdit6: TRxDBCalcEdit
          Left = 173
          Top = 47
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_PERC_RESERVA_LUCRO'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
        object RxDBCalcEdit7: TRxDBCalcEdit
          Left = 173
          Top = 75
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_PERC_RESERVA_LEGAL'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          MaxValue = 20.000000000000000000
          NumGlyphs = 2
          TabOrder = 3
        end
        object RxDBCalcEdit8: TRxDBCalcEdit
          Left = 173
          Top = 102
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_PERC_RESERVA_ESTATUTARIAS'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 4
        end
        object DBCheckBox15: TDBCheckBox
          Left = 279
          Top = 104
          Width = 183
          Height = 17
          Caption = 'Aplicar sobre Receita L'#237'quida'
          DataField = 'CSIS_APLICA_FDE_VLR_LIQUIDO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GroupBox9: TGroupBox
        Left = 5
        Top = 203
        Width = 774
        Height = 135
        Caption = 'Opera'#231#245'es c/ Cart'#245'es de Cr'#233'dito'
        TabOrder = 4
        object Label18: TLabel
          Left = 20
          Top = 24
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa de Opera'#231#227'o:'
        end
        object Label19: TLabel
          Left = 246
          Top = 24
          Width = 121
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias p/ Cr'#233'd. em Conta:'
        end
        object RxDBCalcEdit9: TRxDBCalcEdit
          Left = 118
          Top = 20
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_TX_CREDITO'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object RxDBCalcEdit10: TRxDBCalcEdit
          Left = 372
          Top = 20
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_DIAS_DEP_CREDITO'
          DataSource = dmConfiguracao.dsConfiguracao
          DecimalPlaces = 0
          DisplayFormat = '00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
        inline frPesqContaCredito: TfrPesqIndividual
          Left = 4
          Top = 47
          Width = 767
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 4
          ExplicitTop = 47
          ExplicitWidth = 767
          inherited Label2: TLabel
            Width = 78
            Caption = 'Conta Banc'#225'ria'
            ExplicitWidth = 78
          end
          inherited Label3: TLabel
            Left = -500
            Width = 59
            Caption = 'Saldo Atual'
            ExplicitLeft = -500
            ExplicitWidth = 59
          end
          inherited Label4: TLabel
            Left = -500
            Width = 30
            Caption = 'Limite'
            ExplicitLeft = -500
            ExplicitWidth = 30
          end
          inherited edtDescricao: TEdit
            Width = 500
            ExplicitWidth = 500
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 8
          end
          inherited ckOmitir: TCheckBox
            Left = -500
            Width = 133
            ExplicitLeft = -500
            ExplicitWidth = 133
          end
          inherited edtOpcao: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited edtOpcao1: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
        inline frPesqCartaoCredito: TfrPesqIndividual
          Left = 4
          Top = 87
          Width = 767
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 4
          ExplicitTop = 87
          ExplicitWidth = 767
          inherited Label2: TLabel
            Width = 87
            Caption = 'Operador Cart'#227'o'
            ExplicitWidth = 87
          end
          inherited Label3: TLabel
            Left = -500
            Width = 59
            Caption = 'Saldo Atual'
            ExplicitLeft = -500
            ExplicitWidth = 59
          end
          inherited Label4: TLabel
            Left = -500
            Width = 30
            Caption = 'Limite'
            ExplicitLeft = -500
            ExplicitWidth = 30
          end
          inherited edtDescricao: TEdit
            Width = 500
            ExplicitWidth = 500
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 1
          end
          inherited ckOmitir: TCheckBox
            Left = -500
            Width = 133
            ExplicitLeft = -500
            ExplicitWidth = 133
          end
          inherited edtOpcao: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited edtOpcao1: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
      end
      object DBCheckBox18: TDBCheckBox
        Left = 5
        Top = 521
        Width = 252
        Height = 17
        Caption = 'Emitir Recibo nas Baixas Pagto Parciais'
        DataField = 'CSIS_RECIBO_PGTOPARCIAL'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object GroupBox14: TGroupBox
        Left = 5
        Top = 345
        Width = 774
        Height = 135
        Caption = 'Opera'#231#245'es c/ Cart'#245'es de D'#233'bito'
        TabOrder = 5
        object Label20: TLabel
          Left = 20
          Top = 24
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa de Opera'#231#227'o:'
        end
        object Label21: TLabel
          Left = 246
          Top = 24
          Width = 121
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias p/ Cr'#233'd. em Conta:'
        end
        object RxDBCalcEdit11: TRxDBCalcEdit
          Left = 118
          Top = 20
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_TX_DEBITO'
          DataSource = dmConfiguracao.dsConfiguracao
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          MaxValue = 20.000000000000000000
          NumGlyphs = 2
          TabOrder = 0
        end
        object RxDBCalcEdit12: TRxDBCalcEdit
          Left = 372
          Top = 20
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'CSIS_DIAS_DEP_DEBITO'
          DataSource = dmConfiguracao.dsConfiguracao
          DecimalPlaces = 0
          DisplayFormat = '00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
        inline frPesqContaDebito: TfrPesqIndividual
          Left = 3
          Top = 47
          Width = 767
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 3
          ExplicitTop = 47
          ExplicitWidth = 767
          inherited Label2: TLabel
            Width = 78
            Caption = 'Conta Banc'#225'ria'
            ExplicitWidth = 78
          end
          inherited Label3: TLabel
            Left = -500
            Width = 59
            Caption = 'Saldo Atual'
            ExplicitLeft = -500
            ExplicitWidth = 59
          end
          inherited Label4: TLabel
            Left = -500
            Width = 30
            Caption = 'Limite'
            ExplicitLeft = -500
            ExplicitWidth = 30
          end
          inherited edtDescricao: TEdit
            Width = 500
            ExplicitWidth = 500
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 8
          end
          inherited ckOmitir: TCheckBox
            Left = -500
            Width = 133
            ExplicitLeft = -500
            ExplicitWidth = 133
          end
          inherited edtOpcao: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited edtOpcao1: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
        inline frPesqCartaoDebito: TfrPesqIndividual
          Left = 3
          Top = 87
          Width = 767
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 3
          ExplicitTop = 87
          ExplicitWidth = 767
          inherited Label2: TLabel
            Width = 87
            Caption = 'Operador Cart'#227'o'
            ExplicitWidth = 87
          end
          inherited Label3: TLabel
            Left = -500
            Width = 59
            Caption = 'Saldo Atual'
            ExplicitLeft = -500
            ExplicitWidth = 59
          end
          inherited Label4: TLabel
            Left = -500
            Width = 30
            Caption = 'Limite'
            ExplicitLeft = -500
            ExplicitWidth = 30
          end
          inherited edtDescricao: TEdit
            Width = 500
            ExplicitWidth = 500
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 1
          end
          inherited ckOmitir: TCheckBox
            Left = -500
            Width = 133
            ExplicitLeft = -500
            ExplicitWidth = 133
          end
          inherited edtOpcao: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited edtOpcao1: TEdit
            Left = -500
            ExplicitLeft = -500
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
      end
      object DBCheckBox19: TDBCheckBox
        Left = 389
        Top = 487
        Width = 386
        Height = 17
        Caption = 'Solicitar Nr'#186' da Transa'#231#227'o (Pagamento Cart'#227'o)'
        DataField = 'CSIS_SOLICITA_NR_TRANSACAO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Estoque'
      ImageIndex = 2
      object DBCheckBox3: TDBCheckBox
        Left = 8
        Top = 15
        Width = 329
        Height = 17
        Caption = 'Permite Estoque Negativo de Produtos'
        DataField = 'CSIS_ESTOQUE_NEGATIVO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&4.Vendas'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 65
        Align = alTop
        Caption = 'Cliente Padr'#227'o do Sistema'
        TabOrder = 0
        inline frPesqCliente: TfrPesqIndividual
          Left = 5
          Top = 15
          Width = 778
          Height = 43
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 15
          ExplicitWidth = 778
          ExplicitHeight = 43
          inherited Label2: TLabel
            Left = 176
            Width = 36
            Caption = 'Cliente'
            ExplicitLeft = 176
            ExplicitWidth = 36
          end
          inherited btnPesquisar: TSpeedButton
            Left = 106
            ExplicitLeft = 106
          end
          inherited btnInserir: TSpeedButton
            Left = 140
            ExplicitLeft = 140
          end
          inherited Label3: TLabel
            Left = 1021
            ExplicitLeft = 1021
          end
          inherited Label4: TLabel
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
          end
          inherited edtDescricao: TEdit
            Left = 176
            Width = 599
            ExplicitLeft = 176
            ExplicitWidth = 599
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 0
          end
          inherited ckOmitir: TCheckBox
            Left = 922
            ExplicitLeft = 922
          end
          inherited edtOpcao: TEdit
            Left = 1021
            TabOrder = 0
            ExplicitLeft = 1021
          end
          inherited edtOpcao1: TEdit
            Left = 1098
            ExplicitLeft = 1098
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 65
        Width = 786
        Height = 65
        Align = alTop
        Caption = 'Tabela de Pre'#231'o Padr'#227'o do Sistema'
        TabOrder = 1
        inline frPesqTabPrecos: TfrPesqIndividual
          Left = 5
          Top = 15
          Width = 778
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 15
          ExplicitWidth = 778
          ExplicitHeight = 42
          inherited Label2: TLabel
            Width = 80
            Caption = 'Tabela de Pre'#231'o'
            ExplicitWidth = 80
          end
          inherited Label3: TLabel
            Left = 973
            ExplicitLeft = 973
          end
          inherited Label4: TLabel
            Left = 1050
            ExplicitLeft = 1050
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
          end
          inherited edtDescricao: TEdit
            Width = 599
            ExplicitWidth = 599
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 9
          end
          inherited ckOmitir: TCheckBox
            Left = 874
            ExplicitLeft = 874
          end
          inherited edtOpcao: TEdit
            Left = 973
            TabOrder = 0
            ExplicitLeft = 973
          end
          inherited edtOpcao1: TEdit
            Left = 1050
            ExplicitLeft = 1050
          end
        end
      end
      object DBCheckBox8: TDBCheckBox
        Left = 8
        Top = 136
        Width = 186
        Height = 17
        Caption = 'Controla Limite de Cr'#233'dito?'
        DataField = 'CSIS_CONTROLA_LIMITE_CREDITO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&5.Servi'#231'os'
      ImageIndex = 4
      object Label9: TLabel
        Left = 645
        Top = 95
        Width = 124
        Height = 13
        Caption = 'Dias p/ Reagendamento'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 5
        Top = 72
        Width = 289
        Height = 17
        Caption = 'Solicitar Novo Agendamento  (Real./Pago)'
        DataField = 'CSIS_REAGENDAR_OS'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox4Click
      end
      object DBCheckBox5: TDBCheckBox
        Left = 5
        Top = 90
        Width = 289
        Height = 17
        Caption = 'For'#231'ar Reagendamento'
        DataField = 'CSIS_FORCAR_REAGENDA'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
      object RxDBCalcEdit3: TRxDBCalcEdit
        Left = 645
        Top = 111
        Width = 140
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CFOS_DIAS_REAGENDAMENTO'
        DataSource = dmConfiguracao.dsConfOS
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
      object DBCheckBox9: TDBCheckBox
        Left = 5
        Top = 109
        Width = 289
        Height = 17
        Caption = 'Apresentar mensagem rodap'#233' da O.S.'
        DataField = 'CFOS_MENSAGEM_RODAPE'
        DataSource = dmConfiguracao.dsConfOS
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
      object GroupBox12: TGroupBox
        Left = 0
        Top = 3
        Width = 783
        Height = 65
        Caption = 'T'#233'cnico para Re-Agendamento'
        TabOrder = 0
        inline frPesqTecnicoOS: TfrPesqIndividual
          Left = 6
          Top = 15
          Width = 763
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 6
          ExplicitTop = 15
          ExplicitWidth = 763
          inherited Label2: TLabel
            Width = 38
            Caption = 'T'#233'cnico'
            ExplicitWidth = 38
          end
          inherited Label3: TLabel
            Left = 813
            ExplicitLeft = 813
          end
          inherited Label4: TLabel
            Left = 866
            ExplicitLeft = 866
          end
          inherited edtDescricao: TEdit
            Width = 586
            ExplicitWidth = 586
          end
          inherited rdOpcoes: TRadioGroup
            Left = -254
            Top = 22
            ItemIndex = 11
            ExplicitLeft = -254
            ExplicitTop = 22
          end
          inherited ckOmitir: TCheckBox
            Left = 818
            ExplicitLeft = 818
          end
          inherited edtOpcao: TEdit
            Left = 821
            ExplicitLeft = 821
          end
          inherited edtOpcao1: TEdit
            Left = 826
            ExplicitLeft = 826
          end
        end
      end
      object DBCheckBox6: TDBCheckBox
        Left = 5
        Top = 127
        Width = 289
        Height = 17
        Caption = 'Solicitar Tipo de Agendamento na O.S.'
        DataField = 'CSIS_TRAB_TIPO_AGENDAMENTO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
      object DBCheckBox7: TDBCheckBox
        Left = 5
        Top = 146
        Width = 289
        Height = 17
        Caption = 'Solicitar Nr'#186' Pedido/Fabricante/S'#233'rie'
        DataField = 'CSIS_INFORMA_NR_PEDIDO'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
      object DBCheckBox10: TDBCheckBox
        Left = 5
        Top = 164
        Width = 289
        Height = 17
        Caption = 'Solicitar Fornecedor Equipamento do Cliente'
        DataField = 'CSIS_TRAB_FORNEC_EQUIP'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
      object DBCheckBox11: TDBCheckBox
        Left = 5
        Top = 183
        Width = 289
        Height = 17
        Caption = 'Permite Informar Status da O.S.'
        DataField = 'CSIS_TRAB_STATUS_OS'
        DataSource = dmConfiguracao.dsConfiguracao
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBCheckBox5Click
      end
    end
    object TabSheet8: TTabSheet
      Caption = '&6.Agenda'
      ImageIndex = 7
      object GroupBox7: TGroupBox
        Left = 2
        Top = 2
        Width = 257
        Height = 70
        Caption = 'Expediente'
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 21
          Width = 28
          Height = 13
          Caption = 'Inicio'
        end
        object Label14: TLabel
          Left = 91
          Top = 21
          Width = 41
          Height = 13
          Caption = 'Termino'
        end
        object Label15: TLabel
          Left = 171
          Top = 21
          Width = 45
          Height = 13
          Caption = 'Intervalo'
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 38
          Width = 75
          Height = 21
          DataField = 'CSIS_INICIO_TRABALHO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 91
          Top = 38
          Width = 75
          Height = 21
          DataField = 'CSIS_FINAL_TRABALHO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 171
          Top = 38
          Width = 75
          Height = 21
          DataField = 'CSIS_INTERVALO_HORARIO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 2
        end
      end
      object GroupBox8: TGroupBox
        Left = 266
        Top = 2
        Width = 177
        Height = 70
        Caption = 'Hor'#225'rio de Almo'#231'o'
        TabOrder = 1
        object Label16: TLabel
          Left = 5
          Top = 21
          Width = 28
          Height = 13
          Caption = 'Inicio'
        end
        object Label17: TLabel
          Left = 93
          Top = 21
          Width = 18
          Height = 13
          Caption = 'Fim'
        end
        object DBEdit6: TDBEdit
          Left = 5
          Top = 37
          Width = 75
          Height = 21
          DataField = 'CSIS_HR_ALMOCO_INICIO'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 93
          Top = 37
          Width = 75
          Height = 21
          DataField = 'CSIS_HR_ALMOCO_FIM'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 1
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = '&7.Tele-Atendimento'
      ImageIndex = 5
      object DBRadioGroup2: TDBRadioGroup
        Left = 5
        Top = 5
        Width = 250
        Height = 45
        Caption = 'Separar Atendimentos por Atendente'
        Columns = 2
        DataField = 'CSIS_SEPARAR_TELEATENDIMENTO'
        DataSource = dmConfiguracao.dsConfiguracao
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
      end
    end
    object TabSheet7: TTabSheet
      Caption = '&8.IRPF'
      ImageIndex = 6
      object ctgpIRPF: TCategoryPanelGroup
        Left = 0
        Top = 0
        Width = 786
        Height = 545
        VertScrollBar.Tracking = True
        Align = alClient
        ChevronHotColor = clWindow
        Color = clWindow
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        TabOrder = 0
        object CategoryPanel13: TCategoryPanel
          Top = 330
          Height = 30
          Caption = 
            '12 - Doa'#231#245'es a Partidos Pol'#237'ticos, Comit'#234's Financeiros e Candida' +
            'tos a Cargos Eletivos'
          Color = clWindow
          Collapsed = True
          TabOrder = 0
          ExpandedHeight = 213
          inline frPesq_13_DoacoesPartidos: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Doa'#231#245'es a Partidos Pol'#237'ticos'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel12: TCategoryPanel
          Top = 300
          Height = 30
          Caption = '11 - D'#237'vidas e '#212'nus Reais'
          Color = clWindow
          Collapsed = True
          TabOrder = 1
          ExpandedHeight = 213
          inline frPesq_12_DividasOnus: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'D'#237'vidas e '#212'nus Reais'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel11: TCategoryPanel
          Top = 270
          Height = 30
          Caption = '10 - Bens e Direitos'
          Color = clWindow
          Collapsed = True
          TabOrder = 2
          ExpandedHeight = 213
          inline frPesq_11_BensDireito: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Bens e Direitos'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel10: TCategoryPanel
          Top = 240
          Height = 30
          Caption = '09 - Doa'#231#245'es Efetuadas'
          Color = clWindow
          Collapsed = True
          TabOrder = 3
          ExpandedHeight = 213
          inline frPesq_10_DoacoesEfetuadas: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Doa'#231#245'es Efetuadas'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel9: TCategoryPanel
          Top = 210
          Height = 30
          Caption = '08 - Pegamentos Efetuados'
          Color = clWindow
          Collapsed = True
          TabOrder = 4
          ExpandedHeight = 213
          inline frPesq_09_PagamentosEfetuados: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Pagamentos Efetuados'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel8: TCategoryPanel
          Top = 180
          Height = 30
          Caption = '07 - Imposto Pago/Retido'
          Color = clWindow
          Collapsed = True
          TabOrder = 5
          ExpandedHeight = 213
          inline frPesq_08_ImpostoPagoRetido: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Imposto Pago/Retido'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel7: TCategoryPanel
          Top = 150
          Height = 30
          Caption = '06 - Rendimentos Recebidos Acumuladamente'
          Color = clWindow
          Collapsed = True
          TabOrder = 6
          ExpandedHeight = 213
          inline frPesq_07_RendimentoRecebidosAcumuladamente: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Recebidos Acumuladamente'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel6: TCategoryPanel
          Top = 120
          Height = 30
          Caption = 
            '05 - Rendimentos Trib. Receb. de PJ pelo Tituloar com Exigibilid' +
            'ade Suspensa'
          Color = clWindow
          Collapsed = True
          TabOrder = 7
          ExpandedHeight = 213
          inline frPesq_06_RendimentosTributaveisPJ: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Tribut'#225'veis de PJ'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_06_DepositosJudiciais: TfrPesquisa
            Left = 386
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitLeft = 386
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Dep'#243'sitos Judiciais'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel5: TCategoryPanel
          Top = 90
          Height = 30
          Caption = '04 - Rendimentos Sujeitos '#224' Tributa'#231#227'o Exclusiva/Definitiva'
          Color = clWindow
          Collapsed = True
          TabOrder = 8
          ExpandedHeight = 213
          inline frPesq_05_RendimentoSujeitoTributacao: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Sujeitos '#224' Tribu'#231#227'o'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel4: TCategoryPanel
          Top = 60
          Height = 30
          Caption = '03 - Rendimentos Isentos e N'#227'o Tribut'#225'veis'
          Color = clWindow
          Collapsed = True
          CollapsedHotImageIndex = 0
          CollapsedImageIndex = 0
          CollapsedPressedImageIndex = 0
          ExpandedHotImageIndex = 0
          ExpandedImageIndex = 0
          ExpandedPressedImageIndex = 0
          TabOrder = 9
          ExpandedHeight = 214
          inline frPesq_04_RendimentoIsento: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Isentos e n'#227'o Tribut'#225'veis'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_04_RendCardenetasPoupancas: TfrPesquisa
            Left = 386
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitLeft = 386
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rend. de Cardenetas de Poupan'#231'as e Letras  Hipotec'#225'rias'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 27
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel3: TCategoryPanel
          Top = 30
          Height = 30
          Caption = 
            '02 - Rendimentos Tribut'#225'veis Recebidos de Pessoa F'#237'sica e do Ext' +
            'erior pelo Titular'
          Color = clWindow
          Collapsed = True
          TabOrder = 10
          ExpandedHeight = 584
          inline frPesq_03_RendimentoPF: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Pessoa F'#237'sica'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                Top = 77
                ItemIndex = 0
                ExplicitTop = 77
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_03_RendimentoExterior: TfrPesquisa
            Left = 386
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitLeft = 386
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Exterior'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_03_PrevidenciaOficial: TfrPesquisa
            Left = 5
            Top = 189
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ExplicitLeft = 5
            ExplicitTop = 189
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Previd'#234'ncia Oficial'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_03_PensaoAlimenticia: TfrPesquisa
            Left = 386
            Top = 189
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ExplicitLeft = 386
            ExplicitTop = 189
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Pens'#227'o Aliment'#237'cia'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_03_LivroCaixa: TfrPesquisa
            Left = 5
            Top = 373
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ExplicitLeft = 5
            ExplicitTop = 373
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Livro Caixa'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_03_Darf: TfrPesquisa
            Left = 386
            Top = 373
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ExplicitLeft = 386
            ExplicitTop = 373
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Darf Pago Cod. 0190'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
        object CategoryPanel2: TCategoryPanel
          Top = 0
          Height = 30
          Caption = '01 - Rendimentos Tribut'#225'veis Recebidos de PJ pelo Titular'
          Color = clWindow
          Collapsed = True
          TabOrder = 11
          ExpandedHeight = 402
          inline frPesq_02_Rendimentos: TfrPesquisa
            Left = 5
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Rendimentos Recebidos'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_02_Previdencia: TfrPesquisa
            Left = 386
            Top = 5
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitLeft = 386
            ExplicitTop = 5
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Contribui'#231#227'o Previdenci'#225'ria'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_02_RetidonaFonte: TfrPesquisa
            Left = 5
            Top = 189
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ExplicitLeft = 5
            ExplicitTop = 189
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = 'Imposto Retido na fonte'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
          inline frPesq_02_13Salario: TfrPesquisa
            Left = 386
            Top = 189
            Width = 375
            Height = 180
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ExplicitLeft = 386
            ExplicitTop = 189
            ExplicitWidth = 375
            inherited GroupBox1: TGroupBox
              Left = 10
              Width = 365
              Caption = '13'#186' Sal'#225'rio'
              ExplicitLeft = 10
              ExplicitWidth = 365
              inherited Label1: TLabel
                Left = 5
                ExplicitLeft = 5
              end
              inherited Label2: TLabel
                Left = 144
                ExplicitLeft = 144
              end
              inherited btnPesq: TSpeedButton
                Left = 108
                ExplicitLeft = 108
              end
              inherited rdContenha: TRadioGroup
                Top = 58
                Width = 361
                Height = 0
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 0
              end
              inherited edtCodigo: TEdit
                Left = 5
                ExplicitLeft = 5
              end
              inherited edtDescricao: TEdit
                Left = 144
                Width = 193
                ExplicitLeft = 144
                ExplicitWidth = 193
              end
              inherited lbRegistros: TListBox
                Top = 58
                Width = 361
                Height = 120
                ExplicitTop = 58
                ExplicitWidth = 361
                ExplicitHeight = 120
              end
              inherited btnAdicionar: TBitBtn
                Left = 338
                ExplicitLeft = 338
              end
              inherited rdMovimento: TRadioGroup
                ItemIndex = 0
              end
            end
            inherited rdOpcoes: TRadioGroup
              Width = 10
              ItemIndex = 6
              ExplicitWidth = 10
            end
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = '&9.Sistema'
      ImageIndex = 8
      object GroupBox15: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 193
        Align = alTop
        Caption = 'Backup do Sistema'
        TabOrder = 0
        object Label22: TLabel
          Left = 16
          Top = 96
          Width = 51
          Height = 13
          Caption = 'Hor'#225'rio 1:'
        end
        object Label23: TLabel
          Left = 16
          Top = 128
          Width = 51
          Height = 13
          Caption = 'Hor'#225'rio 2:'
        end
        object Label24: TLabel
          Left = 16
          Top = 160
          Width = 51
          Height = 13
          Caption = 'Hor'#225'rio 3:'
        end
        object GroupBox16: TGroupBox
          Left = 16
          Top = 24
          Width = 697
          Height = 60
          Caption = 'Dias da Semana'
          TabOrder = 0
          object DBCheckBox20: TDBCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Domingo'
            DataField = 'CSIS_BKP_DOMINGO'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox21: TDBCheckBox
            Left = 112
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Segunda'
            DataField = 'CSIS_BKP_SEGUNDA'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox22: TDBCheckBox
            Left = 208
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Ter'#231'a'
            DataField = 'CSIS_BKP_TERCA'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox23: TDBCheckBox
            Left = 304
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Quarta'
            DataField = 'CSIS_BKP_QUARTA'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox24: TDBCheckBox
            Left = 400
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Quinta'
            DataField = 'CSIS_BKP_QUINTA'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox25: TDBCheckBox
            Left = 496
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Sexta'
            DataField = 'CSIS_BKP_SEXTA'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox26: TDBCheckBox
            Left = 592
            Top = 24
            Width = 97
            Height = 17
            Caption = 'S'#225'bado'
            DataField = 'CSIS_BKP_SABADO'
            DataSource = dmConfiguracao.dsConfiguracao
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object DBEdit8: TDBEdit
          Left = 80
          Top = 92
          Width = 75
          Height = 21
          DataField = 'CSIS_BKP_HORA1'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 80
          Top = 124
          Width = 75
          Height = 21
          DataField = 'CSIS_BKP_HORA2'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 80
          Top = 156
          Width = 75
          Height = 21
          DataField = 'CSIS_BKP_HORA3'
          DataSource = dmConfiguracao.dsConfiguracao
          TabOrder = 3
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 573
    ExplicitTop = 573
    inherited btnOK: TSpeedButton
      ExplicitLeft = 438
      ExplicitTop = 2
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 439
    end
  end
end
