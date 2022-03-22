inherited fCad_Termo_Retirada: TfCad_Termo_Retirada
  Caption = 'Cadastro de Termos de Retirada'
  Constraints.MinHeight = 520
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 5
        Top = 48
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object Label3: TLabel
        Left = 109
        Top = 9
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'GENE_ID'
        DataSource = dmTermo_Retirada.dsTermosRetirada
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 64
        Width = 777
        Height = 21
        HelpContext = 1
        DataField = 'GENE_DESCR'
        DataSource = dmTermo_Retirada.dsTermosRetirada
        TabOrder = 1
      end
      object DBDateEdit1: TDBDateEdit
        Left = 109
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'GENE_DTA_CADASTRO'
        DataSource = dmTermo_Retirada.dsTermosRetirada
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 88
        Width = 777
        Height = 60
        Caption = 'Descri'#231#227'o do Item'
        TabOrder = 3
        object edtItem: TDBEdit
          Left = 5
          Top = 24
          Width = 561
          Height = 21
          HelpContext = 1
          DataField = 'GENE_DESCR'
          DataSource = dmTermo_Retirada.dsItensTermosRetirada
          TabOrder = 0
        end
        object btnAdic: TBitBtn
          Left = 572
          Top = 22
          Width = 100
          Height = 25
          Caption = 'Adicionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429132009B47089A46079A46079A46079A46079A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
            9F4E129F4E129F4E129F4E129E4E129C4C0D9C4C0D9E4E129F4E129F4E129F4E
            129F4E129F4F119D4C0CA3571CA15216A25316A25316A25316A25317A05014A1
            5214A15214A05014A25317A25316A25316A25316A15215A4581FA96229A85F22
            A85F24A85F24A85F24A75E22A86024FBFAF8FBFAF8A86024A75E22A85F24A85F
            24A85F24A75F22AB642BAC682EAB6329AB632AAB6329AA6328AA6327A86023F3
            E8DFF3E8DFA86023AA6327AA6328AB6329AB632AAB6227AC6930B17238AF6F32
            AF6F33AE6C30AE6D33AC692DAD692DF1E7DDF1E7DDAD692DAC692DAE6D33AE6C
            30AF6F33AF6F32B17339B57740B27539AF7034B77B45F9F6F3F3E9E0EFE5DCFA
            F8F4FAF8F4EFE5DCF3E9E0F9F6F3B77B45AF7034B27439B4773FBA824AB97D47
            B67940BB864FFCF9F7F5EDE4F4EBE2FBF8F5FBF8F5F4EBE2F5EDE4FCF9F7BB86
            4FB67940B97D45BA824CBC8751BA834CBB834CB98149BB824CB98047B87F45F2
            EAE1F2EAE1B87F45B98047BB824CB98149BB834CBA834BBB8752C1915BBF8D56
            C08E56C08E57BF8D56BF8C55BE8A52F5EEE7F5EEE7BE8A52BF8C55BF8D56C08E
            57C08E56BF8D56C3915BC59660C3945CC3945DC3945DC3945CC3945CC3935DFB
            FAF7FBFAF7C3935DC3945CC3945CC3945DC3945DC3945CC59762C9A16DC99F69
            C99F6AC99F6AC99F6AC9A06AC99D66C99E6BC99E6BC99D66C9A06AC99F6AC99F
            6AC99F6AC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCA
            A16ACAA16ACCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCBA46DDABE98CEA870
            D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE
            7BD1AE7BCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEC}
          ParentFont = False
          TabOrder = 1
          OnClick = btnAdicClick
        end
        object btnRet: TBitBtn
          Left = 672
          Top = 22
          Width = 100
          Height = 25
          Caption = 'Retirar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429132009B47089A46079A46079A46079A46079A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
            9F4E129F4E129F4E129F4E129E4E129F4E129F4E129F4E129F4E119E4E129F4E
            129F4E129F4F119D4C0CA3571CA15216A25316A25316A25316A15317A15317A1
            5418A25418A25218A25518A15417A25316A25316A15215A4581FA96229A85F22
            A85F24A85F24A85F24A75F23A86024A86025A85F24A85F24A85F24A85F24A85F
            24A85F24A75F22AB642BAC682EAB6329AB632AAB6329AA6328AA6428AA6328AA
            6328AA6328AA6328AA6428AA6328AB6329AB632AAB6227AC6930B17238AF6F32
            AF6F33AE6C30AF6D33AD6A2EAD6B30AD6B2FAD6B2FAD6B2FAD6B2FAF6D33AE6C
            30AF6F33AF6F32B17339B57740B27539AF7034B77B45FAF6F3F2E9E0F2E9E0F2
            E9E0F2E9E0F2E9E0F2E8E0FAF6F3B77B45AF7034B27439B4773FBA824AB97D47
            B67940BB864FFCF9F7F5EDE5F5EDE5F5EDE5F5EDE5F5EDE5F5EDE5FCF9F7BB86
            4FB67940B97D45BA824CBC8751BA834CBB834CB98149BB824CB98047B98048B9
            8048B98048B98047B98047BB824CB98149BB834CBA834BBB8752C1915BBF8D56
            C08E56C08E57BF8D56BF8D56BF8E56C08D56C08D56BF8E57BF8D55BF8D56C08E
            57C08E56BF8D56C3915BC59660C3945CC3945DC3945DC3945CC3945CC3945EC3
            945FC3945FC3945FC3955DC3945CC3945DC3945DC3945CC59762C9A16DC99F69
            C99F6AC99F6AC99F6AC99F6AC99F69C9A068C9A068C9A068C99E6AC9A06AC99F
            6AC99F6AC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCC
            A36DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCCA36DCBA46DDABE98CEA870
            D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE
            7BD1AE7BCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEC}
          ParentFont = False
          TabOrder = 2
          OnClick = btnRetClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 150
        Width = 777
        Height = 173
        Caption = 'Itens do CheckList'
        TabOrder = 4
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 773
          Height = 156
          TabStop = False
          Align = alClient
          DataSource = dmTermo_Retirada.dsItensTermosRetirada
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 5
        Top = 328
        Width = 777
        Height = 157
        Caption = 'Mensagem ao cliente'
        TabOrder = 5
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 773
          Height = 140
          HelpContext = 1
          Align = alClient
          DataField = 'GENE_PAR1'
          DataSource = dmTermo_Retirada.dsTermosRetirada
          TabOrder = 0
        end
      end
    end
  end
end
