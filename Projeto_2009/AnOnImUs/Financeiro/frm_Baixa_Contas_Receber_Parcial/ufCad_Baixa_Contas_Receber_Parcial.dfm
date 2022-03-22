inherited fCad_Baixa_Contas_Receber_Parcial: TfCad_Baixa_Contas_Receber_Parcial
  Caption = 'Lan'#231'amentos Contas Receber Parcial'
  Constraints.MinHeight = 305
  Constraints.MinWidth = 621
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
        Left = 3
        Top = 6
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Reg.'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 46
        Width = 61
        Height = 13
        Caption = 'Proveni'#234'nte'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 684
        Top = 47
        Width = 54
        Height = 13
        Caption = 'Dt. Vencto'
      end
      object Label4: TLabel
        Left = 235
        Top = 171
        Width = 62
        Height = 13
        Caption = 'Vlr. Pago R$'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 384
        Top = 171
        Width = 65
        Height = 13
        Caption = 'Vlr. Pagar R$'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 3
        Top = 127
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Doc
      end
      object Label7: TLabel
        Left = 145
        Top = 127
        Width = 101
        Height = 13
        Caption = 'Tipo de Documento'
        FocusControl = DBEdit6
      end
      object btnPesq_Doc: TSpeedButton
        Left = 108
        Top = 143
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
      object Label8: TLabel
        Left = 704
        Top = 127
        Width = 70
        Height = 13
        Caption = 'Vlr. Lan'#231'to R$'
        FocusControl = DBEdit6
      end
      object Label9: TLabel
        Left = 84
        Top = 171
        Width = 59
        Height = 13
        Caption = 'Vlr. Doc. R$'
        FocusControl = DBEdit3
      end
      object Label22: TLabel
        Left = 3
        Top = 87
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCod_Banco
      end
      object Label23: TLabel
        Left = 108
        Top = 87
        Width = 89
        Height = 13
        Caption = 'Banco/Financeira'
        FocusControl = DBEdit7
      end
      object Label24: TLabel
        Left = 595
        Top = 87
        Width = 75
        Height = 13
        Caption = 'Saldo Atual R$'
        FocusControl = DBEdit8
      end
      object Label25: TLabel
        Left = 476
        Top = 87
        Width = 59
        Height = 13
        Caption = 'C'#243'd. Banco'
        FocusControl = DBEdit9
      end
      object Label26: TLabel
        Left = 695
        Top = 87
        Width = 76
        Height = 13
        Caption = 'Limite Cr'#233'd. R$'
        FocusControl = DBEdit10
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 22
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_ID'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 62
        Width = 676
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_PROVENIENTE'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 156
        Top = 187
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_VALOR_PAGO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit5: TDBEdit
        Left = 310
        Top = 187
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'VALOR_APAGAR'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object DBDateEdit1: TDBDateEdit
        Left = 684
        Top = 62
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CREC_DTA_VCTO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 3
      end
      object edtCod_Doc: TDBEdit
        Left = 3
        Top = 144
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'ACRE_GENE_ID_TIPO_PGTO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsAcertos
        ImeName = 'btnPesq_Doc'
        TabOrder = 9
        OnExit = edtCod_DocExit
        OnKeyPress = edtCod_DocKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 145
        Top = 144
        Width = 534
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'TIPO_DOC'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsAcertos
        ReadOnly = True
        TabOrder = 10
      end
      object edtValor: TRxDBCalcEdit
        Left = 684
        Top = 144
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'ACRE_VALOR_DOC'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsAcertos
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 11
        OnExit = edtValorExit
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 187
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_VALOR_DOC'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object rdBanco: TDBRadioGroup
        Left = 634
        Top = -2
        Width = 150
        Height = 45
        Caption = 'Receb. Via Banco'
        Columns = 2
        DataField = 'CREC_VIA_BANCO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ReadOnly = True
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          '1'
          '0')
      end
      object edtCod_Banco: TDBEdit
        Left = 3
        Top = 103
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CREC_CBCO_ID'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ImeName = 'btnPesq_Banco'
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 108
        Top = 103
        Width = 364
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'BANCO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 579
        Top = 103
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_SALDO_ATUAL'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 476
        Top = 103
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'COD_BANCO'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 684
        Top = 103
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_LIMITE'
        DataSource = dmBaixa_Contas_Receber_Parcial.dsContas_Receber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 312
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 462
    end
  end
end
