inherited fRel_Fornecedores: TfRel_Fornecedores
  Caption = 'fRel_Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1116
      ExplicitLeft = 1116
    end
    inherited lbCadEditar: TLabel
      Left = 1116
      ExplicitLeft = 1116
    end
    inherited lbCadExcluir: TLabel
      Left = 1116
      ExplicitLeft = 1116
    end
    inherited lbCadLocalizar: TLabel
      Left = 1207
      ExplicitLeft = 1207
    end
    inherited lbCadImprimir: TLabel
      Left = 1063
      ExplicitLeft = 1063
    end
    inherited lbCadSair: TLabel
      Left = 1207
      ExplicitLeft = 1207
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
      ExplicitLeft = 828
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 183
      Caption = 'Relat'#243'rio de Fornecedores'
      ExplicitWidth = 183
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1044
    Height = 428
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object GroupBox3: TGroupBox
      Left = 231
      Top = 184
      Width = 216
      Height = 45
      Caption = 'Dt. Cadastro'
      TabOrder = 3
      object edtDtInicio: TDateEdit
        Left = 3
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtFim: TDateEdit
        Left = 108
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object rdAtivo: TRadioGroup
      Left = 231
      Top = 233
      Width = 216
      Height = 45
      Caption = 'Ativos'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      TabOrder = 4
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 453
      Top = 233
      Width = 216
      Height = 45
      Caption = 'Op'#231#227'o de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar'
        'Imprimir')
      TabOrder = 6
    end
    object rdTipo_Impressao: TRadioGroup
      Left = 453
      Top = 184
      Width = 216
      Height = 45
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico'
        'Anal'#237'tico')
      TabOrder = 5
    end
    object rdOrdena: TRadioGroup
      Left = 5
      Top = 184
      Width = 220
      Height = 94
      Caption = 'Ordena'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Raz'#227'o Social'
        'Nome Fantasia'
        'Tipo'
        'Cidade'
        'Dt. Cadastro')
      TabOrder = 2
    end
    inline frPesqFornecedores: TfrPesquisa
      Left = 5
      Top = 2
      Width = 380
      Height = 180
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 2
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Fornecedor(es)'
        ExplicitWidth = 310
        inherited rdContenha: TRadioGroup
          Width = 306
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Width = 306
          ExplicitWidth = 306
        end
        inherited rdMovimento: TRadioGroup
          Left = 56
          ExplicitLeft = 56
        end
      end
      inherited rdOpcoes: TRadioGroup
        ItemIndex = 1
      end
    end
    inline frPesqPraca: TfrPesquisa
      Left = 389
      Top = 2
      Width = 380
      Height = 180
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 389
      ExplicitTop = 2
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Pra'#231'a(s)'
        ExplicitWidth = 310
        inherited rdContenha: TRadioGroup
          Width = 306
          ExplicitWidth = 306
        end
        inherited lbRegistros: TListBox
          Width = 306
          ExplicitWidth = 306
        end
      end
      inherited rdOpcoes: TRadioGroup
        ItemIndex = 2
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 152
    Top = 520
  end
  inherited Timer1: TTimer
    Left = 184
    Top = 520
  end
  inherited frRelatorio: TfrxReport
    Top = 352
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
        Height = 17.007856930000000000
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo2: TfrxMemoView
          Left = 51.692950000000000000
          Width = 141.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 194.535560000000000000
          Width = 141.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Fantasia')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 340.157700000000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 374.173470000000000000
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 487.559370000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 623.622450000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 759.685530000000000000
          Width = 136.062994570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 897.748610000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 964.780150000000000000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 907.087200000000000000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
        inherited Line2: TfrxLineView
          Width = 1046.929810000000000000
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object frxDBDataset1FORN_ID: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_RAZAO_SOCIAL: TfrxMemoView
          Left = 51.692950000000000000
          Width = 141.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_RAZAO_SOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_NOME_FANTASIA: TfrxMemoView
          Left = 194.535560000000000000
          Width = 141.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_NOME_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_CNPJ_CPF: TfrxMemoView
          Left = 374.173470000000000000
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_CNPJ_CPF'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_CNPJ_CPF"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_TIPO: TfrxMemoView
          Left = 340.157700000000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_TIPO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_ENDERECO: TfrxMemoView
          Left = 487.559370000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_BAIRRO: TfrxMemoView
          Left = 623.622450000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_BAIRRO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CIDADE: TfrxMemoView
          Left = 759.685530000000000000
          Width = 136.062994570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_TELEFONE: TfrxMemoView
          Left = 897.748610000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_TELEFONE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_TELEFONE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_DTA_CADASTRO: TfrxMemoView
          Left = 964.780150000000000000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Width = 1046.929810000000000000
        inherited imgLogo: TfrxPictureView
          Top = 3.779527560000000000
        end
        inherited lblFantasia: TfrxMemoView
          Top = 3.779527560000000000
          Width = 668.976810000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 828.717070000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 904.307670000000000000
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 974.339210000000000000
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 832.630133620000000000
          Top = 3.779527560000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 832.630133620000000000
          Top = 18.787401570000000000
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
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 832.630133620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 904.307670000000000000
          Top = 18.787401570000000000
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
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 904.307670000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Top = 18.787401570000000000
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
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Relat'#243'rio Sint'#233'tico de Fornecedores')
        end
        inherited Line3: TfrxLineView
          Top = 109.606370000000000000
          Width = 1046.929810000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Top = 718.110700000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'FORN_ID=FORN_ID'
      'FORN_RAZAO_SOCIAL=FORN_RAZAO_SOCIAL'
      'FORN_NOME_FANTASIA=FORN_NOME_FANTASIA'
      'FORN_CNPJ_CPF=FORN_CNPJ_CPF'
      'FORN_IE=FORN_IE'
      'FORN_CEP=FORN_CEP'
      'FORN_ENDERECO=FORN_ENDERECO'
      'FORN_BAIRRO=FORN_BAIRRO'
      'FORN_GENE_EMPR_ID_PRACA=FORN_GENE_EMPR_ID_PRACA'
      'FORN_GENE_TGEN_ID_PRACA=FORN_GENE_TGEN_ID_PRACA'
      'FORN_GENE_ID_PRACA=FORN_GENE_ID_PRACA'
      'FORN_CONTATO=FORN_CONTATO'
      'FORN_TELEFONE=FORN_TELEFONE'
      'FORN_FAX=FORN_FAX'
      'FORN_SITE=FORN_SITE'
      'FORN_EMAIL=FORN_EMAIL'
      'FORN_ATIVO=FORN_ATIVO'
      'FORN_TIPO=FORN_TIPO'
      'FORN_DTA_CADASTRO=FORN_DTA_CADASTRO'
      'FORN_USER_ID=FORN_USER_ID'
      'ATIVO=ATIVO'
      'CIDADE=CIDADE'
      'UF=UF')
    DataSource = dmRel_Fornecedores.dsRel_Fornecedores
  end
  inherited funcBasico: TFuncoes
    Left = 120
    Top = 520
  end
  object frxRelatorioAnalitico: TfrxReport
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
    Left = 648
    Top = 400
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
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
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858270000000000
          Width = 154.960629921259800000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
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
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 714.331170000000000000
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
        Height = 238.110390000000000000
        ParentFont = False
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        RowCount = 0
        StartNewPage = True
        object frxDBDataset1FORN_ID: TfrxMemoView
          Left = 108.385900000000000000
          Width = 56.692913390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_RAZAO_SOCIAL: TfrxMemoView
          Left = 108.385900000000000000
          Top = 18.897637800000000000
          Width = 379.842673460000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_RAZAO_SOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_NOME_FANTASIA: TfrxMemoView
          Left = 108.385900000000000000
          Top = 35.905511810000000000
          Width = 379.842673460000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_NOME_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_CNPJ_CPF: TfrxMemoView
          Left = 585.606680000000000000
          Top = 18.897637800000000000
          Width = 128.504020000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_CNPJ_CPF'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_CNPJ_CPF"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_TIPO: TfrxMemoView
          Left = 405.409710000000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_TIPO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_ENDERECO: TfrxMemoView
          Left = 108.385900000000000000
          Top = 52.913385830000000000
          Width = 245.669364570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_BAIRRO: TfrxMemoView
          Left = 405.409710000000000000
          Top = 52.913385830000000000
          Width = 230.551244570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_BAIRRO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CIDADE: TfrxMemoView
          Left = 108.385900000000000000
          Top = 69.811035830000000000
          Width = 136.062994570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_TELEFONE: TfrxMemoView
          Left = 108.385900000000000000
          Top = 86.929190000000000000
          Width = 75.590551181102400000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_TELEFONE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_TELEFONE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_DTA_CADASTRO: TfrxMemoView
          Left = 276.905690000000000000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 1.889763780000000000
          Width = 49.133890000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 1.889763780000000000
          Top = 18.897637800000000000
          Width = 100.157453460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social:')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 1.889763780000000000
          Top = 35.905511810000000000
          Width = 100.157453460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Fantasia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 367.614324570000000000
          Width = 34.015770000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 510.236550000000000000
          Top = 18.897637800000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ:')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 1.889763780000000000
          Top = 52.913385830000000000
          Width = 64.251924570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 356.275820000000000000
          Top = 52.913385830000000000
          Width = 45.354274570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 1.889763780000000000
          Top = 69.811035830000000000
          Width = 56.692864570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 1.889763780000000000
          Top = 86.929190000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 189.976414570000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cadastro:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset1FORN_ATIVO: TfrxMemoView
          Left = 665.197280000000000000
          Width = 49.133890000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_ATIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_ATIVO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 619.842920000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ativo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 491.338900000000000000
          Top = 35.905511810000000000
          Width = 90.708720000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RG/Insc. Est.:')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_IE: TfrxMemoView
          Left = 585.606680000000000000
          Top = 35.905511810000000000
          Width = 128.504020000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_IE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_IE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 375.173470000000000000
          Top = 69.811035830000000000
          Width = 26.456624570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset1UF: TfrxMemoView
          Left = 405.409710000000000000
          Top = 69.811035830000000000
          Width = 34.015770000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."UF"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_FAX: TfrxMemoView
          Left = 190.756030000000000000
          Top = 86.929190000000000000
          Width = 75.590551181102400000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_FAX'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_FAX"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 1.889763780000000000
          Top = 104.047310000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Site:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 356.275734570000000000
          Top = 104.047310000000000000
          Width = 45.354360000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 1.889763780000000000
          Top = 121.724490000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contato:')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_CONTATO: TfrxMemoView
          Left = 108.385900000000000000
          Top = 121.724490000000000000
          Width = 400.630180000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_CONTATO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_CONTATO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_SITE: TfrxMemoView
          Left = 108.385900000000000000
          Top = 104.047310000000000000
          Width = 245.669364570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_SITE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_SITE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1FORN_EMAIL: TfrxMemoView
          Left = 405.409710000000000000
          Top = 104.047310000000000000
          Width = 230.551330000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FORN_EMAIL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_EMAIL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        StartNewPage = True
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
          Width = 340.157700000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 499.118430000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 574.709030000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 644.740570000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 503.031493620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 503.031493620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 503.031493620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 503.031493620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 503.031493620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 574.709030000000000000
          Top = 25.322837090000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 574.709030000000000000
          Top = 46.110238660000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 574.709030000000000000
          Top = 66.897640240000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 574.709030000000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 340.157700000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 340.157700000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 87.929192440000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio An'#225'litico de Fornecedores')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = -0.220470000000000000
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 340.157700000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
end
