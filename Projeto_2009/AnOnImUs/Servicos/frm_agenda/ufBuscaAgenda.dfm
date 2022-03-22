inherited fBuscaAgenda: TfBuscaAgenda
  Caption = 'Buscando Agendamento'
  ClientHeight = 164
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Name = 'Segoe UI'
  Font.Style = []
  ExplicitWidth = 800
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 109
    ExplicitHeight = 109
    inherited tabCadastro: TTabSheet
      Caption = '&1.Pesquisa'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 81
      inline frPesqCliente: TfrPesqIndividual
        Left = 0
        Top = 19
        Width = 783
        Height = 43
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 19
        ExplicitWidth = 783
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
          Top = 18
          OnClick = frPesqClientebtnPesquisarClick
          ExplicitLeft = 106
          ExplicitTop = 18
        end
        inherited btnInserir: TSpeedButton
          Left = 140
          Top = 18
          ExplicitLeft = 140
          ExplicitTop = 18
        end
        inherited Label3: TLabel
          Left = 577
          Top = 3
          Width = 24
          Caption = 'Data'
          Visible = True
          ExplicitLeft = 577
          ExplicitTop = 3
          ExplicitWidth = 24
        end
        inherited Label4: TLabel
          Left = 680
          Top = 3
          Width = 25
          Caption = 'Hora'
          Visible = True
          ExplicitLeft = 680
          ExplicitTop = 3
          ExplicitWidth = 25
        end
        inherited edtCodigo: TEdit
          Top = 19
          TabOrder = 2
          ExplicitTop = 19
        end
        inherited edtDescricao: TEdit
          Left = 176
          Width = 399
          ExplicitLeft = 176
          ExplicitWidth = 399
        end
        inherited rdOpcoes: TRadioGroup
          Left = -259
          Top = 29
          ItemIndex = 37
          ExplicitLeft = -259
          ExplicitTop = 29
        end
        inherited ckOmitir: TCheckBox
          Left = 922
          ExplicitLeft = 922
        end
        inherited edtOpcao: TEdit
          Left = 577
          Width = 100
          TabOrder = 0
          Visible = True
          ExplicitLeft = 577
          ExplicitWidth = 100
        end
        inherited edtOpcao1: TEdit
          Left = 680
          Width = 100
          Visible = True
          ExplicitLeft = 680
          ExplicitWidth = 100
        end
        inherited ckPlanoContas: TCheckBox
          Left = -500
          ExplicitLeft = -500
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 109
    ExplicitTop = 109
    inherited btnOK: TSpeedButton
      Left = 619
      ExplicitLeft = 619
    end
    inherited btnCancelar: TSpeedButton
      Width = 0
      ExplicitLeft = 619
      ExplicitWidth = 0
    end
  end
end
