inherited fCad_Plano_Contas_Planejamento: TfCad_Plano_Contas_Planejamento
  Caption = 'Planejamento Anual'
  Constraints.MinWidth = 650
  ExplicitTop = -40
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel [0]
    Left = 2
    Top = 89
    Width = 36
    Height = 13
    Caption = 'Janeiro'
  end
  object Label10: TLabel [1]
    Left = 98
    Top = 89
    Width = 48
    Height = 13
    Caption = 'Fevereiro'
  end
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 2
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 211
        Top = 8
        Width = 21
        Height = 13
        Caption = 'Ano'
      end
      object Label3: TLabel
        Left = 106
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 2
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PCPJ_ID'
        DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 106
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'PCPJ_DTA_CADASTRO'
        DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 477
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Conciliado'
        Columns = 2
        DataField = 'PCPJ_CONCILIADO'
        DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ReadOnly = True
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
      end
      object cmbAno: TDBComboBox
        Left = 211
        Top = 24
        Width = 150
        Height = 21
        Style = csDropDownList
        DataField = 'PCPJ_ANO'
        DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 113
        Width = 190
        Height = 123
        Caption = '&Janeiro'
        TabOrder = 6
        object lbAtual01: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx01: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt01: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic1: TSpeedButton
          Left = 164
          Top = 83
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic1Click
        end
        object GroupBox15: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrJan: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_01'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
            OnExit = edtVlrJanExit
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 198
        Top = 113
        Width = 190
        Height = 123
        Caption = '&Fevereiro'
        TabOrder = 7
        object lbAtual02: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx02: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt02: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic2: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic2Click
        end
        object GroupBox16: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrFev: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_02'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 395
        Top = 113
        Width = 190
        Height = 123
        Caption = '&Mar'#231'o'
        TabOrder = 8
        object lbAtual03: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx03: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt03: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic3: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic3Click
        end
        object GroupBox17: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrMar: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_03'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 592
        Top = 113
        Width = 190
        Height = 123
        Caption = 'A&bril'
        TabOrder = 9
        object lbAtual04: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx04: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt04: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic4: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic4Click
        end
        object GroupBox18: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrAbr: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_04'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 238
        Width = 190
        Height = 123
        Caption = 'Ma&io'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object lbAtual05: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lbProx05: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt05: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label61: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic5: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic5Click
        end
        object GroupBox22: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object edtVlrMai: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_05'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 198
        Top = 238
        Width = 190
        Height = 123
        Caption = '&Junho'
        TabOrder = 11
        object lbAtual06: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx06: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt06: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic6: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic6Click
        end
        object GroupBox21: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrJun: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_06'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 395
        Top = 238
        Width = 190
        Height = 123
        Caption = 'Ju&lho'
        TabOrder = 12
        object lbAtual07: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label67: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx07: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt07: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label71: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic7: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic7Click
        end
        object GroupBox20: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrJul: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_07'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox8: TGroupBox
        Left = 592
        Top = 237
        Width = 190
        Height = 123
        Caption = 'A&gosto'
        TabOrder = 13
        object lbAtual08: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label72: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx08: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label74: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt08: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic8: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic8Click
        end
        object GroupBox19: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrAgo: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_08'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox9: TGroupBox
        Left = 2
        Top = 362
        Width = 190
        Height = 123
        Caption = '&Setembro'
        TabOrder = 14
        object lbAtual09: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx09: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt09: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic9: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic9Click
        end
        object GroupBox23: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrSet: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_09'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox10: TGroupBox
        Left = 198
        Top = 362
        Width = 190
        Height = 123
        Caption = 'Ou&tubro'
        TabOrder = 15
        object lbAtual10: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label77: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx10: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt10: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic10: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic10Click
        end
        object GroupBox24: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrOut: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_10'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox11: TGroupBox
        Left = 395
        Top = 362
        Width = 190
        Height = 123
        Caption = '&Novembro'
        TabOrder = 16
        object lbAtual11: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx11: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label84: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt11: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label86: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic11: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic11Click
        end
        object GroupBox25: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrNov: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_11'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox12: TGroupBox
        Left = 592
        Top = 362
        Width = 190
        Height = 123
        Caption = '&Dezembro'
        TabOrder = 17
        object lbAtual12: TLabel
          Left = 67
          Top = 84
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label87: TLabel
          Left = 5
          Top = 84
          Width = 50
          Height = 13
          Caption = 'Vlr. Atual:'
        end
        object lbProx12: TLabel
          Left = 67
          Top = 105
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label89: TLabel
          Left = 5
          Top = 105
          Width = 48
          Height = 13
          Caption = 'Vlr. Prox.:'
        end
        object lbAnt12: TLabel
          Left = 67
          Top = 64
          Width = 95
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label91: TLabel
          Left = 5
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Vlr. Ant.:'
        end
        object btnAplic12: TSpeedButton
          Left = 164
          Top = 80
          Width = 23
          Height = 22
          Hint = 'Aplicar este valor.'
          Caption = '<<'
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAplic12Click
        end
        object GroupBox26: TGroupBox
          Left = 2
          Top = 15
          Width = 186
          Height = 46
          Align = alTop
          Caption = 'Vlr. Planejado'
          TabOrder = 0
          object edtVlrDez: TRxDBCalcEdit
            Left = 5
            Top = 18
            Width = 175
            Height = 21
            HelpContext = 1
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'PCPJ_MES_12'
            DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
            DisplayFormat = '##,###,###0.00'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GroupBox13: TGroupBox
        Left = 2
        Top = 49
        Width = 780
        Height = 62
        Caption = 'Plano Contas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label4: TLabel
          Left = 5
          Top = 16
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCodPlano
        end
        object Label5: TLabel
          Left = 183
          Top = 16
          Width = 65
          Height = 13
          Caption = 'C'#243'd. Simplif.'
          FocusControl = DBEdit4
        end
        object Label6: TLabel
          Left = 289
          Top = 16
          Width = 84
          Height = 13
          Caption = 'Plano de Contas'
          FocusControl = DBEdit5
        end
        object btnPesq: TSpeedButton
          Left = 106
          Top = 31
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
          OnClick = btnPesqClick
        end
        object SpeedButton1: TSpeedButton
          Left = 144
          Top = 31
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D4A0B9D49
            0B983F00B17449EAE5E0AF70429132009B4809973E008C2C008E2E008D2E008E
            2E008E2E008E2E008E2E008C2C00973E009B4809913100B3774E9D4C0E9F4F12
            9B4808AF6E3CE1C9B6DFC5B2E0C6B3DDC1ACD7B79FDCC3ADE0C6B3E1C9B6AF6E
            3C9B48089F4F129D4C0CA3571CA253179B4705C4936CF9F4F1C79A76C79C78DA
            BDA6FFFFFFCEA889C18E65F9F6F2C4936C9B4705A25316A4581FA96229A85F23
            A15313C79B76E6D2C19943009B4602B97F4DFFFFFFFFFFFF984400E1C9B5C79B
            77A15313A85F22AB642BAC682EAB632AA5581AC99E78EAD9CAA45818A55A1CBF
            8C60FFFFFFFFFFFFF3E9E0F6F1EBC79971A5591AAB6328AC6930B17238AF7033
            A96524CCA580EBDBCCA86223AA6727C3946AFFFFFFF9F4F0FAF6F2FFFFFFC69B
            72AA6625AF6F33B17339B57740B27539AC6B2BCEA783EBDCCEAC672AB17338B3
            753EBB834FB87F4AB3763BEDE0D4CEA581AC6B2BB27539B4773FBA824AB97D47
            B37539D2AD8AEDDFD2B27335B97D47B87D45B77B42B77B43B17031EDDED0D2AD
            8AB37539B97D45BA824CBC8751BB834DB67B3FD3B18DEEE0D3B47A3DBB834DBB
            834DBB834DBB834DB47A3DEEE0D3D3B18DB67B3FBB834BBB8752C1915BC08E56
            BC864AD7B894EFE4D6BA8549C08E57C08E56C08E56C08E57BA8549EFE4D6D7B8
            94BC864ABF8E56C3915BC59660C3955DC08D51D9BB99EEE2D2BA8444C08D54C0
            8D53C08D53C08D54BA8444EEE2D2D9BB99C08D51C3945CC59762C9A16DC9A06A
            C4985EDDC19FFBF8F4DDC2A1E0C7A8E0C7A8E0C7A8E0C7A8DDC2A1FBF8F4DDC1
            9FC4985EC9A06ACAA26DCBA26DCCA36ECA9E67D5B58AF0E5D7F0E4D5F0E4D5F0
            E4D5F0E4D5F0E4D5F0E4D5F0E5D7D5B58ACA9E67CCA36ECBA46DDABE98CEA870
            D1AE7CCFAA74CAA065CAA166CAA166CAA166CAA166CAA166CAA166CAA065CFAA
            74D1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B583D5B583D5B583D5
            B583D5B583D5B583D5B583D5B583D5B582D4B27DDBC197F1EEEC}
          OnClick = SpeedButton1Click
        end
        object edtCodPlano: TDBEdit
          Left = 5
          Top = 32
          Width = 100
          Height = 21
          HelpContext = 1
          DataField = 'PCPJ_PLCT_ID'
          DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
          ImeName = 'btnPesq;SpeedButton1'
          TabOrder = 0
          OnExit = edtCodPlanoExit
          OnKeyPress = edtCodPlanoKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 183
          Top = 32
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PLCT_COD_SIMPLIFICADO'
          DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 289
          Top = 32
          Width = 486
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PLCT_DESCRICAO'
          DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
          ReadOnly = True
          TabOrder = 2
        end
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 632
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Tipo de Plano'
        Columns = 2
        DataField = 'PCPJ_TIPO_PLANO'
        DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
        Items.Strings = (
          'Fixo'
          'Vari'#225'vel')
        ReadOnly = True
        TabOrder = 4
        Values.Strings = (
          '1'
          '0')
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Observa'#231#245'es'
      ImageIndex = 1
      object GroupBox14: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 225
        Align = alTop
        Caption = 'Observa'#231#245'es'
        TabOrder = 0
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 782
          Height = 208
          Align = alClient
          DataField = 'PCPJ_OBS'
          DataSource = dmPlano_Contas_Planejamento.dsPlano_Conta_Planejamento
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 339
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 489
    end
  end
end
