inherited fCadFiltros: TfCadFiltros
  Caption = 'Filtros'
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 102
        Height = 13
        Caption = 'Modelo do Produto'
        FocusControl = edtFiltro
      end
      object Label3: TLabel
        Left = 112
        Top = 5
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 21
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmFiltros.dsFiltros
        ReadOnly = True
        TabOrder = 0
      end
      object edtFiltro: TDBEdit
        Left = 8
        Top = 64
        Width = 598
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmFiltros.dsFiltros
        TabOrder = 1
      end
      object DBDateEdit1: TDBDateEdit
        Left = 112
        Top = 21
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmFiltros.dsFiltros
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 612
        Top = 2
        Width = 170
        Height = 130
        Caption = 'Logo (Duplo Clique)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBImage1: TDBImage
          Left = 2
          Top = 15
          Width = 166
          Height = 113
          Align = alClient
          DataField = 'GENE_IMAGE'
          DataSource = dmFiltros.dsFiltros
          TabOrder = 0
          OnDblClick = DBImage1DblClick
        end
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Title = 'Filtro'
    Left = 296
    Top = 144
  end
end
