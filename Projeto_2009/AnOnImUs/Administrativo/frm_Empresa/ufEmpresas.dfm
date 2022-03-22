inherited fEmpresas: TfEmpresas
  Caption = 'fEmpresas'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 185
      Caption = 'Cadastro de Empresas'
      ExplicitWidth = 185
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
