inherited fRel_Contas_Pagar: TfRel_Contas_Pagar
  Caption = 'fRel_Contas_Pagar'
  ClientHeight = 694
  ClientWidth = 1274
  Constraints.MaxHeight = 723
  ExplicitWidth = 1280
  ExplicitHeight = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Top = 639
    Width = 1274
    ExplicitTop = 639
    ExplicitWidth = 1274
    inherited btnCancelar: TSpeedButton
      Left = 213
      ExplicitLeft = 213
    end
    inherited lbCadNovo: TLabel
      Left = 876
      ExplicitLeft = 876
    end
    inherited lbCadEditar: TLabel
      Left = 876
      ExplicitLeft = 876
    end
    inherited lbCadExcluir: TLabel
      Left = 876
      ExplicitLeft = 876
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
      ExplicitLeft = 643
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
      ExplicitLeft = 760
    end
    inherited Label1: TLabel
      Width = 193
      Caption = 'Relat'#243'rio de Contas a Pagar'
      ExplicitWidth = 193
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 1173
      ExplicitLeft = 784
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 1274
    Height = 600
    ExplicitWidth = 1274
    ExplicitHeight = 600
    inherited grdBasico: TDBGrid
      Width = 1270
      Height = 583
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1274
    Height = 600
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object GroupBox6: TGroupBox
      Left = 5
      Top = 330
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
      Top = 330
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
      Left = 5
      Top = 408
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
      Left = 5
      Top = 369
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
    object rdStatus: TRadioGroup
      Left = 671
      Top = 408
      Width = 425
      Height = 38
      Caption = 'Status'
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        'Aberto'
        'Fechado'
        'Cancelado'
        'Todos')
      TabOrder = 14
    end
    object GroupBox9: TGroupBox
      Left = 227
      Top = 369
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
      Left = 671
      Top = 330
      Width = 425
      Height = 77
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
      TabOrder = 13
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 449
      Top = 369
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
      Top = 330
      Width = 216
      Height = 38
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico'
        'Anal'#237'tico')
      TabOrder = 11
    end
    inline frPesqContaPagar: TfrPesquisa
      Left = 5
      Top = 3
      Width = 380
      Height = 160
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 160
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 160
        Caption = 'Pesquisando C. Pagar'
        ExplicitWidth = 310
        ExplicitHeight = 160
        inherited rdContenha: TRadioGroup
          Top = 118
          Width = 306
          ExplicitTop = 118
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 63
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 63
        end
        inherited rdMovimento: TRadioGroup
          Top = 59
          ExplicitTop = 59
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 160
        ItemIndex = 4
        ExplicitHeight = 160
      end
    end
    inline frPesqFornecedores: TfrPesquisa
      Left = 390
      Top = 3
      Width = 380
      Height = 160
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 390
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 160
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 160
        Caption = 'Pesquisando Fornecedor(es)'
        ExplicitWidth = 310
        ExplicitHeight = 160
        inherited rdContenha: TRadioGroup
          Top = 118
          Width = 306
          ExplicitTop = 118
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 63
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 63
        end
        inherited rdMovimento: TRadioGroup
          Top = 59
          ExplicitTop = 59
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 160
        ItemIndex = 1
        ExplicitHeight = 160
      end
    end
    inline frPesqPlanoContas: TfrPesquisa
      Left = 775
      Top = 3
      Width = 380
      Height = 160
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 775
      ExplicitTop = 3
      ExplicitWidth = 380
      ExplicitHeight = 160
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 160
        Caption = 'Pesquisando Plano Contas'
        ExplicitWidth = 310
        ExplicitHeight = 160
        inherited rdContenha: TRadioGroup
          Top = 118
          Width = 306
          ExplicitTop = 118
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 63
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 63
        end
        inherited rdMovimento: TRadioGroup
          Top = 59
          ExplicitTop = 59
        end
        inherited ckPlanoContas: TCheckBox
          Left = 235
          Width = 72
          Caption = 'Plano Pai'
          Visible = True
          ExplicitLeft = 235
          ExplicitWidth = 72
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 160
        ItemIndex = 6
        ExplicitHeight = 160
      end
    end
    inline frPesqTipoDoc: TfrPesquisa
      Left = 5
      Top = 166
      Width = 380
      Height = 160
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 5
      ExplicitTop = 166
      ExplicitWidth = 380
      ExplicitHeight = 160
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 160
        Caption = 'Pesquisando Tipo Doc'#180's'
        ExplicitWidth = 310
        ExplicitHeight = 160
        inherited rdContenha: TRadioGroup
          Top = 118
          Width = 306
          ExplicitTop = 118
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 63
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 63
        end
        inherited rdMovimento: TRadioGroup
          Top = 59
          ExplicitTop = 59
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 160
        ItemIndex = 3
        ExplicitHeight = 160
      end
    end
    object GroupBox1: TGroupBox
      Left = 227
      Top = 408
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
    inline frPesqContaBancaria: TfrPesquisa
      Left = 390
      Top = 164
      Width = 380
      Height = 160
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitLeft = 390
      ExplicitTop = 164
      ExplicitWidth = 380
      ExplicitHeight = 160
      inherited GroupBox1: TGroupBox
        Width = 310
        Height = 160
        Caption = 'Pesquisando Conta Banc'#225'ria'
        ExplicitWidth = 310
        ExplicitHeight = 160
        inherited rdContenha: TRadioGroup
          Top = 118
          Width = 306
          ExplicitTop = 118
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Top = 55
          Width = 306
          Height = 63
          ExplicitTop = 55
          ExplicitWidth = 306
          ExplicitHeight = 63
        end
        inherited rdMovimento: TRadioGroup
          Top = 59
          ExplicitTop = 59
        end
        inherited ckPlanoContas: TCheckBox
          Left = 800
          ExplicitLeft = 800
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 160
        ItemIndex = 8
        ExplicitHeight = 160
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 880
  end
  inherited Timer1: TTimer
    Left = 1000
  end
  inherited ppBasico: TPopupMenu
    Left = 968
    Top = 352
  end
  inherited frRelatorio: TfrxReport
    Left = 928
    Top = 264
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      inherited PageHeader1: TfrxPageHeader
        Height = 24.566916930000000000
        Visible = False
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 506.457020000000000000
        Width = 1046.929810000000000000
        inherited Memo1: TfrxMemoView
          Top = 1.133858270000000000
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 907.087200000000000000
          Top = 1.133858267716540000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
        inherited Line2: TfrxLineView
          Width = 1046.929810000000000000
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object Memo25: TfrxMemoView
          Left = 987.118740000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354323390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 936.323440000000000000
          Width = 49.133853390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."STATUS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 831.496600000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TIPO_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."TIPO_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 374.937230000000000000
          Width = 54.803149610000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EMISSAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_EMISSAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 430.409710000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_VCTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_VCTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 485.102660000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_PGTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_PGTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 598.606680000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_PAGO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_PAGO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 657.638220000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 540.354670000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 51.472480000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_PROVENIENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_PROVENIENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 155.740260000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_NR_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_NR_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 214.433210000000000000
          Width = 158.740223390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_NOME_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 720.110700000000000000
          Width = 109.606333390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Width = 1046.929810000000000000
        inherited lblFantasia: TfrxMemoView
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 828.717070000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 904.307670000000000000
          Top = 3.779530000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 974.339210000000000000
          Top = 3.779530000000000000
          Width = 69.921259842519700000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 832.630133620000000000
          Top = 3.779530000000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 832.630133620000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 832.630133620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 832.630133620000000000
          Top = 66.897640240000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 832.630133620000000000
          Top = 88.440947320000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 904.307670000000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Left = 904.307670000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Left = 904.307670000000000000
          Top = 66.897640240000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 904.307670000000000000
          Top = 88.440947320000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Width = 668.976810000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 668.976810000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Top = 80.370132440000000000
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Relat'#243'rio Sint'#233'tico de Contas a Pagar')
        end
        inherited Line3: TfrxLineView
          Align = baBottom
          Width = 1043.150280000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Align = baNone
        Top = 17.007856930000000000
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorio."MES"'
        StartNewPage = True
        object Shape1: TfrxShapeView
          Top = 2.000000000000000000
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          Left = 3.779527560000000000
          Top = 3.779527560000000000
          Width = 28.346456690000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'M'#234's:')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779527560000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'MES'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."MES"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 83.149660000000000000
          Top = 3.779527560000000000
          Width = 28.346456690000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ano:')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 113.385902440000000000
          Top = 3.779527560000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ANO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."ANO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 45.354323390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' Reg.')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 51.472480000000000000
          Top = 22.677180000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 155.740260000000000000
          Top = 22.677180000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 214.433210000000000000
          Top = 22.677180000000000000
          Width = 158.740223390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 374.937230000000000000
          Top = 22.677180000000000000
          Width = 54.803149610000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Emiss'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 430.409710000000000000
          Top = 22.677180000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Vencto')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 485.102660000000000000
          Top = 22.677180000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Pagto')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 540.354670000000000000
          Top = 22.677180000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 598.606680000000000000
          Top = 22.677180000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Pago')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 657.638220000000000000
          Top = 22.677180000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Simplif.')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 720.110700000000000000
          Top = 22.677180000000000000
          Width = 109.606333390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano de Contas')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 831.496600000000000000
          Top = 22.677180000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Doc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 936.323440000000000000
          Top = 22.677180000000000000
          Width = 49.133853390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 987.118740000000000000
          Top = 22.677180000000000000
          Width = 56.692913385826770000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 109.606370000000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Line5: TfrxLineView
          Align = baWidth
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo38: TfrxMemoView
          Left = 831.496600000000000000
          Top = 3.779530000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
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
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 831.496600000000000000
          Top = 19.897650000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
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
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 831.496600000000000000
          Top = 37.795300000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulos Pagos::')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 831.496600000000000000
          Top = 55.692950000000000000
          Width = 102.047273390000000000
          Height = 15.118110240000000000
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
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 820.158010000000000000
          Top = 83.149660000000000000
          Width = 113.385863390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total em T'#237'tulos V'#225'lidos:')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 936.323440000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
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
            '[SUM(<frDBRelatorio."CPAG_VALOR_DOC">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 936.323440000000000000
          Top = 19.897650000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
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
            
              '[SUM(IIF(<frDBRelatorio."CPAG_STATUS">='#39'A'#39',<frDBRelatorio."CPAG_' +
              'VALOR_DOC">,0),MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 936.323440000000000000
          Top = 37.795300000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
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
            '[SUM(<frDBRelatorio."CPAG_VALOR_PAGO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 936.323440000000000000
          Top = 55.692950000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
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
            
              '[SUM(IIF(<frDBRelatorio."CPAG_STATUS">='#39'C'#39',<frDBRelatorio."CPAG_' +
              'VALOR_DOC">,0),MasterData1)]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 822.158010000000000000
          Top = 79.370130000000000000
          Width = 219.212740000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo8: TfrxSysMemoView
          Left = 936.323440000000000000
          Top = 83.149660000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
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
            
              '[SUM(<frDBRelatorio."CPAG_VALOR_DOC">-(<frDBRelatorio."CPAG_VALO' +
              'R_PAGO">+IIF(<frDBRelatorio."CPAG_STATUS">='#39'C'#39',<frDBRelatorio."C' +
              'PAG_VALOR_DOC">,0)),MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
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
      'ANO=ANO'
      'MES=MES'
      'CPAG_VALOR_DOC=CPAG_VALOR_DOC'
      'CPAG_VALOR_JUROS=CPAG_VALOR_JUROS'
      'CPAG_VALOR_MORA=CPAG_VALOR_MORA'
      'CPAG_VALOR_PAGO=CPAG_VALOR_PAGO'
      'CPAG_DTA_EFETIVO=CPAG_DTA_EFETIVO')
    Left = 864
    Top = 264
  end
  inherited funcBasico: TFuncoes
    Left = 816
  end
  object frRelatorioAnalitico: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 41062.811029189800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 928
    Top = 312
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end
      item
        DataSet = dstRelatorioAcertos
        DataSetName = 'frDBRelatorioAcertos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 24.566916930000000000
        ParentFont = False
        Top = 151.181200000000000000
        Visible = False
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Top = 17.007856930000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 593.386210000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858267716540000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'www.anonimus.info')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 1.133858267716540000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 491.338900000000000000
        Width = 718.110700000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        RowCount = 0
        object Memo44: TfrxMemoView
          Left = 3.779530000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ACPG_ID'
          DataSet = dstRelatorioAcertos
          DataSetName = 'frDBRelatorioAcertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioAcertos."ACPG_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 82.149660000000000000
          Width = 185.196933390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GENE_DESCR'
          DataSet = dstRelatorioAcertos
          DataSetName = 'frDBRelatorioAcertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioAcertos."GENE_DESCR"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 271.126160000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ACPG_VALOR_DOC'
          DataSet = dstRelatorioAcertos
          DataSetName = 'frDBRelatorioAcertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioAcertos."ACPG_VALOR_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Left = 350.496290000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ACPG_DTA_CADASTRO'
          DataSet = dstRelatorioAcertos
          DataSetName = 'frDBRelatorioAcertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioAcertos."ACPG_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object imgLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 4.779532440000000000
          Width = 143.622140000000000000
          Height = 98.267780000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lblFantasia: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779532440000000000
          Width = 355.275820000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 512.236550000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 590.606680000000000000
          Top = 3.779530000000000000
          Width = 62.362204720000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 654.079160000000000000
          Top = 3.779530000000000000
          Width = 62.362204720000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 516.149613620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 516.149613620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 516.149613620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 516.149613620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 516.149613620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 590.606680000000000000
          Top = 25.322837090000000000
          Width = 124.724399690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 590.606680000000000000
          Top = 46.110238660000000000
          Width = 124.724399690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 590.606680000000000000
          Top = 66.897640240000000000
          Width = 124.724399690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 590.606680000000000000
          Top = 88.440947320000000000
          Width = 124.724399690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 355.275820000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 355.275820000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 84.661417320000000000
          Width = 355.275820000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Anal'#237'tico de Contas a Pagar')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Top = 109.606370000000000000
          Width = 1043.150280000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 355.275820000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 230.551330000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frDBRelatorio."CPAG_ID"'
        StartNewPage = True
        object Shape1: TfrxShapeView
          Top = 2.000000000000000000
          Width = 714.331170000000000000
          Height = 185.196970000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo9: TfrxMemoView
          Left = 2.000000000000000000
          Top = 3.559060000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nr'#186' Reg.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 172.417440000000000000
          Top = 22.456710000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Proveniente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 2.000000000000000000
          Top = 22.456710000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nr'#186' Doc.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 2.000000000000000000
          Top = 79.149660000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fornecedor:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 2.000000000000000000
          Top = 41.354360000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Emiss'#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 172.417440000000000000
          Top = 41.354360000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Vencto:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 308.921494170000000000
          Top = 41.354360000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Pagto:')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 2.000000000000000000
          Top = 60.252010000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Doc.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 172.417440000000000000
          Top = 60.252010000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Juros:')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 570.590910000000000000
          Top = 41.354360000000000000
          Width = 68.031503390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Efetiva'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 2.000000000000000000
          Top = 98.047310000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Plano de Contas:')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 2.000000000000000000
          Top = 116.944960000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo Doc.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 442.205010000000000000
          Top = 3.559060000000000000
          Width = 49.133853390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 172.417440000000000000
          Top = 3.559060000000000000
          Width = 60.472443390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Cadastro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 2.000000000000000000
          Top = 135.842610000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Observa'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 438.425477560000000000
          Top = 41.354360000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Canc.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 79.370130000000000000
          Top = 3.779530000000000000
          Width = 90.708683390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 79.370130000000000000
          Top = 41.354360000000000000
          Width = 90.708683390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EMISSAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_EMISSAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 234.330860000000000000
          Top = 41.354360000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_VCTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_VCTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 363.157700000000000000
          Top = 41.354360000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_PGTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_PGTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 493.118430000000000000
          Top = 60.252010000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_PAGO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_PAGO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 79.370130000000000000
          Top = 98.267780000000000000
          Width = 90.708683390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 79.370130000000000000
          Top = 60.252010000000000000
          Width = 90.708683390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 234.330860000000000000
          Top = 22.677180000000000000
          Width = 404.409673390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_PROVENIENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_PROVENIENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 79.370130000000000000
          Top = 22.677180000000000000
          Width = 90.708683390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_NR_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_NR_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 79.370130000000000000
          Top = 79.370130000000000000
          Width = 483.779803390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_NOME_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 234.330860000000000000
          Top = 3.779530000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 493.118430000000000000
          Top = 3.779530000000000000
          Width = 143.622093620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."STATUS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 79.370130000000000000
          Top = 117.165430000000000000
          Width = 483.779803390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TIPO_DOC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."TIPO_DOC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 172.858380000000000000
          Top = 98.267780000000000000
          Width = 389.291553390000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 308.921494170000000000
          Top = 60.252010000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Mora:')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 438.425477560000000000
          Top = 60.252010000000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Pago:')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 493.118430000000000000
          Top = 41.354360000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_CANC'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_CANC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 640.520100000000000000
          Top = 41.354360000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_DTA_EFETIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_DTA_EFETIVO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 234.330860000000000000
          Top = 60.252010000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_JUROS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_JUROS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 363.157700000000000000
          Top = 60.252010000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CPAG_VALOR_MORA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_VALOR_MORA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 3.779530000000000000
          Top = 154.960730000000000000
          Width = 710.551603390000000000
          Height = 26.456700240000000000
          ShowHint = False
          DataField = 'CPAG_OBS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CPAG_OBS"]')
          ParentFont = False
          WordWrap = False
        end
        object Shape2: TfrxShapeView
          Align = baBottom
          Top = 188.976500000000000000
          Width = 714.331170000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Acertos')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 3.779530000000000000
          Top = 213.653680000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' Reg.')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 82.149660000000000000
          Top = 213.653680000000000000
          Width = 185.196933390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Pagto')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 271.126160000000000000
          Top = 213.653680000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Lancto')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 350.496290000000000000
          Top = 213.653680000000000000
          Width = 75.590563390000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Lancto')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 3.779527559055118000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object dstRelatorioAcertos: TfrxDBDataset
    UserName = 'frDBRelatorioAcertos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ACPG_ID=ACPG_ID'
      'GENE_DESCR=GENE_DESCR'
      'ACPG_VALOR_DOC=ACPG_VALOR_DOC'
      'ACPG_DTA_CADASTRO=ACPG_DTA_CADASTRO')
    DataSource = dmRel_Contas_Pagar.dsAcertos
    BCDToCurrency = False
    Left = 864
    Top = 312
  end
end
