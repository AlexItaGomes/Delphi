inherited fCad_Movimentacao_Bancaria: TfCad_Movimentacao_Bancaria
  Caption = 'Movimenta'#231#227'o Banc'#225'ria'
  Constraints.MinHeight = 363
  Constraints.MinWidth = 689
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ParentBiDiMode = False
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Reg.'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 108
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Dt. Mov.'
      end
      object Label3: TLabel
        Left = 653
        Top = 53
        Width = 129
        Height = 13
        Caption = '&Valor do Movimento'
        FocusControl = edtVlr_Mov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 113
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Banco
        OnClick = Label4Click
      end
      object Label5: TLabel
        Left = 183
        Top = 113
        Width = 89
        Height = 13
        Caption = 'Banco/Financeira'
        FocusControl = DBEdit3
        OnClick = Label4Click
      end
      object Label6: TLabel
        Left = 613
        Top = 113
        Width = 59
        Height = 13
        Caption = 'Saldo Atual'
        FocusControl = DBEdit4
      end
      object btnPesq_Banco: TSpeedButton
        Left = 108
        Top = 128
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
        OnClick = btnPesq_BancoClick
      end
      object Label8: TLabel
        Left = 183
        Top = 153
        Width = 75
        Height = 13
        Caption = 'Movimenta'#231#227'o'
        FocusControl = DBEdit2
        OnClick = Label8Click
      end
      object Label9: TLabel
        Left = 682
        Top = 153
        Width = 50
        Height = 13
        Caption = 'Tipo Mov.'
        FocusControl = edtTipoMov
      end
      object Label10: TLabel
        Left = 3
        Top = 153
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Tipo
        OnClick = Label8Click
      end
      object btnPesq_Tipo: TSpeedButton
        Left = 108
        Top = 168
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
        OnClick = btnPesq_TipoClick
      end
      object Label11: TLabel
        Left = 578
        Top = 153
        Width = 49
        Height = 13
        Caption = 'Dedut'#237'vel'
        FocusControl = edtDedutivel
      end
      object Label12: TLabel
        Left = 684
        Top = 113
        Width = 87
        Height = 13
        Caption = 'Limite de Cr'#233'dito'
        FocusControl = DBEdit8
      end
      object SpeedButton2: TSpeedButton
        Left = 145
        Top = 128
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
        OnClick = SpeedButton2Click
      end
      object SpeedButton1: TSpeedButton
        Left = 145
        Top = 168
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
      object Label7: TLabel
        Left = 213
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Nr'#186' Documento'
        FocusControl = edtNrDocumento
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBMV_ID'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CBMV_DTA_CADASTRO'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtVlr_Mov: TRxDBCalcEdit
        Left = 578
        Top = 69
        Width = 204
        Height = 33
        HelpContext = 1
        Margins.Left = 7
        Margins.Top = 1
        DataField = 'CBMV_VALOR_MOV'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        OnExit = edtVlr_MovExit
      end
      object edtCod_Banco: TDBEdit
        Left = 3
        Top = 129
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CBMV_CBCO_ID'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ImeName = 'btnPesq_Banco;SpeedButton2'
        TabOrder = 4
        OnExit = edtCod_BancoExit
        OnKeyPress = edtCod_BancoKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 183
        Top = 129
        Width = 389
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'BANCO'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit4: TDBEdit
        Left = 578
        Top = 129
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_SALDO_ATUAL'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit2: TDBEdit
        Left = 183
        Top = 169
        Width = 389
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'MOVIMENTACAO'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 9
      end
      object edtTipoMov: TDBEdit
        Left = 682
        Top = 169
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'TIPO_MOV'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 11
      end
      object edtCod_Tipo: TDBEdit
        Left = 3
        Top = 169
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CBMV_GENE_ID_TIPO_MOV'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ImeName = 'btnPesq_Tipo;SpeedButton1'
        TabOrder = 8
        OnExit = edtCod_TipoExit
        OnKeyPress = edtCod_BancoKeyPress
      end
      object edtDedutivel: TDBEdit
        Left = 578
        Top = 169
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'DEDUTIVEL'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit8: TDBEdit
        Left = 682
        Top = 129
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_LIMITE'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        ReadOnly = True
        TabOrder = 7
      end
      object edtNrDocumento: TDBEdit
        Left = 213
        Top = 24
        Width = 120
        Height = 21
        HelpContext = 1
        DataField = 'CBMV_NR_DOCUMENTO'
        DataSource = dmMovimentacao_Bancaria.dsMovimentacao_Bancaria
        TabOrder = 2
      end
      object rdTransferencia: TRadioGroup
        Left = 3
        Top = 211
        Width = 185
        Height = 42
        Caption = 'Transfer'#234'ncia entre contas'
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
        TabOrder = 12
        OnClick = rdTransferenciaClick
      end
      object pnlTransf: TPanel
        Left = 0
        Top = 275
        Width = 783
        Height = 89
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 13
        Visible = False
        inline frPesqBancoTransf: TfrPesqIndividual
          Left = 0
          Top = 1
          Width = 782
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 1
          ExplicitWidth = 782
          inherited Label2: TLabel
            Left = 183
            Width = 148
            Caption = 'Banco/Financeira de Destino'
            ExplicitLeft = 183
            ExplicitWidth = 148
          end
          inherited btnPesquisar: TSpeedButton
            Left = 108
            Top = 18
            ExplicitLeft = 108
            ExplicitTop = 18
          end
          inherited btnInserir: TSpeedButton
            Left = 145
            Top = 18
            ExplicitLeft = 145
            ExplicitTop = 18
          end
          inherited Label3: TLabel
            Left = 613
            Top = 3
            Width = 59
            Caption = 'Saldo Atual'
            Visible = True
            ExplicitLeft = 613
            ExplicitTop = 3
            ExplicitWidth = 59
          end
          inherited Label4: TLabel
            Left = 684
            Top = 3
            Width = 87
            Caption = 'Limite de Cr'#233'dito'
            Visible = True
            ExplicitLeft = 684
            ExplicitTop = 3
            ExplicitWidth = 87
          end
          inherited edtCodigo: TEdit
            OnKeyPress = frPesqBancoTransfedtCodigoKeyPress
          end
          inherited edtDescricao: TEdit
            Left = 183
            Width = 389
            ExplicitLeft = 183
            ExplicitWidth = 389
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 8
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            Top = -1
            ExplicitLeft = 1500
            ExplicitTop = -1
          end
          inherited edtOpcao: TEdit
            Left = 578
            Width = 100
            Visible = True
            ExplicitLeft = 578
            ExplicitWidth = 100
          end
          inherited edtOpcao1: TEdit
            Left = 682
            Width = 100
            Visible = True
            ExplicitLeft = 682
            ExplicitWidth = 100
          end
        end
        inline frPesqTipoMovTransf: TfrPesqIndividual
          Left = 0
          Top = 45
          Width = 785
          Height = 40
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitTop = 45
          ExplicitWidth = 785
          inherited Label2: TLabel
            Left = 183
            Width = 75
            Caption = 'Movimenta'#231#227'o'
            ExplicitLeft = 183
            ExplicitWidth = 75
          end
          inherited btnPesquisar: TSpeedButton
            Left = 108
            ExplicitLeft = 108
          end
          inherited btnInserir: TSpeedButton
            Left = 145
            ExplicitLeft = 145
          end
          inherited Label3: TLabel
            Left = 578
            Caption = 'Dedut'#237'vel'
            Visible = True
            ExplicitLeft = 578
          end
          inherited Label4: TLabel
            Left = 682
            Width = 50
            Caption = 'Tipo Mov.'
            Visible = True
            ExplicitLeft = 682
            ExplicitWidth = 50
          end
          inherited edtDescricao: TEdit
            Left = 183
            Width = 389
            ExplicitLeft = 183
            ExplicitWidth = 389
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 27
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 578
            Width = 100
            Visible = True
            ExplicitLeft = 578
            ExplicitWidth = 100
          end
          inherited edtOpcao1: TEdit
            Left = 682
            Width = 100
            Visible = True
            ExplicitLeft = 682
            ExplicitWidth = 100
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 377
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 529
    end
  end
end
