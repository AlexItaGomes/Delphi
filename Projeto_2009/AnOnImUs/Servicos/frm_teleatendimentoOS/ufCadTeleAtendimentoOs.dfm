inherited fCadTeleAtendimentoOS: TfCadTeleAtendimentoOS
  Caption = 'Tele-Atendimento'
  Constraints.MinWidth = 632
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ParentFont = False
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
        Left = 110
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label3: TLabel
        Left = 5
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Telefone'
      end
      object Label4: TLabel
        Left = 139
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 274
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 409
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 5
        Top = 88
        Width = 64
        Height = 13
        Caption = 'Raz'#227'o Social'
        FocusControl = DBEdit6
      end
      object Label8: TLabel
        Left = 390
        Top = 88
        Width = 76
        Height = 13
        Caption = 'Nome Fantasia'
        FocusControl = DBEdit7
      end
      object Label9: TLabel
        Left = 5
        Top = 208
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit8
      end
      object Label10: TLabel
        Left = 5
        Top = 128
        Width = 48
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 390
        Top = 128
        Width = 31
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit10
      end
      object Label12: TLabel
        Left = 111
        Top = 208
        Width = 36
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit11
      end
      object Label13: TLabel
        Left = 679
        Top = 208
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit12
      end
      object Label14: TLabel
        Left = 5
        Top = 246
        Width = 31
        Height = 13
        Caption = 'E-mail'
        FocusControl = DBEdit13
      end
      object Label18: TLabel
        Left = 5
        Top = 168
        Width = 54
        Height = 13
        Caption = 'Refer'#234'ncia'
        FocusControl = DBEdit14
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CLIE_ID'
        DataSource = dmTeleAtendimentoOS.dsClientes
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 110
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CLIE_DTA_CADASTRO'
        DataSource = dmTeleAtendimentoOS.dsClientes
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 139
        Top = 64
        Width = 130
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE2'
        DataSource = dmTeleAtendimentoOS.dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnExit = DBEdit2Exit
      end
      object DBEdit4: TDBEdit
        Left = 274
        Top = 64
        Width = 130
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE3'
        DataSource = dmTeleAtendimentoOS.dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnExit = DBEdit2Exit
      end
      object DBEdit5: TDBEdit
        Left = 409
        Top = 64
        Width = 130
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_TELEFONE4'
        DataSource = dmTeleAtendimentoOS.dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnExit = DBEdit2Exit
      end
      object DBEdit6: TDBEdit
        Left = 5
        Top = 104
        Width = 380
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_RAZAO_SOCIAL'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 390
        Top = 104
        Width = 389
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_FANTASIA'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 5
        Top = 223
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_CEP'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 11
      end
      object DBEdit9: TDBEdit
        Left = 5
        Top = 144
        Width = 380
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_ENDERECO'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 390
        Top = 144
        Width = 389
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_BAIRRO'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 111
        Top = 223
        Width = 563
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CIDADE'
        DataSource = dmTeleAtendimentoOS.dsClientes
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit12: TDBEdit
        Left = 679
        Top = 223
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'UF'
        DataSource = dmTeleAtendimentoOS.dsClientes
        ReadOnly = True
        TabOrder = 14
      end
      object DBEdit13: TDBEdit
        Tag = 1
        Left = 5
        Top = 262
        Width = 669
        Height = 21
        HelpContext = 1
        CharCase = ecLowerCase
        DataField = 'CLIE_EMAIL'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 12
      end
      object DBEdit14: TDBEdit
        Left = 5
        Top = 183
        Width = 774
        Height = 21
        HelpContext = 1
        DataField = 'CLIE_REFERENCIA'
        DataSource = dmTeleAtendimentoOS.dsClientes
        TabOrder = 10
      end
      object DBEdit2: TDBEdit
        Left = 5
        Top = 64
        Width = 130
        Height = 21
        DataField = 'CLIE_TELEFONE1'
        DataSource = dmTeleAtendimentoOS.dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnExit = DBEdit2Exit
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Atendimento'
      ImageIndex = 1
      object Label15: TLabel
        Left = 5
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Dt. Atendimento'
      end
      object Label17: TLabel
        Left = 575
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Dt. Prox. Atend.'
      end
      object Label24: TLabel
        Left = 681
        Top = 8
        Width = 25
        Height = 13
        Caption = 'Hora'
      end
      object edtDtAtendimento: TDBDateEdit
        Left = 5
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CLIE_DTA_ATENDIMENTO'
        DataSource = dmTeleAtendimentoOS.dsClientes
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 0
      end
      object ckAtendimento: TCheckBox
        Left = 111
        Top = 26
        Width = 170
        Height = 17
        TabStop = False
        Caption = 'Bloquear Atendimento'
        TabOrder = 5
      end
      inline frPesqStatusAtendimento: TfrPesqIndividual
        Left = 5
        Top = 48
        Width = 776
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 5
        ExplicitTop = 48
        ExplicitWidth = 776
        inherited Label2: TLabel
          Width = 102
          Caption = 'Status Atendimento'
          ExplicitWidth = 102
        end
        inherited Label3: TLabel
          Left = 1500
          Visible = True
          ExplicitLeft = 1500
        end
        inherited Label4: TLabel
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited edtCodigo: TEdit
          HelpContext = 1
          OnExit = frPesqStatusAtendimentoedtCodigoExit
        end
        inherited edtDescricao: TEdit
          Width = 601
          ExplicitWidth = 601
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 28
        end
        inherited ckOmitir: TCheckBox
          Left = 1500
          Width = 130
          ExplicitLeft = 1500
          ExplicitWidth = 130
        end
        inherited edtOpcao: TEdit
          Left = 1500
          Visible = True
          ExplicitLeft = 1500
        end
        inherited edtOpcao1: TEdit
          Left = 1500
          ExplicitLeft = 1500
        end
      end
      object edtDtProxAtendimento: TDBDateEdit
        Left = 575
        Top = 24
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'HTAT_DTA_PROX_ATENDIMENTO'
        DataSource = dmTeleAtendimentoOS.dsHistorico
        NumGlyphs = 2
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 349
        Width = 786
        Height = 140
        Align = alBottom
        Caption = 'Equipamentos do cliente'
        TabOrder = 6
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 659
          Height = 123
          TabStop = False
          Align = alLeft
          DataSource = dmTeleAtendimentoOS.dsListaEquipamentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid2DrawColumnCell
        end
        object BitBtn1: TBitBtn
          Left = 667
          Top = 16
          Width = 115
          Height = 35
          Caption = 'Abrir O.S.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D490B009D4A0B009D4A0B009D4A0B009D4A0B009D4A0B009D4A
            0B009D4A0B009D4A0B009D490B00983F0000B1744900EAE5E000AF7042009132
            00009B480900973E00008C2C00008E2E00008D2E00008E2E00008E2E00008E2E
            00008E2E00008C2C0000973E00009B48090091310000B3774E009D4C0E009F4F
            12009B480800AF6E3C00E1C9B600DFC5B200E0C6B300DDC1AC00D7B79F00DCC3
            AD00E0C6B300E1C9B600AF6E3C009B4808009F4F12009D4C0C00A3571C00A253
            17009B470500C4936C00F9F4F100C79A7600C79C7800DABDA600FFFFFF00CEA8
            8900C18E6500F9F6F200C4936C009B470500A2531600A4581F00A9622900A85F
            2300A1531300C79B7600E6D2C100994300009B460200B97F4D00FFFFFF00FFFF
            FF0098440000E1C9B500C79B7700A1531300A85F2200AB642B00AC682E00AB63
            2A00A5581A00C99E7800EAD9CA00A4581800A55A1C00BF8C6000FFFFFF00FFFF
            FF00F3E9E000F6F1EB00C7997100A5591A00AB632800AC693000B1723800AF70
            3300A9652400CCA58000EBDBCC00A8622300AA672700C3946A00FFFFFF00F9F4
            F000FAF6F200FFFFFF00C69B7200AA662500AF6F3300B1733900B5774000B275
            3900AC6B2B00CEA78300EBDCCE00AC672A00B1733800B3753E00BB834F00B87F
            4A00B3763B00EDE0D400CEA58100AC6B2B00B2753900B4773F00BA824A00B97D
            4700B3753900D2AD8A00EDDFD200B2733500B97D4700B87D4500B77B4200B77B
            4300B1703100EDDED000D2AD8A00B3753900B97D4500BA824C00BC875100BB83
            4D00B67B3F00D3B18D00EEE0D300B47A3D00BB834D00BB834D00BB834D00BB83
            4D00B47A3D00EEE0D300D3B18D00B67B3F00BB834B00BB875200C1915B00C08E
            5600BC864A00D7B89400EFE4D600BA854900C08E5700C08E5600C08E5600C08E
            5700BA854900EFE4D600D7B89400BC864A00BF8E5600C3915B00C5966000C395
            5D00C08D5100D9BB9900EEE2D200BA844400C08D5400C08D5300C08D5300C08D
            5400BA844400EEE2D200D9BB9900C08D5100C3945C00C5976200C9A16D00C9A0
            6A00C4985E00DDC19F00FBF8F400DDC2A100E0C7A800E0C7A800E0C7A800E0C7
            A800DDC2A100FBF8F400DDC19F00C4985E00C9A06A00CAA26D00CBA26D00CCA3
            6E00CA9E6700D5B58A00F0E5D700F0E4D500F0E4D500F0E4D500F0E4D500F0E4
            D500F0E4D500F0E5D700D5B58A00CA9E6700CCA36E00CBA46D00DABE9800CEA8
            7000D1AE7C00CFAA7400CAA06500CAA16600CAA16600CAA16600CAA16600CAA1
            6600CAA16600CAA06500CFAA7400D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58300D5B58300D5B58300D5B58300D5B58300D5B5
            8300D5B58300D5B58300D5B58200D4B27D00DBC19700F1EEEC00}
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClick = BitBtn1Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 93
        Width = 786
        Height = 256
        Align = alBottom
        Caption = 'Hist'#243'rico da conversa com o cliente'
        TabOrder = 4
        object mmHistorico: TDBMemo
          Left = 2
          Top = 15
          Width = 782
          Height = 239
          HelpContext = 1
          Align = alClient
          DataField = 'HTAT_HISTORICO'
          DataSource = dmTeleAtendimentoOS.dsHistorico
          TabOrder = 0
        end
      end
      object tmHora: TDateTimePicker
        Left = 681
        Top = 24
        Width = 100
        Height = 21
        HelpContext = 1
        Date = 41160.566666666670000000
        Time = 41160.566666666670000000
        DateMode = dmUpDown
        Kind = dtkTime
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&3.Hist'#243'rico de Atendimentos'
      ImageIndex = 2
      object Label16: TLabel
        Left = 5
        Top = 182
        Width = 84
        Height = 13
        Caption = 'Dt. Atendimento'
        FocusControl = DBEdit15
      end
      object Label19: TLabel
        Left = 108
        Top = 182
        Width = 80
        Height = 13
        Caption = 'Dt. Prox. Atend.'
        FocusControl = DBEdit16
      end
      object Label20: TLabel
        Left = 5
        Top = 222
        Width = 31
        Height = 13
        Caption = 'Status'
        FocusControl = DBEdit17
      end
      object Label21: TLabel
        Left = 678
        Top = 222
        Width = 95
        Height = 13
        Caption = 'Pr'#243'x. Atendimento'
        FocusControl = DBEdit18
      end
      object Label22: TLabel
        Left = 5
        Top = 261
        Width = 46
        Height = 13
        Caption = 'Hist'#243'rico'
      end
      object Label23: TLabel
        Left = 678
        Top = 182
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBEdit19
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 786
        Height = 177
        Align = alTop
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
      end
      object DBEdit15: TDBEdit
        Left = 5
        Top = 198
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'HTAT_DTA_ATENDIMENTO'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit16: TDBEdit
        Left = 108
        Top = 198
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'HTAT_DTA_PROX_ATENDIMENTO'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit17: TDBEdit
        Left = 5
        Top = 238
        Width = 667
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'GENE_DESCR'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit18: TDBEdit
        Left = 678
        Top = 238
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'GENE_NUMBER1'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit19: TDBEdit
        Left = 678
        Top = 198
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientActiveCaption
        DataField = 'HTAT_DTA_CADASTRO'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        ReadOnly = True
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 276
        Width = 786
        Height = 213
        TabStop = False
        Align = alBottom
        Color = clGradientActiveCaption
        DataField = 'HTAT_HISTORICO'
        DataSource = dmTeleAtendimentoOS.dsListaAtendimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  inherited Panel1: TPanel
    inherited btnOK: TSpeedButton
      ExplicitLeft = 326
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 476
    end
  end
end
