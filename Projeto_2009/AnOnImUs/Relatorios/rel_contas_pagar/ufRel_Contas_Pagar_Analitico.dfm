inherited fRel_Contas_Pagar_Analitico: TfRel_Contas_Pagar_Analitico
  Caption = 'fRel_Contas_Pagar_Analitico'
  ExplicitWidth = 1122
  ExplicitHeight = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrepRelatorio: TQuickRep
    Left = -3
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
    ReportTitle = 'Relat'#243'rio Anal'#237'tico Contas a Pagar'
    ExplicitLeft = -3
    inherited QRBand1: TQRBand
      Height = 114
      Size.Values = (
        201.083333333333300000
        1901.472222222222000000)
      ExplicitHeight = 114
      inherited lblFantasia: TQRLabel
        Width = 563
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          14.246794871794870000
          993.205128205128200000)
        FontSize = 6
        ExplicitWidth = 563
      end
      inherited lblRazao_Social: TQRLabel
        Width = 563
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          87.516025641025640000
          993.205128205128200000)
        FontSize = 6
        ExplicitWidth = 563
      end
      inherited QRSysData2: TQRSysData
        Left = 9
        Width = 725
        Size.Values = (
          45.861111111111110000
          15.875000000000000000
          148.166666666666700000
          1278.819444444444000000)
        FontSize = 10
        ExplicitLeft = 9
        ExplicitWidth = 725
      end
      inherited lblEndereco: TQRLabel
        Width = 563
        Size.Values = (
          30.528846153846150000
          301.217948717948700000
          50.881410256410260000
          993.205128205128200000)
        FontSize = 6
        ExplicitWidth = 563
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
      Top = 415
      Size.Values = (
        51.152777777777780000
        1901.472222222222000000)
      ExplicitTop = 415
      inherited QRSysData1: TQRSysData
        Height = 21
        Size.Values = (
          37.041666666666670000
          1719.791666666667000000
          2.645833333333333000
          127.000000000000000000)
        Font.Height = -11
        FontSize = 8
        ExplicitHeight = 21
      end
      inherited QRLabel1: TQRLabel
        Height = 21
        Size.Values = (
          37.041666666666670000
          1629.833333333333000000
          2.645833333333333000
          82.020833333333330000)
        Font.Height = -11
        FontSize = 8
        ExplicitHeight = 21
      end
      inherited QRLabel2: TQRLabel
        Height = 21
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          2.645833333333333000
          296.333333333333300000)
        Font.Height = -11
        FontSize = 8
        ExplicitHeight = 21
      end
    end
    inherited QRBand3: TQRBand
      Top = 171
      Height = 227
      BeforePrint = QRBand3BeforePrint
      Size.Values = (
        400.402777777777800000
        1901.472222222222000000)
      BandType = rbGroupHeader
      ExplicitTop = 171
      ExplicitHeight = 227
      object QRLabel3: TQRLabel
        Left = 6
        Top = 1
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          2.035256410256410000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nr'#186' Reg.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel4: TQRLabel
        Left = 227
        Top = 1
        Width = 84
        Height = 17
        Size.Values = (
          30.528846153846150000
          400.945512820512800000
          2.035256410256410000
          148.573717948717900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Cadastro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel5: TQRLabel
        Left = 814
        Top = 1
        Width = 61
        Height = 17
        Size.Values = (
          29.986111111111110000
          1435.805555555556000000
          1.763888888888889000
          107.597222222222200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Status:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 6
        Top = 20
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          34.599358974358970000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nr'#186' Doc.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 227
        Top = 20
        Width = 84
        Height = 17
        Size.Values = (
          30.528846153846150000
          400.945512820512800000
          34.599358974358970000
          148.573717948717900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Prov'#234'niente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel8: TQRLabel
        Left = 6
        Top = 75
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          132.291666666666700000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fornecedor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel9: TQRLabel
        Left = 6
        Top = 93
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          164.855769230769200000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Plano de Contas:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel10: TQRLabel
        Left = 6
        Top = 38
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          67.163461538461540000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Emiss'#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel11: TQRLabel
        Left = 227
        Top = 38
        Width = 84
        Height = 17
        Size.Values = (
          30.528846153846150000
          400.945512820512800000
          67.163461538461540000
          148.573717948717900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Vencto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel12: TQRLabel
        Left = 441
        Top = 38
        Width = 69
        Height = 17
        Size.Values = (
          29.986111111111110000
          777.875000000000000000
          67.027777777777780000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Pagto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel13: TQRLabel
        Left = 638
        Top = 38
        Width = 61
        Height = 17
        Size.Values = (
          29.986111111111110000
          1125.361111111111000000
          67.027777777777780000
          107.597222222222200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Canc.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel14: TQRLabel
        Left = 6
        Top = 57
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          99.727564102564100000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Doc.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel15: TQRLabel
        Left = 638
        Top = 57
        Width = 61
        Height = 17
        Size.Values = (
          29.986111111111110000
          1125.361111111111000000
          100.541666666666700000
          107.597222222222200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Pago:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel16: TQRLabel
        Left = 227
        Top = 57
        Width = 84
        Height = 17
        Size.Values = (
          30.528846153846150000
          400.945512820512800000
          99.727564102564100000
          148.573717948717900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Juro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 441
        Top = 57
        Width = 69
        Height = 17
        Size.Values = (
          29.986111111111110000
          777.875000000000000000
          100.541666666666700000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Mora:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel18: TQRLabel
        Left = 6
        Top = 114
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          201.490384615384600000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo de Doc.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel19: TQRLabel
        Left = 6
        Top = 133
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          234.054487179487200000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Observa'#231#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 114
        Top = 1
        Width = 111
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          2.035256410256410000
          195.384615384615400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_ID'
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
      object QRDBText6: TQRDBText
        Left = 114
        Top = 20
        Width = 111
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          34.599358974358970000
          195.384615384615400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_NR_DOC'
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
        Left = 114
        Top = 38
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          201.083333333333300000
          67.027777777777780000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_EMISSAO'
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
        Left = 114
        Top = 57
        Width = 111
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          99.727564102564100000
          195.384615384615400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_VALOR_DOC'
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
        Left = 114
        Top = 75
        Width = 468
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          132.291666666666700000
          826.314102564102600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'FORN_NOME_FANTASIA'
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
        Left = 114
        Top = 93
        Width = 468
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          164.855769230769200000
          826.314102564102600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'PLCT_DESCRICAO'
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
      object QRDBText11: TQRDBText
        Left = 114
        Top = 114
        Width = 468
        Height = 17
        Size.Values = (
          30.528846153846150000
          201.490384615384600000
          201.490384615384600000
          826.314102564102600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'TIPO_DOC'
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
        Left = 313
        Top = 1
        Width = 111
        Height = 17
        Size.Values = (
          30.528846153846150000
          551.554487179487200000
          2.035256410256410000
          195.384615384615400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_CADASTRO'
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
        Left = 313
        Top = 20
        Width = 547
        Height = 17
        Size.Values = (
          30.528846153846150000
          551.554487179487200000
          34.599358974358970000
          964.711538461538500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_PROVENIENTE'
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
        Left = 313
        Top = 38
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          552.097222222222200000
          67.027777777777780000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_VCTO'
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
        Left = 313
        Top = 57
        Width = 111
        Height = 17
        Size.Values = (
          30.528846153846150000
          551.554487179487200000
          99.727564102564100000
          195.384615384615400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_VALOR_JUROS'
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
        Left = 514
        Top = 57
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          906.638888888888900000
          100.541666666666700000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_VALOR_MORA'
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
        Left = 514
        Top = 38
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          906.638888888888900000
          67.027777777777780000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_PGTO'
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
        Left = 701
        Top = 38
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          1236.486111111111000000
          67.027777777777780000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_CANC'
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
      object QRDBText19: TQRDBText
        Left = 701
        Top = 57
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          1236.486111111111000000
          100.541666666666700000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_VALOR_PAGO'
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
      object QRDBText20: TQRDBText
        Left = 902
        Top = 1
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          1591.027777777778000000
          1.763888888888889000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'STATUS'
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
      object TQRDBText
        Left = 6
        Top = 151
        Width = 1057
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          266.618589743589700000
          1864.294871794872000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_OBS'
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
      object QRLabel20: TQRLabel
        Left = 6
        Top = 188
        Width = 106
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          331.746794871794900000
          187.243589743589700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Acertos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel21: TQRLabel
        Left = 6
        Top = 208
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          366.346153846153800000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nr'#186' Reg.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel22: TQRLabel
        Left = 80
        Top = 208
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          140.432692307692300000
          366.346153846153800000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo Pagto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel23: TQRLabel
        Left = 209
        Top = 208
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          368.381410256410300000
          366.346153846153800000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr. Lanc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel24: TQRLabel
        Left = 283
        Top = 208
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          498.637820512820500000
          366.346153846153800000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Lanc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel25: TQRLabel
        Left = 814
        Top = 38
        Width = 85
        Height = 17
        Size.Values = (
          29.986111111111110000
          1435.805555555556000000
          67.027777777777780000
          149.930555555555600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dt. Efetiva'#231#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText21: TQRDBText
        Left = 902
        Top = 38
        Width = 111
        Height = 17
        Size.Values = (
          29.986111111111110000
          1591.027777777778000000
          67.027777777777780000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsRel_Contas_Pagar
        DataField = 'CPAG_DTA_EFETIVO'
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 57
      Top = 398
      Width = 1078
      Height = 17
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        29.986111111111110000
        1901.472222222222000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrepRelatorio
      DataSet = dmRel_Contas_Pagar.cdsAcertos
      HeaderBand = QRBand3
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 6
        Top = 1
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          2.035256410256410000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsAcertos
        DataField = 'ACPG_ID'
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
      object QRDBText2: TQRDBText
        Left = 80
        Top = 1
        Width = 122
        Height = 17
        Size.Values = (
          30.528846153846150000
          140.432692307692300000
          2.035256410256410000
          215.737179487179500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsAcertos
        DataField = 'GENE_DESCR'
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
      object QRDBText3: TQRDBText
        Left = 209
        Top = 1
        Width = 72
        Height = 17
        Size.Values = (
          29.986111111111110000
          368.652777777777800000
          1.763888888888889000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsAcertos
        DataField = 'ACPG_VALOR_DOC'
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
      object QRDBText4: TQRDBText
        Left = 283
        Top = 1
        Width = 69
        Height = 17
        Size.Values = (
          30.528846153846150000
          498.637820512820500000
          2.035256410256410000
          122.115384615384600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = dmRel_Contas_Pagar.cdsAcertos
        DataField = 'ACPG_DTA_CADASTRO'
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
    end
  end
end
