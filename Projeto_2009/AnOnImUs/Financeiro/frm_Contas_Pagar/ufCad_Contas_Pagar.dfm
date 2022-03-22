inherited fCad_Contas_Pagar: TfCad_Contas_Pagar
  Caption = 'Cad. Contas a Pagar'
  ClientHeight = 687
  Constraints.MinHeight = 546
  Constraints.MinWidth = 660
  ExplicitWidth = 800
  ExplicitHeight = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    Height = 632
    ExplicitHeight = 632
    inherited tabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 786
      ExplicitHeight = 604
      object Label1: TLabel
        Left = 3
        Top = 7
        Width = 43
        Height = 13
        Caption = 'Nr'#186' Reg.'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 107
        Top = 7
        Width = 64
        Height = 13
        Caption = 'Dt. Cadastro'
        FocusControl = DBDateEdit1
      end
      object Label3: TLabel
        Left = 3
        Top = 99
        Width = 80
        Height = 13
        Caption = '&Nr'#186' Documento'
        FocusControl = edtNr_Doc
      end
      object Label4: TLabel
        Left = 107
        Top = 99
        Width = 61
        Height = 13
        Caption = '&Proveni'#234'nte'
        FocusControl = edtProveniente
      end
      object Label5: TLabel
        Left = 400
        Top = 339
        Width = 59
        Height = 13
        Caption = '&Dt. Emiss'#227'o'
        FocusControl = edtDt_Emissao
      end
      object Label6: TLabel
        Left = 3
        Top = 339
        Width = 54
        Height = 13
        Caption = 'Dt. Vencto'
      end
      object Label7: TLabel
        Left = 572
        Top = 339
        Width = 48
        Height = 13
        Caption = 'Dt. Pagto'
      end
      object Label8: TLabel
        Left = 3
        Top = 144
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Fornec
        OnClick = Label8Click
      end
      object Label9: TLabel
        Left = 182
        Top = 144
        Width = 59
        Height = 13
        Caption = 'Fornecedor'
        FocusControl = edtFornecedor
      end
      object btnPesq_Forn: TSpeedButton
        Left = 107
        Top = 159
        Width = 35
        Height = 22
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
        OnClick = btnPesq_FornClick
      end
      object Label10: TLabel
        Left = 631
        Top = 50
        Width = 123
        Height = 13
        Caption = 'Valor do Documento R$'
        FocusControl = edtVlr_Doc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 711
        Top = 339
        Width = 62
        Height = 13
        Caption = 'Vlr. Pago R$'
      end
      object Label14: TLabel
        Left = 3
        Top = 185
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Plano
        OnClick = Label14Click
      end
      object Label15: TLabel
        Left = 285
        Top = 185
        Width = 84
        Height = 13
        Caption = 'Plano de Contas'
        FocusControl = edtPlano
        OnClick = Label14Click
      end
      object btnPesq_Plano: TSpeedButton
        Left = 107
        Top = 200
        Width = 35
        Height = 22
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
        OnClick = btnPesq_PlanoClick
      end
      object Label16: TLabel
        Left = 182
        Top = 185
        Width = 65
        Height = 13
        Caption = 'C'#243'd. Simplif.'
        FocusControl = edtCod_Simplif
        OnClick = Label14Click
      end
      object Label17: TLabel
        Left = 3
        Top = 226
        Width = 59
        Height = 13
        Caption = 'C'#243'digo (F5)'
        FocusControl = edtCod_Doc
      end
      object Label18: TLabel
        Left = 144
        Top = 226
        Width = 101
        Height = 13
        Caption = 'Tipo de Documento'
        FocusControl = edtDocumento
      end
      object btnPesq_Doc: TSpeedButton
        Left = 107
        Top = 241
        Width = 35
        Height = 22
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
        OnClick = btnPesq_DocClick
      end
      object Label19: TLabel
        Left = 3
        Top = 462
        Width = 60
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label20: TLabel
        Left = 3
        Top = 564
        Width = 46
        Height = 13
        Caption = 'Dt. Canc.'
      end
      object Label21: TLabel
        Left = 107
        Top = 564
        Width = 36
        Height = 13
        Caption = 'Motivo'
        FocusControl = DBEdit12
      end
      object SpeedButton1: TSpeedButton
        Left = 144
        Top = 159
        Width = 35
        Height = 22
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000E9E4DF00B174
          4A00983F00009D490B009D4A0B009D4A0B009D4A0B009D4A0B009D4A0B009D4A
          0B009D4A0B009D4A0B009D490B00983F0000B1744900EAE5E000AF7042009132
          00009B480900973E00008C2C00008E2E00008D2E00008E2E00008E2E00008E2E
          00008E2E00008C2C0000973E00009B48090091310000B3774E009D4C0E009F4F
          12009B480800AF6E3C00E1C9B600DFC5B200E0C6B300DDC1AC00D7B79F00DCC3
          AD00E0C6B300E1C9B600AF6E3C009B4808009F4F12009D4C0C00A3571C00A253
          17009B470500C4936C00F9F4F100C79A7600C79C7800DABDA600FFFFFF00CEA8
          8900C18E6500F9F6F200C4936C009B470500A2531600A4581F00A9622900A85F
          2300A1531300C79B7600E6D2C100994300009B460200B97F4D00FFFFFF00FFFF
          FF0098440000E1C9B500C79B7700A1531300A85F2200AB642B00AC682E00AB63
          2A00A5581A00C99E7800EAD9CA00A4581800A55A1C00BF8C6000FFFFFF00FFFF
          FF00F3E9E000F6F1EB00C7997100A5591A00AB632800AC693000B1723800AF70
          3300A9652400CCA58000EBDBCC00A8622300AA672700C3946A00FFFFFF00F9F4
          F000FAF6F200FFFFFF00C69B7200AA662500AF6F3300B1733900B5774000B275
          3900AC6B2B00CEA78300EBDCCE00AC672A00B1733800B3753E00BB834F00B87F
          4A00B3763B00EDE0D400CEA58100AC6B2B00B2753900B4773F00BA824A00B97D
          4700B3753900D2AD8A00EDDFD200B2733500B97D4700B87D4500B77B4200B77B
          4300B1703100EDDED000D2AD8A00B3753900B97D4500BA824C00BC875100BB83
          4D00B67B3F00D3B18D00EEE0D300B47A3D00BB834D00BB834D00BB834D00BB83
          4D00B47A3D00EEE0D300D3B18D00B67B3F00BB834B00BB875200C1915B00C08E
          5600BC864A00D7B89400EFE4D600BA854900C08E5700C08E5600C08E5600C08E
          5700BA854900EFE4D600D7B89400BC864A00BF8E5600C3915B00C5966000C395
          5D00C08D5100D9BB9900EEE2D200BA844400C08D5400C08D5300C08D5300C08D
          5400BA844400EEE2D200D9BB9900C08D5100C3945C00C5976200C9A16D00C9A0
          6A00C4985E00DDC19F00FBF8F400DDC2A100E0C7A800E0C7A800E0C7A800E0C7
          A800DDC2A100FBF8F400DDC19F00C4985E00C9A06A00CAA26D00CBA26D00CCA3
          6E00CA9E6700D5B58A00F0E5D700F0E4D500F0E4D500F0E4D500F0E4D500F0E4
          D500F0E4D500F0E5D700D5B58A00CA9E6700CCA36E00CBA46D00DABE9800CEA8
          7000D1AE7C00CFAA7400CAA06500CAA16600CAA16600CAA16600CAA16600CAA1
          6600CAA16600CAA06500CFAA7400D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
          9800D4B27D00D5B58200D5B58300D5B58300D5B58300D5B58300D5B58300D5B5
          8300D5B58300D5B58300D5B58200D4B27D00DBC19700F1EEEC00}
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 144
        Top = 200
        Width = 35
        Height = 22
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000E9E4DF00B174
          4A00983F00009D490B009D4A0B009D4A0B009D4A0B009D4A0B009D4A0B009D4A
          0B009D4A0B009D4A0B009D490B00983F0000B1744900EAE5E000AF7042009132
          00009B480900973E00008C2C00008E2E00008D2E00008E2E00008E2E00008E2E
          00008E2E00008C2C0000973E00009B48090091310000B3774E009D4C0E009F4F
          12009B480800AF6E3C00E1C9B600DFC5B200E0C6B300DDC1AC00D7B79F00DCC3
          AD00E0C6B300E1C9B600AF6E3C009B4808009F4F12009D4C0C00A3571C00A253
          17009B470500C4936C00F9F4F100C79A7600C79C7800DABDA600FFFFFF00CEA8
          8900C18E6500F9F6F200C4936C009B470500A2531600A4581F00A9622900A85F
          2300A1531300C79B7600E6D2C100994300009B460200B97F4D00FFFFFF00FFFF
          FF0098440000E1C9B500C79B7700A1531300A85F2200AB642B00AC682E00AB63
          2A00A5581A00C99E7800EAD9CA00A4581800A55A1C00BF8C6000FFFFFF00FFFF
          FF00F3E9E000F6F1EB00C7997100A5591A00AB632800AC693000B1723800AF70
          3300A9652400CCA58000EBDBCC00A8622300AA672700C3946A00FFFFFF00F9F4
          F000FAF6F200FFFFFF00C69B7200AA662500AF6F3300B1733900B5774000B275
          3900AC6B2B00CEA78300EBDCCE00AC672A00B1733800B3753E00BB834F00B87F
          4A00B3763B00EDE0D400CEA58100AC6B2B00B2753900B4773F00BA824A00B97D
          4700B3753900D2AD8A00EDDFD200B2733500B97D4700B87D4500B77B4200B77B
          4300B1703100EDDED000D2AD8A00B3753900B97D4500BA824C00BC875100BB83
          4D00B67B3F00D3B18D00EEE0D300B47A3D00BB834D00BB834D00BB834D00BB83
          4D00B47A3D00EEE0D300D3B18D00B67B3F00BB834B00BB875200C1915B00C08E
          5600BC864A00D7B89400EFE4D600BA854900C08E5700C08E5600C08E5600C08E
          5700BA854900EFE4D600D7B89400BC864A00BF8E5600C3915B00C5966000C395
          5D00C08D5100D9BB9900EEE2D200BA844400C08D5400C08D5300C08D5300C08D
          5400BA844400EEE2D200D9BB9900C08D5100C3945C00C5976200C9A16D00C9A0
          6A00C4985E00DDC19F00FBF8F400DDC2A100E0C7A800E0C7A800E0C7A800E0C7
          A800DDC2A100FBF8F400DDC19F00C4985E00C9A06A00CAA26D00CBA26D00CCA3
          6E00CA9E6700D5B58A00F0E5D700F0E4D500F0E4D500F0E4D500F0E4D500F0E4
          D500F0E4D500F0E5D700D5B58A00CA9E6700CCA36E00CBA46D00DABE9800CEA8
          7000D1AE7C00CFAA7400CAA06500CAA16600CAA16600CAA16600CAA16600CAA1
          6600CAA16600CAA06500CFAA7400D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
          9800D4B27D00D5B58200D5B58300D5B58300D5B58300D5B58300D5B58300D5B5
          8300D5B58300D5B58300D5B58200D4B27D00DBC19700F1EEEC00}
        OnClick = SpeedButton2Click
      end
      object Label11: TLabel
        Left = 589
        Top = 185
        Width = 83
        Height = 13
        Caption = 'Meta do M'#234's R$'
      end
      object Label12: TLabel
        Left = 704
        Top = 185
        Width = 66
        Height = 13
        Caption = 'J'#225' Compr. R$'
      end
      object Label25: TLabel
        Left = 682
        Top = 564
        Width = 53
        Height = 13
        Caption = 'Dt. Efetivo'
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 23
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_ID'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 107
        Top = 23
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CPAG_DTA_CADASTRO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtNr_Doc: TDBEdit
        Left = 3
        Top = 115
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CPAG_NR_DOC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        TabOrder = 5
      end
      object edtProveniente: TDBEdit
        Left = 107
        Top = 115
        Width = 675
        Height = 21
        HelpContext = 1
        DataField = 'CPAG_PROVENIENTE'
        DataSource = dmContas_Pagar.dsContas_Pagar
        TabOrder = 6
      end
      object edtCod_Fornec: TDBEdit
        Left = 3
        Top = 160
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CPAG_FORN_ID'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ImeName = 'btnPesq_Forn;SpeedButton1'
        TabOrder = 7
        OnExit = edtCod_FornecExit
        OnKeyPress = edtCod_FornecKeyPress
      end
      object edtFornecedor: TDBEdit
        Left = 182
        Top = 160
        Width = 600
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'FORN_NOME_FANTASIA'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 8
      end
      object edtDt_Emissao: TDBDateEdit
        Left = 316
        Top = 355
        Width = 152
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CPAG_DTA_EMISSAO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        Color = clGradientInactiveCaption
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 18
      end
      object edtDtPagto: TDBDateEdit
        Left = 473
        Top = 355
        Width = 152
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CPAG_DTA_PGTO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        Color = clGradientInactiveCaption
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 19
      end
      object edtDt_Vecto: TDBDateEdit
        Left = 3
        Top = 355
        Width = 152
        Height = 21
        HelpContext = 1
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CPAG_DTA_VCTO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        NumGlyphs = 2
        TabOrder = 17
      end
      object edtVlr_Doc: TRxDBCalcEdit
        Left = 630
        Top = 66
        Width = 152
        Height = 33
        HelpContext = 1
        Margins.Left = 7
        Margins.Top = 1
        DataField = 'CPAG_VALOR_DOC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object edtCod_Plano: TDBEdit
        Left = 3
        Top = 201
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CPAG_PLCT_ID'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ImeName = 'btnPesq_Plano;SpeedButton2'
        TabOrder = 9
        OnExit = edtCod_PlanoExit
        OnKeyPress = edtCod_FornecKeyPress
      end
      object edtPlano: TDBEdit
        Left = 285
        Top = 201
        Width = 290
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PLCT_DESCRICAO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 11
      end
      object edtCod_Simplif: TDBEdit
        Left = 182
        Top = 201
        Width = 100
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'PLCT_COD_SIMPLIFICADO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 10
      end
      object edtCod_Doc: TDBEdit
        Left = 3
        Top = 242
        Width = 100
        Height = 21
        HelpContext = 1
        DataField = 'CPAG_GENE_ID_TIPO_DOC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ImeName = 'btnPesq_Doc'
        TabOrder = 14
        OnExit = edtCod_DocExit
        OnKeyPress = edtCod_FornecKeyPress
      end
      object edtDocumento: TDBEdit
        Left = 144
        Top = 242
        Width = 638
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'TIPO_DOC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 15
      end
      object DBMemo1: TDBMemo
        Left = 3
        Top = 478
        Width = 779
        Height = 80
        DataField = 'CPAG_OBS'
        DataSource = dmContas_Pagar.dsContas_Pagar
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 21
        OnEnter = DBMemo1Enter
        OnExit = DBMemo1Exit
      end
      object DBEdit12: TDBEdit
        Left = 107
        Top = 580
        Width = 569
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CPAG_MOTIVO_CANC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        TabOrder = 23
      end
      object DBDateEdit7: TDBDateEdit
        Left = 3
        Top = 580
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'CPAG_DTA_CANC'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 22
      end
      object rdStatus: TDBRadioGroup
        Left = 542
        Top = -1
        Width = 240
        Height = 45
        Caption = 'Status'
        Columns = 3
        DataField = 'CPAG_STATUS'
        DataSource = dmContas_Pagar.dsContas_Pagar
        Items.Strings = (
          'Aberto'
          'Fechado'
          'Cancelado')
        ReadOnly = True
        TabOrder = 3
        TabStop = True
        Values.Strings = (
          'A'
          'F'
          'C')
      end
      object edtVlrPlanejado: TRxCalcEdit
        Left = 579
        Top = 201
        Width = 100
        Height = 21
        Margins.Left = 5
        Margins.Top = 1
        TabStop = False
        Color = clGradientInactiveCaption
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtVlrComprometido: TRxCalcEdit
        Left = 682
        Top = 201
        Width = 100
        Height = 21
        Margins.Left = 5
        Margins.Top = 1
        TabStop = False
        Color = clGradientInactiveCaption
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edtDtEfetivo: TDBDateEdit
        Left = 682
        Top = 580
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'CPAG_DTA_EFETIVO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        Color = clWhite
        Enabled = False
        NumGlyphs = 2
        TabOrder = 24
      end
      object DBCheckBox1: TDBCheckBox
        Left = 220
        Top = 25
        Width = 180
        Height = 17
        Caption = 'Previs'#227'o de Lan'#231'amento'
        DataField = 'CPAG_PREVISAO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Panel2: TPanel
        Tag = 99
        Left = 3
        Top = 383
        Width = 779
        Height = 77
        Color = clInfoBk
        ParentBackground = False
        TabOrder = 25
        object lb21: TLabel
          Left = 1
          Top = 1
          Width = 777
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Informa'#231#245'es sobre Cart'#227'o Cr'#233'dito/D'#233'bito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 214
        end
        object lb1: TLabel
          Left = 17
          Top = 23
          Width = 58
          Height = 13
          Caption = 'Nr'#186' Cart'#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb4: TDBText
          Left = 76
          Top = 23
          Width = 181
          Height = 15
          DataField = 'CCRE_NUMERO_CARTAO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb7: TLabel
          Left = 260
          Top = 23
          Width = 54
          Height = 13
          Caption = 'V'#225'lido at'#233':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb9: TDBText
          Left = 316
          Top = 23
          Width = 59
          Height = 15
          DataField = 'CCRE_VENCIMENTO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb11: TLabel
          Left = 432
          Top = 23
          Width = 31
          Height = 13
          Caption = 'Ativo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb13: TDBText
          Left = 463
          Top = 23
          Width = 59
          Height = 15
          DataField = 'CCRE_ATIVO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb2: TLabel
          Left = 37
          Top = 39
          Width = 36
          Height = 13
          Caption = 'Titular:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb5: TDBText
          Left = 76
          Top = 39
          Width = 323
          Height = 15
          DataField = 'CCRE_TITULAR'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb15: TLabel
          Left = 535
          Top = 23
          Width = 79
          Height = 13
          Caption = 'Tipo de Cart'#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb17: TDBText
          Left = 611
          Top = 23
          Width = 93
          Height = 15
          DataField = 'CCRE_TIPO_CARTAO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb23: TLabel
          Left = 5
          Top = 55
          Width = 70
          Height = 13
          Caption = 'Limite Saque:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb6: TDBText
          Left = 76
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_LIMITE_SAQUE'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb8: TLabel
          Left = 232
          Top = 55
          Width = 84
          Height = 13
          Caption = 'Limite Compras:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb10: TDBText
          Left = 316
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_LIMITE_COMPRAS'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb18: TDBText
          Left = 611
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_DIA_VCTO_FATURA'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb16: TLabel
          Left = 543
          Top = 55
          Width = 67
          Height = 13
          Caption = 'Dia Vcto Fat.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb14: TDBText
          Left = 463
          Top = 55
          Width = 65
          Height = 15
          DataField = 'CCRE_DIA_FECHAMENTO_FATURA'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb12: TLabel
          Left = 390
          Top = 55
          Width = 72
          Height = 13
          Caption = 'Dia Fech. Fat.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb19: TLabel
          Left = 683
          Top = 55
          Width = 29
          Height = 13
          Caption = 'Disp.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb20: TLabel
          Left = 716
          Top = 55
          Width = 21
          Height = 13
          Caption = '0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb22: TDBImage
          Left = 707
          Top = 5
          Width = 65
          Height = 40
          DataField = 'CCRE_IMAGE'
          DataSource = dmContas_Pagar.dsContas_Pagar
          ParentColor = True
          Stretch = True
          TabOrder = 0
        end
      end
      object edtVlr_Pago: TDBEdit
        Left = 630
        Top = 355
        Width = 152
        Height = 21
        TabStop = False
        BiDiMode = bdRightToLeft
        Color = clGradientInactiveCaption
        DataField = 'CPAG_VALOR_PAGO'
        DataSource = dmContas_Pagar.dsContas_Pagar
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 20
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 266
        Width = 779
        Height = 70
        Caption = '     Via Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        object Label22: TLabel
          Left = 5
          Top = 19
          Width = 59
          Height = 13
          Caption = 'C'#243'digo (F5)'
          FocusControl = edtCod_Banco
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label22Click
        end
        object Label23: TLabel
          Left = 183
          Top = 19
          Width = 89
          Height = 13
          Caption = 'Banco/Financeira'
          FocusControl = DBEdit3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = Label22Click
        end
        object Label24: TLabel
          Left = 587
          Top = 19
          Width = 75
          Height = 13
          Caption = 'Saldo Atual R$'
          FocusControl = DBEdit4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnPesq_Banco: TSpeedButton
          Left = 108
          Top = 34
          Width = 35
          Height = 22
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
          OnClick = btnPesq_BancoClick
        end
        object Label26: TLabel
          Left = 722
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Limite R$'
          FocusControl = DBEdit8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnInsertBanco: TSpeedButton
          Left = 145
          Top = 34
          Width = 35
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000E9E4DF00B174
            4A00983F00009D490B009D4A0B009D4A0B009D4A0B009D4A0B009D4A0B009D4A
            0B009D4A0B009D4A0B009D490B00983F0000B1744900EAE5E000AF7042009132
            00009B480900973E00008C2C00008E2E00008D2E00008E2E00008E2E00008E2E
            00008E2E00008C2C0000973E00009B48090091310000B3774E009D4C0E009F4F
            12009B480800AF6E3C00E1C9B600DFC5B200E0C6B300DDC1AC00D7B79F00DCC3
            AD00E0C6B300E1C9B600AF6E3C009B4808009F4F12009D4C0C00A3571C00A253
            17009B470500C4936C00F9F4F100C79A7600C79C7800DABDA600FFFFFF00CEA8
            8900C18E6500F9F6F200C4936C009B470500A2531600A4581F00A9622900A85F
            2300A1531300C79B7600E6D2C100994300009B460200B97F4D00FFFFFF00FFFF
            FF0098440000E1C9B500C79B7700A1531300A85F2200AB642B00AC682E00AB63
            2A00A5581A00C99E7800EAD9CA00A4581800A55A1C00BF8C6000FFFFFF00FFFF
            FF00F3E9E000F6F1EB00C7997100A5591A00AB632800AC693000B1723800AF70
            3300A9652400CCA58000EBDBCC00A8622300AA672700C3946A00FFFFFF00F9F4
            F000FAF6F200FFFFFF00C69B7200AA662500AF6F3300B1733900B5774000B275
            3900AC6B2B00CEA78300EBDCCE00AC672A00B1733800B3753E00BB834F00B87F
            4A00B3763B00EDE0D400CEA58100AC6B2B00B2753900B4773F00BA824A00B97D
            4700B3753900D2AD8A00EDDFD200B2733500B97D4700B87D4500B77B4200B77B
            4300B1703100EDDED000D2AD8A00B3753900B97D4500BA824C00BC875100BB83
            4D00B67B3F00D3B18D00EEE0D300B47A3D00BB834D00BB834D00BB834D00BB83
            4D00B47A3D00EEE0D300D3B18D00B67B3F00BB834B00BB875200C1915B00C08E
            5600BC864A00D7B89400EFE4D600BA854900C08E5700C08E5600C08E5600C08E
            5700BA854900EFE4D600D7B89400BC864A00BF8E5600C3915B00C5966000C395
            5D00C08D5100D9BB9900EEE2D200BA844400C08D5400C08D5300C08D5300C08D
            5400BA844400EEE2D200D9BB9900C08D5100C3945C00C5976200C9A16D00C9A0
            6A00C4985E00DDC19F00FBF8F400DDC2A100E0C7A800E0C7A800E0C7A800E0C7
            A800DDC2A100FBF8F400DDC19F00C4985E00C9A06A00CAA26D00CBA26D00CCA3
            6E00CA9E6700D5B58A00F0E5D700F0E4D500F0E4D500F0E4D500F0E4D500F0E4
            D500F0E4D500F0E5D700D5B58A00CA9E6700CCA36E00CBA46D00DABE9800CEA8
            7000D1AE7C00CFAA7400CAA06500CAA16600CAA16600CAA16600CAA16600CAA1
            6600CAA16600CAA06500CFAA7400D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
            9800D4B27D00D5B58200D5B58300D5B58300D5B58300D5B58300D5B58300D5B5
            8300D5B58300D5B58300D5B58200D4B27D00DBC19700F1EEEC00}
          OnClick = btnInsertBancoClick
        end
        object edtCod_Banco: TDBEdit
          Left = 5
          Top = 35
          Width = 100
          Height = 21
          DataField = 'CPAG_CBCO_ID'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImeName = 'btnPesq_Banco;SpeedButton3'
          ParentFont = False
          TabOrder = 1
          OnExit = edtCod_BancoExit
          OnKeyPress = edtCod_FornecKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 183
          Top = 35
          Width = 384
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'BANCO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 571
          Top = 35
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CBCO_SALDO_ATUAL'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 675
          Top = 35
          Width = 100
          Height = 21
          TabStop = False
          Color = clGradientInactiveCaption
          DataField = 'CBCO_LIMITE'
          DataSource = dmContas_Pagar.dsContas_Pagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object rdBanco: TDBCheckBox
          Left = 8
          Top = -1
          Width = 17
          Height = 17
          DataField = 'CPAG_VIA_BANCO'
          DataSource = dmContas_Pagar.dsContas_Pagar
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = rdBancoClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&2.Lan'#231'amentos'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 786
        Height = 260
        Align = alTop
        Caption = 'Lan'#231'amentos do T'#237'tulo'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 243
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          DataSource = dmContas_Pagar.dsContas_Pagar_Mov
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 632
    ExplicitTop = 632
    inherited btnOK: TSpeedButton
      ExplicitLeft = 351
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 501
    end
  end
end
