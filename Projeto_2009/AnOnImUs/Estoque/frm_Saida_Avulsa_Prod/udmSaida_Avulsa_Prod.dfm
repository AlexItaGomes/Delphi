inherited dmSaida_Avulsa_Prod: TdmSaida_Avulsa_Prod
  OldCreateOrder = True
  object qrySaidaAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '     SAAV_ID,'
      '     SAAV_EMPR_ID,'
      '     SAAV_NR_DOCUMENTO,'
      '     SAAV_CONCILIADO,'
      '     SAAV_OBS,'
      '     SAAV_DTA_CADASTRO,'
      '     SAAV_USER_ID'
      'FROM SAIDA_AVULSA'
      'WHERE SAAV_EMPR_ID = :EMPR_ID'
      'ORDER BY SAAV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 40
    object qrySaidaAvulsaSAAV_ID: TIntegerField
      FieldName = 'SAAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySaidaAvulsaSAAV_EMPR_ID: TIntegerField
      FieldName = 'SAAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySaidaAvulsaSAAV_NR_DOCUMENTO: TStringField
      FieldName = 'SAAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object qrySaidaAvulsaSAAV_CONCILIADO: TIntegerField
      FieldName = 'SAAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvulsaSAAV_OBS: TBlobField
      FieldName = 'SAAV_OBS'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvulsaSAAV_DTA_CADASTRO: TDateField
      FieldName = 'SAAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvulsaSAAV_USER_ID: TIntegerField
      FieldName = 'SAAV_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsSaidaAvulsa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspSaidaAvulsa'
    BeforeDelete = cdsSaidaAvulsaBeforeDelete
    OnNewRecord = cdsSaidaAvulsaNewRecord
    OnReconcileError = cdsSaidaAvulsaReconcileError
    Left = 96
    Top = 136
    object cdsSaidaAvulsaSAAV_CONCILIADO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'SAAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaidaAvulsaSAAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'SAAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSaidaAvulsaSAAV_EMPR_ID: TIntegerField
      FieldName = 'SAAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsSaidaAvulsaSAAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'SAAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsSaidaAvulsaSAAV_OBS: TBlobField
      FieldName = 'SAAV_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsSaidaAvulsaSAAV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'SAAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaidaAvulsaSAAV_USER_ID: TIntegerField
      FieldName = 'SAAV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspSaidaAvulsa: TDataSetProvider
    DataSet = qrySaidaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 88
  end
  object dsSaidaAvulsa: TDataSource
    DataSet = cdsSaidaAvulsa
    Left = 96
    Top = 184
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
      'AND   PR.PROD_FLG_ESTOQUE = 1'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 360
    Top = 40
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = qryPesqProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 88
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
    Left = 360
    Top = 136
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
  object qryItensSaidasAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SAAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      EI.SAIT_ID,'
      '      EI.SAIT_EMPR_ID,'
      '      EI.SAIT_SAAV_ID,'
      '      EI.SAIT_SAAV_EMPR_ID,'
      '      EI.SAIT_PROD_ID,'
      '      EI.SAIT_PROD_EMPR_ID,'
      '      EI.SAIT_QTDE,'
      '      EI.SAIT_DTA_CADASTRO,'
      '      EI.SAIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  SAIDA_AVULSA_ITENS EI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = EI.SAIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = EI.SAIT_PROD_EMPR_ID)'
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
      'WHERE EI.SAIT_EMPR_ID      = :EMPR_ID'
      'AND   EI.SAIT_SAAV_ID      = :SAAV_ID'
      'AND   EI.SAIT_SAAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 224
    Top = 40
    object qryItensSaidasAvulsaSAIT_ID: TIntegerField
      FieldName = 'SAIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidasAvulsaSAIT_EMPR_ID: TIntegerField
      FieldName = 'SAIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidasAvulsaSAIT_SAAV_ID: TIntegerField
      FieldName = 'SAIT_SAAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidasAvulsaSAIT_SAAV_EMPR_ID: TIntegerField
      FieldName = 'SAIT_SAAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidasAvulsaSAIT_PROD_ID: TIntegerField
      FieldName = 'SAIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidasAvulsaSAIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SAIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidasAvulsaSAIT_QTDE: TFMTBCDField
      FieldName = 'SAIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensSaidasAvulsaSAIT_DTA_CADASTRO: TDateField
      FieldName = 'SAIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidasAvulsaSAIT_USER_ID: TIntegerField
      FieldName = 'SAIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidasAvulsaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryItensSaidasAvulsaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryItensSaidasAvulsaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
    end
    object qryItensSaidasAvulsaGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensSaidasAvulsaMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensSaidasAvulsaMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspItensSaidasAvulsa: TDataSetProvider
    DataSet = qryItensSaidasAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 88
  end
  object cdsItensSaidasAvulsa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SAAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensSaidasAvulsa'
    OnNewRecord = cdsItensSaidasAvulsaNewRecord
    OnReconcileError = cdsItensSaidasAvulsaReconcileError
    Left = 224
    Top = 136
    object cdsItensSaidasAvulsaSAIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'SAIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensSaidasAvulsaPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 55
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsItensSaidasAvulsaPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsItensSaidasAvulsaSAIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 12
      FieldName = 'SAIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object cdsItensSaidasAvulsaGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 25
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidasAvulsaMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 25
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidasAvulsaMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 25
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidasAvulsaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsItensSaidasAvulsaSAIT_ID: TIntegerField
      FieldName = 'SAIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItensSaidasAvulsaSAIT_EMPR_ID: TIntegerField
      FieldName = 'SAIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItensSaidasAvulsaSAIT_SAAV_ID: TIntegerField
      FieldName = 'SAIT_SAAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItensSaidasAvulsaSAIT_SAAV_EMPR_ID: TIntegerField
      FieldName = 'SAIT_SAAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItensSaidasAvulsaSAIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SAIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensSaidasAvulsaSAIT_DTA_CADASTRO: TDateField
      FieldName = 'SAIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensSaidasAvulsaSAIT_USER_ID: TIntegerField
      FieldName = 'SAIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsItensSaidasAvulsa: TDataSource
    DataSet = cdsItensSaidasAvulsa
    Left = 224
    Top = 184
  end
end
