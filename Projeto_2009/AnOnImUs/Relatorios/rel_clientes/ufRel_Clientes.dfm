inherited fRel_Clientes: TfRel_Clientes
  Caption = 'fRel_Clientes'
  ClientHeight = 538
  ClientWidth = 999
  ExplicitWidth = 1005
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Top = 483
    Width = 999
    ExplicitTop = 483
    ExplicitWidth = 999
    inherited btnCancelar: TSpeedButton
      Left = 701
      Top = -60
      ExplicitLeft = 701
      ExplicitTop = -60
    end
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Left = 526
      Visible = False
      ExplicitLeft = 481
    end
    inherited btnImprimir: TSpeedButton
      Anchors = [akRight]
      Enabled = True
      Visible = True
      ExplicitLeft = 627
      ExplicitTop = 4
    end
    inherited btnLocalizar: TSpeedButton
      Left = 351
      Visible = False
      ExplicitLeft = 294
      ExplicitTop = 4
    end
  end
  inherited panelSuperior: TPanel
    Width = 999
    ExplicitWidth = 999
    inherited btnHelp: TSpeedButton
      Left = 798
      ExplicitLeft = 728
    end
    inherited Label1: TLabel
      Width = 144
      Caption = 'Relat'#243'rio de Clientes'
      ExplicitWidth = 144
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 898
      ExplicitLeft = 752
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 999
    Height = 444
    ExplicitWidth = 999
    ExplicitHeight = 444
    inherited grdBasico: TDBGrid
      Width = 995
      Height = 427
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 999
    Height = 444
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object GroupBox3: TGroupBox
      Left = 228
      Top = 369
      Width = 216
      Height = 45
      Caption = 'Dt. Cadastro'
      TabOrder = 4
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
      Left = 228
      Top = 418
      Width = 216
      Height = 45
      Caption = 'Ativos'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      TabOrder = 6
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 450
      Top = 418
      Width = 216
      Height = 45
      Caption = 'Op'#231#227'o de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar'
        'Imprimir')
      TabOrder = 3
    end
    object rdTipo_Impressao: TRadioGroup
      Left = 450
      Top = 369
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
      Top = 369
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
    inline frPesqClientes: TfrPesquisa
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
        Caption = 'Pesquisando Cliente(s)'
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
    end
    inline frPesqPraca: TfrPesquisa
      Left = 390
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
      ExplicitLeft = 390
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
    inline frPesqRotas: TfrPesquisa
      Left = 5
      Top = 186
      Width = 380
      Height = 180
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      ExplicitLeft = 5
      ExplicitTop = 186
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Rota(s)'
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
        ItemIndex = 25
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 48
    Top = 448
  end
  inherited Timer1: TTimer
    Left = 80
    Top = 448
  end
  inherited frRelatorio: TfrxReport
    Left = 720
    Top = 232
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
        Height = 13.228326930000000000
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Align = baLeft
          Left = 0.000000000000000000
          Width = 37.795275590551180000
          Height = 11.338582680000000000
          Font.Height = -8
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 37.795275590551180000
          Width = 132.283464566929000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 170.078740157480200000
          Width = 132.283464566929000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Fantasia')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 302.362204724409200000
          Width = 90.708661420000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 393.070866144409200000
          Width = 137.952755905511800000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 531.023622049921000000
          Width = 113.385826771653500000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 644.409448821574500000
          Width = 113.385826771653500000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 757.795275593228000000
          Width = 22.677165350000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 780.472440943228000000
          Width = 86.929133858267720000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Left = 867.401574801495700000
          Width = 86.929133858267720000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Left = 954.330708659763400000
          Width = 26.456692913385830000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ativo')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Left = 980.787401573149300000
          Width = 60.472440944881890000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
          WordWrap = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 11.338590000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
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
        Height = 11.338590000000000000
        Top = 226.771800000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object Memo2: TfrxMemoView
          Align = baLeft
          Width = 37.795275590551180000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_ID"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 37.795275590551180000
          Width = 132.283464566929000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 170.078740157480200000
          Width = 132.283464566929000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_FANTASIA"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 302.362204724409200000
          Width = 90.708661417322830000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_CNPJ_CPF'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_CNPJ_CPF"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 393.070866141732000000
          Width = 137.952755905511800000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_ENDERECO"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 531.023622047243800000
          Width = 113.385826771653500000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_BAIRRO"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 644.409448818897300000
          Width = 113.385826771653500000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'GENE_DESCR'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_DESCR"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 757.795275590550800000
          Width = 22.677165350000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'GENE_PAR1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_PAR1"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 780.472440940550800000
          Width = 86.929133858267720000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE1"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 867.401574798818500000
          Width = 86.929133858267720000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE2'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE2"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          Left = 954.330708657086300000
          Width = 26.456692913385830000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'ATIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."ATIVO"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Left = 980.787401570472100000
          Width = 60.472440944881890000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIE_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_DTA_CADASTRO"]')
          ParentFont = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Width = 1046.929810000000000000
        inherited lblFantasia: TfrxMemoView
          Width = 668.976377952756000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 828.717070000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 904.307670000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 974.339210000000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 832.630133620000000000
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
          Width = 668.976377952756000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 668.976377952756000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Width = 668.976377950000000000
          Memo.UTF8W = (
            'RELA'#199#195'O DE CLIENTES')
        end
        inherited Line3: TfrxLineView
          Width = 1046.929810000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 668.976377952756000000
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
      'CLIE_ID=CLIE_ID'
      'CLIE_EMPR_ID=CLIE_EMPR_ID'
      'CLIE_RAZAO_SOCIAL=CLIE_RAZAO_SOCIAL'
      'CLIE_FANTASIA=CLIE_FANTASIA'
      'CLIE_CEP=CLIE_CEP'
      'CLIE_ENDERECO=CLIE_ENDERECO'
      'CLIE_BAIRRO=CLIE_BAIRRO'
      'CLIE_GENE_EMPR_ID_PRACA=CLIE_GENE_EMPR_ID_PRACA'
      'CLIE_GENE_TGEN_ID_PRACA=CLIE_GENE_TGEN_ID_PRACA'
      'CLIE_GENE_ID_PRACA=CLIE_GENE_ID_PRACA'
      'CLIE_RG=CLIE_RG'
      'CLIE_TIPO=CLIE_TIPO'
      'CLIE_CNPJ_CPF=CLIE_CNPJ_CPF'
      'CLIE_SITE=CLIE_SITE'
      'CLIE_EMAIL=CLIE_EMAIL'
      'CLIE_ATIVO=CLIE_ATIVO'
      'CLIE_TELEFONE1=CLIE_TELEFONE1'
      'CLIE_TELEFONE2=CLIE_TELEFONE2'
      'CLIE_TELEFONE3=CLIE_TELEFONE3'
      'CLIE_TELEFONE4=CLIE_TELEFONE4'
      'CLIE_DTA_CADASTRO=CLIE_DTA_CADASTRO'
      'CLIE_USER_ID=CLIE_USER_ID'
      'ATIVO=ATIVO'
      'GENE_DESCR=GENE_DESCR'
      'GENE_PAR1=GENE_PAR1')
    DataSource = dmRel_Clientes.dsRel_Clientes
    Left = 648
    Top = 232
  end
  inherited funcBasico: TFuncoes
    Left = 16
    Top = 448
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
    Left = 720
    Top = 280
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
        Top = 393.071120000000000000
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
          Top = 1.133858270000000000
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
          Width = 714.330493858270000000
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
        Height = 143.622140000000000000
        ParentFont = False
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        RowCount = 0
        StartNewPage = True
        object frxDBDataset1CLIE_ID: TfrxMemoView
          Left = 102.047310000000000000
          Top = 1.889763780000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_RAZAO_SOCIAL: TfrxMemoView
          Left = 102.047310000000000000
          Top = 20.787401570000000000
          Width = 291.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_FANTASIA: TfrxMemoView
          Left = 102.047310000000000000
          Top = 41.574830000000000000
          Width = 291.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_TIPO: TfrxMemoView
          Left = 493.228665000000000000
          Top = 1.889763780000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TIPO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_CNPJ_CPF: TfrxMemoView
          Left = 493.228665000000000000
          Top = 20.787401570000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_CNPJ_CPF'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_CNPJ_CPF"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_ENDERECO: TfrxMemoView
          Left = 102.047310000000000000
          Top = 62.362204720000000000
          Width = 291.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_BAIRRO: TfrxMemoView
          Left = 493.228665000000000000
          Top = 62.362204720000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_BAIRRO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1GENE_DESCR: TfrxMemoView
          Left = 102.047310000000000000
          Top = 83.149606300000000000
          Width = 291.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GENE_DESCR'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_DESCR"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_TELEFONE1: TfrxMemoView
          Left = 102.047310000000000000
          Top = 103.937007870000000000
          Width = 86.929133858267700000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_TELEFONE2: TfrxMemoView
          Left = 192.976500000000000000
          Top = 103.937007870000000000
          Width = 86.929133858267700000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE2'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE2"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_DTA_CADASTRO: TfrxMemoView
          Left = 303.141930000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 1.889763780000000000
          Top = 1.889763779527560000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 215.433210000000000000
          Top = 1.889763779527560000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Cadastro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 400.630180000000000000
          Top = 1.889763780000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 597.165740000000000000
          Top = 1.889763779527560000
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Ativo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 1.889763780000000000
          Top = 20.787401570000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Raz'#227'o Social:')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 400.630180000000000000
          Top = 20.787401570000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CPF/CNPJ:')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 1.889763780000000000
          Top = 41.574830000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome Fantasia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 41.574830000000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'RG/Incs. Est.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 1.889763780000000000
          Top = 62.362204720000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 400.630180000000000000
          Top = 62.362204720000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 1.889763780000000000
          Top = 83.149606300000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Top = 83.149606300000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 1.889763780000000000
          Top = 103.937007870000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Telefone(s):')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 1.889763780000000000
          Top = 124.724490000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Site:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 400.630180000000000000
          Top = 124.724490000000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_RG: TfrxMemoView
          Left = 493.228665000000000000
          Top = 41.574830000000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_RG'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_RG"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1GENE_PAR1: TfrxMemoView
          Left = 493.228665000000000000
          Top = 83.149606300000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GENE_PAR1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_PAR1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_ATIVO: TfrxMemoView
          Left = 642.520100000000000000
          Top = 1.889763780000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ATIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."ATIVO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_TELEFONE3: TfrxMemoView
          Left = 283.464750000000000000
          Top = 103.937007870000000000
          Width = 86.929133858267700000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE3'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE3"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_TELEFONE4: TfrxMemoView
          Left = 374.173470000000000000
          Top = 103.937007870000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE4'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_TELEFONE4"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_SITE: TfrxMemoView
          Left = 102.047310000000000000
          Top = 124.724490000000000000
          Width = 291.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_SITE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_SITE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1CLIE_EMAIL: TfrxMemoView
          Left = 493.228665000000000000
          Top = 124.724490000000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_EMAIL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIE_EMAIL"]')
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
          Width = 340.157700000000000000
          Height = 15.118110240000000000
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
          Left = 499.338900000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 574.929500000000000000
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
          Left = 644.961040000000000000
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
          Left = 503.251963620000000000
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
          Left = 503.251963620000000000
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
          Left = 503.251963620000000000
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
          Left = 503.251963620000000000
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
          Left = 503.251963620000000000
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
          Left = 574.929500000000000000
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
          Left = 574.929500000000000000
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
          Left = 574.929500000000000000
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
          Left = 574.929500000000000000
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
            'Relat'#243'rio Anal'#237'ticos de Clientes')
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
      end
    end
  end
end
