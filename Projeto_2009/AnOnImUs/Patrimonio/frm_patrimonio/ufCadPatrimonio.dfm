inherited fCadPatrimonio: TfCadPatrimonio
  Caption = 'Cadastro de Patrim'#244'nio'
  Font.Name = 'Segoe UI'
  Font.Style = []
  ExplicitWidth = 800
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ParentFont = False
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 489
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 108
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label3: TLabel
        Left = 3
        Top = 48
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtPatrimonio
      end
      object Label4: TLabel
        Left = 710
        Top = 48
        Width = 60
        Height = 13
        Caption = 'Vlr. Compra'
        FocusControl = edtPatrimonio
      end
      object Label7: TLabel
        Left = 3
        Top = 88
        Width = 31
        Height = 13
        Caption = 'Marca'
        FocusControl = DBEdit2
      end
      object Label8: TLabel
        Left = 395
        Top = 88
        Width = 40
        Height = 13
        Caption = 'Modelo'
        FocusControl = DBEdit3
      end
      object Label9: TLabel
        Left = 3
        Top = 128
        Width = 45
        Height = 13
        Caption = 'Nr'#186' Serie'
        FocusControl = DBEdit4
      end
      object Label10: TLabel
        Left = 213
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Dt. Compra'
      end
      object Label11: TLabel
        Left = 318
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Nr'#186' Nota Fiscal'
      end
      object Label12: TLabel
        Left = 395
        Top = 128
        Width = 55
        Height = 13
        Caption = 'Nr'#186' DANFE'
      end
      object btnPesquisar: TSpeedButton
        Left = 178
        Top = 353
        Width = 104
        Height = 25
        Caption = 'Visualizar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000E9E4DFB1744A
          983F009D4B0C9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9D49
          0B983F00B17449EAE5E0AF70429232009843058825009A45059A46079A46079A
          46079A46079A46079A46079A46079A46079B4708913100B3774E9D4C0E9E4D0F
          A4571CF6F0E8973F059C4A0B9F4F139F4E129F4E129F4E129F4E129F4E129F4E
          129F4E129F4F119D4C0CA3571CA153159D4A0BE6D5C6E7D3C2943B00A25518A2
          5316A25316A25316A25316A25316A25316A25316A15215A4581FA96229A85F22
          A85F248A2900FFFFFFEDE0D4974000A86025A85F24A85F24A85F24A85F24A85F
          24A85F24A75F22AB642BAC682EAB6329AB642AA86023B06E38FFFFFFBB8658A2
          5210AB652BAB632AAB632AAB632AAB632AAB632AAB6227AC6930B17238AF6F32
          AF6F33B07034AA6424A96325FFFFFFC4966AA75F1DA96423A96425AD6C2EB071
          34AF6F33AF6F32B17339B57740B27439B2753AB2753AB3763BA7611FD5B394E7
          D5C2B2733CDABDA2D3B193AE6C2EAC692BB3753CB27439B4773FBA824AB87D46
          B97D47B97D47B97D47B98049AD6825D9BDA1FFFFFFFFFFFFFFFFFFFFFFFFC190
          5EB5773DB87D45BA824CBC8751BA834CBB834DBB834DBB844DB98048C2905DFC
          F9F6FFFFFFFFFFFFFFFFFFF4F7FAF3E8DEBA8047BA824ABB8752C1915BBF8D56
          C08E56C08E56C08E56BB874BD7B795FFFFFFFFFFFFFFFFFFFFFFFFEDEEEFFCF9
          F5C49561BE8C54C3915BC59660C3945CC3945DC3945DC3955DC18F56D2AF85FF
          FFFFFFFFFFFFFFFFFFFFFFEAECEEFBF7F2C59560C3935BC59762C9A16DC99F69
          C99F6AC99F6AC99F6AC99F69C4975DEBDBC8FFFFFFFFFFFFFFFFFFFFFFFFD9BC
          97C4985DC99F69CAA26DCBA26DCCA36DCCA36DCCA36DCCA36DCCA36DCBA16BC8
          9B62E9DAC4F9F8F6F5EDE4E2CBADC4965BCBA36DCCA36DCBA46DDABE98CEA870
          D1AE7BD1AE7BD1AE7BD1AE7BD1AE7BD1AE7BCCA368C79A5AC79D5ECDA66DD1AF
          7CD1AE7CCDA76EDCC29DF0EEEAD9C198D4B27DD5B582D5B582D5B582D5B582D5
          B582D5B582D5B683D5B683D5B582D5B582D4B27DDBC197F1EEEC}
        ParentFont = False
        OnClick = btnPesquisarClick
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PATR_ID'
        DataSource = dmPatrimonio.dsPatrimonio
        ReadOnly = True
        TabOrder = 0
      end
      object edtPatrimonio: TDBEdit
        Left = 3
        Top = 64
        Width = 670
        Height = 21
        HelpContext = 1
        DataField = 'PATR_DESCRICAO'
        DataSource = dmPatrimonio.dsPatrimonio
        TabOrder = 4
      end
      object RxDBCalcEdit1: TRxDBCalcEdit
        Left = 680
        Top = 64
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'PATR_VLR_COMPRA'
        DataSource = dmPatrimonio.dsPatrimonio
        DisplayFormat = '###,###,##0.00'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 5
      end
      object DBDateEdit1: TDBDateEdit
        Left = 108
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'PATR_DTA_CADASTRO'
        DataSource = dmPatrimonio.dsPatrimonio
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      inline frPesqPatrimonio: TfrPesqIndividual
        Left = 0
        Top = 177
        Width = 784
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        ExplicitTop = 177
        ExplicitWidth = 784
        inherited Label2: TLabel
          Width = 41
          Caption = 'Loca'#231#227'o'
          ExplicitWidth = 41
        end
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
        inherited edtCodigo: TEdit
          HelpContext = 1
          OnExit = frPesqPatrimonioedtCodigoExit
          OnKeyDown = frPesqPatrimonioedtCodigoKeyDown
          OnKeyPress = frPesqPatrimonioedtCodigoKeyPress
        end
        inherited edtDescricao: TEdit
          Width = 605
          ExplicitWidth = 605
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 31
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
      inline frPesqFornecedor: TfrPesqIndividual
        Left = 0
        Top = 218
        Width = 784
        Height = 40
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        ExplicitTop = 218
        ExplicitWidth = 784
        inherited Label2: TLabel
          Width = 53
          Caption = 'Forncedor'
          ExplicitWidth = 53
        end
        inherited Label3: TLabel
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited Label4: TLabel
          Left = 1500
          ExplicitLeft = 1500
        end
        inherited edtCodigo: TEdit
          HelpContext = 1
          OnExit = frPesqFornecedoredtCodigoExit
          OnKeyDown = frPesqFornecedoredtCodigoKeyDown
          OnKeyPress = frPesqFornecedoredtCodigoKeyPress
        end
        inherited edtDescricao: TEdit
          Width = 605
          ExplicitWidth = 605
        end
        inherited rdOpcoes: TRadioGroup
          ItemIndex = 1
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 384
        Width = 786
        Height = 105
        Align = alBottom
        Caption = 'Dados da venda'
        TabOrder = 12
        object Label5: TLabel
          Left = 6
          Top = 60
          Width = 51
          Height = 13
          Caption = 'Dt. Venda'
        end
        object Label6: TLabel
          Left = 153
          Top = 60
          Width = 53
          Height = 13
          Caption = 'Vlr. Venda'
        end
        inline frPesqCliente: TfrPesqIndividual
          Left = 5
          Top = 16
          Width = 779
          Height = 41
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 16
          ExplicitWidth = 779
          ExplicitHeight = 41
          inherited Label2: TLabel
            Width = 36
            Caption = 'Cliente'
            ExplicitWidth = 36
          end
          inherited Label3: TLabel
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited Label4: TLabel
            Left = 1500
            ExplicitLeft = 1500
          end
          inherited edtCodigo: TEdit
            OnExit = frPesqClienteedtCodigoExit
            OnKeyDown = frPesqClienteedtCodigoKeyDown
            OnKeyPress = frPesqClienteedtCodigoKeyPress
          end
          inherited edtDescricao: TEdit
            Width = 600
            ExplicitWidth = 600
          end
          inherited rdOpcoes: TRadioGroup
            ItemIndex = 0
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
        object edtDtVenda: TDBDateEdit
          Left = 6
          Top = 76
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'PATR_DTA_VENDA'
          DataSource = dmPatrimonio.dsPatrimonio
          NumGlyphs = 2
          TabOrder = 1
        end
        object edtVlrVenda: TRxDBCalcEdit
          Left = 113
          Top = 76
          Width = 100
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'PATR_VLR_VENDA'
          DataSource = dmPatrimonio.dsPatrimonio
          DisplayFormat = '###,###,##0.00'
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 104
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'PATR_MARCA'
        DataSource = dmPatrimonio.dsPatrimonio
        TabOrder = 6
      end
      object DBEdit3: TDBEdit
        Left = 395
        Top = 104
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'PATR_MODELO'
        DataSource = dmPatrimonio.dsPatrimonio
        TabOrder = 7
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 144
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'PATR_NR_SERIE'
        DataSource = dmPatrimonio.dsPatrimonio
        TabOrder = 8
      end
      object edtDtCompra: TDBDateEdit
        Left = 213
        Top = 24
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'PATR_DTA_COMPRA'
        DataSource = dmPatrimonio.dsPatrimonio
        NumGlyphs = 2
        TabOrder = 2
      end
      object edtNrNF: TRxDBCalcEdit
        Left = 318
        Top = 24
        Width = 100
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'PATR_NR_NOTAFISCAL'
        DataSource = dmPatrimonio.dsPatrimonio
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 395
        Top = 144
        Width = 385
        Height = 21
        HelpContext = 1
        DataField = 'PATR_NR_DANFE'
        DataSource = dmPatrimonio.dsPatrimonio
        TabOrder = 9
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 266
        Width = 174
        Height = 112
        Caption = 'N.F. (Duplo Clique)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object DBImage1: TDBImage
          Left = 2
          Top = 15
          Width = 170
          Height = 95
          Align = alClient
          DataField = 'PATR_FOTO_NF'
          DataSource = dmPatrimonio.dsPatrimonio
          TabOrder = 0
          OnDblClick = DBImage1DblClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Observa'#231#245'es'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 228
        Align = alTop
        Caption = 'Observa'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBRichEdit1: TDBRichEdit
          Left = 2
          Top = 15
          Width = 782
          Height = 211
          Align = alClient
          DataField = 'PATR_OBS'
          DataSource = dmPatrimonio.dsPatrimonio
          ParentFont = True
          TabOrder = 0
        end
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp|.|*.*'
    FilterIndex = 2
    Title = 'Espelho da Nota'
    Left = 384
    Top = 400
  end
end
