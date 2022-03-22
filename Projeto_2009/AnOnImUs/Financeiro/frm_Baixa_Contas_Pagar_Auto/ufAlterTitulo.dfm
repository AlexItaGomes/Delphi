inherited fCadAlterTitulo: TfCadAlterTitulo
  Caption = 'Altera'#231#227'o de T'#237'tulo'
  ClientHeight = 157
  ClientWidth = 683
  Constraints.MinHeight = 144
  Constraints.MinWidth = 620
  ExplicitWidth = 689
  ExplicitHeight = 186
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 683
    Height = 102
    ExplicitWidth = 683
    ExplicitHeight = 102
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 675
      ExplicitHeight = 74
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
          ParentFont = False
          ExplicitWidth = 333
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
    Top = 102
    Width = 683
    ExplicitTop = 102
    ExplicitWidth = 683
    inherited btnOK: TSpeedButton
      Left = 333
      ExplicitLeft = 314
    end
    inherited btnCancelar: TSpeedButton
      Left = 508
      ExplicitLeft = 464
    end
  end
end
