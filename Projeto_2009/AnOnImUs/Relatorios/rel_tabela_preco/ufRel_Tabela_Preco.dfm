inherited fRel_Tabela_Preco: TfRel_Tabela_Preco
  Caption = 'fRel_Tabela_Preco'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited btnCancelar: TSpeedButton
      Left = 1501
      ExplicitLeft = 1501
    end
    inherited lbCadNovo: TLabel
      Left = 1588
      ExplicitLeft = 1588
    end
    inherited lbCadEditar: TLabel
      Left = 1588
      ExplicitLeft = 1588
    end
    inherited lbCadExcluir: TLabel
      Left = 1588
      ExplicitLeft = 1588
    end
    inherited lbCadLocalizar: TLabel
      Left = 1691
      ExplicitLeft = 1691
    end
    inherited lbCadImprimir: TLabel
      Left = 1691
      ExplicitLeft = 1691
    end
    inherited lbCadSair: TLabel
      Left = 1691
      ExplicitLeft = 1691
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
      ExplicitLeft = 828
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 234
      Caption = 'Relat'#243'rio de Tabela de Pre'#231'o'
      ExplicitWidth = 234
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
      object rdAtivo: TRadioGroup
        Left = 443
        Top = 10
        Width = 255
        Height = 45
        Caption = 'Ativo'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Sim'
          'N'#227'o '
          'Todos')
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 443
        Top = 56
        Width = 255
        Height = 50
        Caption = 'Dt. Cadastro'
        TabOrder = 2
        object edtDtCadInicio: TDateEdit
          Left = 10
          Top = 20
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = FormKeyPress
        end
        object edtDtCadFim: TDateEdit
          Left = 115
          Top = 20
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 442
        Top = 108
        Width = 255
        Height = 80
        Caption = 'Visualizar'
        TabOrder = 3
        object CheckBox1: TCheckBox
          Left = 10
          Top = 20
          Width = 97
          Height = 17
          Caption = 'Vlr. Minimo'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnKeyPress = FormKeyPress
        end
        object CheckBox2: TCheckBox
          Left = 10
          Top = 38
          Width = 97
          Height = 17
          Caption = 'Vlr. Especial'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
        object CheckBox3: TCheckBox
          Left = 10
          Top = 55
          Width = 97
          Height = 17
          Caption = 'Vlr. Atacado'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnKeyPress = FormKeyPress
        end
        object CheckBox4: TCheckBox
          Left = 107
          Top = 20
          Width = 142
          Height = 17
          Caption = '% Comiss'#227'o Interna'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnKeyPress = FormKeyPress
        end
        object CheckBox5: TCheckBox
          Left = 107
          Top = 38
          Width = 142
          Height = 17
          Caption = '% Comiss'#227'o Externa'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnKeyPress = FormKeyPress
        end
        object CheckBox6: TCheckBox
          Left = 107
          Top = 55
          Width = 142
          Height = 17
          Caption = '% Comiss'#227'o Balc'#227'o'
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnKeyPress = FormKeyPress
        end
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 442
        Top = 190
        Width = 255
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 4
      end
      inline frPesqTabPreco: TfrPesquisa
        Left = 5
        Top = 10
        Width = 430
        Height = 175
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 10
        ExplicitWidth = 430
        ExplicitHeight = 175
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 175
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 175
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 77
            Caption = 'Tabela de Pre'#231'o'
            ExplicitTop = 14
            ExplicitWidth = 77
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 143
            Width = 377
            Height = 30
            ExplicitTop = 143
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
            Height = 90
            ExplicitTop = 53
            ExplicitWidth = 377
            ExplicitHeight = 90
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
          Height = 175
          ItemIndex = 9
          ExplicitWidth = 49
          ExplicitHeight = 175
        end
      end
    end
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
