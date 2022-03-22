object fCadastro: TfCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro'
  ClientHeight = 572
  ClientWidth = 794
  Color = clWindow
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pageCadastro: TPageControl
    Left = 0
    Top = 0
    Width = 794
    Height = 517
    ActivePage = tabCadastro
    Align = alClient
    TabOrder = 0
    object tabCadastro: TTabSheet
      Caption = '&1.Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 517
    Width = 794
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object btnHelp: TSpeedButton
      Left = 0
      Top = 0
      Width = 175
      Height = 55
      Align = alLeft
      Caption = 'Ajuda'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C480A9C480A9C480A9C480A9C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C47089B47089B47089B47089B47089B
        47089B45069A45069B47099B47089B47089B47089B47089B47089B47089B4708
        9B47089B47089B47089C4708953A00B57B509F50159E4C0F9E4E119E4D119E4D
        119E4D119E4E119D4C0EA051169F4E129B47099E4E119E4D119E4D119E4D119E
        4D119E4D119E4D119E4D119E4D119E4D119E4E119E4C0FA05014A3571DA05114
        A15215A15215A15215A15215A152159B4808C2916AE2C9B7A154189E4D0EA152
        16A15215A15215A15215A15215A15215A15215A15215A15215A15215A05113A4
        591EA55B21A35518A35519A35519A35519A3561AA35418984402C69976FFFFFF
        D7B69D963E009E4F10A25317A25317A25317A25317A25418A3561AA35519A355
        19A35519A25418A65D25A9622AA75D20A75E22A75E22A85E22A35618A65D20AC
        672FEAD7C9FFFFFFFFFFFFF3EAE4AE6B34A96328A96227A96227A96329A96023
        A25618A85E22A75E22A75E22A75D1FAB642CAC672EA96126AA6127AA6227A65D
        1FB2713BECDCCFF4EDE5FFFFFFFFFFFFFFFFFFFFFFFFFBF8F5EFE3D9EDDDD1ED
        DED3EEE0D4EDDED1B1713BA65D1FAA6227AA6127A96125AC6831AE6C33AC662B
        AC662CAC662CA75C1ED5B191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4B191A75C1EAC662CAC662CAC662AAE
        6D36B17239AF6D31AF6E31AF6E31AA6325D6B798FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6B798AA6325AF6E
        31AF6E31AF6D31B1733AB4773FB17237B17238B17238AD6A2BD7B79BFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D7B79BAD6A2BB17238B17238B17136B4783FB77B45B4763CB4773CB4773DB06D
        30D9BA9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD9BA9DB06D30B4773DB4773DB4763BB67B44BA824AB87C44
        B87C45B87C45B37438D9BDA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BDA0B37438B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814AB6793DDBBEA3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBBEA3B6793DBA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FB87E44DCC1A6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DCC1A6B87E44BC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BB84
        4ADEC5A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDEC5A9BB844ABF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BBE8A50DFC8ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8ABBE8A50C2925BC2925BC2925AC5
        9762C69965C5965FC5975FC59760C28F56E1C9AEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1C9AEC28F56C597
        60C5975FC5965FC79B66C9A06CC89D67C89E68C89E68C5965DE2CFB6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E2CFB6C5965DC89E68C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CC89E
        66D3B285FCFAF9FCFAF8FBFAF7FBFAF7FBFAF7FBFAF7FBFAF7FBFAF7FBFAF7FB
        FAF7FCFAF8FCFAF8D3B185C89E66CBA26CCBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA670CAA169D1AE7ED2B081D2B081D2B081D2B081D2B081D2B0
        81D2B081D2B081D2B081D2B081D1AE7FCAA169CDA670CDA570CDA570CDA570CD
        A875D9BD96CFA972D0AD79D0AC79D0AC79D0AD79CFAB76CFAA74CFAA74CFAA74
        CFAA74CFAA74CFAA74CFAA74CFAA74CFAA74CFAA74CFAB76D0AD79D0AC79D0AC
        79D0AD79CEA86FDBC19EE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17E
        D4B17ED4B17ED4B17ED2AE78D3AF78ECE2D5F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D5B683D5B683D5B684D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      OnClick = btnHelpClick
    end
    object btnOK: TSpeedButton
      Left = 444
      Top = 0
      Width = 175
      Height = 55
      Align = alRight
      Caption = '&OK'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A43039D480A9D490B9D490B9D490B9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B009C480A9C480A9C490B9B46079942019942029C490B
        9D490B9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009C47089B47089B4708973F009235009E
        4D0F9D490C9032009C46079B47089B47089B47089B47089B47089B47089B4708
        9B47089B47089B47089C4708953A00B57B509F50159E4C0F9E4E119E4E119945
        049E4C0FFFFFFFFFFFFFFFFFFFD3B0959740009E4D109E4E119E4D119E4D119E
        4D119E4D119E4D119E4D119E4D119E4D119E4E119E4C0FA05014A3571DA05114
        A152159E4C0DA25519E3CEBDFFFFFFFFFFFFFFFFFFF6F1ECAA642E9C490BA152
        15A15215A15215A15215A15215A15215A15215A15215A15215A15215A05113A4
        591EA55B21A35518A3561A984300D2AB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CCA3829A4604A3561AA35519A35519A35519A35519A35519A35519A35519A355
        19A35519A25418A65D25A9622AA75E209A4702D3B194FFFFFFFFFFFFFFFFFFFB
        F8F5FBFBF8FFFFFFF5EDE7AD6931A5591CA75E22A75E22A75E22A75E22A75E22
        A75E22A75E22A75E22A75E22A75D1FAB642CAC672EA65B1DB57744FFFFFFFFFF
        FFFFFFFFFFFFFFCCA17ED2AE90FFFFFFFFFFFFD0A988A0510FAA6328AA6127AA
        6127AA6127AA6127AA6127AA6127AA6127AA6127A96125AC6831AE6A31AA6126
        EFE2D8FFFFFFFFFFFFFFFFFFEBDBCCA76020A75E21FFFFFFFFFFFFFEFFFF9B46
        00AD672CAC662CAC662CAC662CAC662CAC662CAC662CAC662CAC662CAC662AAE
        6D36B1723AAA6628B37540F9F4F1FAF7F3E6D1C09E500AAE6B2FA15611DEC1A9
        FFFFFFFFFFFFCA9E79A86021AF6E32AF6E32AF6E31AF6E31AF6E31AF6E31AF6E
        31AF6E31AF6D31B1733AB47740B17237AD682BB57943BB8350AD6C2FB07034B1
        7338AF6D30BA8452F8F3EEFFFFFFEEE2D8B3763EAF6D31B17238B17238B17238
        B17238B17238B17238B17238B17136B4783FB77B45B4763CB4773DB27337B171
        36B3753AB4773DB4773DB4763CAF6C2EE1CAB2FFFFFFFFFFFFD2B08DAC6829B4
        773DB4773CB4773CB4773CB4773CB4773CB4773DB4763BB67B44BA824AB87C44
        B87C45B87D45B87D45B87C45B87C45B87C45B87D45B5773CBC844FF8F1ECFFFF
        FFFDFBFCC39262B4763BB87D45B87C45B87C45B87C45B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814ABA814ABA814ABA814ABA814ABA814ABA8149
        B5793ED1AA85FFFFFFFFFFFFEEDFD3AE6E2CBA814ABA814ABA814ABA814ABA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FBC864FBC864FBC864FBC
        864FBC864FBC864FBC854EB17230F9F7F4FFFFFFFFFFFFC39160B67C3FBD864F
        BC864FBC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BF8C
        54BF8C54BF8C54BF8C54BF8C54BF8C54BF8C56BD874DC49665FAF7F4FFFFFFFD
        FDFDC89C6ABB864DBF8C55BF8C54BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BC2925BC2925BC2925BC2925BC2925BC2925BC2925BC2925BBE8B
        4FDFC6AAFFFFFFFFFFFFEADAC8C08E56C19159C2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC5975FC5975FC5975FC5975FC5975FC5975F
        C5975FC59760C3935AC59963F6EFE8FFFFFFFFFFFFDCC2A2BB8646C59761C597
        60C5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E68C89E68C89E68C8
        9E68C89E68C89E68C89E68C89E68C89E68C69860C19056FFFFFFFFFFFFFFFFFF
        D1AE82C4975DC89D67C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26CCBA26DC6985FD8
        BE98FCFBF9FFFFFFFAF8F4D5B58BC79C62CBA26DCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA570CDA5
        70CDA570CDA670C89D64E4D0B4FFFFFFFFFFFFFAF5F1D0AC7CCAA168CDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79D0AC79
        D0AC79D0AC79D0AC79D0AC79D0AC79D0AD79CAA268D6B88BF3EBDEF8F5EEFFFF
        FFCEA771CDA76FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED1AC76
        D1AD76D4B380D9BA8CD2AE77D3AE77ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D6B683D5B582D5B581D3B17BDAC095EBE1D1F5F8FC}
      ParentFont = False
      OnClick = btnOKClick
      ExplicitLeft = 278
    end
    object btnCancelar: TSpeedButton
      Left = 619
      Top = 0
      Width = 175
      Height = 55
      Align = alRight
      Caption = 'C&ancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000F5FBFEDAC5B6
        B274479A4403994303953A00983E009C480A9D490B9D490B9D490B9D490B9D49
        0B9D490B9D490B9D490B9D490B9D490B9D490B9D480A9A4303B17447DBC6B7F5
        FAFED9C2B1984204963B00994202A55A24CCA283B06E419941009B48099C480A
        9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C480A9C48
        0A963B00984103DCC7B9AF7041963C009B4708973D00D2AD91FFFFFFF6EEE8A5
        5929953B009B47099B47089B47089B47089B47089B47089B47089B47089B4708
        9B47089B47089B47089C4708953A00B57B509F50159E4C0F9E4D109A4708DDC0
        ABFFFFFFFFFFFFE7D3C49C48099D4B0E9E4E119E4D119E4D119E4D119E4E119D
        4C0E9D4C0F9E4E119E4D119E4D119E4D119E4E119E4C0FA05014A3571DA05114
        A051159D4A0AD9BBA3FFFFFFFFFFFFFFFFFFCAA17F963E00A15317A15215A152
        15A15215A050129F4D10A05013A05013A15215A15215A15215A15215A05113A4
        591EA55B21A35518A3561A9D4B0CB77D4FFFFFFFFFFFFFFFFFFFFFFFFF994300
        9F4F10A3561AA3551AA25519933700E5D3C5C79A769C4807A3561BA35519A355
        19A35519A25418A65D25A9622AA75D20A75E22A85D219E4D0CCA9F7BFFFFFFFF
        FFFFFFFFFFE9D8CAA4571AA55A1DA75E22A0510FCBA280FFFFFFF6EEE6B2723D
        A5581AA75E22A75E22A75E22A75D1FAB642CAC672EA96126AA6127AA6227A95F
        249F500EF5EEE8FFFFFFFFFFFFFFFFFFC99B74A35717A55A1CB67A49F8F4F0FF
        FFFFFFFFFFC5946BA45818AA6327AA6127AA6127A96125AC6831AE6C33AC662B
        AC662CAC662CAC682EA45B1CBE895CFEFEFEFFFFFFFFFFFFF2E9E0AC692DA355
        13E0C7B1FFFFFFFFFFFFEFE2D8AE6C31AB6428AC672CAC662CAC662CAC662AAE
        6D36B17239AF6D31AF6E31AF6E31AF6D31AF6E34A55D1BCCA37FFFFFFFFFFFFF
        FFFFFFE9D7C6C9A07AFFFFFFFFFFFFFFFFFFCB9F79A75F1FAF6E33AF6D31AF6E
        31AF6E31AF6D31B1733AB4773FB17237B17238B17238B17238B17238B07034AF
        6E33DDC3AAFFFFFFFFFFFFFFFFFFF8F3EFFFFFFFFFFFFFF2E8DFB57842AF6D32
        B17238B17238B17238B17238B17136B4783FB77B45B4763CB4773CB4773CB477
        3CB4773CB4773DB27237AB6624FCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
        B293AF6B2EB4773CB4773DB4773CB4773CB4773DB4763BB67B44BA824AB87C44
        B87C45B87C45B87C45B87C45B87C45B87D45B5773CB77B42F0E6DBFFFFFFFFFF
        FFFFFFFFFCFCFDAB6522B77C43B87C45B87C45B87C45B87C45B87C45B87C43BA
        824DBC8750BA8049BA814ABA814ABA814ABA814ABA814ABA814ABA8149B4773B
        E0C8AFFFFFFFFFFFFFFFFFFFECDED0AC6925BB824ABA814ABA814ABA814ABA81
        4ABA814ABA8048BC8751BE8B55BC854EBC864FBC864FBC864FBC864FBC864FBC
        864FBC844BBD8853F3E9E0FFFFFFFFFFFFFFFFFFFFFFFFC2925EB67C3FBD8650
        BC864FBC864FBC864FBC864FBC854DBE8B58C1915BBF8B54BF8C54BF8C54BF8C
        54BF8C54BF8C54BF8C56BA8246D7B794FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCA9F72BB854ABF8C55BF8C54BF8C54BF8C54BF8B54C3915CC4965FC2925A
        C2925BC2925BC2925BC2925BC2925BC3935DB77F3EF1E6DAFFFFFFFFFFFFF0E4
        D6ECDECCFFFFFFFFFFFFEEE3D4C2925CC19057C2925BC2925BC2925BC2925AC5
        9762C69965C5965FC5975FC5975FC5975FC5975FC59760C4945DBE8B4DFFFFFF
        FFFFFFFFFFFFCEA87BC79963F9F7F3FFFFFFFFFFFFE8D6C1BA813FC59761C597
        60C5975FC5965FC79B66C9A06CC89D67C89E68C89E68C89E68C89E68C89E68C5
        975DDFC6A7FFFFFFFFFFFFF5EEE7BC8746C5975FC19257FFFFFFFFFFFFFFFFFF
        DBBF9BC4945BC89D67C89E68C89D67CAA26DCCA472CAA16BCBA26CCBA26CCBA2
        6CCBA26CCAA16CC89E66EEE2D2FFFFFFFFFFFFD9BB96C69B62CBA36EC5995FD7
        BA92FCF9F6FFFFFFFBFAF9D8BA94C89E66CBA26CCAA16BCDA573CDA773CDA570
        CDA570CDA570CDA570CDA570CDA570CCA46CD6B88DE2CDB0E7D5BECCA770CCA5
        6FCDA670CDA671C89D64DEC6A3FFFFFFFFFFFFF3EBE0CDA671CDA56FCDA570CD
        A975D9BD96CFA972D0AD79D0AC79D0AC79D0AC79D0AC79D0AC79CEA974CDA56C
        CBA36AD0AB77D0AD79D0AC79D0AC79D0AD79CCA46BD6B689D0AD7AD2B080CFAB
        75D0AD7ACEA86FDBC29DE9DFD1D2AF7AD2AE78D4B17ED4B17ED4B17ED4B17ED4
        B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED4B17ED2AE78
        D2AF79D3AF7BD4B17ED2AE78D3AF78ECE2D6F6F8FBE9E0D0D9C095D5B480D5B6
        84D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5B683D5
        B683D5B683D6B684D6B684D6B784D5B480DAC095EBE0D1F5F8FC}
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 428
    end
    object btnSetFocus: TBitBtn
      Left = 176
      Top = -50
      Width = 75
      Height = 25
      Caption = 'SetFocus'
      TabOrder = 0
    end
  end
end
