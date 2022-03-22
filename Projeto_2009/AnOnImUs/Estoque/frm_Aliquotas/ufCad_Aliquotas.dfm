inherited fCad_Aliquotas: TfCad_Aliquotas
  Caption = 'Cadastro de Aliquotas'
  Constraints.MinHeight = 192
  Constraints.MinWidth = 520
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ExplicitWidth = 514
    ExplicitHeight = 109
    inherited tabCadastro: TTabSheet
      ExplicitWidth = 506
      ExplicitHeight = 81
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 106
        Height = 13
        Caption = 'Marca do Produtos'
        FocusControl = edtAliquotas
      end
      object Label3: TLabel
        Left = 683
        Top = 56
        Width = 31
        Height = 13
        Caption = 'ICMS'
        FocusControl = edtICMS
      end
      object Label4: TLabel
        Left = 111
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmAliquotas.dsAliquotas
        ReadOnly = True
        TabOrder = 0
      end
      object edtAliquotas: TDBEdit
        Left = 8
        Top = 72
        Width = 669
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmAliquotas.dsAliquotas
        TabOrder = 1
      end
      object edtICMS: TDBEdit
        Left = 683
        Top = 72
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'GENE_PAR1'
        DataSource = dmAliquotas.dsAliquotas
        TabOrder = 2
      end
      object DBDateEdit1: TDBDateEdit
        Left = 111
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmAliquotas.dsAliquotas
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 3
      end
    end
  end
  inherited Panel1: TPanel
    ExplicitTop = 109
    ExplicitWidth = 514
    inherited btnOK: TSpeedButton
      ExplicitLeft = 209
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 359
    end
  end
end
