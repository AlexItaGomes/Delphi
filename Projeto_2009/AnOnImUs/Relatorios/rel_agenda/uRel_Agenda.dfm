inherited fRel_Agenda: TfRel_Agenda
  Caption = 'fRel_Agenda'
  ExplicitTop = -134
  ExplicitWidth = 1050
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited btnNovo: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitLeft = 176
      ExplicitWidth = 0
    end
    inherited btnEditar: TSpeedButton
      Width = 0
      Visible = False
      ExplicitLeft = 1
      ExplicitWidth = 0
    end
    inherited btnExcluir: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitLeft = 1
      ExplicitWidth = 0
    end
    inherited btnImprimir: TSpeedButton
      Left = 1
      Enabled = True
      Visible = True
      ExplicitLeft = 1
    end
    inherited btnLocalizar: TSpeedButton
      Left = 176
      Width = 0
      Visible = False
      ExplicitLeft = 1
      ExplicitWidth = 0
    end
  end
  inherited gropGridPrincipal: TGroupBox
    inherited grdBasico: TDBGrid
      DataSource = nil
      OnDrawColumnCell = nil
      OnDblClick = nil
      OnTitleClick = nil
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1040
      Height = 411
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object GroupBox5: TGroupBox
        Left = 389
        Top = 0
        Width = 220
        Height = 45
        Caption = 'Dt. Agendamento/Realizado'
        TabOrder = 0
        object edtDtInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object rdStatus: TRadioGroup
        Left = 5
        Top = 156
        Width = 380
        Height = 60
        Caption = 'Status O.S.'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Agendado'
          'Confirmados'
          'Real./Pago'
          'Cancelados'
          'Lista Negra'
          'Todos')
        TabOrder = 1
      end
      inline frPesqTecnico: TfrPesquisa
        Left = 5
        Top = 0
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Profissional)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 36
            Caption = 'T'#233'cnico'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 36
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 11
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 389
        Top = 48
        Width = 220
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 3
      end
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <
      item
        DataSet = dstAcertos
        DataSetName = 'frAcertos'
      end
      item
        DataSet = dstRelatorio
        DataSetName = 'frRelAgenda'
      end>
    Variables = <
      item
        Name = ' Variaveis'
        Value = Null
      end
      item
        Name = 'Dinheiro'
        Value = ''
      end
      item
        Name = 'CartaoCred'
        Value = ''
      end
      item
        Name = 'CartaoDeb'
        Value = ''
      end
      item
        Name = 'Cheque'
        Value = ''
      end
      item
        Name = 'Carteira'
        Value = ''
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        Visible = False
        inherited Memo15: TfrxMemoView
          Left = 3.779527560000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 695.433520000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 0.377952760000000000
        Top = 374.173470000000000000
        DataSet = dstRelatorio
        DataSetName = 'frRelAgenda'
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 493.118430000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 571.488560000000000000
          Width = 71.811070000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 641.520100000000000000
          Width = 71.811070000000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 497.031493620000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 497.031493620000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 497.031493620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 497.031493620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 497.031493620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 571.488560000000000000
          Width = 143.622049690000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Left = 571.488560000000000000
          Width = 143.622049690000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Left = 571.488560000000000000
          Width = 143.622049690000000000
          Height = 30.236240000000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 571.488560000000000000
          Width = 143.622049690000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'RESUMO DO DIA')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        Condition = 'frRelAgenda."USER_NOME_COMPLETO"'
        Stretched = True
        object Shape2: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          Left = 3.779527560000000000
          Top = 3.779530000000000000
          Width = 98.267780000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional: ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 103.826840000000000000
          Top = 3.779530000000000000
          Width = 453.543600000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'USER_NOME_COMPLETO'
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frRelAgenda."USER_NOME_COMPLETO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779527560000000000
          Top = 22.456710000000000000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 52.913420000000000000
          Top = 22.456710000000000000
          Width = 487.559055120000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto/Servi'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 544.251968500000000000
          Top = 22.456710000000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 612.283860000000000000
          Top = 22.456710000000000000
          Width = 102.047244090000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 60.472406770000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        object Line5: TfrxLineView
          Left = 0.779530000000000000
          Width = 714.331170000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo16: TfrxMemoView
          Left = 502.677138500000000000
          Top = 3.559060000000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 570.708634570000000000
          Top = 3.559060000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frRelAgenda."ODIT_VLR_TOTAL">)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 502.677490000000000000
          Top = 22.456710000000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 570.708986070000000000
          Top = 22.456710000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frRelAgenda."AGEN_VLR_DESCONTO">)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 502.677490000000000000
          Top = 41.354360000000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'L'#237'quido:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 570.708986070000000000
          Top = 41.354360000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frRelAgenda."ODIT_VLR_TOTAL">)-SUM(<frRelAgenda."AGEN_VLR_' +
              'DESCONTO">)]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 17.007876460000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        Condition = 'frRelAgenda."PROD_ID"'
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354330710000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'PROD_ID'
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frRelAgenda."PROD_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 52.913422440000000000
          Width = 487.559055120000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frRelAgenda."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 544.251968500000000000
          Width = 64.251968500000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'ODIT_QTDE'
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frRelAgenda."ODIT_QTDE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 612.283464570000000000
          Width = 102.047244090000000000
          Height = 15.118110236220470000
          ShowHint = False
          DataField = 'ODIT_VLR_TOTAL'
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frRelAgenda."ODIT_VLR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 1.889763779527560000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
      end
      object Header1: TfrxHeader
        Height = 0.377952755905512000
        Top = 249.448980000000000000
        Visible = False
        Width = 718.110700000000000000
      end
      object Footer1: TfrxFooter
        Height = 128.504020000000000000
        Top = 506.457020000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 128.504020000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo22: TfrxMemoView
          Left = 472.441250000000000000
          Top = 7.559060000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dinheiro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 570.708986070000000000
          Top = 7.559060000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstAcertos
          DataSetName = 'frAcertos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Dinheiro]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 472.441250000000000000
          Top = 26.456710000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o Cr'#233'd.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 570.708986070000000000
          Top = 26.456710000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstAcertos
          DataSetName = 'frAcertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[CartaoCred]')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 472.441250000000000000
          Top = 45.354360000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o D'#233'b.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 570.708986070000000000
          Top = 45.354360000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstAcertos
          DataSetName = 'frAcertos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[CartaoDeb]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 472.441250000000000000
          Top = 64.252010000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cheque:')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 570.708986070000000000
          Top = 64.252010000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstAcertos
          DataSetName = 'frAcertos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Cheque]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 472.441250000000000000
          Top = 83.149660000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Carteira:')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 570.708986070000000000
          Top = 83.149660000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstAcertos
          DataSetName = 'frAcertos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Carteira]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 336.378170000000000000
          Top = 7.559060000000000000
          Width = 132.283488980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais por T'#237'tulo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 336.378170000000000000
          Top = 108.047310000000000000
          Width = 132.283488980000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 570.708986070000000000
          Top = 108.047310000000000000
          Width = 143.622047240000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frRelAgenda'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frRelAgenda."ODIT_VLR_TOTAL">)-SUM(<frRelAgenda."AGEN_VLR_' +
              'DESCONTO">)]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          Left = 473.441250000000000000
          Top = 103.047310000000000000
          Width = 238.110390000000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    UserName = 'frRelAgenda'
    FieldAliases.Strings = (
      'AGEN_USER_ID_ATENDENTE=AGEN_USER_ID_ATENDENTE'
      'USER_NOME_COMPLETO=USER_NOME_COMPLETO'
      'PROD_ID=PROD_ID'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'ODIT_QTDE=ODIT_QTDE'
      'ODIT_VLR_TOTAL=ODIT_VLR_TOTAL'
      'AGEN_VLR_DESCONTO=AGEN_VLR_DESCONTO')
    DataSet = dmRel_Agenda.qryRelAgenda
  end
  object dstAcertos: TfrxDBDataset
    UserName = 'frAcertos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'GENE_ID=GENE_ID'
      'AGEN_USER_ID_ATENDENTE=AGEN_USER_ID_ATENDENTE'
      'VALOR=VALOR')
    DataSet = dmRel_Agenda.qryAcertos
    BCDToCurrency = False
    Left = 984
    Top = 120
  end
end
