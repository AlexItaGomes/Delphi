inherited fCadObras: TfCadObras
  Caption = 'Cadastro de Obras'
  Constraints.MinHeight = 590
  Constraints.MinWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageCadastro: TPageControl
    ExplicitWidth = 644
    ExplicitHeight = 507
    inherited tabCadastro: TTabSheet
      ExplicitWidth = 636
      ExplicitHeight = 479
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 84
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Dta. Cadastro'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 5
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object Label4: TLabel
        Left = 5
        Top = 88
        Width = 53
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = edtEndereco
      end
      object Label5: TLabel
        Left = 260
        Top = 88
        Width = 35
        Height = 13
        Caption = 'Bairro'
        FocusControl = edtBairro
      end
      object Label6: TLabel
        Left = 5
        Top = 130
        Width = 63
        Height = 13
        Caption = 'C'#243'd. Pra'#231'a'
        FocusControl = edtCodPraca
        OnClick = Label6Click
        OnMouseMove = Label6MouseMove
        OnMouseLeave = Label6MouseLeave
      end
      object Label7: TLabel
        Left = 158
        Top = 130
        Width = 40
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit6
        OnClick = Label6Click
        OnMouseMove = Label6MouseMove
        OnMouseLeave = Label6MouseLeave
      end
      object Label8: TLabel
        Left = 583
        Top = 130
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit7
      end
      object Label10: TLabel
        Left = 170
        Top = 174
        Width = 129
        Height = 13
        Caption = #193'rea Construida (mt2)'
        FocusControl = DBEdit6
      end
      object Label9: TLabel
        Left = 35
        Top = 174
        Width = 95
        Height = 13
        Caption = #193'rea Total (mt2)'
        FocusControl = DBEdit6
      end
      object Label11: TLabel
        Left = 367
        Top = 174
        Width = 99
        Height = 13
        Caption = 'Vlr. Investimento'
        FocusControl = DBEdit6
      end
      object Label12: TLabel
        Left = 571
        Top = 174
        Width = 62
        Height = 13
        Caption = 'Valor Total'
        FocusControl = DBEdit6
      end
      object Label13: TLabel
        Left = 174
        Top = 214
        Width = 75
        Height = 13
        Caption = 'Dt. Prev. Fim'
        FocusControl = DBEdit6
      end
      object Label14: TLabel
        Left = 5
        Top = 214
        Width = 86
        Height = 13
        Caption = 'Dt. Prev. Inicio'
        FocusControl = DBEdit6
      end
      object Label15: TLabel
        Left = 341
        Top = 214
        Width = 52
        Height = 13
        Caption = 'Dt. Inicio'
        FocusControl = DBEdit6
      end
      object Label16: TLabel
        Left = 508
        Top = 214
        Width = 41
        Height = 13
        Caption = 'Dt. Fim'
        FocusControl = DBEdit6
      end
      object btnPesq_Praca: TSpeedButton
        Left = 83
        Top = 145
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
        OnClick = btnPesq_PracaClick
      end
      object SpeedButton1: TSpeedButton
        Left = 121
        Top = 145
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
        OnClick = SpeedButton1Click
      end
      object Label17: TLabel
        Left = 260
        Top = 48
        Width = 101
        Height = 13
        Caption = 'Eng. Respons'#225'vel'
        FocusControl = edtEngenheiro
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 75
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'OBRA_ID'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        TabOrder = 0
      end
      object DBDateEdit1: TDBDateEdit
        Left = 84
        Top = 24
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_DTA_CADASTRO'
        DataSource = dmControle_Obras.dsControle_Obras
        NumGlyphs = 2
        TabOrder = 1
      end
      object edtDescricao: TDBEdit
        Left = 5
        Top = 64
        Width = 250
        Height = 21
        DataField = 'OBRA_DESCRICAO'
        DataSource = dmControle_Obras.dsControle_Obras
        TabOrder = 3
      end
      object edtEndereco: TDBEdit
        Left = 5
        Top = 104
        Width = 250
        Height = 21
        DataField = 'OBRA_ENDERECO'
        DataSource = dmControle_Obras.dsControle_Obras
        TabOrder = 5
      end
      object edtBairro: TDBEdit
        Left = 261
        Top = 104
        Width = 250
        Height = 21
        DataField = 'OBRA_BAIRRO'
        DataSource = dmControle_Obras.dsControle_Obras
        TabOrder = 6
      end
      object edtCodPraca: TDBEdit
        Left = 5
        Top = 146
        Width = 75
        Height = 21
        DataField = 'OBRA_GENE_ID_PRACA'
        DataSource = dmControle_Obras.dsControle_Obras
        ImeName = 'btnPesq_Praca'
        TabOrder = 7
        OnExit = edtCodPracaExit
        OnKeyPress = edtCodPracaKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 158
        Top = 146
        Width = 419
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'CIDADE'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 583
        Top = 146
        Width = 50
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'UF'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        TabOrder = 9
      end
      object edtAreaTotal: TRxDBCalcEdit
        Left = 5
        Top = 190
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_AREA_TOTAL'
        DataSource = dmControle_Obras.dsControle_Obras
        DisplayFormat = '###,###,##0.0000'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 10
      end
      object edtAreaConst: TRxDBCalcEdit
        Left = 174
        Top = 190
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_AREA_CONTRUIDA'
        DataSource = dmControle_Obras.dsControle_Obras
        DisplayFormat = '###,###,##0.0000'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 11
      end
      object edtVlrInvest: TRxDBCalcEdit
        Left = 341
        Top = 190
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_VLR_INVESTIMENTO'
        DataSource = dmControle_Obras.dsControle_Obras
        DisplayFormat = '###,###,##0.0000'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 12
      end
      object edtDtPrevInicio: TDBDateEdit
        Left = 5
        Top = 231
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_DTA_PREV_INICIO_OBRA'
        DataSource = dmControle_Obras.dsControle_Obras
        NumGlyphs = 2
        TabOrder = 14
      end
      object edtDtPrevFim: TDBDateEdit
        Left = 174
        Top = 231
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'OBRA_DTA_PREV_FIM_OBRA'
        DataSource = dmControle_Obras.dsControle_Obras
        NumGlyphs = 2
        TabOrder = 15
      end
      object edtDtInicio: TDBDateEdit
        Left = 341
        Top = 231
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OBRA_DTA_INICIO_OBRA'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 16
      end
      object edtDtFim: TDBDateEdit
        Left = 508
        Top = 231
        Width = 125
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'OBRA_DTA_FIM_OBRA'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        Color = clGradientInactiveCaption
        NumGlyphs = 2
        TabOrder = 17
      end
      object rdStatus: TDBRadioGroup
        Left = 516
        Top = 8
        Width = 118
        Height = 117
        Caption = 'Status'
        DataField = 'OBRA_STATUS'
        DataSource = dmControle_Obras.dsControle_Obras
        Items.Strings = (
          'Aguardando'
          'Em Obras'
          'Paralisada'
          'Finalizada'
          'Cancelada')
        ParentBackground = True
        TabOrder = 2
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 247
        Width = 786
        Height = 242
        Align = alBottom
        Caption = 'Etapas da Obra'
        TabOrder = 18
        ExplicitTop = 237
        ExplicitWidth = 636
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 782
          Height = 225
          TabStop = False
          Align = alClient
          DataSource = dmControle_Obras.dsEtapas_Obras
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnDblClick = DBGrid1DblClick
        end
      end
      object edtEngenheiro: TDBEdit
        Left = 260
        Top = 64
        Width = 250
        Height = 21
        DataField = 'OBRA_ENG_RESPONSAVEL'
        DataSource = dmControle_Obras.dsControle_Obras
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 508
        Top = 190
        Width = 125
        Height = 21
        TabStop = False
        Color = clGradientInactiveCaption
        DataField = 'OBRA_VLR_TOTAL'
        DataSource = dmControle_Obras.dsControle_Obras
        ReadOnly = True
        TabOrder = 13
      end
    end
  end
  inherited Panel1: TPanel
    ExplicitTop = 507
    ExplicitWidth = 644
    inherited btnOK: TSpeedButton
      ExplicitLeft = 340
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 490
    end
    object btnNovaEtapa: TBitBtn
      Left = 4
      Top = 2
      Width = 109
      Height = 30
      Caption = 'Nova Etapa'
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00B7CAD348585858A7464646B96A6A6A959393936CBCBCBC43DADADA25EAEA
        EA15F2F2F20DF6F6F609FCFCFC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9
        F9064096BCFF2D93BFFF10698FEF23556FDC39525FC64D5356B25B5B5BA47474
        748B9595956AB3B3B34CD2D2D22DE9E9E916FFFFFF00FFFFFF00FFFFFF00BBD4
        E144308CB6FFB8EBFFFF69D2FCFF4DC3EFFF31A7D6FF1C8FBFFF0C6F98F31E5A
        77E12E5467D1455257BA595959A68282827DE3E3E31CFFFFFF00FFFFFF00BBD4
        E144278BBCFFC6ECF9FF7AE0FFFF7AE0FFFF7AE0FFFF7AE0FFFF7AE0FFFF5CCE
        F2FF3DB3DCFF269CC9FF13729BF3535353ACB0B0B04FF6F6F609FFFFFF00BBD4
        E14454B6E1FF8FC6DCFF94EEFFFF85EBFFFF85EBFFFF85EBFFFF85EBFFFF85EB
        FFFF85EBFFFF85EBFFFF5DCDE9FF2A5063D579797986E6E6E619FFFFFF00BAD3
        E04561C6F0FF60AED1FFC0F9FFFF8FF5FFFF8FF5FFFF8FF5FFFF8FF5FFFF8FF5
        FFFF8FF5FFFF8FF5FFFF9BF2FFFF217EA1F3565656A9B9B9B946FFFFFF00A2C2
        D15D6DCAF2FF319ED1FFD6F9FCFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FF
        FFFF99FFFFFF99FFFFFFABF2FFFF79CFE2FF354E5BCA77777788F8F8F8076497
        B19B8FD9F9FF59BFECFF80BFD9FFE7FFFFFFD9FFFFFFCBFFFFFFC0FFFFFFB9FF
        FFFFB9FFFFFFB9FFFFFFBAF2FFFFD6FFFFFF206D8CEB474747B8ACCBAC531A72
        2CE52D8640FF1D8340FF076D2DFF006C2DFF208039FF408F4DFFCCE9F2FFDCFF
        FFFFD3FFFFFFD3FFFFFFCAF2FFFFEBFFFFFF76BCD6FF3D4950C2CFE2CF302799
        3AF038D16BFF32CB64FF28C150FF1CB538FF12AB23FF06850BFF49AFCCFF80B9
        D2FF8FC6DCFFBEE2EFFFE6F5FCFFFFFFFFFFEFF9FCFF407993BFFFFFFF0072AB
        A88D18912BFF38D16BFF32CB64FF28C150FF1CB538FF0B8A15FF9FFFFFFF99FF
        FFFF86ECF2FF73D9E6FF0A6996F53B809DC477AAC4C7A3C6D65CF5F5F50A3F88
        4CC53FCE68FF42DB75FF38D16BFF32CB64FF28C150FF0F8F1EFF79B6D2FF91C9
        DFFF9FE0EFFFB4F0F9FF3B8CAFD2D1D1D12EFBFBFB04FFFFFF008DB98D7248D5
        6FFF57F08AFF4DE680FF42DB75FF38D16BFF32CB64FF15952BFF585858A7BCCF
        D843BCD5E2438CB8CF73C7DAE338FBFBFB04FFFFFF00FFFFFF00CFE2CF3035A7
        48F061FA94FF57F08AFF4DE680FF2EB751FF38D16BFF1A9933FF5C5C5CA3E7E7
        E718FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFE2
        CF3035A748F061FA94FF36BC56FF568956A9269839F11E9D37FF8F8F8F70EAEA
        EA15FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00CFE2CF30228C2DEF91B7916EF6F6F609CFE2CF30237F26E0EAEAEA15FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnNovaEtapaClick
    end
    object btnEditarEtapa: TBitBtn
      Left = 113
      Top = 2
      Width = 109
      Height = 30
      Caption = 'Editar Etapa'
      DoubleBuffered = True
      Glyph.Data = {
        36080000424D360C000000000000360800002800000010000000100000000100
        2000000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60033000000000033003300330033330000161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD0000FF330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC0033FF0000FF00330033006600330099003300CC003300
        FF00FF3300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000CC6633009933
        3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009696960086868600CC663300CC66
        330099333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF006699990099333300CC666600CC996600CC99
        6600CC66330099333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008080800099996600CC996600CC996600CC996600CC99
        6600CC663300FF99660099333300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009696960086868600CC663300CC996600CC996600CC996600CC99
        6600CC666600CC996600FF99990099333300FFFFFF00FFFFFF00FFFFFF00FFFF
        FF006699990099333300CC666600CC996600CC996600CC996600CC996600CC99
        6600CC666600F0CAA600FFECCC00CC666600FFFFFF00FFFFFF00FFFFFF008080
        800099996600CC996600CC996600CC996600CC996600CC996600CC996600CC66
        6600F0CAA600FFECCC00FF99660099666600FFFFFF00FFFFFF00FFFFFF008686
        8600CC663300CC996600CC996600FF999900FF999900CC999900CC6666006699
        CC0090A9AD00CC99660099666600FFFFFF00FFFFFF00FFFFFF00CC999900CC99
        9900F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600CC99660066CCCC0033CC
        FF003399FF0066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC99
        6600F0CAA600FFCCCC00FFCCCC00FFCCCC00CC996600FFCCCC0033CCFF0000CC
        FF0000CCFF003399FF0066999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC99
        9900FFCCCC00FFCCCC00FFECCC00CC999900FFCCCC00F1F1F100B2B2B20033CC
        FF0000CCFF0000CCFF003399FF0066999900FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00CC999900EAEAEA00CC996600FFECCC00FFFFFF00FF99990099666600FFFF
        FF0033FFFF0000CCFF0000CCFF003399FF0066999900FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CC996600FFFFFF00CC996600FF99990099666600FFFFFF00FFFF
        FF00FFFFFF0033FFFF0000CCFF0000CCFF003399FF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0033FFFF0033CCCC0066999900FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0099CCCC00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnNovaEtapaClick
    end
  end
end
