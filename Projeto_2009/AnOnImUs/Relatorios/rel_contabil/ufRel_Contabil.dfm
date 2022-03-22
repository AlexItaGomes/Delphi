inherited fRel_Contabil: TfRel_Contabil
  Caption = 'fRel_Contabil'
  ExplicitWidth = 1050
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1124
      ExplicitLeft = 1124
    end
    inherited lbCadEditar: TLabel
      Left = 1124
      ExplicitLeft = 1124
    end
    inherited lbCadExcluir: TLabel
      Left = 1124
      ExplicitLeft = 1124
    end
    inherited lbCadLocalizar: TLabel
      Left = 1215
      ExplicitLeft = 1215
    end
    inherited lbCadImprimir: TLabel
      Left = 1215
      ExplicitLeft = 1215
    end
    inherited lbCadSair: TLabel
      Left = 1215
      ExplicitLeft = 1215
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
      ExplicitLeft = 827
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 145
      Caption = 'Relat'#243'rio Contabil'
      ExplicitWidth = 145
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
      object rdOpcao_Impressao: TRadioGroup
        Left = 7
        Top = 106
        Width = 216
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 2
      end
      object GroupBox3: TGroupBox
        Left = 7
        Top = 4
        Width = 216
        Height = 45
        Caption = 'Per'#237'odo'
        TabOrder = 0
        object edtDtInicio: TDateEdit
          Left = 3
          Top = 15
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = FormKeyPress
        end
        object edtDtFim: TDateEdit
          Left = 108
          Top = 15
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
      end
      object rdTipo: TRadioGroup
        Left = 7
        Top = 53
        Width = 216
        Height = 45
        Caption = '&Tipo de Dados'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Concretizado'
          'Previs'#227'o')
        TabOrder = 1
      end
      object rdOrdenacao: TRadioGroup
        Left = 229
        Top = 4
        Width = 183
        Height = 147
        Caption = 'Ordenar por'
        ItemIndex = 0
        Items.Strings = (
          'Plano de Contas'
          'Descri'#231#227'o'
          'Valor (Crescente)'
          'Valor (Decrecente)')
        TabOrder = 3
      end
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        inherited Line4: TfrxLineView
          Top = 31.677180000000000000
        end
        inherited Memo15: TfrxMemoView
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        inherited Memo1: TfrxMemoView
          Top = 1.133858267716540000
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Top = 1.133858267716540000
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
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Top = 87.929192440000000000
          Memo.UTF8W = (
            'T'#205'TULO DO RELAT'#211'RIO')
        end
        inherited Line3: TfrxLineView
          Top = 109.606370000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end
