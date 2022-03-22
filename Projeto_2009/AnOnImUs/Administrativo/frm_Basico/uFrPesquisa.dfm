object frPesquisa: TfrPesquisa
  Left = 0
  Top = 0
  Width = 362
  Height = 180
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 70
    Top = 0
    Width = 292
    Height = 180
    Align = alClient
    Caption = 'Pesquisando Registro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 17
      Width = 59
      Height = 13
      Caption = 'C'#243'digo (F5)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 145
      Top = 17
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPesq: TSpeedButton
      Left = 107
      Top = 31
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
    object rdContenha: TRadioGroup
      Left = 2
      Top = 138
      Width = 288
      Height = 40
      Align = alBottom
      Caption = 'Omitir Registros acima?'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'N'#227'o')
      ParentFont = False
      TabOrder = 4
    end
    object edtCodigo: TEdit
      Left = 6
      Top = 32
      Width = 100
      Height = 21
      HelpContext = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'btnPesq'
      ParentFont = False
      TabOrder = 0
      OnExit = edtCodigoExit
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
    end
    object edtDescricao: TEdit
      Left = 143
      Top = 32
      Width = 223
      Height = 21
      TabStop = False
      Color = clGradientInactiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object lbRegistros: TListBox
      Left = 2
      Top = 56
      Width = 288
      Height = 82
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnKeyDown = lbRegistrosKeyDown
    end
    object btnAdicionar: TBitBtn
      Left = 341
      Top = 31
      Width = 35
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000E9E4DFB1744A
        983F009D490B9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
        0B983F00B17449EAE5E0AF70429132009B47089A46079A46079A46079A46079A
        46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
        9F4E129F4E129F4E129F4E129E4E129C4C0D9C4C0D9E4E129F4E129F4E129F4E
        129F4E129F4F119D4C0CA3571CA15216A25316A25316A25316A25317A05014A1
        5214A15214A05014A25317A25316A25316A25316A15215A4581FA96229A85F22
        A85F24A85F24A85F24A75E22A86024FBFAF8FBFAF8A86024A75E22A85F24A85F
        24A85F24A75F22AB642BAC682EAB6329AB632AAB6329AA6328AA6327A86023F3
        E8DFF3E8DFA86023AA6327AA6328AB6329AB632AAB6227AC6930B17238AF6F32
        AF6F33AE6C30AE6D33AC692DAD692DF1E7DDF1E7DDAD692DAC692DAE6D33AE6C
        30AF6F33AF6F32B17339B57740B27539AF7034B77B45F9F6F3F3E9E0EFE5DCFA
        F8F4FAF8F4EFE5DCF3E9E0F9F6F3B77B45AF7034B27439B4773FBA824AB97D47
        B67940BB864FFCF9F7F5EDE4F4EBE2FBF8F5FBF8F5F4EBE2F5EDE4FCF9F7BB86
        4FB67940B97D45BA824CBC8751BA834CBB834CB98149BB824CB98047B87F45F2
        EAE1F2EAE1B87F45B98047BB824CB98149BB834CBA834BBB8752C1915BBF8D56
        C08E56C08E57BF8D56BF8C55BE8A52F5EEE7F5EEE7BE8A52BF8C55BF8D56C08E
        57C08E56BF8D56C3915BC59660C3945CC3945DC3945DC3945CC3945CC3935DFB
        FAF7FBFAF7C3935DC3945CC3945CC3945DC3945DC3945CC59762C9A16DC99F69
        C99F6AC99F6AC99F6AC9A06AC99D66C99E6BC99E6BC99D66C9A06AC99F6AC99F
        6AC99F6AC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCA
        A16ACAA16ACCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCBA46DDABE98CEA870
        D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE
        7BD1AE7BCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
        B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEC}
      TabOrder = 2
      OnClick = btnAdicionarClick
    end
    object rdMovimento: TRadioGroup
      Left = 55
      Top = 80
      Width = 170
      Height = 45
      Caption = 'Tipo Movimento'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Cr'#233'dito'
        'D'#233'bito')
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object ckPlanoContas: TCheckBox
      Left = 197
      Top = 13
      Width = 111
      Height = 17
      TabStop = False
      Caption = 'Plano de Contas Principal '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
  end
  object rdOpcoes: TRadioGroup
    Left = 0
    Top = 0
    Width = 70
    Height = 180
    Align = alLeft
    Caption = 'Op'#231#245'es de Pesquisa'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Items.Strings = (
      '0 - Cliente'
      '1 - Fornecedores'
      '2 - Pra'#231'as'
      '3 - Tipo de Documento'
      '4 - Contas a Pagar'
      '5 - Contas a Receber'
      '6 - Plano de Contas'
      '7 - Plano de Contas Geral'
      '8 - Conta Bancaria'
      '9 - Tabela de Pre'#231'o'
      '10 - Equipamentos (O.S.)'
      '11 - Tecnico (O.S.)'
      '12 - Tipo Produto'
      '13 - Grupo Produto'
      '14 - Marca Produto'
      '15 - Modelo Produto'
      '16 - Produtos'
      '17 - Nota Fiscal'
      '18 - Saida Avulsa'
      '19 - Entrada Avulsa'
      '20 - Saida Avaria'
      '21 - Tipo O.S.'
      '22 - Usuario'
      '23 - Vendedor'
      '24 - Regi'#227'o'
      '25 - Rota'
      '26 - Grupo Cliente'
      '27 - Movimenta'#231#227'o Banc'#225'ria'
      '28 - Status Atendimento'
      '29 - Status OS'
      '30 - Bancos'
      '31 - Patrimonio'
      '32 - Tipo de Agendamento'
      '33 - Pedido/Or'#231'amento'
      '34 - Unidade de Medida'
      '35 - Filtros (O.S.)'
      '36 - Bandeira Cart'#227'o')
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
end
