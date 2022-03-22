inherited fRel_Saida_Avulsa_Produtos: TfRel_Saida_Avulsa_Produtos
  Caption = 'fRel_Saida_Avulsa_Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1388
      ExplicitLeft = 1388
    end
    inherited lbCadEditar: TLabel
      Left = 1388
      ExplicitLeft = 1388
    end
    inherited lbCadExcluir: TLabel
      Left = 1388
      ExplicitLeft = 1388
    end
    inherited lbCadLocalizar: TLabel
      Left = 1479
      ExplicitLeft = 1479
    end
    inherited lbCadImprimir: TLabel
      Left = 1479
      ExplicitLeft = 1479
    end
    inherited lbCadSair: TLabel
      Left = 1479
      ExplicitLeft = 1479
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
      Width = 245
      Caption = 'Relat'#243'rio Sa'#237'da Avulsa de Produtos'
      ExplicitWidth = 245
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
        Left = 519
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
        Left = 519
        Top = 120
        Width = 216
        Height = 65
        Caption = 'Ordena'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Nr'#186' Registro'
          'Nr'#186' Doc.'
          'Status'
          'Dt. Cadastro')
        TabOrder = 3
      end
      object rdStatus: TRadioGroup
        Left = 519
        Top = 55
        Width = 216
        Height = 65
        Caption = 'Status'
        Columns = 2
        ItemIndex = 3
        Items.Strings = (
          'Abertos'
          'Conciliados'
          'Cancelados'
          'Todos')
        TabOrder = 2
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 519
        Top = 188
        Width = 216
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 4
      end
      inline frPesqSaidaAvulsa: TfrPesquisa
        Left = 5
        Top = 10
        Width = 508
        Height = 180
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 10
        ExplicitWidth = 508
        inherited GroupBox1: TGroupBox
          Width = 438
          ExplicitWidth = 438
          inherited Label2: TLabel
            Width = 61
            Caption = 'Sa'#237'da Avulsa'
            ExplicitWidth = 61
          end
          inherited rdContenha: TRadioGroup
            Width = 434
            ExplicitWidth = 434
          end
          inherited lbRegistros: TListBox
            Width = 434
            ExplicitWidth = 434
          end
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 18
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
            'www.arsistemaseconsultoria.com.br')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 578.268090000000000000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited imgLogo: TfrxPictureView
          Top = 3.779527560000000000
        end
        inherited lblFantasia: TfrxMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Top = 18.787401570000000000
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
          Top = 18.787401570000000000
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
          Top = 18.787401570000000000
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
