object dmFornecedores: TdmFornecedores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 740
  Width = 1010
  object qryFornecedores: TSQLQuery
    MaxBlobSize = 1
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
      '      FN.FORN_OBS,'
      '      FN.FORN_DTA_CADASTRO,'
      '      FN.FORN_USER_ID,'
      '      PR.GENE_DESCR CIDADE,'
      '      PR.GENE_PAR1 UF'
      'FROM  FORNECEDORES FN'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = FN.FORN_GENE_ID_PRACA)'
      'ORDER BY FN.FORN_NOME_FANTASIA')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 56
    object qryFornecedoresFORN_ID: TIntegerField
      FieldName = 'FORN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryFornecedoresFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 150
    end
    object qryFornecedoresFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 150
    end
    object qryFornecedoresFORN_CNPJ_CPF: TStringField
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 18
    end
    object qryFornecedoresFORN_IE: TStringField
      FieldName = 'FORN_IE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 30
    end
    object qryFornecedoresFORN_CEP: TStringField
      FieldName = 'FORN_CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryFornecedoresFORN_ENDERECO: TStringField
      FieldName = 'FORN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 150
    end
    object qryFornecedoresFORN_BAIRRO: TStringField
      FieldName = 'FORN_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryFornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresFORN_GENE_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresFORN_CONTATO: TStringField
      FieldName = 'FORN_CONTATO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryFornecedoresFORN_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object qryFornecedoresFORN_FAX: TStringField
      DisplayWidth = 14
      FieldName = 'FORN_FAX'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object qryFornecedoresFORN_SITE: TStringField
      FieldName = 'FORN_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryFornecedoresFORN_EMAIL: TStringField
      FieldName = 'FORN_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryFornecedoresFORN_ATIVO: TIntegerField
      FieldName = 'FORN_ATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresFORN_TIPO: TStringField
      FieldName = 'FORN_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFornecedoresFORN_DTA_CADASTRO: TDateField
      FieldName = 'FORN_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresFORN_USER_ID: TIntegerField
      FieldName = 'FORN_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryFornecedoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryFornecedoresFORN_OBS: TBlobField
      FieldName = 'FORN_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspFornecedores: TDataSetProvider
    DataSet = qryFornecedores
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 104
  end
  object cdsFornecedores: TClientDataSet
    Aggregates = <>
    PacketRecords = 500
    Params = <>
    ProviderName = 'dspFornecedores'
    BeforeDelete = cdsFornecedoresBeforeDelete
    OnNewRecord = cdsFornecedoresNewRecord
    OnReconcileError = cdsFornecedoresReconcileError
    Left = 88
    Top = 152
    object cdsFornecedoresFORN_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'FORN_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFornecedoresFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFornecedoresFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsFornecedoresFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsFornecedoresFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsFornecedoresFORN_IE: TStringField
      DisplayLabel = 'Insc. Estadual'
      FieldName = 'FORN_IE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsFornecedoresFORN_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'FORN_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsFornecedoresFORN_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'FORN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsFornecedoresFORN_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FORN_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsFornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsFornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsFornecedoresFORN_GENE_ID_PRACA: TIntegerField
      FieldName = 'FORN_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsFornecedoresFORN_CONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'FORN_CONTATO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsFornecedoresFORN_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'FORN_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsFornecedoresFORN_FAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 14
      FieldName = 'FORN_FAX'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsFornecedoresFORN_SITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'FORN_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsFornecedoresFORN_EMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'FORN_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsFornecedoresFORN_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'FORN_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsFornecedoresFORN_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'FORN_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFornecedoresFORN_USER_ID: TIntegerField
      FieldName = 'FORN_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsFornecedoresCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsFornecedoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsFornecedoresFORN_OBS: TBlobField
      FieldName = 'FORN_OBS'
      Visible = False
      Size = 1
    end
  end
  object dsFornecedores: TDataSource
    DataSet = cdsFornecedores
    Left = 88
    Top = 200
  end
  object qryPesq_Praca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 56
  end
  object dspPesq_Praca: TDataSetProvider
    DataSet = qryPesq_Praca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 104
  end
  object cdsPesq_Praca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Praca'
    Left = 192
    Top = 152
    object cdsPesq_PracaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesq_PracaGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesq_PracaGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object dsPesq_Praca: TDataSource
    DataSet = cdsPesq_Praca
    Left = 192
    Top = 200
  end
end
