inherited fCad_Bancos: TfCad_Bancos
  Caption = 'Cad. de Bancos e Financeiras'
  Constraints.MinHeight = 188
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 8
      ExplicitTop = 22
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 107
        Top = 49
        Width = 35
        Height = 13
        Caption = 'Banco'
        FocusControl = edtBanco
      end
      object Label3: TLabel
        Left = 3
        Top = 49
        Width = 63
        Height = 13
        Caption = 'C'#243'd. &Banc.'
        FocusControl = edtCodigo
      end
      object Label4: TLabel
        Left = 107
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
        DataSource = dmBancos.dsBancos
        ReadOnly = True
        TabOrder = 0
      end
      object edtBanco: TDBEdit
        Left = 107
        Top = 65
        Width = 676
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmBancos.dsBancos
        TabOrder = 3
      end
      object edtCodigo: TDBEdit
        Left = 3
        Top = 65
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'GENE_PAR1'
        DataSource = dmBancos.dsBancos
        TabOrder = 2
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
        DataSource = dmBancos.dsBancos
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
end
