inherited fRel_Produtos_Servicos: TfRel_Produtos_Servicos
  Caption = 'fRel_Produtos_Servicos'
  ClientWidth = 1362
  ExplicitWidth = 1378
  ExplicitHeight = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrepRelatorio: TQuickRep
    Left = 8
    DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    ReportTitle = 'Produtos/Servi'#231'os Vendidos'
    ExplicitLeft = 8
    inherited QRBand1: TQRBand
      Size.Values = (
        202.847222222222200000
        1901.472222222222000000)
      inherited lblFantasia: TQRLabel
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          14.246794871794870000
          987.099358974359000000)
        FontSize = 6
      end
      inherited lblRazao_Social: TQRLabel
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          87.516025641025640000
          987.099358974359000000)
        FontSize = 6
      end
      inherited QRSysData2: TQRSysData
        Size.Values = (
          45.861111111111110000
          301.625000000000000000
          148.166666666666700000
          987.777777777777800000)
        FontSize = 10
      end
      inherited lblEndereco: TQRLabel
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          50.881410256410260000
          987.099358974359000000)
        FontSize = 6
      end
      inherited imgLogo: TQRImage
        Size.Values = (
          171.979166666666700000
          15.875000000000000000
          13.229166666666670000
          277.812500000000000000)
      end
      inherited QRShape1000: TQRShape
        Size.Values = (
          179.102564102564100000
          1300.528846153846000000
          14.246794871794870000
          2.035256410256410000)
      end
      inherited lbTit01: TQRLabel
        Size.Values = (
          30.528846153846150000
          1306.634615384615000000
          83.445512820512820000
          142.467948717948700000)
        FontSize = 6
      end
      inherited lbTit02: TQRLabel
        Size.Values = (
          30.528846153846150000
          1306.634615384615000000
          120.080128205128200000
          142.467948717948700000)
        FontSize = 6
      end
      inherited lbTit03: TQRLabel
        Size.Values = (
          30.528846153846150000
          1306.634615384615000000
          156.714743589743600000
          142.467948717948700000)
        FontSize = 6
      end
      inherited lbFild01: TQRLabel
        Size.Values = (
          30.528846153846150000
          1451.137820512821000000
          83.445512820512820000
          441.650641025641000000)
        FontSize = 6
      end
      inherited lbFild02: TQRLabel
        Size.Values = (
          30.528846153846150000
          1451.137820512821000000
          120.080128205128200000
          441.650641025641000000)
        FontSize = 6
      end
      inherited lbFild03: TQRLabel
        Size.Values = (
          30.528846153846150000
          1451.137820512821000000
          156.714743589743600000
          441.650641025641000000)
        FontSize = 6
      end
      inherited QRLabel1118: TQRLabel
        Size.Values = (
          30.528846153846150000
          1306.634615384615000000
          10.176282051282050000
          142.467948717948700000)
        FontSize = 6
      end
      inherited QRLabel1119: TQRLabel
        Size.Values = (
          30.528846153846150000
          1451.137820512821000000
          10.176282051282050000
          441.650641025641000000)
        FontSize = 6
      end
      inherited QRLabel1120: TQRLabel
        Size.Values = (
          30.528846153846150000
          1306.634615384615000000
          46.810897435897440000
          142.467948717948700000)
        FontSize = 6
      end
      inherited QRLabel1121: TQRLabel
        Size.Values = (
          30.528846153846150000
          1451.137820512821000000
          46.810897435897440000
          441.650641025641000000)
        FontSize = 6
      end
    end
    inherited QRBand2: TQRBand
      Top = 510
      Size.Values = (
        51.152777777777780000
        1901.472222222222000000)
      ExplicitTop = 510
      inherited QRSysData1: TQRSysData
        Size.Values = (
          34.599358974358970000
          1719.791666666667000000
          2.035256410256410000
          126.185897435897400000)
        Font.Height = -11
        FontSize = 8
      end
      inherited QRLabel1: TQRLabel
        Size.Values = (
          34.599358974358970000
          1630.240384615385000000
          2.035256410256410000
          81.410256410256410000)
        Font.Height = -11
        FontSize = 8
      end
      inherited QRLabel2: TQRLabel
        Width = 324
        Size.Values = (
          35.277777777777780000
          21.166666666666670000
          1.763888888888889000
          571.500000000000000000)
        Caption = 'www.arsistemaseconsultoria.com.br'
        Font.Height = -11
        FontSize = 8
        ExplicitWidth = 324
      end
    end
    inherited QRBand3: TQRBand
      Top = 353
      Height = 36
      Frame.Style = psDot
      BeforePrint = QRBand3BeforePrint
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1901.472222222222000000)
      ExplicitTop = 353
      ExplicitHeight = 36
      object QRDBText4: TQRDBText
        Left = 5
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ODIT_TPIT_PROD_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText7: TQRDBText
        Left = 83
        Top = 1
        Width = 255
        Height = 17
        Size.Values = (
          29.986111111111110000
          146.402777777777800000
          1.763888888888889000
          449.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'PROD_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText8: TQRDBText
        Left = 342
        Top = 1
        Width = 39
        Height = 17
        Size.Values = (
          29.986111111111110000
          603.250000000000000000
          1.763888888888889000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'PROD_UNIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText9: TQRDBText
        Left = 383
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          675.569444444444400000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'MARCA_PROD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText10: TQRDBText
        Left = 487
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          859.013888888888900000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'MODELO_PROD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText12: TQRDBText
        Left = 591
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1042.458333333333000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ODIT_VLR_UNITARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText13: TQRDBText
        Left = 670
        Top = 1
        Width = 40
        Height = 17
        Size.Values = (
          29.986111111111110000
          1181.805555555556000000
          1.763888888888889000
          70.555555555555560000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ODIT_QTDE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText14: TQRDBText
        Left = 713
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1257.652777777778000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ODIT_VLR_TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText15: TQRDBText
        Left = 790
        Top = 1
        Width = 50
        Height = 17
        Size.Values = (
          29.986111111111110000
          1393.472222222222000000
          1.763888888888889000
          88.194444444444440000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'TIPO_COMISSAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText16: TQRDBText
        Left = 842
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'PROD_COMISSAO_VEND_INTERNA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText17: TQRDBText
        Left = 920
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'PROD_COMISSAO_VEND_EXTERNO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText18: TQRDBText
        Left = 998
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'PROD_COMISSAO_VEND_BALCAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object lbInterna: TQRLabel
        Left = 842
        Top = 18
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          31.750000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbExterna: TQRLabel
        Left = 920
        Top = 18
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          31.750000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbBalcao: TQRLabel
        Left = 998
        Top = 18
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          31.750000000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
    end
    object QRGroup1: TQRGroup
      Left = 57
      Top = 172
      Width = 1078
      Height = 35
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      Color = clBtnFace
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        61.736111111111110000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsComissao_Pecas_Servicos.USER_NOME_TECNICO'
      FooterBand = QRBand4
      Master = qrepRelatorio
      ReprintOnNewPage = True
      object QRLabel3: TQRLabel
        Left = 5
        Top = 5
        Width = 107
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          8.819444444444444000
          188.736111111111100000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'T'#233'cnico:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText1: TQRDBText
        Left = 115
        Top = 5
        Width = 428
        Height = 17
        Enabled = False
        Size.Values = (
          29.986111111111110000
          202.847222222222200000
          8.819444444444444000
          754.944444444444400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'USER_NOME_TECNICO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText26: TQRDBText
        Left = 187
        Top = 6
        Width = 428
        Height = 17
        Enabled = False
        Size.Values = (
          29.986111111111110000
          329.847222222222200000
          10.583333333333330000
          754.944444444444400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ATENDENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
    end
    object QRBand4: TQRBand
      Left = 57
      Top = 441
      Width = 1078
      Height = 69
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = QRBand4BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333300000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel28: TQRLabel
        Left = 790
        Top = 1
        Width = 180
        Height = 17
        Size.Values = (
          29.986111111111110000
          1393.472222222222000000
          1.763888888888889000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Geral Interno R$:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel29: TQRLabel
        Left = 790
        Top = 18
        Width = 180
        Height = 17
        Size.Values = (
          29.986111111111110000
          1393.472222222222000000
          31.750000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Geral Externo R$:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel30: TQRLabel
        Left = 790
        Top = 36
        Width = 180
        Height = 17
        Size.Values = (
          29.986111111111110000
          1393.472222222222000000
          63.500000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Geral Interno R$:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbGeralInterno: TQRLabel
        Left = 973
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1716.263888888889000000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbGeralExterno: TQRLabel
        Left = 973
        Top = 18
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1716.263888888889000000
          31.750000000000000000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbGeralBalcao: TQRLabel
        Left = 973
        Top = 36
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1716.263888888889000000
          63.500000000000000000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel37: TQRLabel
        Left = 5
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total em OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lblTotalGeral: TQRLabel
        Left = 5
        Top = 20
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          35.277777777777780000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
    end
    object QRGroup2: TQRGroup
      Left = 57
      Top = 207
      Width = 1078
      Height = 35
      AlignToBottom = False
      Color = clBtnFace
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        61.736111111111110000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsComissao_Pecas_Servicos.ORDS_DTA_INSTALACAO'
      FooterBand = QRBand5
      Master = qrepRelatorio
      ReprintOnNewPage = False
      object QRLabel4: TQRLabel
        Left = 5
        Top = 5
        Width = 107
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          8.819444444444444000
          188.736111111111100000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Execu'#231#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 115
        Top = 5
        Width = 428
        Height = 17
        Size.Values = (
          29.986111111111110000
          202.847222222222200000
          8.819444444444444000
          754.944444444444400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ORDS_DTA_INSTALACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
    end
    object QRBand5: TQRBand
      Left = 57
      Top = 441
      Width = 1078
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object QRGroup3: TQRGroup
      Left = 57
      Top = 242
      Width = 1078
      Height = 111
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.Style = psDot
      AlignToBottom = False
      BeforePrint = QRGroup3BeforePrint
      Color = clBtnFace
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        195.791666666666700000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsComissao_Pecas_Servicos.ORDS_ID'
      FooterBand = QRBand6
      Master = qrepRelatorio
      ReprintOnNewPage = False
      object QRLabel5: TQRLabel
        Left = 5
        Top = 5
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          8.819444444444444000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nr'#186' O.S.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText3: TQRDBText
        Left = 91
        Top = 5
        Width = 245
        Height = 17
        Size.Values = (
          29.986111111111110000
          160.513888888888900000
          8.819444444444444000
          432.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ORDS_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 338
        Top = 5
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          596.194444444444400000
          8.819444444444444000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'd. Clie.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 430
        Top = 23
        Width = 168
        Height = 17
        Size.Values = (
          29.986111111111110000
          758.472222222222200000
          40.569444444444440000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ORDS_CLIE_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel8: TQRLabel
        Left = 601
        Top = 5
        Width = 63
        Height = 17
        Size.Values = (
          29.986111111111110000
          1060.097222222222000000
          8.819444444444444000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cliente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText6: TQRDBText
        Left = 675
        Top = 5
        Width = 397
        Height = 17
        Size.Values = (
          29.986111111111110000
          1190.625000000000000000
          8.819444444444444000
          700.263888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'CLIE_RAZAO_SOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 338
        Top = 22
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          596.194444444444400000
          38.805555555555560000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'd. Clie.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel9: TQRLabel
        Left = 5
        Top = 85
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          149.930555555555600000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'd. Prod.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel10: TQRLabel
        Left = 83
        Top = 85
        Width = 156
        Height = 17
        Size.Values = (
          29.986111111111110000
          146.402777777777800000
          149.930555555555600000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Produto/Servi'#231'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel11: TQRLabel
        Left = 342
        Top = 83
        Width = 39
        Height = 17
        Size.Values = (
          29.986111111111110000
          603.250000000000000000
          146.402777777777800000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Unid.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel12: TQRLabel
        Left = 383
        Top = 83
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          675.569444444444400000
          146.402777777777800000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Marca'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel13: TQRLabel
        Left = 487
        Top = 83
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          859.013888888888900000
          146.402777777777800000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Modelo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel14: TQRLabel
        Left = 5
        Top = 22
        Width = 85
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          38.805555555555560000
          149.930555555555600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tab. Pre'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText11: TQRDBText
        Left = 91
        Top = 22
        Width = 245
        Height = 17
        Size.Values = (
          29.986111111111110000
          160.513888888888900000
          38.805555555555560000
          432.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'TPRC_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel15: TQRLabel
        Left = 591
        Top = 83
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1042.458333333333000000
          146.402777777777800000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Unit.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel16: TQRLabel
        Left = 670
        Top = 83
        Width = 40
        Height = 17
        Size.Values = (
          29.986111111111110000
          1181.805555555556000000
          146.402777777777800000
          70.555555555555560000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Qtde'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 713
        Top = 83
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1257.652777777778000000
          146.402777777777800000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel18: TQRLabel
        Left = 790
        Top = 83
        Width = 50
        Height = 17
        Size.Values = (
          29.986111111111110000
          1393.472222222222000000
          146.402777777777800000
          88.194444444444440000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo C.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel19: TQRLabel
        Left = 842
        Top = 75
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          132.291666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C. Interna'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel20: TQRLabel
        Left = 920
        Top = 75
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          132.291666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C. Externa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel21: TQRLabel
        Left = 998
        Top = 75
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          132.291666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C. Balc'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel22: TQRLabel
        Left = 842
        Top = 92
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          162.277777777777800000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Inter.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel23: TQRLabel
        Left = 920
        Top = 92
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          162.277777777777800000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Exter.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel24: TQRLabel
        Left = 998
        Top = 92
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          162.277777777777800000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Balc'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel31: TQRLabel
        Left = 338
        Top = 39
        Width = 91
        Height = 17
        Size.Values = (
          29.986111111111110000
          596.194444444444400000
          68.791666666666670000
          160.513888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'd. Equip.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText19: TQRDBText
        Left = 430
        Top = 40
        Width = 168
        Height = 17
        Size.Values = (
          29.986111111111110000
          758.472222222222200000
          70.555555555555560000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'ORDS_PROD_ID_EQUIP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel32: TQRLabel
        Left = 601
        Top = 22
        Width = 62
        Height = 17
        Size.Values = (
          29.986111111111110000
          1060.097222222222000000
          38.805555555555560000
          109.361111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Equip.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText20: TQRDBText
        Left = 675
        Top = 22
        Width = 397
        Height = 17
        Size.Values = (
          29.986111111111110000
          1190.625000000000000000
          38.805555555555560000
          700.263888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'EQUIP_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel33: TQRLabel
        Left = 5
        Top = 39
        Width = 54
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          68.791666666666670000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Marca:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel34: TQRLabel
        Left = 338
        Top = 57
        Width = 60
        Height = 17
        Size.Values = (
          29.986111111111110000
          596.194444444444400000
          100.541666666666700000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Modelo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText21: TQRDBText
        Left = 91
        Top = 39
        Width = 245
        Height = 17
        Size.Values = (
          29.986111111111110000
          160.513888888888900000
          68.791666666666670000
          432.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'EQUIP_MARCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText22: TQRDBText
        Left = 430
        Top = 57
        Width = 168
        Height = 17
        Size.Values = (
          29.986111111111110000
          758.472222222222200000
          100.541666666666700000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'EQUIP_MODELO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel35: TQRLabel
        Left = 601
        Top = 39
        Width = 72
        Height = 17
        Size.Values = (
          29.986111111111110000
          1060.097222222222000000
          68.791666666666670000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fornec.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText23: TQRDBText
        Left = 675
        Top = 39
        Width = 397
        Height = 17
        Size.Values = (
          29.986111111111110000
          1190.625000000000000000
          68.791666666666670000
          700.263888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'EQUIP_FORNECEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel38: TQRLabel
        Left = 601
        Top = 57
        Width = 72
        Height = 17
        Size.Values = (
          29.986111111111110000
          1060.097222222222000000
          100.541666666666700000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Status O.S.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText24: TQRDBText
        Left = 675
        Top = 57
        Width = 397
        Height = 17
        Size.Values = (
          29.986111111111110000
          1190.625000000000000000
          100.541666666666700000
          700.263888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'STATUS_OS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRLabel39: TQRLabel
        Left = 5
        Top = 57
        Width = 54
        Height = 17
        Size.Values = (
          29.986111111111110000
          8.819444444444444000
          100.541666666666700000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Filtro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText25: TQRDBText
        Left = 91
        Top = 57
        Width = 245
        Height = 17
        Size.Values = (
          29.986111111111110000
          160.513888888888900000
          100.541666666666700000
          432.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Ordem_Servico.cdsComissao_Pecas_Servicos
        DataField = 'FILTRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
    end
    object QRBand6: TQRBand
      Left = 57
      Top = 389
      Width = 1078
      Height = 52
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = QRBand6BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        91.722222222222220000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel25: TQRLabel
        Left = 842
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Inter.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel26: TQRLabel
        Left = 920
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Exter.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel27: TQRLabel
        Left = 998
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          1.763888888888889000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Balc'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbTotInterno: TQRLabel
        Left = 842
        Top = 20
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1485.194444444444000000
          35.277777777777780000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbTotExterno: TQRLabel
        Left = 920
        Top = 20
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1622.777777777778000000
          35.277777777777780000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbTotBalcao: TQRLabel
        Left = 998
        Top = 20
        Width = 75
        Height = 17
        Size.Values = (
          29.986111111111110000
          1760.361111111111000000
          35.277777777777780000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel36: TQRLabel
        Left = 688
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1213.555555555556000000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. da OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lblTotalOS: TQRLabel
        Left = 688
        Top = 20
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1213.555555555556000000
          35.277777777777780000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel40: TQRLabel
        Left = 584
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1030.111111111111000000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Desconto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lblDesconto: TQRLabel
        Left = 584
        Top = 20
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          1030.111111111111000000
          35.277777777777780000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Left = 480
        Top = 1
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          846.666666666666700000
          1.763888888888889000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. da OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lblTotal: TQRLabel
        Left = 480
        Top = 20
        Width = 100
        Height = 17
        Size.Values = (
          29.986111111111110000
          846.666666666666700000
          35.277777777777780000
          176.388888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
    end
  end
end
