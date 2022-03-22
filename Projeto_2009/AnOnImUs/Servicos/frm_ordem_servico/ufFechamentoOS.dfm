inherited fFechamentoOS: TfFechamentoOS
  Caption = 'Acerto Ordem de Servi'#231'o'
  OnClose = FormClose
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 520
    ParentFont = False
    ExplicitHeight = 520
    inherited tabCadastro: TTabSheet
      Caption = '&1.Formas de Pagamento'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 492
      object GroupBox1: TGroupBox
        Left = 0
        Top = 157
        Width = 786
        Height = 280
        Align = alBottom
        Caption = 'Pagamentos Realizados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 263
          TabStop = False
          Align = alClient
          DataSource = dmOrdemServico.dsAcertos_OS
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnEnter = DBGrid1Enter
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 173
        Align = alTop
        Caption = 'Lan'#231'amentos'
        TabOrder = 1
        object Label2: TLabel
          Left = 6
          Top = 16
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodDoc
        end
        object Label3: TLabel
          Left = 152
          Top = 16
          Width = 99
          Height = 13
          Caption = 'Tipo de Pagamento'
          FocusControl = edtTipo
        end
        object btnPesqDoc: TSpeedButton
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
          OnClick = btnPesqDocClick
        end
        object Label4: TLabel
          Left = 586
          Top = 16
          Width = 80
          Height = 13
          Caption = 'Vlr. Documento'
          FocusControl = edtTipo
        end
        object Label5: TLabel
          Left = 182
          Top = 57
          Width = 65
          Height = 13
          Caption = 'C'#243'd. Simplif.'
          FocusControl = edtCodigo
          OnClick = Label5Click
          OnMouseMove = Label5MouseMove
          OnMouseLeave = Label5MouseLeave
        end
        object Label6: TLabel
          Left = 286
          Top = 57
          Width = 32
          Height = 13
          Caption = 'Banco'
          FocusControl = edtBanco
          OnClick = Label5Click
          OnMouseMove = Label5MouseMove
          OnMouseLeave = Label5MouseLeave
        end
        object Label7: TLabel
          Left = 6
          Top = 98
          Width = 43
          Height = 13
          Caption = 'Nr'#186' Doc.'
          FocusControl = edtNrDoc
        end
        object Label8: TLabel
          Left = 111
          Top = 98
          Width = 61
          Height = 13
          Caption = 'Nr'#186' Ag'#234'ncia'
          FocusControl = edtNrAgencia
        end
        object Label9: TLabel
          Left = 216
          Top = 98
          Width = 51
          Height = 13
          Caption = 'Nr'#186' Conta'
          FocusControl = edtNrConta
        end
        object Label10: TLabel
          Left = 321
          Top = 98
          Width = 32
          Height = 13
          Caption = 'T'#237'tular'
          FocusControl = edtTitula
        end
        object Label11: TLabel
          Left = 680
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Dt. Vecto'
        end
        object Label12: TLabel
          Left = 6
          Top = 57
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodBanco
          OnClick = Label5Click
          OnMouseMove = Label5MouseMove
          OnMouseLeave = Label5MouseLeave
        end
        object btnPesqBco: TSpeedButton
          Left = 110
          Top = 72
          Width = 32
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
          OnClick = btnPesqBcoClick
        end
        object SpeedButton3: TSpeedButton
          Left = 144
          Top = 72
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
        object edtCodDoc: TDBEdit
          Left = 6
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_GENE_ID_TIPO_DOC'
          DataSource = dmOrdemServico.dsAcertos_OS
          ImeName = 'btnPesqDoc'
          TabOrder = 0
          OnExit = edtCodDocExit
          OnKeyPress = edtCodDocKeyPress
        end
        object edtTipo: TDBEdit
          Left = 148
          Top = 32
          Width = 420
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'TIPO_DOC'
          DataSource = dmOrdemServico.dsAcertos_OS
          ReadOnly = True
          TabOrder = 1
        end
        object edtVlrDoc: TRxDBCalcEdit
          Left = 575
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'ODAC_VLR_DOC'
          DataSource = dmOrdemServico.dsAcertos_OS
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
        object btnAdic: TBitBtn
          Left = 579
          Top = 142
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
          TabOrder = 11
          OnClick = btnAdicClick
        end
        object btnRet: TBitBtn
          Left = 680
          Top = 142
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
          TabOrder = 12
          TabStop = False
          OnClick = btnRetClick
        end
        object edtCodigo: TDBEdit
          Left = 182
          Top = 73
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'COD_BANCO'
          DataSource = dmOrdemServico.dsAcertos_OS
          ImeName = 'btnPesqBco'
          ReadOnly = True
          TabOrder = 5
        end
        object edtBanco: TDBEdit
          Left = 286
          Top = 73
          Width = 494
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'BANCO'
          DataSource = dmOrdemServico.dsAcertos_OS
          ImeName = 'btnPesqBco'
          ReadOnly = True
          TabOrder = 6
        end
        object edtNrDoc: TDBEdit
          Left = 6
          Top = 113
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_NR_DOC'
          DataSource = dmOrdemServico.dsAcertos_OS
          TabOrder = 7
          OnEnter = edtCodBancoEnter
        end
        object edtNrAgencia: TDBEdit
          Left = 111
          Top = 113
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_NR_AGENCIA'
          DataSource = dmOrdemServico.dsAcertos_OS
          TabOrder = 8
          OnEnter = edtCodBancoEnter
        end
        object edtNrConta: TDBEdit
          Left = 216
          Top = 113
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_NR_CONTA'
          DataSource = dmOrdemServico.dsAcertos_OS
          TabOrder = 9
          OnEnter = edtCodBancoEnter
        end
        object edtTitula: TDBEdit
          Left = 321
          Top = 113
          Width = 459
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_TITULAR'
          DataSource = dmOrdemServico.dsAcertos_OS
          TabOrder = 10
          OnEnter = edtCodBancoEnter
        end
        object edtCodBanco: TDBEdit
          Left = 6
          Top = 73
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'ODAC_GENE_ID_BCO'
          DataSource = dmOrdemServico.dsAcertos_OS
          ImeName = 'btnPesqBco;SpeedButton3'
          TabOrder = 4
          OnEnter = edtCodBancoEnter
          OnExit = edtCodBancoExit
          OnKeyPress = edtCodDocKeyPress
        end
        object edtDt_Vecto: TDBDateEdit
          Left = 680
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'ODAC_DTA_VCTO'
          DataSource = dmOrdemServico.dsAcertos_OS
          NumGlyphs = 2
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 437
        Width = 786
        Height = 55
        Align = alBottom
        TabOrder = 2
        object Label1: TLabel
          Left = 76
          Top = 8
          Width = 69
          Height = 13
          Caption = 'Vlr. Total O.S.'
          FocusControl = DBEdit1
        end
        object Label13: TLabel
          Left = 237
          Top = 8
          Width = 69
          Height = 13
          Caption = 'Vlr. Desconto'
          FocusControl = DBEdit2
        end
        object Label14: TLabel
          Left = 419
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Vlr. Pago'
          FocusControl = DBEdit3
        end
        object Label15: TLabel
          Left = 580
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Vlr. Pagar'
          FocusControl = DBEdit4
        end
        object DBEdit1: TDBEdit
          Left = 7
          Top = 24
          Width = 150
          Height = 25
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_VLR_TOTAL_OS'
          DataSource = dmOrdemServico.dsOrdemServico
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 164
          Top = 24
          Width = 150
          Height = 25
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_VLR_DESCONTO'
          DataSource = dmOrdemServico.dsOrdemServico
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 321
          Top = 24
          Width = 150
          Height = 25
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'SOMA'
          DataSource = dmOrdemServico.dsAcertos_OS
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 479
          Top = 24
          Width = 150
          Height = 25
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'VALOR_PAGAR'
          DataSource = dmOrdemServico.dsOrdemServico
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 520
    Height = 52
    ParentFont = False
    ExplicitTop = 520
    ExplicitHeight = 52
    inherited btnHelp: TSpeedButton
      Height = 52
      ExplicitHeight = 36
    end
    inherited btnOK: TSpeedButton
      Height = 52
      ExplicitLeft = 366
      ExplicitHeight = 36
    end
    inherited btnCancelar: TSpeedButton
      Height = 52
      ExplicitLeft = 516
      ExplicitHeight = 36
    end
  end
end
