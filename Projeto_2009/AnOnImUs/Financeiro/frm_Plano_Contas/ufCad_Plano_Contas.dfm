inherited fCad_Plano_Contas: TfCad_Plano_Contas
  Caption = 'Cadastro Plano de Contas'
  Constraints.MinHeight = 257
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 108
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label3: TLabel
        Left = 3
        Top = 48
        Width = 74
        Height = 13
        Caption = '&C'#243'd. Simplif.'
        FocusControl = edtCod_Simp
      end
      object Label4: TLabel
        Left = 109
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtPlano
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        Color = clGradientInactiveCaption
        DataField = 'PLCT_ID'
        DataSource = dmPlano_Contas.dsPlano_Contas
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'PLCT_DTA_CADASTRO'
        DataSource = dmPlano_Contas.dsPlano_Contas
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtCod_Simp: TDBEdit
        Left = 3
        Top = 64
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'PLCT_COD_SIMPLIFICADO'
        DataSource = dmPlano_Contas.dsPlano_Contas
        TabOrder = 4
      end
      object edtPlano: TDBEdit
        Left = 109
        Top = 64
        Width = 675
        Height = 21
        HelpContext = 1
        DataField = 'PLCT_DESCRICAO'
        DataSource = dmPlano_Contas.dsPlano_Contas
        TabOrder = 5
      end
      object rdTipo: TDBRadioGroup
        Left = 479
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Tipo'
        Columns = 2
        DataField = 'PLCT_TIPO'
        DataSource = dmPlano_Contas.dsPlano_Contas
        Items.Strings = (
          'D'#233'bito'
          'Cr'#233'dito')
        TabOrder = 2
        Values.Strings = (
          'D'
          'C')
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 634
        Top = 0
        Width = 150
        Height = 45
        Caption = 'Ativo'
        Columns = 2
        DataField = 'PLCT_ATIVO'
        DataSource = dmPlano_Contas.dsPlano_Contas
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 91
        Width = 781
        Height = 72
        Caption = '&Hierarquia'
        ParentBackground = False
        TabOrder = 6
        object Label5: TLabel
          Left = 7
          Top = 16
          Width = 67
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCod_Hier
        end
        object Label6: TLabel
          Left = 145
          Top = 16
          Width = 74
          Height = 13
          Caption = 'C'#243'd. Simplif.'
          FocusControl = edtCodSimplif
        end
        object Label7: TLabel
          Left = 249
          Top = 16
          Width = 93
          Height = 13
          Caption = 'Plano de Contas'
          FocusControl = DBEdit6
        end
        object btnPesq: TSpeedButton
          Left = 108
          Top = 30
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
          OnClick = btnPesqClick
        end
        object edtCod_Hier: TDBEdit
          Left = 7
          Top = 31
          Width = 100
          Height = 21
          DataField = 'PLCT_PLCT_ID'
          DataSource = dmPlano_Contas.dsPlano_Contas
          ImeName = 'btnPesq'
          TabOrder = 0
          OnExit = edtCod_HierExit
          OnKeyPress = edtCod_HierKeyPress
        end
        object edtCodSimplif: TDBEdit
          Left = 145
          Top = 31
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PLCT_COD_SIMPLIFICADO_1'
          DataSource = dmPlano_Contas.dsPlano_Contas
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 249
          Top = 31
          Width = 527
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'PLCT_DESCRICAO_1'
          DataSource = dmPlano_Contas.dsPlano_Contas
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 275
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 425
    end
  end
end
