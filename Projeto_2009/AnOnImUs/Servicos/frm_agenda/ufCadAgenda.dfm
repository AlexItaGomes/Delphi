inherited fCadAgenda: TfCadAgenda
  Caption = 'Agenda'
  ClientHeight = 602
  Font.Name = 'Segoe UI'
  Font.Style = []
  ExplicitWidth = 800
  ExplicitHeight = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 547
    ExplicitHeight = 547
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 519
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 107
        Top = 6
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 22
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'AGEN_ID'
        DataSource = dmAgenda.dsAgenda
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 22
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'AGEN_DTA_CADASTRO'
        DataSource = dmAgenda.dsAgenda
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object rdStatus: TDBRadioGroup
        Left = 213
        Top = 0
        Width = 573
        Height = 45
        Caption = 'Status'
        Columns = 6
        DataField = 'AGEN_STATUS'
        DataSource = dmAgenda.dsAgenda
        Items.Strings = (
          'Aberto'
          'Confirmado'
          'Fechado'
          'Cancelado'
          'Bloqueado'
          'Lista Negra')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'A'
          'O'
          'F'
          'C'
          'B'
          'L')
      end
      object group1: TGroupBox
        Left = 0
        Top = 47
        Width = 786
        Height = 229
        Align = alBottom
        Caption = 'Agenda'
        TabOrder = 3
        object Label3: TLabel
          Left = 5
          Top = 16
          Width = 81
          Height = 13
          Caption = 'Data Agendado'
        end
        object Label4: TLabel
          Left = 129
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Hor'#225'rio'
        end
        object Label6: TLabel
          Left = 5
          Top = 187
          Width = 39
          Height = 13
          Caption = 'Reserva'
        end
        object Label8: TLabel
          Left = 673
          Top = 187
          Width = 44
          Height = 13
          Caption = 'Telefone'
        end
        object btnInserir: TSpeedButton
          Left = 738
          Top = 161
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9C480A9C480B9C480B9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429132009B47089A46079A46079943039742019A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
            9F4E129F4E139D4C0EA55C24AB64309A47079F4F149F4F129F4F139F4E129F4E
            129F4E129F4F119D4C0CA3571CA15216A25316A25418974100AF703EF6EFE997
            41019946059E4C0D9E4B0D9E4C0EA25418A25316A15215A4581FA96229A85F22
            A75F23A35515BB8354E4CEBBFFFFFFFFFFFFBC865ABC8456BC8558BF8A5CA155
            15A85F23A85F22AB642BAC682EAB632AA65C1EBA7F4EFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB97F4EA65C1EAB6328AC6930B17238AF7033
            AA6526C4976DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC497
            6DAA6526AF6F33B17339B57740B27539AE6C2EC6986EFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC6986EAE6C2EB27539B4773FBA824AB97D47
            B4753BC9A075FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9A0
            75B4753BB97D45BA824CBC8751BB834DB77B41CCA37BFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCCA37BB77B41BB834BBB8752C1915BC08E56
            BC864BCFAB82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAB
            82BC864BBF8E56C3915BC59660C3955DC08D53D3B089FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFD3B089C08D53C3955CC59762C9A16DC9A06A
            C69A60D2B289FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B2
            89C69A60C9A06ACAA26DCBA26DCCA36DCBA26DC89E64DFC8A9DDC5A4DDC5A3DD
            C5A3DDC5A3DDC5A3DDC5A4DFC8AAC89E64CBA26DCCA36DCBA36DDABE98CEA870
            D1AE7BD1AE7BCEA870CEA76FCEA76FCEA76FCEA76FCEA76FCEA76FCEA870D1AE
            7BD1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEB}
          OnClick = btnInserirClick
        end
        object SpeedButton1: TSpeedButton
          Left = 704
          Top = 161
          Width = 35
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000E9E4DFB1744A
            983F009D490B9C480A9C480B9C480B9C480A9C480A9C480A9C480A9C480A9D49
            0B983F00B17449EAE5E0AF70429132009B47089A46079A46079943039742019A
            46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9F4F12
            9F4E129F4E139D4C0EA55C24AB64309A47079F4F149F4F129F4F139F4E129F4E
            129F4E129F4F119D4C0CA3571CA15216A25316A25418974100AF703EF6EFE997
            41019946059E4C0D9E4B0D9E4C0EA25418A25316A15215A4581FA96229A85F22
            A75F23A35515BB8354E4CEBBFFFFFFFFFFFFBC865ABC8456BC8558BF8A5CA155
            15A85F23A85F22AB642BAC682EAB632AA65C1EBA7F4EFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB97F4EA65C1EAB6328AC6930B17238AF7033
            AA6526C4976DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC497
            6DAA6526AF6F33B17339B57740B27539AE6C2EC6986EFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC6986EAE6C2EB27539B4773FBA824AB97D47
            B4753BC9A075FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9A0
            75B4753BB97D45BA824CBC8751BB834DB77B41CCA37BFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCCA37BB77B41BB834BBB8752C1915BC08E56
            BC864BCFAB82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAB
            82BC864BBF8E56C3915BC59660C3955DC08D53D3B089FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFD3B089C08D53C3955CC59762C9A16DC9A06A
            C69A60D2B289FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B2
            89C69A60C9A06ACAA26DCBA26DCCA36DCBA26DC89E64DFC8A9DDC5A4DDC5A3DD
            C5A3DDC5A3DDC5A3DDC5A4DFC8AAC89E64CBA26DCCA36DCBA36DDABE98CEA870
            D1AE7BD1AE7BCEA870CEA76FCEA76FCEA76FCEA76FCEA76FCEA76FCEA870D1AE
            7BD1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
            B582D5B582D5B582D5B582D5B582D5B582D4B27DDBC197F1EEEB}
          OnClick = SpeedButton1Click
        end
        object edtHorario: TDBEdit
          Left = 129
          Top = 33
          Width = 120
          Height = 21
          DataField = 'AGEN_HORA'
          DataSource = dmAgenda.dsAgenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edtDtaAgenda: TDBDateEdit
          Left = 5
          Top = 33
          Width = 120
          Height = 21
          Margins.Left = 5
          Margins.Top = 1
          DataField = 'AGEN_DATA'
          DataSource = dmAgenda.dsAgenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        inline frPesqCliente: TfrPesqIndividual
          Left = 2
          Top = 144
          Width = 704
          Height = 43
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ExplicitLeft = 2
          ExplicitTop = 144
          ExplicitWidth = 704
          ExplicitHeight = 43
          inherited Label2: TLabel
            Left = 176
            Width = 36
            Caption = 'Cliente'
            ExplicitLeft = 176
            ExplicitWidth = 36
          end
          inherited btnPesquisar: TSpeedButton
            Left = 106
            OnClick = frPesqClientebtnPesquisarClick
            ExplicitLeft = 106
          end
          inherited btnInserir: TSpeedButton
            Left = 140
            ExplicitLeft = 140
          end
          inherited Label3: TLabel
            Left = 1021
            ExplicitLeft = 1021
          end
          inherited Label4: TLabel
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
            OnExit = frPesqClienteedtCodigoExit
          end
          inherited edtDescricao: TEdit
            Left = 176
            Width = 526
            ExplicitLeft = 176
            ExplicitWidth = 526
          end
          inherited rdOpcoes: TRadioGroup
            Top = 46
            ItemIndex = 0
            ExplicitTop = 46
          end
          inherited ckOmitir: TCheckBox
            Left = 922
            ExplicitLeft = 922
          end
          inherited edtOpcao: TEdit
            Left = 1021
            TabOrder = 0
            ExplicitLeft = 1021
          end
          inherited edtOpcao1: TEdit
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
        inline frPesqAtendente: TfrPesqIndividual
          Left = 2
          Top = 100
          Width = 782
          Height = 43
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 2
          ExplicitTop = 100
          ExplicitWidth = 782
          ExplicitHeight = 43
          inherited Label2: TLabel
            Left = 176
            Width = 60
            Caption = 'Profissional'
            ExplicitLeft = 176
            ExplicitWidth = 60
          end
          inherited btnPesquisar: TSpeedButton
            Left = 106
            ExplicitLeft = 106
          end
          inherited btnInserir: TSpeedButton
            Left = 140
            ExplicitLeft = 140
          end
          inherited Label3: TLabel
            Left = 1021
            ExplicitLeft = 1021
          end
          inherited Label4: TLabel
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
          end
          inherited edtDescricao: TEdit
            Left = 176
            Width = 595
            ExplicitLeft = 176
            ExplicitWidth = 595
          end
          inherited rdOpcoes: TRadioGroup
            Left = -259
            Top = 29
            ItemIndex = 11
            ExplicitLeft = -259
            ExplicitTop = 29
          end
          inherited ckOmitir: TCheckBox
            Left = 922
            ExplicitLeft = 922
          end
          inherited edtOpcao: TEdit
            Left = 1021
            TabOrder = 0
            ExplicitLeft = 1021
          end
          inherited edtOpcao1: TEdit
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
        inline frPesqTabPrecos: TfrPesqIndividual
          Left = 2
          Top = 58
          Width = 782
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 2
          ExplicitTop = 58
          ExplicitWidth = 782
          ExplicitHeight = 42
          inherited Label2: TLabel
            Width = 80
            Caption = 'Tabela de Pre'#231'o'
            ExplicitWidth = 80
          end
          inherited Label3: TLabel
            Left = 973
            ExplicitLeft = 973
          end
          inherited Label4: TLabel
            Left = 1050
            ExplicitLeft = 1050
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
          end
          inherited edtDescricao: TEdit
            Left = 176
            Width = 595
            ExplicitLeft = 176
            ExplicitWidth = 595
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 9
          end
          inherited ckOmitir: TCheckBox
            Left = 874
            ExplicitLeft = 874
          end
          inherited edtOpcao: TEdit
            Left = 973
            TabOrder = 0
            ExplicitLeft = 973
          end
          inherited edtOpcao1: TEdit
            Left = 1050
            ExplicitLeft = 1050
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
        object edtReserva: TDBEdit
          Left = 5
          Top = 202
          Width = 665
          Height = 21
          DataField = 'AGEN_CLIENTE'
          DataSource = dmAgenda.dsAgenda
          TabOrder = 5
        end
        object edtTelefone: TDBEdit
          Left = 673
          Top = 202
          Width = 100
          Height = 21
          DataField = 'AGEN_TELEFONE'
          DataSource = dmAgenda.dsAgenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnExit = edtTelefoneExit
        end
        object GroupBox7: TGroupBox
          Left = 318
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Nr'#186' Agendas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object lblAgendas: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox8: TGroupBox
          Left = 394
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Abertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          object lblAbertos: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox9: TGroupBox
          Left = 470
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Confirmados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          object lblConfirmados: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox10: TGroupBox
          Left = 546
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Fechados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object lblFechados: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox11: TGroupBox
          Left = 622
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Cancelados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object lblCancelados: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox12: TGroupBox
          Left = 698
          Top = 9
          Width = 75
          Height = 45
          Caption = 'Lista Negra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          object lblListaNegra: TLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 32
            Caption = '00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object group2: TGroupBox
        Left = 0
        Top = 276
        Width = 786
        Height = 208
        Align = alBottom
        Caption = 'Produtos/Servi'#231'os'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object GroupBox6: TGroupBox
          Left = 2
          Top = 15
          Width = 782
          Height = 48
          Align = alTop
          TabOrder = 0
          object Label26: TLabel
            Left = 6
            Top = 5
            Width = 67
            Height = 13
            Caption = 'C'#243'digo (F5)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            OnClick = Label26Click
            OnMouseMove = Label26MouseMove
            OnMouseLeave = Label26MouseLeave
          end
          object btnPesqProd: TSpeedButton
            Left = 108
            Top = 19
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
            OnClick = btnPesqProdClick
          end
          object Label27: TLabel
            Left = 182
            Top = 6
            Width = 92
            Height = 13
            Caption = 'Produto/Servi'#231'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            OnClick = Label26Click
            OnMouseMove = Label26MouseMove
            OnMouseLeave = Label26MouseLeave
          end
          object Label15: TLabel
            Left = 516
            Top = -13
            Width = 32
            Height = 13
            Caption = 'Marca'
          end
          object Label28: TLabel
            Left = 556
            Top = 5
            Width = 48
            Height = 13
            Caption = 'Vlr. Unit.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 474
            Top = 5
            Width = 27
            Height = 13
            Caption = 'Qtde'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton5: TSpeedButton
            Left = 144
            Top = 19
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
            OnClick = SpeedButton5Click
          end
          object edtCodProd: TDBEdit
            Left = 6
            Top = 20
            Width = 100
            Height = 21
            HelpContext = 1
            DataField = 'ODIT_TPIT_PROD_ID'
            DataSource = dmAgenda.dsOrdemServicoItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ImeName = 'btnPesqProd;SpeedButton5'
            ParentFont = False
            TabOrder = 0
            OnExit = edtCodProdExit
            OnKeyPress = edtCodProdKeyPress
          end
          object DBEdit16: TDBEdit
            Left = 182
            Top = 20
            Width = 214
            Height = 21
            TabStop = False
            Color = clGradientInactiveCaption
            DataField = 'PROD_DESCRICAO'
            DataSource = dmAgenda.dsOrdemServicoItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object btnAdic: TBitBtn
            Left = 609
            Top = 18
            Width = 85
            Height = 25
            Caption = 'Adicionar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
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
            TabOrder = 4
            OnClick = btnAdicClick
            OnEnter = btnAdicEnter
          end
          object btnRet: TBitBtn
            Left = 694
            Top = 18
            Width = 85
            Height = 25
            Caption = 'Retirar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
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
            TabOrder = 5
            TabStop = False
            OnClick = btnRetClick
          end
          object edtVlrUnit: TRxDBCalcEdit
            Left = 506
            Top = 20
            Width = 100
            Height = 21
            HelpContext = 1
            Margins.Left = 5
            Margins.Top = 1
            DataField = 'ODIT_VLR_UNITARIO'
            DataSource = dmAgenda.dsOrdemServicoItens
            DisplayFormat = '###,###,##0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ButtonWidth = 0
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 3
            OnEnter = edtVlrUnitEnter
          end
          object edtQtde: TRxDBCalcEdit
            Left = 401
            Top = 20
            Width = 100
            Height = 21
            HelpContext = 1
            Margins.Left = 5
            Margins.Top = 1
            DataField = 'ODIT_QTDE'
            DataSource = dmAgenda.dsOrdemServicoItens
            DisplayFormat = '###,###,##0.0000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ButtonWidth = 0
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 2
            OnEnter = edtQtdeEnter
            OnKeyPress = edtQtdeKeyPress
          end
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 63
          Width = 782
          Height = 143
          TabStop = False
          Align = alClient
          DataSource = dmAgenda.dsOrdemServicoItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnEnter = DBGrid1Enter
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 484
        Width = 786
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        object Label7: TLabel
          Left = 653
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 480
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Desconto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 684
          Top = 12
          Width = 100
          Height = 21
          HelpContext = 1
          Margins.Left = 5
          Margins.Top = 1
          TabStop = False
          DataField = 'AGEN_VLR_TOTAL'
          DataSource = dmAgenda.dsAgenda
          ReadOnly = True
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ButtonWidth = 0
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnEnter = edtQtdeEnter
          OnKeyPress = edtQtdeKeyPress
        end
        object edtDesconto: TDBEdit
          Left = 532
          Top = 12
          Width = 100
          Height = 21
          TabStop = False
          DataField = 'AGEN_VLR_DESCONTO'
          DataSource = dmAgenda.dsAgenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Observa'#231#245'es'
      ImageIndex = 1
      OnHide = TabSheet1Hide
      OnShow = TabSheet1Show
      object Label5: TLabel
        Left = 3
        Top = 324
        Width = 65
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label22: TLabel
        Left = 3
        Top = 419
        Width = 177
        Height = 13
        Caption = 'Observa'#231#245'es (Cad. Cliente)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo1: TDBMemo
        Left = 3
        Top = 339
        Width = 780
        Height = 75
        DataField = 'AGEN_OBS'
        DataSource = dmAgenda.dsAgenda
        ScrollBars = ssVertical
        TabOrder = 1
        OnEnter = DBMemo1Enter
        OnExit = DBMemo1Exit
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 321
        Align = alTop
        Caption = 'Hist'#243'rico de Anamnese'
        TabOrder = 0
        object Label9: TLabel
          Left = 595
          Top = 17
          Width = 25
          Height = 13
          Caption = 'Tipo:'
        end
        object Label10: TLabel
          Left = 595
          Top = 40
          Width = 25
          Height = 13
          Caption = 'Tipo:'
        end
        object ckGlaucoma: TCheckBox
          Left = 10
          Top = 15
          Width = 92
          Height = 17
          Caption = 'Glaucoma'
          TabOrder = 0
        end
        object ckDepressao: TCheckBox
          Left = 10
          Top = 38
          Width = 92
          Height = 17
          Caption = 'Depress'#227'o'
          TabOrder = 1
        end
        object ckEpilepsia: TCheckBox
          Left = 10
          Top = 62
          Width = 92
          Height = 17
          Caption = 'Epilepsia'
          TabOrder = 2
        end
        object ckMarcaPasso: TCheckBox
          Left = 10
          Top = 86
          Width = 92
          Height = 17
          Caption = 'Marca-Passo'
          TabOrder = 3
        end
        object ckHipertensao: TCheckBox
          Left = 155
          Top = 15
          Width = 92
          Height = 17
          Caption = 'Hipertens'#227'o'
          TabOrder = 4
        end
        object ckHepatite: TCheckBox
          Left = 522
          Top = 15
          Width = 69
          Height = 17
          Caption = 'Hepatite'
          TabOrder = 11
          OnClick = ckHepatiteClick
        end
        object ckDiabetes: TCheckBox
          Left = 522
          Top = 38
          Width = 69
          Height = 17
          Caption = 'Diabetes'
          TabOrder = 13
          OnClick = ckDiabetesClick
        end
        object ckCancer: TCheckBox
          Left = 155
          Top = 38
          Width = 179
          Height = 17
          Caption = 'C'#226'ncer'
          TabOrder = 5
        end
        object ckHIV: TCheckBox
          Left = 155
          Top = 62
          Width = 179
          Height = 17
          Caption = 'HIV'
          TabOrder = 6
        end
        object ckAlcoolizado: TCheckBox
          Left = 155
          Top = 86
          Width = 179
          Height = 17
          Caption = 'Esta Alcoolizada(o)'
          TabOrder = 7
        end
        object ckGravida: TCheckBox
          Left = 337
          Top = 15
          Width = 179
          Height = 17
          Caption = 'Esta Gr'#225'vida'
          TabOrder = 8
        end
        object ckAlergia: TCheckBox
          Left = 337
          Top = 38
          Width = 179
          Height = 17
          Caption = 'Alergia a Metais/Pigmentos'
          TabOrder = 9
        end
        object ckProblemaPele: TCheckBox
          Left = 337
          Top = 62
          Width = 179
          Height = 17
          Caption = 'Problemas de Pele'
          TabOrder = 10
        end
        object edtTipoHepatite: TEdit
          Left = 628
          Top = 13
          Width = 155
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 12
        end
        object edtTipoDiabetes: TEdit
          Left = 628
          Top = 36
          Width = 155
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 14
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 111
          Width = 782
          Height = 208
          Align = alBottom
          Caption = 'Anestesia'
          TabOrder = 15
          object Label11: TLabel
            Left = 10
            Top = 85
            Width = 18
            Height = 13
            Caption = 'Cor'
          end
          object Label12: TLabel
            Left = 232
            Top = 85
            Width = 31
            Height = 13
            Caption = 'Marca'
          end
          object Label13: TLabel
            Left = 454
            Top = 85
            Width = 22
            Height = 13
            Caption = 'Lote'
          end
          object lbTempoAnestesia: TLabel
            Left = 367
            Top = 59
            Width = 96
            Height = 13
            Caption = 'Tempo para Efeito:'
          end
          object Label16: TLabel
            Left = 10
            Top = 125
            Width = 18
            Height = 13
            Caption = 'Cor'
          end
          object Label17: TLabel
            Left = 232
            Top = 125
            Width = 31
            Height = 13
            Caption = 'Marca'
          end
          object Label18: TLabel
            Left = 454
            Top = 125
            Width = 22
            Height = 13
            Caption = 'Lote'
          end
          object Label19: TLabel
            Left = 10
            Top = 165
            Width = 18
            Height = 13
            Caption = 'Cor'
          end
          object Label20: TLabel
            Left = 232
            Top = 165
            Width = 31
            Height = 13
            Caption = 'Marca'
          end
          object Label21: TLabel
            Left = 454
            Top = 165
            Width = 22
            Height = 13
            Caption = 'Lote'
          end
          object DBEdit4: TDBEdit
            Left = 10
            Top = 100
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_COR'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 232
            Top = 100
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_MARCA'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 454
            Top = 100
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_LOTE'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 5
          end
          object ckUtilizouAnestesia: TCheckBox
            Left = 11
            Top = 17
            Width = 127
            Height = 17
            Caption = 'Utilizou Anestesia'
            TabOrder = 0
          end
          object rdNivelAnestesia: TRadioGroup
            Left = 11
            Top = 36
            Width = 350
            Height = 45
            Caption = 'N'#237'vel de Resist'#234'ncia a Anestesia'
            Columns = 4
            ItemIndex = 0
            Items.Strings = (
              'Baixo'
              'M'#233'dio'
              'Alto'
              'N'#227'o Pegou')
            TabOrder = 1
          end
          object edtTempoAnestesia: TMaskEdit
            Left = 483
            Top = 55
            Width = 74
            Height = 21
            EditMask = '##:##;1;_'
            MaxLength = 5
            TabOrder = 2
            Text = '00:00'
          end
          object DBEdit2: TDBEdit
            Left = 10
            Top = 140
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_COR1'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 6
          end
          object DBEdit3: TDBEdit
            Left = 232
            Top = 140
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_MARCA1'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            Left = 454
            Top = 140
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_LOTE1'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            Left = 10
            Top = 180
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_COR2'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 9
          end
          object DBEdit9: TDBEdit
            Left = 232
            Top = 180
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_MARCA2'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 10
          end
          object DBEdit10: TDBEdit
            Left = 454
            Top = 180
            Width = 220
            Height = 21
            DataField = 'AGEN_PIGMENTO_LOTE2'
            DataSource = dmAgenda.dsAgenda
            TabOrder = 11
          end
        end
      end
      object mmObsCliente: TMemo
        Left = 3
        Top = 438
        Width = 780
        Height = 75
        TabStop = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Hist'#243'rico'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 3
        Top = 63
        Width = 230
        Height = 271
        Caption = 'Antes'
        TabOrder = 0
        object imgAntes: TDBImage
          Left = 2
          Top = 15
          Width = 226
          Height = 254
          Align = alClient
          DataField = 'AGEN_FOTO_ANT'
          DataSource = dmAgenda.dsAgenda
          Stretch = True
          TabOrder = 0
          OnDblClick = imgAntesDblClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 238
        Top = 63
        Width = 230
        Height = 271
        Caption = 'Depois'
        TabOrder = 1
        object imgDepois: TDBImage
          Left = 2
          Top = 15
          Width = 226
          Height = 254
          Align = alClient
          DataField = 'AGEN_FOTO_DEP'
          DataSource = dmAgenda.dsAgenda
          Stretch = True
          TabOrder = 0
          OnDblClick = imgDepoisDblClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 60
        Align = alTop
        Caption = 'Indica'#231#227'o'
        TabOrder = 2
        inline frPesqIndicacao: TfrPesqIndividual
          Left = 3
          Top = 15
          Width = 780
          Height = 43
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 15
          ExplicitWidth = 780
          ExplicitHeight = 43
          inherited Label2: TLabel
            Left = 176
            Width = 36
            Caption = 'Cliente'
            ExplicitLeft = 176
            ExplicitWidth = 36
          end
          inherited btnPesquisar: TSpeedButton
            Left = 106
            ExplicitLeft = 106
          end
          inherited btnInserir: TSpeedButton
            Left = 140
            ExplicitLeft = 140
          end
          inherited Label3: TLabel
            Left = 1021
            ExplicitLeft = 1021
          end
          inherited Label4: TLabel
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited edtCodigo: TEdit
            TabOrder = 2
          end
          inherited edtDescricao: TEdit
            Left = 176
            Width = 601
            ExplicitLeft = 176
            ExplicitWidth = 601
          end
          inherited rdOpcoes: TRadioGroup
            Top = 46
            ItemIndex = 0
            ExplicitTop = 46
          end
          inherited ckOmitir: TCheckBox
            Left = 922
            ExplicitLeft = 922
          end
          inherited edtOpcao: TEdit
            Left = 1021
            TabOrder = 0
            ExplicitLeft = 1021
          end
          inherited edtOpcao1: TEdit
            Left = 1098
            ExplicitLeft = 1098
          end
          inherited ckPlanoContas: TCheckBox
            Left = -500
            ExplicitLeft = -500
          end
        end
      end
      object GroupBox13: TGroupBox
        Left = 0
        Top = 340
        Width = 786
        Height = 179
        Align = alBottom
        Caption = 'Pagamento'
        TabOrder = 3
        object grdAcertos: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 162
          TabStop = False
          Align = alClient
          DataSource = dmAgenda.dsAcertos
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = grdAcertosDrawColumnCell
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 547
    ExplicitTop = 547
    inherited btnOK: TSpeedButton
      ExplicitLeft = 438
      ExplicitTop = 2
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    FileName = '20150720_173733_021'
    Filter = 'Bitmaps (*.bmp)|*.bmp|JPEG (*.jpeg)|*.jpg|Todos (*.*)|*.*'
    FilterIndex = 2
    Title = 'Fotografia'
    Left = 296
    Top = 552
  end
  object dstRelatorio: TfrxDBDataset
    UserName = 'frListaAtendimentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'AGEN_ID=AGEN_ID'
      'AGEN_DTA_CADASTRO=AGEN_DTA_CADASTRO'
      'AGEN_DATA=AGEN_DATA'
      'AGEN_HORA=AGEN_HORA'
      'AGEN_CLIE_ID=AGEN_CLIE_ID'
      'CLIE_FANTASIA=CLIE_FANTASIA'
      'CLIE_ENDERECO=CLIE_ENDERECO'
      'CLIE_BAIRRO=CLIE_BAIRRO'
      'CLIE_CEP=CLIE_CEP'
      'CIDADE=CIDADE'
      'UF=UF'
      'PROFISSIONAL=PROFISSIONAL'
      'STATUS=STATUS'
      'GLAUCOMA=GLAUCOMA'
      'DEPRESSAO=DEPRESSAO'
      'EPILEPSIA=EPILEPSIA'
      'MARCA_PASSO=MARCA_PASSO'
      'HIPERTENSAO=HIPERTENSAO'
      'HEPATITE=HEPATITE'
      'CLIE_HEPATITE_TIPO=CLIE_HEPATITE_TIPO'
      'DIABETES=DIABETES'
      'CLIE_DIABETES_TIPO=CLIE_DIABETES_TIPO'
      'CANCER=CANCER'
      'HIV=HIV'
      'ALCOOLIZADO=ALCOOLIZADO'
      'GRAVIDA=GRAVIDA'
      'ALERGICO=ALERGICO'
      'PROBLEMA_PELE=PROBLEMA_PELE'
      'UTILIZOU_ANESTESIA=UTILIZOU_ANESTESIA'
      'CLIE_TEMPO_ANESTESIA=CLIE_TEMPO_ANESTESIA'
      'AGEN_PIGMENTO_COR=AGEN_PIGMENTO_COR'
      'AGEN_PIGMENTO_MARCA=AGEN_PIGMENTO_MARCA'
      'AGEN_PIGMENTO_LOTE=AGEN_PIGMENTO_LOTE'
      'NIVEL_ANESTESIA=NIVEL_ANESTESIA'
      'AGEN_OBS=AGEN_OBS'
      'AGEN_ORDS_ID=AGEN_ORDS_ID'
      'AGEN_PIGMENTO_COR1=AGEN_PIGMENTO_COR1'
      'AGEN_PIGMENTO_MARCA1=AGEN_PIGMENTO_MARCA1'
      'AGEN_PIGMENTO_LOTE1=AGEN_PIGMENTO_LOTE1'
      'AGEN_PIGMENTO_COR2=AGEN_PIGMENTO_COR2'
      'AGEN_PIGMENTO_MARCA2=AGEN_PIGMENTO_MARCA2'
      'AGEN_PIGMENTO_LOTE2=AGEN_PIGMENTO_LOTE2')
    DataSource = dmAgenda.dsListaAtendimentos
    BCDToCurrency = False
    Left = 438
    Top = 384
  end
  object frRelatorio: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 41062.811029189800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 486
    Top = 384
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frListaAtendimentos'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frListaItensAtendimentos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 302.361911810000000000
        ParentFont = False
        Top = 480.000310000000000000
        Width = 718.110700000000000000
        DataSet = dstRelatorio
        DataSetName = 'frListaAtendimentos'
        RowCount = 0
        StartNewPage = True
        object Shape5: TfrxShapeView
          Top = 256.008040000000000000
          Width = 718.110700000000000000
          Height = 45.353871810000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape4: TfrxShapeView
          Left = 7.779530000000000000
          Top = 262.787570000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Frame.Color = clGradientInactiveCaption
          Frame.ShadowColor = clMaroon
          Shape = skRoundRectangle
        end
        object Shape3: TfrxShapeView
          Top = 1.000000000000000000
          Width = 718.110700000000000000
          Height = 253.228021810000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape1: TfrxShapeView
          Left = 7.559055120000000000
          Top = 11.779530000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Frame.Color = clGradientInactiveCaption
          Frame.ShadowColor = clMaroon
          Shape = skRoundRectangle
        end
        object frListaAtendimentosAGEN_PIGMENTO_COR: TfrxMemoView
          Left = 8.338590000000000000
          Top = 117.826840000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_COR'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_COR"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_PIGMENTO_MARCA: TfrxMemoView
          Left = 242.110390000000000000
          Top = 117.826840000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_MARCA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_MARCA"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_PIGMENTO_LOTE: TfrxMemoView
          Left = 479.000310000000000000
          Top = 117.826840000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_LOTE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_LOTE"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 7.559055120000000000
          Top = 98.929190000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cor')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 241.889920000000000000
          Top = 98.929190000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 479.220780000000000000
          Top = 98.929190000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Lote'
            '')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_OBS: TfrxMemoView
          Left = 7.559055120000000000
          Top = 200.196970000000000000
          Width = 702.992125980000000000
          Height = 49.133890000000000000
          ShowHint = False
          DataField = 'AGEN_OBS'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_OBS"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559055120000000000
          Top = 34.236240000000000000
          Width = 79.370078740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Agenda Nr'#186'.:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 181.795400080000000000
          Top = 34.236240000000000000
          Width = 79.370078740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Atend.:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 359.433310080000000000
          Top = 34.236240000000000000
          Width = 79.370078740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Hr. Atend.:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 7.559055120000000000
          Top = 53.913420000000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 537.071220080000000000
          Top = 34.236240000000000000
          Width = 79.370078740000000000
          Height = 17.007874020000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_ID: TfrxMemoView
          Left = 91.086680080000000000
          Top = 34.236240000000000000
          Width = 86.929133860000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_ID'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_ID"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_DATA: TfrxMemoView
          Left = 263.165530080000000000
          Top = 34.236240000000000000
          Width = 86.929133860000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_DATA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_DATA"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_HORA: TfrxMemoView
          Left = 442.582970080000000000
          Top = 34.236240000000000000
          Width = 86.929133860000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_HORA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_HORA"]')
          ParentFont = False
        end
        object frListaAtendimentosPROFISSIONAL: TfrxMemoView
          Left = 91.086680080000000000
          Top = 53.913420000000000000
          Width = 400.630180000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'PROFISSIONAL'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."PROFISSIONAL"]')
          ParentFont = False
        end
        object frListaAtendimentosSTATUS: TfrxMemoView
          Left = 618.441350080000000000
          Top = 34.236240000000000000
          Width = 86.929133860000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frListaAtendimentos."STATUS"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559055120000000000
          Top = 11.779530000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DO AGENDAMENTO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 7.559055120000000000
          Top = 76.031540000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'MICROPIGMENTA'#199#195'O')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 7.559055120000000000
          Top = 176.858380000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 7.779530000000000000
          Top = 262.787570000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODUTOS E SERVI'#199'OS')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 7.559060000000000000
          Top = 283.464750000000000000
          Width = 94.488198740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Produto/Servi'#231'o')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 415.748031500000000000
          Top = 283.464750000000000000
          Width = 94.488198740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dura'#231#227'o')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 8.559060000000000000
          Top = 137.063080000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_COR1'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_COR1"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 242.330860000000000000
          Top = 137.063080000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_MARCA1'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_MARCA1"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 479.220780000000000000
          Top = 137.063080000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_LOTE1'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_LOTE1"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 8.559060000000000000
          Top = 155.740260000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_COR2'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_COR2"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 242.330860000000000000
          Top = 155.740260000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_MARCA2'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_MARCA2"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 479.220780000000000000
          Top = 155.740260000000000000
          Width = 230.551181100000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'AGEN_PIGMENTO_LOTE2'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_PIGMENTO_LOTE2"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 910.866730000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858267716540000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'www.anonimus.info')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 1.133858267716540000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object imgLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 4.779532440000000000
          Width = 143.622140000000000000
          Height = 98.267780000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lblFantasia: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779532440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 499.897960000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 575.488560000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 645.520100000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 503.811023620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 503.811023620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 503.811023620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 503.811023620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 503.811023620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 575.488560000000000000
          Top = 25.322837090000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 575.488560000000000000
          Top = 46.110238660000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 575.488560000000000000
          Top = 66.897640240000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 575.488560000000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 87.929192440000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Hist'#243'rico do Cliente')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = -0.220470000000000000
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.007874020000000000
        Top = 805.039890000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frListaItensAtendimentos'
        RowCount = 0
        object frListaItensAtendimentosPROD_DESCRICAO: TfrxMemoView
          Left = 7.559055120000000000
          Width = 400.630180000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = frxDBDataset1
          DataSetName = 'frListaItensAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensAtendimentos."PROD_DESCRICAO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 415.748031500000000000
          Width = 400.630180000000000000
          Height = 17.007874020000000000
          ShowHint = False
          DataField = 'PROD_DURACAO'
          DataSet = frxDBDataset1
          DataSetName = 'frListaItensAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensAtendimentos."PROD_DURACAO"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 245.669450000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        Condition = 'frListaAtendimentos."AGEN_CLIE_ID"'
        object Shape7: TfrxShapeView
          Top = 2.000000000000000000
          Width = 718.110700000000000000
          Height = 238.110390000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo32: TfrxMemoView
          Left = 7.559055120000000000
          Top = 38.795300000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Clie.:')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 7.559055120000000000
          Top = 16.338590000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Frame.Color = clGradientInactiveCaption
          Frame.ShadowColor = clMaroon
          Shape = skRoundRectangle
        end
        object frListaAtendimentosGLAUCOMA: TfrxMemoView
          Left = 7.559055120000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GLAUCOMA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."GLAUCOMA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 7.559055120000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DEPRESSAO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."DEPRESSAO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 7.559055120000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'EPILEPSIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."EPILEPSIA"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 7.559055120000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'MARCA_PASSO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."MARCA_PASSO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 7.559055120000000000
          Top = 216.756030000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HIPERTENSAO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HIPERTENSAO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 463.260150080000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HEPATITE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HEPATITE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 463.260150080000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DIABETES'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."DIABETES"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 244.047410080000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CANCER'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."CANCER"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 244.047410080000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HIV'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HIV"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 244.047410080000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ALCOOLIZADO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."ALCOOLIZADO"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 244.047410080000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GRAVIDA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."GRAVIDA"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 244.047410080000000000
          Top = 217.756030000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ALERGICO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."ALERGICO"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 463.260150080000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PROBLEMA_PELE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."PROBLEMA_PELE"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_HEPATITE_TIPO: TfrxMemoView
          Left = 588.205110080000000000
          Top = 161.622140000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_HEPATITE_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_HEPATITE_TIPO"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_DIABETES_TIPO: TfrxMemoView
          Left = 588.205110080000000000
          Top = 179.740260000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_DIABETES_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_DIABETES_TIPO"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 463.260150080000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'UTILIZOU_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."UTILIZOU_ANESTESIA"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 588.205110080000000000
          Top = 198.637910000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'NIVEL_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."NIVEL_ANESTESIA"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 71.811070000000000000
          Top = 38.795300000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'AGEN_CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_CLIE_ID"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 7.559055120000000000
          Top = 57.692950000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 71.811070000000000000
          Top = 57.692950000000000000
          Width = 638.740570000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_FANTASIA"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 7.559055120000000000
          Top = 74.811070000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 71.811070000000000000
          Top = 74.811070000000000000
          Width = 302.362400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_ENDERECO"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 379.512060000000000000
          Top = 74.811070000000000000
          Width = 49.133838740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 431.645950000000000000
          Top = 74.811070000000000000
          Width = 279.685220000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_BAIRRO"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 563.149970000000000000
          Top = 95.488250000000000000
          Width = 71.811018740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 637.961040000000000000
          Top = 95.488250000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_CEP'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_CEP"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 7.559055120000000000
          Top = 95.488250000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 71.811070000000000000
          Top = 95.488250000000000000
          Width = 302.362400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CIDADE"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 402.189240000000000000
          Top = 95.488250000000000000
          Width = 26.456658740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 431.645950000000000000
          Top = 95.488250000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."UF"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559055120000000000
          Top = 16.338590000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DO CLIENTE')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 7.559055120000000000
          Top = 122.165430000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'ANAMNESE')
          ParentFont = False
        end
        object frListaAtendimentosCLIE_TEMPO_ANESTESIA: TfrxMemoView
          Left = 659.638220000000000000
          Top = 198.637910000000000000
          Width = 52.913341890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TEMPO_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_TEMPO_ANESTESIA"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 3.779529999999997000
        Top = 846.614720000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frListaItensAtendimentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_DURACAO=PROD_DURACAO')
    DataSource = dmAgenda.dsListaItensAtendimentos
    BCDToCurrency = False
    Left = 438
    Top = 440
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frListaItensSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'AGEN_ID=AGEN_ID'
      'AGEN_DATA=AGEN_DATA'
      'AGEN_HORA=AGEN_HORA'
      'USER_NOME_COMPLETO=USER_NOME_COMPLETO'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_DURACAO=PROD_DURACAO'
      'ODIT_VLR_UNITARIO=ODIT_VLR_UNITARIO'
      'ODIT_QTDE=ODIT_QTDE'
      'ODIT_VLR_TOTAL=ODIT_VLR_TOTAL'
      'STATUS=STATUS')
    DataSource = dmAgenda.dsItensSintetico
    BCDToCurrency = False
    Left = 566
    Top = 440
  end
  object frRelSintetico: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 42428.660554791700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 486
    Top = 440
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frListaAtendimentos'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frListaItensAtendimentos'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frListaItensSintetico'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 15.117631810000000000
        ParentFont = False
        Top = 525.354670000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frListaItensSintetico'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 1.889763779527560000
          Width = 45.354330708661400000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'AGEN_ID'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensSintetico."AGEN_ID"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 49.133858270000000000
          Width = 68.031496062992130000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'AGEN_DATA'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensSintetico."AGEN_DATA"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 119.055118110236200000
          Width = 34.015748030000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'AGEN_HORA'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensSintetico."AGEN_HORA"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 151.181102362204700000
          Width = 136.063033620000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'USER_NOME_COMPLETO'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensSintetico."USER_NOME_COMPLETO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 291.023622047244100000
          Width = 120.944913620000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaItensSintetico."PROD_DESCRICAO"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 414.614173228347000000
          Width = 52.913385830000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'PROD_DURACAO'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaItensSintetico."PROD_DURACAO"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 470.551181102362000000
          Width = 64.251968500000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaItensSintetico."ODIT_VLR_UNITARIO"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 537.070866141732000000
          Width = 64.251968500000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaItensSintetico."ODIT_QTDE"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 603.212598430000000000
          Width = 64.251968500000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaItensSintetico."ODIT_VLR_TOTAL"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 670.110236220000000000
          Width = 45.354330710000000000
          Height = 12.472440940000000000
          ShowHint = False
          DataField = 'STATUS'
          DataSet = frxDBDataset2
          DataSetName = 'frListaItensSintetico'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaItensSintetico."STATUS"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 627.401980000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858267716540000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'www.anonimus.info')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 1.133858267716540000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object imgLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 4.779532440000000000
          Width = 143.622140000000000000
          Height = 98.267780000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lblFantasia: TfrxMemoView
          Left = 154.960730000000000000
          Top = 3.779532440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 499.897960000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 575.488560000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 645.520100000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 503.811023620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 503.811023620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 503.811023620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 503.811023620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 503.811023620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 575.488560000000000000
          Top = 25.322837090000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 575.488560000000000000
          Top = 46.110238660000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 575.488560000000000000
          Top = 66.897640240000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 575.488560000000000000
          Top = 88.440947320000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 87.929192440000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Hist'#243'rico do Cliente')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = -0.220470000000000000
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 336.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 291.023810000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        Condition = 'frListaAtendimentos."AGEN_CLIE_ID"'
        object Shape3: TfrxShapeView
          Top = 241.889920000000000000
          Width = 718.110700000000000000
          Height = 45.353871810000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape7: TfrxShapeView
          Top = 2.000000000000000000
          Width = 718.110700000000000000
          Height = 238.110390000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo32: TfrxMemoView
          Left = 7.559055120000000000
          Top = 38.795300000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Clie.:')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 7.559055120000000000
          Top = 16.338590000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Frame.Color = clGradientInactiveCaption
          Frame.ShadowColor = clMaroon
          Shape = skRoundRectangle
        end
        object frListaAtendimentosGLAUCOMA: TfrxMemoView
          Left = 7.559055120000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GLAUCOMA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."GLAUCOMA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 7.559055120000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DEPRESSAO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."DEPRESSAO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 7.559055120000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'EPILEPSIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."EPILEPSIA"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 7.559055120000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'MARCA_PASSO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."MARCA_PASSO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 7.559055120000000000
          Top = 216.756030000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HIPERTENSAO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HIPERTENSAO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 463.260150080000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HEPATITE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HEPATITE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 463.260150080000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DIABETES'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."DIABETES"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 244.047410080000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CANCER'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."CANCER"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 244.047410080000000000
          Top = 161.622140000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HIV'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."HIV"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 244.047410080000000000
          Top = 179.740260000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ALCOOLIZADO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."ALCOOLIZADO"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 244.047410080000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'GRAVIDA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."GRAVIDA"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 244.047410080000000000
          Top = 217.756030000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ALERGICO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."ALERGICO"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 463.260150080000000000
          Top = 144.504020000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'PROBLEMA_PELE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."PROBLEMA_PELE"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_HEPATITE_TIPO: TfrxMemoView
          Left = 588.205110080000000000
          Top = 161.622140000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_HEPATITE_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_HEPATITE_TIPO"]')
          ParentFont = False
        end
        object frListaAtendimentosAGEN_DIABETES_TIPO: TfrxMemoView
          Left = 588.205110080000000000
          Top = 179.740260000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_DIABETES_TIPO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_DIABETES_TIPO"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 463.260150080000000000
          Top = 198.637910000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'UTILIZOU_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frListaAtendimentos."UTILIZOU_ANESTESIA"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 588.205110080000000000
          Top = 198.637910000000000000
          Width = 68.031461890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'NIVEL_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."NIVEL_ANESTESIA"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 71.811070000000000000
          Top = 38.795300000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'AGEN_CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."AGEN_CLIE_ID"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 7.559055120000000000
          Top = 57.692950000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 71.811070000000000000
          Top = 57.692950000000000000
          Width = 638.740570000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_FANTASIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_FANTASIA"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 7.559055120000000000
          Top = 74.811070000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 71.811070000000000000
          Top = 74.811070000000000000
          Width = 302.362400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_ENDERECO"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 379.512060000000000000
          Top = 74.811070000000000000
          Width = 49.133838740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 431.645950000000000000
          Top = 74.811070000000000000
          Width = 279.685220000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_BAIRRO"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 563.149970000000000000
          Top = 93.488250000000000000
          Width = 71.811018740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 637.961040000000000000
          Top = 93.488250000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_CEP'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_CEP"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 7.559055120000000000
          Top = 93.488250000000000000
          Width = 60.472428740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 71.811070000000000000
          Top = 93.488250000000000000
          Width = 302.362400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CIDADE'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CIDADE"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 402.189240000000000000
          Top = 93.488250000000000000
          Width = 26.456658740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 431.645950000000000000
          Top = 93.488250000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."UF"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559055120000000000
          Top = 16.338590000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DO CLIENTE')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 7.559055120000000000
          Top = 122.165430000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'ANAMNESE')
          ParentFont = False
        end
        object frListaAtendimentosCLIE_TEMPO_ANESTESIA: TfrxMemoView
          Left = 659.638220000000000000
          Top = 198.637910000000000000
          Width = 52.913341890000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CLIE_TEMPO_ANESTESIA'
          DataSet = dstRelatorio
          DataSetName = 'frListaAtendimentos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frListaAtendimentos."CLIE_TEMPO_ANESTESIA"]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 8.559060000000000000
          Top = 246.669450000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Frame.Color = clGradientInactiveCaption
          Frame.ShadowColor = clMaroon
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 8.559060000000000000
          Top = 246.669450000000000000
          Width = 702.992125980000000000
          Height = 20.787401570000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODUTOS E SERVI'#199'OS')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 1.889763779527560000
          Top = 267.212598430000000000
          Width = 45.354330708661400000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Agenda')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 414.614173228347000000
          Top = 267.212598430000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dura'#231#227'o')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 49.133858270000000000
          Top = 267.212598430000000000
          Width = 68.031496062992130000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 119.055118110236200000
          Top = 267.212598430000000000
          Width = 30.236218030000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 151.181102362204700000
          Top = 267.212598430000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 291.023622047244100000
          Top = 267.212598430000000000
          Width = 49.133838740000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto/Servi'#231'o')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 470.551181102362000000
          Top = 267.212598430000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Unit.')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 537.070866141732000000
          Top = 267.212598430000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 603.212598425197000000
          Top = 267.212598430000000000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 670.110236220472000000
          Top = 267.346630000000000000
          Width = 45.354330708661400000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 563.149970000000000000
        Width = 718.110700000000000000
      end
    end
  end
end
