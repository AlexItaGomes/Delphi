object dmEmpresas: TdmEmpresas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 795
  Width = 1051
  object qryEmpresas: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      #9'   EP.EMPR_ID,'
      #9'   EP.EMPR_NOME_FANTASIA,'
      #9'   EP.EMPR_RAZAO_SOCIAL,'
      #9'   EP.EMPR_ATIVO,'
      #9'   EP.EMPR_CNPJ,'
      #9'   EP.EMPR_IE,'
      #9'   EP.EMPR_CEP,'
      #9'   EP.EMPR_ENDERECO,'
      #9'   EP.EMPR_NR_ENDERECO,'
      #9'   EP.EMPR_BAIRRO,'
      #9'   EP.EMPR_COMPLEMENTO,'
      #9'   EP.EMPR_GENE_EMPR_ID_PRACA,'
      #9'   EP.EMPR_GENE_TGEN_ID_PRACA,'
      #9'   EP.EMPR_GENE_ID_PRACA,'
      #9'   EP.EMPR_TELEFONE,'
      #9'   EP.EMPR_FAX,'
      #9'   EP.EMPR_SITE,'
      #9'   EP.EMPR_EMAIL,'
      #9'   EP.EMPR_LOGOTIPO,'
      #9'   EP.EMPR_INSC_MUNICIPAL,'
      #9'   EP.EMPR_DTA_CADASTRO,'
      #9'   EP.EMPR_USER_ID,'
      '       PR.GENE_DESCR CIDADE,'
      '       PR.GENE_PAR1  UF'
      '  FROM EMPRESAS EP'
      ' INNER JOIN GENERICA PR'
      '    ON (EP.EMPR_GENE_EMPR_ID_PRACA = PR.GENE_EMPR_ID'
      '   AND EP.EMPR_GENE_TGEN_ID_PRACA = PR.GENE_TGEN_ID'
      '   AND EP.EMPR_GENE_ID_PRACA      = PR.GENE_ID)'
      ' ORDER BY EP.EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 112
    Top = 88
    object qryEmpresasEMPR_ATIVO: TIntegerField
      FieldName = 'EMPR_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEmpresasEMPR_ID: TIntegerField
      FieldName = 'EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEmpresasEMPR_RAZAO_SOCIAL: TStringField
      FieldName = 'EMPR_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryEmpresasEMPR_NOME_FANTASIA: TStringField
      FieldName = 'EMPR_NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryEmpresasEMPR_DTA_CADASTRO: TDateField
      FieldName = 'EMPR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEmpresasEMPR_CNPJ: TStringField
      FieldName = 'EMPR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 18
    end
    object qryEmpresasEMPR_IE: TStringField
      FieldName = 'EMPR_IE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 30
    end
    object qryEmpresasEMPR_CEP: TStringField
      FieldName = 'EMPR_CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryEmpresasEMPR_ENDERECO: TStringField
      FieldName = 'EMPR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 150
    end
    object qryEmpresasEMPR_NR_ENDERECO: TIntegerField
      FieldName = 'EMPR_NR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEmpresasEMPR_BAIRRO: TStringField
      FieldName = 'EMPR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryEmpresasCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryEmpresasUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryEmpresasEMPR_COMPLEMENTO: TStringField
      FieldName = 'EMPR_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryEmpresasEMPR_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'EMPR_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEmpresasEMPR_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'EMPR_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEmpresasEMPR_GENE_ID_PRACA: TIntegerField
      FieldName = 'EMPR_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEmpresasEMPR_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'EMPR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object qryEmpresasEMPR_FAX: TStringField
      DisplayWidth = 14
      FieldName = 'EMPR_FAX'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object qryEmpresasEMPR_SITE: TStringField
      FieldName = 'EMPR_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryEmpresasEMPR_EMAIL: TStringField
      FieldName = 'EMPR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryEmpresasEMPR_LOGOTIPO: TBlobField
      FieldName = 'EMPR_LOGOTIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object qryEmpresasEMPR_USER_ID: TIntegerField
      FieldName = 'EMPR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryEmpresasEMPR_INSC_MUNICIPAL: TStringField
      FieldName = 'EMPR_INSC_MUNICIPAL'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspEmpresas: TDataSetProvider
    DataSet = qryEmpresas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 136
  end
  object dsEmpresas: TDataSource
    DataSet = cdsEmpresas
    Left = 112
    Top = 232
  end
  object cdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresas'
    BeforeDelete = cdsEmpresasBeforeDelete
    OnNewRecord = cdsEmpresasNewRecord
    OnReconcileError = cdsEmpresasReconcileError
    Left = 112
    Top = 184
    object cdsEmpresasEMPR_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'EMPR_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEmpresasEMPR_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Empr.'
      DisplayWidth = 15
      FieldName = 'EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsEmpresasEMPR_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 15
      FieldName = 'EMPR_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsEmpresasEMPR_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      DisplayWidth = 15
      FieldName = 'EMPR_NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsEmpresasEMPR_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'EMPR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEmpresasEMPR_CNPJ: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##.###.###/####-##'
      Size = 18
    end
    object cdsEmpresasEMPR_IE: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_IE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 30
    end
    object cdsEmpresasEMPR_CEP: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsEmpresasEMPR_ENDERECO: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 150
    end
    object cdsEmpresasEMPR_NR_ENDERECO: TIntegerField
      DisplayWidth = 15
      FieldName = 'EMPR_NR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEmpresasEMPR_BAIRRO: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsEmpresasCIDADE: TStringField
      DisplayWidth = 15
      FieldName = 'CIDADE'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsEmpresasUF: TStringField
      DisplayWidth = 15
      FieldName = 'UF'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsEmpresasEMPR_COMPLEMENTO: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsEmpresasEMPR_GENE_EMPR_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'EMPR_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEmpresasEMPR_GENE_TGEN_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'EMPR_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEmpresasEMPR_GENE_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'EMPR_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEmpresasEMPR_TELEFONE: TStringField
      DisplayWidth = 14
      FieldName = 'EMPR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '(##)##########'
      Size = 14
    end
    object cdsEmpresasEMPR_FAX: TStringField
      DisplayWidth = 14
      FieldName = 'EMPR_FAX'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '(##)##########'
      Size = 14
    end
    object cdsEmpresasEMPR_SITE: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsEmpresasEMPR_EMAIL: TStringField
      DisplayWidth = 15
      FieldName = 'EMPR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsEmpresasEMPR_LOGOTIPO: TBlobField
      DisplayWidth = 15
      FieldName = 'EMPR_LOGOTIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsEmpresasEMPR_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'EMPR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEmpresasEMPR_INSC_MUNICIPAL: TStringField
      DisplayLabel = 'Insc. Municipal'
      FieldName = 'EMPR_INSC_MUNICIPAL'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
end
