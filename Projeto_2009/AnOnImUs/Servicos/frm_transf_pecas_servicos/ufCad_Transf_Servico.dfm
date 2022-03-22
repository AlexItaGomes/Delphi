inherited fCad_Transf_Servicos: TfCad_Transf_Servicos
  Caption = 'Transferencia de Pe'#231'as/Servi'#231'os'
  Constraints.MinHeight = 590
  Constraints.MinWidth = 690
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ActivePage = TabSheet1
    ParentFont = False
    OnChange = pageCadastroChange
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 5
        Top = 10
        Width = 63
        Height = 13
        Caption = 'Nr'#186' Registro'
        FocusControl = DBEdit1
      end
      object Label9: TLabel
        Left = 109
        Top = 10
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 25
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'OSTF_ID'
        DataSource = dmTranf_Servicos.dsTransf
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 109
        Top = 25
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OSTF_DTA_CADASTRO'
        DataSource = dmTranf_Servicos.dsTransf
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 52
        Width = 779
        Height = 229
        Caption = 'Dados da Ordem de Servi'#231'o de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label2: TLabel
          Left = 8
          Top = 17
          Width = 42
          Height = 13
          Caption = 'O.S. (F5)'
          FocusControl = edtCodOS
          OnClick = Label2Click
          OnMouseMove = Label2MouseMove
          OnMouseLeave = Label2MouseLeave
        end
        object btnPesqOS: TSpeedButton
          Left = 112
          Top = 32
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
          OnClick = btnPesqOSClick
        end
        object Label3: TLabel
          Left = 186
          Top = 17
          Width = 49
          Height = 13
          Caption = 'C'#243'd. Clie.'
          FocusControl = DBEdit3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label2Click
          OnMouseMove = Label2MouseMove
          OnMouseLeave = Label2MouseLeave
        end
        object Label4: TLabel
          Left = 289
          Top = 17
          Width = 99
          Height = 13
          Caption = 'Cliente/Fornecedor'
          FocusControl = DBEdit4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label2Click
          OnMouseMove = Label2MouseMove
          OnMouseLeave = Label2MouseLeave
        end
        object Label5: TLabel
          Left = 675
          Top = 17
          Width = 70
          Height = 13
          Caption = 'Dt. Instala'#231#227'o'
        end
        object Label6: TLabel
          Left = 8
          Top = 58
          Width = 48
          Height = 13
          Caption = 'T'#233'c. Orig.'
          FocusControl = DBEdit5
        end
        object Label10: TLabel
          Left = 112
          Top = 58
          Width = 79
          Height = 13
          Caption = 'T'#233'cnico Origem'
          FocusControl = DBEdit6
        end
        object Label12: TLabel
          Left = 8
          Top = 100
          Width = 60
          Height = 13
          Caption = 'C'#243'd. Equip.'
          FocusControl = DBEdit9
        end
        object Label13: TLabel
          Left = 8
          Top = 182
          Width = 69
          Height = 13
          Caption = 'Vlr. Total O.S.'
          FocusControl = DBEdit10
        end
        object Label14: TLabel
          Left = 164
          Top = 182
          Width = 69
          Height = 13
          Caption = 'Vlr. Desconto'
          FocusControl = DBEdit11
        end
        object Label15: TLabel
          Left = 320
          Top = 182
          Width = 46
          Height = 13
          Caption = 'Vlr. Pago'
          FocusControl = DBEdit12
        end
        object Label17: TLabel
          Left = 112
          Top = 100
          Width = 69
          Height = 13
          Caption = 'Equipamento'
          FocusControl = DBEdit14
        end
        object Label18: TLabel
          Left = 675
          Top = 100
          Width = 28
          Height = 13
          Caption = 'Unid.'
          FocusControl = DBEdit15
        end
        object Label19: TLabel
          Left = 8
          Top = 139
          Width = 31
          Height = 13
          Caption = 'Marca'
          FocusControl = DBEdit16
        end
        object Label20: TLabel
          Left = 390
          Top = 139
          Width = 40
          Height = 13
          Caption = 'Modelo'
          FocusControl = DBEdit17
        end
        object SpeedButton4: TSpeedButton
          Left = 148
          Top = 32
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
          OnClick = SpeedButton4Click
        end
        object edtCodOS: TDBEdit
          Left = 8
          Top = 33
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'OSTF_ORDS_ID'
          DataSource = dmTranf_Servicos.dsTransf
          ImeName = 'btnPesqOS;SpeedButton4'
          TabOrder = 0
          OnExit = edtCodOSExit
          OnKeyPress = edtCodOSKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 186
          Top = 33
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'OSTF_ORDS_CLIE_ID'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 289
          Top = 33
          Width = 383
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 2
        end
        object DBDateEdit2: TDBDateEdit
          Left = 675
          Top = 33
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          DataField = 'ORDS_DTA_INSTALACAO'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          Color = clGradientInactiveCaption
          NumGlyphs = 2
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 74
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'OSTF_USER_ID_TEC_ORIG'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 112
          Top = 74
          Width = 663
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'USER_NOME_COMPLETO_ORIG'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 8
          Top = 116
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_PROD_ID_EQUIP'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 8
          Top = 198
          Width = 150
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_VLR_TOTAL_OS'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit11: TDBEdit
          Left = 164
          Top = 198
          Width = 150
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_VLR_DESCONTO'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit12: TDBEdit
          Left = 320
          Top = 198
          Width = 150
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ORDS_VLR_PAGO'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit14: TDBEdit
          Left = 112
          Top = 116
          Width = 559
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_DESCRICAO'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit15: TDBEdit
          Left = 675
          Top = 116
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_UNIDADE'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit16: TDBEdit
          Left = 8
          Top = 155
          Width = 378
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MARCA_PROD'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit17: TDBEdit
          Left = 390
          Top = 155
          Width = 385
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MODELO_PROD'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 10
        end
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 287
        Width = 779
        Height = 60
        Caption = 'Dados do T'#233'cnico de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label7: TLabel
          Left = 8
          Top = 16
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodTec
          OnClick = Label7Click
          OnMouseMove = Label2MouseMove
          OnMouseLeave = Label2MouseLeave
        end
        object Label8: TLabel
          Left = 185
          Top = 16
          Width = 81
          Height = 13
          Caption = 'T'#233'cnico Destino'
          FocusControl = DBEdit8
          OnClick = Label7Click
          OnMouseMove = Label2MouseMove
          OnMouseLeave = Label2MouseLeave
        end
        object btnPesqTec: TSpeedButton
          Left = 112
          Top = 32
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
          OnClick = btnPesqTecClick
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
        object edtCodTec: TDBEdit
          Left = 8
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'OSTF_USER_ID_TEC_DEST'
          DataSource = dmTranf_Servicos.dsTransf
          ImeName = 'btnPesqTec;SpeedButton3'
          TabOrder = 0
          OnExit = edtCodTecExit
          OnKeyPress = edtCodOSKeyPress
        end
        object DBEdit8: TDBEdit
          Left = 185
          Top = 32
          Width = 590
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'USER_NOME_COMPLETO_DEST'
          DataSource = dmTranf_Servicos.dsTransf
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Produtos/Servi'#231'os'
      ImageIndex = 1
      OnShow = TabSheet1Show
      object GroupBox3: TGroupBox
        Left = 0
        Top = 318
        Width = 786
        Height = 171
        Align = alBottom
        Caption = 'Transferencia'
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 154
          TabStop = False
          Align = alClient
          DataSource = dmTranf_Servicos.dsItensTransf
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
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
          OnDrawColumnCell = DBGrid2DrawColumnCell
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 178
        Align = alTop
        Caption = 'Produtos/Servi'#231'o da Ordem de Servi'#231'o'
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 161
          TabStop = False
          Align = alClient
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
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
          OnCellClick = DBGrid1CellClick
          OnDrawColumnCell = DBGrid1DrawColumnCell
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 178
        Width = 786
        Height = 140
        Align = alClient
        Caption = 'Dados do Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label11: TLabel
          Left = 8
          Top = 16
          Width = 55
          Height = 13
          Caption = 'C'#243'd. Prod.'
          FocusControl = DBEdit2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 112
          Top = 16
          Width = 85
          Height = 13
          Caption = 'Produto/Servi'#231'o'
          FocusControl = DBEdit7
        end
        object Label21: TLabel
          Left = 369
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Unid.'
          FocusControl = DBEdit13
        end
        object Label22: TLabel
          Left = 523
          Top = 16
          Width = 44
          Height = 13
          Caption = 'Vlr. Unit.'
          FocusControl = DBEdit18
        end
        object Label23: TLabel
          Left = 652
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Qtde'
          FocusControl = DBEdit19
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 729
          Top = 16
          Width = 44
          Height = 13
          Caption = 'Vlr. Total'
          FocusControl = DBEdit20
        end
        object Label25: TLabel
          Left = 8
          Top = 56
          Width = 32
          Height = 13
          Caption = 'Marca'
          FocusControl = DBEdit21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 189
          Top = 56
          Width = 41
          Height = 13
          Caption = 'Modelo'
          FocusControl = DBEdit22
        end
        object Label27: TLabel
          Left = 385
          Top = 56
          Width = 76
          Height = 13
          Caption = 'Tipo Comiss'#227'o'
          FocusControl = DBEdit23
        end
        object Label28: TLabel
          Left = 491
          Top = 56
          Width = 72
          Height = 13
          Caption = 'Venda Interna'
          FocusControl = DBEdit24
        end
        object Label29: TLabel
          Left = 603
          Top = 56
          Width = 74
          Height = 13
          Caption = 'Venda Externa'
          FocusControl = DBEdit25
        end
        object Label30: TLabel
          Left = 703
          Top = 56
          Width = 69
          Height = 13
          Caption = 'Venda Balc'#227'o'
          FocusControl = DBEdit26
        end
        object Label31: TLabel
          Left = 41
          Top = 96
          Width = 72
          Height = 13
          Caption = 'Venda Interna'
        end
        object Label32: TLabel
          Left = 159
          Top = 96
          Width = 74
          Height = 13
          Caption = 'Venda Externa'
        end
        object Label33: TLabel
          Left = 286
          Top = 96
          Width = 69
          Height = 13
          Caption = 'Venda Balc'#227'o'
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ODIT_TPIT_PROD_ID'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 112
          Top = 32
          Width = 253
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_DESCRICAO'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit13: TDBEdit
          Left = 369
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_UNIDADE'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit18: TDBEdit
          Left = 473
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ODIT_VLR_UNITARIO'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit19: TDBEdit
          Left = 577
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ODIT_QTDE'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit20: TDBEdit
          Left = 681
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'ODIT_VLR_TOTAL'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit21: TDBEdit
          Left = 8
          Top = 72
          Width = 175
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MARCA_PROD'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit22: TDBEdit
          Left = 189
          Top = 72
          Width = 175
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'MODELO_PROD'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit23: TDBEdit
          Left = 369
          Top = 72
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'TIPO_COMISSAO'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit24: TDBEdit
          Left = 473
          Top = 72
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_COMISSAO_VEND_INTERNA'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit25: TDBEdit
          Left = 577
          Top = 72
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_COMISSAO_VEND_EXTERNO'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit26: TDBEdit
          Left = 681
          Top = 72
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PROD_COMISSAO_VEND_BALCAO'
          DataSource = dmTranf_Servicos.dsOrdemServicoItens
          ReadOnly = True
          TabOrder = 11
        end
        object btnAdic: TBitBtn
          Left = 369
          Top = 109
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
          TabOrder = 15
          OnClick = btnAdicClick
        end
        object btnRet: TBitBtn
          Left = 473
          Top = 109
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
          TabOrder = 16
          OnClick = btnRetClick
        end
        object edtComissaoInterna: TRxDBCalcEdit
          Left = 8
          Top = 113
          Width = 115
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'OSTI_COMISSAO_VENDA_INTERNA'
          DataSource = dmTranf_Servicos.dsItensTransf
          DisplayFormat = '###,###,##0.0000'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 12
        end
        object edtComissaoExterna: TRxDBCalcEdit
          Left = 128
          Top = 113
          Width = 115
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'OSTI_COMISSAO_VENDA_EXTERNA'
          DataSource = dmTranf_Servicos.dsItensTransf
          DisplayFormat = '###,###,##0.0000'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 13
        end
        object edtComissaoBalcao: TRxDBCalcEdit
          Left = 249
          Top = 113
          Width = 115
          Height = 21
          HelpContext = 1
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'OSTI_COMISSAO_VENDA_BALCAO'
          DataSource = dmTranf_Servicos.dsItensTransf
          DisplayFormat = '###,###,##0.0000'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 14
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 380
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 531
    end
  end
  object ImageList1: TImageList
    Left = 664
    Top = 24
    Bitmap = {
      494C010102000400680010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFF1F100F1F3
      F300F4F5F500F6F7F700F8F9F900FAFBFB00FCFDFD00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000F1F3F300F3F5
      F500F6F7F700F8F9F900F9FAFA00FBFCFC00FDFDFD00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ECEFEF00EFF1
      F100F1F3F300F4F5F500F6F7F700F8F9F900FAFBFB00FCFDFD00FEFEFE00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000EFF1F100F1F3
      F300F3F5F500F6F7F700F8F9F900F9FAFA00FBFCFC00FDFDFD00FEFEFE00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9ECEC00ECEF
      EF00EFF1F100F1F3F300F4F5F500F6F7F700F8F9F900FAFBFB00FCFDFD00FEFE
      FE00FFFFFF000000000000000000000000000000000000000000ECEFEF00EFF1
      F100F1F3F300F3F5F50021A12100F8F9F900F9FAFA00FBFCFC00FDFDFD00FEFE
      FE00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5E8E800E9EC
      EC00ECEFEF00EFF1F100F1F3F300F4F5F500F6F7F700F8F9F900FAFBFB00FCFD
      FD00FEFEFE000000000000000000000000000000000000000000E9ECEC00ECEF
      EF00EFF1F10021A1210021A1210021A12100F8F9F900F9FAFA00FBFCFC00FDFD
      FD00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E500E5E8
      E800E9ECEC00ECEFEF00EFF1F100F1F3F300F4F5F500F6F7F700F8F9F900FAFB
      FB00FCFDFD000000000000000000000000000000000000000000E6EAEA00E9EC
      EC0021A1210021A1210021A1210021A1210021A12100F8F9F900F9FAFA00FBFC
      FC00FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEE2E200E2E5
      E500E5E8E800E9ECEC00ECEFEF00EFF1F100F1F3F300F4F5F500F6F7F700F8F9
      F900FAFBFB000000000000000000000000000000000000000000E3E7E700E6EA
      EA0021A1210021A12100EFF1F10021A1210021A1210021A12100F8F9F900F9FA
      FA00FBFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBE0E000DEE2
      E200E2E5E500E5E8E800E9ECEC00ECEFEF00EFF1F100F1F3F300F4F5F500F6F7
      F700F8F9F9000000000000000000000000000000000000000000E1E5E500E3E7
      E70021A12100E9ECEC00ECEFEF00EFF1F10021A1210021A1210021A12100F8F9
      F900F9FAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9DEDE00DBE0
      E000DEE2E200E2E5E500E5E8E800E9ECEC00ECEFEF00EFF1F100F1F3F300F4F5
      F500F6F7F7000000000000000000000000000000000000000000DFE3E300E1E5
      E500E3E7E700E6EAEA00E9ECEC00ECEFEF00EFF1F10021A1210021A12100F6F7
      F700F8F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D7DCDC00D9DE
      DE00DBE0E000DEE2E200E2E5E500E5E8E800E9ECEC00ECEFEF00EFF1F100F1F3
      F300F4F5F5000000000000000000000000000000000000000000DDE2E200DFE3
      E300E1E5E500E3E7E700E6EAEA00E9ECEC00ECEFEF00EFF1F10021A12100F3F5
      F500F6F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D7DCDC00D7DC
      DC00D9DEDE00DBE0E000DEE2E200E2E5E500E5E8E800E9ECEC00ECEFEF00EFF1
      F100F1F3F3000000000000000000000000000000000000000000DDE2E200DDE2
      E200DFE3E300E1E5E500E3E7E700E6EAEA00E9ECEC00ECEFEF00EFF1F100F1F3
      F300F3F5F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D7DCDC00D7DC
      DC00D7DCDC00D9DEDE00DBE0E000DEE2E200E2E5E500E5E8E800E9ECEC00ECEF
      EF00EFF1F1000000000000000000000000000000000000000000DDE2E200DDE2
      E200DDE2E200DFE3E300E1E5E500E3E7E700E6EAEA00E9ECEC00ECEFEF00EFF1
      F100F1F3F3000000000000000000000000000000000000000000000000000000
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
      FFFFFFFF00000000C007C00700000000C007C00700000000C007C00700000000
      C007C00700000000C007C00700000000C007C00700000000C007C00700000000
      C007C00700000000C007C00700000000C007C00700000000C007C00700000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
