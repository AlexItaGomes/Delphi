inherited fCad_ModelosProdutos: TfCad_ModelosProdutos
  Caption = 'Cadastro de Modelos de Produtos'
  Constraints.MinHeight = 196
  Constraints.MinWidth = 520
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
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 106
        Height = 13
        Caption = 'Modelo do Produto'
        FocusControl = edtModelo
      end
      object Label3: TLabel
        Left = 112
        Top = 5
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 21
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmModelos.dsModelos
        ReadOnly = True
        TabOrder = 0
      end
      object edtModelo: TDBEdit
        Left = 8
        Top = 64
        Width = 774
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmModelos.dsModelos
        TabOrder = 1
      end
      object DBDateEdit1: TDBDateEdit
        Left = 112
        Top = 21
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmModelos.dsModelos
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 444
      ExplicitTop = 2
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 362
    end
  end
end
