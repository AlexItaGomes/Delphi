inherited fRel_Entrada_Nota_Fiscal: TfRel_Entrada_Nota_Fiscal
  Caption = 'fRel_Entrada_Nota_Fiscal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelInferior: TPanel
    inherited lbCadNovo: TLabel
      Left = 1100
      ExplicitLeft = 1100
    end
    inherited lbCadEditar: TLabel
      Left = 1100
      ExplicitLeft = 1100
    end
    inherited lbCadExcluir: TLabel
      Left = 1100
      ExplicitLeft = 1100
    end
    inherited lbCadLocalizar: TLabel
      Left = 1191
      ExplicitLeft = 1191
    end
    inherited lbCadImprimir: TLabel
      Left = 1191
      ExplicitLeft = 1191
    end
    inherited lbCadSair: TLabel
      Left = 1191
      ExplicitLeft = 1191
    end
    inherited btnNovo: TSpeedButton
      Visible = False
    end
    inherited btnEditar: TSpeedButton
      Visible = False
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
    inherited btnImprimir: TSpeedButton
      Anchors = [akRight]
      Enabled = True
      Visible = True
      ExplicitLeft = 647
      ExplicitTop = 4
    end
    inherited btnLocalizar: TSpeedButton
      Visible = False
    end
  end
  inherited panelSuperior: TPanel
    inherited Label1: TLabel
      Width = 165
      Caption = 'Rel. Entrada Nota Fiscal'
      ExplicitWidth = 165
    end
  end
  inherited gropGridPrincipal: TGroupBox
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1040
      Height = 411
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object GroupBox6: TGroupBox
        Left = 5
        Top = 181
        Width = 216
        Height = 45
        Caption = 'Dt. Cadastro'
        TabOrder = 0
        object edtDtInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 232
        Width = 216
        Height = 45
        Caption = 'Dt. Entrada '
        TabOrder = 1
        object edtDtEntInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtEntFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 5
        Top = 283
        Width = 216
        Height = 45
        Caption = 'Dt. Emiss'#227'o'
        TabOrder = 2
        object edtDtEmiInicio: TDateEdit
          Left = 6
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtDtEmiFim: TDateEdit
          Left = 111
          Top = 16
          Width = 100
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object rdStatus: TRadioGroup
        Left = 5
        Top = 334
        Width = 216
        Height = 96
        Caption = 'Status'
        Columns = 2
        ItemIndex = 3
        Items.Strings = (
          'Abertos'
          'Conciliados'
          'Cancelados'
          'Todos')
        TabOrder = 3
      end
      object rdOrdena: TRadioGroup
        Left = 227
        Top = 181
        Width = 456
        Height = 147
        Caption = 'Ordena'#231#227'o'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Nr'#186' Reg.'
          'Nr'#186' Nota'
          'Nr'#186' S'#233'rie'
          'Dt. Emiss'#227'o'
          'Dt. Entrada'
          'Dt. Cadastro'
          'C'#243'd. Fornec.'
          'Fornecedor'
          'Vlr. Total Prod.'
          'Vlr. Total Prod. Desc.'
          'Vlr. Total Descto'
          'Vlr. Total Descto. Desc.'
          'Vlr. Total Nota'
          'Vlr. Total Nota Desc.')
        TabOrder = 4
      end
      object rdOpcao_Impressao: TRadioGroup
        Left = 227
        Top = 385
        Width = 216
        Height = 45
        Caption = 'Op'#231#227'o de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Visualizar'
          'Imprimir')
        TabOrder = 6
      end
      object rdTipo_Impressao: TRadioGroup
        Left = 227
        Top = 334
        Width = 216
        Height = 45
        Caption = 'Tipo de Impress'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sint'#233'tico'
          'Anal'#237'tico')
        TabOrder = 5
      end
      inline frPesqFornec: TfrPesquisa
        Left = 5
        Top = 5
        Width = 430
        Height = 171
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 430
        ExplicitHeight = 171
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 171
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 171
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 55
            Caption = 'Fornecedor'
            ExplicitTop = 14
            ExplicitWidth = 55
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 139
            Width = 377
            Height = 30
            ExplicitTop = 139
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 54
            Width = 377
            Height = 85
            ExplicitTop = 54
            ExplicitWidth = 377
            ExplicitHeight = 85
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 171
          ItemIndex = 1
          ExplicitWidth = 49
          ExplicitHeight = 171
        end
      end
      inline frPesqNotaFiscal: TfrPesquisa
        Left = 440
        Top = 5
        Width = 430
        Height = 171
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        ExplicitLeft = 440
        ExplicitTop = 5
        ExplicitWidth = 430
        ExplicitHeight = 171
        inherited GroupBox1: TGroupBox
          Left = 49
          Width = 381
          Height = 171
          ExplicitLeft = 49
          ExplicitWidth = 381
          ExplicitHeight = 171
          inherited Label1: TLabel
            Top = 14
            ExplicitTop = 14
          end
          inherited Label2: TLabel
            Top = 14
            Width = 52
            Caption = 'Nota Fiscal'
            ExplicitTop = 14
            ExplicitWidth = 52
          end
          inherited btnPesq: TSpeedButton
            Top = 28
            ExplicitTop = 28
          end
          inherited rdContenha: TRadioGroup
            Top = 139
            Width = 377
            Height = 30
            ExplicitTop = 139
            ExplicitWidth = 377
            ExplicitHeight = 30
          end
          inherited edtCodigo: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited edtDescricao: TEdit
            Top = 29
            ExplicitTop = 29
          end
          inherited lbRegistros: TListBox
            Top = 54
            Width = 377
            Height = 85
            ExplicitTop = 54
            ExplicitWidth = 377
            ExplicitHeight = 85
          end
          inherited btnAdicionar: TBitBtn
            Top = 28
            ExplicitTop = 28
          end
          inherited rdMovimento: TRadioGroup
            Left = 6
            Top = 66
            ExplicitLeft = 6
            ExplicitTop = 66
          end
        end
        inherited rdOpcoes: TRadioGroup
          Width = 49
          Height = 171
          ItemIndex = 17
          ExplicitWidth = 49
          ExplicitHeight = 171
        end
      end
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
            'www.arsistemaseconsultoria.com.br')
        end
        inherited SysMemo1: TfrxSysMemoView
          Left = 578.268090000000000000
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
        end
      end
      inherited ReportTitle1: TfrxReportTitle
        inherited imgLogo: TfrxPictureView
          Top = 3.779527560000000000
        end
        inherited lblFantasia: TfrxMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            'Empresa:')
        end
        inherited SysMemo2: TfrxSysMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        inherited SysMemo3: TfrxSysMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            '[TIME]')
        end
        inherited Memo3: TfrxMemoView
          Top = 3.779527560000000000
          Memo.UTF8W = (
            'Data/Hora: ')
        end
        inherited Memo4: TfrxMemoView
          Top = 18.787401570000000000
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
          Top = 18.787401570000000000
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
          Top = 18.787401570000000000
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
        inherited Line3: TfrxLineView
          Top = 109.606370000000000000
        end
        inherited lblTelefone: TfrxMemoView
          Memo.UTF8W = (
            'Empresa:')
        end
      end
    end
  end
end
