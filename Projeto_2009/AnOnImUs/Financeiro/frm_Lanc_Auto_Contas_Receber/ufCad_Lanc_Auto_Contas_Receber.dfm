inherited fCad_Lanc_Auto_Contas_Receber: TfCad_Lanc_Auto_Contas_Receber
  Caption = 'Lan'#231'amento Autom'#225'tico Contas Receber'
  ClientHeight = 687
  Constraints.MinHeight = 508
  Constraints.MinWidth = 658
  ExplicitWidth = 800
  ExplicitHeight = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 632
    ExplicitHeight = 632
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 604
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Reg.'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 107
        Top = 6
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Reg.'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 107
        Top = 99
        Width = 65
        Height = 13
        Caption = 'Proveni'#234'ncia'
        FocusControl = edtProveniente
      end
      object Label4: TLabel
        Left = 3
        Top = 99
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Doc.'
        FocusControl = edtNr_Doc
      end
      object Label5: TLabel
        Left = 3
        Top = 141
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Clie
        OnClick = Label5Click
      end
      object Label6: TLabel
        Left = 183
        Top = 141
        Width = 36
        Height = 13
        Caption = 'Cliente'
        FocusControl = edtCliente
        OnClick = Label5Click
      end
      object btnPesq_Clie: TSpeedButton
        Left = 107
        Top = 156
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
        OnClick = btnPesq_ClieClick
      end
      object Label7: TLabel
        Left = 400
        Top = 339
        Width = 59
        Height = 13
        Caption = 'Dt. Emiss'#227'o'
      end
      object Label8: TLabel
        Left = 3
        Top = 339
        Width = 54
        Height = 13
        Caption = 'Dt. Vencto'
      end
      object Label9: TLabel
        Left = 573
        Top = 339
        Width = 48
        Height = 13
        Caption = 'Dt. Pagto'
      end
      object Label10: TLabel
        Left = 632
        Top = 50
        Width = 151
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor do Documento R$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 713
        Top = 339
        Width = 62
        Height = 13
        Caption = 'Vlr. Pago R$'
      end
      object Label14: TLabel
        Left = 3
        Top = 183
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Plano
        OnClick = Label14Click
      end
      object Label15: TLabel
        Left = 288
        Top = 183
        Width = 84
        Height = 13
        Caption = 'Plano de Contas'
        FocusControl = edtPlano
      end
      object btnPesq_Plano: TSpeedButton
        Left = 107
        Top = 198
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
        OnClick = btnPesq_PlanoClick
      end
      object Label16: TLabel
        Left = 183
        Top = 183
        Width = 65
        Height = 13
        Caption = 'C'#243'd. Simplif.'
        FocusControl = edtCod_Simplif
        OnClick = Label14Click
      end
      object Label17: TLabel
        Left = 3
        Top = 225
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Doc
      end
      object Label18: TLabel
        Left = 145
        Top = 225
        Width = 101
        Height = 13
        Caption = 'Tipo de Documento'
        FocusControl = edtDocumento
      end
      object btnPesq_Doc: TSpeedButton
        Left = 107
        Top = 240
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
        OnClick = btnPesq_DocClick
      end
      object Label19: TLabel
        Left = 3
        Top = 463
        Width = 60
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object SpeedButton1: TSpeedButton
        Left = 145
        Top = 156
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
      object SpeedButton2: TSpeedButton
        Left = 145
        Top = 198
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
      object DBEdit1: TDBEdit
        Left = 3
        Top = 22
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_ID'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 22
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CREC_DTA_CADASTRO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 542
        Top = -2
        Width = 240
        Height = 45
        Caption = 'Status'
        Columns = 3
        DataField = 'CREC_STATUS'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        Items.Strings = (
          'Aberto'
          'Fechado'
          'Cancelado')
        ReadOnly = True
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'A'
          'F'
          'C')
      end
      object edtProveniente: TDBEdit
        Left = 107
        Top = 115
        Width = 676
        Height = 21
        HelpContext = 1
        DataField = 'CREC_PROVENIENTE'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        TabOrder = 5
      end
      object edtNr_Doc: TDBEdit
        Left = 3
        Top = 115
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CREC_NR_DOC'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        TabOrder = 4
      end
      object edtCod_Clie: TDBEdit
        Left = 3
        Top = 157
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CREC_CLIE_ID'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ImeName = 'btnPesq_Clie;SpeedButton1'
        TabOrder = 6
        OnExit = edtCod_ClieExit
        OnKeyPress = edtCod_ClieKeyPress
      end
      object edtCliente: TDBEdit
        Left = 183
        Top = 157
        Width = 600
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CLIE_FANTASIA'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        TabOrder = 7
      end
      object edtDt_Emissao: TDBDateEdit
        Left = 316
        Top = 355
        Width = 152
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CREC_DTA_EMISSAO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 15
      end
      object DBDateEdit5: TDBDateEdit
        Left = 474
        Top = 355
        Width = 152
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CREC_DTA_PGTO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        Color = clGradientInactiveCaption
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 16
      end
      object edtDt_Vecto: TDBDateEdit
        Left = 3
        Top = 355
        Width = 152
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CREC_DTA_VCTO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        NumGlyphs = 2
        TabOrder = 14
      end
      object edtVlr_Doc: TRxDBCalcEdit
        Left = 630
        Top = 66
        Width = 152
        Height = 33
        HelpContext = 1
        Margins.Left = 7
        Margins.Top = 1
        DataField = 'CREC_VALOR_DOC'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
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
        OnExit = edtVlr_DocExit
      end
      object edtCod_Plano: TDBEdit
        Left = 3
        Top = 199
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CREC_PLCT_ID'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ImeName = 'btnPesq_Plano;SpeedButton2'
        TabOrder = 8
        OnExit = edtCod_PlanoExit
        OnKeyPress = edtCod_ClieKeyPress
      end
      object edtPlano: TDBEdit
        Left = 288
        Top = 199
        Width = 495
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PLCT_DESCRICAO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        TabOrder = 10
      end
      object edtCod_Simplif: TDBEdit
        Left = 183
        Top = 199
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PLCT_COD_SIMPLIFICADO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        TabOrder = 9
      end
      object edtCod_Doc: TDBEdit
        Left = 3
        Top = 241
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CREC_GENE_ID_TIPO_DOC'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ImeName = 'btnPesq_Doc'
        TabOrder = 11
        OnExit = edtCod_DocExit
        OnKeyPress = edtCod_ClieKeyPress
      end
      object edtDocumento: TDBEdit
        Left = 145
        Top = 241
        Width = 638
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'TIPO_DOC'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ReadOnly = True
        TabOrder = 12
      end
      object DBMemo1: TDBMemo
        Left = 3
        Top = 478
        Width = 779
        Height = 85
        DataField = 'CREC_OBS'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ScrollBars = ssVertical
        TabOrder = 18
        OnEnter = DBMemo1Enter
        OnExit = DBMemo1Exit
      end
      object Panel2: TPanel
        Tag = 99
        Left = 3
        Top = 383
        Width = 779
        Height = 77
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 19
        object lb21: TLabel
          Left = 1
          Top = 1
          Width = 777
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Informa'#231#245'es sobre Cart'#227'o Cr'#233'dito/D'#233'bito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 214
        end
        object lb1: TLabel
          Left = 17
          Top = 23
          Width = 58
          Height = 13
          Caption = 'Nr'#186' Cart'#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb4: TDBText
          Left = 76
          Top = 23
          Width = 181
          Height = 15
          DataField = 'CCRE_NUMERO_CARTAO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb7: TLabel
          Left = 260
          Top = 23
          Width = 54
          Height = 13
          Caption = 'V'#225'lido at'#233':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb9: TDBText
          Left = 316
          Top = 23
          Width = 59
          Height = 15
          DataField = 'CCRE_VENCIMENTO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb11: TLabel
          Left = 432
          Top = 23
          Width = 31
          Height = 13
          Caption = 'Ativo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb13: TDBText
          Left = 463
          Top = 23
          Width = 59
          Height = 15
          DataField = 'CCRE_ATIVO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb2: TLabel
          Left = 37
          Top = 39
          Width = 36
          Height = 13
          Caption = 'Titular:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb5: TDBText
          Left = 76
          Top = 39
          Width = 323
          Height = 15
          DataField = 'CCRE_TITULAR'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb15: TLabel
          Left = 535
          Top = 23
          Width = 79
          Height = 13
          Caption = 'Tipo de Cart'#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb17: TDBText
          Left = 611
          Top = 23
          Width = 93
          Height = 15
          DataField = 'CCRE_TIPO_CARTAO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb23: TLabel
          Left = 5
          Top = 55
          Width = 70
          Height = 13
          Caption = 'Limite Saque:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb6: TDBText
          Left = 76
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_LIMITE_SAQUE'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb8: TLabel
          Left = 232
          Top = 55
          Width = 84
          Height = 13
          Caption = 'Limite Compras:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb10: TDBText
          Left = 316
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_LIMITE_COMPRAS'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb18: TDBText
          Left = 611
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_DIA_VCTO_FATURA'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb16: TLabel
          Left = 543
          Top = 55
          Width = 67
          Height = 13
          Caption = 'Dia Vcto Fat.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb14: TDBText
          Left = 463
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_DIA_FECHAMENTO_FATURA'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb12: TLabel
          Left = 390
          Top = 55
          Width = 72
          Height = 13
          Caption = 'Dia Fech. Fat.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb19: TLabel
          Left = 683
          Top = 55
          Width = 29
          Height = 13
          Caption = 'Disp.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb20: TLabel
          Left = 716
          Top = 55
          Width = 21
          Height = 13
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb22: TDBImage
          Left = 707
          Top = 5
          Width = 65
          Height = 40
          DataField = 'CCRE_IMAGE'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          ParentColor = True
          Stretch = True
          TabOrder = 0
        end
      end
      object edtVlr_Pago: TDBEdit
        Left = 631
        Top = 355
        Width = 152
        Height = 21
        TabStop = False
        BiDiMode = bdRightToLeft
        Color = clGradientInactiveCaption
        DataField = 'CREC_VALOR_PAGO'
        DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 17
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 266
        Width = 780
        Height = 70
        Caption = '    Via Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        object Label22: TLabel
          Left = 5
          Top = 19
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCod_Banco
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label22Click
        end
        object Label23: TLabel
          Left = 185
          Top = 19
          Width = 89
          Height = 13
          Caption = 'Banco/Financeira'
          FocusControl = DBEdit3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label22Click
        end
        object Label24: TLabel
          Left = 585
          Top = 19
          Width = 75
          Height = 13
          Caption = 'Saldo Atual R$'
          FocusControl = DBEdit4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnPesq_Banco: TSpeedButton
          Left = 109
          Top = 34
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
        object Label26: TLabel
          Left = 721
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Limite R$'
          FocusControl = DBEdit8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnInsertBanco: TSpeedButton
          Left = 147
          Top = 34
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
          OnClick = btnInsertBancoClick
        end
        object edtCod_Banco: TDBEdit
          Left = 5
          Top = 35
          Width = 100
          Height = 21
          DataField = 'CREC_CBCO_ID'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImeName = 'btnPesq_Banco;SpeedButton3'
          ParentFont = False
          TabOrder = 1
          OnExit = edtCod_BancoExit
          OnKeyPress = edtCod_ClieKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 185
          Top = 35
          Width = 380
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'BANCO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 569
          Top = 35
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CBCO_SALDO_ATUAL'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 674
          Top = 35
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CBCO_LIMITE'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object rdBanco: TDBCheckBox
          Left = 5
          Top = -1
          Width = 17
          Height = 17
          DataField = 'CREC_VIA_BANCO'
          DataSource = dmLanc_Auto_Contas_Receber.dsContas_Receber
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = rdBancoClick
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 632
    ExplicitTop = 632
    inherited btnOK: TSpeedButton
      ExplicitLeft = 438
      ExplicitTop = 2
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 500
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 520
    Top = 256
  end
end
