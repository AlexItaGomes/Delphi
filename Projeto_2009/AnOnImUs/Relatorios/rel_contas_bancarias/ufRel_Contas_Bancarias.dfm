inherited fRel_Contas_Bancarias: TfRel_Contas_Bancarias
  Caption = 'fRel_Contas_Bancarias'
  ClientHeight = 606
  ClientWidth = 1005
  ExplicitWidth = 1011
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Top = 551
    Width = 1005
    ExplicitTop = 551
    ExplicitWidth = 910
    inherited lbCadNovo: TLabel
      Left = 978
      ExplicitLeft = 1052
    end
    inherited lbCadEditar: TLabel
      Left = 978
      ExplicitLeft = 1052
    end
    inherited lbCadExcluir: TLabel
      Left = 978
      ExplicitLeft = 1052
    end
    inherited lbCadLocalizar: TLabel
      Left = 1069
      ExplicitLeft = 1143
    end
    inherited lbCadImprimir: TLabel
      Left = 1069
      ExplicitLeft = 1143
    end
    inherited lbCadSair: TLabel
      Left = 1069
      ExplicitLeft = 1143
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
      ExplicitLeft = 701
      ExplicitTop = 4
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    Width = 1005
    ExplicitWidth = 910
    inherited btnHelp: TSpeedButton
      Left = 804
      ExplicitLeft = 854
    end
    inherited Label1: TLabel
      Width = 316
      Caption = 'Relat'#243'rio de Movimenta'#231#245'es Banc'#225'rias'
      ExplicitWidth = 316
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 904
      ExplicitLeft = 878
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 1005
    Height = 512
    ExplicitWidth = 910
    ExplicitHeight = 512
    inherited grdBasico: TDBGrid
      Width = 1001
      Height = 495
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1005
    Height = 512
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = -72
    ExplicitTop = 58
    object rdTipo_Impressao: TRadioGroup
      Left = 8
      Top = 182
      Width = 216
      Height = 45
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sint'#233'tico'
        'Anal'#237'tico')
      TabOrder = 2
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 8
      Top = 229
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
    object GroupBox7: TGroupBox
      Left = 228
      Top = 229
      Width = 216
      Height = 45
      Caption = 'Dt. Movimento'
      TabOrder = 5
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
    object rdStatus: TRadioGroup
      Left = 228
      Top = 182
      Width = 216
      Height = 45
      Caption = 'Ativo'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      TabOrder = 4
    end
    inline frPesqContaBancaria: TfrPesquisa
      Left = 8
      Top = 1
      Width = 380
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 1
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Conta Banc'#225'ria'
        ExplicitWidth = 310
        inherited Label2: TLabel
          Width = 29
          Caption = 'Conta'
          ExplicitWidth = 29
        end
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
        ItemIndex = 8
      end
    end
    inline frPesqMovimentacao: TfrPesquisa
      Left = 392
      Top = 1
      Width = 380
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 392
      ExplicitTop = 1
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Movimenta'#231#227'o Banc'#225'ria'
        ExplicitWidth = 310
        inherited Label2: TLabel
          Width = 69
          Caption = 'Movimenta'#231#227'o'
          ExplicitWidth = 69
        end
        inherited btnPesq: TSpeedButton
          OnClick = frPesqMovimentacaobtnPesqClick
        end
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
        ItemIndex = 27
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 568
    Top = 432
  end
  inherited Timer1: TTimer
    Left = 600
    Top = 432
  end
  inherited ppBasico: TPopupMenu
    Left = 632
    Top = 432
  end
  inherited frRelatorio: TfrxReport
    Left = 696
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      PaperSize = 256
      inherited PageHeader1: TfrxPageHeader
        Height = 1.889736929999990000
        inherited Line4: TfrxLineView
          Top = 0.000000000000000000
          Width = 1046.929810000000000000
          Visible = False
        end
        inherited Memo15: TfrxMemoView
          Width = 71.811070000000000000
          Height = 0.000000000000000000
          Memo.UTF8W = (
            'C'#243'digo:')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 393.071120000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
        inherited Line2: TfrxLineView
          Width = 714.331170000000000000
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 117.165430000000000000
        Top = 215.433210000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        StartNewPage = True
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
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
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 17.897650000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 190.756030000000000000
          Top = 35.795300000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Banco:')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 95.047310000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Gerente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 3.779530000000000000
          Top = 75.149660000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr. Inicial:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 190.756030000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
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
        end
        object Memo25: TfrxMemoView
          Left = 190.756030000000000000
          Top = 75.149660000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr. Atual:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 35.795300000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Banco:')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 383.512060000000000000
          Top = 54.692950000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Conta:')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 54.692950000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ag'#234'ncia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 383.512060000000000000
          Top = 75.149660000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Limite Cr'#233'd.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 383.512060000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
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
        object Memo46: TfrxMemoView
          Left = 190.756030000000000000
          Top = 54.692950000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Conta:')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 81.708720000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 81.708720000000000000
          Top = 17.897650000000000000
          Width = 627.401980000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 277.685220000000000000
          Top = 35.795300000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'BANCO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."BANCO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 81.708720000000000000
          Top = 95.047310000000000000
          Width = 385.512060000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_GERENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_GERENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Left = 81.708720000000000000
          Top = 75.149660000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_VALOR_INICIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_VALOR_INICIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 277.685220000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          Left = 81.708720000000000000
          Top = 35.795300000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'COD_BANCO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."COD_BANCO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 277.685220000000000000
          Top = 75.149660000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_SALDO_ATUAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_SALDO_ATUAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo55: TfrxMemoView
          Left = 471.441250000000000000
          Top = 54.692950000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_TIPO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo57: TfrxMemoView
          Left = 81.708720000000000000
          Top = 54.692950000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_AGENCIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_AGENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Left = 471.441250000000000000
          Top = 75.149660000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_LIMITE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_LIMITE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo59: TfrxMemoView
          Left = 471.441250000000000000
          Width = 41.574830000000000000
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
        object Memo60: TfrxMemoView
          Left = 277.685220000000000000
          Top = 54.692950000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_CONTA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_CONTA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Base:')
          ParentFont = False
          WordWrap = False
        end
        object Memo56: TfrxMemoView
          Left = 606.724800000000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DIA_LIMITE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DIA_LIMITE"]')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Width = 340.157700000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Font.Height = -9
          Memo.UTF8W = (
            '...')
          WordWrap = False
        end
        inherited lblEndereco: TfrxMemoView
          Width = 340.157700000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 340.157700000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Width = 340.157700000000000000
          Memo.UTF8W = (
            'CONTAS BANC'#193'RIAS')
        end
        inherited lblTelefone: TfrxMemoView
          Width = 340.157700000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'CBCO_ID=CBCO_ID'
      'CBCO_EMPR_ID=CBCO_EMPR_ID'
      'CBCO_GENE_EMPR_ID_BCO=CBCO_GENE_EMPR_ID_BCO'
      'CBCO_GENE_TGEN_ID_BCO=CBCO_GENE_TGEN_ID_BCO'
      'CBCO_GENE_ID_BCO=CBCO_GENE_ID_BCO'
      'CBCO_AGENCIA=CBCO_AGENCIA'
      'CBCO_CONTA=CBCO_CONTA'
      'CBCO_TIPO=CBCO_TIPO'
      'TIPO=TIPO'
      'CBCO_GERENTE=CBCO_GERENTE'
      'CBCO_VALOR_INICIAL=CBCO_VALOR_INICIAL'
      'CBCO_SALDO_ATUAL=CBCO_SALDO_ATUAL'
      'CBCO_ATIVO=CBCO_ATIVO'
      'ATIVO=ATIVO'
      'CBCO_DTA_CADASTRO=CBCO_DTA_CADASTRO'
      'CBCO_USER_ID=CBCO_USER_ID'
      'CBCO_LIMITE=CBCO_LIMITE'
      'BANCO=BANCO'
      'COD_BANCO=COD_BANCO'
      'CBCO_DESCRICAO=CBCO_DESCRICAO'
      'CBCO_DIA_LIMITE=CBCO_DIA_LIMITE')
    DataSource = dmRel_Contas_Bancarias.dsContas_Bancarias
    Left = 664
    Top = 256
  end
  inherited funcBasico: TFuncoes
    Left = 536
    Top = 432
  end
  object dstRelatorioAnalitico: TfrxDBDataset
    UserName = 'frDBRelatorioMov'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ORIGEM_DOCUMENTO=ORIGEM_DOCUMENTO'
      'NR_DOCUMENTO=NR_DOCUMENTO'
      'CBMV_ID=CBMV_ID'
      'MOVIMENTACAO=MOVIMENTACAO'
      'TIPO_MOV=TIPO_MOV'
      'DEDUTIVEL=DEDUTIVEL'
      'CBMV_VALOR_MOV=CBMV_VALOR_MOV'
      'CBMV_SALDO_DISP=CBMV_SALDO_DISP'
      'CBCO_SALDO_ATUAL=CBCO_SALDO_ATUAL'
      'CBMV_DTA_CADASTRO=CBMV_DTA_CADASTRO'
      'CBMV_EMPR_ID=CBMV_EMPR_ID'
      'CBMV_CBCO_ID=CBMV_CBCO_ID'
      'CBMV_CBCO_EMPR_ID=CBMV_CBCO_EMPR_ID'
      'CBMV_GENE_EMPR_ID_TIPO_MOV=CBMV_GENE_EMPR_ID_TIPO_MOV'
      'CBMV_GENE_TGEN_ID_TIPO_MOV=CBMV_GENE_TGEN_ID_TIPO_MOV'
      'CBMV_GENE_ID_TIPO_MOV=CBMV_GENE_ID_TIPO_MOV'
      'CBMV_USER_ID=CBMV_USER_ID'
      'BANCO=BANCO'
      'COD_BANCO=COD_BANCO'
      'CBCO_LIMITE=CBCO_LIMITE'
      'CLIENTE_FORNECEDOR=CLIENTE_FORNECEDOR'
      'PROVENIENTE=PROVENIENTE')
    DataSource = dmRel_Contas_Bancarias.dsMovimentacao_Bancaria
    BCDToCurrency = False
    Left = 584
    Top = 320
  end
  object frRelatorioMov: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 41370.569442465300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 696
    Top = 320
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end
      item
        DataSet = dstRelatorioAnalitico
        DataSetName = 'frDBRelatorioMov'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 468.661720000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858267716540000
          Width = 128.504020000000000000
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
          Left = 982.677800000000000000
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
          Left = 1.559060000000000000
          Width = 1043.150280000000000000
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
        Height = 75.590600000000000000
        ParentFont = False
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        RowCount = 0
        StartNewPage = True
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
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
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 190.756030000000000000
          Top = 36.795300000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Banco:')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 54.472480000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Gerente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 381.732530000000000000
          Top = 36.795300000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr. Inicial:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 190.756030000000000000
          Top = 1.000000000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
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
        end
        object Memo25: TfrxMemoView
          Left = 568.709030000000000000
          Top = 36.795300000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr. Atual:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 36.795300000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Banco:')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 761.465060000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Conta:')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 381.732530000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ag'#234'ncia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 761.465060000000000000
          Top = 36.795300000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Limite Cr'#233'd.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 381.732530000000000000
          Top = 1.000000000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
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
        object Memo46: TfrxMemoView
          Left = 568.709030000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Conta:')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 81.708720000000000000
          Top = 1.000000000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 81.708720000000000000
          Top = 18.897650000000000000
          Width = 294.803340000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 277.685220000000000000
          Top = 36.795300000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'BANCO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."BANCO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 81.708720000000000000
          Top = 54.472480000000000000
          Width = 370.393940000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_GERENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_GERENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Left = 456.661720000000000000
          Top = 36.795300000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_VALOR_INICIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 277.685220000000000000
          Top = 1.000000000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          Left = 81.708720000000000000
          Top = 36.795300000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'COD_BANCO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."COD_BANCO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 640.520100000000000000
          Top = 36.795300000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_SALDO_ATUAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo55: TfrxMemoView
          Left = 849.394250000000000000
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_TIPO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo57: TfrxMemoView
          Left = 456.661720000000000000
          Top = 18.897650000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_AGENCIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_AGENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Left = 849.394250000000000000
          Top = 36.795300000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_LIMITE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo59: TfrxMemoView
          Left = 456.661720000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
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
        object Memo60: TfrxMemoView
          Left = 640.520100000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_CONTA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_CONTA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 568.709030000000000000
          Top = 1.000000000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Base:')
          ParentFont = False
          WordWrap = False
        end
        object Memo56: TfrxMemoView
          Left = 640.520100000000000000
          Top = 1.000000000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CBCO_DIA_LIMITE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CBCO_DIA_LIMITE"]')
          ParentFont = False
          WordWrap = False
        end
        object Line4: TfrxLineView
          Left = -0.220470000000000000
          Top = 71.724490000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
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
          Width = 668.976810000000000000
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
          Left = 828.717070000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 904.307670000000000000
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
          Left = 974.339210000000000000
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
          Left = 832.630133620000000000
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
          Left = 832.630133620000000000
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
          Left = 832.630133620000000000
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
          Left = 832.630133620000000000
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
          Left = 832.630133620000000000
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
          Left = 904.307670000000000000
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
          Left = 904.307670000000000000
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
          Left = 904.307670000000000000
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
          Left = 904.307670000000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
          WordWrap = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 668.976810000000000000
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
          Width = 668.976810000000000000
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
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'CONTAS BANC'#193'RIAS (ANAL'#205'TICO)')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = -0.220470000000000000
          Top = 109.606370000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 668.976810000000000000
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
      object DetailData1: TfrxDetailData
        Height = 15.118120000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioAnalitico
        DataSetName = 'frDBRelatorioMov'
        RowCount = 0
        object Memo15: TfrxMemoView
          Left = 3.779527559055118000
          Width = 117.165354330708700000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORIGEM_DOCUMENTO'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioMov."ORIGEM_DOCUMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 582.803149606299200000
          Width = 217.322834650000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROVENIENTE'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioMov."PROVENIENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 122.834645669291300000
          Width = 52.913385826771650000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CBMV_ID'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioMov."CBMV_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 178.015748031496100000
          Width = 181.417317950000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MOVIMENTACAO'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioMov."MOVIMENTACAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 802.393700787401600000
          Width = 52.913385826771650000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TIPO_MOV'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioMov."TIPO_MOV"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 858.330708661417300000
          Width = 45.354330708661420000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'DEDUTIVEL'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioMov."DEDUTIVEL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 904.440944881889800000
          Width = 68.031496060000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioMov."CBMV_VALOR_MOV"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 975.496062992126000000
          Width = 68.031496060000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioMov."CBMV_SALDO_DISP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 361.700787401574800000
          Width = 217.322834650000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIENTE_FORNECEDOR'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioMov."CLIENTE_FORNECEDOR"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioMov."CBMV_DTA_CADASTRO"'
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.559060000000000000
          Width = 143.622140000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Movimenta'#231#245'es do Dia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779527559055118000
          Top = 21.015770000000000000
          Width = 117.165354330708700000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Origem')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 582.803149606299200000
          Top = 21.015770000000000000
          Width = 90.708646770000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 122.834645669291300000
          Top = 21.015770000000000000
          Width = 52.913385826771650000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'ID Mov.')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 178.015748031496100000
          Top = 21.015770000000000000
          Width = 98.267780000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Movimenta'#231#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 802.393700787401600000
          Top = 21.015770000000000000
          Width = 52.913385826771650000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tp. Mov.')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 858.330708661417300000
          Top = 21.015770000000000000
          Width = 45.354330708661420000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Deduz.')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 904.440944881889800000
          Top = 21.015770000000000000
          Width = 68.031496060000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Mov.')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 975.496062992126000000
          Top = 21.015770000000000000
          Width = 68.031496060000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Saldo')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 151.181200000000000000
          Top = 4.559060000000000000
          Width = 162.519790000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CBMV_DTA_CADASTRO'
          DataSet = dstRelatorioAnalitico
          DataSetName = 'frDBRelatorioMov'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioMov."CBMV_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 361.700787401574800000
          Top = 21.015770000000000000
          Width = 120.944960000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente/Fornecedor')
          ParentFont = False
          WordWrap = False
        end
      end
      object Header1: TfrxHeader
        Top = 188.976500000000000000
        Width = 1046.929810000000000000
      end
      object Footer1: TfrxFooter
        Top = 408.189240000000000000
        Width = 1046.929810000000000000
      end
    end
  end
end
