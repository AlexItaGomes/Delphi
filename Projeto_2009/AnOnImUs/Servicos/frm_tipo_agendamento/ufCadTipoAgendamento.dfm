inherited fCadTipoAgendamento: TfCadTipoAgendamento
  Caption = 'Cadastro de Tipo de Agendamento'
  Constraints.MinHeight = 191
  Constraints.MinWidth = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      object Label2: TLabel
        Left = 5
        Top = 48
        Width = 125
        Height = 13
        Caption = 'Tipo de Agendamento'
        FocusControl = edtDescricao
      end
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 111
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 64
        Width = 776
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmTipoAgendamento.dsTipoAgendamento
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'GENE_ID'
        DataSource = dmTipoAgendamento.dsTipoAgendamento
        ReadOnly = True
        TabOrder = 0
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
        DataSource = dmTipoAgendamento.dsTipoAgendamento
        ReadOnly = True
        Color = clGradientActiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 221
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 371
    end
  end
end
