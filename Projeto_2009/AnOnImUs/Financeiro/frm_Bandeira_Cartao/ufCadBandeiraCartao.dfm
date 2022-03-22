inherited fCadBandeiraCartao: TfCadBandeiraCartao
  Caption = 'Cad. de Bandeiras'
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitTop = 22
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 5
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Bandeira'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 109
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'GENE_ID'
        DataSource = dmBandeiraCartao.dsBandeiras
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 64
        Width = 777
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmBandeiraCartao.dsBandeiras
        TabOrder = 1
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
        DataSource = dmBandeiraCartao.dsBandeiras
        ReadOnly = True
        Color = clGradientActiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
end
