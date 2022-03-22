inherited fRel_Plano_Contas: TfRel_Plano_Contas
  Caption = 'fRel_Plano_Contas'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1068
      ExplicitLeft = 1068
    end
    inherited lbCadEditar: TLabel
      Left = 1068
      ExplicitLeft = 1068
    end
    inherited lbCadExcluir: TLabel
      Left = 1068
      ExplicitLeft = 1068
    end
    inherited lbCadLocalizar: TLabel
      Left = 1159
      ExplicitLeft = 1159
    end
    inherited lbCadImprimir: TLabel
      Left = 1159
      ExplicitLeft = 1159
    end
    inherited lbCadSair: TLabel
      Left = 1159
      ExplicitLeft = 1159
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
      ExplicitLeft = 829
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 211
      Caption = 'Relat'#243'rio Plano de Contas'
      ExplicitWidth = 211
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
      Width = 225
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
        Left = 112
        Top = 17
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object rdTipo: TRadioGroup
      Left = 10
      Top = 52
      Width = 225
      Height = 45
      Caption = 'Tipo'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Cr'#233'dito'
        'D'#233'bito'
        'Todos')
      TabOrder = 1
    end
    object rdAtivo: TRadioGroup
      Left = 10
      Top = 99
      Width = 225
      Height = 45
      Caption = 'Ativo'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      TabOrder = 2
    end
    object rdOpcao_Impressao: TRadioGroup
      Left = 241
      Top = 52
      Width = 225
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
      Left = 241
      Top = 99
      Width = 225
      Height = 45
      Caption = 'Tipo de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico')
      TabOrder = 4
    end
  end
  inherited dsGrid: TDataSource
    Left = 64
    Top = 448
  end
  inherited Timer1: TTimer
    Left = 96
    Top = 448
  end
  inherited funcBasico: TFuncoes
    Left = 32
    Top = 448
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
