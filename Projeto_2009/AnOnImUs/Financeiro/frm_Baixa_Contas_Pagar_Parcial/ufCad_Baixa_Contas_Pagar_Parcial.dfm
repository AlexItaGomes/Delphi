inherited fCad_Baixa_Contas_Pagar_Parcial: TfCad_Baixa_Contas_Pagar_Parcial
  Caption = 'Lan'#231'amentos Contas Pagar Parcial'
  Constraints.MinHeight = 312
  Constraints.MinWidth = 624
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
        Left = 683
        Top = 47
        Width = 54
        Height = 13
        Caption = 'Dt. Vencto'
      end
      object Label4: TLabel
        Left = 236
        Top = 176
        Width = 62
        Height = 13
        Caption = 'Vlr. Pago R$'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 385
        Top = 176
        Width = 65
        Height = 13
        Caption = 'Vlr. Pagar R$'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 3
        Top = 132
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Doc
      end
      object Label7: TLabel
        Left = 144
        Top = 132
        Width = 101
        Height = 13
        Caption = 'Tipo de Documento'
        FocusControl = edtDocumento
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnPesq_Doc: TSpeedButton
        Left = 106
        Top = 147
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
        OnClick = btnPesq_DocClick
      end
      object Label8: TLabel
        Left = 701
        Top = 132
        Width = 70
        Height = 13
        Caption = 'Vlr. Lan'#231'to R$'
        FocusControl = edtDocumento
      end
      object Label9: TLabel
        Left = 84
        Top = 176
        Width = 59
        Height = 13
        Caption = 'Vlr. Doc. R$'
        FocusControl = DBEdit3
      end
      object Label22: TLabel
        Left = 3
        Top = 89
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCod_Banco
      end
      object Label23: TLabel
        Left = 106
        Top = 89
        Width = 89
        Height = 13
        Caption = 'Banco/Financeira'
        FocusControl = DBEdit7
      end
      object Label24: TLabel
        Left = 590
        Top = 89
        Width = 75
        Height = 13
        Caption = 'Saldo Atual R$'
        FocusControl = DBEdit8
      end
      object Label25: TLabel
        Left = 471
        Top = 89
        Width = 59
        Height = 13
        Caption = 'C'#243'd. Banco'
        FocusControl = DBEdit9
      end
      object Label26: TLabel
        Left = 692
        Top = 89
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
        DataField = 'CPAG_ID'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 62
        Width = 671
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_PROVENIENTE'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 157
        Top = 192
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_VALOR_PAGO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
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
        Left = 311
        Top = 192
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'VALOR_APAGAR'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
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
        Left = 681
        Top = 62
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CPAG_DTA_VCTO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 3
      end
      object edtCod_Doc: TDBEdit
        Left = 3
        Top = 148
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'ACPG_GENE_ID_TIPO_PGTO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsAcertos
        ImeName = 'btnPesq_Doc'
        TabOrder = 9
        OnExit = edtCod_DocExit
        OnKeyPress = edtCod_DocKeyPress
      end
      object edtDocumento: TDBEdit
        Left = 144
        Top = 148
        Width = 530
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'TIPO_DOC'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsAcertos
        ReadOnly = True
        TabOrder = 10
      end
      object edtValor: TRxDBCalcEdit
        Left = 681
        Top = 148
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'ACPG_VALOR_DOC'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsAcertos
        DisplayFormat = '###,###,##0.00'
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
        Top = 192
        Width = 150
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_VALOR_DOC'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
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
        Left = 631
        Top = -2
        Width = 150
        Height = 45
        Caption = 'Pagto via Banco'
        Columns = 2
        DataField = 'CPAG_VIA_BANCO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          '1'
          '0')
      end
      object edtCod_Banco: TDBEdit
        Left = 3
        Top = 105
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_CBCO_ID'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ImeName = 'btnPesq_Banco'
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 106
        Top = 105
        Width = 359
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'BANCO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 574
        Top = 105
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_SALDO_ATUAL'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 471
        Top = 105
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'COD_BANCO'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 681
        Top = 105
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CBCO_LIMITE'
        DataSource = dmBaixa_Contas_Pagar_Parcial.dsContas_Pagar
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
      ExplicitLeft = 463
    end
  end
  object dstRelatorio: TfrxDBDataset
    UserName = 'frDBRelatorio'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 566
    Top = 344
  end
  object frRelatorio: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 41062.811029189800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 566
    Top = 392
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 35.905506930000000000
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Top = 31.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118110236220500000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858267716540000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'www.anonimus.info')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 1.133858267716540000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        RowCount = 0
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object imgLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 4.779532440000000000
          Width = 143.622140000000000000
          Height = 98.267780000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lblFantasia: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779532440000000000
          Width = 336.378170000000000000
          Height = 15.118110236220470000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 499.897960000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 575.488560000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 645.520100000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 503.811023620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 503.811023620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 503.811023620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 503.811023620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 503.811023620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 575.488560000000000000
          Top = 25.322837090000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 575.488560000000000000
          Top = 46.110238660000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 575.488560000000000000
          Top = 66.897640240000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 575.488560000000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 336.378170000000000000
          Height = 15.118110236220470000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 336.378170000000000000
          Height = 15.118110236220470000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 87.929192440000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'T'#205'TULO DO RELAT'#211'RIO')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = -0.220470000000000000
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
end
