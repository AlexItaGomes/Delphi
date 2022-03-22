inherited fCadStatusAtendimento: TfCadStatusAtendimento
  Caption = 'Cadastro de Status para Tele-Atendimento'
  Constraints.MinHeight = 186
  Constraints.MinWidth = 525
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
        Top = 50
        Width = 130
        Height = 13
        Caption = 'Status do Atendimento'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 108
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label4: TLabel
        Left = 644
        Top = 50
        Width = 136
        Height = 13
        Caption = 'Pr'#243'x. Atend. em? (dias)'
        FocusControl = edtDescricao
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmStatusAtendimento.dsStatusAtendimento
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 66
        Width = 635
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmStatusAtendimento.dsStatusAtendimento
        TabOrder = 2
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmStatusAtendimento.dsStatusAtendimento
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtDias: TRxDBCalcEdit
        Left = 644
        Top = 66
        Width = 136
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'GENE_NUMBER1'
        DataSource = dmStatusAtendimento.dsStatusAtendimento
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 219
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 369
    end
  end
end
