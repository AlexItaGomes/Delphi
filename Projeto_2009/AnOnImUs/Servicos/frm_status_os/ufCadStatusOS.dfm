inherited fCadStatusOS: TfCadStatusOS
  Caption = 'Cad. de Status de O.S.'
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
        Width = 83
        Height = 13
        Caption = 'Status da O.S.'
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
        DataSource = dmStatusOS.dsStatusOS
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
        DataSource = dmStatusOS.dsStatusOS
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
        DataSource = dmStatusOS.dsStatusOS
        ReadOnly = True
        Color = clGradientActiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 166
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 316
    end
  end
end
