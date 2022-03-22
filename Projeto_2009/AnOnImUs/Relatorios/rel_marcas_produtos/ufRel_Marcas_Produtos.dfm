inherited fRel_Marcas_Produtos: TfRel_Marcas_Produtos
  Caption = 'fRel_Marcas_Produtos'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1196
      ExplicitLeft = 1196
    end
    inherited lbCadEditar: TLabel
      Left = 1196
      ExplicitLeft = 1196
    end
    inherited lbCadExcluir: TLabel
      Left = 1196
      ExplicitLeft = 1196
    end
    inherited lbCadLocalizar: TLabel
      Left = 1287
      ExplicitLeft = 1287
    end
    inherited lbCadImprimir: TLabel
      Left = 1287
      ExplicitLeft = 1287
    end
    inherited lbCadSair: TLabel
      Left = 1287
      ExplicitLeft = 1287
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
      ExplicitLeft = 832
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 223
      Caption = 'Rel. de Marcas de Produtos'
      ExplicitWidth = 223
    end
  end
  inherited gropGridPrincipal: TGroupBox
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1040
      Height = 426
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object GroupBox6: TGroupBox
        Left = 518
        Top = 10
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro'
        TabOrder = 1
        object edtDtInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object rdOrdena: TRadioGroup
        Left = 518
        Top = 77
        Width = 216
        Height = 45
        Caption = 'Ordena'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o')
        TabOrder = 2
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 518
        Top = 145
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
      inline frPesqMarca: TfrPesquisa
        Left = 5
        Top = 10
        Width = 508
        Height = 180
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 10
        ExplicitWidth = 508
        inherited GroupBox1: TGroupBox
          Width = 379
          ExplicitWidth = 379
          inherited Label2: TLabel
            Width = 70
            Caption = 'Marca Produto'
            ExplicitWidth = 70
          end
          inherited rdContenha: TRadioGroup
            Width = 375
            ExplicitWidth = 375
          end
          inherited lbRegistros: TListBox
            Width = 375
            ExplicitWidth = 375
          end
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 14
        end
      end
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        Height = 20.787386930000000000
        inherited Line4: TfrxLineView
          Top = 17.338590000000000000
        end
        inherited Memo15: TfrxMemoView
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo2: TfrxMemoView
          Left = 75.590600000000000000
          Width = 374.173470000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 309.921460000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 234.330860000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object frDBRelatorioGENE_ID: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'GENE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_ID"]')
          ParentFont = False
        end
        object frDBRelatorioGENE_DESCR: TfrxMemoView
          Left = 75.590600000000000000
          Width = 374.173470000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'GENE_DESCR'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_DESCR"]')
          ParentFont = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Height = 15.118110236220500000
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
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'Rela'#231#227'o de Marcas de Produtos')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'GENE_ID=GENE_ID'
      'GENE_DESCR=GENE_DESCR')
    DataSource = dmRel_Marcas_Produtos.dsRelMarcas
  end
end
