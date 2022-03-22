inherited fCad_Empresas: TfCad_Empresas
  Caption = 'Cadastro de Empresas'
  Constraints.MinHeight = 492
  Font.Name = 'Segoe UI'
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
        Left = 3
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 108
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Dt. Cadatro'
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 49
        Width = 73
        Height = 13
        Caption = '&Raz'#227'o Social'
        FocusControl = edtRazao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 89
        Width = 83
        Height = 13
        Caption = '&Nome Fantasia'
        FocusControl = edtFantasia
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'EMPR_ID'
        DataSource = dmEmpresas.dsEmpresas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 456
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'EMPR_ATIVO'
        DataSource = dmEmpresas.dsEmpresas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'EMPR_DTA_CADASTRO'
        DataSource = dmEmpresas.dsEmpresas
        ReadOnly = True
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object edtRazao: TDBEdit
        Left = 3
        Top = 65
        Width = 603
        Height = 21
        HelpContext = 1
        DataField = 'EMPR_RAZAO_SOCIAL'
        DataSource = dmEmpresas.dsEmpresas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtFantasia: TDBEdit
        Left = 3
        Top = 105
        Width = 603
        Height = 21
        HelpContext = 1
        DataField = 'EMPR_NOME_FANTASIA'
        DataSource = dmEmpresas.dsEmpresas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 137
        Width = 779
        Height = 264
        Caption = '&Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label5: TLabel
          Left = 5
          Top = 16
          Width = 23
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 111
          Top = 16
          Width = 53
          Height = 13
          Caption = 'En&dere'#231'o'
          FocusControl = edtEndereco
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 673
          Top = 16
          Width = 19
          Height = 13
          Caption = 'Nr'#186
          FocusControl = DBEdit6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 5
          Top = 56
          Width = 35
          Height = 13
          Caption = '&Bairro'
          FocusControl = edtBairro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 393
          Top = 56
          Width = 80
          Height = 13
          Caption = 'Complemento'
          FocusControl = DBEdit8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 5
          Top = 219
          Width = 23
          Height = 13
          Caption = 'sitio'
          FocusControl = DBEdit12
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 393
          Top = 219
          Width = 36
          Height = 13
          Caption = 'e-mail'
          FocusControl = DBEdit13
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 5
          Top = 136
          Width = 29
          Height = 13
          Caption = 'CNPJ'
          FocusControl = edtCNPJ
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 211
          Top = 136
          Width = 80
          Height = 13
          Caption = 'Insc. Estadual'
          FocusControl = DBEdit14
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 5
          Top = 178
          Width = 48
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 109
          Top = 178
          Width = 19
          Height = 13
          Caption = 'Fax'
          FocusControl = DBEdit16
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 415
          Top = 136
          Width = 84
          Height = 13
          Caption = 'Insc. Municipal'
          FocusControl = DBEdit2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit4: TDBEdit
          Left = 5
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_CEP'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtEndereco: TDBEdit
          Left = 111
          Top = 32
          Width = 556
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_ENDERECO'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 673
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_NR_ENDERECO'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtBairro: TDBEdit
          Left = 5
          Top = 72
          Width = 385
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_BAIRRO'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 393
          Top = 72
          Width = 380
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_COMPLEMENTO'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit12: TDBEdit
          Tag = 1
          Left = 5
          Top = 235
          Width = 385
          Height = 21
          HelpContext = 1
          CharCase = ecLowerCase
          DataField = 'EMPR_SITE'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit13: TDBEdit
          Tag = 1
          Left = 393
          Top = 235
          Width = 380
          Height = 21
          HelpContext = 1
          CharCase = ecLowerCase
          DataField = 'EMPR_EMAIL'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtCNPJ: TDBEdit
          Left = 5
          Top = 152
          Width = 200
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_CNPJ'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit14: TDBEdit
          Left = 211
          Top = 152
          Width = 200
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_IE'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtTelefone: TDBEdit
          Left = 5
          Top = 194
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_TELEFONE'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnExit = edtTelefoneExit
        end
        object DBEdit16: TDBEdit
          Left = 109
          Top = 194
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_FAX'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnExit = edtTelefoneExit
        end
        inline frPesqPraca: TfrPesqIndividual
          Left = 2
          Top = 94
          Width = 776
          Height = 41
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ExplicitLeft = 2
          ExplicitTop = 94
          ExplicitWidth = 776
          ExplicitHeight = 41
          inherited Label2: TLabel
            Width = 27
            Caption = 'Pra'#231'a'
            ExplicitWidth = 27
          end
          inherited Label3: TLabel
            Left = 696
            Width = 14
            Caption = 'UF'
            Visible = True
            ExplicitLeft = 696
            ExplicitWidth = 14
          end
          inherited Label4: TLabel
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtCodigo: TEdit
            HelpContext = 1
          end
          inherited edtDescricao: TEdit
            Width = 516
            ExplicitWidth = 516
          end
          inherited rdOpcoes: TRadioGroup
            Left = -279
            ItemIndex = 2
            ExplicitLeft = -279
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 696
            Visible = True
            ExplicitLeft = 696
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
        object DBEdit2: TDBEdit
          Left = 415
          Top = 152
          Width = 200
          Height = 21
          HelpContext = 1
          DataField = 'EMPR_INSC_MUNICIPAL'
          DataSource = dmEmpresas.dsEmpresas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
      object GroupBox2: TGroupBox
        Left = 612
        Top = 2
        Width = 170
        Height = 130
        Caption = 'Logo (Duplo Clique) 126x78'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object DBImage1: TDBImage
          Left = 2
          Top = 15
          Width = 166
          Height = 113
          Align = alClient
          DataField = 'EMPR_LOGOTIPO'
          DataSource = dmEmpresas.dsEmpresas
          TabOrder = 0
          OnDblClick = DBImage1DblClick
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 275
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 425
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Title = 'LogoMarca da Empresa'
    Left = 296
    Top = 144
  end
end
