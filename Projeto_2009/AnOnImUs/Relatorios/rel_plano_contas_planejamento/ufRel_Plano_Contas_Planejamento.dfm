inherited fRel_Plano_Contas_Planejamento: TfRel_Plano_Contas_Planejamento
  Caption = 'fRel_Plano_Contas_Planejamento'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 988
      ExplicitLeft = 988
    end
    inherited lbCadEditar: TLabel
      Left = 988
      ExplicitLeft = 988
    end
    inherited lbCadExcluir: TLabel
      Left = 988
      ExplicitLeft = 988
    end
    inherited lbCadLocalizar: TLabel
      Left = 1079
      ExplicitLeft = 1079
    end
    inherited lbCadImprimir: TLabel
      Left = 1079
      ExplicitLeft = 1079
    end
    inherited lbCadSair: TLabel
      Left = 1079
      ExplicitLeft = 1079
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
    inherited Label1: TLabel
      Width = 244
      Caption = 'Relat'#243'rio Planejamento Anual'
      ExplicitWidth = 244
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
    object rdOpcao_Impressao: TRadioGroup
      Left = 390
      Top = 192
      Width = 220
      Height = 40
      Caption = 'Op'#231#227'o de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar'
        'Imprimir')
      TabOrder = 5
    end
    object rdTipo_Impressao: TRadioGroup
      Left = 390
      Top = 151
      Width = 220
      Height = 40
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico')
      TabOrder = 4
    end
    object rdConciliado: TRadioGroup
      Left = 390
      Top = 107
      Width = 220
      Height = 40
      Caption = 'Conciliados'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      TabOrder = 3
    end
    object rdOrdena: TRadioGroup
      Left = 390
      Top = 52
      Width = 220
      Height = 55
      Caption = 'Ordenado'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'd. Simplif.'
        'Descri'#231#227'o'
        'Conciliado')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 390
      Top = 4
      Width = 220
      Height = 45
      Caption = 'Ano'
      TabOrder = 1
      object cmbAnoI: TComboBox
        Left = 8
        Top = 16
        Width = 100
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object cmbAnoF: TComboBox
        Left = 114
        Top = 16
        Width = 100
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
    end
    object CheckBox1: TCheckBox
      Left = 222
      Top = 215
      Width = 162
      Height = 17
      Caption = 'Visualizar o j'#225' realizado'
      TabOrder = 6
    end
    inline frPesqPlanoContas: TfrPesquisa
      Left = 4
      Top = 4
      Width = 380
      Height = 180
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 380
      inherited GroupBox1: TGroupBox
        Width = 310
        Caption = 'Pesquisando Plano de Contas'
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
        ItemIndex = 7
      end
    end
  end
  inherited dsGrid: TDataSource
    Left = 432
  end
  inherited Timer1: TTimer
    Left = 464
  end
  inherited funcBasico: TFuncoes
    Left = 400
  end
  inherited frRelatorio: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        inherited Memo15: TfrxMemoView
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
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
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'T'#205'TULO DO RELAT'#211'RIO')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end
