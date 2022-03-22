inherited fCadVisualizaNF: TfCadVisualizaNF
  Caption = 'Visualizador de N.F.'
  ClientWidth = 644
  Constraints.MaxWidth = 650
  Constraints.MinWidth = 650
  ExplicitTop = -40
  ExplicitWidth = 650
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 644
    ExplicitWidth = 644
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 636
      ExplicitHeight = 489
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 636
        Height = 489
        Align = alClient
        Caption = 'N.F. (Duplo Clique)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBImage1: TDBImage
          Left = 2
          Top = 15
          Width = 632
          Height = 472
          Align = alClient
          DataField = 'PATR_FOTO_NF'
          DataSource = dmPatrimonio.dsPatrimonio
          Stretch = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel1: TPanel
    Width = 644
    ExplicitWidth = 644
    inherited btnOK: TSpeedButton
      Left = 294
      ExplicitLeft = 619
    end
    inherited btnCancelar: TSpeedButton
      Left = 469
      Enabled = False
      Visible = False
      ExplicitLeft = 469
    end
  end
end
