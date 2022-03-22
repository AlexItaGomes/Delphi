inherited fIRPF: TfIRPF
  Caption = 'fIRPF'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited btnNovo: TSpeedButton
      Width = 0
      Visible = False
      ExplicitLeft = 526
      ExplicitWidth = 0
    end
    inherited btnEditar: TSpeedButton
      Left = 1
      Width = 0
      Visible = False
      ExplicitLeft = 351
      ExplicitWidth = 0
    end
    inherited btnExcluir: TSpeedButton
      Left = 1
      Width = 0
      Visible = False
      ExplicitLeft = 176
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
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 193
      Caption = 'Espelo Declara'#231#227'o IRPF'
      ExplicitTop = 4
      ExplicitWidth = 193
    end
  end
  inherited gropGridPrincipal: TGroupBox
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
      object GroupBox1: TGroupBox
        Left = 8
        Top = 1
        Width = 166
        Height = 49
        Caption = 'Ano de Refer'#234'ncia'
        TabOrder = 0
        object cmbAnos: TComboBox
          Left = 10
          Top = 20
          Width = 145
          Height = 21
          ItemIndex = 0
          TabOrder = 0
          Text = '-- Selecione'
          Items.Strings = (
            '-- Selecione')
        end
      end
    end
  end
  inherited frRelatorio: TfrxReport
    ScriptText.Strings = (
      'procedure RazaoSocialOnAfterData(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 656
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        Height = 107.716572050000000000
        inherited Line4: TfrxLineView
          Top = 0.000000000000000000
          Visible = False
        end
        inherited Memo15: TfrxMemoView
          Left = 5.669291340000000000
          Top = 4.000000000000000000
          Width = 325.039580000000000000
          Height = 0.000000000000000000
          Memo.UTF8W = (
            'Rendimentos Tribut'#225'veis Recebidos de PJ pelo Titular')
        end
        object mmRazao: TfrxMemoView
          Left = 4.779530000000000000
          Top = 37.795275589999990000
          Width = 222.992125980000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object mmCNPJ: TfrxMemoView
          Left = 230.551181100000000000
          Top = 37.795275590551200000
          Width = 94.488191420000000000
          Height = 13.228346456692900000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 1.889763780000000000
          Top = 1.889763780000010000
          Width = 714.331170000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779527559999991000
          Width = 710.551640000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Rendimentos Tribut'#225'veis Recebidos de PJ pelo Titular')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 4.559060000000000000
          Top = 21.543307090000010000
          Width = 222.992125980000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome da Fonte Pagadora')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 230.551181100000000000
          Top = 21.543307086614190000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ da Fonte')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 328.574803150000000000
          Top = 21.543307090000010000
          Width = 93.732283464566900000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Rend. Recebidos')
          ParentFont = False
        end
        object mmRendimento: TfrxMemoView
          Left = 329.574803150000000000
          Top = 37.795275590551200000
          Width = 94.488191420000000000
          Height = 13.228346456692900000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 425.196850393701000000
          Top = 21.543307090000010000
          Width = 94.488188980000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cont. Previdenci'#225'ria')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 523.464566929134000000
          Top = 21.543307090000010000
          Width = 93.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Imp. Retido IR')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 620.598425200000000000
          Top = 21.543307090000010000
          Width = 93.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '13'#186' Sal'#225'rio')
          ParentFont = False
        end
        object mmPrevidencia: TfrxMemoView
          Left = 425.196850390000000000
          Top = 37.795275589999990000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object mmIR: TfrxMemoView
          Left = 523.464566930000000000
          Top = 37.795275589999990000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object mm13Salario: TfrxMemoView
          Left = 620.598425200000000000
          Top = 37.795275589999990000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 1.779530000000000000
          Top = 56.692949999999990000
          Width = 714.331170000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo11: TfrxMemoView
          Left = 5.669296220000000000
          Top = 58.582713780000000000
          Width = 710.551640000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Indeniza'#231#227'o por recis'#227'o de contrato de trabalho, inclusive a t'#237't' +
              'ulo de PDV, e por acidente de trabalho; e FGTS')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 6.448826220000000000
          Top = 76.346493310000000000
          Width = 222.992125980000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome da Fonte Pagadora')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 232.440947320000000000
          Top = 76.346493310000000000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ da Fonte')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 330.464569370000000000
          Top = 76.346493310000000000
          Width = 93.732283460000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object mmFonteFGTS: TfrxMemoView
          Left = 5.559060000000000000
          Top = 92.708720000000000000
          Width = 222.992125980000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object mmCNPJFGTS: TfrxMemoView
          Left = 231.330711100000000000
          Top = 92.708720000000000000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object mmValorFGTS: TfrxMemoView
          Left = 330.354333150000000000
          Top = 92.708720000000000000
          Width = 94.488191420000000000
          Height = 13.228346460000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 381.732530000000000000
        inherited Memo1: TfrxMemoView
          Top = 1.133858267716562000
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 653.858689999999900000
          Top = 1.133858267716562000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 0.000000000000000000
        Top = 321.260050000000000000
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited imgLogo: TfrxPictureView
          Top = 4.779532440000001000
        end
        inherited lblFantasia: TfrxMemoView
          Top = 3.779532440000001000
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Top = 3.779532440000001000
        end
        inherited SysMemo2: TfrxSysMemoView
          Top = 3.779530000000001000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Top = 3.779530000000001000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Top = 3.779530000000001000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Top = 46.110238659999990000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Top = 88.440947320000010000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Top = 46.110238659999990000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Top = 88.440947320000010000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Top = 37.133892439999990000
          Height = 15.118110236220500000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'DECLARA'#199#195'O IRPF')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end
