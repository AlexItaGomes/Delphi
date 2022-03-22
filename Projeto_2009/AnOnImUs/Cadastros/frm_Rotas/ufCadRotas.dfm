inherited fCadRota: TfCadRota
  Caption = 'Cadastro de Rotas'
  Constraints.MinHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
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
        Width = 26
        Height = 13
        Caption = 'Rota'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 617
        Top = 48
        Width = 57
        Height = 13
        Caption = 'KM (Final)'
      end
      object Label4: TLabel
        Left = 109
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label5: TLabel
        Left = 728
        Top = 48
        Width = 53
        Height = 13
        Caption = 'Vlr. Frete'
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
        DataSource = dmRotas.dsRotas
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmRotas.dsRotas
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 64
        Width = 562
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmRotas.dsRotas
        TabOrder = 2
      end
      object edtkm: TRxDBCalcEdit
        Left = 574
        Top = 64
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'GENE_PAR1'
        DataSource = dmRotas.dsRotas
        DecimalPlaces = 3
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
      object RxDBCalcEdit1: TRxDBCalcEdit
        Left = 681
        Top = 64
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'GENE_NUMERIC1'
        DataSource = dmRotas.dsRotas
        DisplayFormat = '0.00'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 4
      end
      inline frPesqRegiao: TfrPesqIndividual
        Left = 2
        Top = 88
        Width = 781
        Height = 40
        TabOrder = 5
        ExplicitLeft = 2
        ExplicitTop = 88
        ExplicitWidth = 781
        inherited Label1: TLabel
          Width = 67
          ExplicitWidth = 67
        end
        inherited Label2: TLabel
          Width = 39
          Caption = 'Regi'#227'o'
          ExplicitWidth = 39
        end
        inherited Label3: TLabel
          Left = 679
          Width = 90
          Caption = #193'rea Total (KM)'
          Visible = True
          ExplicitLeft = 679
          ExplicitWidth = 90
        end
        inherited Label4: TLabel
          Left = 1500
          Width = 56
          ExplicitLeft = 1500
          ExplicitWidth = 56
        end
        inherited edtCodigo: TEdit
          HelpContext = 1
        end
        inherited edtDescricao: TEdit
          Width = 497
          ExplicitWidth = 497
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 24
        end
        inherited edtOpcao: TEdit
          Left = 679
          Width = 100
          Visible = True
          ExplicitLeft = 679
          ExplicitWidth = 100
        end
        inherited edtOpcao1: TEdit
          Left = 1500
          ExplicitLeft = 1500
        end
      end
    end
  end
end
