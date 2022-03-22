inherited fCadReplicaTabela: TfCadReplicaTabela
  Caption = 'Replicar Tabela de Pre'#231'o'
  ExplicitTop = -40
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label11: TLabel
        Left = 5
        Top = 160
        Width = 69
        Height = 13
        Caption = 'Dt. Vig'#234'ncia'
      end
      object Label12: TLabel
        Left = 135
        Top = 160
        Width = 69
        Height = 13
        Caption = 'Dt. Validade'
      end
      object Label7: TLabel
        Left = 317
        Top = 160
        Width = 69
        Height = 13
        Caption = 'Vlr. G'#244'ndola'
      end
      object Label8: TLabel
        Left = 454
        Top = 160
        Width = 62
        Height = 13
        Caption = 'Vlr. M'#237'nimo'
      end
      object Label9: TLabel
        Left = 578
        Top = 160
        Width = 68
        Height = 13
        Caption = 'Vlr. Especial'
      end
      object Label10: TLabel
        Left = 708
        Top = 160
        Width = 68
        Height = 13
        Caption = 'Vlr. Atacado'
      end
      object Label3: TLabel
        Left = 5
        Top = 51
        Width = 91
        Height = 13
        Caption = 'Tabela de Pre'#231'o'
      end
      inline frPesqTabPrecos: TfrPesqIndividual
        Left = 5
        Top = 4
        Width = 782
        Height = 42
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 4
        ExplicitWidth = 782
        ExplicitHeight = 42
        inherited Label2: TLabel
          Width = 77
          Caption = 'Tabela de Pre'#231'o'
          ExplicitWidth = 77
        end
        inherited btnInserir: TSpeedButton
          Enabled = False
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
      object rdAplicacao: TRadioGroup
        Left = 3
        Top = 98
        Width = 771
        Height = 45
        Caption = 'Tipo de Altera'#231#227'o de Pre'#231'o'
        Columns = 4
        ItemIndex = 1
        Items.Strings = (
          'Manter Pre'#231'os'
          'Aplicar em %'
          'Aplicar em R$')
        TabOrder = 2
        OnClick = rdAplicacaoClick
      end
      object edtDtInicio: TDateEdit
        Left = 5
        Top = 176
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
      object edtDtFim: TDateEdit
        Left = 135
        Top = 176
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 4
      end
      object edtVlrAtacado: TRxCalcEdit
        Left = 655
        Top = 176
        Width = 121
        Height = 21
        DisplayFormat = '0.00'
        ButtonWidth = 0
        MaxValue = 100.000000000000000000
        MinValue = -100.000000000000000000
        NumGlyphs = 2
        TabOrder = 8
      end
      object edtVlrEspecial: TRxCalcEdit
        Left = 525
        Top = 176
        Width = 121
        Height = 21
        DisplayFormat = '0.00'
        ButtonWidth = 0
        MaxValue = 100.000000000000000000
        MinValue = -100.000000000000000000
        NumGlyphs = 2
        TabOrder = 7
      end
      object edtVlrGondola: TRxCalcEdit
        Left = 265
        Top = 176
        Width = 121
        Height = 21
        DisplayFormat = '0.00'
        ButtonWidth = 0
        MaxValue = 100.000000000000000000
        MinValue = -100.000000000000000000
        NumGlyphs = 2
        TabOrder = 5
      end
      object edtVlrMinimo: TRxCalcEdit
        Left = 395
        Top = 176
        Width = 121
        Height = 21
        DisplayFormat = '0.00'
        ButtonWidth = 0
        MaxValue = 100.000000000000000000
        MinValue = -100.000000000000000000
        NumGlyphs = 2
        TabOrder = 6
      end
      object edtTabela: TEdit
        Left = 5
        Top = 69
        Width = 771
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
end
