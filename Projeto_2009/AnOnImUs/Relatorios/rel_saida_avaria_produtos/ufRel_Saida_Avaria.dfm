inherited fRel_Saida_Avaria: TfRel_Saida_Avaria
  Caption = 'fRel_Saida_Avaria'
  ExplicitWidth = 990
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1108
      ExplicitLeft = 1108
    end
    inherited lbCadEditar: TLabel
      Left = 1108
      ExplicitLeft = 1108
    end
    inherited lbCadExcluir: TLabel
      Left = 1108
      ExplicitLeft = 1108
    end
    inherited lbCadLocalizar: TLabel
      Left = 1199
      ExplicitLeft = 1199
    end
    inherited lbCadImprimir: TLabel
      Left = 1199
      ExplicitLeft = 1199
    end
    inherited lbCadSair: TLabel
      Left = 1199
      ExplicitLeft = 1199
    end
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
    inherited btnImprimir: TSpeedButton
      Anchors = [akRight]
      Enabled = True
      Visible = True
      ExplicitLeft = 832
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited gropGridPrincipal: TGroupBox
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 980
      Height = 476
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object GroupBox6: TGroupBox
        Left = 517
        Top = 10
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro'
        TabOrder = 1
        object edtDtInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object rdOrdena: TRadioGroup
        Left = 517
        Top = 123
        Width = 216
        Height = 65
        Caption = 'Ordena'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Nr'#186' Registro'
          'Nr'#186' Doc.'
          'Status'
          'Dt. Cadastro')
        TabOrder = 3
      end
      object rdStatus: TRadioGroup
        Left = 517
        Top = 58
        Width = 216
        Height = 65
        Caption = 'Status'
        Columns = 2
        ItemIndex = 3
        Items.Strings = (
          'Abertos'
          'Conciliados'
          'Cancelados'
          'Todos')
        TabOrder = 2
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 517
        Top = 191
        Width = 216
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 4
      end
      inline frPesqSaidaAvaria: TfrPesquisa
        Left = 5
        Top = 10
        Width = 508
        Height = 180
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 10
        ExplicitWidth = 508
        inherited GroupBox1: TGroupBox
          Width = 379
          ExplicitWidth = 379
          inherited Label1: TLabel
            Width = 40
            ExplicitWidth = 40
          end
          inherited Label2: TLabel
            Width = 74
            Caption = 'Sa'#237'da Avulsa'
            ExplicitWidth = 74
          end
          inherited rdContenha: TRadioGroup
            Width = 375
            ExplicitWidth = 375
          end
          inherited lbRegistros: TListBox
            Width = 375
            ExplicitWidth = 375
          end
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 20
        end
      end
    end
  end
end
