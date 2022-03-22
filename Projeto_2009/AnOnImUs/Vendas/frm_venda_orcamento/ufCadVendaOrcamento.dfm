inherited fCadVendaOrcamento: TfCadVendaOrcamento
  Caption = 'Or'#231'amento / Venda'
  ClientHeight = 672
  ClientWidth = 918
  ExplicitWidth = 924
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 918
    Height = 617
    ExplicitWidth = 918
    ExplicitHeight = 617
    inherited tabCadastro: TTabSheet
      Caption = '&1.Pedido/Or'#231'amento'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 910
      ExplicitHeight = 589
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 910
        Height = 181
        Align = alTop
        Caption = 'Dados do Pedido'
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Nr'#186' Or'#231'.'
        end
        object Label2: TLabel
          Left = 108
          Top = 16
          Width = 73
          Height = 13
          Caption = 'Dt. Cadastro'
        end
        object edtCodigo: TEdit
          Left = 5
          Top = 30
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientActiveCaption
          ReadOnly = True
          TabOrder = 0
        end
        object edtDtCadastro: TDateEdit
          Left = 108
          Top = 30
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientActiveCaption
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 1
        end
        inline frPesqIndividual1: TfrPesqIndividual
          Left = 3
          Top = 51
          Width = 894
          Height = 40
          TabOrder = 2
          ExplicitLeft = 3
          ExplicitTop = 51
          ExplicitWidth = 894
          inherited Label1: TLabel
            Width = 67
            ExplicitWidth = 67
          end
          inherited Label2: TLabel
            Width = 40
            Caption = 'Cliente'
            ExplicitWidth = 40
          end
          inherited Label3: TLabel
            Left = 1500
            Width = 56
            ExplicitLeft = 1500
            ExplicitWidth = 56
          end
          inherited Label4: TLabel
            Left = 572
            Width = 56
            Caption = 'CPF/CNPJ'
            ExplicitLeft = 572
            ExplicitWidth = 56
          end
          inherited edtDescricao: TEdit
            Width = 370
            ExplicitWidth = 370
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 0
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 546
            Width = 136
            ExplicitLeft = 546
            ExplicitWidth = 136
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
        inline frPesqIndividual2: TfrPesqIndividual
          Left = 3
          Top = 94
          Width = 894
          Height = 40
          TabOrder = 3
          ExplicitLeft = 3
          ExplicitTop = 94
          ExplicitWidth = 894
          inherited Label1: TLabel
            Width = 67
            ExplicitWidth = 67
          end
          inherited Label2: TLabel
            Width = 55
            Caption = 'Vendedor'
            ExplicitWidth = 55
          end
          inherited Label3: TLabel
            Left = 1500
            Width = 56
            ExplicitLeft = 1500
            ExplicitWidth = 56
          end
          inherited Label4: TLabel
            Left = 1500
            Width = 56
            ExplicitLeft = 1500
            ExplicitWidth = 56
          end
          inherited edtDescricao: TEdit
            Width = 370
            ExplicitWidth = 370
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 23
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
        inline frPesqIndividual3: TfrPesqIndividual
          Left = 3
          Top = 137
          Width = 894
          Height = 40
          TabOrder = 4
          ExplicitLeft = 3
          ExplicitTop = 137
          ExplicitWidth = 894
          inherited Label1: TLabel
            Width = 67
            ExplicitWidth = 67
          end
          inherited Label2: TLabel
            Width = 92
            Caption = 'Tabela de Pre'#231'o'
            ExplicitWidth = 92
          end
          inherited Label3: TLabel
            Left = 1500
            Width = 56
            ExplicitLeft = 1500
            ExplicitWidth = 56
          end
          inherited Label4: TLabel
            Left = 1500
            Width = 56
            ExplicitLeft = 1500
            ExplicitWidth = 56
          end
          inherited edtDescricao: TEdit
            Width = 370
            ExplicitWidth = 370
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 9
          end
          inherited ckOmitir: TCheckBox
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtOpcao1: TEdit
            Left = 1500
            ExplicitLeft = 1500
          end
        end
        object ckEntregaFutura: TCheckBox
          Left = 214
          Top = 10
          Width = 109
          Height = 17
          Caption = 'Entrega Futura?'
          TabOrder = 5
          OnClick = ckEntregaFuturaClick
        end
        object edtDtEntFutura: TDateEdit
          Left = 214
          Top = 30
          Width = 100
          Height = 21
          Enabled = False
          NumGlyphs = 2
          TabOrder = 6
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 256
        Width = 910
        Height = 331
        Align = alTop
        Caption = 'Item(ns) do Pedido'
        TabOrder = 1
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 181
        Width = 910
        Height = 75
        Align = alTop
        Caption = 'Produto'
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Dados do Cliente'
      ImageIndex = 1
    end
  end
  inherited Panel1: TPanel
    Top = 617
    Width = 918
    ExplicitTop = 617
    ExplicitWidth = 918
    inherited btnOK: TSpeedButton
      Left = 568
      ExplicitLeft = 527
    end
    inherited btnCancelar: TSpeedButton
      Left = 743
      ExplicitLeft = 677
    end
  end
end
