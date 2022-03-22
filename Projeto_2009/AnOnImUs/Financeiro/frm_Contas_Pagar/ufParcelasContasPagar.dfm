inherited fParcelamento: TfParcelamento
  Caption = 'Parcelamento D'#237'vida'
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 489
        Align = alClient
        Caption = 'Parcelas'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 472
          TabStop = False
          Align = alClient
          DataSource = dmContas_Pagar.dsContasPagarParcela
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
      end
    end
  end
end
