inherited fCad_Contas_Bancarias: TfCad_Contas_Bancarias
  Caption = 'Contas Banc'#225'rias'
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 109
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 5
        Top = 97
        Width = 59
        Height = 13
        Caption = '&C'#243'digo (F5)'
        FocusControl = edtCodigo
        OnClick = Label3Click
      end
      object Label4: TLabel
        Left = 181
        Top = 97
        Width = 32
        Height = 13
        Caption = 'Banco'
        FocusControl = DBEdit3
        OnClick = Label3Click
      end
      object Label5: TLabel
        Left = 680
        Top = 97
        Width = 72
        Height = 13
        Caption = 'C'#243'd. Banc'#225'rio'
        FocusControl = DBEdit4
      end
      object btnPesq: TSpeedButton
        Left = 108
        Top = 112
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
        OnClick = btnPesqClick
      end
      object Label6: TLabel
        Left = 5
        Top = 140
        Width = 41
        Height = 13
        Caption = 'A&g'#234'ncia'
        FocusControl = edtAgencia
      end
      object Label7: TLabel
        Left = 166
        Top = 140
        Width = 31
        Height = 13
        Caption = 'Co&nta'
        FocusControl = edtConta
      end
      object Label8: TLabel
        Left = 568
        Top = 140
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Inicial'
      end
      object Label9: TLabel
        Left = 733
        Top = 140
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Atual'
      end
      object Label10: TLabel
        Left = 5
        Top = 182
        Width = 41
        Height = 13
        Caption = 'Gerente'
        FocusControl = edtGerente
      end
      object Label11: TLabel
        Left = 370
        Top = 140
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Limite de Cr'#233'dito'
      end
      object Label12: TLabel
        Left = 5
        Top = 56
        Width = 49
        Height = 13
        Caption = '&Descri'#231#227'o'
        FocusControl = edtDescricao
        OnClick = Label3Click
      end
      object Label13: TLabel
        Left = 680
        Top = 56
        Width = 42
        Height = 13
        Caption = 'Dt. Base'
        FocusControl = DBEdit4
      end
      object SpeedButton2: TSpeedButton
        Left = 144
        Top = 112
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
      object Label14: TLabel
        Left = 574
        Top = 56
        Width = 63
        Height = 13
        Caption = 'Dt. Abertura'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_ID'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 109
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CBCO_DTA_CADASTRO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 3
        Top = 230
        Width = 210
        Height = 45
        Caption = 'Tipo de Conta'
        Columns = 2
        DataField = 'CBCO_TIPO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        Items.Strings = (
          'C. Corrente'
          'C. Poupan'#231'a')
        TabOrder = 2
        Values.Strings = (
          'C'
          'P')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 630
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'CBCO_ATIVO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
      end
      object edtCodigo: TDBEdit
        Left = 5
        Top = 113
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CBCO_GENE_ID_BCO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ImeName = 'btnPesq;SpeedButton2'
        TabOrder = 7
        OnExit = edtCodigoExit
        OnKeyPress = edtCodigoKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 181
        Top = 113
        Width = 493
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'BANCO_DESCR'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit4: TDBEdit
        Left = 680
        Top = 113
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'COD_BANCO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ReadOnly = True
        TabOrder = 9
      end
      object edtAgencia: TDBEdit
        Left = 5
        Top = 156
        Width = 150
        Height = 21
        HelpContext = 1
        DataField = 'CBCO_AGENCIA'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        TabOrder = 10
      end
      object edtConta: TDBEdit
        Left = 161
        Top = 156
        Width = 150
        Height = 21
        HelpContext = 1
        DataField = 'CBCO_CONTA'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        TabOrder = 11
      end
      object edtGerente: TDBEdit
        Left = 3
        Top = 201
        Width = 464
        Height = 21
        HelpContext = 1
        DataField = 'CBCO_GERENTE'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        TabOrder = 15
      end
      object edtVlr_Inicial: TRxDBCalcEdit
        Left = 473
        Top = 156
        Width = 150
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CBCO_VALOR_INICIAL'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        DisplayFormat = '0.00'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 13
      end
      object RxDBCalcEdit2: TRxDBCalcEdit
        Left = 630
        Top = 156
        Width = 150
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CBCO_SALDO_ATUAL'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        ReadOnly = True
        Color = clGradientInactiveCaption
        DisplayFormat = '0.00'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 14
      end
      object edtVlr_Limite: TRxDBCalcEdit
        Left = 317
        Top = 156
        Width = 150
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CBCO_LIMITE'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        DisplayFormat = '0.00'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 12
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 72
        Width = 563
        Height = 21
        HelpContext = 1
        DataField = 'CBCO_DESCRICAO'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        TabOrder = 4
      end
      object edtDtBase: TRxDBCalcEdit
        Left = 680
        Top = 72
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CBCO_DIA_LIMITE'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        DecimalPlaces = 0
        ButtonWidth = 0
        MaxLength = 2
        MaxValue = 31.000000000000000000
        MinValue = 1.000000000000000000
        NumGlyphs = 2
        TabOrder = 6
        ZeroEmpty = False
      end
      object DBDateEdit2: TDBDateEdit
        Left = 574
        Top = 72
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CBCO_DTA_ABERTURA'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        NumGlyphs = 2
        TabOrder = 5
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 3
        Top = 279
        Width = 210
        Height = 45
        Caption = 'Considera-la em Saldos'
        Columns = 2
        DataField = 'CBCO_CONSIDERAR_SALDOS'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        TabOrder = 16
        Values.Strings = (
          '1'
          '0')
      end
      object DBRadioGroup4: TDBRadioGroup
        Left = 219
        Top = 228
        Width = 210
        Height = 45
        Caption = 'Considera-la em Metas'
        Columns = 2
        DataField = 'CBCO_PARTICIPA_METAS'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        TabOrder = 17
        Values.Strings = (
          '1'
          '0')
      end
      object DBRadioGroup5: TDBRadioGroup
        Left = 219
        Top = 279
        Width = 210
        Height = 45
        Caption = 'Conta Multi Empresa'
        Columns = 2
        DataField = 'CBCO_MULTI_EMPRESA'
        DataSource = dmContas_Bancarias.dsContas_Bancarias
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        TabOrder = 18
        Values.Strings = (
          '1'
          '0')
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 494
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 644
    end
  end
end
