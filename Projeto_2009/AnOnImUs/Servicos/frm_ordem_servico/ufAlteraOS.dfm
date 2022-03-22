inherited fAlteraOS: TfAlteraOS
  Caption = 'Altera'#231#227'o de OS'
  ClientHeight = 137
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  ExplicitWidth = 800
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 82
    ExplicitHeight = 82
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 54
      inline frPesquisa: TfrPesqIndividual
        Left = 0
        Top = 0
        Width = 786
        Height = 54
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 786
        ExplicitHeight = 54
        inherited btnInserir: TSpeedButton
          Enabled = False
        end
        inherited Label3: TLabel
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited Label4: TLabel
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited edtDescricao: TEdit
          Width = 608
          ExplicitWidth = 608
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 22
        end
        inherited ckOmitir: TCheckBox
          Left = 1500
          Enabled = False
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
        inherited ckPlanoContas: TCheckBox
          Left = 1500
          Enabled = False
          ExplicitLeft = 1500
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 82
    ExplicitTop = 82
  end
end
