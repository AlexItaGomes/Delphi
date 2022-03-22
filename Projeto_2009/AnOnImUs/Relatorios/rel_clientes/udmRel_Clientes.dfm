object dmRel_Clientes: TdmRel_Clientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 779
  Width = 1022
  object qryRel_Clientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_EMPR_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_GENE_EMPR_ID_PRACA,'
      '      CL.CLIE_GENE_TGEN_ID_PRACA,'
      '      CL.CLIE_GENE_ID_PRACA,'
      '      CL.CLIE_RG,'
      '      CL.CLIE_TIPO,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_SITE,'
      '      CL.CLIE_EMAIL,'
      '      CL.CLIE_ATIVO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_DTA_CADASTRO,'
      '      CL.CLIE_USER_ID,'
      '      CASE CL.CLIE_ATIVO'
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '           WHEN 1 THEN '#39'Sim'#39
      '      END AS ATIVO,'
      '      PR.GENE_DESCR,'
      '      PR.GENE_PAR1'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = CL.CLIE_GENE_ID_PRACA)'
      'WHERE 1 = 0')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 56
  end
  object dspRel_Clientes: TDataSetProvider
    DataSet = qryRel_Clientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 104
  end
  object cdsRel_Clientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Clientes'
    Left = 104
    Top = 152
    object cdsRel_ClientesCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
    end
    object cdsRel_ClientesCLIE_EMPR_ID: TIntegerField
      FieldName = 'CLIE_EMPR_ID'
    end
    object cdsRel_ClientesCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsRel_ClientesCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsRel_ClientesCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsRel_ClientesCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      Size = 150
    end
    object cdsRel_ClientesCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      Size = 100
    end
    object cdsRel_ClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_PRACA'
    end
    object cdsRel_ClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_PRACA'
    end
    object cdsRel_ClientesCLIE_GENE_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_ID_PRACA'
    end
    object cdsRel_ClientesCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
    end
    object cdsRel_ClientesCLIE_TIPO: TStringField
      FieldName = 'CLIE_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsRel_ClientesCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsRel_ClientesCLIE_SITE: TStringField
      FieldName = 'CLIE_SITE'
      Size = 100
    end
    object cdsRel_ClientesCLIE_EMAIL: TStringField
      FieldName = 'CLIE_EMAIL'
      Size = 100
    end
    object cdsRel_ClientesCLIE_ATIVO: TIntegerField
      FieldName = 'CLIE_ATIVO'
    end
    object cdsRel_ClientesCLIE_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      Size = 14
    end
    object cdsRel_ClientesCLIE_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsRel_ClientesCLIE_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      Size = 14
    end
    object cdsRel_ClientesCLIE_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      Size = 14
    end
    object cdsRel_ClientesCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
    end
    object cdsRel_ClientesCLIE_USER_ID: TIntegerField
      FieldName = 'CLIE_USER_ID'
    end
    object cdsRel_ClientesGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsRel_ClientesGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsRel_ClientesATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 3
    end
  end
  object dsRel_Clientes: TDataSource
    DataSet = cdsRel_Clientes
    Left = 104
    Top = 200
  end
end
