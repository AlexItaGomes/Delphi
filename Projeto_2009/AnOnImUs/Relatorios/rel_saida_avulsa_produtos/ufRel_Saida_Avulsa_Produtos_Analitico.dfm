inherited fRel_Saida_Avulsa_Prod_Analitico: TfRel_Saida_Avulsa_Prod_Analitico
  Caption = 'fRel_Saida_Avulsa_Prod_Analitico'
  ExplicitWidth = 1045
  ExplicitHeight = 828
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrepRelatorio: TQuickRep
    Left = -3
    DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
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
    ReportTitle = 'Relat'#243'rio Sa'#237'da Avulsa de Produtos'
    ExplicitLeft = -3
    inherited QRBand1: TQRBand
      Size.Values = (
        203.525641025641000000
        1900.929487179487000000)
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
          44.775641025641030000
          301.217948717948700000
          148.573717948717900000
          987.099358974359000000)
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
      Top = 366
      Size.Values = (
        50.881410256410260000
        1900.929487179487000000)
      ExplicitTop = 366
      inherited QRSysData1: TQRSysData
        Size.Values = (
          34.599358974358970000
          1719.791666666667000000
          2.035256410256410000
          126.185897435897400000)
        FontSize = 8
      end
      inherited QRLabel1: TQRLabel
        Size.Values = (
          34.599358974358970000
          1630.240384615385000000
          2.035256410256410000
          81.410256410256410000)
        FontSize = 8
      end
      inherited QRLabel2: TQRLabel
        Size.Values = (
          34.599358974358970000
          20.352564102564100000
          2.035256410256410000
          297.147435897435900000)
        FontSize = 8
      end
    end
    inherited QRBand3: TQRBand
      Height = 150
      BeforePrint = QRBand3BeforePrint
      Size.Values = (
        305.288461538461500000
        1900.929487179487000000)
      ExplicitHeight = 150
      object QRShape1: TQRShape
        Left = 2
        Top = 112
        Width = 931
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          77.339743589743590000
          4.070512820512821000
          227.948717948717900000
          1894.823717948718000000)
        Brush.Color = clGradientInactiveCaption
        Pen.Style = psClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 3
        Top = 3
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          6.105769230769231000
          6.105769230769231000
          187.243589743589700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nr'#186' Registro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel4: TQRLabel
        Left = 214
        Top = 3
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          435.544871794871800000
          6.105769230769231000
          234.054487179487200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nr'#186' Documento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel5: TQRLabel
        Left = 590
        Top = 3
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1200.801282051282000000
          6.105769230769231000
          187.243589743589700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Dt. Cadastro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 3
        Top = 24
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          6.105769230769231000
          48.846153846153850000
          187.243589743589700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Status:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 3
        Top = 45
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          6.105769230769231000
          91.586538461538460000
          187.243589743589700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Obs.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText1: TQRDBText
        Left = 98
        Top = 3
        Width = 110
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          199.455128205128200000
          6.105769230769231000
          223.878205128205100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
        DataField = 'SAAV_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 335
        Top = 3
        Width = 110
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          681.810897435897400000
          6.105769230769231000
          223.878205128205100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
        DataField = 'SAAV_NR_DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText3: TQRDBText
        Left = 688
        Top = 3
        Width = 110
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1400.256410256410000000
          6.105769230769231000
          223.878205128205100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
        DataField = 'SAAV_DTA_CADASTRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText4: TQRDBText
        Left = 98
        Top = 24
        Width = 110
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          199.455128205128200000
          48.846153846153850000
          223.878205128205100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
        DataField = 'SAAV_CONCILIADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 98
        Top = 45
        Width = 697
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          199.455128205128200000
          91.586538461538460000
          1418.573717948718000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa
        DataField = 'SAAV_OBS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel8: TQRLabel
        Left = 3
        Top = 114
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          6.105769230769231000
          232.019230769230800000
          286.971153846153800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Itens do Registro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 3
        Top = 134
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          6.105769230769231000
          272.724358974359000000
          140.432692307692300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'd. Prod.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel18: TQRLabel
        Left = 76
        Top = 134
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          154.679487179487200000
          272.724358974359000000
          154.679487179487200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel19: TQRLabel
        Left = 344
        Top = 134
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          700.128205128205100000
          272.724358974359000000
          91.586538461538460000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Unid.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel20: TQRLabel
        Left = 393
        Top = 134
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          799.855769230769200000
          272.724358974359000000
          91.586538461538460000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Grupo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel21: TQRLabel
        Left = 511
        Top = 134
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1040.016025641026000000
          272.724358974359000000
          91.586538461538460000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Marca'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel22: TQRLabel
        Left = 628
        Top = 134
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1278.141025641026000000
          272.724358974359000000
          91.586538461538460000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Modelo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel23: TQRLabel
        Left = 749
        Top = 134
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1524.407051282051000000
          272.724358974359000000
          154.679487179487200000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 49
      Top = 299
      Width = 934
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        30.528846153846150000
        1900.929487179487000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrepRelatorio
      DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText13: TQRDBText
        Left = 5
        Top = 1
        Width = 69
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          10.176282051282050000
          2.035256410256410000
          140.432692307692300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'SAIT_PROD_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText15: TQRDBText
        Left = 78
        Top = 1
        Width = 264
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          158.750000000000000000
          2.035256410256410000
          537.307692307692300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'PROD_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText16: TQRDBText
        Left = 346
        Top = 1
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          704.198717948717900000
          2.035256410256410000
          91.586538461538460000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'PROD_UNIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText17: TQRDBText
        Left = 395
        Top = 1
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          803.926282051282100000
          2.035256410256410000
          234.054487179487200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'GRUPO_PROD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText18: TQRDBText
        Left = 513
        Top = 1
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1044.086538461538000000
          2.035256410256410000
          234.054487179487200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'MARCA_PROD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText19: TQRDBText
        Left = 630
        Top = 1
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1282.211538461538000000
          2.035256410256410000
          234.054487179487200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'MODELO_PROD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText20: TQRDBText
        Left = 751
        Top = 1
        Width = 74
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1528.477564102564000000
          2.035256410256410000
          150.608974358974400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Saida_Avulsa_Produtos.cdsItensSaidaAvulsa
        DataField = 'SAIT_QTDE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand1: TQRChildBand
      Left = 49
      Top = 314
      Width = 934
      Height = 52
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1900.929487179487000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRSubDetail1
      object QRLabel9: TQRLabel
        Left = 751
        Top = 6
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1528.477564102564000000
          12.211538461538460000
          154.679487179487200000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde Mov.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object lbTotal: TQRLabel
        Left = 751
        Top = 22
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.528846153846150000
          1528.477564102564000000
          44.775641025641030000
          154.679487179487200000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
    end
  end
end
