inherited fLanc_Auto_Contas_Receber: TfLanc_Auto_Contas_Receber
  Caption = 'fLanc_Auto_Contas_Receber'
  ClientWidth = 943
  ExplicitWidth = 949
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Width = 943
    ExplicitWidth = 943
    inherited btnNovo: TSpeedButton
      Enabled = True
      ExplicitLeft = 161
      ExplicitTop = 4
    end
    inherited btnEditar: TSpeedButton
      Visible = False
      ExplicitLeft = 264
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
      ExplicitLeft = 400
    end
    inherited btnImprimir: TSpeedButton
      ExplicitLeft = 672
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
      ExplicitLeft = 536
    end
  end
  inherited panelSuperior: TPanel
    Width = 943
    ExplicitWidth = 943
    inherited btnHelp: TSpeedButton
      Left = 762
      ExplicitLeft = 888
    end
    inherited Label1: TLabel
      Width = 334
      Caption = 'Lan'#231'amento Autom'#225'tico Contas Receber'
      ExplicitWidth = 334
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 852
      ExplicitLeft = 912
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 943
    ExplicitWidth = 943
    inherited grdBasico: TDBGrid
      Width = 939
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 939
      Height = 426
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
    end
  end
  inherited Timer1: TTimer
    Interval = 100
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
