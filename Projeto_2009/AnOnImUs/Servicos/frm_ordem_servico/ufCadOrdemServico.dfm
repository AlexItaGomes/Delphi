inherited fCadOrdemServico: TfCadOrdemServico
  Caption = 'Cad. Ordem de Servi'#231'o'
  ClientHeight = 672
  ClientWidth = 994
  ExplicitWidth = 1000
  ExplicitHeight = 701
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 994
    Height = 617
    ExplicitWidth = 994
    ExplicitHeight = 617
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 986
      ExplicitHeight = 589
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 986
        Height = 86
        Align = alTop
        Caption = 'Pesquisando Cliente'
        TabOrder = 0
        object btnPesqClie: TSpeedButton
          Left = 109
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
          OnClick = btnPesqClieClick
        end
        object Label1: TLabel
          Left = 5
          Top = 17
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodClie
          OnClick = Label1Click
          OnMouseMove = Label1MouseMove
          OnMouseLeave = Label1MouseLeave
        end
        object Label2: TLabel
          Left = 182
          Top = 17
          Width = 99
          Height = 13
          Caption = 'Cliente/Fornecedor'
          OnClick = Label1Click
          OnMouseMove = Label1MouseMove
          OnMouseLeave = Label1MouseLeave
        end
        object btnInsertCliente: TSpeedButton
          Left = 145
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
          OnClick = btnInsertClienteClick
        end
        object edtCodClie: TEdit
          Left = 5
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          ImeName = 'btnPesqClie;btnInsertCliente'
          TabOrder = 0
          OnExit = edtCodClieExit
          OnKeyPress = edtCodClieKeyPress
        end
        object edtCliente: TEdit
          Left = 182
          Top = 32
          Width = 389
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          ReadOnly = True
          TabOrder = 1
        end
        object rdStatus: TRadioGroup
          Left = 576
          Top = 15
          Width = 408
          Height = 69
          Align = alRight
          Caption = 'Status'
          Columns = 2
          ItemIndex = 4
          Items.Strings = (
            'Agendado'
            'Realizado'
            'Rel./Pago'
            'Cancelado'
            'O.S. em Aberto'
            'Todos')
          TabOrder = 2
          OnClick = rdStatusClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 86
        Width = 986
        Height = 130
        Align = alTop
        Caption = 'Dados do Cliente/Fornecedor'
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 15
          Width = 49
          Height = 13
          Caption = 'C'#243'd. Clie.'
          FocusControl = DBEdit1
        end
        object Label4: TLabel
          Left = 8
          Top = 52
          Width = 64
          Height = 13
          Caption = 'Raz'#227'o Social'
          FocusControl = DBEdit2
        end
        object Label5: TLabel
          Left = 495
          Top = 52
          Width = 76
          Height = 13
          Caption = 'Nome Fantasia'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 8
          Top = 89
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 114
          Top = 87
          Width = 48
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit5
        end
        object Label8: TLabel
          Left = 387
          Top = 87
          Width = 31
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit6
        end
        object Label11: TLabel
          Left = 491
          Top = 15
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit9
        end
        object Label12: TLabel
          Left = 614
          Top = 15
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit10
        end
        object Label13: TLabel
          Left = 737
          Top = 15
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit11
        end
        object Label14: TLabel
          Left = 860
          Top = 15
          Width = 44
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit12
        end
        object Label15: TLabel
          Left = 122
          Top = 15
          Width = 64
          Height = 13
          Caption = 'Dt. Cadastro'
          FocusControl = DBEdit13
        end
        object Label16: TLabel
          Left = 663
          Top = 87
          Width = 27
          Height = 13
          Caption = 'Pra'#231'a'
          FocusControl = DBEdit14
        end
        object Label17: TLabel
          Left = 926
          Top = 87
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = DBEdit15
        end
        object Label9: TLabel
          Left = 245
          Top = 15
          Width = 48
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = DBEdit7
        end
        object Label10: TLabel
          Left = 368
          Top = 15
          Width = 63
          Height = 13
          Caption = 'RG/Insc. Est.'
          FocusControl = DBEdit8
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 29
          Width = 110
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_ID'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 66
          Width = 481
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 495
          Top = 66
          Width = 485
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_FANTASIA'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 101
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_CEP'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 114
          Top = 101
          Width = 270
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_ENDERECO'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 387
          Top = 101
          Width = 270
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_BAIRRO'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 491
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_TELEFONE1'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 614
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_TELEFONE2'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit11: TDBEdit
          Left = 737
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_TELEFONE3'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 860
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_TELEFONE4'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit13: TDBEdit
          Left = 122
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_DTA_CADASTRO'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 663
          Top = 101
          Width = 257
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_DESCR'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit15: TDBEdit
          Left = 926
          Top = 101
          Width = 54
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'GENE_PAR1'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit7: TDBEdit
          Left = 245
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_CNPJ_CPF'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit8: TDBEdit
          Left = 368
          Top = 29
          Width = 120
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CLIE_RG'
          DataSource = dmOrdemServico.dsClientes
          ReadOnly = True
          TabOrder = 14
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 216
        Width = 986
        Height = 373
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'Hist'#243'rico de O.S.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 978
            Height = 304
            Align = alClient
            Caption = 'Ordem(ns) de Servi'#231'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object grdOS: TDBGrid
              Left = 2
              Top = 15
              Width = 974
              Height = 287
              TabStop = False
              Align = alClient
              DataSource = dmOrdemServico.dsListaOS
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
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDrawColumnCell = grdOSDrawColumnCell
              OnDblClick = grdOSDblClick
              OnTitleClick = grdOSTitleClick
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 304
            Width = 978
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label18: TLabel
              Left = 882
              Top = 1
              Width = 77
              Height = 15
              Alignment = taRightJustify
              Caption = 'Total Receber'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 681
              Top = 1
              Width = 74
              Height = 15
              Alignment = taRightJustify
              Caption = 'Vlr. Desconto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 580
              Top = 1
              Width = 73
              Height = 15
              Alignment = taRightJustify
              Caption = 'Vlr. Total O.S.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 809
              Top = 1
              Width = 48
              Height = 15
              Alignment = taRightJustify
              Caption = 'Vlr. Pago'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 518
              Top = 1
              Width = 31
              Height = 15
              Alignment = taRightJustify
              Caption = 'Qtde.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtTotalReceb: TRxCalcEdit
              Left = 859
              Top = 18
              Width = 100
              Height = 23
              TabStop = False
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object EdtTotalDesc: TRxCalcEdit
              Left = 655
              Top = 18
              Width = 100
              Height = 23
              TabStop = False
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object EdtTotalOS: TRxCalcEdit
              Left = 553
              Top = 18
              Width = 100
              Height = 23
              TabStop = False
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object EdtTotalPago: TRxCalcEdit
              Left = 757
              Top = 18
              Width = 100
              Height = 23
              TabStop = False
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtQtde: TRxCalcEdit
              Left = 449
              Top = 18
              Width = 100
              Height = 23
              TabStop = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Cortes do Cliente (Geral)'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbGrupoEquip: TGroupBox
            Left = 0
            Top = 0
            Width = 978
            Height = 345
            Align = alClient
            Caption = 'Cortes do Cliente*'
            ParentBackground = False
            TabOrder = 0
            object grdEquip: TDBGrid
              Left = 2
              Top = 15
              Width = 974
              Height = 328
              TabStop = False
              Align = alClient
              DataSource = dmOrdemServico.dsListaEquip
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDrawColumnCell = grdEquipDrawColumnCell
              OnTitleClick = grdEquipTitleClick
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Pe'#231'as e Servi'#231'os (Por O.S.)'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbGrupoPecasServicos: TGroupBox
            Left = 0
            Top = 0
            Width = 978
            Height = 345
            Align = alClient
            Caption = 'Pe'#231'as e Servi'#231'os*'
            ParentBackground = False
            TabOrder = 0
            object grdProdutos: TDBGrid
              Left = 2
              Top = 15
              Width = 974
              Height = 328
              TabStop = False
              Align = alClient
              DataSource = dmOrdemServico.dsListaPecas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDrawColumnCell = grdProdutosDrawColumnCell
              OnTitleClick = grdProdutosTitleClick
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 617
    Width = 994
    ExplicitTop = 617
    ExplicitWidth = 994
    inherited btnHelp: TSpeedButton
      Left = 700
      Width = 0
      Enabled = False
      Visible = False
      ExplicitLeft = 700
      ExplicitWidth = 0
    end
    inherited btnOK: TSpeedButton
      Left = 819
      Width = 0
      Caption = 'Gerar NF-e'
      Enabled = False
      Glyph.Data = {
        AA040000424DAA04000000000000360000002800000013000000130000000100
        18000000000074040000C40E0000C40E00000000000000000000899B9FAEC3C9
        A9BDC2A9BDC2A9BDC2A9BDC2A9BDC2A9BEC2A9BFC3A6BDC4A1B7BCACC2C7A8BD
        C1A9BDC2A9BDC2A9BDC2A9BDC2AEC3C9899B9F000000AEC3C8DAF6FCD4EEF5D4
        EFF5D4EFF5D4EFF5D4EEF5D4EFF5D2F2FBCBD8D7BCB4A4CAEAF4D8F3F9D4EEF5
        D4EFF5D4EFF5D4EEF5DAF6FCAEC3C8000000A9BDC2D4EEF4CEE8EECEE8EECEE8
        EECEE8EECEE8EECFEDF6B9BBB3FDE5C9F7E8D0BEBEB4CBE8F2CEE8EECEE8EECE
        E8EECEE8EED4EEF4A9BDC2000000A9BEC3D5EFF5CFE9EECFE9EFCFE9EFCFE8EE
        D8EAF2D0EEF5C9EDF5C6CDC8EFE0CAF2E0C8C4D8DBD1ECF4CEE8EECFE9EECFE9
        EED5EFF5A9BEC3000000A5BCC2D0EDF4CAE6EDCAE6EDCAE7EFE2F2FC77DEE375
        CCD38BE2F896D0DCFCE1CAF2E3CDC9CEC7C6E7F3CFEDF5CDEAF1C9E6ECD0EDF4
        A5BCC2000000BAC6C9EBF9FDE4F2F5E5F3F7F5FAFC5EAD8E8FB499BACAAF83A1
        7F8B9B72D5C8B7F0DFD1F7E7CEDACFBFC8D1CBD2DEE0E9F6FBEBF9FCBAC6C900
        0000C1C1BCF3F3EDEBECE5F4F2F0BBC7A86BC5C1FFF5F4EAEBEAEED9C8EBE6D1
        90B082AAB392E6D4C7F4E5D0F5E6CEDFD1BCE6E7E2F3F4EEC1C1BC000000C0C0
        BDF0F3EDEAECE7F4F2F1A7BE9B94D9E4F5EFE8E6EDEBDFD3BEF9E9D2FFF0DEB6
        D2AB8EAA7DEAD3CBF1E6D1EDE0CAD9D9D2F3F5F1BFC0BC000000C0C1BDF0F3EE
        EAECE7F4F2F1A6BF9CA7DCDECCE2E2D5CDC1EBDDC6C3C1BDADAEB0A59A95CCD7
        BA86A675E8D5CAF4E8D1D5D1C3F4F7F4C0C0BC000000C0C0BDF0F2EDECEDE8F3
        F2F0C5D5C2B9D2BD88BFC6F6DEC5F3EDE3F4F4F5FFFDF2D8DADCB9AFA7C4D8B7
        9FB08BECDBCBD9D4C6F6F9F5BFC0BB000000BEC0BCFAFDF9DFE2DEE8EDEBECEA
        E97F9E6BEBD4C5E7DAC2FFFDF7B2B0AEA59B89B8B4ABB1AA9EFFF5E696B483CE
        C6B3E2D5C0E0E2DDC4C7C3000000C2C4C0E1DFD6D5CAB7E6DCC8DED3C7C1D4AD
        BDCAA9DACABAFCF6EAF9FBFDF0EFEBFFFFFFBDBEC0DDCFB9F5EBDB7DA26EF5DF
        D3E8DCC8B4B7B3000000B0B0ADB3A998F8EAD3ADA698E5D9C4C1B5AD91B584DD
        DAC5DCCFC1F0F0F2847E72EBE8E0CBCACBE1D4BFFDEBDCABC199BDBCA4FFF1DA
        B2AEA4000000C8CFD1B6B4B6DED6C8C9CBD1C8C3B7A9A9ABD3CEBA7AA56EEDE1
        D1E2D9CFFFFFFFFFFFFFD9D0C4F1E5CFF5E5D1EBE4C9A0A880DFD8CAB0B8B700
        0000AAC2C7E7E8EAAEB1B3E7E6E5B5ADA1F1F3F5B4B0B2C6BCB283B077D6D5BF
        E3D2C2E9DFCAFDECD4F4E1C9D5CBBDDED9CD64957A9EF2FFB1C0C5000000A4BD
        C1FFFFFFD1C9C1F8F2E9B0A89DFFFFFF9695949E958EFBF4E08BB181A1B09181
        7D7C9BB6B2A6CACBC7E8F6BBD8E13BB4A0E3F7FFA9BDC2000000A6BCC2DFF7FD
        BFC9C6D7CDBDBECCCCEBE0D0FFFFF2C9CDC9DFCFBAF3E1D0CACFAA658B6694C4
        B097D5D47DC5C03E9A75DEECEFD7F0F6A9BDC2000000AEC4C8D8F5FCD5F3FAD1
        F0F9D1F1FAC8C5B7EDDBC3CEE7ECCEEDF7C8E6EFCCD3D0DAEDF1C8E7E4A7CDBB
        B1D3C5E1F7F9D6F0F9DAF6FCAEC3C8000000899B9FAEC3C9A8BDC1AABEC3A7BC
        C2A5BDC59BADADA5B8BDA9BFC3ABC0C5A8BEC4A8BEC4ACC0C6B3C4CCB0C4CAA9
        BEC4A8BDC2AEC3C9899B9F000000}
      Visible = False
      ExplicitLeft = 689
      ExplicitWidth = 0
    end
    inherited btnCancelar: TSpeedButton
      Left = 819
      Caption = '&Fechar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C47089B47089B47089B47089B47089B
        47089B47089B47089B47099B47089B47089B47099B47089B47089B47089B4708
        9B47089B47089B47089C4708953A00B57B509F50159E4C0F9E4E119E4D119E4D
        119E4D119E4D119E4E119E4D0F9843039841009943049943049841009843039E
        4D0F9E4E119E4D119E4D119E4D119E4D119E4E119E4C0FA05014A3571DA05114
        A15215A15215A15215A15215A152169E4E0F9A4503B67A4CCCA282D8B79FD8B7
        9FCCA282B67A4C9A45039E4E0FA15216A15215A15215A15215A15215A05113A4
        591EA55B21A35518A35519A35519A35519A3561A9D4C0D9F5012D6B79EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6B79E9F50129D4C0DA3561AA35519A355
        19A35519A25418A65D25A9622AA75D20A75E22A75E22A75E22A45719AE6A34F5
        EDE7FFFFFFF5EEE8D0A888B57845B57845D0A888F5EEE8FFFFFFF5EDE7AE6A34
        A45719A75E22A75E22A75E22A75D1FAB642CAC672EA96126AA6127AA6127AA63
        279D4B06ECDFD3FFFFFFECDED1AB662DA25515A55819A55819A25515AB662DEC
        DED1FFFFFFECDFD39D4B06AA6327AA6127AA6127A96125AC6831AE6C33AC662B
        AC662CAC672CA86021B2733CFFFFFFF6F0EAB37541A55B1BAC662CAC672CAC67
        2CAC662CA55B1BB37541F6F0EAFFFFFFB2733CA86021AC672CAC662CAC662AAE
        6D36B17239AF6D31AF6E32AF6E31A96426DDC2ABFFFFFFCBA27DA65C1CAF6E34
        AF6E31AF6E31AF6E31AF6E31AF6E34A65C1CCBA27DFFFFFFDDC2ABA96426AF6E
        31AF6E32AF6D31B1733AB4773FB17237B17238B17136AD6B2FE9D8C8FFFFFFC3
        9065AC682BB17338B17238B17238B17238B17238B17338AC682BC39065FFFFFF
        E9D8C8AD6B2FB17136B17238B17136B4783FB77B45B4763CB4773DB4763AB170
        34EAD9CAFFFFFFC39265AF6E30B4773DB4773CB4763CB4763CB4773CB4773DAF
        6E30C39265FFFFFFEAD9CAB17034B4763AB4773DB4763BB67B44BA824AB87C44
        B87C45B87C45B37437D9BBA0FFFFFFD4B191B17234B87D45B87C43B5783EB578
        3EB87C43B87D45B17234D4B191FFFFFFD9BBA0B37437B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814AB77B41C49465FFFFFFEEE1D5B9824AB77B40
        BF8A57E0C6ADE0C6ADBF8A57B77B40B9824AEEE1D5FFFFFFC49465B77B41BA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FBC864FB07030FAF4F1FF
        FFFFEAD8C8A9661DC2915DFDFDFCFDFDFCC2915DAA661DE9D8C8FFFFFFFAF4F1
        B07030BC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BF8C
        56BD8850C0905BF3EAE0FFFFFFF7F1EBCBA176F8F4EFF9F4EFCAA176F6F1EBFF
        FFFFF3EAE0C0905BBD8850BF8C56BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BC2925BC2935BBF8C51CAA171EAD9C7FDFCFAD4B48EF7F3EDF7F3
        EDD5B48EFDFCFAEAD9C7CAA171BF8C51C2935BC2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC5975FC59760C59660C39158C29157D4B188
        D0AA7DF9F6F2F9F6F2D0AA7DD4B188C29157C39158C59660C59760C5975FC597
        5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E68C89E68C89E68C8
        9E68C89C66C39459CCA876FEFCFBFEFCFBCCA876C39459C89C66C89E68C89E68
        C89E68C89E68C89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6CCBA26CCBA26CCBA26CCBA26CC9A069CEA977E9D9C3E9D9C3CEA977C9A069CB
        A26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA56FCBA36ACBA3
        6ACDA56FCDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC78
        D0AC7AD0AC79D0AC79D0AC7AD0AC78D0AC79D0AC79D0AC79D0AC79D0AC79D0AC
        79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17DD4B17DD4B17DD4B17DD4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ExplicitLeft = 844
    end
    inherited btnSetFocus: TBitBtn
      TabOrder = 4
    end
    object btnNovaOS: TBitBtn
      Left = 0
      Top = 0
      Width = 175
      Height = 55
      Align = alLeft
      Caption = '&Nova O.S.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C490B9C490B9C490B9C490B
        9C490B9C490B9C490B9C490B9C490B9C490B9C490B9C490B9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C47089B47089B470898400093380094
        3900943900943900943900943900943900943900943900943900943900933800
        9840009B47089B47089C4708953A00B57B509F50159E4C0F9E4E119E4D119C49
        0BB06E3CC4946FC18F69C28F6AC28F6AC28F6AC18D67C08B65C08D67C2906AC2
        8F6AC18F69C4946FB06E3C9C490B9E4D119E4E119E4C0FA05014A3571DA05114
        A15215A151149A4706D5B59AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFD5B59A9A4706A15114A15215A05113A4
        591EA55B21A35518A35519A355199D4B0BD7B59BFAF6F3B27341AC6832AE6C37
        A9622BD5B399FFFFFFEFE2DAAC6933A85F26B27441FAF6F4D7B59B9D4B0BA355
        19A35519A25418A65D25A9622AA75D20A75E22A75E20A15313D8BAA1F9F4F0A8
        5F25A25314A4581B9F4C0AD1AA8AFFFFFFFFFFFFFFFEFF9D4D0DA35518F9F4F0
        D8BAA1A15313A75E20A75E22A75D1FAB642CAC672EA96126AA6127AA6126A458
        19D9BBA3FAF5F1AC672FA75E21AA6227A35718D2AE8FFFFFFFFFFFFFFFFFFFE8
        D6C6B77A47F6EFE9D9BBA3A45819AA6126AA6127A96125AC6831AE6C33AC662B
        AC662CAC662BA65D1EDBBEA4FAF6F2AF6C34AA6327AC672CA65C1DD3B092FFFF
        FFFFFFFFFFFFFFFFFFFFEFE3D8FDFDFCDABBA1A65D1EAC662BAC662CAC662AAE
        6D36B17239AF6D31AF6E31AF6E31AA6425DCC1A7FAF5F2B27339AC692DAF6E32
        A96424D8B89DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BCA0AA6425AF6E
        31AF6E31AF6D31B1733AB4773FB17237B17238B17237AC692BDCC3AAFAF6F2B4
        7740AF6E32B17238AE6C30C79B72E1C9B2DEC3AADEC3AADDC2A7DFC5ADFFFFFF
        DBC0A6AC692BB17237B17238B17136B4783FB77B45B4763CB4773CB4773CAF6D
        31DFC4ABF9F6F3B77C46B27237B4773DB4763CB17237B06E31AF6E31AF6E31AD
        6B2BB2753BF9F5F1DFC4ABAF6D31B4773CB4773DB4763BB67B44BA824AB87C44
        B87C45B87C45B37538E0C6AEFAF7F4BA824CB6793FB87C45B87C45B87C44B87C
        44B87C44B87C45B6793FBA814CFAF7F4E0C6AEB37538B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA8149B5793EE1C8B0FBF8F4BD8651B87E44BA814A
        BA814ABA814ABA814ABA814ABA814AB87E44BD8651FBF8F4E1C8B0B5793EBA81
        49BA814ABA8048BC8751BE8B55BC854EBC864FBC864FB87F44E2CAB2FBF7F4BE
        8B57BA844BBC864FBC864FBC864FBC864FBC864FBC864FBA844BBE8B57FBF7F4
        E2CAB2B87F44BC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BC85
        4AE3CEB5FBF8F5C1915CBD8A51BF8C55BF8C54BF8C54BF8C54BF8C54BF8C55BD
        8A51C1915CFBF8F5E3CEB5BC854ABF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BBE8B50E4D0B8FBF9F5C59562C09056C2925BC2925BC2925BC292
        5BC2925BC2925BC09056C59562FBF9F5E4D0B8BE8B50C2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC19056E6D1BAFBF8F4C69762C29158C4945D
        C4945CC4945CC4945CC4945CC4945DC29158C69762FBF8F4E6D1BAC19056C597
        5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C6975DE7D3BCFCFAF8D1
        AB7ECCA573CEA776CEA776CEA776CEA776CEA776CEA776CCA573D1AB7EFCFAF8
        E7D3BCC6975DC89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCAA16CC89C
        63E7D6C0FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFFFFFFFFFFE7D6C0C89C63CAA16CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CCA36ED6B88EE2CCAEE0C9AAE1CAABE1CAABE1CAABE1CAABE1CA
        ABE1CAABE1CAABE1CAABE0C9AAE2CCAED6B88ECCA36ECDA570CDA570CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AD79CEA973CCA56DCCA56DCCA56DCCA56D
        CCA56DCCA56DCCA56DCCA56DCCA56DCCA56DCCA56DCCA56DCEA973D0AD79D0AC
        79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      TabOrder = 1
      OnClick = btnNovaOSClick
      OnKeyPress = FormKeyPress
    end
    object btnAlteraOS: TBitBtn
      Left = 175
      Top = 0
      Width = 175
      Height = 55
      Align = alLeft
      Caption = '&Alterar O.S.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480B9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C47089B47089B47089B47089B47089B
        47089B47089B47089B47089B47089B47089B47089B47099B47099B4607984202
        953A009943049B47089C4708953A00B57B509F50159E4C0F9E4E119E4D119E4D
        119E4D119E4D119E4D119E4D119E4D119E4D119E4E119D4B0E9A470898410097
        41009D4C0FA75D25C18D67A65C249C490A9E4E119E4C0FA05014A3571DA05114
        A15215A15215A15215A15215A15215A15215A15215A15215A152169E4E109F4E
        11AB652EBB8257D0A98BDABDA6F8F3EFFFFFFFB376469B4807A15216A05113A4
        591EA55B21A35518A35519A35519A35519A35519A35519A35519A35519A3561A
        A15214963E00DEC4B0FBF8F5FFFFFFFFFFFFF7F3EFE8D7CAFFFFFFB6794A9D4C
        0DA3561AA25418A65D25A9622AA75D20A75E22A75E22A75E22A75E22A75E22A7
        5E22A75E22A65A1CA4571AE7D6C9FDFCFBEFE2D8F5EFE9FFFFFFFFFFFFFFFFFF
        EAD6C8B57845A25617A75E22A75D1FAB642CAC672EA96126AA6127AA6127AA61
        27AA6127AA6127AA6126AA6226A45717CDA483FFFFFFFFFFFFF1E6DCDEC2ADFA
        F8F4FFFFFFFFFFFFFCFBFABA8152A45A1BAA6227A96125AC6831AE6C33AC662B
        AC662CAC662CAC662CAC662CAC662CAC682EA5591AB97F4EFCFBF9FFFFFFFDFB
        FBEDDFD3FCFAF8E7D8C9EAD9CBFDFDFDFEFDFDC08C5FA85E20AC672CAC662AAE
        6D36B17239AF6D31AF6E31AF6E31AF6E31AF6E31AF6E32AC682AAA6627FFFFFF
        FFFFFFFFFFFFE9D8C7F9F5F0FFFFFFFFFDFDE9D8C8EBDCCFFEFFFFC6966BAB64
        25AF6E32AF6D31B1733AB4773FB17237B17238B17238B17238B17238B07034B1
        7137E4D0BCFFFFFFFFFFFFF0E5DCF5EDE7FFFFFFFFFFFFEDDDD0FBF7F4F6F1EB
        F1E8E1BE8A5AAE6C2FB17238B17136B4783FB77B45B4763CB4773CB4773CB477
        3DB4773EA9621FD6B496FFFFFFFFFFFFF6F0EAECDFD3FFFFFFFFFFFFF0E5DAF5
        EDE7FFFFFFFFFFFFDEC3ACAF6E33B3763BB4773DB4763BB67B44BA824AB87C44
        B87C45B87C45B87C45AF6D2EDEC3A9FCFBF8FFFFFFF9F5F3EEE1D5FFFEFEFFFF
        FFF5EDE5F1E6DCFFFFFFFFFFFFF4EBE4A75F19B87C43B87D45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814AB77B41BF8B5AFAF7F4EBDCCDF5EEE6EFE4DA
        FBF9F6FFFFFFF9F7F4F1E6DCFEFDFCFFFFFFF6EFE8C39060B67B41BA814BBA81
        49BA814ABA8048BC8751BE8B55BC854EBC864FBA834CBE8954F0E7DCFFFFFFF4
        EDE6E5CFBAEEE2D6FFFFFFFFFFFFEBDED0FBF7F4FFFFFFFFFFFFD2AE89B77B3E
        BC8650BC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C55BC854BD0AC
        82FFFFFFFFFFFFFFFFFFFFFFFFEADACAEBDECEECE1D3FBFAF8FFFFFFFFFFFFD5
        B490B77F42BF8C55BF8C54BF8C54BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC19059C2935CDFC8ACFFFFFFFFFFFFFFFFFFFCFCFAF2E7DCE7D5C0F9F5
        F0FFFFFFF3E9DFBA8344C19159C2925BC2925BC2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC59760C4955CBD894DDFC7AAFFFFFFFFFFFFFFFFFF
        FFFFFFF8F4EFE9DAC7F0E6DACBA06FC39157C59760C5975FC5975FC5975FC597
        5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E68C89E68C18F52CA
        A26EF2E7DCFFFFFFFFFFFFFFFFFFFEFDFDDABF9AC69A63C89E66C89E68C89E68
        C89E68C89E68C89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6CCBA26CCBA26DC89C65C79D65EEE0D0FFFFFFFFFFFFE2CCAFC79C63C99F6ACB
        A26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA570CDA570CDA570CDA671CBA26BCBA26BDCC29EE5D1B6C89D
        65CCA46ECDA671CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AD79D0AC78
        CDA770CDA66DD0AC79D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC
        79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      TabOrder = 3
      OnClick = btnNovaOSClick
      OnKeyPress = FormKeyPress
    end
    object btnImprimir: TBitBtn
      Left = 350
      Top = 0
      Width = 175
      Height = 55
      Align = alLeft
      Caption = '&Imprimir O.S.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C480A98430398400098410098410098
        4100984100984100984100984100984100984100984100984100984100984100
        9840009A44069B47089C4708953A00B57B509F50159E4C0F9A4709AA622EB272
        42B17242B17242B17242B17242B17242B17242B17242B17242B17242B17242B1
        7242B17242B17242B1703EA2541A9D4C0E9E4E119E4C0FA05014A3571DA15315
        943900DFC6B4CFA78AC39069C5936EC4936EC4936EC4936EC4936EC4936EC493
        6EC4936EC4936EC4936EC5946EBE895FE2CAB9BB8257994504A15316A05113A4
        591EA55B21A3571A963E00E1C9B7AE6A369A46059E4D0F9E4D0E9E4D0E9E4D0E
        9E4D0E9E4D0E9E4D0E9E4D0E9E4D0E9E4D0E9E4E0F933A00D0A98CC5946F9C4B
        0BA25519A35518A65D25A9622AA85E219B4601E1CBB7B57746A5581AA25516A3
        5516A35516A35516A35516A35516A35516A35516A35516A25515A55A1D9D4C09
        D2AE91F6F0EBEAD9CA9A4400A75E21AB642CAC672EAA63279D4B07E2CCB9B77B
        4BA25414BE895DBF8B60C08C60C08C60C08C60C08C60C08C60C08C60C08C60BF
        8A5FB375409F4E0CD2AE8FD9BA9FDDC2AB9D4B07AA6326AC6831AE6C33AC682C
        A0510EE3CCB9B77C489A4400FFFFFFD5B497D6B497D6B499D6B498D6B498D6B4
        98D6B499D4B194E4CFBDD8BBA09D4A03D3AF91F6EFEAE8D7C9A0500BAC682CAE
        6D36B17239AF6E32A45613E8D7C7CBA37EB47641F9F5F1A55C1AA55B1AA65E1D
        A65E1DA65E1DA65E1DA65E1DA15611C08B5EE4CDBBB67A46E2CCB8CCA27DAA63
        24AE6C31AF6D31B1733AB4773FB17237AB6828CBA17CD4B091CCA17BF1E9E0B1
        7137B17036B17339B17339B17339B17339B27339AE6B2EC5986FEAD9CACFA783
        D4B292BA814EAE6B2FB17338B17136B4783FB77B45B4763CB4773DB06E32B06E
        31A45B17F1E8DDB4773EB3743AB4773DB4773CB4773CB4773CB4773DB06F33CA
        9F76D9BB9FAC6727AF6C30B27337B4773DB4773DB4763BB67B44BA824AB87C44
        B87C45B87D45B97D46AD6B2BF3EBE1B77D44B77A42B87C45B87C45B87C45B87C
        45B87C45B4773BCCA37ADDC3A8B5753AB87D45B87C45B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814ABB824AAF7031F4EBE1B9824ABA7F47BA814A
        BA814ABA814ABA814ABA814AB67B40CEA67EDEC5AAB77B40BA8149BA814ABA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FBD8650B37637F3EBE3BC
        864FBC834CBC864FBC864FBC864FBC854EBC854DB87F44D0A981DFC5ACB87F46
        BC8750BC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BF8C
        55B67D3DF4EBE4BF8C55BE8B52BF8C55BF8C55BE8B53C08D54C1905BBE8D54D3
        AF89E0C9B1BD854CBF8D55BF8C54BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BC2935BB98344F5EDE5C2935BC29158C2925BC2935BBC8749E3D0
        B8E6D2BCDABD9CF2E9DFE0CAADBF8B51C2925BC2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC59760BE8849F4EEE6C59760C5945DC59760
        C59761BE884AEFE5D8CFA97BCBA170F3EEE7C99E6BC4935BC59760C5975FC597
        5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E69C18F51F5EEE7C5
        9861C5975CC6985FC69960BE8B4BECDDCDE5D0B8F1E6D7BE8B4BC69A62C89E68
        C89E68C89E68C89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6DC39457F8F4EEDEC5A5DDC4A2DDC4A4DDC4A4DABC98F6F0E8EBDDCACCA26EC9
        9E68CBA26DCBA26CCBA26CCBA26CCBA26CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA671CBA26AD7B98ED8BB92D8BB92D8BC92D8BC92D8BC93D7B8
        8ECDA872CBA26BCDA671CDA570CDA570CDA570CDA570CDA570CDA570CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AD79CFA974CEA973CEA973CEA973
        CEA973CEA973CEA974D0AC77D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC
        79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovaOSClick
      OnKeyPress = FormKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 525
      Top = 0
      Width = 175
      Height = 55
      Align = alLeft
      Caption = '&Impr. Requisi'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C480A98430398400098410098410098
        4100984100984100984100984100984100984100984100984100984100984100
        9840009A44069B47089C4708953A00B57B509F50159E4C0F9A4709AA622EB272
        42B17242B17242B17242B17242B17242B17242B17242B17242B17242B17242B1
        7242B17242B17242B1703EA2541A9D4C0E9E4E119E4C0FA05014A3571DA15315
        943900DFC6B4CFA78AC39069C5936EC4936EC4936EC4936EC4936EC4936EC493
        6EC4936EC4936EC4936EC5946EBE895FE2CAB9BB8257994504A15316A05113A4
        591EA55B21A3571A963E00E1C9B7AE6A369A46059E4D0F9E4D0E9E4D0E9E4D0E
        9E4D0E9E4D0E9E4D0E9E4D0E9E4D0E9E4D0E9E4E0F933A00D0A98CC5946F9C4B
        0BA25519A35518A65D25A9622AA85E219B4601E1CBB7B57746A5581AA25516A3
        5516A35516A35516A35516A35516A35516A35516A35516A25515A55A1D9D4C09
        D2AE91F6F0EBEAD9CA9A4400A75E21AB642CAC672EAA63279D4B07E2CCB9B77B
        4BA25414BE895DBF8B60C08C60C08C60C08C60C08C60C08C60C08C60C08C60BF
        8A5FB375409F4E0CD2AE8FD9BA9FDDC2AB9D4B07AA6326AC6831AE6C33AC682C
        A0510EE3CCB9B77C489A4400FFFFFFD5B497D6B497D6B499D6B498D6B498D6B4
        98D6B499D4B194E4CFBDD8BBA09D4A03D3AF91F6EFEAE8D7C9A0500BAC682CAE
        6D36B17239AF6E32A45613E8D7C7CBA37EB47641F9F5F1A55C1AA55B1AA65E1D
        A65E1DA65E1DA65E1DA65E1DA15611C08B5EE4CDBBB67A46E2CCB8CCA27DAA63
        24AE6C31AF6D31B1733AB4773FB17237AB6828CBA17CD4B091CCA17BF1E9E0B1
        7137B17036B17339B17339B17339B17339B27339AE6B2EC5986FEAD9CACFA783
        D4B292BA814EAE6B2FB17338B17136B4783FB77B45B4763CB4773DB06E32B06E
        31A45B17F1E8DDB4773EB3743AB4773DB4773CB4773CB4773CB4773DB06F33CA
        9F76D9BB9FAC6727AF6C30B27337B4773DB4773DB4763BB67B44BA824AB87C44
        B87C45B87D45B97D46AD6B2BF3EBE1B77D44B77A42B87C45B87C45B87C45B87C
        45B87C45B4773BCCA37ADDC3A8B5753AB87D45B87C45B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814ABB824AAF7031F4EBE1B9824ABA7F47BA814A
        BA814ABA814ABA814ABA814AB67B40CEA67EDEC5AAB77B40BA8149BA814ABA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FBD8650B37637F3EBE3BC
        864FBC834CBC864FBC864FBC864FBC854EBC854DB87F44D0A981DFC5ACB87F46
        BC8750BC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BF8C
        55B67D3DF4EBE4BF8C55BE8B52BF8C55BF8C55BE8B53C08D54C1905BBE8D54D3
        AF89E0C9B1BD854CBF8D55BF8C54BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BC2935BB98344F5EDE5C2935BC29158C2925BC2935BBC8749E3D0
        B8E6D2BCDABD9CF2E9DFE0CAADBF8B51C2925BC2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC59760BE8849F4EEE6C59760C5945DC59760
        C59761BE884AEFE5D8CFA97BCBA170F3EEE7C99E6BC4935BC59760C5975FC597
        5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E69C18F51F5EEE7C5
        9861C5975CC6985FC69960BE8B4BECDDCDE5D0B8F1E6D7BE8B4BC69A62C89E68
        C89E68C89E68C89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6DC39457F8F4EEDEC5A5DDC4A2DDC4A4DDC4A4DABC98F6F0E8EBDDCACCA26EC9
        9E68CBA26DCBA26CCBA26CCBA26CCBA26CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA671CBA26AD7B98ED8BB92D8BB92D8BC92D8BC92D8BC93D7B8
        8ECDA872CBA26BCDA671CDA570CDA570CDA570CDA570CDA570CDA570CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AD79CFA974CEA973CEA973CEA973
        CEA973CEA973CEA974D0AC77D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC
        79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
      OnKeyPress = FormKeyPress
    end
  end
end
