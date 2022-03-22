inherited fCad_EntradaNotaFiscal: TfCad_EntradaNotaFiscal
  Caption = 'Entrada Nota Fiscal'
  ClientWidth = 806
  Constraints.MinHeight = 586
  ExplicitWidth = 812
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 806
    ParentFont = False
    OnChange = pageCadastroChange
    ExplicitWidth = 806
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 798
      ExplicitHeight = 489
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 798
        Height = 185
        Align = alTop
        Caption = 'Detinat'#225'rio/Remetente'
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 16
          Width = 63
          Height = 13
          Caption = 'Nr'#186' Registro'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 109
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Dt. Cadastro'
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 5
          Top = 59
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodFornec
          OnClick = Label3Click
        end
        object Label4: TLabel
          Left = 182
          Top = 59
          Width = 59
          Height = 13
          Caption = 'Fornecedor'
          FocusControl = DBEdit3
          OnClick = Label3Click
        end
        object btnPesqFornec: TSpeedButton
          Left = 108
          Top = 74
          Width = 35
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D4B0C009C480A009C480A009C480A009C480A009C480A009C48
            0A009C480A009C480A009D490B00983F0000B1744900EAE5E000AF7042009232
            000098430500882500009A4505009A4607009A4607009A4607009A4607009A46
            07009A4607009A4607009A4607009B47080091310000B3774E009D4C0E009E4D
            0F00A4571C00F6F0E800973F05009C4A0B009F4F13009F4E12009F4E12009F4E
            12009F4E12009F4E12009F4E12009F4E12009F4F11009D4C0C00A3571C00A153
            15009D4A0B00E6D5C600E7D3C200943B0000A2551800A2531600A2531600A253
            1600A2531600A2531600A2531600A2531600A1521500A4581F00A9622900A85F
            2200A85F24008A290000FFFFFF00EDE0D40097400000A8602500A85F2400A85F
            2400A85F2400A85F2400A85F2400A85F2400A75F2200AB642B00AC682E00AB63
            2900AB642A00A8602300B06E3800FFFFFF00BB865800A2521000AB652B00AB63
            2A00AB632A00AB632A00AB632A00AB632A00AB622700AC693000B1723800AF6F
            3200AF6F3300B0703400AA642400A9632500FFFFFF00C4966A00A75F1D00A964
            2300A9642500AD6C2E00B0713400AF6F3300AF6F3200B1733900B5774000B274
            3900B2753A00B2753A00B3763B00A7611F00D5B39400E7D5C200B2733C00DABD
            A200D3B19300AE6C2E00AC692B00B3753C00B2743900B4773F00BA824A00B87D
            4600B97D4700B97D4700B97D4700B9804900AD682500D9BDA100FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00C1905E00B5773D00B87D4500BA824C00BC875100BA83
            4C00BB834D00BB834D00BB844D00B9804800C2905D00FCF9F600FFFFFF00FFFF
            FF00FFFFFF00F4F7FA00F3E8DE00BA804700BA824A00BB875200C1915B00BF8D
            5600C08E5600C08E5600C08E5600BB874B00D7B79500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EDEEEF00FCF9F500C4956100BE8C5400C3915B00C5966000C394
            5C00C3945D00C3945D00C3955D00C18F5600D2AF8500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EAECEE00FBF7F200C5956000C3935B00C5976200C9A16D00C99F
            6900C99F6A00C99F6A00C99F6A00C99F6900C4975D00EBDBC800FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00D9BC9700C4985D00C99F6900CAA26D00CBA26D00CCA3
            6D00CCA36D00CCA36D00CCA36D00CCA36D00CBA16B00C89B6200E9DAC400F9F8
            F600F5EDE400E2CBAD00C4965B00CBA36D00CCA36D00CBA46D00DABE9800CEA8
            7000D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00CCA36800C79A
            5A00C79D5E00CDA66D00D1AF7C00D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58200D5B58200D5B58200D5B58200D5B58200D5B6
            8300D5B68300D5B58200D5B58200D4B27D00DBC19700F1EEEC00}
          OnClick = btnPesqFornecClick
        end
        object SpeedButton1: TSpeedButton
          Left = 144
          Top = 74
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D49
            0B983F00B17449EAE5E0AF70429132009B4809973E008C2C008E2E008D2E008E
            2E008E2E008E2E008E2E008C2C00973E009B4809913100B3774E9D4C0E9F4F12
            9B4808AF6E3CE1C9B6DFC5B2E0C6B3DDC1ACD7B79FDCC3ADE0C6B3E1C9B6AF6E
            3C9B48089F4F129D4C0CA3571CA253179B4705C4936CF9F4F1C79A76C79C78DA
            BDA6FFFFFFCEA889C18E65F9F6F2C4936C9B4705A25316A4581FA96229A85F23
            A15313C79B76E6D2C19943009B4602B97F4DFFFFFFFFFFFF984400E1C9B5C79B
            77A15313A85F22AB642BAC682EAB632AA5581AC99E78EAD9CAA45818A55A1CBF
            8C60FFFFFFFFFFFFF3E9E0F6F1EBC79971A5591AAB6328AC6930B17238AF7033
            A96524CCA580EBDBCCA86223AA6727C3946AFFFFFFF9F4F0FAF6F2FFFFFFC69B
            72AA6625AF6F33B17339B57740B27539AC6B2BCEA783EBDCCEAC672AB17338B3
            753EBB834FB87F4AB3763BEDE0D4CEA581AC6B2BB27539B4773FBA824AB97D47
            B37539D2AD8AEDDFD2B27335B97D47B87D45B77B42B77B43B17031EDDED0D2AD
            8AB37539B97D45BA824CBC8751BB834DB67B3FD3B18DEEE0D3B47A3DBB834DBB
            834DBB834DBB834DB47A3DEEE0D3D3B18DB67B3FBB834BBB8752C1915BC08E56
            BC864AD7B894EFE4D6BA8549C08E57C08E56C08E56C08E57BA8549EFE4D6D7B8
            94BC864ABF8E56C3915BC59660C3955DC08D51D9BB99EEE2D2BA8444C08D54C0
            8D53C08D53C08D54BA8444EEE2D2D9BB99C08D51C3945CC59762C9A16DC9A06A
            C4985EDDC19FFBF8F4DDC2A1E0C7A8E0C7A8E0C7A8E0C7A8DDC2A1FBF8F4DDC1
            9FC4985EC9A06ACAA26DCBA26DCCA36ECA9E67D5B58AF0E5D7F0E4D5F0E4D5F0
            E4D5F0E4D5F0E4D5F0E4D5F0E5D7D5B58ACA9E67CCA36ECBA46DDABE98CEA870
            D1AE7CCFAA74CAA065CAA166CAA166CAA166CAA166CAA166CAA166CAA065CFAA
            74D1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B583D5B583D5B583D5
            B583D5B583D5B583D5B583D5B583D5B582D4B27DDBC197F1EEEC}
          OnClick = SpeedButton1Click
        end
        object Label31: TLabel
          Left = 511
          Top = 59
          Width = 48
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = DBEdit14
          OnClick = Label3Click
        end
        object Label32: TLabel
          Left = 5
          Top = 99
          Width = 48
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit15
          OnClick = Label3Click
        end
        object Label33: TLabel
          Left = 329
          Top = 99
          Width = 31
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit16
          OnClick = Label3Click
        end
        object Label34: TLabel
          Left = 655
          Top = 99
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit17
          OnClick = Label3Click
        end
        object Label35: TLabel
          Left = 5
          Top = 139
          Width = 36
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit18
          OnClick = Label3Click
        end
        object Label36: TLabel
          Left = 594
          Top = 139
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit19
          OnClick = Label3Click
        end
        object Label37: TLabel
          Left = 655
          Top = 139
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit20
          OnClick = Label3Click
        end
        object Label38: TLabel
          Left = 655
          Top = 59
          Width = 70
          Height = 13
          Caption = 'Insc. Estadual'
          FocusControl = DBEdit21
          OnClick = Label3Click
        end
        object DBEdit1: TDBEdit
          Left = 5
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'NFEN_ID'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 0
        end
        object DBDateEdit1: TDBDateEdit
          Left = 109
          Top = 32
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          DataField = 'NFEN_DTA_CADASTRO'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          Color = clGradientInactiveCaption
          NumGlyphs = 2
          TabOrder = 1
        end
        object edtCodFornec: TDBEdit
          Left = 5
          Top = 75
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFEN_FORN_ID'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ImeName = 'btnPesqFornec;SpeedButton1'
          MaxLength = 10
          TabOrder = 2
          OnExit = edtCodFornecExit
          OnKeyPress = edtCodFornecKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 182
          Top = 75
          Width = 326
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_NOME_FANTASIA'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit14: TDBEdit
          Left = 511
          Top = 75
          Width = 138
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_CNPJ_CPF'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit15: TDBEdit
          Left = 5
          Top = 115
          Width = 320
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_ENDERECO'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit16: TDBEdit
          Left = 329
          Top = 115
          Width = 320
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_BAIRRO'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit17: TDBEdit
          Left = 655
          Top = 115
          Width = 138
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_CEP'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit18: TDBEdit
          Left = 5
          Top = 155
          Width = 583
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_DESCR'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit19: TDBEdit
          Left = 594
          Top = 155
          Width = 55
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_PAR1'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit20: TDBEdit
          Left = 655
          Top = 155
          Width = 138
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_TELEFONE'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit21: TDBEdit
          Left = 655
          Top = 75
          Width = 138
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'FORN_IE'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 5
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 185
        Width = 798
        Height = 62
        Align = alTop
        Caption = 'Dados da Nota'
        TabOrder = 1
        object Label5: TLabel
          Left = 4
          Top = 15
          Width = 45
          Height = 13
          Caption = 'Nr'#186' Nota'
          FocusControl = edtNrNota
        end
        object Label6: TLabel
          Left = 325
          Top = 15
          Width = 59
          Height = 13
          Caption = 'Dt. Emiss'#227'o'
        end
        object Label7: TLabel
          Left = 430
          Top = 15
          Width = 58
          Height = 13
          Caption = 'Dt. Entrada'
        end
        object Label8: TLabel
          Left = 220
          Top = 15
          Width = 45
          Height = 13
          Caption = 'Nr'#186' S'#233'rie'
          FocusControl = edtNrSerie
        end
        object Label47: TLabel
          Left = 112
          Top = 15
          Width = 40
          Height = 13
          Caption = 'Modelo'
        end
        object edtNrNota: TDBEdit
          Left = 4
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFEN_NR_NOTA'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          MaxLength = 10
          TabOrder = 0
        end
        object edtNrSerie: TDBEdit
          Left = 219
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFEN_NR_SERIE'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          MaxLength = 10
          TabOrder = 2
        end
        object edtDtEmissao: TDBDateEdit
          Left = 325
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_DTA_EMISSAO'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          NumGlyphs = 2
          TabOrder = 3
        end
        object edtDtEntrada: TDBDateEdit
          Left = 430
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_DTA_ENTRADA'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          NumGlyphs = 2
          TabOrder = 4
        end
        object edtModeloNF: TDBEdit
          Left = 112
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFEN_MODELO_NF'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          MaxLength = 10
          TabOrder = 1
        end
      end
      object GroupBox9: TGroupBox
        Left = 0
        Top = 247
        Width = 798
        Height = 129
        Align = alTop
        Caption = 'C'#225'lculo de Impostos'
        TabOrder = 2
        object Label9: TLabel
          Left = 4
          Top = 28
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base de Calc. ICMS'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 164
          Top = 28
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor do ICMS'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 323
          Top = 28
          Width = 152
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base de Calc. Substitui'#231#227'o'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 482
          Top = 28
          Width = 137
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor ICMS Substitui'#231#227'o'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 641
          Top = 28
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total dos Produtos'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 5
          Top = 83
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor do Frete'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 137
          Top = 83
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor do Seguro'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 268
          Top = 83
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desconto'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 400
          Top = 83
          Width = 97
          Height = 13
          Alignment = taRightJustify
          Caption = 'Outras Despesas'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 533
          Top = 83
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor do IPI'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 666
          Top = 83
          Width = 108
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total da Nota'
          FocusControl = edtNrNota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 4
          Top = 45
          Width = 155
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_BASE_CALC_ICMS'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 0
        end
        object RxDBCalcEdit2: TRxDBCalcEdit
          Left = 323
          Top = 45
          Width = 155
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_BASE_CALC_ICMS_SUBST'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
        object edtVlrNota: TRxDBCalcEdit
          Left = 664
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_TOTAL_NOTA'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 10
        end
        object RxDBCalcEdit4: TRxDBCalcEdit
          Left = 532
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_IPI'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 9
        end
        object edtVlrProd: TRxDBCalcEdit
          Left = 639
          Top = 45
          Width = 155
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_TOTAL_PROD'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 4
        end
        object RxDBCalcEdit6: TRxDBCalcEdit
          Left = 481
          Top = 45
          Width = 155
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_ICMS_SUBST'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 3
        end
        object edtVlrDesc: TRxDBCalcEdit
          Left = 268
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_TOTAL_DESC'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 7
        end
        object RxDBCalcEdit8: TRxDBCalcEdit
          Left = 400
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_OUTRAS_DESPESAS'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 8
        end
        object RxDBCalcEdit9: TRxDBCalcEdit
          Left = 4
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_FRETE'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 5
        end
        object RxDBCalcEdit10: TRxDBCalcEdit
          Left = 136
          Top = 99
          Width = 130
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_SEGURO'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 6
        end
        object RxDBCalcEdit11: TRxDBCalcEdit
          Left = 163
          Top = 45
          Width = 155
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFEN_VLR_ICMS'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Itens da Nota Fiscal'
      ImageIndex = 1
      OnShow = TabSheet1Show
      object GroupBox1: TGroupBox
        Left = 0
        Top = 101
        Width = 798
        Height = 328
        Align = alClient
        Caption = 'Itens da Nota Fiscal'
        TabOrder = 0
        object grdItens: TDBGrid
          Left = 2
          Top = 15
          Width = 794
          Height = 311
          TabStop = False
          Align = alClient
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = grdItensDrawColumnCell
          OnEnter = grdItensEnter
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 429
        Width = 798
        Height = 60
        Align = alBottom
        Caption = 'Totalizadores'
        TabOrder = 1
        object Label11: TLabel
          Left = 706
          Top = 15
          Width = 74
          Height = 13
          Caption = 'Total dos Itens'
        end
        object Label17: TLabel
          Left = 21
          Top = 15
          Width = 74
          Height = 13
          Caption = 'Vlr. Total Prod.'
          FocusControl = DBEdit9
        end
        object DBEdit9: TDBEdit
          Left = 7
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'NFEN_VLR_TOTAL_PROD'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 691
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'TOTAL_ITENS'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 798
        Height = 101
        Align = alTop
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label12: TLabel
          Left = 8
          Top = 16
          Width = 61
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodProd
          OnClick = Label12Click
        end
        object btnPesqProd: TSpeedButton
          Left = 111
          Top = 31
          Width = 35
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D4B0C009C480A009C480A009C480A009C480A009C480A009C48
            0A009C480A009C480A009D490B00983F0000B1744900EAE5E000AF7042009232
            000098430500882500009A4505009A4607009A4607009A4607009A4607009A46
            07009A4607009A4607009A4607009B47080091310000B3774E009D4C0E009E4D
            0F00A4571C00F6F0E800973F05009C4A0B009F4F13009F4E12009F4E12009F4E
            12009F4E12009F4E12009F4E12009F4E12009F4F11009D4C0C00A3571C00A153
            15009D4A0B00E6D5C600E7D3C200943B0000A2551800A2531600A2531600A253
            1600A2531600A2531600A2531600A2531600A1521500A4581F00A9622900A85F
            2200A85F24008A290000FFFFFF00EDE0D40097400000A8602500A85F2400A85F
            2400A85F2400A85F2400A85F2400A85F2400A75F2200AB642B00AC682E00AB63
            2900AB642A00A8602300B06E3800FFFFFF00BB865800A2521000AB652B00AB63
            2A00AB632A00AB632A00AB632A00AB632A00AB622700AC693000B1723800AF6F
            3200AF6F3300B0703400AA642400A9632500FFFFFF00C4966A00A75F1D00A964
            2300A9642500AD6C2E00B0713400AF6F3300AF6F3200B1733900B5774000B274
            3900B2753A00B2753A00B3763B00A7611F00D5B39400E7D5C200B2733C00DABD
            A200D3B19300AE6C2E00AC692B00B3753C00B2743900B4773F00BA824A00B87D
            4600B97D4700B97D4700B97D4700B9804900AD682500D9BDA100FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00C1905E00B5773D00B87D4500BA824C00BC875100BA83
            4C00BB834D00BB834D00BB844D00B9804800C2905D00FCF9F600FFFFFF00FFFF
            FF00FFFFFF00F4F7FA00F3E8DE00BA804700BA824A00BB875200C1915B00BF8D
            5600C08E5600C08E5600C08E5600BB874B00D7B79500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EDEEEF00FCF9F500C4956100BE8C5400C3915B00C5966000C394
            5C00C3945D00C3945D00C3955D00C18F5600D2AF8500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EAECEE00FBF7F200C5956000C3935B00C5976200C9A16D00C99F
            6900C99F6A00C99F6A00C99F6A00C99F6900C4975D00EBDBC800FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00D9BC9700C4985D00C99F6900CAA26D00CBA26D00CCA3
            6D00CCA36D00CCA36D00CCA36D00CCA36D00CBA16B00C89B6200E9DAC400F9F8
            F600F5EDE400E2CBAD00C4965B00CBA36D00CCA36D00CBA46D00DABE9800CEA8
            7000D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00CCA36800C79A
            5A00C79D5E00CDA66D00D1AF7C00D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58200D5B58200D5B58200D5B58200D5B58200D5B6
            8300D5B68300D5B58200D5B58200D4B27D00DBC19700F1EEEC00}
          OnClick = btnPesqProdClick
        end
        object Label13: TLabel
          Left = 183
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Produto'
          FocusControl = DBEdit4
          OnClick = Label12Click
        end
        object Label14: TLabel
          Left = 513
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Unid.'
          FocusControl = DBEdit6
        end
        object Label15: TLabel
          Left = 593
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Qtde'
          FocusControl = edtQtde
        end
        object Label16: TLabel
          Left = 694
          Top = 16
          Width = 43
          Height = 13
          Caption = 'Vlr. Unit.'
          FocusControl = edtVlrUnit
        end
        object Label27: TLabel
          Left = 8
          Top = 56
          Width = 32
          Height = 13
          Caption = 'Grupo'
          FocusControl = DBEdit5
        end
        object Label28: TLabel
          Left = 204
          Top = 56
          Width = 31
          Height = 13
          Caption = 'Marca'
          FocusControl = DBEdit7
        end
        object Label29: TLabel
          Left = 399
          Top = 56
          Width = 40
          Height = 13
          Caption = 'Modelo'
          FocusControl = DBEdit12
        end
        object SpeedButton3: TSpeedButton
          Left = 147
          Top = 31
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D49
            0B983F00B17449EAE5E0AF70429132009B4809973E008C2C008E2E008D2E008E
            2E008E2E008E2E008E2E008C2C00973E009B4809913100B3774E9D4C0E9F4F12
            9B4808AF6E3CE1C9B6DFC5B2E0C6B3DDC1ACD7B79FDCC3ADE0C6B3E1C9B6AF6E
            3C9B48089F4F129D4C0CA3571CA253179B4705C4936CF9F4F1C79A76C79C78DA
            BDA6FFFFFFCEA889C18E65F9F6F2C4936C9B4705A25316A4581FA96229A85F23
            A15313C79B76E6D2C19943009B4602B97F4DFFFFFFFFFFFF984400E1C9B5C79B
            77A15313A85F22AB642BAC682EAB632AA5581AC99E78EAD9CAA45818A55A1CBF
            8C60FFFFFFFFFFFFF3E9E0F6F1EBC79971A5591AAB6328AC6930B17238AF7033
            A96524CCA580EBDBCCA86223AA6727C3946AFFFFFFF9F4F0FAF6F2FFFFFFC69B
            72AA6625AF6F33B17339B57740B27539AC6B2BCEA783EBDCCEAC672AB17338B3
            753EBB834FB87F4AB3763BEDE0D4CEA581AC6B2BB27539B4773FBA824AB97D47
            B37539D2AD8AEDDFD2B27335B97D47B87D45B77B42B77B43B17031EDDED0D2AD
            8AB37539B97D45BA824CBC8751BB834DB67B3FD3B18DEEE0D3B47A3DBB834DBB
            834DBB834DBB834DB47A3DEEE0D3D3B18DB67B3FBB834BBB8752C1915BC08E56
            BC864AD7B894EFE4D6BA8549C08E57C08E56C08E56C08E57BA8549EFE4D6D7B8
            94BC864ABF8E56C3915BC59660C3955DC08D51D9BB99EEE2D2BA8444C08D54C0
            8D53C08D53C08D54BA8444EEE2D2D9BB99C08D51C3945CC59762C9A16DC9A06A
            C4985EDDC19FFBF8F4DDC2A1E0C7A8E0C7A8E0C7A8E0C7A8DDC2A1FBF8F4DDC1
            9FC4985EC9A06ACAA26DCBA26DCCA36ECA9E67D5B58AF0E5D7F0E4D5F0E4D5F0
            E4D5F0E4D5F0E4D5F0E4D5F0E5D7D5B58ACA9E67CCA36ECBA46DDABE98CEA870
            D1AE7CCFAA74CAA065CAA166CAA166CAA166CAA166CAA166CAA166CAA065CFAA
            74D1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B583D5B583D5B583D5
            B583D5B583D5B583D5B583D5B583D5B582D4B27DDBC197F1EEEC}
          OnClick = SpeedButton3Click
        end
        object edtCodProd: TDBEdit
          Left = 8
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFIT_PROD_ID'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ImeName = 'btnPesqProd;SpeedButton3'
          MaxLength = 10
          TabOrder = 0
          OnExit = edtCodProdExit
          OnKeyPress = edtCodProdKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 183
          Top = 32
          Width = 325
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_DESCRICAO'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 514
          Top = 32
          Width = 75
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_UNIDADE'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 2
        end
        object edtQtde: TDBEdit
          Left = 593
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFIT_QTDE'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          MaxLength = 10
          TabOrder = 3
          OnKeyPress = edtQtdeKeyPress
        end
        object edtVlrUnit: TDBEdit
          Left = 695
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFIT_VLR_UNITARIO'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          MaxLength = 10
          TabOrder = 4
          OnKeyPress = edtVlrUnitKeyPress
        end
        object btnAdic: TBitBtn
          Left = 593
          Top = 68
          Width = 100
          Height = 25
          Caption = 'Adicionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
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
          ParentFont = False
          TabOrder = 5
          OnClick = btnAdicClick
          OnEnter = btnAdicEnter
        end
        object btnRet: TBitBtn
          Left = 694
          Top = 68
          Width = 100
          Height = 25
          Caption = 'Retirar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429132009B47089A46079A46079A46079A46079A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
            9F4E129F4E129F4E129F4E129E4E129F4E129F4E129F4E129F4E119E4E129F4E
            129F4E129F4F119D4C0CA3571CA15216A25316A25316A25316A15317A15317A1
            5418A25418A25218A25518A15417A25316A25316A15215A4581FA96229A85F22
            A85F24A85F24A85F24A75F23A86024A86025A85F24A85F24A85F24A85F24A85F
            24A85F24A75F22AB642BAC682EAB6329AB632AAB6329AA6328AA6428AA6328AA
            6328AA6328AA6328AA6428AA6328AB6329AB632AAB6227AC6930B17238AF6F32
            AF6F33AE6C30AF6D33AD6A2EAD6B30AD6B2FAD6B2FAD6B2FAD6B2FAF6D33AE6C
            30AF6F33AF6F32B17339B57740B27539AF7034B77B45FAF6F3F2E9E0F2E9E0F2
            E9E0F2E9E0F2E9E0F2E8E0FAF6F3B77B45AF7034B27439B4773FBA824AB97D47
            B67940BB864FFCF9F7F5EDE5F5EDE5F5EDE5F5EDE5F5EDE5F5EDE5FCF9F7BB86
            4FB67940B97D45BA824CBC8751BA834CBB834CB98149BB824CB98047B98048B9
            8048B98048B98047B98047BB824CB98149BB834CBA834BBB8752C1915BBF8D56
            C08E56C08E57BF8D56BF8D56BF8E56C08D56C08D56BF8E57BF8D55BF8D56C08E
            57C08E56BF8D56C3915BC59660C3945CC3945DC3945DC3945CC3945CC3945EC3
            945FC3945FC3945FC3955DC3945CC3945DC3945DC3945CC59762C9A16DC99F69
            C99F6AC99F6AC99F6AC99F6AC99F69C9A068C9A068C9A068C99E6AC9A06AC99F
            6AC99F6AC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCC
            A36DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCBA46DDABE98CEA870
            D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE
            7BD1AE7BCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEC}
          ParentFont = False
          TabOrder = 6
          TabStop = False
          OnClick = btnRetClick
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 72
          Width = 190
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GRUPO_PROD'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit7: TDBEdit
          Left = 204
          Top = 72
          Width = 190
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MARCA_PROD'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 399
          Top = 72
          Width = 190
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MODELO_PROD'
          DataSource = dmEntradaNotaFiscal.dsItensNotaFiscal
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Contas '#224' Pagar'
      ImageIndex = 2
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 798
        Height = 130
        Align = alTop
        Caption = 'Descri'#231#227'o do T'#237'tulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label21: TLabel
          Left = 6
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edtDescricao
        end
        object Label23: TLabel
          Left = 586
          Top = 57
          Width = 46
          Height = 13
          Caption = 'Dt. Vecto'
        end
        object Label24: TLabel
          Left = 693
          Top = 17
          Width = 64
          Height = 13
          Caption = 'Dt. Cadastro'
        end
        object Label25: TLabel
          Left = 6
          Top = 57
          Width = 61
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodDoc
        end
        object Label26: TLabel
          Left = 148
          Top = 57
          Width = 49
          Height = 13
          Caption = 'Tipo Doc.'
          FocusControl = DBEdit8
        end
        object btnPesqTipo: TSpeedButton
          Left = 108
          Top = 72
          Width = 35
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D4B0C009C480A009C480A009C480A009C480A009C480A009C48
            0A009C480A009C480A009D490B00983F0000B1744900EAE5E000AF7042009232
            000098430500882500009A4505009A4607009A4607009A4607009A4607009A46
            07009A4607009A4607009A4607009B47080091310000B3774E009D4C0E009E4D
            0F00A4571C00F6F0E800973F05009C4A0B009F4F13009F4E12009F4E12009F4E
            12009F4E12009F4E12009F4E12009F4E12009F4F11009D4C0C00A3571C00A153
            15009D4A0B00E6D5C600E7D3C200943B0000A2551800A2531600A2531600A253
            1600A2531600A2531600A2531600A2531600A1521500A4581F00A9622900A85F
            2200A85F24008A290000FFFFFF00EDE0D40097400000A8602500A85F2400A85F
            2400A85F2400A85F2400A85F2400A85F2400A75F2200AB642B00AC682E00AB63
            2900AB642A00A8602300B06E3800FFFFFF00BB865800A2521000AB652B00AB63
            2A00AB632A00AB632A00AB632A00AB632A00AB622700AC693000B1723800AF6F
            3200AF6F3300B0703400AA642400A9632500FFFFFF00C4966A00A75F1D00A964
            2300A9642500AD6C2E00B0713400AF6F3300AF6F3200B1733900B5774000B274
            3900B2753A00B2753A00B3763B00A7611F00D5B39400E7D5C200B2733C00DABD
            A200D3B19300AE6C2E00AC692B00B3753C00B2743900B4773F00BA824A00B87D
            4600B97D4700B97D4700B97D4700B9804900AD682500D9BDA100FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00C1905E00B5773D00B87D4500BA824C00BC875100BA83
            4C00BB834D00BB834D00BB844D00B9804800C2905D00FCF9F600FFFFFF00FFFF
            FF00FFFFFF00F4F7FA00F3E8DE00BA804700BA824A00BB875200C1915B00BF8D
            5600C08E5600C08E5600C08E5600BB874B00D7B79500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EDEEEF00FCF9F500C4956100BE8C5400C3915B00C5966000C394
            5C00C3945D00C3945D00C3955D00C18F5600D2AF8500FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00EAECEE00FBF7F200C5956000C3935B00C5976200C9A16D00C99F
            6900C99F6A00C99F6A00C99F6A00C99F6900C4975D00EBDBC800FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00D9BC9700C4985D00C99F6900CAA26D00CBA26D00CCA3
            6D00CCA36D00CCA36D00CCA36D00CCA36D00CBA16B00C89B6200E9DAC400F9F8
            F600F5EDE400E2CBAD00C4965B00CBA36D00CCA36D00CBA46D00DABE9800CEA8
            7000D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00CCA36800C79A
            5A00C79D5E00CDA66D00D1AF7C00D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58200D5B58200D5B58200D5B58200D5B58200D5B6
            8300D5B68300D5B58200D5B58200D4B27D00DBC19700F1EEEC00}
          OnClick = btnPesqTipoClick
        end
        object Label22: TLabel
          Left = 743
          Top = 57
          Width = 42
          Height = 13
          Caption = 'Vlr. Doc.'
        end
        object edtDescricao: TDBEdit
          Left = 7
          Top = 32
          Width = 679
          Height = 21
          HelpContext = 1
          DataField = 'NFAC_DESCRICAO'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          TabOrder = 0
        end
        object edtDtVcto: TDBDateEdit
          Left = 586
          Top = 73
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFAC_DTA_VCTO'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          Enabled = False
          NumGlyphs = 2
          TabOrder = 4
        end
        object DBDateEdit4: TDBDateEdit
          Left = 693
          Top = 32
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          DataField = 'NFAC_DTA_CADASTRO'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          ReadOnly = True
          Color = clGradientInactiveCaption
          NumGlyphs = 2
          TabOrder = 1
        end
        object edtCodDoc: TDBEdit
          Left = 6
          Top = 73
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'NFAC_GENE_ID_TP_DOC'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          ImeName = 'btnPesqTipo'
          MaxLength = 10
          TabOrder = 2
          OnExit = edtCodDocExit
          OnKeyPress = edtCodDocKeyPress
        end
        object DBEdit8: TDBEdit
          Left = 146
          Top = 73
          Width = 433
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'TIPO_DOC'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          ReadOnly = True
          TabOrder = 3
        end
        object edtVlrDoc: TRxDBCalcEdit
          Left = 693
          Top = 73
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'NFAC_VALOR_DOC'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          DisplayFormat = '###,###,##0.0000'
          Enabled = False
          ButtonWidth = 0
          MaxLength = 10
          NumGlyphs = 2
          TabOrder = 5
        end
        object btnAdicDoc: TBitBtn
          Left = 586
          Top = 98
          Width = 100
          Height = 25
          Caption = '+ Adicionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnAdicDocClick
          OnEnter = btnAdicDocEnter
        end
        object btnRetDoc: TBitBtn
          Left = 693
          Top = 98
          Width = 100
          Height = 25
          Caption = '- Retirar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          TabStop = False
          OnClick = btnRetDocClick
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 130
        Width = 798
        Height = 296
        Align = alClient
        Caption = 'T'#237'tulos Gerados'
        TabOrder = 1
        object grdTitulos: TDBGrid
          Left = 2
          Top = 15
          Width = 794
          Height = 279
          TabStop = False
          Align = alClient
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = [fsBold]
          OnCellClick = grdTitulosCellClick
          OnDrawColumnCell = grdTitulosDrawColumnCell
          OnEnter = grdTitulosEnter
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 426
        Width = 798
        Height = 63
        Align = alBottom
        Caption = 'Totalizador'
        TabOrder = 2
        object Label19: TLabel
          Left = 704
          Top = 15
          Width = 78
          Height = 13
          Caption = 'Total de T'#237'tulos'
        end
        object Label20: TLabel
          Left = 25
          Top = 15
          Width = 72
          Height = 13
          Caption = 'Vlr. Total Nota'
          FocusControl = DBEdit10
        end
        object DBEdit10: TDBEdit
          Left = 7
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'NFEN_VLR_TOTAL_NOTA'
          DataSource = dmEntradaNotaFiscal.dsEntradaNotaFiscal
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 691
          Top = 31
          Width = 100
          Height = 21
          HelpContext = 1
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'TOTAL_TITULO'
          DataSource = dmEntradaNotaFiscal.dsAcertosNotaFiscal
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited Panel1: TPanel
    Width = 806
    ExplicitWidth = 806
    inherited btnOK: TSpeedButton
      Left = 456
      ExplicitLeft = 361
    end
    inherited btnCancelar: TSpeedButton
      Left = 631
      ExplicitLeft = 511
    end
  end
end
