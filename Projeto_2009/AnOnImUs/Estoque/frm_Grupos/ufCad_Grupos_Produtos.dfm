inherited fCad_Grupos_Produtos: TfCad_Grupos_Produtos
  Caption = 'Grupos de Produtos'
  Constraints.MinHeight = 196
  Constraints.MinWidth = 520
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ExplicitWidth = 514
    ExplicitHeight = 113
    inherited tabCadastro: TTabSheet
      ExplicitWidth = 506
      ExplicitHeight = 85
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 54
        Width = 101
        Height = 13
        Caption = 'Grupo de Produto'
        FocusControl = edtGrupo
      end
      object Label3: TLabel
        Left = 108
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmGrupos.dsGrupos
        ReadOnly = True
        TabOrder = 0
      end
      object edtGrupo: TDBEdit
        Left = 3
        Top = 70
        Width = 780
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmGrupos.dsGrupos
        TabOrder = 1
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmGrupos.dsGrupos
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    ExplicitTop = 113
    ExplicitWidth = 514
    inherited btnOK: TSpeedButton
      ExplicitLeft = 209
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 359
    end
  end
end
