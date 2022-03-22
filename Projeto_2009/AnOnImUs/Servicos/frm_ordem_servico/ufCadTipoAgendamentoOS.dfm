inherited fCadTipoAgendamentoOS: TfCadTipoAgendamentoOS
  Caption = 'Tipo de Agendamento'
  ClientHeight = 149
  Constraints.MinHeight = 149
  ExplicitWidth = 800
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 94
    ExplicitHeight = 94
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 66
      inline frPesquisa: TfrPesqIndividual
        Left = 4
        Top = 5
        Width = 765
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 5
        ExplicitWidth = 765
        inherited Label2: TLabel
          Width = 114
          Caption = 'Tipo de Agendamento'
          ExplicitWidth = 114
        end
        inherited Label3: TLabel
          Left = 813
          ExplicitLeft = 813
        end
        inherited Label4: TLabel
          Left = 789
          ExplicitLeft = 789
        end
        inherited edtCodigo: TEdit
          TabOrder = 1
        end
        inherited edtDescricao: TEdit
          Width = 584
          TabOrder = 2
          ExplicitWidth = 584
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 32
        end
        inherited ckOmitir: TCheckBox
          Left = 829
          ExplicitLeft = 829
        end
        inherited edtOpcao: TEdit
          Left = 789
          TabOrder = 0
          ExplicitLeft = 789
        end
        inherited edtOpcao1: TEdit
          Left = 829
          ExplicitLeft = 829
        end
        inherited ckPlanoContas: TCheckBox
          Left = 500
          Top = 3
          ExplicitLeft = 500
          ExplicitTop = 3
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 94
    ExplicitTop = 94
  end
end
