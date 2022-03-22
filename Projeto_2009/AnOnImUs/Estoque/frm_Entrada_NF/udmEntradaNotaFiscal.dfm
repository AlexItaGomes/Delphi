inherited dmEntradaNotaFiscal: TdmEntradaNotaFiscal
  OldCreateOrder = True
  Height = 734
  Width = 1004
  object qryEntradaNotaFiscal: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      NF.NFEN_ID,'
      '      NF.NFEN_EMPR_ID,'
      '      NF.NFEN_FORN_ID,'
      '      NF.NFEN_DTA_EMISSAO,'
      '      NF.NFEN_DTA_ENTRADA,'
      '      NF.NFEN_NR_NOTA,'
      '      NF.NFEN_NR_SERIE,'
      '      NF.NFEN_CHAVEACESSO_NFE,'
      '      NF.NFEN_BASE_CALC_ICMS,'
      '      NF.NFEN_VLR_ICMS,'
      '      NF.NFEN_BASE_CALC_ICMS_SUBST,'
      '      NF.NFEN_VLR_ICMS_SUBST,'
      '      NF.NFEN_VLR_TOTAL_PROD,'
      '      NF.NFEN_VLR_FRETE,'
      '      NF.NFEN_VLR_SEGURO,'
      '      NF.NFEN_VLR_TOTAL_DESC,'
      '      NF.NFEN_VLR_OUTRAS_DESPESAS,'
      '      NF.NFEN_VLR_IPI,'
      '      NF.NFEN_VLR_TOTAL_NOTA,'
      '      NF.NFEN_CONCILIADO,'
      '      NF.NFEN_DTA_CONCILIADO,'
      '      NF.NFEN_DTA_CANCELADO,'
      '      NF.NFEN_USER_ID_CANC,'
      '      NF.NFEN_MOTIVO_CANC,'
      '      NF.NFEN_MODELO_NF,'
      '      NF.NFEN_DTA_CADASTRO,'
      '      NF.NFEN_USER_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      FN.FORN_CNPJ_CPF,'
      '      FN.FORN_IE,'
      '      FN.FORN_ENDERECO,'
      '      FN.FORN_BAIRRO,'
      '      FN.FORN_CEP,'
      '      CD.GENE_DESCR,'
      '      CD.GENE_PAR1,'
      '      FN.FORN_TELEFONE,'
      '      US.USER_LOGIN USER_CANC'
      'FROM  NOTA_FISCAL NF'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = NF.NFEN_FORN_ID)'
      'INNER JOIN GENERICA CD'
      'ON (CD.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA'
      'AND CD.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA'
      'AND CD.GENE_ID      = FN.FORN_GENE_ID_PRACA)'
      'LEFT OUTER JOIN USUARIO US'
      'ON (US.USER_ID = NF.NFEN_USER_ID_CANC)'
      'WHERE NF.NFEN_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryEntradaNotaFiscalNFEN_ID: TIntegerField
      FieldName = 'NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_EMPR_ID: TIntegerField
      FieldName = 'NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_FORN_ID: TIntegerField
      FieldName = 'NFEN_FORN_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_DTA_EMISSAO: TDateField
      FieldName = 'NFEN_DTA_EMISSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_DTA_ENTRADA: TDateField
      FieldName = 'NFEN_DTA_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_NR_NOTA: TIntegerField
      FieldName = 'NFEN_NR_NOTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_NR_SERIE: TIntegerField
      FieldName = 'NFEN_NR_SERIE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_DESC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_NOTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_CONCILIADO: TIntegerField
      FieldName = 'NFEN_CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_DTA_CONCILIADO: TDateField
      FieldName = 'NFEN_DTA_CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_DTA_CANCELADO: TDateField
      FieldName = 'NFEN_DTA_CANCELADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_USER_ID_CANC: TIntegerField
      FieldName = 'NFEN_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_MOTIVO_CANC: TBlobField
      FieldName = 'NFEN_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object qryEntradaNotaFiscalNFEN_DTA_CADASTRO: TDateField
      FieldName = 'NFEN_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalNFEN_USER_ID: TIntegerField
      FieldName = 'NFEN_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEntradaNotaFiscalFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInWhere]
      Size = 150
    end
    object qryEntradaNotaFiscalUSER_CANC: TStringField
      FieldName = 'USER_CANC'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 8
    end
    object qryEntradaNotaFiscalNFEN_CHAVEACESSO_NFE: TStringField
      FieldName = 'NFEN_CHAVEACESSO_NFE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryEntradaNotaFiscalFORN_CNPJ_CPF: TStringField
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = []
      Required = True
      Size = 18
    end
    object qryEntradaNotaFiscalFORN_IE: TStringField
      FieldName = 'FORN_IE'
      ProviderFlags = []
      Size = 30
    end
    object qryEntradaNotaFiscalFORN_ENDERECO: TStringField
      FieldName = 'FORN_ENDERECO'
      ProviderFlags = []
      Required = True
      Size = 150
    end
    object qryEntradaNotaFiscalFORN_BAIRRO: TStringField
      FieldName = 'FORN_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object qryEntradaNotaFiscalFORN_CEP: TStringField
      FieldName = 'FORN_CEP'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryEntradaNotaFiscalGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Size = 250
    end
    object qryEntradaNotaFiscalGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Size = 250
    end
    object qryEntradaNotaFiscalFORN_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      ProviderFlags = []
      Required = True
      Size = 14
    end
    object qryEntradaNotaFiscalNFEN_BASE_CALC_ICMS: TFMTBCDField
      FieldName = 'NFEN_BASE_CALC_ICMS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_ICMS: TFMTBCDField
      FieldName = 'NFEN_VLR_ICMS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_BASE_CALC_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFEN_BASE_CALC_ICMS_SUBST'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFEN_VLR_ICMS_SUBST'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_FRETE: TFMTBCDField
      FieldName = 'NFEN_VLR_FRETE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_SEGURO: TFMTBCDField
      FieldName = 'NFEN_VLR_SEGURO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_OUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'NFEN_VLR_OUTRAS_DESPESAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_VLR_IPI: TFMTBCDField
      FieldName = 'NFEN_VLR_IPI'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryEntradaNotaFiscalNFEN_MODELO_NF: TIntegerField
      FieldName = 'NFEN_MODELO_NF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspEntradaNotaFiscal: TDataSetProvider
    DataSet = qryEntradaNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsEntradaNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntradaNotaFiscal'
    BeforeDelete = cdsEntradaNotaFiscalBeforeDelete
    OnNewRecord = cdsEntradaNotaFiscalNewRecord
    OnReconcileError = cdsEntradaNotaFiscalReconcileError
    Left = 72
    Top = 144
    object cdsEntradaNotaFiscalNFEN_CONCILIADO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'NFEN_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsEntradaNotaFiscalNFEN_FORN_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Fornec.'
      FieldName = 'NFEN_FORN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInWhere]
      Size = 150
    end
    object cdsEntradaNotaFiscalNFEN_NR_NOTA: TIntegerField
      DisplayLabel = 'Nr'#186' Nota'
      FieldName = 'NFEN_NR_NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_EMPR_ID: TIntegerField
      FieldName = 'NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEntradaNotaFiscalNFEN_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'NFEN_DTA_EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_DTA_ENTRADA: TDateField
      DisplayLabel = 'Dt. Entrada'
      FieldName = 'NFEN_DTA_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_NR_SERIE: TIntegerField
      DisplayLabel = 'Nr'#186' S'#233'rie'
      FieldName = 'NFEN_NR_SERIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField
      DisplayLabel = 'Vlr. Total Prod.'
      FieldName = 'NFEN_VLR_TOTAL_PROD'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField
      DisplayLabel = 'Vlr. Total Desc.'
      FieldName = 'NFEN_VLR_TOTAL_DESC'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField
      DisplayLabel = 'Vlr. Total Nota'
      FieldName = 'NFEN_VLR_TOTAL_NOTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_DTA_CONCILIADO: TDateField
      FieldName = 'NFEN_DTA_CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaNotaFiscalNFEN_DTA_CANCELADO: TDateField
      FieldName = 'NFEN_DTA_CANCELADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaNotaFiscalNFEN_USER_ID_CANC: TIntegerField
      FieldName = 'NFEN_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaNotaFiscalNFEN_MOTIVO_CANC: TBlobField
      FieldName = 'NFEN_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaNotaFiscalNFEN_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'NFEN_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaNotaFiscalNFEN_USER_ID: TIntegerField
      FieldName = 'NFEN_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaNotaFiscalUSER_CANC: TStringField
      FieldName = 'USER_CANC'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsEntradaNotaFiscalFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = []
      Required = True
      Size = 18
    end
    object cdsEntradaNotaFiscalFORN_IE: TStringField
      DisplayLabel = 'Insc. Estadual'
      FieldName = 'FORN_IE'
      ProviderFlags = []
      Size = 30
    end
    object cdsEntradaNotaFiscalFORN_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'FORN_ENDERECO'
      ProviderFlags = []
      Required = True
      Visible = False
      Size = 150
    end
    object cdsEntradaNotaFiscalFORN_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FORN_BAIRRO'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsEntradaNotaFiscalFORN_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'FORN_CEP'
      ProviderFlags = []
      Required = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsEntradaNotaFiscalGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsEntradaNotaFiscalGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsEntradaNotaFiscalFORN_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      ProviderFlags = []
      Required = True
      Visible = False
      Size = 14
    end
    object cdsEntradaNotaFiscalNFEN_BASE_CALC_ICMS: TFMTBCDField
      FieldName = 'NFEN_BASE_CALC_ICMS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_ICMS: TFMTBCDField
      FieldName = 'NFEN_VLR_ICMS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_BASE_CALC_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFEN_BASE_CALC_ICMS_SUBST'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_ICMS_SUBST: TFMTBCDField
      FieldName = 'NFEN_VLR_ICMS_SUBST'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_FRETE: TFMTBCDField
      FieldName = 'NFEN_VLR_FRETE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_SEGURO: TFMTBCDField
      FieldName = 'NFEN_VLR_SEGURO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_OUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'NFEN_VLR_OUTRAS_DESPESAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_VLR_IPI: TFMTBCDField
      FieldName = 'NFEN_VLR_IPI'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsEntradaNotaFiscalNFEN_CHAVEACESSO_NFE: TStringField
      DisplayLabel = 'Chave de Acesso (NF-e)'
      FieldName = 'NFEN_CHAVEACESSO_NFE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsEntradaNotaFiscalNFEN_MODELO_NF: TIntegerField
      FieldName = 'NFEN_MODELO_NF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsEntradaNotaFiscal: TDataSource
    DataSet = cdsEntradaNotaFiscal
    Left = 72
    Top = 192
  end
  object qryItensNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      NI.NFIT_ID,'
      '      NI.NFIT_EMPR_ID,'
      '      NI.NFIT_NFEN_ID,'
      '      NI.NFIT_NFEN_EMPR_ID,'
      '      NI.NFIT_PROD_ID,'
      '      NI.NFIT_PROD_EMPR_ID,'
      '      NI.NFIT_QTDE,'
      '      NI.NFIT_VLR_UNITARIO,'
      '      NI.NFIT_VLR_TOTAL_ITEM,'
      '      NI.NFIT_DTA_CADASTRO,'
      '      NI.NFIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  NOTA_FISCAL_ITENS NI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = NI.NFIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = NI.NFIT_PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE NI.NFIT_EMPR_ID      = :EMPR_ID'
      'AND   NI.NFIT_NFEN_ID      = :NFEN_ID'
      'AND   NI.NFIT_NFEN_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 200
    Top = 48
    object qryItensNotaFiscalNFIT_ID: TIntegerField
      FieldName = 'NFIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensNotaFiscalNFIT_EMPR_ID: TIntegerField
      FieldName = 'NFIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensNotaFiscalNFIT_NFEN_ID: TIntegerField
      FieldName = 'NFIT_NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFIT_NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensNotaFiscalNFIT_PROD_ID: TIntegerField
      FieldName = 'NFIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'NFIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensNotaFiscalNFIT_QTDE: TFMTBCDField
      FieldName = 'NFIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField
      FieldName = 'NFIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField
      FieldName = 'NFIT_VLR_TOTAL_ITEM'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensNotaFiscalNFIT_DTA_CADASTRO: TDateField
      FieldName = 'NFIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensNotaFiscalNFIT_USER_ID: TIntegerField
      FieldName = 'NFIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensNotaFiscalPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryItensNotaFiscalPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryItensNotaFiscalGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensNotaFiscalMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensNotaFiscalMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensNotaFiscalPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
  end
  object dspItensNotaFiscal: TDataSetProvider
    DataSet = qryItensNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 96
  end
  object cdsItensNotaFiscal: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensNotaFiscal'
    OnNewRecord = cdsItensNotaFiscalNewRecord
    OnReconcileError = cdsItensNotaFiscalReconcileError
    Left = 200
    Top = 144
    object cdsItensNotaFiscalNFIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 7
      FieldName = 'NFIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensNotaFiscalPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 35
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsItensNotaFiscalPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsItensNotaFiscalNFIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 9
      FieldName = 'NFIT_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 13
      FieldName = 'NFIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField
      DisplayLabel = 'Vlr.Total'
      DisplayWidth = 13
      FieldName = 'NFIT_VLR_TOTAL_ITEM'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 35
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensNotaFiscalMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 35
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensNotaFiscalMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 35
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensNotaFiscalNFIT_ID: TIntegerField
      FieldName = 'NFIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_EMPR_ID: TIntegerField
      FieldName = 'NFIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_NFEN_ID: TIntegerField
      FieldName = 'NFIT_NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFIT_NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'NFIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_DTA_CADASTRO: TDateField
      FieldName = 'NFIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensNotaFiscalNFIT_USER_ID: TIntegerField
      FieldName = 'NFIT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensNotaFiscalPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsItensNotaFiscalTOTAL_ITENS: TAggregateField
      FieldName = 'TOTAL_ITENS'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.0000'
      Expression = 'SUM(NFIT_VLR_TOTAL_ITEM)'
    end
  end
  object dsItensNotaFiscal: TDataSource
    DataSet = cdsItensNotaFiscal
    Left = 200
    Top = 192
  end
  object qryAcertosNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      AC.NFAC_ID,'
      '      AC.NFAC_EMPR_ID,'
      '      AC.NFAC_NFEN_ID,'
      '      AC.NFAC_NFEN_EMPR_ID,'
      '      AC.NFAC_DESCRICAO,'
      '      AC.NFAC_NR_DOCUMENTO,'
      '      AC.NFAC_GENE_EMPR_ID_TP_DOC,'
      '      AC.NFAC_GENE_TGEN_ID_TP_DOC,'
      '      AC.NFAC_GENE_ID_TP_DOC,'
      '      AC.NFAC_DTA_LANC,'
      '      AC.NFAC_DTA_VCTO,'
      '      AC.NFAC_VALOR_DOC,'
      '      AC.NFAC_VALOR_JUROS,'
      '      AC.NFAC_VALOR_MORA,'
      '      AC.NFAC_CONCILIADO,'
      '      AC.NFAC_DTA_CADASTRO,'
      '      AC.NFAC_USER_ID,'
      '      TP.GENE_DESCR TIPO_DOC'
      'FROM  NOTA_FISCAL_ACERTOS AC'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = AC.NFAC_GENE_EMPR_ID_TP_DOC'
      'AND TP.GENE_TGEN_ID = AC.NFAC_GENE_TGEN_ID_TP_DOC'
      'AND TP.GENE_ID      = AC.NFAC_GENE_ID_TP_DOC)'
      'WHERE AC.NFAC_EMPR_ID      = :EMPR_ID'
      'AND   AC.NFAC_NFEN_ID      = :NFEN_ID'
      'AND   AC.NFAC_NFEN_EMPR_ID = :EMPR_ID'
      'AND   AC.NFAC_CONCILIADO   = 0')
    SQLConnection = dmConexao.dbConexao
    Left = 320
    Top = 48
    object qryAcertosNotaFiscalNFAC_ID: TIntegerField
      FieldName = 'NFAC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField
      FieldName = 'NFAC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField
      FieldName = 'NFAC_NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFAC_NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosNotaFiscalNFAC_DESCRICAO: TStringField
      FieldName = 'NFAC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField
      FieldName = 'NFAC_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object qryAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_EMPR_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_TGEN_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_DTA_LANC: TDateField
      FieldName = 'NFAC_DTA_LANC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_DTA_VCTO: TDateField
      FieldName = 'NFAC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField
      FieldName = 'NFAC_VALOR_DOC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField
      FieldName = 'NFAC_VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField
      FieldName = 'NFAC_VALOR_MORA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField
      FieldName = 'NFAC_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField
      FieldName = 'NFAC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalNFAC_USER_ID: TIntegerField
      FieldName = 'NFAC_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertosNotaFiscalTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspAcertosNotaFiscal: TDataSetProvider
    DataSet = qryAcertosNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 96
  end
  object cdsAcertosNotaFiscal: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertosNotaFiscal'
    OnNewRecord = cdsAcertosNotaFiscalNewRecord
    OnReconcileError = cdsAcertosNotaFiscalReconcileError
    Left = 320
    Top = 144
    object cdsAcertosNotaFiscalNFAC_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 27
      FieldName = 'NFAC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAcertosNotaFiscalTIPO_DOC: TStringField
      DisplayLabel = 'Tipo Doc.'
      DisplayWidth = 20
      FieldName = 'TIPO_DOC'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsAcertosNotaFiscalNFAC_DTA_LANC: TDateField
      DisplayLabel = 'Dt. Lacto'
      DisplayWidth = 12
      FieldName = 'NFAC_DTA_LANC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAcertosNotaFiscalNFAC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vecto'
      DisplayWidth = 12
      FieldName = 'NFAC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      DisplayWidth = 13
      FieldName = 'NFAC_VALOR_DOC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      DisplayWidth = 20
      FieldName = 'NFAC_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField
      FieldName = 'NFAC_VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField
      FieldName = 'NFAC_VALOR_MORA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_ID: TIntegerField
      FieldName = 'NFAC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField
      FieldName = 'NFAC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField
      FieldName = 'NFAC_NFEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFAC_NFEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_EMPR_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_TGEN_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_ID_TP_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField
      FieldName = 'NFAC_CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField
      FieldName = 'NFAC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalNFAC_USER_ID: TIntegerField
      FieldName = 'NFAC_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosNotaFiscalTOTAL_TITULO: TAggregateField
      DisplayLabel = 'Total de T'#237'tulos'
      FieldName = 'TOTAL_TITULO'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.0000'
      Expression = 'SUM(NFAC_VALOR_DOC)'
    end
  end
  object dsAcertosNotaFiscal: TDataSource
    DataSet = cdsAcertosNotaFiscal
    Left = 320
    Top = 192
  end
  object qryPesqFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FORN_ID,'
      '      FORN_NOME_FANTASIA,'
      '      FORN_RAZAO_SOCIAL,'
      '      FORN_CNPJ_CPF,'
      '      FORN_IE,'
      '      FORN_CEP,'
      '      FORN_ENDERECO,'
      '      FORN_BAIRRO,'
      '      CD.GENE_DESCR,'
      '      CD.GENE_PAR1,'
      '      FORN_TELEFONE'
      'FROM  FORNECEDORES'
      'INNER JOIN GENERICA CD'
      'ON (CD.GENE_EMPR_ID = FORN_GENE_EMPR_ID_PRACA'
      'AND CD.GENE_TGEN_ID = FORN_GENE_TGEN_ID_PRACA'
      'AND CD.GENE_ID      = FORN_GENE_ID_PRACA)'
      'ORDER BY FORN_NOME_FANTASIA')
    SQLConnection = dmConexao.dbConexao
    Left = 432
    Top = 48
  end
  object dspPesqFornec: TDataSetProvider
    DataSet = qryPesqFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 432
    Top = 96
  end
  object cdsPesqFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqFornec'
    Left = 432
    Top = 144
    object cdsPesqFornecFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'FORN_ID'
    end
    object cdsPesqFornecFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      DisplayWidth = 15
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 15
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqFornecFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 15
      FieldName = 'FORN_CNPJ_CPF'
      Size = 18
    end
    object cdsPesqFornecFORN_IE: TStringField
      FieldName = 'FORN_IE'
      Visible = False
      Size = 30
    end
    object cdsPesqFornecFORN_CEP: TStringField
      FieldName = 'FORN_CEP'
      Required = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsPesqFornecFORN_ENDERECO: TStringField
      FieldName = 'FORN_ENDERECO'
      Required = True
      Visible = False
      Size = 150
    end
    object cdsPesqFornecFORN_BAIRRO: TStringField
      FieldName = 'FORN_BAIRRO'
      Visible = False
      Size = 100
    end
    object cdsPesqFornecGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Visible = False
      Size = 250
    end
    object cdsPesqFornecGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      Visible = False
      Size = 250
    end
    object cdsPesqFornecFORN_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      Required = True
      Visible = False
      Size = 14
    end
  end
  object qryPesqProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      COALESCE(PR.PROD_COD_FORN1,0) AS COD_FORNEC1,'
      '      COALESCE(PR.PROD_COD_FORN2,0) AS COD_FORNEC2,'
      '      COALESCE(PR.PROD_COD_FORN3,0) AS COD_FORNEC3,'
      '      COALESCE(PR.PROD_COD_FORN4,0) AS COD_FORNEC4'
      'FROM  PRODUTOS PR'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PR.PROD_EMPR_ID          = :EMPR_ID'
      'AND   PR.PROD_GENE_ID_TP_PROD <> 2'
      'AND   PR.PROD_ATIVO = 1'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 528
    Top = 48
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = qryPesqProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 96
  end
  object cdsPesqProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProdutos'
    Left = 528
    Top = 144
    object cdsPesqProdutosPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PROD_ID'
    end
    object cdsPesqProdutosPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqProdutosPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqProdutosGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsPesqProdutosMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqProdutosMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsPesqProdutosPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      Visible = False
    end
    object cdsPesqProdutosCOD_FORNEC1: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC1'
    end
    object cdsPesqProdutosCOD_FORNEC2: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC2'
    end
    object cdsPesqProdutosCOD_FORNEC3: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC3'
    end
    object cdsPesqProdutosCOD_FORNEC4: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC4'
    end
  end
  object qryPesqDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 5'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 632
    Top = 48
  end
  object dspPesqDoc: TDataSetProvider
    DataSet = qryPesqDoc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 632
    Top = 96
  end
  object cdsPesqDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqDoc'
    Left = 632
    Top = 144
    object cdsPesqDocGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
    end
    object cdsPesqDocGENE_DESCR: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
end
