inherited fControle_Obras: TfControle_Obras
  Caption = 'fControle_Obras'
  ExplicitWidth = 1050
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 148
      Caption = 'Controle de Obras'
      ExplicitWidth = 148
    end
  end
  inherited gropGridPrincipal: TGroupBox
    Top = 194
    Height = 273
    ExplicitTop = 194
    ExplicitHeight = 273
    inherited grdBasico: TDBGrid
      Height = 256
    end
  end
  object panelFiltros: TPanel [3]
    Left = 0
    Top = 39
    Width = 1044
    Height = 155
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object btnFlat: TSpeedButton
      Left = 4
      Top = 2
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330032383200313E3200304332002F4831002E4D31002D51
        30002B553000295C2E0026632C0023692A00207028001D7526001A7A2400187D
        2200177F21001681210015812000158220001582200015822000158220001582
        2000158220001582200015822000158220001582200015822000158220001582
        2000158220001582200015822000158221001581250016803300187D4D001A7B
        69001B797C001C788E001E769E001E75A7001F74AE001F73B5001F73BA002072
        BE002072C0002072C1002072C2002073C3002073C3002173C3002072C1001F6F
        BD001D6DB9001C6AB5001B67B1001A65AF001964AE001964AD001963AC001964
        AC001964AB001A64A7001A66A0001D699400216C86002870780031746B003C77
        620045796300517A66005F7C6B00707D72007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00CBCBCB00CCCCCC00CDCDCD00C9D1D300C5D6D900C1D9DF00BEDD
        E300BBDFE700B4E0EC00AEE0F000A8E0F300A3DFF5009FDEF7009CDEF80093D9
        FA008BD5FB0087D3FC0084D2FC0082D1FD0081D1FD007FD0FD007CC9FE0076BE
        FE0077B0FE00789DFE008B85FE009773FE00A461FE00B749FE00C933FE00DE1D
        FE00F00CFE00FB03FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F570F5F5F5F5F5F5F5F5F5F5F5F5F5F570E370F5
        F5F5F5F5F5F5F5F5F5F5F570E3E3E370F5F55454F5F5F5F5F5F5707070E37070
        70F55454F5F5F5F5F5F5F5F570E270F5F5F5F5F5F5F5F5F5F5F5F5F570E170F5
        F5F554545454F5F5F5F5F5F570E170F5F5F554545454F5F5F5F5F5F570DE70F5
        F5F5F5F5F5F5F5F5F5F5F5F570D970F5F5F5545454545454F5F5F5F570D770F5
        F5F5545454545454F5F5F5F570D570F5F5F5F5F5F5F5F5F5F5F5F5F570D570F5
        F5F55454545454545454F5F570D570F5F5F55454545454545454F5F5707070F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5}
      OnClick = btnFlatClick
    end
    object Image3: TImage
      Left = 214
      Top = 4
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D617036050000424D360500000000000036040000280000001000
        0000100000000100080000000000000100000000000000000000000100000001
        0000000000000101010002020200030303000404040005050500060606000707
        070008080800090909000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F
        0F00101010001111110012121200131313001414140015151500161616001717
        170018181800191919001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F
        1F00202020002121210022222200232323002424240025252500262626002727
        270028282800292929002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F
        2F003030300031313100323232003333330032383200313E3200304332002F48
        31002E4D31002D5130002B553000295C2E0026632C0023692A00207028001D75
        26001A7A2400187D2200177F2100168121001581200015822000158220001582
        2000158220001582200015822000158220001582200015822000158220001582
        2000158220001582200015822000158220001582200015822100158125001680
        3300187D4D001A7B69001B797C001C788E001E769E001E75A7001F74AE001F73
        B5001F73BA002072BE002072C0002072C1002072C2002073C3002073C3002173
        C3002072C1001F6FBD001D6DB9001C6AB5001B67B1001A65AF001964AE001964
        AD001963AC001964AC001964AB001A64A7001A66A0001D699400216C86002870
        780031746B003C77620045796300517A66005F7C6B00707D72007E7E7E007F7F
        7F00808080008181810082828200838383008484840085858500868686008787
        870088888800898989008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F
        8F00909090009191910092929200939393009494940095959500969696009797
        970098989800999999009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F
        9F00A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7
        A700A8A8A800A9A9A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAF
        AF00B0B0B000B1B1B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7
        B700B8B8B800B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
        BF00C0C0C000C1C1C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7
        C700C8C8C800C9C9C900CACACA00CBCBCB00CCCCCC00CDCDCD00C9D1D300C5D6
        D900C1D9DF00BEDDE300BBDFE700B4E0EC00AEE0F000A8E0F300A3DFF5009FDE
        F7009CDEF80093D9FA008BD5FB0087D3FC0084D2FC0082D1FD0081D1FD007FD0
        FD007CC9FE0076BEFE0077B0FE00789DFE008B85FE009773FE00A461FE00B749
        FE00C933FE00DE1DFE00F00CFE00FB03FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F570F5F5F5F5F5F5F5F5F5F5
        F5F5F5F570E370F5F5F5F5F5F5F5F5F5F5F5F570E3E3E370F5F55454F5F5F5F5
        F5F5707070E3707070F55454F5F5F5F5F5F5F5F570E270F5F5F5F5F5F5F5F5F5
        F5F5F5F570E170F5F5F554545454F5F5F5F5F5F570E170F5F5F554545454F5F5
        F5F5F5F570DE70F5F5F5F5F5F5F5F5F5F5F5F5F570D970F5F5F5545454545454
        F5F5F5F570D770F5F5F5545454545454F5F5F5F570D570F5F5F5F5F5F5F5F5F5
        F5F5F5F570D570F5F5F55454545454545454F5F570D570F5F5F5545454545454
        5454F5F5707070F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5}
      Transparent = True
      Visible = False
    end
    object Image4: TImage
      Left = 234
      Top = 4
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D617036050000424D360500000000000036040000280000001000
        0000100000000100080000000000000100000000000000000000000100000001
        0000FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FD00FD00FC00FC00FA01FA00F801F800F302F300ED04ED00E307E300D50B
        D500C311C300AA18AA00892289005D305D00483848003D3D3D003E3E3E003F3F
        3F00404040004141410042424200434343004444440045454500464646004747
        470048484800494949004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F
        4F00505050005151510052525200535353005454540055555500565656005757
        570058585800595959005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F
        5F00606060006161610062626200636363006464640065656500666666006767
        670068686800696969006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F
        6F00707070007171710072727200737373007474740075757500767676007777
        770078787800797979007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F
        7F00808080008181810082828200838383008484840085858500868686008787
        870088888800898989008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F
        8F00909090009191910092929200939393009494940095959500969696009797
        970098989800999999009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F
        9F00A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7
        A700A8A8A800A9A9A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAF
        AF00B0B0B000B1B1B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7
        B700B8B8B800B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
        BF00C0C0C000C1C1C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7
        C700C8C8C800C9C9C900CACACA00C8CCCE00C5CFD200C3D1D500C1D3D900BFD5
        DC00BDD7DF00ACD3E400A0D0E80096CFEC0090CFEF0087CDF30080C9F40079C5
        F50071C0F60068BBF70060B6F8005BB3F90057B1FA0051ADFA004DAAFB0049A7
        F90046A3F700419FF5003D9BF3003A98F2003692EB00328CE3002F87DC00297E
        D1002374C3001E6CB9001C67B3001A65AF001964AE001963AD001963AD001963
        AC001963AC001963AB001964A9001864A50018669E0018698F00176E7B001773
        650016794800157F300015812700158221001582200015822000158220001582
        2000191919191919191919191919191919191919EEEEEE191919191919191919
        19191919EEE3EE191919FFFFFFFFFFFFFFFF1919EEE3EE191919FFFFFFFFFFFF
        FFFF1919EEE3EE19191919191919191919191919EEE3EE191919FFFFFFFFFFFF
        19191919EEE3EE191919FFFFFFFFFFFF19191919EEE2EE191919191919191919
        19191919EEDFEE191919FFFFFFFF191919191919EEDCEE191919FFFFFFFF1919
        19191919EED9EE1919191919191919191919EEEEEED7EEEEEE19FFFF19191919
        191919EED3D5D6EE1919FFFF1919191919191919EED3EE191919191919191919
        1919191919EE1919191919191919191919191919191919191919191919191919
        1919}
      Transparent = True
      Visible = False
    end
    object lblMsg: TLabel
      Left = 29
      Top = 7
      Width = 153
      Height = 13
      Caption = '<< Clique aqui para expandir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPesqFornec: TSpeedButton
      Left = 111
      Top = 43
      Width = 35
      Height = 22
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000E9E4DF00B174
        4A00983F00009D4B0C009C480A009C480A009C480A009C480A009C480A009C48
        0A009C480A009C480A009D490B00983F0000B1744900EAE5E000AF7042009232
        000098430500882500009A4505009A4607009A4607009A4607009A4607009A46
        07009A4607009A4607009A4607009B47080091310000B3774E009D4C0E009E4D
        0F00A4571C00F6F0E800973F05009C4A0B009F4F13009F4E12009F4E12009F4E
        12009F4E12009F4E12009F4E12009F4E12009F4F11009D4C0C00A3571C00A153
        15009D4A0B00E6D5C600E7D3C200943B0000A2551800A2531600A2531600A253
        1600A2531600A2531600A2531600A2531600A1521500A4581F00A9622900A85F
        2200A85F24008A290000FFFFFF00EDE0D40097400000A8602500A85F2400A85F
        2400A85F2400A85F2400A85F2400A85F2400A75F2200AB642B00AC682E00AB63
        2900AB642A00A8602300B06E3800FFFFFF00BB865800A2521000AB652B00AB63
        2A00AB632A00AB632A00AB632A00AB632A00AB622700AC693000B1723800AF6F
        3200AF6F3300B0703400AA642400A9632500FFFFFF00C4966A00A75F1D00A964
        2300A9642500AD6C2E00B0713400AF6F3300AF6F3200B1733900B5774000B274
        3900B2753A00B2753A00B3763B00A7611F00D5B39400E7D5C200B2733C00DABD
        A200D3B19300AE6C2E00AC692B00B3753C00B2743900B4773F00BA824A00B87D
        4600B97D4700B97D4700B97D4700B9804900AD682500D9BDA100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C1905E00B5773D00B87D4500BA824C00BC875100BA83
        4C00BB834D00BB834D00BB844D00B9804800C2905D00FCF9F600FFFFFF00FFFF
        FF00FFFFFF00F4F7FA00F3E8DE00BA804700BA824A00BB875200C1915B00BF8D
        5600C08E5600C08E5600C08E5600BB874B00D7B79500FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00EDEEEF00FCF9F500C4956100BE8C5400C3915B00C5966000C394
        5C00C3945D00C3945D00C3955D00C18F5600D2AF8500FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00EAECEE00FBF7F200C5956000C3935B00C5976200C9A16D00C99F
        6900C99F6A00C99F6A00C99F6A00C99F6900C4975D00EBDBC800FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D9BC9700C4985D00C99F6900CAA26D00CBA26D00CCA3
        6D00CCA36D00CCA36D00CCA36D00CCA36D00CBA16B00C89B6200E9DAC400F9F8
        F600F5EDE400E2CBAD00C4965B00CBA36D00CCA36D00CBA46D00DABE9800CEA8
        7000D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00D1AE7B00CCA36800C79A
        5A00C79D5E00CDA66D00D1AF7C00D1AE7C00CDA76E00DCC29D00F0EEEA00D9C1
        9800D4B27D00D5B58200D5B58200D5B58200D5B58200D5B58200D5B58200D5B6
        8300D5B68300D5B58200D5B58200D4B27D00DBC19700F1EEEC00}
      OnClick = btnPesqFornecClick
    end
    object Label2: TLabel
      Left = 8
      Top = 29
      Width = 59
      Height = 13
      Caption = 'C'#243'd. Obra'
    end
    object Label5: TLabel
      Left = 149
      Top = 29
      Width = 88
      Height = 13
      Caption = 'Descri'#231#227'o Obra'
    end
    object edtCodFornec: TEdit
      Left = 8
      Top = 44
      Width = 100
      Height = 21
      HelpContext = 2
      ImeName = 'btnPesqFornec'
      TabOrder = 0
      OnExit = edtCodFornecExit
      OnKeyPress = edtCodFornecKeyPress
    end
    object edtFornecedor: TEdit
      Left = 149
      Top = 44
      Width = 377
      Height = 21
      TabStop = False
      Color = clGradientInactiveCaption
      ReadOnly = True
      TabOrder = 1
    end
    object btnFiltrar: TBitBtn
      Left = 429
      Top = 116
      Width = 95
      Height = 35
      Caption = '&Filtrar'
      DoubleBuffered = True
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000F5FBFE00DAC5
        B600B27447009A4303009D480A009D490B009D490B009D490B009D490B009D49
        0B009D490B009D490B009D490B009D490B009D490B009D490B009D490B009D49
        0B009D490B009D480A009A430300B1744700DBC6B700F5FAFE00D9C2B1009842
        0400963B00009C480A009C480A009C480A009C480A009C480A009C480A009C48
        0A009C480A009C480A009C480A009C480A009C480A009C480A009C480A009C48
        0A009C480A009C480A009C480A00963B000098410300DCC7B900AF704100963C
        00009C4708009B4708009B4708009A4406009A4304009A4304009A4304009A43
        04009A4304009A4304009A4304009A4304009A4304009A4304009A4304009A43
        04009A4406009B4708009B4708009C470800953A0000B57B50009F5015009E4C
        0F009E4E11009E4D11009D4C0F00A0521500A5592000A2571D00A3571D00A357
        1D00A3571D00A3571D00A3571D00A3571D00A3571D00A3571D00A2571D00A559
        2000A05215009D4C0F009E4D11009E4E11009E4C0F00A0501400A3571D00A051
        1400A1521500A15215009B480800C6997600F6F0EB00F5EDE700F5EEE800F5ED
        E800F5EDE800F5EDE800F5EDE800F5EDE800F5EDE800F5EEE800F5EDE700F6F0
        EB00C69976009B480800A1521500A1521500A0511300A4591E00A55B2100A355
        1800A3551900A3551A009C4A0A00D1AD8F00FFFFFF00CFA88A00D0AA8C00D0AC
        8D00D0AB8D00D0AB8D00D0AB8D00D0AB8D00D0AC8D00D0AA8C00CFA88A00FFFF
        FF00D1AD8F009C4A0A00A3551A00A3551900A2541800A65D2500A9622A00A75D
        2000A75E2200A75E2200A2531100D5B09400F1E5DE009B4703009E4A08009E4C
        0B009E4C0A009E4C0A009E4C0A009E4C0A009E4C0B009E4A08009B470300F1E5
        DE00D5B09400A2531100A75E2200A75E2200A75D1F00AB642C00AC672E00A961
        2600AA612700AA622700A3571700D6B39600F3EBE300A65D2000A9602500AA62
        2800AA622700AA622700AA622700AA622700AA622800A9602500A65D2000F3EB
        E300D6B39600A3571700AA622700AA612700A9612500AC683100AE6C3300AC66
        2B00AC662C00AC662C00A65C1D00D7B49800F4ECE400A9612400AC642900AC66
        2C00AC662C00AC662C00AC662C00AC662C00AC662C00AC642900A9612400F4EC
        E400D7B49800A65C1D00AC662C00AC662C00AC662A00AE6D3600B1723900AF6D
        3100AF6E3100AF6E3200A9632400D7B89B00F4EDE500AB682B00AE6B2F00AF6E
        3200AF6E3100AF6E3200AF6E3200AF6E3100AF6E3200AE6B2F00AB682B00F4ED
        E500D7B89B00A9632400AF6E3200AF6E3100AF6D3100B1733A00B4773F00B172
        3700B1723800B1723800AC682900D9BA9F00F4EDE600AE6D3000B0703500B172
        3800B1723800B1723800B0723700B1723800B1723800B0703500AE6D3000F4ED
        E600D9BA9F00AC682900B1723800B1723800B1713600B4783F00B77B4500B476
        3C00B4773C00B4773D00B06D2F00D9BDA200F5EDE700B1723500B4753A00B477
        3D00B2743800AB642400AD692800B2733800B4773D00B4753A00B1723500F5ED
        E700D9BDA200B06D2F00B4773D00B4773D00B4763B00B67B4400BA824A00B87C
        4400B87C4500B87C4500B3733700DCC0A400F4EDE500B3733800B77C4200B375
        3800B9814B00EEE1D500F1E8E000B97F4700B4763C00B77B4100B3743800F5ED
        E600DCC0A300B3733700B87C4500B87C4500B87C4300BA824D00BC875000BA80
        4900BA814A00BA814A00B6783D00DCC0A400F9F4F000C3926100B5793D00C799
        6C00F2E8DF00FFFFFF00FFFFFF00EBDBCC00BE885400B97F4500BE895300F6F1
        EB00DCC0A500B6783D00BA814A00BA814A00BA804800BC875100BE8B5500BC85
        4E00BC864F00BC864F00B87E4200E0C8B000FFFFFF00F6F0EB00B67A3C00F1E7
        DD00FCFAF800FAF8F500F1E6DD00FFFFFF00D3B18D00C89B6D00FCFCFA00FFFF
        FF00E0C6AC00B87E4200BC864F00BC864F00BC854D00BE8B5800C1915B00BF8B
        5400BF8C5400BF8C5400BE8A5200C5956200CEA77F00CBA27500B9814400DBBE
        9F00C2936000F9F4F000D7B79500C99E6E00D1AB8400C2905C00DBBD9E00DCC2
        A500CAA17400BD895000BF8C5400BF8C5400BF8B5400C3915C00C4965F00C292
        5A00C2925B00C2925B00C2925B00C0905600BE8B5000BF8D5400C1905900C08D
        5400C4955F00FCFAF700DFC7AB00BC874A00C2915A00C18F5600BD884D00BD88
        4B00C08D5300C2925B00C2925B00C2925B00C2925A00C5976200C6996500C596
        5F00C5975F00C5975F00C5975F00C5976000C5966000C5976000C5976000C393
        5900C89B6800FCFAF700E0C9AC00C18E5300C5965F00C5976000C5976000C597
        6000C5965F00C5976000C5975F00C5975F00C5965F00C79B6600C9A06C00C89D
        6700C89E6800C89E6800C89E6800C89E6800C89E6800C89E6800C89E6800C69B
        6300CAA26F00FDFCFA00E4CEB400C5955C00C89E6800C89E6800C89E6800C89E
        6800C89E6800C89E6800C89E6800C89E6800C89D6700CAA26D00CCA47200CAA1
        6B00CBA26C00CBA26C00CBA26C00CBA26C00CBA26C00CBA26C00CBA26C00C99F
        6900CEA67400F6EEE600E1CAAC00C79C6400CBA26C00CBA26C00CBA26C00CBA2
        6C00CBA26C00CBA26C00CBA26C00CBA26C00CAA16B00CDA57300CDA77300CDA5
        7000CDA57000CDA57000CDA57000CDA57000CDA57000CDA57000CDA67000CDA5
        7000CDA67000D1AD7D00CEA87600CCA56F00CDA57000CDA57000CDA57000CDA5
        7000CDA57000CDA57000CDA57000CDA57000CDA57000CDA97500D9BD9600CFA9
        7200D0AD7900D0AC7900D0AC7900D0AC7900D0AC7900D0AC7900D0AC7900D0AD
        7900D0AC7800D0AB7600D0AC7700D0AC7900D0AC7900D0AC7900D0AC7900D0AC
        7900D0AC7900D0AC7900D0AC7900D0AD7900CEA86F00DBC29D00E9DFD100D2AF
        7A00D2AE7800D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B1
        7E00D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B1
        7E00D4B17E00D4B17E00D4B17E00D2AE7800D3AF7800ECE2D600F6F8FB00E9E0
        D000D9C09500D5B48000D5B68400D5B68300D5B68300D5B68300D5B68300D5B6
        8300D5B68300D5B68300D5B68300D5B68300D5B68300D5B68300D5B68300D5B6
        8300D5B68300D5B68400D5B48000DAC09500EBE0D100F5F8FC00}
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnFiltrarClick
    end
    object BitBtn2: TBitBtn
      Left = 429
      Top = 81
      Width = 95
      Height = 35
      Caption = '&Limpar'
      DoubleBuffered = True
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000F5FBFE00DAC5
        B600B27447009A4303009D480A009D490B009D490B009D490B009D490B009D49
        0B009D490B009D490B009D490B009D490B009D490B009D490B009D490B009D49
        0B009D490B009D480A009A430300B1744700DBC6B700F5FAFE00D9C2B1009842
        0400963B00009C480A009C480A009C480A009C480A009C480A009C480A009D49
        0B009D4A0B009D490A009D490A009D4A0B009C490B009C480A009C480A009C48
        0A009C480A009C480A009C480A00963B000098410300DCC7B900AF704100963C
        00009C4708009B4708009B4708009B4708009B4708009B460700973F00008E30
        00008A2500008A260000892600008A2500008F310000983F00009B4608009B47
        08009B4708009B4708009B4708009C470800953A0000B57B50009F5015009E4C
        0F009E4E11009E4D11009E4D11009F4E1100984403009C480800AF6F3E00DCBF
        A900F9F5F200FFFFFF00FFFFFF00F7F2ED00DABAA300AD6A37009B4606009A44
        05009E4E11009E4D11009E4D11009E4E11009E4C0F00A0501400A3571D00A051
        1400A1521500A1521500A152160098420000B06E3D00DFC5B000FFFFFF00FFFF
        FF00EFE2D900E2CAB900E2CCBB00F0E5DC00FFFFFF00FFFFFF00DBBEA600AD67
        330099450300A1521600A1521500A1521500A0511300A4591E00A55B2100A355
        1800A3551900A3561A009B480600A55E2400FFFFFF00FFFFFF00ECE0D400AF6D
        3C00A65B2100A0511200A1511300A55D2300B1724100F2E7E000FFFFFF00FFFF
        FF00A25316009C490900A3561A00A3551900A2541800A65D2500A9622A00A75D
        2000A75E2200A3531400B77E4D00FFFFFF00FEFDFD00BB825600963D00009F4E
        0C00A1521100A65A1E00A55A1C00A15111009F4E0D00963F0000C18E6300FFFF
        FF00FFFFFF00B4744100A3551600A75E2200A75D1F00AB642C00AC672E00A961
        2600A85F2400A9612400E7D5C400FFFFFF00BC865800A3561600A2541400B77C
        4A00D7B69A00E6D0BF00E4CFBD00D5B19400B4764200A3561500A3561700C391
        6800FFFFFF00E1CAB500A65D2000A9612500A9612500AC683100AE6C3300AC67
        2B00A75E1F00C18F6500FFFFFF00EEDFD3009B4A0300A55A1900B77C4A00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00B2723C00A55B1B009B49
        0400F4ECE600FFFFFF00BC865600A85F2200AC672B00AE6D3600B1723900AF6E
        3200A1540E00EFE3D800FFFFFF00B97F4E00A8612000BD855400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00B77E4800A75E
        1E00BE895B00FFFFFF00E6D3C300A3571400AF6E3200B1733A00B4774000B170
        3600A65D1B00FFFFFF00F0E5DA00B2743B00AA662700D8B89D00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3B09200AA65
        2500B67A4600F5EDE700FAF9F600A45A1500B1723700B4783F00B77B4500B373
        3800AE6A2B00FFFFFF00E8D6C500B1713600B1703500E6D3C100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3CBB700AF6F
        3200B2743900EDDFD000FFFFFF00AB652500B4743900B67B4500BA824A00B67A
        4100B2713400FFFFFF00EADAC900B5783D00B4763B00E7D2C000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6CFBB00B376
        3900B77D4600EFE3D800FFFFFF00B06D2E00B87B4200BA824D00BC875000BA80
        4800B06F3000FFFFFF00F4EAE100BB864F00B5773A00DABC9D00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4B18F00B274
        3600C08D5A00F8F3EE00FBFAF700AF6C2B00BA814900BC875100BE8B5500BC87
        5000B1712F00F3E8DF00FFFFFF00C89C6E00B57A3E00C3926000FDFDFC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFF00D6B49300AB66
        2000CEA98200FFFFFF00EBDBCD00B1733300BC874F00BE8B5800C1915B00BF8B
        5500BB844A00D1AC8400FFFFFF00F8F3EB00B3783700BB844900BC884F00FCF9
        F800FAF6F200E4D2BD00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F1
        EC00F5EFE700FFFFFF00CCA47900BC864C00BF8B5400C3915C00C4965F00C292
        5A00C1915900C2915B00EFE4D500FFFFFF00D7B99400BE8B5000BE894E00C79B
        6800D5B48E00C08E5600D0AC8200ECDDCC00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00EBDBCA00C08F5600C2925900C2925A00C5976200C6996500C596
        5F00C5976000C18F5400D0AD8200FFFFFF00FFFFFF00DBBF9F00BB864500BE8B
        4E00C08D5200C5955E00C18F5400C0905600CBA37400FCFDFB00FFFFFF00FFFF
        FF00FEFEFF00CEA77900C2905600C5976000C5965F00C79B6600C9A06C00C89D
        6700C89E6800C89E6800C4935900CCA37100FFFFFF00FFFFFF00FDFDFC00D9BA
        9700CFA97A00C6996200C4955B00CDA57400E3CEB500FFFFFF00FFFFFF00FEFF
        FF00C99E6800C4945B00C89E6800C89E6800C89D6700CAA26D00CCA47200CAA1
        6B00CBA26C00CBA26C00CBA16D00C5995E00D5B48A00EFE3D200FFFFFF00FFFF
        FF00F6F1E900CFAA7900E3CDB000F9F4EF00FFFFFF00FEFDFE00EDDFCD00D2B0
        8400C6995F00CBA26D00CBA26C00CBA26C00CAA16B00CDA57300CDA77300CDA5
        7000CDA57000CDA57000CDA67000CDA67100CAA16700CCA36E00D8B98F00F0E3
        D300FBF9F500F8F5F000FFFFFF00FDFCFC00EDDECE00D5B78D00CCA36C00CAA1
        6800CDA67100CDA57000CDA57000CDA57000CDA57000CDA87500D9BD9600CFA9
        7200D0AD7900D0AC7900D0AC7900D0AC7900D0AD7900D0AC7800CEA97200C9A0
        6400C79B5F00CAA26700C99D6000C79B5E00CAA16500CEA97200D0AC7800D0AD
        7900D0AC7900D0AC7900D0AC7900D0AD7900CEA86F00DBC19E00E9DFD100D2AF
        7A00D2AE7800D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B17E00D4B2
        7E00D4B27F00D4B17D00D4B17E00D4B27F00D4B17E00D4B17E00D4B17E00D4B1
        7E00D4B17E00D4B17E00D4B17E00D2AE7800D3AF7800ECE2D500F6F8FB00E9E0
        D000D9C09500D5B48000D5B68400D5B68300D5B68300D5B68300D5B68300D5B6
        8300D5B68300D5B68300D5B68300D5B68300D5B68300D5B68300D5B68300D5B6
        8300D5B68300D5B68400D5B48000DAC09500EBE0D100F5F8FC00}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 68
      Width = 216
      Height = 40
      Caption = 'Dta Previs'#227'o'
      TabOrder = 2
      object edtDtPrevInicio: TDateEdit
        Left = 5
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtPrevFim: TDateEdit
        Left = 110
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 111
      Width = 216
      Height = 40
      Caption = 'Dta Obra'
      TabOrder = 3
      object edtDtInicio: TDateEdit
        Left = 5
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDtFim: TDateEdit
        Left = 110
        Top = 15
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object rdStatus: TRadioGroup
      Left = 230
      Top = 68
      Width = 195
      Height = 83
      Caption = 'Status'
      Columns = 2
      Items.Strings = (
        'Aguardando'
        'Em Obras'
        'Paralisada'
        'Finalizada'
        'Cancelada'
        'Todos')
      TabOrder = 4
    end
  end
  inherited frRelatorio: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageHeader1: TfrxPageHeader
        inherited Memo15: TfrxMemoView
          Memo.UTF8W = (
            'C'#243'digo')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'www.anonimus.info')
        end
        inherited SysMemo1: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited lblFantasia: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbTit01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbTit03: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lblUsuario: TfrxMemoView
          Memo.UTF8W = (
            'Usu'#225'rio:')
        end
        inherited lbFild01: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild02: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lbFild03: TfrxMemoView
          Memo.UTF8W = (
            '...')
        end
        inherited lblEndereco: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited lblRazao_Social: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited Memo14: TfrxMemoView
          Memo.UTF8W = (
            'T'#205'TULO DO RELAT'#211'RIO')
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end