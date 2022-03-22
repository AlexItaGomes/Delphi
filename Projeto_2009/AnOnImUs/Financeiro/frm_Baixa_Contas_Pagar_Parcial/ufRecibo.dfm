object fRecibo: TfRecibo
  Left = 0
  Top = 0
  Caption = 'fRecibo'
  ClientHeight = 497
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object QrRecibo: TQuickRep
    Left = 3
    Top = 2
    Width = 794
    Height = 1123
    BeforePrint = QrReciboBeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      10.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      35.000000000000000000
      35.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 13
      Top = 19
      Width = 768
      Height = 325
      Frame.Color = clSilver
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        859.895833333333300000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape2: TQRShape
        Left = 0
        Top = 0
        Width = 759
        Height = 322
        Size.Values = (
          851.958333333333300000
          0.000000000000000000
          0.000000000000000000
          2008.187500000000000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 4
        Top = 4
        Width = 751
        Height = 314
        Size.Values = (
          830.791666666666700000
          10.583333333333330000
          10.583333333333330000
          1987.020833333333000000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lblEmpRazao: TQRLabel
        Left = 9
        Top = 7
        Width = 283
        Height = 21
        Size.Values = (
          55.562500000000000000
          23.812500000000000000
          18.520833333333330000
          748.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CHAMA AZUL ASSISTENCIA TECNICA LTDA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object lblCNPJ: TQRLabel
        Left = 9
        Top = 27
        Width = 276
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          71.437500000000000000
          730.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ: 04.401.003/0001-98 Insc. Est.: 10.340.841-0'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblEndereco: TQRLabel
        Left = 9
        Top = 44
        Width = 249
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          116.416666666666700000
          658.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rua Araguari QD 19 LT 18, Jardim Guanabara'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblCEP: TQRLabel
        Left = 9
        Top = 61
        Width = 167
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          161.395833333333300000
          441.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP: 74.815-020, Goi'#226'nia - GO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblValor: TQRLabel
        Left = 636
        Top = 31
        Width = 115
        Height = 24
        Size.Values = (
          63.500000000000000000
          1682.750000000000000000
          82.020833333333330000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '750,00'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel7: TQRLabel
        Left = 17
        Top = 125
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          330.729166666666700000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recebi(emos) de :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 12
        Top = 148
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          391.583333333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A Import'#226'ncia de :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 48
        Top = 171
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          452.437500000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Referente '#224':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 246
        Top = 257
        Width = 283
        Height = 20
        Size.Values = (
          52.916666666666670000
          650.875000000000000000
          679.979166666666700000
          748.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '_______________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblFavorecidoI: TQRLabel
        Left = 246
        Top = 274
        Width = 283
        Height = 17
        Size.Values = (
          44.979166666666670000
          650.875000000000000000
          724.958333333333300000
          748.770833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ALEX ITAMAR GOMES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblFavorecido: TQRLabel
        Left = 118
        Top = 125
        Width = 496
        Height = 17
        Size.Values = (
          44.979166666666670000
          312.208333333333300000
          330.729166666666700000
          1312.333333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CHAMA AZUL ASSISTENCIA TECNICA LTDA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblValorExtenso: TQRLabel
        Left = 118
        Top = 148
        Width = 496
        Height = 17
        Size.Values = (
          44.979166666666670000
          312.208333333333300000
          391.583333333333300000
          1312.333333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '750,00 (SETECENTOS E CINQUENTA REAIS)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 569
        Top = 89
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          235.479166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CPF/CNPJ:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblCPFCNPJFavorecido: TQRLabel
        Left = 625
        Top = 89
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          1653.645833333333000000
          235.479166666666700000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '04.401.003/0001-98'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblReferente: TQRLabel
        Left = 118
        Top = 171
        Width = 496
        Height = 17
        Size.Values = (
          44.979166666666670000
          312.208333333333300000
          452.437500000000000000
          1312.333333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'SALARIO REF.: AGOSTO/2015'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 12
        Top = 195
        Width = 249
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          515.937500000000000000
          658.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'e para maior clareza firmo(amos) o presente.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblCidadeData: TQRLabel
        Left = 554
        Top = 187
        Width = 195
        Height = 17
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          494.770833333333300000
          515.937500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Goi'#226'nia - GO, 30 de agosto de 2015'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lblCPFCNPJFavorecidoI: TQRLabel
        Left = 246
        Top = 290
        Width = 283
        Height = 17
        Size.Values = (
          44.979166666666670000
          650.875000000000000000
          767.291666666666700000
          748.770833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CPF/CNPJ: 00.000.000/0000-00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 567
        Top = 31
        Width = 68
        Height = 24
        Size.Values = (
          63.500000000000000000
          1500.187500000000000000
          82.020833333333330000
          179.916666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Valor R$'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 10
        Top = 89
        Width = 741
        Height = 30
        Size.Values = (
          79.375000000000000000
          26.458333333333330000
          235.479166666666700000
          1960.562500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'RECIBO'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
      object lblReciboNr: TQRLabel
        Left = 636
        Top = 6
        Width = 115
        Height = 24
        Size.Values = (
          63.500000000000000000
          1682.750000000000000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0005241'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel1: TQRLabel
        Left = 601
        Top = 6
        Width = 34
        Height = 24
        Size.Values = (
          63.500000000000000000
          1590.145833333333000000
          15.875000000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Nr'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
    end
  end
end
