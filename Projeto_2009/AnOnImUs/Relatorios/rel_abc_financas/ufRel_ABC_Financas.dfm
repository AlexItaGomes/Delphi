inherited fRel_ABC_Financas: TfRel_ABC_Financas
  Caption = 'fRel_ABC_Financas'
  ExplicitWidth = 1050
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 792
      ExplicitLeft = 702
    end
    inherited lbCadEditar: TLabel
      Left = 792
      ExplicitLeft = 702
    end
    inherited lbCadExcluir: TLabel
      Left = 792
      ExplicitLeft = 702
    end
    inherited lbCadLocalizar: TLabel
      Left = 883
      ExplicitLeft = 793
    end
    inherited lbCadImprimir: TLabel
      Left = 883
      ExplicitLeft = 793
    end
    inherited lbCadSair: TLabel
      Left = 883
      ExplicitLeft = 793
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
      ExplicitLeft = 634
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited btnHelp: TSpeedButton
      ExplicitLeft = 741
    end
    inherited Label1: TLabel
      Width = 191
      Caption = 'Relat'#243'rio de Curva ABC'
      ExplicitWidth = 191
    end
    inherited btnFecharRotina: TSpeedButton
      ExplicitLeft = 765
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 1044
    Height = 428
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 10
      Top = 5
      Width = 240
      Height = 45
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object edtDtInicio: TDateEdit
        Left = 6
        Top = 17
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtFim: TDateEdit
        Left = 120
        Top = 17
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 256
      Top = 53
      Width = 240
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
      Left = 256
      Top = 100
      Width = 240
      Height = 45
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico')
      TabOrder = 4
    end
    object rdTipo: TRadioGroup
      Left = 10
      Top = 100
      Width = 240
      Height = 45
      Caption = 'Tipo de Informa'#231#245'es'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Plano de Contas'
        'Cliente/Fornec.')
      TabOrder = 1
    end
    object rdVisualizacao: TRadioGroup
      Left = 256
      Top = 5
      Width = 240
      Height = 45
      Caption = 'Tipo de Visualiza'#231#227'o'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Previsto'
        'Concretizado')
      TabOrder = 2
    end
    object rdReceita: TRadioGroup
      Left = 10
      Top = 53
      Width = 240
      Height = 45
      Caption = 'Tipo de Curva ABC'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Receitas'
        'Despesas')
      TabOrder = 5
    end
  end
  inherited frRelatorio: TfrxReport
    ReportOptions.LastChange = 41222.557540034720000000
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
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'C'#243'd. Simplif.')
        end
        object Memo2: TfrxMemoView
          Left = 102.047310000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano de Contas')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 348.157700000000000000
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
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 441.645950000000000000
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
            '% Rel. D'#233'bito')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 534.134200000000000000
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
            '% Rel. Cr'#233'dito')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 626.622450000000000000
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
            '% Acumulado')
          ParentFont = False
          WordWrap = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 359.055350000000000000
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
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorio'
        object Memo9: TfrxMemoView
          Left = 3.779520240000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_COD_SIMPLIFICADO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 102.047310000000000000
          Width = 241.889920000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PLCT_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorio."PLCT_DESCRICAO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 348.157700000000000000
          Width = 90.708720000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorio."VALOR"]')
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
            'Relat'#243'rio Curva ABC Sint'#233'tico')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    FieldAliases.Strings = (
      'PLCT_COD_SIMPLIFICADO=PLCT_COD_SIMPLIFICADO'
      'PLCT_DESCRICAO=PLCT_DESCRICAO'
      'VALOR=VALOR')
    DataSource = dmRel_Abc_Financas.dsRel_ABC_Financas
  end
  inherited funcBasico: TFuncoes
    Left = 312
  end
end
