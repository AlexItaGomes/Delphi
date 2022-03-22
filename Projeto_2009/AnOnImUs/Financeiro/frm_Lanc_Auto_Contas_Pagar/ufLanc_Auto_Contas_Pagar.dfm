inherited fLanc_Auto_Contas_Pagar: TfLanc_Auto_Contas_Pagar
  Caption = 'fLanc_Auto_Contas_Pagar'
  ClientWidth = 994
  ExplicitWidth = 1000
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Width = 994
    ExplicitWidth = 994
    inherited btnNovo: TSpeedButton
      Enabled = True
    end
  end
  inherited panelSuperior: TPanel
    Width = 994
    ExplicitWidth = 994
    inherited btnHelp: TSpeedButton
      Left = 793
      ExplicitLeft = 813
    end
    inherited Label1: TLabel
      Width = 315
      Caption = 'Lan'#231'amento Autom'#225'tico Contas Pagar'
      ExplicitWidth = 315
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 893
      ExplicitLeft = 903
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Width = 994
    ExplicitWidth = 994
    inherited grdBasico: TDBGrid
      Width = 990
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 39
    Width = 994
    Height = 428
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
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
