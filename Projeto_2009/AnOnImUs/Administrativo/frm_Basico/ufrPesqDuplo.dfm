object frPesqDuplo: TfrPesqDuplo
  Left = 0
  Top = 0
  Width = 627
  Height = 80
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  inline frPesqPrimeiro: TfrPesqIndividual
    Left = 0
    Top = 0
    Width = 627
    Height = 40
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 627
    inherited Label2: TLabel
      Width = 24
      Caption = 'Rota'
      ExplicitWidth = 24
    end
    inherited btnPesquisar: TSpeedButton
      OnClick = frPesqPrimeirobtnPesquisarClick
    end
    inherited btnInserir: TSpeedButton
      OnClick = frPesqPrimeirobtnInserirClick
    end
    inherited Label3: TLabel
      Width = 43
      Caption = 'Km Total'
      ExplicitWidth = 43
    end
    inherited edtCodigo: TEdit
      Top = 16
      OnExit = frPesqPrimeiroedtCodigoExit
      OnKeyDown = frPesqPrimeiroedtCodigoKeyDown
      OnKeyPress = frPesqPrimeiroedtCodigoKeyPress
      ExplicitTop = 16
    end
  end
  inline frPesqSegundo: TfrPesqIndividual
    Left = 0
    Top = 40
    Width = 627
    Height = 40
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 40
    ExplicitWidth = 627
    inherited Label2: TLabel
      Width = 36
      Caption = 'Regi'#227'o'
      ExplicitWidth = 36
    end
    inherited btnPesquisar: TSpeedButton
      Enabled = False
      OnClick = frPesqSegundobtnPesquisarClick
    end
    inherited btnInserir: TSpeedButton
      Enabled = False
      OnClick = frPesqSegundobtnInserirClick
    end
    inherited Label3: TLabel
      Width = 43
      Caption = 'Km Total'
      ExplicitWidth = 43
    end
    inherited edtCodigo: TEdit
      TabStop = False
      ReadOnly = True
    end
  end
end
