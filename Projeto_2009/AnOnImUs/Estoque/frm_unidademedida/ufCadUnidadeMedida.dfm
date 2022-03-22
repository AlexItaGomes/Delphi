inherited fCadUnidadeMedida: TfCadUnidadeMedida
  Caption = 'Cadastro de Unidades de Medida'
  ExplicitTop = -15
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
        Left = 109
        Top = 48
        Width = 106
        Height = 13
        Caption = 'Descri'#231#227'o Unidade'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 109
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label4: TLabel
        Left = 5
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Sigla'
        FocusControl = edtDescricao
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'GENE_ID'
        DataSource = dmUnidadeMedida.dsUnidadeMedida
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 109
        Top = 64
        Width = 669
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmUnidadeMedida.dsUnidadeMedida
        TabOrder = 3
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
        DataSource = dmUnidadeMedida.dsUnidadeMedida
        ReadOnly = True
        Color = clGradientActiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtSigla: TDBEdit
        Left = 5
        Top = 64
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'GENE_PAR1'
        DataSource = dmUnidadeMedida.dsUnidadeMedida
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 438
      ExplicitTop = 2
    end
  end
end
