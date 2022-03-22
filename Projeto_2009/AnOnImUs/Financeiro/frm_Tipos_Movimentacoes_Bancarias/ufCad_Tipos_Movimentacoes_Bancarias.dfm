inherited fCad_Tipos_Movimentacoes_Bancarias: TfCad_Tipos_Movimentacoes_Bancarias
  Caption = 'Cad. Tipos de Movimenta'#231#245'es Banc'#225'rias'
  Constraints.MinHeight = 187
  Constraints.MinWidth = 486
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
        Width = 82
        Height = 13
        Caption = '&Movimenta'#231#227'o'
        FocusControl = edtTipo
      end
      object Label3: TLabel
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
        DataSource = dmTipos_Movimentacoes_Bancarias.dsTipos_Movimentacoes
        ReadOnly = True
        TabOrder = 0
      end
      object edtTipo: TDBEdit
        Left = 3
        Top = 67
        Width = 780
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmTipos_Movimentacoes_Bancarias.dsTipos_Movimentacoes
        TabOrder = 4
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
        DataSource = dmTipos_Movimentacoes_Bancarias.dsTipos_Movimentacoes
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object rdTipo: TDBRadioGroup
        Left = 427
        Top = 0
        Width = 150
        Height = 45
        Caption = '&Tipo'
        Columns = 2
        DataField = 'GENE_PAR1'
        DataSource = dmTipos_Movimentacoes_Bancarias.dsTipos_Movimentacoes
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        ParentBackground = True
        TabOrder = 2
        Values.Strings = (
          'C'
          'D')
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 583
        Top = 0
        Width = 200
        Height = 45
        Caption = '&Dedut'#237'vel (Lan'#231'.  no caixa)'
        Columns = 2
        DataField = 'GENE_PAR2'
        DataSource = dmTipos_Movimentacoes_Bancarias.dsTipos_Movimentacoes
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentBackground = True
        TabOrder = 3
        Values.Strings = (
          'S'
          'N')
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 177
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 327
    end
  end
end
