inherited fGraf_Contas_Receber_Pagar: TfGraf_Contas_Receber_Pagar
  Caption = 'fGraf_Contas_Receber_Pagar'
  ExplicitWidth = 1050
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Align = alNone
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    Height = 110
    ExplicitHeight = 110
    inherited btnHelp: TSpeedButton
      Height = 108
      ExplicitHeight = 108
    end
    inherited Label1: TLabel
      Width = 273
      Caption = 'Gr'#225'fico Contas Receber X Contas Pagar'
      ExplicitWidth = 273
    end
    inherited btnFecharRotina: TSpeedButton
      Height = 108
      ExplicitHeight = 108
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 42
      Width = 252
      Height = 60
      Caption = '&Selecione o Ano'
      TabOrder = 0
      object cmbAno: TComboBox
        Left = 7
        Top = 31
        Width = 100
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = cmbAnoKeyPress
      end
      object btnFiltrar: TBitBtn
        Left = 144
        Top = 17
        Width = 100
        Height = 35
        Caption = '&Filtrar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
          B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
          0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
          FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
          9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
          0A963B00984103DCC7B9AF7041963C009C47089B47089B47089A44069A43049A
          43049A43049A43049A43049A43049A43049A43049A43049A43049A43049A4304
          9A44069B47089B47089C4708953A00B57B509F50159E4C0F9E4E119E4D119D4C
          0FA05215A55920A2571DA3571DA3571DA3571DA3571DA3571DA3571DA3571DA3
          571DA2571DA55920A052159D4C0F9E4D119E4E119E4C0FA05014A3571DA05114
          A15215A152159B4808C69976F6F0EBF5EDE7F5EEE8F5EDE8F5EDE8F5EDE8F5ED
          E8F5EDE8F5EDE8F5EEE8F5EDE7F6F0EBC699769B4808A15215A15215A05113A4
          591EA55B21A35518A35519A3551A9C4A0AD1AD8FFFFFFFCFA88AD0AA8CD0AC8D
          D0AB8DD0AB8DD0AB8DD0AB8DD0AC8DD0AA8CCFA88AFFFFFFD1AD8F9C4A0AA355
          1AA35519A25418A65D25A9622AA75D20A75E22A75E22A25311D5B094F1E5DE9B
          47039E4A089E4C0B9E4C0A9E4C0A9E4C0A9E4C0A9E4C0B9E4A089B4703F1E5DE
          D5B094A25311A75E22A75E22A75D1FAB642CAC672EA96126AA6127AA6227A357
          17D6B396F3EBE3A65D20A96025AA6228AA6227AA6227AA6227AA6227AA6228A9
          6025A65D20F3EBE3D6B396A35717AA6227AA6127A96125AC6831AE6C33AC662B
          AC662CAC662CA65C1DD7B498F4ECE4A96124AC6429AC662CAC662CAC662CAC66
          2CAC662CAC662CAC6429A96124F4ECE4D7B498A65C1DAC662CAC662CAC662AAE
          6D36B17239AF6D31AF6E31AF6E32A96324D7B89BF4EDE5AB682BAE6B2FAF6E32
          AF6E31AF6E32AF6E32AF6E31AF6E32AE6B2FAB682BF4EDE5D7B89BA96324AF6E
          32AF6E31AF6D31B1733AB4773FB17237B17238B17238AC6829D9BA9FF4EDE6AE
          6D30B07035B17238B17238B17238B07237B17238B17238B07035AE6D30F4EDE6
          D9BA9FAC6829B17238B17238B17136B4783FB77B45B4763CB4773CB4773DB06D
          2FD9BDA2F5EDE7B17235B4753AB4773DB27438AB6424AD6928B27338B4773DB4
          753AB17235F5EDE7D9BDA2B06D2FB4773DB4773DB4763BB67B44BA824AB87C44
          B87C45B87C45B37337DCC0A4F4EDE5B37338B77C42B37538B9814BEEE1D5F1E8
          E0B97F47B4763CB77B41B37438F5EDE6DCC0A3B37337B87C45B87C45B87C43BA
          824DBC8750BA8049BA814ABA814AB6783DDCC0A4F9F4F0C39261B5793DC7996C
          F2E8DFFFFFFFFFFFFFEBDBCCBE8854B97F45BE8953F6F1EBDCC0A5B6783DBA81
          4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FB87E42E0C8B0FFFFFFF6
          F0EBB67A3CF1E7DDFCFAF8FAF8F5F1E6DDFFFFFFD3B18DC89B6DFCFCFAFFFFFF
          E0C6ACB87E42BC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BE8A
          52C59562CEA77FCBA275B98144DBBE9FC29360F9F4F0D7B795C99E6ED1AB84C2
          905CDBBD9EDCC2A5CAA174BD8950BF8C54BF8C54BF8B54C3915CC4965FC2925A
          C2925BC2925BC2925BC09056BE8B50BF8D54C19059C08D54C4955FFCFAF7DFC7
          ABBC874AC2915AC18F56BD884DBD884BC08D53C2925BC2925BC2925BC2925AC5
          9762C69965C5965FC5975FC5975FC5975FC59760C59660C59760C59760C39359
          C89B68FCFAF7E0C9ACC18E53C5965FC59760C59760C59760C5965FC59760C597
          5FC5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E68C89E68C89E68C8
          9E68C89E68C69B63CAA26FFDFCFAE4CEB4C5955CC89E68C89E68C89E68C89E68
          C89E68C89E68C89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
          6CCBA26CCBA26CCBA26CCBA26CC99F69CEA674F6EEE6E1CAACC79C64CBA26CCB
          A26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCAA16BCDA573CDA773CDA570
          CDA570CDA570CDA570CDA570CDA570CDA570CDA670CDA570CDA670D1AD7DCEA8
          76CCA56FCDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CD
          A975D9BD96CFA972D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AD79
          D0AC78D0AB76D0AC77D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC
          79D0AD79CEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
          B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
          D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
          84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
          B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
        ParentFont = False
        TabOrder = 1
        OnClick = btnFiltrarClick
        OnKeyPress = cmbAnoKeyPress
      end
    end
    object rdTipo: TRadioGroup
      Left = 262
      Top = 42
      Width = 252
      Height = 60
      Caption = '&Tipo de Dados'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Concretizado'
        'Previs'#227'o')
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Top = 110
    Height = 412
    ExplicitTop = 110
    ExplicitHeight = 412
    inherited grdBasico: TDBGrid
      Height = 395
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1040
      Height = 395
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        1040
        395)
      object Panel2: TPanel
        Left = 50
        Top = 0
        Width = 939
        Height = 396
        Anchors = []
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 112
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 112
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 269
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 269
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 426
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 426
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 583
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 583
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 740
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 740
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label16: TLabel
          Left = 897
          Top = 153
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 897
          Top = 168
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label18: TLabel
          Left = 112
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 112
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label20: TLabel
          Left = 269
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 269
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label22: TLabel
          Left = 426
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 426
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label24: TLabel
          Left = 583
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 583
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label26: TLabel
          Left = 740
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 740
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label28: TLabel
          Left = 897
          Top = 345
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 897
          Top = 360
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object chartJaneiro: TChart
          Left = 7
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Janeiro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            28
            15
            28
            15)
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object Series2: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartFevereiro: TChart
          Left = 164
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Fevereiro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 1
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries1: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries2: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartMarco: TChart
          Left = 321
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Mar'#231'o')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 2
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries3: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries4: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartAbril: TChart
          Left = 478
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Abril')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 3
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries5: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries6: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartMaio: TChart
          Left = 635
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Maio')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 4
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries7: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries8: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartJunho: TChart
          Left = 792
          Top = -3
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Junho')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 5
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries9: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries10: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartJulho: TChart
          Left = 8
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Julho')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 6
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries11: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries12: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartAgosto: TChart
          Left = 164
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Agosto')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 7
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries13: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries14: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartSetembro: TChart
          Left = 321
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Setembro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 8
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries15: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries16: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartOutubro: TChart
          Left = 478
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Outubro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 9
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries17: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries18: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartNovembro: TChart
          Left = 635
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Novembro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 10
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries19: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries20: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
        object chartDezembro: TChart
          Left = 792
          Top = 189
          Width = 130
          Height = 150
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Dezembro')
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.Visible = False
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.LabelsFormat.TextAlignment = taCenter
          RightAxis.Visible = False
          TopAxis.LabelsFormat.TextAlignment = taCenter
          Zoom.Pen.Mode = pmNotXor
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 11
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object BarSeries21: TBarSeries
            BarBrush.Gradient.EndColor = clBlue
            BarBrush.Gradient.Visible = True
            Marks.Font.Color = clBlue
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            SeriesColor = clBlue
            Title = 'C. Receber'
            BarStyle = bsRectGradient
            Gradient.EndColor = clBlue
            Gradient.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000407F40}
          end
          object BarSeries22: TBarSeries
            Marks.Font.Color = clRed
            Marks.Font.Style = [fsBold]
            Marks.Transparent = True
            Marks.Visible = False
            Marks.Style = smsValue
            Title = 'C. Pagar'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000387340}
          end
        end
      end
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        inherited Memo15: TfrxMemoView
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'T'#205'TULO DO RELAT'#211'RIO')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end
