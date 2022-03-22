inherited fRel_Produtos: TfRel_Produtos
  Caption = 'fRel_Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1204
      ExplicitLeft = 1204
    end
    inherited lbCadEditar: TLabel
      Left = 1204
      ExplicitLeft = 1204
    end
    inherited lbCadExcluir: TLabel
      Left = 1204
      ExplicitLeft = 1204
    end
    inherited lbCadLocalizar: TLabel
      Left = 1295
      ExplicitLeft = 1295
    end
    inherited lbCadImprimir: TLabel
      Left = 1295
      ExplicitLeft = 1295
    end
    inherited lbCadSair: TLabel
      Left = 1295
      ExplicitLeft = 1295
    end
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
      ExplicitLeft = 169
      ExplicitTop = 4
    end
    inherited btnImprimir: TSpeedButton
      Anchors = [akRight]
      Enabled = True
      Visible = True
      ExplicitLeft = 647
      ExplicitTop = 2
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited btnHelp: TSpeedButton
      ExplicitLeft = 857
      ExplicitTop = -4
    end
    inherited lbVersion: TLabel
      ExplicitLeft = 947
    end
    inherited Label1: TLabel
      Width = 115
      Caption = 'Rel. de Produtos'
      ExplicitWidth = 115
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Left = 224
    Top = 110
    Width = 345
    Height = 331
    Align = alNone
    ExplicitLeft = 224
    ExplicitTop = 110
    ExplicitWidth = 345
    ExplicitHeight = 331
    inherited grdBasico: TDBGrid
      Width = 341
      Height = 314
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 341
      Height = 314
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 39
    Width = 1044
    Height = 428
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Inclus'#245'es'
      inline frPesqProduto: TfrPesquisa
        Left = 5
        Top = 10
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 10
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 38
            Caption = 'Produto'
            ExplicitTop = 14
            ExplicitWidth = 38
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            OnClick = frPesqProdutobtnPesqClick
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 16
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqFornec: TfrPesquisa
        Left = 440
        Top = 10
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 440
        ExplicitTop = 10
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 55
            Caption = 'Fornecedor'
            ExplicitTop = 14
            ExplicitWidth = 55
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 1
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqTipoProd: TfrPesquisa
        Left = 5
        Top = 162
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 5
        ExplicitTop = 162
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 61
            Caption = 'Tipo Produto'
            ExplicitTop = 14
            ExplicitWidth = 61
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 12
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqGrupo: TfrPesquisa
        Left = 440
        Top = 162
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 440
        ExplicitTop = 162
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 70
            Caption = 'Grupo Produto'
            ExplicitTop = 14
            ExplicitWidth = 70
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 13
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqMarca: TfrPesquisa
        Left = 5
        Top = 314
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ExplicitLeft = 5
        ExplicitTop = 314
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 70
            Caption = 'Marca Produto'
            ExplicitTop = 14
            ExplicitWidth = 70
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 14
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqModelo: TfrPesquisa
        Left = 440
        Top = 314
        Width = 430
        Height = 150
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        ExplicitLeft = 440
        ExplicitTop = 314
        ExplicitWidth = 430
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 150
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 75
            Caption = 'Modelo Produto'
            ExplicitTop = 14
            ExplicitWidth = 75
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 377
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 377
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 15
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Filtros'
      ImageIndex = 1
      object rdTipo_Impressao: TRadioGroup
        Left = 5
        Top = 208
        Width = 216
        Height = 45
        Caption = 'Tipo de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sint'#233'tico'
          'Anal'#237'tico')
        TabOrder = 4
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 227
        Top = 208
        Width = 216
        Height = 45
        Caption = 'Op'#231#245'es Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 5
      end
      object GroupBox6: TGroupBox
        Left = 5
        Top = 157
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro'
        TabOrder = 2
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
      object rdAtivo: TRadioGroup
        Left = 227
        Top = 157
        Width = 216
        Height = 45
        Caption = 'Ativos'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Todos')
        TabOrder = 3
      end
      object rdOrdena: TRadioGroup
        Left = 5
        Top = 5
        Width = 216
        Height = 153
        Caption = 'Ordenado'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'C'#243'd. Prod.'
          'Descri'#231#227'o'
          'Fornecedor'
          'Grupo Prod.'
          'Marca Prod.'
          'Modelo Prod.')
        TabOrder = 0
      end
      object rdTipoEstoque: TRadioGroup
        Left = 227
        Top = 5
        Width = 216
        Height = 153
        Caption = 'Tipo de Estoque'
        ItemIndex = 4
        Items.Strings = (
          'Est. Disp. < Est. Min'#237'mo'
          'Est. Disp. > Est. Min'#237'mo'
          'Est. Disp. = Est. Min'#237'mo'
          'Est. Disp. > 0'
          'Est. Atual > 0'
          'Todos')
        TabOrder = 1
      end
    end
  end
  inherited ppBasico: TPopupMenu
    Top = 110
  end
  inherited frRelatorio: TfrxReport
    Left = 928
    Top = 296
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
        Height = 12.472440940000000000
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Left = 1.889763780000000000
          Width = 37.795263390000000000
          Height = 10.582677170000000000
          Font.Height = -8
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo16: TfrxMemoView
          Left = 42.133890000000000000
          Width = 204.094583390000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 249.110145910000000000
          Width = 26.456673390000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 278.346359060000000000
          Width = 170.078813390000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 451.543600000000000000
          Width = 98.267728740000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Prod.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 553.149970000000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grupo Prod.')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 634.520100000000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca Prod.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 715.551395910000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo Prod.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 797.102362200000000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Est. Atual')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 984.338939060000000000
          Width = 60.472443390000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 859.464566929134000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Ent.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 921.448818900000000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Venda')
          ParentFont = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 374.173470000000000000
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
        Height = 11.338590000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object dstRelatorioPROD_ID: TfrxMemoView
          Left = 1.889763780000000000
          Width = 37.795263390000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'PROD_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_DESCRICAO: TfrxMemoView
          Left = 42.133890000000000000
          Width = 204.094583390000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_UNIDADE: TfrxMemoView
          Left = 249.110145910000000000
          Width = 26.456673390000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioFORN_NOME_FANTASIA: TfrxMemoView
          Left = 278.346359060000000000
          Width = 170.078813390000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'FORN_NOME_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."FORN_NOME_FANTASIA"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioTIPO_PROD: TfrxMemoView
          Left = 451.543600000000000000
          Width = 98.267728740000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'TIPO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."TIPO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioGRUPO_PROD: TfrxMemoView
          Left = 553.149970000000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'GRUPO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Memo.UTF8W = (
            '[frDBRelatorio."GRUPO_PROD"]')
          WordWrap = False
        end
        object dstRelatorioMARCA_PROD: TfrxMemoView
          Left = 634.520100000000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Memo.UTF8W = (
            '[frDBRelatorio."MARCA_PROD"]')
          WordWrap = False
        end
        object dstRelatorioMODELO_PROD: TfrxMemoView
          Left = 715.551395910000000000
          Width = 79.370078740000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Memo.UTF8W = (
            '[frDBRelatorio."MODELO_PROD"]')
          WordWrap = False
        end
        object dstRelatorioESTQ_EST_DISP: TfrxMemoView
          Left = 797.102362200000000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'ESTQ_EST_ATUAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."ESTQ_EST_ATUAL"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_DTA_CADASTRO: TfrxMemoView
          Left = 984.338939060000000000
          Width = 60.472443390000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'PROD_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_DTA_CADASTRO"]')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 859.464566930000000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'PROD_VLR_CUSTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_VLR_CUSTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 921.448818900000000000
          Width = 60.472440940000000000
          Height = 10.582677170000000000
          ShowHint = False
          DataField = 'VLR_VENDA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."VLR_VENDA"]')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Width = 1046.929810000000000000
        inherited lblFantasia: TfrxMemoView
          Width = 668.976810000000000000
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 828.717070000000000000
          Top = 3.779530000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 904.307670000000000000
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 975.339210000000000000
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 832.630133622047000000
          Top = 3.779527559055120000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 832.630133620000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 832.630133622047000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 832.630133622047000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 832.630133622047000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 903.528230310000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Left = 903.528230310000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Left = 903.528230310000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 903.528230310000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Width = 668.976810000000000000
          Height = 15.118110236220500000
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
            'Rela'#231#227'o Sint'#233'tica de Produtos')
        end
        inherited Line3: TfrxLineView
          Width = 1046.929810000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 668.976810000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Left = 1.000000000000000000
        Top = 718.110700000000000000
        Width = 1043.150280000000000000
      end
      object ReportSummary1: TfrxReportSummary
        Height = 56.692913390000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Left = 948.662030000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frDBRelatorio."ESTQ_EST_ATUAL">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 719.110700000000000000
          Top = 2.000000000000000000
          Width = 226.771760940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Estoque Atual:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 948.662030000000000000
          Top = 19.118120000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(<frDBRelatorio."ESTQ_EST_ATUAL">*<frDBRelatorio."PROD_VL' +
              'R_CUSTO">,MasterData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 719.110700000000000000
          Top = 19.118120000000000000
          Width = 226.771760940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo do Estoque:')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo23: TfrxMemoView
          Left = 948.662030000000000000
          Top = 36.015770000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(<frDBRelatorio."ESTQ_EST_ATUAL">*<frDBRelatorio."VLR_VEN' +
              'DA">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 719.110700000000000000
          Top = 36.015770000000000000
          Width = 226.771760940000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor de Venda:')
          ParentFont = False
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'PROD_ID=PROD_ID'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_UNIDADE=PROD_UNIDADE'
      'PROD_ATIVO=PROD_ATIVO'
      'PROD_DTA_ULT_COMPRA=PROD_DTA_ULT_COMPRA'
      'PROD_VLR_CUSTO=PROD_VLR_CUSTO'
      'PROD_ESTQ_INICIAL=PROD_ESTQ_INICIAL'
      'PROD_ESTQ_MINIMO=PROD_ESTQ_MINIMO'
      'PROD_GARANTIA=PROD_GARANTIA'
      'PROD_FLG_FRACIONADO=PROD_FLG_FRACIONADO'
      'PROD_DTA_CADASTRO=PROD_DTA_CADASTRO'
      'FORN_NOME_FANTASIA=FORN_NOME_FANTASIA'
      'TIPO_PROD=TIPO_PROD'
      'GRUPO_PROD=GRUPO_PROD'
      'MARCA_PROD=MARCA_PROD'
      'MODELO_PROD=MODELO_PROD'
      'ALIQUOTA_ECF=ALIQUOTA_ECF'
      'VLR_ALIQUOTA=VLR_ALIQUOTA'
      'ESTQ_EST_ATUAL=ESTQ_EST_ATUAL'
      'ESTQ_EST_DISP=ESTQ_EST_DISP'
      'VLR_VENDA=VLR_VENDA')
    DataSource = dmRel_Produtos.dsRel_Produtos
    Left = 880
    Top = 296
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
    ReportOptions.LastChange = 41195.446467256900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 928
    Top = 344
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end
      item
        DataSet = dstRelatorioAnalitico
        DataSetName = 'frDBRelatorioAnalitico'
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
        Height = 15.118110236220470000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858270000000000
          Width = 192.756030000000000000
          Height = 13.228346456692910000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 589.606680000000000000
          Top = 1.133858270000000000
          Width = 128.504020000000000000
          Height = 13.228346456692910000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
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
        Height = 120.944960000000000000
        ParentFont = False
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        RowCount = 0
        StartNewPage = True
        object dstRelatorioPROD_ID: TfrxMemoView
          Left = 88.818953780000000000
          Top = 0.889763780000000000
          Width = 94.488213390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_DESCRICAO: TfrxMemoView
          Left = 88.818953780000000000
          Top = 16.007874020000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_UNIDADE: TfrxMemoView
          Left = 475.881945910000000000
          Top = 16.007874020000000000
          Width = 238.110353390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioFORN_NOME_FANTASIA: TfrxMemoView
          Left = 88.818953780000000000
          Top = 31.125984250000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
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
        object dstRelatorioTIPO_PROD: TfrxMemoView
          Left = 475.881945910000000000
          Top = 31.125984250000000000
          Width = 238.110353390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TIPO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."TIPO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioGRUPO_PROD: TfrxMemoView
          Left = 88.818953780000000000
          Top = 46.244094490000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'GRUPO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GRUPO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioMARCA_PROD: TfrxMemoView
          Left = 475.881945910000000000
          Top = 46.244094490000000000
          Width = 238.110353390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."MARCA_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioMODELO_PROD: TfrxMemoView
          Left = 88.818953780000000000
          Top = 61.252010000000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."MODELO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_ESTQ_MINIMO: TfrxMemoView
          Left = 475.881945910000000000
          Top = 76.480314960000000000
          Width = 109.606333390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_ESTQ_MINIMO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_ESTQ_MINIMO"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioESTQ_EST_DISP: TfrxMemoView
          Left = 88.818953780000000000
          Top = 106.864566930000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ESTQ_EST_DISP'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."ESTQ_EST_DISP"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_GARANTIA: TfrxMemoView
          Left = 645.960795910000000000
          Top = 76.480314960000000000
          Width = 68.031503390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_GARANTIA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_GARANTIA"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_FLG_FRACIONADO: TfrxMemoView
          Left = 475.881945910000000000
          Top = 0.889763780000000000
          Width = 109.606333390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_FLG_FRACIONADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_FLG_FRACIONADO"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_ATIVO: TfrxMemoView
          Left = 645.960795910000000000
          Top = 0.889763780000000000
          Width = 68.031503390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_ATIVO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_ATIVO"]')
          ParentFont = False
          WordWrap = False
        end
        object dstRelatorioPROD_DTA_CADASTRO: TfrxMemoView
          Left = 266.228239060000000000
          Top = 0.889763780000000000
          Width = 105.826803390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DTA_CADASTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_DTA_CADASTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 1.889763780000000000
          Top = 0.889763780000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 1.889763780000000000
          Top = 16.007874020000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Descri'#231#227'o:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 377.732515350000000000
          Top = 16.007874020000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Unid.:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 1.889763780000000000
          Top = 31.125984250000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
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
        end
        object Memo19: TfrxMemoView
          Left = 377.732515350000000000
          Top = 31.125984250000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo Prod.:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 1.889763780000000000
          Top = 46.244094490000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Grupo Prod.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 377.732515350000000000
          Top = 46.244094490000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Marca Prod.:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 1.889763780000000000
          Top = 61.252010000000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Modelo Prod.:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 377.732515350000000000
          Top = 76.480314960000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Est. Min'#237'mo:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 1.889763780000000000
          Top = 106.864566930000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Est. Dispon'#237'vel:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 590.937142130000000000
          Top = 76.480314960000000000
          Width = 52.913383390000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Garantia:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 606.055262130000000000
          Top = 0.889763780000000000
          Width = 37.795263390000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Ativo:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 188.747875280000000000
          Top = 0.889763780000000000
          Width = 75.590563390000000000
          Height = 13.228346460000000000
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
        end
        object Memo5: TfrxMemoView
          Left = 377.732515350000000000
          Top = 0.889763780000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Venda Frac.:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 377.732515350000000000
          Top = 61.252010000000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Ult. Compra:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 1.889763780000000000
          Top = 76.480314960000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Est. Inicial:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 1.889763780000000000
          Top = 91.708661420000000000
          Width = 85.039394490000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Est. Atual:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 377.732515350000000000
          Top = 91.708661420000000000
          Width = 94.488198740000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Ult. Entrada:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 553.141856780000000000
          Top = 91.708661420000000000
          Width = 90.708668740000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. M'#233'd. Venda:')
          ParentFont = False
        end
        object frDBRelatorioPROD_ESTQ_INICIAL: TfrxMemoView
          Left = 88.818953780000000000
          Top = 76.480314960000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_ESTQ_INICIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_ESTQ_INICIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioESTQ_EST_ATUAL: TfrxMemoView
          Left = 88.818953780000000000
          Top = 91.708661420000000000
          Width = 283.464713390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ESTQ_EST_ATUAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."ESTQ_EST_ATUAL"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPROD_DTA_ULT_COMPRA: TfrxMemoView
          Left = 475.881945910000000000
          Top = 61.252010000000000000
          Width = 238.110353390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DTA_ULT_COMPRA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_DTA_ULT_COMPRA"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPROD_VLR_CUSTO: TfrxMemoView
          Left = 475.881945910000000000
          Top = 91.708661420000000000
          Width = 71.811033390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_VLR_CUSTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROD_VLR_CUSTO"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioVLR_VENDA: TfrxMemoView
          Left = 645.960795910000000000
          Top = 91.708661420000000000
          Width = 68.031503390000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLR_VENDA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."VLR_VENDA"]')
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
          Width = 343.937230000000000000
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
          Left = 500.897960000000000000
          Top = 3.779530000000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 576.488560000000000000
          Top = 3.779527560000000000
          Width = 68.031540000000000000
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
          Left = 647.520100000000000000
          Top = 3.779527560000000000
          Width = 68.031540000000000000
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
          Left = 504.811023620000000000
          Top = 3.779527560000000000
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
          Left = 504.811023620000000000
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
          Left = 504.811023622047000000
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
          Left = 504.811023622047000000
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
          Left = 504.811023622047000000
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
          Left = 575.709120310000000000
          Top = 25.322837090000000000
          Width = 139.842519690000000000
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
          Left = 575.709120310000000000
          Top = 46.110238660000000000
          Width = 139.842519690000000000
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
          Left = 575.709120310000000000
          Top = 66.897640240000000000
          Width = 139.842519690000000000
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
          Left = 575.709120310000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
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
          Width = 343.937230000000000000
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
          Width = 343.937230000000000000
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
          Top = 87.929192440000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Anal'#237'tico de Produtos')
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
          Width = 343.937230000000000000
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
    end
  end
  object dstRelatorioAnalitico: TfrxDBDataset
    UserName = 'frDBRelatorioAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PRCP_PROD_ID_COMP=PRCP_PROD_ID_COMP'
      'PRCP_QTDE=PRCP_QTDE'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_UNIDADE=PROD_UNIDADE'
      'GRUPO_PROD=GRUPO_PROD'
      'MARCA_PROD=MARCA_PROD'
      'MODELO_PROD=MODELO_PROD')
    DataSource = dmRel_Produtos.dsRelCompProdutos
    BCDToCurrency = False
    Left = 880
    Top = 344
  end
end
