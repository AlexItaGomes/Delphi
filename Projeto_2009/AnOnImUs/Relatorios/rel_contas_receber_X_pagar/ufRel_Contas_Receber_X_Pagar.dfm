inherited fRel_Contas_Receber_X_Pagar: TfRel_Contas_Receber_X_Pagar
  Caption = 'fRel_Contas_Receber_X_Pagar'
  ClientHeight = 740
  ClientWidth = 1274
  ExplicitTop = -225
  ExplicitWidth = 1280
  ExplicitHeight = 769
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Top = 685
    Width = 1274
    ExplicitTop = 685
    ExplicitWidth = 1274
    inherited btnCancelar: TSpeedButton
      Left = 270
      ExplicitLeft = 270
    end
    inherited lbCadNovo: TLabel
      Left = 868
      ExplicitLeft = 868
    end
    inherited lbCadEditar: TLabel
      Left = 868
      ExplicitLeft = 868
    end
    inherited lbCadExcluir: TLabel
      Left = 868
      ExplicitLeft = 868
    end
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
    inherited btnImprimir: TSpeedButton
      Anchors = [akRight]
      Enabled = True
      Visible = True
      ExplicitLeft = 707
      ExplicitTop = 4
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    Width = 1274
    ExplicitWidth = 1274
    inherited btnHelp: TSpeedButton
      Left = 1073
      ExplicitLeft = 620
    end
    inherited Label1: TLabel
      Width = 286
      Caption = 'Relat'#243'rio Contas Receber X Contas Pagar'
      ExplicitWidth = 286
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 1173
      ExplicitLeft = 710
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 1274
    Height = 646
    ExplicitWidth = 1274
    ExplicitHeight = 646
    inherited grdBasico: TDBGrid
      Width = 1270
      Height = 629
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1274
    Height = 646
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    inline frPesqPlanoContas: TfrPesquisa
      Left = 8
      Top = 3
      Width = 380
      Height = 165
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 165
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 165
        Caption = 'Pesquisando Plano de Contas'
        ExplicitWidth = 310
        ExplicitHeight = 165
        inherited rdContenha: TRadioGroup
          Top = 123
          Width = 306
          ExplicitTop = 123
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 68
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 68
        end
        inherited ckPlanoContas: TCheckBox
          Left = 236
          Width = 72
          Caption = 'Plano Pai'
          Visible = True
          ExplicitLeft = 236
          ExplicitWidth = 72
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 165
        ItemIndex = 7
        ExplicitHeight = 165
      end
    end
    inline frPesqTipoDoc: TfrPesquisa
      Left = 394
      Top = 3
      Width = 380
      Height = 165
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 394
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 165
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 165
        Caption = 'Pesquisando Tipo Doc'
        ExplicitWidth = 310
        ExplicitHeight = 165
        inherited rdContenha: TRadioGroup
          Top = 123
          Width = 306
          ExplicitTop = 123
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 68
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 68
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 165
        ItemIndex = 3
        ExplicitHeight = 165
      end
    end
    inline frPesqFornecedores: TfrPesquisa
      Left = 780
      Top = 3
      Width = 380
      Height = 165
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 780
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 165
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 165
        Caption = 'Pesquisando Fornecedor(es)'
        ExplicitWidth = 310
        ExplicitHeight = 165
        inherited rdContenha: TRadioGroup
          Top = 123
          Width = 306
          ExplicitTop = 123
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 68
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 68
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 165
        ItemIndex = 1
        ExplicitHeight = 165
      end
    end
    inline frPesqClientes: TfrPesquisa
      Left = 8
      Top = 168
      Width = 380
      Height = 165
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 168
      ExplicitWidth = 380
      ExplicitHeight = 165
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 165
        Caption = 'Pesquisando Cliente(s)'
        ExplicitWidth = 310
        ExplicitHeight = 165
        inherited btnPesq: TSpeedButton
          OnClick = frPesqClientesbtnPesqClick
        end
        inherited rdContenha: TRadioGroup
          Top = 123
          Width = 306
          ExplicitTop = 123
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 68
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 68
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 165
        ItemIndex = 0
        ExplicitHeight = 165
      end
    end
    inline frPesqContaBancaria: TfrPesquisa
      Left = 394
      Top = 168
      Width = 380
      Height = 165
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitLeft = 394
      ExplicitTop = 168
      ExplicitWidth = 380
      ExplicitHeight = 165
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 165
        Caption = 'Pesquisando Conta Banc'#225'ria'
        ExplicitWidth = 310
        ExplicitHeight = 165
        inherited rdContenha: TRadioGroup
          Top = 123
          Width = 306
          ExplicitTop = 123
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 68
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 68
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 165
        ItemIndex = 8
        ExplicitHeight = 165
      end
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 338
      Width = 216
      Height = 38
      Caption = 'Dt. Cadastro'
      TabOrder = 5
      object edtDtInicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtFim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 227
      Top = 338
      Width = 216
      Height = 38
      Caption = 'Dt. Emiss'#227'o'
      TabOrder = 6
      object edtDt_Emissao_Inicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDt_Emissao_Fim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 416
      Width = 216
      Height = 38
      Caption = 'Dt. Vencto'
      TabOrder = 9
      object edtDt_Vcto_Inicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDt_Vcto_Fim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 8
      Top = 377
      Width = 216
      Height = 38
      Caption = 'Dt. Pagamento'
      TabOrder = 7
      object edtDt_Pagto_Inicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDt_Pagto_Fim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox9: TGroupBox
      Left = 227
      Top = 377
      Width = 216
      Height = 38
      Caption = 'Dt. Cancelamento'
      TabOrder = 8
      object edtDt_Canc_Inicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDt_Canc_Fim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object rdOrdena: TRadioGroup
      Left = 780
      Top = 168
      Width = 405
      Height = 79
      Caption = 'Ordenado'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Nr'#186' Reg.'
        'Nr. Doc.'
        'Proveniente'
        'Fornecedor'
        'Pl. de Contas'
        'Dt. Cadastro'
        'Dt. Emiss'#227'o'
        'Dt. Vencto'
        'Dt. Pagto'
        'Dt. Cancel'
        'Status'
        'Vlr. Doc.')
      TabOrder = 14
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 449
      Top = 377
      Width = 216
      Height = 38
      Caption = 'Op'#231#227'o de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar'
        'Imprimir')
      TabOrder = 12
    end
    object rdTipo_Impressao: TRadioGroup
      Left = 449
      Top = 338
      Width = 216
      Height = 38
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico'
        'Anal'#237'tico')
      TabOrder = 11
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 227
      Top = 416
      Width = 216
      Height = 38
      Caption = 'Dt. Efetiva'#231#227'o'
      TabOrder = 10
      object edtDtEfetivaInicio: TDateEdit
        Left = 3
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtEfetivaFim: TDateEdit
        Left = 108
        Top = 13
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object ckSaldo: TCheckBox
      Left = 8
      Top = 456
      Width = 187
      Height = 24
      Caption = 'Considerar Saldo Banc'#225'rio'
      TabOrder = 16
    end
    object rdSepararTitulos: TRadioGroup
      Left = 449
      Top = 416
      Width = 216
      Height = 38
      Caption = 'Separar T'#237'tulos por Dt. de Vecto'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 13
    end
    object rdStatus: TRadioGroup
      Left = 780
      Top = 247
      Width = 405
      Height = 86
      Caption = 'Status'
      Columns = 3
      ItemIndex = 5
      Items.Strings = (
        'Abertos'
        'Fechados'
        'Cancelados'
        'Abertos/Fechados'
        'Todos'
        'Abertos S/ Previs'#227'o'
        'Previs'#227'o')
      TabOrder = 15
    end
    object ckSaldoCaixa: TCheckBox
      Left = 227
      Top = 457
      Width = 187
      Height = 24
      Caption = 'Considerar Saldo do Caixa'
      TabOrder = 17
    end
    object ckFundoReserva: TCheckBox
      Left = 449
      Top = 457
      Width = 187
      Height = 24
      Caption = 'Aplicar Fundo de Reserva'
      Checked = True
      State = cbChecked
      TabOrder = 18
    end
  end
  inherited ppBasico: TPopupMenu
    Left = 712
    Top = 624
  end
  inherited frRelatorio: TfrxReport
    ReportOptions.LastChange = 41763.812176597200000000
    ScriptText.Strings = (
      'begin'
      'end.          ')
    Left = 592
    Top = 272
    Datasets = <
      item
        DataSet = dstRelatorioPagar
        DataSetName = 'frDBRelatorioPagar'
      end
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioReceber'
      end>
    Variables = <
      item
        Name = ' Variaveis'
        Value = Null
      end
      item
        Name = 'SaldoBanco'
        Value = Null
      end
      item
        Name = 'Rec_Total_Titulos'
        Value = Null
      end
      item
        Name = 'Rec_Titulos_Aberto'
        Value = Null
      end
      item
        Name = 'Rec_Titulos_Recebidos'
        Value = Null
      end
      item
        Name = 'Rec_Titulos_Cancelados'
        Value = Null
      end
      item
        Name = 'Pag_Total_Titulos'
        Value = Null
      end
      item
        Name = 'Pag_Titulos_Aberto'
        Value = Null
      end
      item
        Name = 'Pag_Titulos_Recebidos'
        Value = Null
      end
      item
        Name = 'Pag_Titulos_Cancelados'
        Value = Null
      end
      item
        Name = 'SaldoCaixa'
        Value = Null
      end
      item
        Name = 'FundoReserva'
        Value = Null
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 300.000000000000000000
      PaperSize = 256
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      inherited PageHeader1: TfrxPageHeader
        Height = 0.000000000000000000
        Visible = False
        Width = 1114.961350000000000000
        inherited Memo15: TfrxMemoView
          Height = 0.000000000000000000
          Visible = False
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 1054.488870000000000000
        Width = 1114.961350000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 975.118740000000000000
          Top = 1.133858267716540000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
        inherited Line2: TfrxLineView
          Width = 1114.961350000000000000
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 12.472440940000000000
        Top = 317.480520000000000000
        Width = 1114.961350000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioReceber'
        object Memo6: TfrxMemoView
          Left = 1.889763780000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CREC_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_ID"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 46.133890000000000000
          Width = 222.992169920000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CREC_PROVENIENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_PROVENIENTE"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 1054.488870000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CREC_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_DTA_CADASTRO"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 1006.354980000000000000
          Width = 46.110236220000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."STATUS"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 943.882500000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'TIPO_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."TIPO_DOC"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 785.362710000000000000
          Width = 154.960629920000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."PLCT_DESCRICAO"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 723.110700000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 667.417750000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CREC_VALOR_PAGO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_VALOR_PAGO"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 611.724800000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CREC_VALOR_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_VALOR_DOC"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 554.811380000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CREC_DTA_EFETIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_DTA_EFETIVO"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 498.118430000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CREC_DTA_PGTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_DTA_PGTO"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 271.685220000000000000
          Width = 162.519689920000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CLIE_FANTASIA"]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 437.307360000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EMISSAO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_EMISSAO"]')
          ParentFont = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Width = 1114.961350000000000000
        inherited lblFantasia: TfrxMemoView
          Width = 737.008350000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 894.969080000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 970.559680000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 1040.591220000000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 898.882143620000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 898.882143620000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 898.882143620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 898.882143620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 898.882143620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 970.559680000000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Left = 970.559680000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Left = 970.559680000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 970.559680000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Width = 737.008350000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 737.008350000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Width = 737.008350000000000000
          Memo.UTF8W = (
            'Relat'#243'rio Sint'#233'tico Contas Receber X Contas Pagar')
        end
        inherited Line3: TfrxLineView
          Width = 1114.961350000000000000
          Visible = False
        end
        inherited lblTelefone: TfrxMemoView
          Width = 737.008350000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Top = 1126.299940000000000000
        Visible = False
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 34.015770000000000000
        Top = 211.653680000000000000
        Width = 1114.961350000000000000
        Condition = 'frDBRelatorioReceber."TIPO"'
        object Shape2: TfrxShapeView
          Align = baClient
          Width = 1114.961350000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          Left = 3.779527560000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contas Receber')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 1.889763780000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' Reg.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 46.133890000000000000
          Top = 18.897650000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 271.685220000000000000
          Top = 18.897650000000000000
          Width = 162.519689920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 437.307360000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Emiss'#227'o')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 498.118430000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Receb.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 554.811380000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Efetivo')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 611.724800000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Doc.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 667.417750000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Receb.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 723.110700000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cod. Simplif.')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 785.362710000000000000
          Top = 18.897650000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano de Contas')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 943.882500000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Doc.')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 1007.354980000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 1051.488870000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 98.267716535433100000
        Top = 374.173470000000000000
        Width = 1114.961350000000000000
        object Shape6: TfrxShapeView
          Top = 5.000000000000000000
          Width = 1114.961350000000000000
          Height = 86.929133860000000000
          ShowHint = False
          Frame.Style = fsDot
          Shape = skRoundRectangle
        end
        object Memo13: TfrxMemoView
          Left = 672.756340000000000000
          Top = 9.779530000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totalizadores')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 831.496600000000000000
          Top = 9.779530000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total em T'#237'tulos:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 831.496600000000000000
          Top = 24.897650000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos em Aberto:')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 831.496600000000000000
          Top = 40.015770000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos Recebidos:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 831.496600000000000000
          Top = 55.133890000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos Cancelados:')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 831.496600000000000000
          Top = 74.031540000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total em T'#237'tulos V'#225'lidos:')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 831.496600000000000000
          Top = 71.472480000000000000
          Width = 219.212740000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo43: TfrxMemoView
          Left = 990.236860000000000000
          Top = 9.779530000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Total_Titulos]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 990.236860000000000000
          Top = 24.897650000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Titulos_Aberto]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 990.236860000000000000
          Top = 40.015770000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Titulos_Recebidos]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 990.236860000000000000
          Top = 55.133890000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Titulos_Cancelados]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 990.236860000000000000
          Top = 74.031540000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Titulos_Aberto]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456692910000000000
        Top = 268.346630000000000000
        Width = 1114.961350000000000000
        Condition = 'frDBRelatorioReceber."CREC_DTA_VCTO"'
        object Shape1: TfrxShapeView
          Top = 3.000000000000000000
          Width = 1114.961350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Style = fsDot
          Shape = skRoundRectangle
        end
        object Memo7: TfrxMemoView
          Left = 81.149660000000000000
          Top = 5.000000000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CREC_DTA_VCTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioReceber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioReceber."CREC_DTA_VCTO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 6.559060000000000000
          Top = 5.000000000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Vencto:')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Top = 351.496290000000000000
        Width = 1114.961350000000000000
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 34.015748030000000000
        Top = 495.118430000000000000
        Width = 1114.961350000000000000
        Condition = 'frDBRelatorioPagar."TIPO"'
        object Shape5: TfrxShapeView
          Align = baClient
          Width = 1114.961350000000000000
          Height = 34.015748030000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape3: TfrxShapeView
          Align = baClient
          Width = 1114.961350000000000000
          Height = 34.015748030000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo48: TfrxMemoView
          Left = 3.779527560000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contas a Pagar')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 1.889763780000000000
          Top = 18.897637795275600000
          Width = 41.574830000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' Reg.')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 46.133890000000000000
          Top = 18.897637795275600000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 271.685220000000000000
          Top = 18.897637795275600000
          Width = 162.519689920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 498.118430000000000000
          Top = 18.897637800000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Pagto')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 554.811380000000000000
          Top = 18.897637800000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Efetivo')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 611.724800000000000000
          Top = 18.897637800000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Doc.')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 667.417750000000000000
          Top = 18.897637800000000000
          Width = 52.913420000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Pago.')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 723.110700000000000000
          Top = 18.897637800000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cod. Simplif.')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 785.362710000000000000
          Top = 18.897637800000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano de Contas')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 943.882500000000000000
          Top = 18.897637800000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Doc.')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 1007.354980000000000000
          Top = 18.897637800000000000
          Width = 41.574830000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 1051.488870000000000000
          Top = 18.897637800000000000
          Width = 60.472480000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 437.307360000000000000
          Top = 18.897637800000000000
          Width = 56.692950000000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Emiss'#227'o')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 98.267716540000000000
        Top = 661.417750000000000000
        Width = 1114.961350000000000000
        object Shape7: TfrxShapeView
          Top = 5.000000000000000000
          Width = 1114.961350000000000000
          Height = 86.929133860000000000
          ShowHint = False
          Frame.Style = fsDot
          Shape = skRoundRectangle
        end
        object Memo63: TfrxMemoView
          Left = 672.756340000000000000
          Top = 9.779530000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totalizadores')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 831.496600000000000000
          Top = 9.779530000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total em T'#237'tulos:')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 831.496600000000000000
          Top = 24.897650000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos em Aberto:')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 831.496600000000000000
          Top = 40.015770000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos Recebidos:')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 831.496600000000000000
          Top = 55.133890000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos Cancelados:')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 831.496600000000000000
          Top = 74.031540000000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total em T'#237'tulos V'#225'lidos:')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 830.496600000000000000
          Top = 71.472480000000000000
          Width = 219.212740000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo69: TfrxMemoView
          Left = 990.236860000000000000
          Top = 9.779530000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Total_Titulos]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 990.236860000000000000
          Top = 24.897650000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Titulos_Aberto]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 990.236860000000000000
          Top = 40.015770000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Titulos_Recebidos]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 990.236860000000000000
          Top = 55.133890000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Titulos_Cancelados]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 990.236860000000000000
          Top = 74.031540000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Titulos_Aberto]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 26.456692910000000000
        Top = 551.811380000000000000
        Width = 1114.961350000000000000
        Condition = 'frDBRelatorioPagar."CPAG_DTA_VCTO"'
        object Shape4: TfrxShapeView
          Top = 3.023622050000000000
          Width = 1114.961350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Style = fsDot
          Shape = skRoundRectangle
        end
        object Memo74: TfrxMemoView
          Left = 84.929190000000000000
          Top = 5.779530000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_VCTO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_VCTO"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 10.338590000000000000
          Top = 5.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Vencto:')
          ParentFont = False
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Top = 638.740570000000000000
        Width = 1114.961350000000000000
      end
      object MasterData2: TfrxMasterData
        Height = 13.228346460000000000
        Top = 600.945270000000000000
        Width = 1114.961350000000000000
        DataSet = dstRelatorioPagar
        DataSetName = 'frDBRelatorioPagar'
        RowCount = 0
        object Memo87: TfrxMemoView
          Left = 437.307360000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EMISSAO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_EMISSAO"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 1.889763780000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CPAG_ID'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_ID"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 46.133890000000000000
          Width = 222.992169920000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CPAG_PROVENIENTE'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_PROVENIENTE"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 1054.488870000000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_DTA_CADASTRO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_CADASTRO"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 1006.354980000000000000
          Width = 46.110236220000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."STATUS"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 943.882500000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'TIPO_DOC'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."TIPO_DOC"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 785.362710000000000000
          Width = 154.960629920000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."PLCT_DESCRICAO"]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 723.110700000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 667.417750000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_PAGO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_VALOR_PAGO"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 611.724800000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_DOC'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_VALOR_DOC"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 554.811380000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EFETIVO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_EFETIVO"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 498.118430000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CPAG_DTA_PGTO'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPagar."CPAG_DTA_PGTO"]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 271.685220000000000000
          Width = 162.519689920000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorioPagar
          DataSetName = 'frDBRelatorioPagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPagar."FORN_NOME_FANTASIA"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 211.653626300000000000
        Top = 782.362710000000000000
        Width = 1114.961350000000000000
        object Shape8: TfrxShapeView
          Width = 1114.961350000000000000
          Height = 226.771746300000000000
          OnBeforePrint = 'Shape8OnBeforePrint'
          ShowHint = False
          Frame.Style = fsDot
          Shape = skRoundRectangle
        end
        object Memo91: TfrxMemoView
          Left = 642.520100000000000000
          Top = 4.645669290000000000
          Width = 154.960629920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totaliza'#231#227'o Geral')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 801.260360000000000000
          Top = 4.645669290000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Contas a Receber:')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 801.260360000000000000
          Top = 19.118120000000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Contas a Receber em Aberto:')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 990.236860000000000000
          Top = 4.645669290000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Total_Titulos]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 990.236860000000000000
          Top = 19.118120000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Rec_Titulos_Aberto]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 981.898169920000000000
          Top = 34.236240000000000000
          Width = 71.811070000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo96: TfrxMemoView
          Left = 801.260360000000000000
          Top = 37.795300000000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Contas a Pagar:')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 801.260360000000000000
          Top = 52.913420000000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Contas a Pagar em Aberto:')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 990.236860000000000000
          Top = 37.795300000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Total_Titulos]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 990.236860000000000000
          Top = 52.913420000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Pag_Titulos_Aberto]')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 802.260259920000000000
          Top = 134.283550000000000000
          Width = 249.448980000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo100: TfrxMemoView
          Left = 801.260360000000000000
          Top = 137.063080000000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Receita Prevista Liquida:')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 990.236860000000000000
          Top = 137.063080000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<Rec_Total_Titulos> - <Pag_Total_Titulos>-(<FundoReservaLivre>+' +
              '<FundoReservaLucro>+<FundoReservaLegal>+<FundoReservaEstatutaria' +
              's>)]')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 11.338590000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '+')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 45.574830000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 144.401670000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '=')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 801.260360000000000000
          Top = 69.385870710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fundo de Reserva Livre (5%)*')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 990.236860000000000000
          Top = 69.385870710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[<FundoReservaLivre>]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 61.252010000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 801.260360000000000000
          Top = 85.724460710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fundo de Reserva Lucro (5%)*')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 990.236860000000000000
          Top = 85.724460710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[<FundoReservaLucro>]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 77.590600000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 801.260360000000000000
          Top = 102.622110710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fundo de Reserva Legal (5%)*')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 990.236860000000000000
          Top = 102.622110710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[<FundoReservaLegal>]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 94.488250000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 801.260360000000000000
          Top = 118.740230710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fundo de Reserva Estatut'#225'rias (5%)*')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 990.236860000000000000
          Top = 118.740230710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[<FundoReservaEstatutarias>]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 110.606370000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 801.260360000000000000
          Top = 168.212710710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Banc'#225'rio:')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 990.236860000000000000
          Top = 168.212710710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SaldoBanco]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 168.212710710000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '+')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 801.260360000000000000
          Top = 152.535530710000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Receita Liquida:')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 990.236860000000000000
          Top = 152.535530710000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<Rec_Titulos_Aberto> - <Pag_Titulos_Aberto>-(<FundoReservaLivre' +
              '>+<FundoReservaLucro>+<FundoReservaLegal>+<FundoReservaEstatutar' +
              'ias>)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 801.260360000000000000
          Top = 184.417440000000000000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Caixa:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 990.236860000000000000
          Top = 184.417440000000000000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SaldoCaixa]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 184.417440000000000000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '+')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 801.260360000000000000
          Top = 200.314960629921300000
          Width = 185.196850390000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Receita Liquida com Saldo Banc'#225'rio:')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 990.236860000000000000
          Top = 200.314960629921300000
          Width = 60.472379920000000000
          Height = 12.472440940000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<Rec_Titulos_Aberto> - <Pag_Titulos_Aberto>-(<FundoReservaLivre' +
              '>+<FundoReservaLucro>+<FundoReservaLegal>+<FundoReservaEstatutar' +
              'ias>) + <SaldoBanco>+<SaldoCaixa>]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 1054.488870000000000000
          Top = 200.314960629921300000
          Width = 11.338489920000000000
          Height = 12.472440940000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '=')
          ParentFont = False
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    UserName = 'frDBRelatorioReceber'
    FieldAliases.Strings = (
      'CREC_ID=CREC_ID'
      'CREC_EMPR_ID=CREC_EMPR_ID'
      'CREC_NR_DOC=CREC_NR_DOC'
      'CREC_PROVENIENTE=CREC_PROVENIENTE'
      'CREC_CLIE_ID=CREC_CLIE_ID'
      'CREC_CLIE_EMPR_ID=CREC_CLIE_EMPR_ID'
      'CREC_PLCT_ID=CREC_PLCT_ID'
      'CREC_PLCT_EMPR_ID=CREC_PLCT_EMPR_ID'
      'CREC_DTA_EMISSAO=CREC_DTA_EMISSAO'
      'CREC_DTA_VCTO=CREC_DTA_VCTO'
      'CREC_DTA_PGTO=CREC_DTA_PGTO'
      'CREC_STATUS=CREC_STATUS'
      'CREC_GENE_EMPR_ID_TIPO_DOC=CREC_GENE_EMPR_ID_TIPO_DOC'
      'CREC_GENE_TGEN_ID_TIPO_DOC=CREC_GENE_TGEN_ID_TIPO_DOC'
      'CREC_GENE_ID_TIPO_DOC=CREC_GENE_ID_TIPO_DOC'
      'CREC_OBS=CREC_OBS'
      'CREC_USER_ID_CANC=CREC_USER_ID_CANC'
      'CREC_DTA_CANC=CREC_DTA_CANC'
      'CREC_MOTIVO_CANC=CREC_MOTIVO_CANC'
      'CREC_DTA_CADASTRO=CREC_DTA_CADASTRO'
      'CREC_USER_ID=CREC_USER_ID'
      'CLIE_FANTASIA=CLIE_FANTASIA'
      'PLCT_COD_SIMPLIFICADO=PLCT_COD_SIMPLIFICADO'
      'PLCT_DESCRICAO=PLCT_DESCRICAO'
      'STATUS=STATUS'
      'TIPO_DOC=TIPO_DOC'
      'USER_CANC=USER_CANC'
      'CREC_VALOR_DOC=CREC_VALOR_DOC'
      'CREC_VALOR_JUROS=CREC_VALOR_JUROS'
      'CREC_VALOR_MORA=CREC_VALOR_MORA'
      'CREC_VALOR_PAGO=CREC_VALOR_PAGO'
      'CREC_DTA_EFETIVO=CREC_DTA_EFETIVO'
      'TIPO=TIPO')
    DataSource = dmRel_Contas_Receber_X_Pagar.dsRel_Contas_Receber
    Left = 528
    Top = 240
  end
  object dstRelatorioPagar: TfrxDBDataset
    UserName = 'frDBRelatorioPagar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CPAG_ID=CPAG_ID'
      'CPAG_EMPR_ID=CPAG_EMPR_ID'
      'CPAG_NR_DOC=CPAG_NR_DOC'
      'CPAG_PROVENIENTE=CPAG_PROVENIENTE'
      'CPAG_FORN_ID=CPAG_FORN_ID'
      'CPAG_PLCT_ID=CPAG_PLCT_ID'
      'CPAG_PLCT_EMPR_ID=CPAG_PLCT_EMPR_ID'
      'CPAG_DTA_EMISSAO=CPAG_DTA_EMISSAO'
      'CPAG_DTA_VCTO=CPAG_DTA_VCTO'
      'CPAG_DTA_PGTO=CPAG_DTA_PGTO'
      'CPAG_STATUS=CPAG_STATUS'
      'CPAG_GENE_EMPR_ID_TIPO_DOC=CPAG_GENE_EMPR_ID_TIPO_DOC'
      'CPAG_GENE_TGEN_ID_TIPO_DOC=CPAG_GENE_TGEN_ID_TIPO_DOC'
      'CPAG_GENE_ID_TIPO_DOC=CPAG_GENE_ID_TIPO_DOC'
      'CPAG_OBS=CPAG_OBS'
      'CPAG_USER_ID_CANC=CPAG_USER_ID_CANC'
      'CPAG_DTA_CANC=CPAG_DTA_CANC'
      'CPAG_MOTIVO_CANC=CPAG_MOTIVO_CANC'
      'CPAG_DTA_CADASTRO=CPAG_DTA_CADASTRO'
      'CPAG_USER_ID=CPAG_USER_ID'
      'FORN_NOME_FANTASIA=FORN_NOME_FANTASIA'
      'PLCT_COD_SIMPLIFICADO=PLCT_COD_SIMPLIFICADO'
      'PLCT_DESCRICAO=PLCT_DESCRICAO'
      'PLCT_TIPO=PLCT_TIPO'
      'STATUS=STATUS'
      'TIPO_DOC=TIPO_DOC'
      'USER_CANCEL=USER_CANCEL'
      'CPAG_VALOR_DOC=CPAG_VALOR_DOC'
      'CPAG_VALOR_JUROS=CPAG_VALOR_JUROS'
      'CPAG_VALOR_MORA=CPAG_VALOR_MORA'
      'CPAG_VALOR_PAGO=CPAG_VALOR_PAGO'
      'CPAG_DTA_EFETIVO=CPAG_DTA_EFETIVO'
      'TIPO=TIPO')
    DataSource = dmRel_Contas_Receber_X_Pagar.dsRel_Contas_Pagar
    BCDToCurrency = False
    Left = 528
    Top = 296
  end
end
