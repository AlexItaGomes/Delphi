inherited fRelPatrimonio: TfRelPatrimonio
  Caption = 'fRelPatrimonio'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited btnNovo: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitWidth = 0
    end
    inherited btnEditar: TSpeedButton
      Width = 0
      Visible = False
      ExplicitWidth = 0
    end
    inherited btnExcluir: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitWidth = 0
    end
    inherited btnImprimir: TSpeedButton
      Left = 1
      Enabled = True
      Visible = True
    end
    inherited btnLocalizar: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitWidth = 0
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 172
      Caption = 'Relat'#243'rio Patrimonial'
      ExplicitTop = 4
      ExplicitWidth = 172
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
      TabOrder = 1
      ExplicitLeft = 432
      ExplicitTop = 192
      ExplicitWidth = 185
      ExplicitHeight = 41
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
