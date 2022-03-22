inherited fCad_Fornecedores: TfCad_Fornecedores
  Caption = 'Cadastro de Fornecedores'
  Constraints.MinHeight = 467
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ActivePage = TabSheet1
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
        Top = 90
        Width = 64
        Height = 13
        Caption = '&Raz'#227'o Social'
        FocusControl = edtRazao
      end
      object Label4: TLabel
        Left = 3
        Top = 130
        Width = 76
        Height = 13
        Caption = '&Nome Fantasia'
        FocusControl = edtFantasia
      end
      object Label7: TLabel
        Left = 3
        Top = 209
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = edtCEP
      end
      object Label8: TLabel
        Left = 3
        Top = 171
        Width = 48
        Height = 13
        Caption = '&Endere'#231'o'
        FocusControl = edtEndereco
      end
      object Label9: TLabel
        Left = 107
        Top = 210
        Width = 31
        Height = 13
        Caption = '&Bairro'
        FocusControl = edtBairro
      end
      object Label10: TLabel
        Left = 3
        Top = 249
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Praca
        OnClick = Label10Click
      end
      object Label11: TLabel
        Left = 180
        Top = 249
        Width = 27
        Height = 13
        Caption = 'Pra'#231'a'
        FocusControl = DBEdit10
        OnClick = Label10Click
      end
      object Label12: TLabel
        Left = 679
        Top = 249
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit11
      end
      object btnPesq_Praca: TSpeedButton
        Left = 107
        Top = 265
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
        OnClick = btnPesq_PracaClick
      end
      object Label15: TLabel
        Left = 272
        Top = 864
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label14: TLabel
        Left = 3
        Top = 289
        Width = 44
        Height = 13
        Caption = '&Telefone'
        FocusControl = edtTelefone
      end
      object Label16: TLabel
        Left = 109
        Top = 289
        Width = 17
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit16
      end
      object Label17: TLabel
        Left = 3
        Top = 328
        Width = 19
        Height = 13
        Caption = 'Site'
        FocusControl = DBEdit17
      end
      object Label18: TLabel
        Left = 395
        Top = 328
        Width = 31
        Height = 13
        Caption = 'e-mail'
        FocusControl = DBEdit18
      end
      object SpeedButton1: TSpeedButton
        Left = 143
        Top = 265
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
      object Label5: TLabel
        Left = 3
        Top = 50
        Width = 48
        Height = 13
        Caption = '&CPF/CNPJ'
        FocusControl = edtCNPJ
      end
      object Label6: TLabel
        Left = 212
        Top = 50
        Width = 70
        Height = 13
        Caption = 'Insc. Estadual'
        FocusControl = edtIncricao
      end
      object Label13: TLabel
        Left = 417
        Top = 50
        Width = 42
        Height = 13
        Caption = 'Contato'
        FocusControl = DBEdit12
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'FORN_ID'
        DataSource = dmFornecedores.dsFornecedores
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'FORN_DTA_CADASTRO'
        DataSource = dmFornecedores.dsFornecedores
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object rdAtivo: TDBRadioGroup
        Left = 474
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'FORN_ATIVO'
        DataSource = dmFornecedores.dsFornecedores
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
      object edtRazao: TDBEdit
        Left = 3
        Top = 106
        Width = 776
        Height = 21
        HelpContext = 1
        DataField = 'FORN_RAZAO_SOCIAL'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 7
      end
      object edtFantasia: TDBEdit
        Left = 3
        Top = 146
        Width = 776
        Height = 21
        HelpContext = 1
        DataField = 'FORN_NOME_FANTASIA'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 8
        OnEnter = edtFantasiaEnter
      end
      object edtCEP: TDBEdit
        Left = 3
        Top = 225
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'FORN_CEP'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 10
      end
      object edtEndereco: TDBEdit
        Left = 3
        Top = 187
        Width = 776
        Height = 21
        HelpContext = 1
        DataField = 'FORN_ENDERECO'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 9
      end
      object edtBairro: TDBEdit
        Left = 107
        Top = 225
        Width = 672
        Height = 21
        HelpContext = 1
        DataField = 'FORN_BAIRRO'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 11
      end
      object edtCod_Praca: TDBEdit
        Left = 3
        Top = 266
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'FORN_GENE_ID_PRACA'
        DataSource = dmFornecedores.dsFornecedores
        ImeName = 'btnPesq_Praca;SpeedButton1'
        TabOrder = 12
        OnExit = edtCod_PracaExit
        OnKeyPress = edtCod_PracaKeyPress
      end
      object DBEdit10: TDBEdit
        Left = 180
        Top = 266
        Width = 493
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CIDADE'
        DataSource = dmFornecedores.dsFornecedores
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit11: TDBEdit
        Left = 679
        Top = 266
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'UF'
        DataSource = dmFornecedores.dsFornecedores
        ReadOnly = True
        TabOrder = 14
      end
      object edtTelefone: TDBEdit
        Left = 3
        Top = 305
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'FORN_TELEFONE'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 15
        OnExit = edtTelefoneExit
      end
      object DBEdit16: TDBEdit
        Left = 109
        Top = 305
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'FORN_FAX'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 16
        OnExit = edtTelefoneExit
      end
      object rdTipo: TDBRadioGroup
        Left = 630
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Tipo'
        Columns = 2
        DataField = 'FORN_TIPO'
        DataSource = dmFornecedores.dsFornecedores
        Items.Strings = (
          'F'#237'sico'
          'J'#250'ridico')
        TabOrder = 3
        Values.Strings = (
          'F'
          'J')
        OnClick = rdTipoClick
      end
      object DBEdit17: TDBEdit
        Tag = 1
        Left = 3
        Top = 344
        Width = 385
        Height = 21
        CharCase = ecLowerCase
        DataField = 'FORN_SITE'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 17
      end
      object DBEdit18: TDBEdit
        Tag = 1
        Left = 395
        Top = 344
        Width = 385
        Height = 21
        HelpContext = 1
        CharCase = ecLowerCase
        DataField = 'FORN_EMAIL'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 18
      end
      object edtCNPJ: TDBEdit
        Left = 3
        Top = 66
        Width = 203
        Height = 21
        HelpContext = 1
        DataField = 'FORN_CNPJ_CPF'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 4
        OnEnter = edtCNPJEnter
        OnExit = edtCNPJExit
      end
      object edtIncricao: TDBEdit
        Left = 212
        Top = 66
        Width = 200
        Height = 21
        HelpContext = 1
        DataField = 'FORN_IE'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 5
      end
      object DBEdit12: TDBEdit
        Left = 417
        Top = 66
        Width = 362
        Height = 21
        DataField = 'FORN_CONTATO'
        DataSource = dmFornecedores.dsFornecedores
        TabOrder = 6
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
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
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
        ParentFont = False
        OnClick = btnImportarClick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 185
        Align = alTop
        Caption = 'Observa'#231#245'es'
        TabOrder = 0
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 782
          Height = 168
          Align = alClient
          DataField = 'FORN_OBS'
          DataSource = dmFornecedores.dsFornecedores
          TabOrder = 0
        end
      end
    end
  end
end
