inherited fRel_Livro_Caixa: TfRel_Livro_Caixa
  Caption = 'fRel_Livro_Caixa'
  ClientWidth = 1029
  ExplicitWidth = 1035
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Width = 1029
    ExplicitWidth = 1029
    inherited btnCancelar: TSpeedButton
      Left = 890
      ExplicitLeft = 890
    end
    inherited lbCadNovo: TLabel
      Left = 1020
      ExplicitLeft = 1020
    end
    inherited lbCadEditar: TLabel
      Left = 1020
      ExplicitLeft = 1020
    end
    inherited lbCadExcluir: TLabel
      Left = 1020
      ExplicitLeft = 1020
    end
    inherited lbCadLocalizar: TLabel
      Left = 1111
      ExplicitLeft = 1111
    end
    inherited lbCadImprimir: TLabel
      Left = 1111
      ExplicitLeft = 1111
    end
    inherited lbCadSair: TLabel
      Left = 1111
      ExplicitLeft = 1111
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
      Enabled = True
      Visible = True
      ExplicitLeft = 763
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    Width = 1029
    ExplicitWidth = 1029
    inherited btnHelp: TSpeedButton
      Left = 828
      ExplicitLeft = 861
    end
    inherited Label1: TLabel
      Width = 144
      Caption = 'Relat'#243'rio Livro Caixa'
      ExplicitWidth = 144
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 928
      ExplicitLeft = 885
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 1029
    ExplicitWidth = 1029
    inherited grdBasico: TDBGrid
      Width = 1025
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1029
    Height = 428
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 3
      Top = 168
      Width = 233
      Height = 45
      Caption = 'Per'#237'odo de Movimenta'#231#227'o'
      TabOrder = 2
      object edtDt_Inicial: TDateEdit
        Left = 16
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object edtDt_Final: TDateEdit
        Left = 122
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 241
      Top = 168
      Width = 233
      Height = 45
      Caption = 'Op'#231#227'o de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar'
        'Imprimir')
      TabOrder = 3
    end
    inline frPesqClientes: TfrPesquisa
      Left = 5
      Top = 10
      Width = 400
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
      ExplicitWidth = 400
      ExplicitHeight = 150
      inherited GroupBox1: TGroupBox
        Width = 330
        Height = 150
        Caption = 'Pesquisando Registro (Clientes)'
        ExplicitWidth = 330
        ExplicitHeight = 150
        inherited rdContenha: TRadioGroup
          Top = 113
          Width = 326
          Height = 35
          ExplicitTop = 113
          ExplicitWidth = 326
          ExplicitHeight = 35
        end
        inherited lbRegistros: TListBox
          Top = 60
          Width = 326
          Height = 53
          ExplicitTop = 60
          ExplicitWidth = 326
          ExplicitHeight = 53
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 150
        ItemIndex = 0
        ExplicitHeight = 150
      end
    end
    inline frPesqFornecedores: TfrPesquisa
      Left = 409
      Top = 10
      Width = 400
      Height = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 409
      ExplicitTop = 10
      ExplicitWidth = 400
      ExplicitHeight = 150
      inherited GroupBox1: TGroupBox
        Width = 330
        Height = 150
        Caption = 'Pesquisando Registro (Fornecedores)'
        ExplicitWidth = 330
        ExplicitHeight = 150
        inherited rdContenha: TRadioGroup
          Top = 113
          Width = 326
          Height = 35
          ExplicitTop = 113
          ExplicitWidth = 326
          ExplicitHeight = 35
        end
        inherited lbRegistros: TListBox
          Top = 60
          Width = 326
          Height = 53
          ExplicitTop = 60
          ExplicitWidth = 326
          ExplicitHeight = 53
        end
      end
      inherited rdOpcoes: TRadioGroup
        Height = 150
        ItemIndex = 1
        ExplicitHeight = 150
      end
    end
  end
  inherited frRelatorio: TfrxReport
    ReportOptions.LastChange = 41198.979062488400000000
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
        Visible = False
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          Font.Height = -9
          Memo.UTF8W = (
            'Id. Mov.')
        end
        object Memo2: TfrxMemoView
          Left = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 245.669450000000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 291.023810000000000000
          Width = 109.606370000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente/Fornecedor')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 472.441250000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 552.031850000000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano Contas')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 718.110700000000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Ant.')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 816.378480000000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Lan'#231'amento')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 914.646260000000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Atual')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 1013.914040000000000000
          Width = 30.236240000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 389.291590000000000000
        Width = 1046.929810000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
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
        Top = 287.244280000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object frDBRelatorioLCAX_ID: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.889763779527560000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'LCAX_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."LCAX_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPROVENIENTE: TfrxMemoView
          Left = 64.252010000000000000
          Top = 1.889763779527560000
          Width = 178.896377950000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PROVENIENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PROVENIENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioID: TfrxMemoView
          Left = 245.669450000000000000
          Top = 1.889763779527560000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."ID"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioCLIENTE_FORNECEDOR: TfrxMemoView
          Left = 291.023810000000000000
          Top = 1.889763779527560000
          Width = 201.573557950000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'CLIENTE_FORNECEDOR'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."CLIENTE_FORNECEDOR"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPLCT_COD_SIMPLIFICADO: TfrxMemoView
          Left = 496.118430000000000000
          Top = 1.889763779527560000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPLCT_DESCRICAO: TfrxMemoView
          Left = 552.031850000000000000
          Top = 1.889763779527560000
          Width = 178.896377950000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioSALDO_ANT: TfrxMemoView
          Left = 733.669760000000000000
          Top = 1.889763779527560000
          Width = 90.708720000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."SALDO_ANT"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioLCAX_VLR_LANCAMENTO: TfrxMemoView
          Left = 827.937540000000000000
          Top = 1.889763779527560000
          Width = 90.708720000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."LCAX_VLR_LANCAMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioLCAX_VLR_SALDO: TfrxMemoView
          Left = 921.205320000000000000
          Top = 1.889763779527560000
          Width = 90.708720000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."LCAX_VLR_SALDO"]')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioPLCT_TIPO: TfrxMemoView
          Left = 1013.914040000000000000
          Top = 1.889763779527560000
          Width = 30.236240000000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'PLCT_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_TIPO"]')
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
          Width = 680.314985040000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 831.496062992126000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 905.410020000000000000
          Top = 3.779527560000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 940.425790000000000000
          Top = 3.779527560000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 833.732483620000000000
          Top = 3.779527560000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 833.732483620000000000
          Top = 18.787401570000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 833.732483620000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 833.732483620000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 833.732483620000000000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 905.410020000000000000
          Top = 18.787401570000000000
          Width = 139.842519685039400000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            'Usu'#225'rio:')
          WordWrap = False
        end
        inherited lbFild01: TfrxMemoView
          Left = 905.410020000000000000
          Width = 139.842519685039400000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '...')
          WordWrap = False
        end
        inherited lbFild02: TfrxMemoView
          Left = 905.410020000000000000
          Width = 139.842519685039400000
          Height = 13.228346456692910000
          Memo.UTF8W = (
            '...')
          WordWrap = False
        end
        inherited lbFild03: TfrxMemoView
          Left = 905.410020000000000000
          Width = 139.842519685039400000
          Memo.UTF8W = (
            '...')
          WordWrap = False
        end
        inherited lblEndereco: TfrxMemoView
          Top = 18.787401570000000000
          Width = 680.314985040000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 680.314985040000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Width = 680.314985040000000000
          Memo.UTF8W = (
            'Movimento Financeiro (Livro Caixa)')
        end
        inherited Line3: TfrxLineView
          Top = 109.606370000000000000
          Width = 1046.929810000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 680.314985040000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Top = 718.110700000000000000
        Width = 1046.929810000000000000
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 34.015770000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorio."LCAX_DTA_LANCAMENTO"'
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo13: TfrxMemoView
          Left = 4.779530000000000000
          Top = 1.889763779527560000
          Width = 86.929190000000000000
          Height = 11.338582680000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Movimento:')
          ParentFont = False
          WordWrap = False
        end
        object frDBRelatorioLCAX_DTA_LANCAMENTO: TfrxMemoView
          Left = 94.488250000000000000
          Top = 1.889763779527560000
          Width = 211.653680000000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'LCAX_DTA_LANCAMENTO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorio."LCAX_DTA_LANCAMENTO"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Id. Mov.')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 64.252010000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Proveniente')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 245.669450000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 291.023810000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente/Fornecedor')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 496.118430000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 552.031850000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano Contas')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 733.669760000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Ant.')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 827.937540000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Lan'#231'amento')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 921.205320000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Atual')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 1013.914040000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
          Height = 13.228346456692900000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'LCAX_ID=LCAX_ID'
      'LCAX_EMPR_ID=LCAX_EMPR_ID'
      'PROVENIENTE=PROVENIENTE'
      'LCAX_DTA_LANCAMENTO=LCAX_DTA_LANCAMENTO'
      'PLCT_COD_SIMPLIFICADO=PLCT_COD_SIMPLIFICADO'
      'PLCT_DESCRICAO=PLCT_DESCRICAO'
      'SALDO_ANT=SALDO_ANT'
      'LCAX_VLR_LANCAMENTO=LCAX_VLR_LANCAMENTO'
      'LCAX_VLR_SALDO=LCAX_VLR_SALDO'
      'PLCT_TIPO=PLCT_TIPO'
      'ID=ID'
      'CLIENTE_FORNECEDOR=CLIENTE_FORNECEDOR')
    DataSource = dmLivro_Caixa.dsRel_Livro_Caixa
  end
end
