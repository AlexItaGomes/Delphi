inherited fRel_ABC_Receitas_Sintetico: TfRel_ABC_Receitas_Sintetico
  Caption = 'fRel_ABC_Receitas_Sintetico'
  ExplicitWidth = 1053
  ExplicitHeight = 832
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrepRelatorio: TQuickRep
    DataSet = dmRel_Abc_Financas.cdsRel_ABC_Receitas
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
    ReportTitle = 'Relat'#243'rio Curva ABC Sint'#233'tico'
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
      Top = 252
      Size.Values = (
        50.881410256410260000
        1900.929487179487000000)
      ExplicitTop = 252
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
      Height = 15
      Size.Values = (
        30.528846153846150000
        1900.929487179487000000)
      BandType = rbColumnHeader
      ExplicitHeight = 15
      object lbID: TQRLabel
        Left = 5
        Top = 1
        Width = 84
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          10.176282051282050000
          2.035256410256410000
          170.961538461538500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'd. Simplif.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbDescricao: TQRLabel
        Left = 96
        Top = 1
        Width = 418
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          195.384615384615400000
          2.035256410256410000
          850.737179487179500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Plano de Contas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel5: TQRLabel
        Left = 520
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1058.333333333333000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Vlr. Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 624
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1270.000000000000000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '% Rel. Cr'#233'dito'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 831
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1691.298076923077000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '% Acumulado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel8: TQRLabel
        Left = 728
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1481.666666666667000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '% Rel. D'#233'bito'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
    end
    object QRBand4: TQRBand
      Left = 49
      Top = 164
      Width = 934
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand4BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        30.528846153846150000
        1900.929487179487000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 5
        Top = 1
        Width = 84
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          10.176282051282050000
          2.035256410256410000
          170.961538461538500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Abc_Financas.cdsRel_ABC_Receitas
        DataField = 'PLCT_COD_SIMPLIFICADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 96
        Top = 1
        Width = 418
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          195.384615384615400000
          2.035256410256410000
          850.737179487179500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Abc_Financas.cdsRel_ABC_Receitas
        DataField = 'PLCT_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object QRDBText6: TQRDBText
        Left = 520
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1058.333333333333000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmRel_Abc_Financas.cdsRel_ABC_Receitas
        DataField = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 6
      end
      object lbPercDeb: TQRLabel
        Left = 728
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1481.666666666667000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0.0%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbPercCred: TQRLabel
        Left = 624
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1270.000000000000000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0.0%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbPercAcum: TQRLabel
        Left = 831
        Top = 1
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1691.298076923077000000
          2.035256410256410000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0.0%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
    end
    object QRBand5: TQRBand
      Left = 49
      Top = 179
      Width = 934
      Height = 73
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand5BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.573717948717900000
        1900.929487179487000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel12: TQRLabel
        Left = 416
        Top = 25
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          846.666666666666700000
          50.881410256410260000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total D'#233'bito:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbDeb: TQRLabel
        Left = 520
        Top = 25
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1058.333333333333000000
          50.881410256410260000
          199.455128205128200000)
        XLColumn = 0
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
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel14: TQRLabel
        Left = 416
        Top = 9
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          846.666666666666700000
          18.317307692307690000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Cr'#233'dito:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbCred: TQRLabel
        Left = 520
        Top = 9
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1058.333333333333000000
          18.317307692307690000
          199.455128205128200000)
        XLColumn = 0
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
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRLabel13: TQRLabel
        Left = 416
        Top = 49
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          846.666666666666700000
          99.727564102564100000
          199.455128205128200000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Liquido:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object lbLiq: TQRLabel
        Left = 520
        Top = 49
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          28.493589743589740000
          1058.333333333333000000
          99.727564102564100000
          199.455128205128200000)
        XLColumn = 0
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
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRShape1: TQRShape
        Left = 520
        Top = 43
        Width = 98
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.035256410256410000
          1058.333333333333000000
          87.516025641025640000
          199.455128205128200000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
end
