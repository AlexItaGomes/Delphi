inherited fCad_Pracas: TfCad_Pracas
  Caption = 'Cadastro de Pra'#231'as'
  Constraints.MinHeight = 190
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
        Width = 40
        Height = 13
        Caption = '&Cidade'
        FocusControl = edtCidade
      end
      object Label4: TLabel
        Left = 107
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 680
        Top = 48
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = edtCidade
      end
      object Label5: TLabel
        Left = 524
        Top = 48
        Width = 60
        Height = 13
        Caption = 'C'#243'd. IBGE'
        FocusControl = edtCidade
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmPracas.dsPracas
        ReadOnly = True
        TabOrder = 0
      end
      object edtCidade: TDBEdit
        Left = 3
        Top = 64
        Width = 515
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmPracas.dsPracas
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
        DataSource = dmPracas.dsPracas
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object cmbUF: TDBComboBox
        Left = 680
        Top = 64
        Width = 100
        Height = 21
        Style = csDropDownList
        DataField = 'GENE_PAR1'
        DataSource = dmPracas.dsPracas
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        Sorted = True
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 524
        Top = 64
        Width = 150
        Height = 21
        HelpContext = 1
        DataField = 'GENE_PAR2'
        DataSource = dmPracas.dsPracas
        TabOrder = 3
      end
    end
  end
end
