inherited fCadEtapasObras: TfCadEtapasObras
  Caption = 'Lan'#231'amento das Etapas da Obra'
  ClientHeight = 656
  ClientWidth = 694
  ExplicitWidth = 700
  ExplicitHeight = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 694
    Height = 621
    ExplicitWidth = 694
    ExplicitHeight = 621
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 686
      ExplicitHeight = 593
      object Label1: TLabel
        Left = 5
        Top = 46
        Width = 61
        Height = 13
        Caption = 'Seq. Exec.'
        FocusControl = edtSequencia
      end
      object Label2: TLabel
        Left = 85
        Top = 46
        Width = 56
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object Label4: TLabel
        Left = 442
        Top = 46
        Width = 53
        Height = 13
        Caption = 'Seq. Ant.'
        FocusControl = edtSeqAnt
      end
      object Label3: TLabel
        Left = 5
        Top = 88
        Width = 86
        Height = 13
        Caption = 'Dt. Prev. Inicio'
        FocusControl = edtDescricao
      end
      object Label5: TLabel
        Left = 111
        Top = 88
        Width = 75
        Height = 13
        Caption = 'Dt. Prev. Fim'
        FocusControl = edtDescricao
      end
      object Label6: TLabel
        Left = 216
        Top = 88
        Width = 52
        Height = 13
        Caption = 'Dt. Inicio'
        FocusControl = edtDescricao
      end
      object Label7: TLabel
        Left = 322
        Top = 88
        Width = 41
        Height = 13
        Caption = 'Dt. Fim'
        FocusControl = edtDescricao
      end
      object Label8: TLabel
        Left = 5
        Top = 6
        Width = 73
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = edtDescricao
      end
      object Label9: TLabel
        Left = 431
        Top = 88
        Width = 73
        Height = 13
        Caption = 'Vlr. Previs'#227'o'
        FocusControl = edtDescricao
      end
      object btnSeq: TSpeedButton
        Left = 521
        Top = 61
        Width = 35
        Height = 22
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF008C8C
          8C005757570077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABAB007375
          8900AA878E005F5B5B0077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0089B0CA004088
          DF007376A800AD898E005F5B5B0077777700FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDE3FF0052B8
          FF004385D9007979A700AD898E005F5B5B0077777700FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D8
          FF0053B9FF004385D9007979A700AD898E005F5B5B0096969600FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF008CCCFF0053B8FE004483D6007979A700987D820081818100A1A1A1006C6C
          6C005757570057575700626262008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008ECEFF0053B8FE00588CCF008B8B8E008B757500BC9A8600CEB0
          9600E0C7AE00D2B4A4008B747200575757008C8C8C00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00A5D8FF00C9D0D400AB8B8800F1CFA900FFF5C500FFFD
          D100FFFFDB00FFFFDC00F5EFE0009F858100575757008C8C8C00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00E2CECE00EFC9A600FFF2C000FFF7C400FFFF
          D800FFFFE800FFFFF800FFFFFF00F3EDDA007B6161006C6C6C00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00E0BDB300FFF1C200FFE4B100FFF9C600FFFF
          DB00FFFFEC00FFFFFB00FFFFF700FFFFDA00B79E8C0057575700FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00E5BDA300FFF5C900FFDDAA00FFF5C200FFFF
          D600FFFFE500FFFFEC00FFFFE700FFFFD900CCB2990057575700FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00E5BFA600FFF5C900FFE6B900FFEFBC00FFFF
          CD00FFFFD700FFFFDB00FFFFD800FFFCD100CCAC93006C6C6C00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00E0C0B600FFF6CD00FFF2D700FFE3B900FFF1
          BF00FFF5C200FFF9C700FFF7C400FFF6C600B79481008C8C8C00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00DCC5C500EFDAC200FFFFFF00FFF7EA00FFEC
          BF00FFDFAC00FFE3B000FFF0BD00F3D2A80090767600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8BCBA00F1E5DD00FFFBE800FFF8
          CD00FFEEBC00FFF3C600F5CFA400B9938A00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC5C500D2B19E00CEA8
          8E00E0B89E00DCB3A0008C8C8C00FFFFFF00FFFFFF00FFFFFF00}
        OnClick = btnSeqClick
      end
      object edtSequencia: TDBEdit
        Left = 5
        Top = 62
        Width = 75
        Height = 21
        DataField = 'OBET_SEQUENCIA'
        DataSource = dmControle_Obras.dsEtapas_Obras
        TabOrder = 1
        OnKeyPress = edtCodProdKeyPress
      end
      object edtDescricao: TDBEdit
        Left = 85
        Top = 62
        Width = 351
        Height = 21
        DataField = 'OBET_DESCRICAO'
        DataSource = dmControle_Obras.dsEtapas_Obras
        TabOrder = 2
      end
      object edtDtPrevInicio: TDBDateEdit
        Left = 5
        Top = 104
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBET_DTA_PREV_INICIO'
        DataSource = dmControle_Obras.dsEtapas_Obras
        NumGlyphs = 2
        TabOrder = 4
      end
      object edtDtPrevFim: TDBDateEdit
        Left = 111
        Top = 104
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBET_DTA_PREV_FIM'
        DataSource = dmControle_Obras.dsEtapas_Obras
        NumGlyphs = 2
        TabOrder = 5
      end
      object DBDateEdit3: TDBDateEdit
        Left = 216
        Top = 104
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OBET_DTA_INICIO'
        DataSource = dmControle_Obras.dsEtapas_Obras
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 6
      end
      object DBDateEdit4: TDBDateEdit
        Left = 322
        Top = 104
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OBET_DTA_FIM'
        DataSource = dmControle_Obras.dsEtapas_Obras
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 7
      end
      object DBDateEdit5: TDBDateEdit
        Left = 5
        Top = 22
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OBET_DTA_CADASTRO'
        DataSource = dmControle_Obras.dsEtapas_Obras
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtSeqAnt: TDBEdit
        Left = 442
        Top = 62
        Width = 75
        Height = 21
        DataField = 'OBET_SEQUENCIA_ANTERIOR'
        DataSource = dmControle_Obras.dsEtapas_Obras
        TabOrder = 3
        OnKeyPress = edtCodProdKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 135
        Width = 686
        Height = 458
        Align = alBottom
        Caption = 'Item Consumidos'
        TabOrder = 10
        object GroupBox2: TGroupBox
          Left = 2
          Top = 15
          Width = 682
          Height = 90
          Align = alTop
          TabOrder = 0
          object Label10: TLabel
            Left = 8
            Top = 8
            Width = 61
            Height = 13
            Caption = 'C'#243'd. Prod.'
            OnClick = Label10Click
            OnMouseMove = Label10MouseMove
            OnMouseLeave = Label10MouseLeave
          end
          object Label11: TLabel
            Left = 162
            Top = 8
            Width = 92
            Height = 13
            Caption = 'Produto/Servi'#231'o'
            OnClick = Label10Click
            OnMouseMove = Label10MouseMove
            OnMouseLeave = Label10MouseLeave
          end
          object Label12: TLabel
            Left = 368
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Qtde'
          end
          object btnPesqProd: TSpeedButton
            Left = 86
            Top = 23
            Width = 35
            Height = 22
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FFFFFF008C8C
              8C005757570077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABAB007375
              8900AA878E005F5B5B0077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0089B0CA004088
              DF007376A800AD898E005F5B5B0077777700FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDE3FF0052B8
              FF004385D9007979A700AD898E005F5B5B0077777700FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D8
              FF0053B9FF004385D9007979A700AD898E005F5B5B0096969600FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF008CCCFF0053B8FE004483D6007979A700987D820081818100A1A1A1006C6C
              6C005757570057575700626262008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008ECEFF0053B8FE00588CCF008B8B8E008B757500BC9A8600CEB0
              9600E0C7AE00D2B4A4008B747200575757008C8C8C00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00A5D8FF00C9D0D400AB8B8800F1CFA900FFF5C500FFFD
              D100FFFFDB00FFFFDC00F5EFE0009F858100575757008C8C8C00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00E2CECE00EFC9A600FFF2C000FFF7C400FFFF
              D800FFFFE800FFFFF800FFFFFF00F3EDDA007B6161006C6C6C00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00E0BDB300FFF1C200FFE4B100FFF9C600FFFF
              DB00FFFFEC00FFFFFB00FFFFF700FFFFDA00B79E8C0057575700FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00E5BDA300FFF5C900FFDDAA00FFF5C200FFFF
              D600FFFFE500FFFFEC00FFFFE700FFFFD900CCB2990057575700FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00E5BFA600FFF5C900FFE6B900FFEFBC00FFFF
              CD00FFFFD700FFFFDB00FFFFD800FFFCD100CCAC93006C6C6C00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00E0C0B600FFF6CD00FFF2D700FFE3B900FFF1
              BF00FFF5C200FFF9C700FFF7C400FFF6C600B79481008C8C8C00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00DCC5C500EFDAC200FFFFFF00FFF7EA00FFEC
              BF00FFDFAC00FFE3B000FFF0BD00F3D2A80090767600FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8BCBA00F1E5DD00FFFBE800FFF8
              CD00FFEEBC00FFF3C600F5CFA400B9938A00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC5C500D2B19E00CEA8
              8E00E0B89E00DCB3A0008C8C8C00FFFFFF00FFFFFF00FFFFFF00}
            OnClick = btnPesqProdClick
          end
          object btnAdicProd: TSpeedButton
            Left = 124
            Top = 23
            Width = 35
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = btnAdicProdClick
          end
          object Label13: TLabel
            Left = 603
            Top = 8
            Width = 29
            Height = 13
            Caption = 'Unid.'
            FocusControl = DBEdit1
          end
          object Label15: TLabel
            Left = 8
            Top = 47
            Width = 34
            Height = 13
            Caption = 'Marca'
            FocusControl = DBEdit3
          end
          object Label16: TLabel
            Left = 164
            Top = 47
            Width = 40
            Height = 13
            Caption = 'Modelo'
            FocusControl = DBEdit4
          end
          object Label14: TLabel
            Left = 425
            Top = 47
            Width = 50
            Height = 13
            Caption = 'Vlr. Unit.'
          end
          object edtCodProd: TDBEdit
            Left = 8
            Top = 24
            Width = 75
            Height = 21
            DataField = 'OBEI_PROD_ID'
            DataSource = dmControle_Obras.dsItensEtapas
            ImeName = 'btnPesqProd'
            TabOrder = 0
            OnExit = edtCodProdExit
            OnKeyPress = edtCodProdKeyPress
          end
          object DBEdit5: TDBEdit
            Left = 162
            Top = 24
            Width = 435
            Height = 21
            TabStop = False
            Color = clGradientInactiveCaption
            DataField = 'PROD_DESCRICAO'
            DataSource = dmControle_Obras.dsItensEtapas
            ReadOnly = True
            TabOrder = 1
          end
          object btnAdicionar: TBitBtn
            Left = 479
            Top = 58
            Width = 100
            Height = 25
            Caption = '+ Adicionar'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 7
            OnClick = btnAdicionarClick
          end
          object btnRetirar: TBitBtn
            Left = 578
            Top = 58
            Width = 100
            Height = 25
            Caption = '- Retirar'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 8
            OnClick = btnRetirarClick
          end
          object edtQtde: TRxDBCalcEdit
            Left = 320
            Top = 62
            Width = 75
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'OBEI_QTDE'
            DataSource = dmControle_Obras.dsItensEtapas
            DisplayFormat = '###,###,##0.0000'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 5
            OnKeyPress = edtQtdeKeyPress
          end
          object DBEdit1: TDBEdit
            Left = 603
            Top = 24
            Width = 75
            Height = 21
            TabStop = False
            Color = clGradientInactiveCaption
            DataField = 'PROD_UNIDADE'
            DataSource = dmControle_Obras.dsItensEtapas
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 8
            Top = 62
            Width = 150
            Height = 21
            TabStop = False
            Color = clGradientInactiveCaption
            DataField = 'MARCA_PROD'
            DataSource = dmControle_Obras.dsItensEtapas
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 164
            Top = 62
            Width = 150
            Height = 21
            TabStop = False
            Color = clGradientInactiveCaption
            DataField = 'MODELO_PROD'
            DataSource = dmControle_Obras.dsItensEtapas
            ReadOnly = True
            TabOrder = 4
          end
          object edtVlrUnit: TRxDBCalcEdit
            Left = 400
            Top = 62
            Width = 75
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'OBEI_VLR_UNIT'
            DataSource = dmControle_Obras.dsItensEtapas
            DisplayFormat = '###,###,##0.0000'
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 6
          end
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 105
          Width = 682
          Height = 351
          TabStop = False
          Align = alClient
          DataSource = dmControle_Obras.dsItensEtapas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnEnter = DBGrid1Enter
        end
      end
      object rdStatus: TDBRadioGroup
        Left = 561
        Top = 8
        Width = 122
        Height = 117
        Caption = 'Status'
        DataField = 'OBET_STATUS'
        DataSource = dmControle_Obras.dsEtapas_Obras
        Items.Strings = (
          'Aguardando'
          'Em Obras'
          'Paralisada'
          'Finalizada'
          'Cancelada')
        ParentBackground = True
        TabOrder = 9
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
      end
      object DBEdit2: TDBEdit
        Left = 431
        Top = 104
        Width = 125
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        Color = clGradientInactiveCaption
        DataField = 'OBET_VLR_PREVISAO'
        DataSource = dmControle_Obras.dsEtapas_Obras
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
  inherited Panel1: TPanel
    Top = 621
    Width = 694
    ExplicitTop = 621
    ExplicitWidth = 694
    inherited btnOK: TSpeedButton
      Left = 390
      ExplicitLeft = 390
    end
    inherited btnCancelar: TSpeedButton
      Left = 541
      ExplicitLeft = 541
    end
  end
end
