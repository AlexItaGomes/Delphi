inherited fAlteraTit: TfAlteraTit
  Caption = 'Altera'#231#227'o de T'#237'tulo'
  ClientHeight = 160
  ClientWidth = 683
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Name = 'Segoe UI'
  Font.Style = []
  ExplicitWidth = 689
  ExplicitHeight = 189
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 683
    Height = 105
    ExplicitWidth = 683
    ExplicitHeight = 105
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 675
      ExplicitHeight = 77
      inline frPesquisa: TfrPesqIndividual
        Left = 5
        Top = 5
        Width = 668
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 668
        inherited Label3: TLabel
          Left = 514
          Caption = 'Dedut'#237'vel'
          ExplicitLeft = 514
        end
        inherited Label4: TLabel
          Left = 591
          ExplicitLeft = 591
        end
        inherited edtCodigo: TEdit
          HelpContext = 1
        end
        inherited edtDescricao: TEdit
          Width = 333
          ExplicitWidth = 333
        end
        inherited rdMovimento: TRadioGroup
          ItemIndex = 0
        end
        inherited edtOpcao: TEdit
          Left = 514
          ExplicitLeft = 514
        end
        inherited edtOpcao1: TEdit
          Left = 591
          ExplicitLeft = 591
        end
        inherited ckPlanoContas: TCheckBox
          Left = 244
          ExplicitLeft = 244
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 105
    Width = 683
    ExplicitTop = 105
    ExplicitWidth = 683
    inherited btnOK: TSpeedButton
      Left = 333
      ExplicitLeft = 333
    end
    inherited btnCancelar: TSpeedButton
      Left = 508
      ExplicitLeft = 508
    end
  end
end
