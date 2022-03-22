inherited fRel_Pracas: TfRel_Pracas
  Caption = 'fRel_Pracas'
  ExplicitWidth = 1050
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1212
      ExplicitLeft = 1212
    end
    inherited lbCadEditar: TLabel
      Left = 1212
      ExplicitLeft = 1212
    end
    inherited lbCadExcluir: TLabel
      Left = 1212
      ExplicitLeft = 1212
    end
    inherited lbCadLocalizar: TLabel
      Left = 1303
      ExplicitLeft = 1303
    end
    inherited lbCadImprimir: TLabel
      Left = 1303
      ExplicitLeft = 1303
    end
    inherited lbCadSair: TLabel
      Left = 1303
      ExplicitLeft = 1303
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
      ExplicitLeft = 831
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 96
      Caption = 'Rel. de Pra'#231'as'
      ExplicitWidth = 96
    end
  end
  inherited gropGridPrincipal: TGroupBox
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1040
      Height = 411
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object GroupBox6: TGroupBox
        Left = 395
        Top = 7
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
          OnKeyPress = FormKeyPress
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
      end
      object rdOrdena: TRadioGroup
        Left = 395
        Top = 74
        Width = 216
        Height = 45
        Caption = 'Ordena'#231#227'o'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo'
          'Pra'#231'a'
          'UF')
        TabOrder = 2
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 395
        Top = 142
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
      inline frPesqPracas: TfrPesquisa
        Left = 5
        Top = 7
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
        ExplicitTop = 7
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
  end
  inherited frRelatorio: TfrxReport
    ReportOptions.LastChange = 42509.539634340280000000
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        Height = 17.007856930000000000
        inherited Line4: TfrxLineView
          Top = 17.007856930000000000
        end
        inherited Memo15: TfrxMemoView
          Width = 71.811070000000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Width = 442.205010000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade (Pra'#231'a)')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 525.354670000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo IBGE')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 678.535870000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 306.141930000000000000
        inherited Memo1: TfrxMemoView
          Top = 1.133858267716540000
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Top = 1.133858270000000000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 230.551330000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object frxDBDataset1GENE_ID: TfrxMemoView
          Left = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'GENE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_ID"]')
          ParentFont = False
        end
        object frxDBDataset1GENE_DESCR: TfrxMemoView
          Left = 79.370130000000000000
          Width = 442.205010000000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'GENE_DESCR'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_DESCR"]')
          ParentFont = False
        end
        object frxDBDataset1GENE_PAR1: TfrxMemoView
          Left = 678.535870000000000000
          Width = 37.795300000000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'GENE_PAR1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_PAR1"]')
          ParentFont = False
        end
        object frxDBDataset1GENE_PAR2: TfrxMemoView
          Left = 525.354670000000000000
          Width = 151.181200000000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'GENE_PAR2'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."GENE_PAR2"]')
          ParentFont = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Top = 3.779530000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Top = 3.779530000000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Top = 3.779530000000000000
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
          Top = 66.897640240000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Top = 88.440947320000000000
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
          Top = 66.897640240000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Top = 88.440947320000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Top = 81.929192440000000000
          Width = 343.937230000000000000
          Height = 22.677165354330710000
          Memo.UTF8W = (
            'Rela'#231#227'o de Pra'#231'as (Cidades)')
        end
        inherited Line3: TfrxLineView
          Top = 109.606370000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 343.937230000000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'GENE_ID=GENE_ID'
      'GENE_DESCR=GENE_DESCR'
      'GENE_PAR1=GENE_PAR1'
      'GENE_PAR2=GENE_PAR2')
    DataSource = dmRelPracas.dsRelPracas
  end
end
