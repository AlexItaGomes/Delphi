object dmRel_Fornecedores: TdmRel_Fornecedores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 774
  Width = 1051
  object qryRel_Fornecedores: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FN.FORN_ID,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      FN.FORN_NOME_FANTASIA,'
      '      FN.FORN_CNPJ_CPF,'
      '      FN.FORN_IE,'
      '      FN.FORN_CEP,'
      '      FN.FORN_ENDERECO,'
      '      FN.FORN_BAIRRO,'
      '      FN.FORN_GENE_EMPR_ID_PRACA,'
      '      FN.FORN_GENE_TGEN_ID_PRACA,'
      '      FN.FORN_GENE_ID_PRACA,'
      '      FN.FORN_CONTATO,'
      '      FN.FORN_TELEFONE,'
      '      FN.FORN_FAX,'
      '      FN.FORN_SITE,'
      '      FN.FORN_EMAIL,'
      '      FN.FORN_ATIVO,'
      '      FN.FORN_TIPO,'
      '      FN.FORN_DTA_CADASTRO,'
      '      FN.FORN_USER_ID,'
      '      CASE FN.FORN_ATIVO'
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '           WHEN 1 THEN '#39'Sim'#39
      '      END AS ATIVO,'
      '      PR.GENE_DESCR CIDADE,'
      '      PR.GENE_PAR1 UF'
      'FROM  FORNECEDORES FN'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = FN.FORN_GENE_ID_PRACA)')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 56
  end
  object dspRel_Fornecedores: TDataSetProvider
    DataSet = qryRel_Fornecedores
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 104
  end
  object cdsRel_Fornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Fornecedores'
    Left = 96
    Top = 152
    object cdsRel_FornecedoresFORN_ID: TIntegerField
      FieldName = 'FORN_ID'
    end
    object cdsRel_FornecedoresFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsRel_FornecedoresFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsRel_FornecedoresFORN_CNPJ_CPF: TStringField
      FieldName = 'FORN_CNPJ_CPF'
      Size = 18
    end
    object cdsRel_FornecedoresFORN_IE: TStringField
      FieldName = 'FORN_IE'
      Size = 30
    end
    object cdsRel_FornecedoresFORN_CEP: TStringField
      FieldName = 'FORN_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsRel_FornecedoresFORN_ENDERECO: TStringField
      FieldName = 'FORN_ENDERECO'
      Size = 150
    end
    object cdsRel_FornecedoresFORN_BAIRRO: TStringField
      FieldName = 'FORN_BAIRRO'
      Size = 100
    end
    object cdsRel_FornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_EMPR_ID_PRACA'
    end
    object cdsRel_FornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_TGEN_ID_PRACA'
    end
    object cdsRel_FornecedoresFORN_GENE_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_ID_PRACA'
    end
    object cdsRel_FornecedoresFORN_CONTATO: TStringField
      FieldName = 'FORN_CONTATO'
      Size = 100
    end
    object cdsRel_FornecedoresFORN_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      Size = 14
    end
    object cdsRel_FornecedoresFORN_FAX: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_FAX'
      Size = 14
    end
    object cdsRel_FornecedoresFORN_SITE: TStringField
      FieldName = 'FORN_SITE'
      Size = 100
    end
    object cdsRel_FornecedoresFORN_EMAIL: TStringField
      FieldName = 'FORN_EMAIL'
      Size = 100
    end
    object cdsRel_FornecedoresFORN_ATIVO: TIntegerField
      FieldName = 'FORN_ATIVO'
    end
    object cdsRel_FornecedoresFORN_TIPO: TStringField
      FieldName = 'FORN_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsRel_FornecedoresFORN_DTA_CADASTRO: TDateField
      FieldName = 'FORN_DTA_CADASTRO'
    end
    object cdsRel_FornecedoresFORN_USER_ID: TIntegerField
      FieldName = 'FORN_USER_ID'
    end
    object cdsRel_FornecedoresATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 3
    end
    object CIDA: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsRel_FornecedoresUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
  end
  object dsRel_Fornecedores: TDataSource
    DataSet = cdsRel_Fornecedores
    Left = 96
    Top = 200
  end
end
