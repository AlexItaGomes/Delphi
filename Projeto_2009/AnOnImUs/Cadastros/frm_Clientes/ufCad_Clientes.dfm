inherited fCad_Clientes: TfCad_Clientes
  Caption = 'Cadastro de Clientes'
  Constraints.MinHeight = 551
  Constraints.MinWidth = 632
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ParentFont = False
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 107
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 3
        Top = 87
        Width = 64
        Height = 13
        Caption = '&Raz'#227'o Social'
        FocusControl = edtRazao
      end
      object Label4: TLabel
        Left = 393
        Top = 87
        Width = 76
        Height = 13
        Caption = '&Nome Fantasia'
        FocusControl = edtFantasia
      end
      object Label6: TLabel
        Left = 3
        Top = 375
        Width = 19
        Height = 13
        Caption = 'Site'
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 393
        Top = 375
        Width = 31
        Height = 13
        Caption = 'e-mail'
        FocusControl = DBEdit6
      end
      object Label8: TLabel
        Left = 3
        Top = 332
        Width = 44
        Height = 13
        Caption = '&Telefone'
        FocusControl = edtTelefone1
      end
      object Label9: TLabel
        Left = 133
        Top = 332
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = edtTelefone2
      end
      object Label10: TLabel
        Left = 263
        Top = 332
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = edtTelefone3
      end
      object Label11: TLabel
        Left = 393
        Top = 332
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = edtTelefone4
      end
      object Label12: TLabel
        Left = 109
        Top = 128
        Width = 48
        Height = 13
        Caption = '&Endere'#231'o'
        FocusControl = edtEndereco
      end
      object Label13: TLabel
        Left = 3
        Top = 169
        Width = 31
        Height = 13
        Caption = '&Bairro'
        FocusControl = edtBairro
      end
      object Label14: TLabel
        Left = 3
        Top = 128
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit13
      end
      object Label5: TLabel
        Left = 3
        Top = 48
        Width = 48
        Height = 13
        Caption = '&CPF/CNPJ'
        FocusControl = edtCNPJ
      end
      object Label18: TLabel
        Left = 198
        Top = 48
        Width = 36
        Height = 13
        Caption = 'CIC/RG'
        FocusControl = DBEdit17
      end
      object Label27: TLabel
        Left = 393
        Top = 169
        Width = 88
        Height = 13
        Caption = 'Ponto Refer'#234'ncia'
        FocusControl = DBEdit3
      end
      object Label15: TLabel
        Left = 522
        Top = 332
        Width = 80
        Height = 13
        Caption = 'Dt. Abert./Nasc.'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CLIE_ID'
        DataSource = dmClientes.dsClientes
        ReadOnly = True
        TabOrder = 0
        OnExit = DBEdit1Exit
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CLIE_DTA_CADASTRO'
        DataSource = dmClientes.dsClientes
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 315
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'CLIE_ATIVO'
        DataSource = dmClientes.dsClientes
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
      object rdTipo: TDBRadioGroup
        Left = 473
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Tipo'
        Columns = 2
        DataField = 'CLIE_TIPO'
        DataSource = dmClientes.dsClientes
        Items.Strings = (
          'F'#237'sico'
          'J'#250'ridico')
        TabOrder = 3
        Values.Strings = (
          'F'
          'J')
        OnClick = rdTipoClick
      end
      object edtRazao: TDBEdit
        Left = 3
        Top = 103
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_RAZAO_SOCIAL'
        DataSource = dmClientes.dsClientes
        TabOrder = 7
      end
      object edtFantasia: TDBEdit
        Left = 393
        Top = 103
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_FANTASIA'
        DataSource = dmClientes.dsClientes
        TabOrder = 8
        OnEnter = edtFantasiaEnter
      end
      object DBEdit5: TDBEdit
        Tag = 1
        Left = 3
        Top = 391
        Width = 385
        Height = 21
        CharCase = ecLowerCase
        DataField = 'CLIE_SITE'
        DataSource = dmClientes.dsClientes
        TabOrder = 20
      end
      object DBEdit6: TDBEdit
        Tag = 1
        Left = 393
        Top = 391
        Width = 385
        Height = 21
        HelpContext = 1
        CharCase = ecLowerCase
        DataField = 'CLIE_EMAIL'
        DataSource = dmClientes.dsClientes
        TabOrder = 21
      end
      object edtTelefone1: TDBEdit
        Left = 3
        Top = 348
        Width = 120
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE1'
        DataSource = dmClientes.dsClientes
        TabOrder = 15
        OnExit = edtTelefone1Exit
      end
      object edtTelefone2: TDBEdit
        Left = 133
        Top = 348
        Width = 120
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE2'
        DataSource = dmClientes.dsClientes
        TabOrder = 16
        OnExit = edtTelefone1Exit
      end
      object edtTelefone3: TDBEdit
        Left = 263
        Top = 348
        Width = 120
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE3'
        DataSource = dmClientes.dsClientes
        TabOrder = 17
        OnExit = edtTelefone1Exit
      end
      object edtTelefone4: TDBEdit
        Left = 393
        Top = 348
        Width = 120
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE4'
        DataSource = dmClientes.dsClientes
        TabOrder = 18
        OnExit = edtTelefone1Exit
      end
      object edtEndereco: TDBEdit
        Left = 109
        Top = 143
        Width = 669
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_ENDERECO'
        DataSource = dmClientes.dsClientes
        TabOrder = 10
      end
      object edtBairro: TDBEdit
        Left = 3
        Top = 185
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_BAIRRO'
        DataSource = dmClientes.dsClientes
        TabOrder = 11
      end
      object DBEdit13: TDBEdit
        Left = 3
        Top = 143
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_CEP'
        DataSource = dmClientes.dsClientes
        TabOrder = 9
      end
      object edtCNPJ: TDBEdit
        Left = 3
        Top = 64
        Width = 190
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_CNPJ_CPF'
        DataSource = dmClientes.dsClientes
        TabOrder = 5
        OnEnter = edtCNPJEnter
        OnExit = edtCNPJExit
      end
      object DBEdit17: TDBEdit
        Left = 198
        Top = 64
        Width = 190
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_RG'
        DataSource = dmClientes.dsClientes
        TabOrder = 6
      end
      object DBEdit3: TDBEdit
        Left = 393
        Top = 185
        Width = 385
        Height = 21
        DataField = 'CLIE_REFERENCIA'
        DataSource = dmClientes.dsClientes
        TabOrder = 12
      end
      inline frPesqPraca: TfrPesqIndividual
        Left = 3
        Top = 209
        Width = 780
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        ExplicitLeft = 3
        ExplicitTop = 209
        ExplicitWidth = 780
        inherited Label2: TLabel
          Width = 27
          Caption = 'Pra'#231'a'
          ExplicitWidth = 27
        end
        inherited btnPesquisar: TSpeedButton
          OnClick = frPesqPracabtnPesquisarClick
        end
        inherited Label3: TLabel
          Left = 675
          Width = 14
          Caption = 'UF'
          Visible = True
          ExplicitLeft = 675
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
          Width = 495
          ExplicitWidth = 495
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 2
        end
        inherited ckOmitir: TCheckBox
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited edtOpcao: TEdit
          Left = 675
          Width = 100
          Visible = True
          ExplicitLeft = 675
          ExplicitWidth = 100
        end
        inherited edtOpcao1: TEdit
          Left = 1500
          ExplicitLeft = 1500
        end
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 628
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Tele-Atendimento'
        Columns = 2
        DataField = 'CLIE_BLOQUEAR_ATENDIMENTO'
        DataSource = dmClientes.dsClientes
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
        Values.Strings = (
          '1'
          '0')
      end
      inline frPesqDuplo: TfrPesqDuplo
        Left = 1
        Top = 248
        Width = 780
        Height = 81
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        ExplicitLeft = 1
        ExplicitTop = 248
        ExplicitWidth = 780
        ExplicitHeight = 81
        inherited frPesqPrimeiro: TfrPesqIndividual
          Width = 780
          ExplicitWidth = 780
          inherited btnInserir: TSpeedButton
            OnClick = frPesqPrimeirobtnInserirClick
          end
          inherited Label3: TLabel
            Left = 675
            Visible = True
            ExplicitLeft = 675
          end
          inherited Label4: TLabel
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtDescricao: TEdit
            Width = 495
            ExplicitWidth = 495
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 25
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 675
            Width = 100
            Visible = True
            ExplicitLeft = 675
            ExplicitWidth = 100
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
        inherited frPesqSegundo: TfrPesqIndividual
          Width = 780
          ExplicitWidth = 780
          inherited Label3: TLabel
            Left = 675
            Visible = True
            ExplicitLeft = 675
          end
          inherited Label4: TLabel
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtDescricao: TEdit
            Width = 495
            ExplicitWidth = 495
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 24
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 675
            Width = 100
            Visible = True
            ExplicitLeft = 675
            ExplicitWidth = 100
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
      end
      object DBDateEdit2: TDBDateEdit
        Left = 520
        Top = 348
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CLIE_DT_NASCIMENTO'
        DataSource = dmClientes.dsClientes
        NumGlyphs = 2
        TabOrder = 19
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Observa'#231#245'es'
      ImageIndex = 1
      object btnImportar: TSpeedButton
        Left = 684
        Top = 462
        Width = 100
        Height = 25
        Caption = 'Importar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000E9E4DFB1744A
          983F009D490B9C480A9C480A9C480A9D490C9A43049B47079E4B0B963E009C47
          09984000B17449EAE5E0AF70429132009B47089A46079A46079A46079A460799
          43019C4809923500831B00B171449338009B4708913100B3774E9D4C0E9F4F12
          9F4E129F4E129F4E129F4F139F5012801800FFFFFFFDFCFBF1E5D8FFFFFFC696
          759134009D4C0D9D4C0DA3571CA15216A25316A25316A25316A25519913500B1
          713CFFFFFFFFFFFFFFFFFFFFFFFFF0E3DABF8B63A05316A25519A96229A85F22
          A85F24A85F24A96126913500FFFFFFFFFFFFFFFFFFE9DACBC79872F2E7DFFFFF
          FFFFFFFFD5B295A5591BAC682EAB6329AB632AAB6329AB642BA35716CCA17FFF
          FFFFF5EDE7A962279C4B05B2733FFFFFFFFFFFFF963E00AC682EB17238AF6F32
          B07034B07136AC692AA75F1FCBA17DFFFFFFFAF6F2BA824FA35914C79970FFFF
          FFFFFFFFB98352AE6E32B57740B3763EAA6523A1550DC89D75A0520AFAF7F4FF
          FFFFFFFFFFF8F2EEE4CFBDFBFAF8FFFFFFFFFFFFDDC2A9AF6D31BA834CAE6A2A
          E3CFBADEC2A8FFFFFFFCFBFACAA076C09061FEFEFDFFFFFFFFFFFFFFFFFFEFE4
          D9AA6521AE692ABA834DBE8954A65D14F4EEE5FFFFFFFFFFFFFFFFFFFFFFFFC0
          8B57E9D7C8FFFFFFD4B290FFFFFFE1C9B5B5793EBB844DBB8752BE8D54D3B08C
          FFFFFFFAF7F39F5300BB864BFFFFFFFDFDFDB37A38B57A39B77F42B57939B67C
          3CC08E58BF8D56C3915BC2925AD6B894FFFFFFF9F6F2A7600DBF8E52FFFFFFFD
          FDFBC2925AC29159C4965EC3955EC4965FC3955DC3945CC59762CBA26FB57C34
          FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFD2AE83C5985EC9A06AC99F6AC99F6AC99F
          6AC99F6AC99F69CAA26DCBA36EC5975BE8D8C3E3CFB4FFFFFFFAF8F5E8D7C2D6
          B990C9A068CCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCBA36DDABE98CFA971
          CDA56CC69C5BDEC39ED0AC77CAA065CFAA73D1AE7BD1AE7BD1AE7BD1AE7BD1AE
          7BD1AE7BCDA76EDCC29DF0EEEAD9C198D4B27DD6B684D2B17BD4B37FD5B583D5
          B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEB}
        OnClick = btnImportarClick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 222
        Width = 786
        Height = 150
        Align = alTop
        Caption = 'Observa'#231#245'es'
        TabOrder = 0
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 782
          Height = 133
          Align = alClient
          DataField = 'CLIE_OBS'
          DataSource = dmClientes.dsClientes
          TabOrder = 0
          OnEnter = DBMemo1Enter
          OnExit = DBMemo1Exit
          OnKeyPress = DBMemo1KeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 222
        Align = alTop
        Caption = 'Hist'#243'rico de Anamnese'
        TabOrder = 1
        object Label16: TLabel
          Left = 592
          Top = 43
          Width = 26
          Height = 13
          Caption = 'Tipo:'
        end
        object Label17: TLabel
          Left = 591
          Top = 67
          Width = 26
          Height = 13
          Caption = 'Tipo:'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 10
          Top = 19
          Width = 257
          Height = 17
          Caption = 'Glaucoma'
          DataField = 'CLIE_GLAUCOMA'
          DataSource = dmClientes.dsClientes
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 10
          Top = 41
          Width = 181
          Height = 17
          Caption = 'Depress'#227'o'
          DataField = 'CLIE_DEPRESSAO'
          DataSource = dmClientes.dsClientes
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 10
          Top = 65
          Width = 181
          Height = 17
          Caption = 'Epilepsia'
          DataField = 'CLIE_EPILEPSIA'
          DataSource = dmClientes.dsClientes
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 10
          Top = 90
          Width = 181
          Height = 17
          Caption = 'Marca-Passo'
          DataField = 'CLIE_MARCA_PASSO'
          DataSource = dmClientes.dsClientes
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 10
          Top = 114
          Width = 181
          Height = 17
          Caption = 'Hipertens'#227'o'
          DataField = 'CLIE_HIPERTENSAO'
          DataSource = dmClientes.dsClientes
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ckHepatite: TDBCheckBox
          Left = 523
          Top = 41
          Width = 69
          Height = 17
          Caption = 'Hepatite'
          DataField = 'CLIE_HEPATITE'
          DataSource = dmClientes.dsClientes
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = ckHepatiteClick
        end
        object DBCheckBox7: TDBCheckBox
          Left = 266
          Top = 19
          Width = 257
          Height = 17
          Caption = 'C'#226'ncer'
          DataField = 'CLIE_CANCER'
          DataSource = dmClientes.dsClientes
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 266
          Top = 41
          Width = 181
          Height = 17
          Caption = 'HIV'
          DataField = 'CLIE_HIV'
          DataSource = dmClientes.dsClientes
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox9: TDBCheckBox
          Left = 266
          Top = 65
          Width = 181
          Height = 17
          Caption = 'Esta Alcoolizada(o)'
          DataField = 'CLIE_ALCOOLIZADO'
          DataSource = dmClientes.dsClientes
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox10: TDBCheckBox
          Left = 266
          Top = 90
          Width = 181
          Height = 17
          Caption = 'Esta Gr'#225'vida'
          DataField = 'CLIE_GRAVIDA'
          DataSource = dmClientes.dsClientes
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 266
          Top = 114
          Width = 181
          Height = 17
          Caption = 'Alergia a Metais/ Pigmentos'
          DataField = 'CLIE_ALERGICO_METAIS_PIGMETO'
          DataSource = dmClientes.dsClientes
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 523
          Top = 19
          Width = 257
          Height = 17
          Caption = 'Problemas de Pele'
          DataField = 'CLIE_PROBLEMAS_PELE'
          DataSource = dmClientes.dsClientes
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ckDiabetes: TDBCheckBox
          Left = 523
          Top = 65
          Width = 91
          Height = 17
          Caption = 'Diabetes'
          DataField = 'CLIE_DIABETES'
          DataSource = dmClientes.dsClientes
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = ckDiabetesClick
        end
        object edtTipoHepatite: TDBEdit
          Left = 625
          Top = 39
          Width = 155
          Height = 21
          DataField = 'CLIE_HEPATITE_TIPO'
          DataSource = dmClientes.dsClientes
          Enabled = False
          TabOrder = 12
        end
        object edtTipoDiabetes: TDBEdit
          Left = 626
          Top = 63
          Width = 155
          Height = 21
          DataField = 'CLIE_DIABETES_TIPO'
          DataSource = dmClientes.dsClientes
          Enabled = False
          TabOrder = 14
        end
        object GroupBox6: TGroupBox
          Left = 2
          Top = 134
          Width = 782
          Height = 86
          Align = alBottom
          Caption = 'Anestesia'
          TabOrder = 15
          object lbTempoAnestesia: TLabel
            Left = 364
            Top = 60
            Width = 97
            Height = 13
            Caption = 'Tempo para Efeito:'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 8
            Top = 17
            Width = 181
            Height = 17
            Caption = 'Utilizou Anestesia'
            DataField = 'CLIE_UTILIZOU_ANESTESIA'
            DataSource = dmClientes.dsClientes
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 8
            Top = 36
            Width = 350
            Height = 45
            Caption = 'N'#237'vel de Resist'#234'ncia a Anestesia'
            Columns = 4
            DataField = 'CLIE_NIVEL_ANESTESIA'
            DataSource = dmClientes.dsClientes
            Items.Strings = (
              'Baixo'
              'M'#233'dio'
              'Alto'
              'N'#227'o Pegou')
            TabOrder = 1
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object DBEdit2: TDBEdit
            Left = 477
            Top = 56
            Width = 121
            Height = 21
            DataField = 'CLIE_TEMPO_ANESTESIA'
            DataSource = dmClientes.dsClientes
            TabOrder = 2
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Hist'#243'rico'
      ImageIndex = 2
      object pageHistorico: TPageControl
        Left = 0
        Top = 0
        Width = 786
        Height = 489
        ActivePage = TabSheet6
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'Agendamentos'
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 778
            Height = 461
            Align = alClient
            Caption = 'Hist'#243'rico Atendimento'
            TabOrder = 0
            object grAtendimento: TDBGrid
              Left = 2
              Top = 15
              Width = 774
              Height = 444
              Align = alClient
              DataSource = dmClientes.dsHistorico
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = grAtendimentoDrawColumnCell
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Vendas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ImageIndex = 1
          ParentFont = False
        end
        object TabSheet5: TTabSheet
          Caption = 'Ordem de Servi'#231'o'
          ImageIndex = 2
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 778
            Height = 461
            Align = alClient
            Caption = 'Hist'#243'rico Ordem de Servi'#231'o'
            TabOrder = 0
            object grOrdemServico: TDBGrid
              Left = 2
              Top = 15
              Width = 774
              Height = 444
              Align = alClient
              DataSource = dmClientes.dsOrdemServico
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = grOrdemServicoDrawColumnCell
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Financeiro'
          ImageIndex = 3
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 778
            Height = 461
            Align = alClient
            Caption = 'Hist'#243'rico Financeiro'
            TabOrder = 0
            object grFinanceiro: TDBGrid
              Left = 2
              Top = 15
              Width = 774
              Height = 444
              Align = alClient
              DataSource = dmClientes.dsFinanceiro
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = grFinanceiroDrawColumnCell
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 320
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 500
    end
  end
end
