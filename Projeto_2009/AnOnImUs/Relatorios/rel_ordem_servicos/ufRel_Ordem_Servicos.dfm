inherited fRel_Ordem_Servico: TfRel_Ordem_Servico
  Caption = 'fRel_Ordem_Servico'
  ClientHeight = 586
  ClientWidth = 1060
  ExplicitWidth = 1066
  ExplicitHeight = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    Top = 531
    Width = 1060
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 531
    ExplicitWidth = 1060
    inherited btnNovo: TSpeedButton
      Left = 176
      Visible = False
      ExplicitLeft = 176
    end
    inherited btnEditar: TSpeedButton
      Left = 351
      Visible = False
      ExplicitLeft = 351
    end
    inherited btnExcluir: TSpeedButton
      Left = 526
      Visible = False
      ExplicitLeft = 526
    end
    inherited btnImprimir: TSpeedButton
      Left = 1
      Enabled = True
      Visible = True
      ExplicitLeft = -5
      ExplicitTop = 2
    end
    inherited btnLocalizar: TSpeedButton
      Left = 701
      Visible = False
      ExplicitLeft = 701
    end
  end
  inherited panelSuperior: TPanel
    Width = 1060
    ExplicitWidth = 1060
    inherited btnHelp: TSpeedButton
      Left = 859
      ExplicitLeft = 1093
    end
    inherited Label1: TLabel
      Width = 260
      Caption = 'Relat'#243'rio de Ordem(ns) de Servico(s)'
      ExplicitWidth = 260
    end
    inherited btnFecharRotina: TSpeedButton
      Left = 959
      ExplicitLeft = 1183
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 39
    Width = 1060
    Height = 492
    ActivePage = TabSheet3
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '1 - Agrupamentos'
      inline frPesqCliente: TfrPesquisa
        Left = 5
        Top = 5
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 50
          Width = 330
          Height = 150
          Caption = 'Pesquisando Registro (Clientes)'
          ExplicitLeft = 50
          ExplicitWidth = 330
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 33
            Caption = 'Cliente'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 33
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 326
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 326
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 326
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 326
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 50
          Height = 150
          ItemIndex = 0
          ExplicitWidth = 50
          ExplicitHeight = 150
        end
      end
      inline frPesqTecnico: TfrPesquisa
        Left = 392
        Top = 5
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 392
        ExplicitTop = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Profissional)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 36
            Caption = 'T'#233'cnico'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 36
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            OnClick = frPesqTecnicobtnPesqClick
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 11
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqProduto: TfrPesquisa
        Left = 780
        Top = 5
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 780
        ExplicitTop = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Produto)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 38
            Caption = 'Produto'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 38
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 16
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqEquipamento: TfrPesquisa
        Left = 5
        Top = 155
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 5
        ExplicitTop = 155
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Equipamento)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 62
            Caption = 'Equipamento'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 62
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 10
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqTipoOS: TfrPesquisa
        Left = 392
        Top = 155
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ExplicitLeft = 392
        ExplicitTop = 155
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Tipo O.S.)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 60
            Caption = 'Tipo de O.S.'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 60
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 21
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqTabPreco: TfrPesquisa
        Left = 780
        Top = 155
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        ExplicitLeft = 780
        ExplicitTop = 155
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Tabela de Pre'#231'o)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 77
            Caption = 'Tabela de Pre'#231'o'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 77
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 9
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqUsuario: TfrPesquisa
        Left = 5
        Top = 305
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ExplicitLeft = 5
        ExplicitTop = 305
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Atendente)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 36
            Caption = 'Usu'#225'rio'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 36
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 22
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqTipoProduto: TfrPesquisa
        Left = 392
        Top = 305
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ExplicitLeft = 392
        ExplicitTop = 305
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro (Tipo do Produto)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 76
            Caption = 'Tipo de Produto'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 76
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 12
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
      inline frPesqStatusOS: TfrPesquisa
        Left = 780
        Top = 305
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        ExplicitLeft = 780
        ExplicitTop = 305
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 331
          Height = 150
          Caption = 'Pesquisando Registro ( Status O.S.)'
          ExplicitLeft = 49
          ExplicitWidth = 331
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 56
            Caption = 'Status O.S.'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 56
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 327
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 327
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 327
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 327
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 150
          ItemIndex = 29
          ExplicitWidth = 49
          ExplicitHeight = 150
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '2 - Agrupamentos'
      ImageIndex = 1
      inline frPesqTipoAgendamento: TfrPesquisa
        Left = 5
        Top = 5
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 50
          Width = 330
          Height = 150
          Caption = 'Pesquisando Registro (Tipo Agendamento)'
          ExplicitLeft = 50
          ExplicitWidth = 330
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 150
            Top = 14
            Width = 90
            Caption = 'Tipo Agendamento'
            ExplicitLeft = 150
            ExplicitTop = 14
            ExplicitWidth = 90
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 326
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 326
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 326
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 326
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 50
          Height = 150
          ItemIndex = 32
          ExplicitWidth = 50
          ExplicitHeight = 150
        end
      end
      inline frPesqPracas: TfrPesquisa
        Left = 391
        Top = 5
        Width = 380
        Height = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 391
        ExplicitTop = 5
        ExplicitWidth = 380
        ExplicitHeight = 150
        inherited GroupBox1: TGroupBox
          Left = 50
          Width = 330
          Height = 150
          Caption = 'Pesquisando Registro (Pra'#231'as)'
          ExplicitLeft = 50
          ExplicitWidth = 330
          ExplicitHeight = 150
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Left = 143
            Top = 14
            Width = 32
            Caption = 'Pra'#231'as'
            ExplicitLeft = 143
            ExplicitTop = 14
            ExplicitWidth = 32
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 118
            Width = 326
            Height = 30
            ExplicitTop = 118
            ExplicitWidth = 326
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 53
            Width = 326
            Height = 65
            ExplicitTop = 53
            ExplicitWidth = 326
            ExplicitHeight = 65
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
          inherited ckPlanoContas: TCheckBox
            Left = 269
            ExplicitLeft = 269
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 50
          Height = 150
          ItemIndex = 2
          ExplicitWidth = 50
          ExplicitHeight = 150
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Filtros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object GroupBox6: TGroupBox
        Left = 3
        Top = 3
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object edtDtCadInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = edtDtInicioKeyPress
        end
        object edtDtCadFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = edtDtInicioKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 227
        Top = 3
        Width = 216
        Height = 45
        Caption = 'Dt. Agendamento/Realizado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtDtAgendaInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = edtDtInicioKeyPress
        end
        object edtDtAgendaFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = edtDtInicioKeyPress
        end
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 3
        Top = 164
        Width = 440
        Height = 60
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        ParentFont = False
        TabOrder = 6
      end
      object rdStatus: TRadioGroup
        Left = 3
        Top = 102
        Width = 440
        Height = 60
        Caption = 'Status O.S.'
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 4
        Items.Strings = (
          'Agendado'
          'Realizado'
          'Real./Pago'
          'Cancelados'
          'Todos')
        ParentFont = False
        TabOrder = 4
      end
      object rdTipoRel: TRadioGroup
        Left = 449
        Top = 3
        Width = 448
        Height = 159
        Caption = 'Tipo de Relat'#243'rio'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'O.S. Individual'
          'Agrup. por Profissional'
          'Agrup. por Atendente'
          'Comiss'#227'o por Profissional (O.S)'
          'Comiss'#227'o por Profissional (Pe'#231'as/Serv.)'
          'Comiss'#227'o por Atendente'
          'Etiquetas')
        ParentFont = False
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 227
        Top = 52
        Width = 216
        Height = 45
        Caption = 'Dt. Abertura/Anivers'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object edtDtAnivInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = edtDtInicioKeyPress
        end
        object edtDtAnivFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = edtDtInicioKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 52
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro O.S.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtDtInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnKeyPress = edtDtInicioKeyPress
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnKeyPress = edtDtInicioKeyPress
        end
      end
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Left = 328
    Top = 191
    Width = 0
    Height = 0
    Align = alNone
    Visible = False
    ExplicitLeft = 328
    ExplicitTop = 191
    ExplicitWidth = 0
    ExplicitHeight = 0
    inherited grdBasico: TDBGrid
      Width = 229
      Height = 161
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 229
      Height = 161
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
    end
  end
  inherited dsGrid: TDataSource
    Left = 784
    Top = 264
  end
  inherited Timer1: TTimer
    Left = 784
    Top = 328
  end
  inherited ppBasico: TPopupMenu
    Left = 984
    Top = 144
  end
  inherited frRelatorio: TfrxReport
    ReportOptions.LastChange = 42550.854396759260000000
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioComissoProf'
      end
      item
        DataSet = dstRelatorioPecasServicos
        DataSetName = 'frDBRelatorioPecasServicos'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 10
      inherited PageHeader1: TfrxPageHeader
        Height = 0.377952760000000000
        Visible = False
        Width = 1046.929810000000000000
        inherited Memo15: TfrxMemoView
          Top = 0.377952760000000000
          Height = 0.000000000000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 680.315400000000000000
        Width = 1046.929810000000000000
        inherited Memo1: TfrxMemoView
          Top = 1.133858270000000000
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 907.087200000000000000
          Top = 1.133858270000000000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
        inherited Line2: TfrxLineView
          Width = 1046.929810000000000000
        end
      end
      inherited MasterData1: TfrxMasterData
        Height = 92.598427640000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioComissoProf'
        object Memo2: TfrxMemoView
          Left = 66.811070000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_ID"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 1.889763780000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nr'#186' O.S.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 359.834880000000000000
          Top = 15.118120000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_CLIE_ID"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 293.803340000000000000
          Top = 15.118120000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Clie.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 550.031850000000000000
          Width = 292.913322360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 502.897960000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 1.889763780000000000
          Top = 15.118120000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tab. Pre'#231'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 293.803340000000000000
          Top = 30.236240000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Equip.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 502.897960000000000000
          Top = 15.118120000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Equip.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 1.889763780000000000
          Top = 30.236240000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Marca:')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 293.803340000000000000
          Top = 45.354360000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Modelo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 502.897960000000000000
          Top = 30.236240000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fornec.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 1.889763780000000000
          Top = 45.354360000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Filtro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 502.897960000000000000
          Top = 45.354360000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 66.811070000000000000
          Top = 15.118120000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TPRC_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."TPRC_DESCRICAO"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 66.811070000000000000
          Top = 30.236240000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_MARCA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_MARCA"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 66.811070000000000000
          Top = 45.354360000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FILTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."FILTRO"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 359.834880000000000000
          Top = 30.236240000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_PROD_ID_EQUIP'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_PROD_ID_EQUIP"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 359.834880000000000000
          Top = 45.354360000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_MODELO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_MODELO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 550.031850000000000000
          Top = 15.118120000000000000
          Width = 292.913322360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_DESCRICAO"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 550.031850000000000000
          Top = 30.236240000000000000
          Width = 292.913322360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_GENE_ID_TIPO_OS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_GENE_ID_TIPO_OS"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 550.031850000000000000
          Top = 45.354360000000000000
          Width = 292.913322360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'STATUS_OS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."STATUS_OS"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 1.889763780000000000
          Top = 76.370130000000000000
          Width = 51.023614720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cod. Prod.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 54.692950000000000000
          Top = 76.370130000000000000
          Width = 219.212574020000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desc. Prod. / Servi'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 276.126160000000000000
          Top = 76.370130000000000000
          Width = 28.346434720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 307.141930000000000000
          Top = 76.370130000000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 422.527830000000000000
          Top = 76.370130000000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 538.134200000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Unit.')
          ParentFont = False
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 615.504330000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 693.874460000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 772.024120000000000000
          Top = 76.370130000000000000
          Width = 37.795258500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo C.')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 813.039890000000000000
          Top = 76.370130000000000000
          Width = 56.692901180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Interno')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 890.969080000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Externo')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 968.669711180000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 813.039890000000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Interna')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 890.969080000000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Externa')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 968.669711180000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Line5: TfrxLineView
          Align = baBottom
          Top = 92.598427640000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo88: TfrxMemoView
          Left = 359.834880000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_HORARIO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_HORARIO"]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 293.803340000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Hor'#225'rio:')
          ParentFont = False
          WordWrap = False
        end
        object Memo90: TfrxMemoView
          Left = 845.614720000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tel.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo91: TfrxMemoView
          Left = 892.748610000000000000
          Width = 73.700582360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE1'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."CLIE_TELEFONE1"]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 970.339210000000000000
          Width = 73.700582360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE2'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."CLIE_TELEFONE2"]')
          ParentFont = False
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        Height = 109.606372440000000000
        Width = 1046.929810000000000000
        inherited lblFantasia: TfrxMemoView
          Width = 619.842700310000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Line1: TfrxLineView
          Left = 777.024120000000000000
        end
        inherited SysMemo2: TfrxSysMemoView
          Left = 852.614720000000000000
          Top = 3.779530000000000000
          Width = 94.488188976378000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Left = 949.882409690000000000
          Top = 3.779530000000000000
          Width = 94.488188980000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Left = 780.937183620000000000
          Top = 3.779530000000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Left = 780.937183620000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Left = 780.937183620000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Left = 780.937183620000000000
          Top = 66.897640240000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Left = 780.937183620000000000
          Top = 88.440947320000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Left = 852.614720000000000000
          Width = 192.755939690000000000
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Left = 852.614720000000000000
          Width = 192.755939690000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Left = 852.614720000000000000
          Top = 66.897640240000000000
          Width = 192.755939690000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Left = 852.614720000000000000
          Top = 88.440947320000000000
          Width = 192.755939690000000000
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Top = 80.370132440000000000
          Width = 619.842700310000000000
          Memo.UTF8W = (
            'Comiss'#227'o por Profissional')
        end
        inherited Line3: TfrxLineView
          Align = baBottom
          Top = 109.606372440000000000
          Width = 1046.929810000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Width = 619.842700310000000000
          Memo.UTF8W = (
            'Empresa:')
        end
      end
      inherited Line4: TfrxLineView
        Left = 0.377952760000000000
        Top = 718.110700000000000000
        Visible = False
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 1.889763780000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."ORDS_ID"'
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456690470000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."USER_NOME_TECNICO"'
        StartNewPage = True
        object Shape1: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 24.566929130000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 18.677180000000000000
          Top = 3.913385830000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 107.496062990000000000
          Top = 3.913385830000000000
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'USER_NOME_TECNICO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."USER_NOME_TECNICO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 26.456690470000000000
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."ORDS_DTA_CADASTRO"'
        object Shape2: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 24.566929130000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo7: TfrxMemoView
          Left = 18.677180000000000000
          Top = 3.913385830000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dta Execu'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 107.496062990000000000
          Top = 3.913385830000000000
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ORDS_DTA_INSTALACAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_DTA_INSTALACAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 506.457020000000000000
        Width = 1046.929810000000000000
        object Shape3: TfrxShapeView
          Top = 1.000000000000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo62: TfrxMemoView
          Left = 813.039890000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Interno')
          ParentFont = False
          WordWrap = False
        end
        object Memo63: TfrxMemoView
          Left = 890.969080000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Externo')
          ParentFont = False
          WordWrap = False
        end
        object Memo64: TfrxMemoView
          Left = 968.669711180000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 538.134200000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. da OS')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          Left = 615.504330000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Desc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 693.874460000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo70: TfrxMemoView
          Left = 538.134200000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_TOTAL_OS"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 615.504330000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_DESCONTO"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 693.874460000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_PAGO"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 813.039890000000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOINTERNO"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 890.969080000000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOEXTERNO"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 968.669711180000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOBALCAO"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 585.827150000000000000
        Width = 1046.929810000000000000
        object Shape4: TfrxShapeView
          Top = 2.000000000000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo71: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total O.S.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo72: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779530000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 520.016080000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total em OS')
          ParentFont = False
          WordWrap = False
        end
        object Memo74: TfrxMemoView
          Left = 609.835035000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total em Desc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo78: TfrxMemoView
          Left = 699.433520000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total Geral')
          ParentFont = False
          WordWrap = False
        end
        object Memo79: TfrxMemoView
          Left = 520.016080000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_TOTAL_OS">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 609.835035000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_DESCONTO">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 699.433520000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_PAGO">,MasterData1)]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 813.039890000000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Interna')
          ParentFont = False
          WordWrap = False
        end
        object Memo83: TfrxMemoView
          Left = 890.969080000000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Externa')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          Left = 968.669711180000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo85: TfrxMemoView
          Left = 813.039890000000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOINTERNO">,MasterData1' +
              ')]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 890.969080000000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOEXTERNO">,MasterData1' +
              ')]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 968.669711180000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOBALCAO">,MasterData1)' +
              ']')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 1.889763780000000000
        Top = 559.370440000000000000
        Width = 1046.929810000000000000
      end
      object DetailData1: TfrxDetailData
        Height = 30.236240000000000000
        Top = 453.543600000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioPecasServicos
        DataSetName = 'frDBRelatorioPecasServicos'
        RowCount = 0
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Width = 51.023614720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_TPIT_PROD_ID'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_TPIT_PROD_ID"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 56.582716220000000000
          Width = 219.212574020000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_DESCRICAO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 278.015926220000000000
          Width = 28.346434720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_UNIDADE"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 309.031696220000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."MARCA_PROD"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 424.417596220000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."MODELO_PROD"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 540.023966220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_UNITARIO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_VLR_UNITARIO"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 617.394096220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_QTDE'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_QTDE"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 695.764226220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_TOTAL'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_VLR_TOTAL"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 773.913886220000000000
          Width = 37.795258500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TIPO_COMISSAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."TIPO_COMISSAO"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 814.929656220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_INTERNA'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_INTERNA"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 892.858846220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_EXTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_EXTERNO"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 970.559477400000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_BALCAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_BALCAO"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 814.929656220000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOINTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOINTERNO"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 892.858846220000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOEXTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOEXTERNO"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 970.559477400000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOBALCAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOBALCAO"]')
          ParentFont = False
        end
      end
    end
  end
  inherited dstRelatorio: TfrxDBDataset
    UserName = 'frDBRelatorioComissoProf'
    FieldAliases.Strings = (
      'ORDS_ID=ORDS_ID'
      'ORDS_EMPR_ID=ORDS_EMPR_ID'
      'ORDS_CLIE_ID=ORDS_CLIE_ID'
      'CLIE_RAZAO_SOCIAL=CLIE_RAZAO_SOCIAL'
      'ORDS_TPRC_ID=ORDS_TPRC_ID'
      'TPRC_DESCRICAO=TPRC_DESCRICAO'
      'ORDS_DTA_INSTALACAO=ORDS_DTA_INSTALACAO'
      'ORDS_GENE_ID_TIPO_OS=ORDS_GENE_ID_TIPO_OS'
      'DESCR_TIPO_OS=DESCR_TIPO_OS'
      'ORDS_STATUS=ORDS_STATUS'
      'STATUS_OS=STATUS_OS'
      'ORDS_PROD_ID_EQUIP=ORDS_PROD_ID_EQUIP'
      'EQUIP_DESCRICAO=EQUIP_DESCRICAO'
      'EQUIP_UNIDADE=EQUIP_UNIDADE'
      'EQUIP_MARCA=EQUIP_MARCA'
      'EQUIP_MODELO=EQUIP_MODELO'
      'EQUIP_FORNECEDOR=EQUIP_FORNECEDOR'
      'ORDS_DTA_CADASTRO=ORDS_DTA_CADASTRO'
      'ORDS_USER_ID=ORDS_USER_ID'
      'USER_ATENDENTE=USER_ATENDENTE'
      'ORDS_VLR_PAGO=ORDS_VLR_PAGO'
      'ORDS_VLR_DESCONTO=ORDS_VLR_DESCONTO'
      'ORDS_VLR_TOTAL_OS=ORDS_VLR_TOTAL_OS'
      'VLR_PERC_DESC=VLR_PERC_DESC'
      'ORDS_USER_ID_TEC=ORDS_USER_ID_TEC'
      'USER_NOME_TECNICO=USER_NOME_TECNICO'
      'FILTRO=FILTRO'
      'ATENDENTE=ATENDENTE'
      'VLRCOMISSAOINTERNO=VLRCOMISSAOINTERNO'
      'VLRCOMISSAOEXTERNO=VLRCOMISSAOEXTERNO'
      'VLRCOMISSAOBALCAO=VLRCOMISSAOBALCAO'
      'ORDS_HORARIO=ORDS_HORARIO'
      'CLIE_TELEFONE1=CLIE_TELEFONE1'
      'CLIE_TELEFONE2=CLIE_TELEFONE2'
      'PRACA=PRACA')
    DataSource = dmRel_Ordem_Servico.dsComissao_Pecas_Servicos
  end
  inherited funcBasico: TFuncoes
    Left = 784
    Top = 296
  end
  object dstRelatorioOS: TfrxDBDataset
    UserName = 'frDBRelatorioOS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ORDS_ID=ORDS_ID'
      'ORDS_EMPR_ID=ORDS_EMPR_ID'
      'ORDS_CLIE_ID=ORDS_CLIE_ID'
      'ORDS_CLIE_EMPR_ID=ORDS_CLIE_EMPR_ID'
      'ORDS_TPRC_ID=ORDS_TPRC_ID'
      'ORDS_TPRC_EMPR_ID=ORDS_TPRC_EMPR_ID'
      'ORDS_DTA_INSTALACAO=ORDS_DTA_INSTALACAO'
      'ORDS_GENE_EMPR_ID_TIPO_OS=ORDS_GENE_EMPR_ID_TIPO_OS'
      'ORDS_GENE_TGEN_ID_TIPO_OS=ORDS_GENE_TGEN_ID_TIPO_OS'
      'ORDS_GENE_ID_TIPO_OS=ORDS_GENE_ID_TIPO_OS'
      'ORDS_STATUS=ORDS_STATUS'
      'ORDS_USER_ID_TEC=ORDS_USER_ID_TEC'
      'ORDS_PROD_ID_EQUIP=ORDS_PROD_ID_EQUIP'
      'ORDS_PROD_EMPR_ID_EQUIP=ORDS_PROD_EMPR_ID_EQUIP'
      'ORDS_NR_PEDIDO_SERIE=ORDS_NR_PEDIDO_SERIE'
      'ORDS_VLR_TOTAL_OS=ORDS_VLR_TOTAL_OS'
      'ORDS_VLR_DESCONTO=ORDS_VLR_DESCONTO'
      'ORDS_VLR_PAGO=ORDS_VLR_PAGO'
      'ORDS_OBSERVACAO=ORDS_OBSERVACAO'
      'ORDS_INFORMACOES=ORDS_INFORMACOES'
      'ORDS_USER_ID_CANC=ORDS_USER_ID_CANC'
      'ORDS_MOTIVO_CANC=ORDS_MOTIVO_CANC'
      'ORDS_DTA_CANC=ORDS_DTA_CANC'
      'ORDS_DTA_ENTREGA=ORDS_DTA_ENTREGA'
      'ORDS_USER_ID_ENTREG=ORDS_USER_ID_ENTREG'
      'ORDS_BAIXADO_ESTOQUE=ORDS_BAIXADO_ESTOQUE'
      'ORDS_DTA_CADASTRO=ORDS_DTA_CADASTRO'
      'ORDS_USER_ID=ORDS_USER_ID'
      'CLIE_RAZAO_SOCIAL=CLIE_RAZAO_SOCIAL'
      'CLIE_CEP=CLIE_CEP'
      'CLIE_ENDERECO=CLIE_ENDERECO'
      'CLIE_BAIRRO=CLIE_BAIRRO'
      'CLIE_TELEFONE1=CLIE_TELEFONE1'
      'CLIE_TELEFONE2=CLIE_TELEFONE2'
      'CLIE_TELEFONE3=CLIE_TELEFONE3'
      'CLIE_TELEFONE4=CLIE_TELEFONE4'
      'PRACA=PRACA'
      'UF=UF'
      'TIPO_OS=TIPO_OS'
      'ORDS_STATUS_1=ORDS_STATUS_1'
      'USER_NOME_COMPLETO=USER_NOME_COMPLETO'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_GARANTIA=PROD_GARANTIA'
      'MARCA_PROD=MARCA_PROD'
      'MODELO_PROD=MODELO_PROD'
      'PROD_UNIDADE=PROD_UNIDADE'
      'CLIE_FANTASIA=CLIE_FANTASIA'
      'CLIE_CNPJ_CPF=CLIE_CNPJ_CPF'
      'CLIE_RG=CLIE_RG'
      'ATENDENTE=ATENDENTE'
      'ORDS_FORN_ID_EQUIP=ORDS_FORN_ID_EQUIP'
      'FORN_ID=FORN_ID'
      'FORN_RAZAO_SOCIAL=FORN_RAZAO_SOCIAL'
      'CLIE_REFERENCIA=CLIE_REFERENCIA'
      'STATUS_OS=STATUS_OS'
      'TIPO_AGENDAMENTO=TIPO_AGENDAMENTO'
      'FILTRO=FILTRO'
      'ETIQUETA=ETIQUETA'
      'CLIE_ID=CLIE_ID'
      'ORDS_HORARIO=ORDS_HORARIO')
    DataSource = dmRel_Ordem_Servico.dsRel_Ordem_Servico
    BCDToCurrency = False
    Left = 888
    Top = 120
  end
  object frRelatorioOSPorProfissional: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 42505.531541863430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 872
    Top = 272
    Datasets = <
      item
        DataSet = dstRelatorioOS
        DataSetName = 'frDBRelatorioOS'
      end
      item
        DataSet = dstRelatorioOSItens
        DataSetName = 'frDBRelatorioOSItens'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 10
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 0.377952760000000000
        ParentFont = False
        Top = 151.181200000000000000
        Visible = False
        Width = 1046.929810000000000000
        object Line4: TfrxLineView
          Left = 0.377952760000000000
          Top = 0.377952760000000000
          Width = 718.110700000000000000
          Visible = False
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.377952760000000000
          Width = 94.488250000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118110236220470000
        Top = 480.000310000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858270000000000
          Width = 204.094620000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 922.205320000000000000
          Top = 1.133858270000000000
          Width = 124.724490000000000000
          Height = 13.228346460000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 1039.370750000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 83.149586770000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioOS
        DataSetName = 'frDBRelatorioOS'
        RowCount = 0
        object Shape2: TfrxShapeView
          Top = 2.000000000000000000
          Width = 1046.929810000000000000
          Height = 58.582677170000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape1: TfrxShapeView
          Left = 48.913420000000000000
          Top = 62.472480000000000000
          Width = 994.016390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo9: TfrxMemoView
          Left = 3.779527560000000000
          Top = 2.000000000000000000
          Width = 52.913385830000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' O.S.')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 110.385900000000000000
          Top = 2.000000000000000000
          Width = 49.133858270000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Clie.')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 161.519790000000000000
          Top = 2.000000000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome / Raz'#227'o Social')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 333.157700000000000000
          Top = 2.000000000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 553.811380000000000000
          Top = 2.000000000000000000
          Width = 147.401565040000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 390.071120000000000000
          Top = 2.000000000000000000
          Width = 162.519685040000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 702.433520000000000000
          Top = 2.000000000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 874.291900000000000000
          Top = 2.000000000000000000
          Width = 18.897593860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 3.779527560000000000
          Top = 17.338590000000000000
          Width = 52.913385826771650000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 58.252010000000000000
          Top = 17.338590000000000000
          Width = 228.661417322834600000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Equipamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 288.803340000000000000
          Top = 17.338590000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 771.024120000000000000
          Top = 17.118120000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 977.339195360000000000
          Top = 17.338590000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Agenda')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 839.496600000000000000
          Top = 17.338590000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 345.496290000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 487.559370000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 894.410020000000000000
          Top = 2.000000000000000000
          Width = 147.401574800000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Refer'#234'ncia')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 909.087200000000000000
          Top = 17.338590000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 629.401980000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Filtro')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779527560000000000
          Top = 32.236240000000000000
          Width = 52.913385830000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_ID'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779527560000000000
          Top = 47.354360000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_PROD_ID_EQUIP'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_PROD_ID_EQUIP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 110.385900000000000000
          Top = 32.236240000000000000
          Width = 49.133858270000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_ID'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 60.252010000000000000
          Top = 47.354360000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 161.519790000000000000
          Top = 32.236240000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 288.803340000000000000
          Top = 47.354360000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 333.157700000000000000
          Top = 32.236240000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_CEP'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 345.496290000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."MARCA_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 390.071120000000000000
          Top = 32.236240000000000000
          Width = 162.519685040000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 487.559370000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."MODELO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 553.811380000000000000
          Top = 32.236240000000000000
          Width = 147.401565040000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_BAIRRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 629.401980000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FILTRO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."FILTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 702.433520000000000000
          Top = 32.236240000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PRACA'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."PRACA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 771.024120000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE1'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 874.291900000000000000
          Top = 32.236240000000000000
          Width = 18.897593860000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 839.496600000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE2'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 894.410020000000000000
          Top = 32.236240000000000000
          Width = 147.401574800000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_REFERENCIA'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_REFERENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 977.339195360000000000
          Top = 47.354360000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_DTA_INSTALACAO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_DTA_INSTALACAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 909.087200000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE3'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 60.252010000000000000
          Top = 66.252010000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Prod.')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 117.165430000000000000
          Top = 66.252010000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto/Servi'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 347.716760000000000000
          Top = 66.252010000000000000
          Width = 28.346456690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 421.307360000000000000
          Top = 66.252010000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 555.811380000000000000
          Top = 66.252010000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Left = 377.953000000000000000
          Top = 66.252010000000000000
          Width = 41.574803150000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Garantia')
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 689.653990000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Unit.')
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          Left = 754.346940000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 818.937540000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo55: TfrxMemoView
          Left = 884.410020000000000000
          Top = 66.252010000000000000
          Width = 51.023612280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status OS:')
          ParentFont = False
          WordWrap = False
        end
        object Memo56: TfrxMemoView
          Left = 937.543895360000000000
          Top = 66.252010000000000000
          Width = 102.047268500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'STATUS_OS'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."STATUS_OS"]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          Top = 30.456710000000000000
          Width = 1046.929133858268000000
          ShowHint = False
          Diagonal = True
        end
        object Memo66: TfrxMemoView
          Left = 58.472480000000000000
          Top = 2.000000000000000000
          Width = 51.023622050000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hor'#225'rio')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 58.472480000000000000
          Top = 32.236240000000000000
          Width = 51.023622050000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_HORARIO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_HORARIO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606372440000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
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
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 777.024120000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 852.614720000000000000
          Top = 3.779530000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 949.882409690000000000
          Top = 3.779530000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 780.937183620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 780.937183620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 780.937183620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 780.937183620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 780.937183620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 852.614720000000000000
          Top = 25.322837090000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 852.614720000000000000
          Top = 46.110238660000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 852.614720000000000000
          Top = 66.897640240000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 852.614720000000000000
          Top = 88.440947320000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 84.149662440000000000
          Width = 619.842700310000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Ordem(ns) de Servi'#231'os')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Top = 109.606372440000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioOS."USER_NOME_COMPLETO"'
        object Memo5: TfrxMemoView
          Left = 3.779527560000000000
          Top = 1.889763780000000000
          Width = 96.377974720000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 102.047310000000000000
          Top = 1.889763780000000000
          Width = 351.496216770000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'USER_NOME_COMPLETO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."USER_NOME_COMPLETO"]')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 20.787401574803150000
          ShowHint = False
          Shape = skRoundRectangle
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897637800000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo10: TfrxSysMemoView
          Left = 88.929190000000000000
          Width = 83.149606300000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 3.779527560000000000
          Width = 83.149606300000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total O.S.:')
          ParentFont = False
          WordWrap = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 13.228346460000000000
        Top = 362.834880000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioOSItens
        DataSetName = 'frDBRelatorioOSItens'
        RowCount = 0
        object Memo57: TfrxMemoView
          Left = 117.165430000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Left = 60.252010000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_TPIT_PROD_ID'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_TPIT_PROD_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo59: TfrxMemoView
          Left = 347.716760000000000000
          Width = 28.346456690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo61: TfrxMemoView
          Left = 421.307360000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."MARCA_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo62: TfrxMemoView
          Left = 555.811380000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."MODELO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo63: TfrxMemoView
          Left = 689.653990000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_UNITARIO'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_VLR_UNITARIO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo64: TfrxMemoView
          Left = 754.346940000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_QTDE'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_QTDE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 818.937540000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_TOTAL'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_VLR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo60: TfrxMemoView
          Left = 377.953000000000000000
          Width = 41.574803150000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_GARANTIA'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_GARANTIA"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Line5: TfrxLineView
        Align = baBottom
        Top = 718.110700000000000000
        Width = 1046.929810000000000000
        ShowHint = False
        Diagonal = True
      end
    end
  end
  object dstRelatorioOSItens: TfrxDBDataset
    UserName = 'frDBRelatorioOSItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ODIT_TPIT_PROD_ID=ODIT_TPIT_PROD_ID'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_UNIDADE=PROD_UNIDADE'
      'PROD_GARANTIA=PROD_GARANTIA'
      'ODIT_VLR_UNITARIO=ODIT_VLR_UNITARIO'
      'ODIT_QTDE=ODIT_QTDE'
      'ODIT_VLR_TOTAL=ODIT_VLR_TOTAL'
      'MARCA_PROD=MARCA_PROD'
      'MODELO_PROD=MODELO_PROD'
      'ODIT_ID=ODIT_ID'
      'ODIT_EMPR_ID=ODIT_EMPR_ID'
      'ODIT_ORDS_ID=ODIT_ORDS_ID'
      'ODIT_ORDS_EMPR_ID=ODIT_ORDS_EMPR_ID'
      'ODIT_ORDS_CLIE_ID=ODIT_ORDS_CLIE_ID'
      'ODIT_ORDS_CLIE_EMPR_ID=ODIT_ORDS_CLIE_EMPR_ID'
      'ODIT_TPIT_ID=ODIT_TPIT_ID'
      'ODIT_TPIT_EMPR_ID=ODIT_TPIT_EMPR_ID'
      'ODIT_TPIT_TPRC_ID=ODIT_TPIT_TPRC_ID'
      'ODIT_TPIT_TPRC_EMPR_ID=ODIT_TPIT_TPRC_EMPR_ID'
      'ODIT_TPIT_PROD_EMPR_ID=ODIT_TPIT_PROD_EMPR_ID'
      'ODIT_DTA_CADASTRO=ODIT_DTA_CADASTRO'
      'ODIT_USER_ID=ODIT_USER_ID'
      'GENE_IMAGE=GENE_IMAGE'
      'TOTALITENS=TOTALITENS')
    DataSource = dmRel_Ordem_Servico.dsOrdemServicoItens
    BCDToCurrency = False
    Left = 888
    Top = 168
  end
  object dstRelatorioPecasServicos: TfrxDBDataset
    UserName = 'frDBRelatorioPecasServicos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ORDS_ID=ORDS_ID'
      'ORDS_EMPR_ID=ORDS_EMPR_ID'
      'ORDS_CLIE_ID=ORDS_CLIE_ID'
      'CLIE_RAZAO_SOCIAL=CLIE_RAZAO_SOCIAL'
      'ORDS_TPRC_ID=ORDS_TPRC_ID'
      'TPRC_DESCRICAO=TPRC_DESCRICAO'
      'ORDS_DTA_INSTALACAO=ORDS_DTA_INSTALACAO'
      'ORDS_GENE_ID_TIPO_OS=ORDS_GENE_ID_TIPO_OS'
      'DESCR_TIPO_OS=DESCR_TIPO_OS'
      'ORDS_STATUS=ORDS_STATUS'
      'STATUS_OS=STATUS_OS'
      'ORDS_PROD_ID_EQUIP=ORDS_PROD_ID_EQUIP'
      'EQUIP_DESCRICAO=EQUIP_DESCRICAO'
      'EQUIP_UNIDADE=EQUIP_UNIDADE'
      'EQUIP_MARCA=EQUIP_MARCA'
      'EQUIP_MODELO=EQUIP_MODELO'
      'EQUIP_FORNECEDOR=EQUIP_FORNECEDOR'
      'ORDS_DTA_CADASTRO=ORDS_DTA_CADASTRO'
      'ORDS_USER_ID=ORDS_USER_ID'
      'USER_ATENDENTE=USER_ATENDENTE'
      'ODIT_TPIT_PROD_ID=ODIT_TPIT_PROD_ID'
      'PROD_DESCRICAO=PROD_DESCRICAO'
      'PROD_UNIDADE=PROD_UNIDADE'
      'MARCA_PROD=MARCA_PROD'
      'MODELO_PROD=MODELO_PROD'
      'PROD_TIPO_COMISSAO=PROD_TIPO_COMISSAO'
      'TIPO_COMISSAO=TIPO_COMISSAO'
      'PROD_COMISSAO_VEND_INTERNA=PROD_COMISSAO_VEND_INTERNA'
      'PROD_COMISSAO_VEND_EXTERNO=PROD_COMISSAO_VEND_EXTERNO'
      'PROD_COMISSAO_VEND_BALCAO=PROD_COMISSAO_VEND_BALCAO'
      'ODIT_VLR_UNITARIO=ODIT_VLR_UNITARIO'
      'ODIT_QTDE=ODIT_QTDE'
      'ODIT_VLR_TOTAL=ODIT_VLR_TOTAL'
      'USER_NOME_TECNICO=USER_NOME_TECNICO'
      'ODIT_USER_ID_TEC=ODIT_USER_ID_TEC'
      'FILTRO=FILTRO'
      'ATENDENTE=ATENDENTE'
      'ORDS_VLR_DESCONTO=ORDS_VLR_DESCONTO'
      'ORDS_VLR_TOTAL_OS=ORDS_VLR_TOTAL_OS'
      'VLR_PERC_DESC=VLR_PERC_DESC'
      'VLRCOMISSAOINTERNO=VLRCOMISSAOINTERNO'
      'VLRCOMISSAOEXTERNO=VLRCOMISSAOEXTERNO'
      'VLRCOMISSAOBALCAO=VLRCOMISSAOBALCAO'
      'ORDS_VLR_PAGO=ORDS_VLR_PAGO'
      'ORDS_HORARIO=ORDS_HORARIO')
    DataSource = dmRel_Ordem_Servico.dsPecas_Servicos
    BCDToCurrency = False
    Left = 952
    Top = 168
  end
  object frRelatorioOSPorAtendente: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 42537.798195150460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 904
    Top = 272
    Datasets = <
      item
        DataSet = dstRelatorioOS
        DataSetName = 'frDBRelatorioOS'
      end
      item
        DataSet = dstRelatorioOSItens
        DataSetName = 'frDBRelatorioOSItens'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 10
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 0.377952760000000000
        ParentFont = False
        Top = 151.181200000000000000
        Visible = False
        Width = 1046.929810000000000000
        object Line4: TfrxLineView
          Left = 0.377952760000000000
          Top = 0.377952760000000000
          Width = 718.110700000000000000
          Visible = False
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.377952760000000000
          Width = 94.488250000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118110236220470000
        Top = 480.000310000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.133858270000000000
          Width = 204.094620000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 922.205320000000000000
          Top = 1.133858270000000000
          Width = 124.724490000000000000
          Height = 13.228346460000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 2.779530000000000000
          Width = 1039.370750000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 83.149586770000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioOS
        DataSetName = 'frDBRelatorioOS'
        RowCount = 0
        object Shape2: TfrxShapeView
          Top = 2.000000000000000000
          Width = 1046.929810000000000000
          Height = 58.582677170000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Shape1: TfrxShapeView
          Left = 48.913420000000000000
          Top = 62.472480000000000000
          Width = 994.016390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo37: TfrxMemoView
          Left = 3.779527560000000000
          Top = 17.338590000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 60.252010000000000000
          Top = 17.338590000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Equipamento')
          ParentFont = False
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 288.803340000000000000
          Top = 17.338590000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 771.024120000000000000
          Top = 17.118120000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 977.339195360000000000
          Top = 17.338590000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Agenda')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 839.496600000000000000
          Top = 17.338590000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 345.496290000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 487.559370000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 909.087200000000000000
          Top = 17.338590000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 629.401980000000000000
          Top = 17.338590000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Filtro')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 32.236240000000000000
          Width = 52.913385830000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_ID'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779527560000000000
          Top = 47.354360000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_PROD_ID_EQUIP'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_PROD_ID_EQUIP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 110.385902440000000000
          Top = 32.236240000000000000
          Width = 49.133858270000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_ID'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 60.252010000000000000
          Top = 47.354360000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 161.519792440000000000
          Top = 32.236240000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 288.803340000000000000
          Top = 47.354360000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 333.157702440000000000
          Top = 32.236240000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_CEP'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_CEP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 345.496290000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."MARCA_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 390.071122440000000000
          Top = 32.236240000000000000
          Width = 162.519685040000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_ENDERECO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 487.559370000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."MODELO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 553.811382440000000000
          Top = 32.236240000000000000
          Width = 147.401565040000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_BAIRRO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_BAIRRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 629.401980000000000000
          Top = 47.354360000000000000
          Width = 139.842519690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FILTRO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."FILTRO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          Left = 702.433522440000000000
          Top = 32.236240000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PRACA'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."PRACA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          Left = 771.024120000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE1'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 874.291902440000000000
          Top = 32.236240000000000000
          Width = 18.897593860000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOS."UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 839.496600000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE2'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          Left = 894.410022440000000000
          Top = 32.236240000000000000
          Width = 147.401574800000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_REFERENCIA'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_REFERENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          Left = 977.339195360000000000
          Top = 47.354360000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_DTA_INSTALACAO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_DTA_INSTALACAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 909.087200000000000000
          Top = 47.354360000000000000
          Width = 66.141732280000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_TELEFONE3'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOS."CLIE_TELEFONE3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 60.252010000000000000
          Top = 66.252010000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Prod.')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 117.165430000000000000
          Top = 66.252010000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto/Servi'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          Left = 347.716760000000000000
          Top = 66.252010000000000000
          Width = 28.346456690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo49: TfrxMemoView
          Left = 421.307360000000000000
          Top = 66.252010000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 555.811380000000000000
          Top = 66.252010000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Left = 377.953000000000000000
          Top = 66.252010000000000000
          Width = 41.574803150000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Garantia')
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Left = 689.653990000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Unit.')
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          Left = 754.346940000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 818.937540000000000000
          Top = 66.252010000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo55: TfrxMemoView
          Left = 884.410020000000000000
          Top = 66.252010000000000000
          Width = 51.023612280000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status OS:')
          ParentFont = False
          WordWrap = False
        end
        object Memo56: TfrxMemoView
          Left = 937.543895360000000000
          Top = 66.252010000000000000
          Width = 102.047268500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'STATUS_OS'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."STATUS_OS"]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          Top = 30.456710000000000000
          Width = 1046.929133858268000000
          ShowHint = False
          Diagonal = True
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 52.913385830000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr'#186' O.S.')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 110.385902440000000000
          Top = 3.779530000000000000
          Width = 49.133858270000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd. Clie.')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 161.519792440000000000
          Top = 3.779530000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome / Raz'#227'o Social')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 333.157702440000000000
          Top = 3.779530000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 553.811382440000000000
          Top = 3.779530000000000000
          Width = 147.401565040000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 390.071122440000000000
          Top = 3.779530000000000000
          Width = 162.519685040000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 702.433522440000000000
          Top = 3.779530000000000000
          Width = 170.078740160000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 874.291902440000000000
          Top = 3.779530000000000000
          Width = 18.897593860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 894.410022440000000000
          Top = 3.779530000000000000
          Width = 147.401574800000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Refer'#234'ncia')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          Left = 58.472482440000000000
          Top = 3.779530000000000000
          Width = 51.023622050000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hor'#225'rio')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 58.472482440000000000
          Top = 32.236240000000000000
          Width = 51.023622050000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_HORARIO'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."ORDS_HORARIO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606372440000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
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
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 777.024120000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 852.614720000000000000
          Top = 3.779530000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 949.882409690000000000
          Top = 3.779530000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 780.937183620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 780.937183620000000000
          Top = 25.322837090000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 780.937183620000000000
          Top = 46.110238660000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 780.937183620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 780.937183620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 852.614720000000000000
          Top = 25.322837090000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 852.614720000000000000
          Top = 46.110238660000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 852.614720000000000000
          Top = 66.897640240000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 852.614720000000000000
          Top = 88.440947320000000000
          Width = 192.755939690000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 154.960730000000000000
          Top = 20.456712440000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 154.960730000000000000
          Top = 37.133892440000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 154.960730000000000000
          Top = 84.149662440000000000
          Width = 619.842700310000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Ordem(ns) de Servi'#231'os')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Top = 109.606372440000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 154.960730000000000000
          Top = 54.252010000000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677165350000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioOS."ATENDENTE"'
        object Shape3: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 20.787401570000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 3.779527560000000000
          Top = 1.889763780000000000
          Width = 96.377974720000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Atendente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 102.047310000000000000
          Top = 1.889763780000000000
          Width = 351.496216770000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ATENDENTE'
          DataSet = dstRelatorioOS
          DataSetName = 'frDBRelatorioOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioOS."ATENDENTE"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897637800000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo10: TfrxSysMemoView
          Left = 88.929190000000000000
          Width = 83.149606300000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 3.779527560000000000
          Width = 83.149606300000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total O.S.:')
          ParentFont = False
          WordWrap = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 13.228346460000000000
        Top = 362.834880000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioOSItens
        DataSetName = 'frDBRelatorioOSItens'
        RowCount = 0
        object Memo57: TfrxMemoView
          Left = 117.165430000000000000
          Width = 226.771690160000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Left = 60.252010000000000000
          Width = 54.803144720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_TPIT_PROD_ID'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_TPIT_PROD_ID"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo59: TfrxMemoView
          Left = 347.716760000000000000
          Width = 28.346456690000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_UNIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo61: TfrxMemoView
          Left = 421.307360000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."MARCA_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo62: TfrxMemoView
          Left = 555.811380000000000000
          Width = 132.283464570000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."MODELO_PROD"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo63: TfrxMemoView
          Left = 689.653990000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_UNITARIO'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_VLR_UNITARIO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo64: TfrxMemoView
          Left = 754.346940000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_QTDE'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_QTDE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 818.937540000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_TOTAL'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."ODIT_VLR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo60: TfrxMemoView
          Left = 377.953000000000000000
          Width = 41.574803150000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_GARANTIA'
          DataSet = dstRelatorioOSItens
          DataSetName = 'frDBRelatorioOSItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioOSItens."PROD_GARANTIA"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Line5: TfrxLineView
        Align = baBottom
        Top = 718.110700000000000000
        Width = 1046.929810000000000000
        ShowHint = False
        Diagonal = True
      end
    end
  end
  object frRelatorioAtendente: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41060.530634895800000000
    ReportOptions.LastChange = 42514.761003136580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgress = frRelatorioProgress
    Left = 920
    Top = 168
    Datasets = <
      item
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioComissoProf'
      end
      item
        DataSet = dstRelatorioPecasServicos
        DataSetName = 'frDBRelatorioPecasServicos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 10
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        Height = 0.377952760000000000
        ParentFont = False
        Top = 151.181200000000000000
        Visible = False
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.377952760000000000
          Width = 94.488250000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 680.315400000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 3.779527560000000000
          Top = 1.133858270000000000
          Width = 154.960730000000000000
          Height = 13.228346460000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'www.arsistemaseconsultoria.com.br')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          Left = 907.087200000000000000
          Top = 1.133858270000000000
          Width = 139.842610000000000000
          Height = 13.228346460000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Height = 92.598427640000000000
        ParentFont = False
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorio
        DataSetName = 'frDBRelatorioComissoProf'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 66.811070000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_ID"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 1.889763779527559000
          Top = -0.000000000000000444
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nr'#186' O.S.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 387.291590000000000000
          Top = 15.118120000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_CLIE_ID'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_CLIE_ID"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 321.260050000000000000
          Top = 15.118120000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Clie.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 653.079160000000000000
          Width = 391.181102362204700000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'CLIE_RAZAO_SOCIAL'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."CLIE_RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 605.945270000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 1.889763779527559000
          Top = 15.118120000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tab. Pre'#231'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 321.260050000000000000
          Top = 30.236240000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'd. Equip.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 605.945270000000000000
          Top = 15.118120000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Equip.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 1.889763779527559000
          Top = 30.236240000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Marca:')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 321.260050000000000000
          Top = 45.354360000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Modelo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 605.945270000000000000
          Top = 30.236240000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fornec.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          Left = 1.889763779527559000
          Top = 45.354360000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Filtro:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 605.945270000000000000
          Top = 45.354360000000000000
          Width = 45.354303860000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          Left = 66.811070000000000000
          Top = 15.118120000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TPRC_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."TPRC_DESCRICAO"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 66.811070000000000000
          Top = 30.236240000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_MARCA'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_MARCA"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 66.811070000000000000
          Top = 45.354360000000000000
          Width = 139.842536770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'FILTRO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."FILTRO"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 387.291590000000000000
          Top = 30.236240000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_PROD_ID_EQUIP'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_PROD_ID_EQUIP"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 387.291590000000000000
          Top = 45.354360000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_MODELO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_MODELO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 653.079160000000000000
          Top = 15.118120000000000000
          Width = 391.181102362204700000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'EQUIP_DESCRICAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."EQUIP_DESCRICAO"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 653.079160000000000000
          Top = 30.236240000000000000
          Width = 391.181102360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_GENE_ID_TIPO_OS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_GENE_ID_TIPO_OS"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 653.079160000000000000
          Top = 45.354360000000000000
          Width = 391.181102360000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'STATUS_OS'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."STATUS_OS"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 1.889763780000000000
          Top = 76.370130000000000000
          Width = 51.023614720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cod. Prod.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 54.692950000000000000
          Top = 76.370130000000000000
          Width = 219.212574020000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desc. Prod. / Servi'#231'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 276.126160000000000000
          Top = 76.370130000000000000
          Width = 28.346434720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 307.141930000000000000
          Top = 76.370130000000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Marca')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 422.527830000000000000
          Top = 76.370130000000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modelo')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 538.134200000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Unit.')
          ParentFont = False
          WordWrap = False
        end
        object Memo39: TfrxMemoView
          Left = 615.504330000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
          WordWrap = False
        end
        object Memo40: TfrxMemoView
          Left = 693.874460000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          Left = 772.024120000000000000
          Top = 76.370130000000000000
          Width = 37.795258500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo C.')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 813.039890000000000000
          Top = 76.370130000000000000
          Width = 56.692901180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Interno')
          ParentFont = False
          WordWrap = False
        end
        object Memo43: TfrxMemoView
          Left = 890.969080000000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Externo')
          ParentFont = False
          WordWrap = False
        end
        object Memo44: TfrxMemoView
          Left = 968.669711180000000000
          Top = 76.370130000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo45: TfrxMemoView
          Left = 813.039890000000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Interna')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 890.969080000000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Externa')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 968.669711180000000000
          Top = 61.252010000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Line5: TfrxLineView
          Align = baBottom
          Top = 92.598427640000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo88: TfrxMemoView
          Left = 387.291590000000000000
          Width = 120.944886770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ORDS_HORARIO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_HORARIO"]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 321.260050000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Hor'#225'rio:')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 109.606372440000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object imgLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779527560000000000
          Width = 143.622140000000000000
          Height = 98.267780000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lblFantasia: TfrxMemoView
          Left = 149.291338580000000000
          Top = 3.779527560000000000
          Width = 619.842700310000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Left = 777.024120000000000000
          Top = 3.779532440000000000
          Height = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          Left = 852.614720000000000000
          Top = 3.779530000000000000
          Width = 94.488188976378000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 949.882409690000000000
          Top = 3.779530000000000000
          Width = 94.488188980000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 780.937183620000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora: ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 780.937183620000000000
          Top = 18.787401570000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbTit01: TfrxMemoView
          Left = 780.937183620000000000
          Top = 34.133892440000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit02: TfrxMemoView
          Left = 780.937183620000000000
          Top = 66.897640240000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbTit03: TfrxMemoView
          Left = 780.937183620000000000
          Top = 88.440947320000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblUsuario: TfrxMemoView
          Left = 852.614720000000000000
          Top = 18.787401570000000000
          Width = 192.755939690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object lbFild01: TfrxMemoView
          Left = 852.614720000000000000
          Top = 34.133892440000000000
          Width = 192.755939690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild02: TfrxMemoView
          Left = 852.614720000000000000
          Top = 66.897640240000000000
          Width = 192.755939690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lbFild03: TfrxMemoView
          Left = 852.614720000000000000
          Top = 88.440947320000000000
          Width = 192.755939690000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '...')
          ParentFont = False
        end
        object lblEndereco: TfrxMemoView
          Left = 149.291338580000000000
          Top = 18.787401570000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object lblRazao_Social: TfrxMemoView
          Left = 149.291338580000000000
          Top = 34.133892440000000000
          Width = 619.842700310000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 149.291338580000000000
          Top = 80.370132440000000000
          Width = 619.842700310000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Comiss'#227'o por Atendente')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baBottom
          Top = 109.606372440000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object lblTelefone: TfrxMemoView
          Left = 149.291338580000000000
          Top = 49.252010000000000000
          Width = 619.842700310000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
          WordWrap = False
        end
      end
      object Line4: TfrxLineView
        Align = baBottom
        Left = 0.377952760000000000
        Top = 718.110700000000000000
        Visible = False
        ShowHint = False
        Diagonal = True
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 1.889763780000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."ORDS_ID"'
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456690470000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."ATENDENTE"'
        StartNewPage = True
        object Shape1: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 24.566929130000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 18.677180000000000000
          Top = 3.913385830000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Atendente:')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 107.496062990000000000
          Top = 3.913385830000000000
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ATENDENTE'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ATENDENTE"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 26.456690470000000000
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        Condition = 'frDBRelatorioComissoProf."ORDS_DTA_CADASTRO"'
        object Shape2: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 24.566929130000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo7: TfrxMemoView
          Left = 18.677180000000000000
          Top = 3.913385830000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dta Execu'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 107.496062990000000000
          Top = 3.913385830000000000
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ORDS_DTA_INSTALACAO'
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_DTA_INSTALACAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 506.457020000000000000
        Width = 1046.929810000000000000
        object Shape3: TfrxShapeView
          Top = 1.000000000000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo62: TfrxMemoView
          Left = 813.039890000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Interno')
          ParentFont = False
          WordWrap = False
        end
        object Memo63: TfrxMemoView
          Left = 890.969080000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Externo')
          ParentFont = False
          WordWrap = False
        end
        object Memo64: TfrxMemoView
          Left = 968.669711180000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 538.134200000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. da OS')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          Left = 615.504330000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Desc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 693.874460000000000000
          Top = 1.000000000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
          WordWrap = False
        end
        object Memo70: TfrxMemoView
          Left = 538.134200000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_TOTAL_OS"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 615.504330000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_DESCONTO"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 693.874460000000000000
          Top = 16.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."ORDS_VLR_PAGO"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 813.039890000000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOINTERNO"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 890.969080000000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOEXTERNO"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 968.669711180000000000
          Top = 16.338590000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioComissoProf."VLRCOMISSAOBALCAO"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 585.827150000000000000
        Width = 1046.929810000000000000
        object Shape4: TfrxShapeView
          Top = 2.000000000000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Shape = skRoundRectangle
        end
        object Memo71: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total O.S.:')
          ParentFont = False
          WordWrap = False
        end
        object Memo72: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779530000000000000
          Width = 64.251968500000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 520.016080000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total em OS')
          ParentFont = False
          WordWrap = False
        end
        object Memo74: TfrxMemoView
          Left = 609.835035000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total em Desc.')
          ParentFont = False
          WordWrap = False
        end
        object Memo78: TfrxMemoView
          Left = 699.433520000000000000
          Top = 3.779530000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total Geral')
          ParentFont = False
          WordWrap = False
        end
        object Memo79: TfrxMemoView
          Left = 520.016080000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_TOTAL_OS">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 609.835035000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_DESCONTO">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 699.433520000000000000
          Top = 18.118120000000000000
          Width = 86.929141180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frDBRelatorioComissoProf."ORDS_VLR_PAGO">,MasterData1)]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 813.039890000000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Interna')
          ParentFont = False
          WordWrap = False
        end
        object Memo83: TfrxMemoView
          Left = 890.969080000000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Externa')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          Left = 968.669711180000000000
          Top = 3.779530000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total C. Balc'#227'o')
          ParentFont = False
          WordWrap = False
        end
        object Memo85: TfrxMemoView
          Left = 813.039890000000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOINTERNO">,MasterData1' +
              ')]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 890.969080000000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOEXTERNO">,MasterData1' +
              ')]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 968.669711180000000000
          Top = 18.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataSet = dstRelatorio
          DataSetName = 'frDBRelatorioComissoProf'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frDBRelatorioComissoProf."VLRCOMISSAOBALCAO">,MasterData1)' +
              ']')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 1.889763780000000000
        Top = 559.370440000000000000
        Width = 1046.929810000000000000
      end
      object DetailData1: TfrxDetailData
        Height = 30.236240000000000000
        Top = 453.543600000000000000
        Width = 1046.929810000000000000
        DataSet = dstRelatorioPecasServicos
        DataSetName = 'frDBRelatorioPecasServicos'
        RowCount = 0
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Width = 51.023614720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_TPIT_PROD_ID'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_TPIT_PROD_ID"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 56.582716220000000000
          Width = 219.212574020000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_DESCRICAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_DESCRICAO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 278.015926220000000000
          Width = 28.346434720000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_UNIDADE'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_UNIDADE"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 309.031696220000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MARCA_PROD'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."MARCA_PROD"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 424.417596220000000000
          Width = 113.385826770000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'MODELO_PROD'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."MODELO_PROD"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 540.023966220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_UNITARIO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_VLR_UNITARIO"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 617.394096220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_QTDE'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_QTDE"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 695.764226220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'ODIT_VLR_TOTAL'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."ODIT_VLR_TOTAL"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 773.913886220000000000
          Width = 37.795258500000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'TIPO_COMISSAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."TIPO_COMISSAO"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 814.929656220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_INTERNA'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_INTERNA"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 892.858846220000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_EXTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_EXTERNO"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 970.559477400000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'PROD_COMISSAO_VEND_BALCAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."PROD_COMISSAO_VEND_BALCAO"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 814.929656220000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOINTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOINTERNO"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 892.858846220000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOEXTERNO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOEXTERNO"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 970.559477400000000000
          Top = 14.118120000000000000
          Width = 75.590551180000000000
          Height = 13.228346460000000000
          ShowHint = False
          DataField = 'VLRCOMISSAOBALCAO'
          DataSet = dstRelatorioPecasServicos
          DataSetName = 'frDBRelatorioPecasServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frDBRelatorioPecasServicos."VLRCOMISSAOBALCAO"]')
          ParentFont = False
        end
      end
    end
  end
end
