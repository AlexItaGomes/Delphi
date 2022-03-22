inherited fCad_Usuario: TfCad_Usuario
  Caption = 'Cadastro de Usu'#225'rio'
  Constraints.MinHeight = 496
  Constraints.MinWidth = 650
  OnClose = FormClose
  ExplicitTop = -184
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ActivePage = TabSheet3
    ParentFont = False
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 3
        Top = 9
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 106
        Top = 9
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 3
        Top = 48
        Width = 83
        Height = 13
        Caption = '&Nome Completo'
        FocusControl = edtNome
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 25
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'USER_ID'
        DataSource = dmUsuarios.dsUsuario
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object DBEdit2: TDBEdit
        Left = 106
        Top = 25
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'USER_DTA_CADASTRO'
        DataSource = dmUsuarios.dsUsuario
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 475
        Top = 1
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'USER_ATIVO'
        DataSource = dmUsuarios.dsUsuario
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
      object edtNome: TDBEdit
        Left = 3
        Top = 64
        Width = 778
        Height = 21
        HelpContext = 1
        CharCase = ecUpperCase
        DataField = 'USER_NOME_COMPLETO'
        DataSource = dmUsuarios.dsUsuario
        TabOrder = 4
        OnKeyPress = FormKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 224
        Width = 782
        Height = 65
        Caption = 'Login'
        TabOrder = 6
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 29
          Height = 13
          Caption = 'Login'
          FocusControl = edtLogin
        end
        object Label5: TLabel
          Left = 135
          Top = 16
          Width = 32
          Height = 13
          Caption = 'Senha'
          FocusControl = edtSenha
        end
        object Label11: TLabel
          Left = 263
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Confirma'
        end
        object edtLogin: TDBEdit
          Left = 8
          Top = 31
          Width = 120
          Height = 21
          HelpContext = 1
          CharCase = ecUpperCase
          DataField = 'USER_LOGIN'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 0
          OnKeyPress = FormKeyPress
        end
        object edtSenha: TDBEdit
          Left = 135
          Top = 31
          Width = 120
          Height = 21
          HelpContext = 1
          CharCase = ecUpperCase
          DataField = 'USER_SENHA'
          DataSource = dmUsuarios.dsUsuario
          PasswordChar = '#'
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
        object edtConfirma: TEdit
          Left = 263
          Top = 31
          Width = 120
          Height = 21
          HelpContext = 1
          CharCase = ecUpperCase
          PasswordChar = '#'
          TabOrder = 2
          OnKeyPress = FormKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 91
        Width = 782
        Height = 134
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label12: TLabel
          Left = 678
          Top = 49
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit3
        end
        object Label13: TLabel
          Left = 5
          Top = 7
          Width = 48
          Height = 13
          Caption = '&Endere'#231'o'
          FocusControl = DBEdit4
        end
        object Label14: TLabel
          Left = 391
          Top = 7
          Width = 31
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit5
        end
        object Label15: TLabel
          Left = 5
          Top = 49
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodigo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label15Click
        end
        object Label16: TLabel
          Left = 182
          Top = 49
          Width = 27
          Height = 13
          Caption = 'Pra'#231'a'
          FocusControl = DBEdit7
          OnClick = Label15Click
        end
        object Label17: TLabel
          Left = 575
          Top = 49
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit8
        end
        object Label18: TLabel
          Left = 5
          Top = 89
          Width = 31
          Height = 13
          Caption = 'e-mail'
          FocusControl = DBEdit9
        end
        object Label19: TLabel
          Left = 468
          Top = 89
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone2
        end
        object Label20: TLabel
          Left = 573
          Top = 89
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone3
        end
        object Label21: TLabel
          Left = 677
          Top = 89
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone4
        end
        object Label22: TLabel
          Left = 364
          Top = 89
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone1
        end
        object btnPesq: TSpeedButton
          Left = 108
          Top = 64
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D4B0C9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429232009843058825009A45059A46079A46079A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9E4D0F
            A4571CF6F0E8973F059C4A0B9F4F139F4E129F4E129F4E129F4E129F4E129F4E
            129F4E129F4F119D4C0CA3571CA153159D4A0BE6D5C6E7D3C2943B00A25518A2
            5316A25316A25316A25316A25316A25316A25316A15215A4581FA96229A85F22
            A85F248A2900FFFFFFEDE0D4974000A86025A85F24A85F24A85F24A85F24A85F
            24A85F24A75F22AB642BAC682EAB6329AB642AA86023B06E38FFFFFFBB8658A2
            5210AB652BAB632AAB632AAB632AAB632AAB632AAB6227AC6930B17238AF6F32
            AF6F33B07034AA6424A96325FFFFFFC4966AA75F1DA96423A96425AD6C2EB071
            34AF6F33AF6F32B17339B57740B27439B2753AB2753AB3763BA7611FD5B394E7
            D5C2B2733CDABDA2D3B193AE6C2EAC692BB3753CB27439B4773FBA824AB87D46
            B97D47B97D47B97D47B98049AD6825D9BDA1FFFFFFFFFFFFFFFFFFFFFFFFC190
            5EB5773DB87D45BA824CBC8751BA834CBB834DBB834DBB844DB98048C2905DFC
            F9F6FFFFFFFFFFFFFFFFFFF4F7FAF3E8DEBA8047BA824ABB8752C1915BBF8D56
            C08E56C08E56C08E56BB874BD7B795FFFFFFFFFFFFFFFFFFFFFFFFEDEEEFFCF9
            F5C49561BE8C54C3915BC59660C3945CC3945DC3945DC3955DC18F56D2AF85FF
            FFFFFFFFFFFFFFFFFFFFFFEAECEEFBF7F2C59560C3935BC59762C9A16DC99F69
            C99F6AC99F6AC99F6AC99F69C4975DEBDBC8FFFFFFFFFFFFFFFFFFFFFFFFD9BC
            97C4985DC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCBA16BC8
            9B62E9DAC4F9F8F6F5EDE4E2CBADC4965BCBA36DCCA36DCBA46DDABE98CEA870
            D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BCCA368C79A5AC79D5ECDA66DD1AF
            7CD1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B683D5B683D5B582D5B582D4B27DDBC197F1EEEC}
          OnClick = btnPesqClick
        end
        object SpeedButton1: TSpeedButton
          Left = 145
          Top = 64
          Width = 35
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D490B009D4A0B009D4A0B009D4A0B009D4A0B009D4A0B009D4A
            0B009D4A0B009D4A0B009D490B00983F0000B1744900EAE5E000AF7042009132
            00009B480900973E00008C2C00008E2E00008D2E00008E2E00008E2E00008E2E
            00008E2E00008C2C0000973E00009B48090091310000B3774E009D4C0E009F4F
            12009B480800AF6E3C00E1C9B600DFC5B200E0C6B300DDC1AC00D7B79F00DCC3
            AD00E0C6B300E1C9B600AF6E3C009B4808009F4F12009D4C0C00A3571C00A253
            17009B470500C4936C00F9F4F100C79A7600C79C7800DABDA600FFFFFF00CEA8
            8900C18E6500F9F6F200C4936C009B470500A2531600A4581F00A9622900A85F
            2300A1531300C79B7600E6D2C100994300009B460200B97F4D00FFFFFF00FFFF
            FF0098440000E1C9B500C79B7700A1531300A85F2200AB642B00AC682E00AB63
            2A00A5581A00C99E7800EAD9CA00A4581800A55A1C00BF8C6000FFFFFF00FFFF
            FF00F3E9E000F6F1EB00C7997100A5591A00AB632800AC693000B1723800AF70
            3300A9652400CCA58000EBDBCC00A8622300AA672700C3946A00FFFFFF00F9F4
            F000FAF6F200FFFFFF00C69B7200AA662500AF6F3300B1733900B5774000B275
            3900AC6B2B00CEA78300EBDCCE00AC672A00B1733800B3753E00BB834F00B87F
            4A00B3763B00EDE0D400CEA58100AC6B2B00B2753900B4773F00BA824A00B97D
            4700B3753900D2AD8A00EDDFD200B2733500B97D4700B87D4500B77B4200B77B
            4300B1703100EDDED000D2AD8A00B3753900B97D4500BA824C00BC875100BB83
            4D00B67B3F00D3B18D00EEE0D300B47A3D00BB834D00BB834D00BB834D00BB83
            4D00B47A3D00EEE0D300D3B18D00B67B3F00BB834B00BB875200C1915B00C08E
            5600BC864A00D7B89400EFE4D600BA854900C08E5700C08E5600C08E5600C08E
            5700BA854900EFE4D600D7B89400BC864A00BF8E5600C3915B00C5966000C395
            5D00C08D5100D9BB9900EEE2D200BA844400C08D5400C08D5300C08D5300C08D
            5400BA844400EEE2D200D9BB9900C08D5100C3945C00C5976200C9A16D00C9A0
            6A00C4985E00DDC19F00FBF8F400DDC2A100E0C7A800E0C7A800E0C7A800E0C7
            A800DDC2A100FBF8F400DDC19F00C4985E00C9A06A00CAA26D00CBA26D00CCA3
            6E00CA9E6700D5B58A00F0E5D700F0E4D500F0E4D500F0E4D500F0E4D500F0E4
            D500F0E4D500F0E5D700D5B58A00CA9E6700CCA36E00CBA46D00DABE9800CEA8
            7000D1AE7C00CFAA7400CAA06500CAA16600CAA16600CAA16600CAA16600CAA1
            6600CAA16600CAA06500CFAA7400D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58300D5B58300D5B58300D5B58300D5B58300D5B5
            8300D5B58300D5B58300D5B58200D4B27D00DBC19700F1EEEC00}
          OnClick = SpeedButton1Click
        end
        object DBEdit3: TDBEdit
          Left = 678
          Top = 64
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_CEP'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 5
        end
        object DBEdit4: TDBEdit
          Left = 5
          Top = 23
          Width = 380
          Height = 21
          HelpContext = 1
          DataField = 'USER_ENDERECO'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 391
          Top = 23
          Width = 387
          Height = 21
          HelpContext = 1
          DataField = 'USER_BAIRRO'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 1
        end
        object edtCodigo: TDBEdit
          Left = 5
          Top = 65
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_GENE_ID_PRACA'
          DataSource = dmUsuarios.dsUsuario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImeName = 'btnPesq;SpeedButton1'
          ParentFont = False
          TabOrder = 2
          OnExit = edtCodigoExit
          OnKeyPress = edtCodigoKeyPress
        end
        object DBEdit7: TDBEdit
          Left = 182
          Top = 65
          Width = 389
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_DESCR'
          DataSource = dmUsuarios.dsUsuario
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 575
          Top = 65
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_PAR1'
          DataSource = dmUsuarios.dsUsuario
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit9: TDBEdit
          Tag = 1
          Left = 5
          Top = 105
          Width = 353
          Height = 21
          HelpContext = 1
          CharCase = ecLowerCase
          DataField = 'USER_EMAIL'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 6
        end
        object edtTelefone2: TDBEdit
          Left = 468
          Top = 105
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_TELEFONE1'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 8
          OnExit = edtTelefone2Exit
        end
        object edtTelefone3: TDBEdit
          Left = 573
          Top = 105
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_TELEFONE2'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 9
          OnExit = edtTelefone2Exit
        end
        object edtTelefone4: TDBEdit
          Left = 678
          Top = 105
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_TELEFONE3'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 10
          OnExit = edtTelefone2Exit
        end
        object edtTelefone1: TDBEdit
          Left = 364
          Top = 105
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'USER_TELEFONE4'
          DataSource = dmUsuarios.dsUsuario
          TabOrder = 7
          OnExit = edtTelefone2Exit
        end
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 631
        Top = 1
        Width = 150
        Height = 45
        Caption = 'Vendedor'
        Columns = 2
        DataField = 'USER_VENDEDOR'
        DataSource = dmUsuarios.dsUsuario
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Empresas'
      ImageIndex = 1
      object btnAtrib_Empr: TSpeedButton
        Left = 368
        Top = 195
        Width = 50
        Height = 50
        Caption = '>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnAtrib_EmprClick
      end
      object btnRet_Empr: TSpeedButton
        Left = 368
        Top = 245
        Width = 50
        Height = 50
        Caption = '<'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnRet_EmprClick
      end
      object Label6: TLabel
        Left = 2
        Top = 5
        Width = 111
        Height = 13
        Caption = 'Empresas Dispon'#237'veis'
      end
      object Label7: TLabel
        Left = 419
        Top = 5
        Width = 108
        Height = 13
        Caption = 'Empresas do Usu'#225'rio'
      end
      object treeEmpr_Disp: TTreeView
        Left = -3
        Top = 21
        Width = 365
        Height = 465
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Images = ImageList1
        Indent = 19
        MultiSelect = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnDblClick = treeEmpr_DispDblClick
        OnKeyDown = treeEmpr_DispKeyDown
        OnKeyPress = FormKeyPress
      end
      object treeEmpr_Perm: TTreeView
        Left = 419
        Top = 20
        Width = 365
        Height = 465
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Images = ImageList1
        Indent = 19
        MultiSelect = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnDblClick = treeEmpr_PermDblClick
        OnKeyDown = treeEmpr_PermKeyDown
        OnKeyPress = FormKeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Permiss'#245'es'
      ImageIndex = 2
      object btnAtribuirPermissao: TSpeedButton
        Left = 368
        Top = 195
        Width = 50
        Height = 50
        Caption = '>'
        OnClick = btnAtribuirPermissaoClick
      end
      object btnRetiraPermissao: TSpeedButton
        Left = 368
        Top = 245
        Width = 50
        Height = 50
        Caption = '<'
        OnClick = btnRetiraPermissaoClick
      end
      object Label8: TLabel
        Left = 423
        Top = 45
        Width = 116
        Height = 13
        Caption = 'Permiss'#245'es do Usu'#225'rio'
      end
      object Label9: TLabel
        Left = 2
        Top = 5
        Width = 119
        Height = 13
        Caption = 'Permiss'#245'es Dispon'#237'veis'
      end
      object Label10: TLabel
        Left = 423
        Top = 5
        Width = 44
        Height = 13
        Caption = 'Empresa'
      end
      object treePerm_Disp: TTreeView
        Left = 2
        Top = 20
        Width = 365
        Height = 465
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Images = ImageList1
        Indent = 19
        MultiSelect = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = treePerm_DispKeyDown
        OnKeyPress = FormKeyPress
      end
      object treePerm_Usuario: TTreeView
        Left = 419
        Top = 62
        Width = 365
        Height = 425
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Images = ImageList1
        Indent = 19
        MultiSelect = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = treePerm_UsuarioKeyDown
        OnKeyPress = FormKeyPress
      end
      object cmbEmpresa: TComboBox
        Left = 423
        Top = 20
        Width = 361
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = cmbEmpresaClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&4.Limita'#231#227'o de Profissionais'
      ImageIndex = 3
      inline frPesqTecnico: TfrPesquisa
        Left = 5
        Top = 5
        Width = 436
        Height = 188
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 436
        ExplicitHeight = 188
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 387
          Height = 188
          Caption = 'Lista de Profissionais N'#227'o Vis'#237'veis'
          ExplicitLeft = 49
          ExplicitWidth = 387
          ExplicitHeight = 188
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 36
            Caption = 'T'#233'cnico'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 36
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 52
            Width = 383
            Height = 0
            Visible = False
            ExplicitTop = 52
            ExplicitWidth = 383
            ExplicitHeight = 0
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            Width = 206
            ExplicitTop = 29
            ExplicitWidth = 206
          end
          inherited lbRegistros: TListBox
            Top = 52
            Width = 383
            Height = 134
            ExplicitTop = 52
            ExplicitWidth = 383
            ExplicitHeight = 134
          end
          inherited btnAdicionar: TBitBtn
            Left = 350
            Top = 28
            ExplicitLeft = 350
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 188
          ItemIndex = 11
          ExplicitWidth = 49
          ExplicitHeight = 188
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 447
        Top = 10
        Width = 168
        Height = 17
        Caption = 'Limita-los em todo o Sistema'
        DataField = 'USER_LIMITAR_PROFISSIONAIS'
        DataSource = dmUsuarios.dsUsuario
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 341
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 492
    end
  end
  object ImageList1: TImageList
    Left = 24
    Top = 432
    Bitmap = {
      494C010102000400DC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A000000630000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A000000630000004A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000630000089C210000630000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A00000063000039AD39000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000630000109C2100089C210000630000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A0000006300008CD68C0063C663000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000010A5290010A52900089C210000630000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A0000006300007BD67B007BD67B006BC66B000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000010B5390010A52900089C2100089C210000630000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000006300004ABD52006BC663006BC66B005AC65A000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000018B54A0010AD390010AD390010AD390010A52900006300000052
      0000000000000000000000000000000000000000000000000000000000000000
      000000520000006300004ABD52004ABD52004ABD52005ABD520052BD52000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000052BD52005ABD52004ABD52004ABD52004ABD5200006300000052
      0000000000000000000000000000000000000000000000000000000000000000
      0000005200000063000010A5290010AD390010AD390010AD390018B54A000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006300005AC65A006BC66B006BC663004ABD520000630000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A000000630000089C2100089C210010A5290010B539000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006300006BC66B007BD67B007BD67B0000630000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A000000630000089C210010A5290010A529000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000063C663008CD68C0000630000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A000000630000089C2100109C21000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063000039AD390000630000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A000000630000089C21000063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A000000630000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A000000630000004A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      F1FFFF8F00000000F0FFFF0F00000000F07FFE0F00000000F03FFC0F00000000
      F01FF80F00000000F00FF00F00000000F00FF00F00000000F01FF80F00000000
      F03FFC0F00000000F07FFE0F00000000F0FFFF0F00000000F1FFFF8F00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
