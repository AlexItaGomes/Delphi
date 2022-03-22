inherited fCadRegioes: TfCadRegioes
  Caption = 'Cadastro de Regi'#245'es'
  Constraints.MinHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
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
        Top = 48
        Width = 39
        Height = 13
        Caption = 'Regi'#227'o'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 630
        Top = 48
        Width = 90
        Height = 13
        Caption = #193'rea Total (KM)'
        FocusControl = edtKM
      end
      object Label4: TLabel
        Left = 109
        Top = 7
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
        DataSource = dmRegioes.dsRegioes
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 64
        Width = 621
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmRegioes.dsRegioes
        TabOrder = 2
      end
      object edtKM: TDBEdit
        Left = 630
        Top = 64
        Width = 150
        Height = 21
        HelpContext = 1
        DataField = 'GENE_PAR1'
        DataSource = dmRegioes.dsRegioes
        TabOrder = 3
        OnKeyPress = edtKMKeyPress
      end
      object DBDateEdit1: TDBDateEdit
        Left = 109
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmRegioes.dsRegioes
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
end
