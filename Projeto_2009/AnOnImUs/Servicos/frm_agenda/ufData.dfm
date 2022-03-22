inherited fData: TfData
  Caption = 'Selecione uma Data'
  ClientHeight = 602
  ClientWidth = 1031
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  ExplicitWidth = 1037
  ExplicitHeight = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Width = 1031
    Height = 547
    ExplicitWidth = 1031
    ExplicitHeight = 547
    inherited tabCadastro: TTabSheet
      Caption = '&1.Data p/ Reagendar'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1023
      ExplicitHeight = 519
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 24
        Height = 13
        Caption = 'Data'
      end
      object Label2: TLabel
        Left = 136
        Top = 2
        Width = 25
        Height = 13
        Caption = 'Hora'
      end
      object lbDomingo: TLabel
        Left = 8
        Top = 44
        Width = 1012
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Aten'#231#227'o !!! A data selecionada ser'#225' em um DOMINGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 63
        Width = 1023
        Height = 456
        Align = alBottom
        Caption = 'Hor'#225'rios Dispon'#237'veis'
        TabOrder = 3
        object grdBasico: TDBGrid
          Left = 2
          Top = 15
          Width = 1019
          Height = 439
          TabStop = False
          Align = alClient
          DataSource = dsGrid
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = grdBasicoDrawColumnCell
          OnDblClick = grdBasicoDblClick
          OnKeyPress = FormKeyPress
        end
      end
      inline frPesqAtendente: TfrPesqIndividual
        Left = 266
        Top = -1
        Width = 716
        Height = 47
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 266
        ExplicitTop = -1
        ExplicitWidth = 716
        ExplicitHeight = 47
        inherited Label1: TLabel
          Width = 56
          ExplicitWidth = 56
        end
        inherited Label2: TLabel
          Left = 176
          Width = 54
          Caption = 'Profissional'
          ExplicitLeft = 176
          ExplicitWidth = 54
        end
        inherited btnPesquisar: TSpeedButton
          Left = 106
          Top = 21
          ExplicitLeft = 106
          ExplicitTop = 21
        end
        inherited btnInserir: TSpeedButton
          Left = 140
          Top = 21
          ExplicitLeft = 140
          ExplicitTop = 21
        end
        inherited Label3: TLabel
          Left = 1021
          Width = 46
          ExplicitLeft = 1021
          ExplicitWidth = 46
        end
        inherited Label4: TLabel
          Left = 1098
          Width = 46
          ExplicitLeft = 1098
          ExplicitWidth = 46
        end
        inherited edtCodigo: TEdit
          Left = 0
          Top = 22
          TabOrder = 2
          ExplicitLeft = 0
          ExplicitTop = 22
        end
        inherited edtDescricao: TEdit
          Left = 176
          Top = 22
          Width = 537
          ExplicitLeft = 176
          ExplicitTop = 22
          ExplicitWidth = 537
        end
        inherited rdOpcoes: TRadioGroup
          Left = -259
          Top = 61
          ItemIndex = 11
          ExplicitLeft = -259
          ExplicitTop = 61
        end
        inherited rdMovimento: TRadioGroup
          Top = 67
          ExplicitTop = 67
        end
        inherited ckOmitir: TCheckBox
          Left = 922
          ExplicitLeft = 922
        end
        inherited edtOpcao: TEdit
          Left = 1021
          TabOrder = 0
          ExplicitLeft = 1021
        end
        inherited edtOpcao1: TEdit
          Left = 1098
          ExplicitLeft = 1098
        end
        inherited ckPlanoContas: TCheckBox
          Left = -500
          ExplicitLeft = -500
        end
      end
      object edtData: TDateEdit
        Left = 8
        Top = 20
        Width = 121
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnChange = edtDataChange
      end
      object edtHorario: TMaskEdit
        Left = 135
        Top = 20
        Width = 118
        Height = 21
        EditMask = '##:##'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        Text = '  :  '
      end
    end
  end
  inherited Panel1: TPanel
    Top = 547
    Width = 1031
    ExplicitTop = 547
    ExplicitWidth = 1031
    inherited btnHelp: TSpeedButton
      Visible = False
    end
    inherited btnOK: TSpeedButton
      Left = 681
      ExplicitLeft = 174
    end
    inherited btnCancelar: TSpeedButton
      Left = 856
      ExplicitLeft = 349
    end
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 264
  end
  object dsGrid: TDataSource
    DataSet = cdsAgenda
    Left = 952
    Top = 168
  end
end
