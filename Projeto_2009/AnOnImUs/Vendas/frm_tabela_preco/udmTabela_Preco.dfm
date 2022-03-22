inherited dmTabelaPreco: TdmTabelaPreco
  OldCreateOrder = True
  Height = 657
  Width = 970
  object qryTabelaPreco: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      TPRC_ID,'
      '      TPRC_EMPR_ID,'
      '      TPRC_DESCRICAO,'
      '      TPRC_ATIVO,'
      '      TPRC_DTA_CADASTRO,'
      '      TPRC_USER_ID'
      'FROM  TABELA_PRECO'
      'WHERE TPRC_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 64
    object qryTabelaPrecoTPRC_ID: TIntegerField
      FieldName = 'TPRC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTabelaPrecoTPRC_EMPR_ID: TIntegerField
      FieldName = 'TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTabelaPrecoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryTabelaPrecoTPRC_ATIVO: TIntegerField
      FieldName = 'TPRC_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object qryTabelaPrecoTPRC_DTA_CADASTRO: TDateField
      FieldName = 'TPRC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryTabelaPrecoTPRC_USER_ID: TIntegerField
      FieldName = 'TPRC_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspTabelaPreco: TDataSetProvider
    DataSet = qryTabelaPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 112
  end
  object cdsTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspTabelaPreco'
    BeforeDelete = cdsTabelaPrecoBeforeDelete
    OnNewRecord = cdsTabelaPrecoNewRecord
    OnReconcileError = cdsTabelaPrecoReconcileError
    Left = 104
    Top = 160
    object cdsTabelaPrecoTPRC_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'TPRC_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaPrecoTPRC_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TPRC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelaPrecoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsTabelaPrecoTPRC_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'TPRC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaPrecoTPRC_EMPR_ID: TIntegerField
      FieldName = 'TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTabelaPrecoTPRC_USER_ID: TIntegerField
      FieldName = 'TPRC_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsTabelaPreco: TDataSource
    DataSet = cdsTabelaPreco
    OnDataChange = dsTabelaPrecoDataChange
    Left = 104
    Top = 208
  end
  object qryItensTabelaPreco: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TPRC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PI.TPIT_ID,'
      '      PI.TPIT_EMPR_ID,'
      '      PI.TPIT_TPRC_ID,'
      '      PI.TPIT_TPRC_EMPR_ID,'
      '      PI.TPIT_PROD_ID,'
      '      PI.TPIT_PROD_EMPR_ID,'
      '      PI.TPIT_DTA_VIGENCIA,'
      '      PI.TPIT_DTA_VALIDADE,'
      '      PI.TPIT_VLR_GONDOLA,'
      '      PI.TPIT_VLR_MINIMO,'
      '      PI.TPIT_VLR_ESPECIAL,'
      '      PI.TPIT_VLR_ATACADO,'
      '      PI.TPIT_DTA_CADASTRO,'
      '      PI.TPIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  TABELA_PRECO_ITENS PI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = PI.TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = PI.TPIT_PROD_EMPR_ID)'
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
      'WHERE PI.TPIT_EMPR_ID      = :EMPR_ID'
      'AND   PI.TPIT_TPRC_ID      = :TPRC_ID'
      'AND   PI.TPIT_TPRC_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 216
    Top = 64
    object qryItensTabelaPrecoTPIT_ID: TIntegerField
      FieldName = 'TPIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_EMPR_ID: TIntegerField
      FieldName = 'TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_TPRC_ID: TIntegerField
      FieldName = 'TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_PROD_ID: TIntegerField
      FieldName = 'TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField
      FieldName = 'TPIT_DTA_VIGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField
      FieldName = 'TPIT_DTA_VALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField
      FieldName = 'TPIT_VLR_GONDOLA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField
      FieldName = 'TPIT_VLR_MINIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField
      FieldName = 'TPIT_VLR_ESPECIAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField
      FieldName = 'TPIT_VLR_ATACADO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField
      FieldName = 'TPIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTabelaPrecoTPIT_USER_ID: TIntegerField
      FieldName = 'TPIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTabelaPrecoPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryItensTabelaPrecoPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryItensTabelaPrecoGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensTabelaPrecoMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensTabelaPrecoMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspItensTabelaPreco: TDataSetProvider
    DataSet = qryItensTabelaPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 216
    Top = 112
  end
  object cdsItensTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TPRC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensTabelaPreco'
    BeforeDelete = cdsItensTabelaPrecoBeforeDelete
    OnNewRecord = cdsItensTabelaPrecoNewRecord
    OnReconcileError = cdsItensTabelaPrecoReconcileError
    Left = 216
    Top = 160
    object cdsItensTabelaPrecoTPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 7
      FieldName = 'TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItensTabelaPrecoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 30
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsItensTabelaPrecoPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField
      DisplayLabel = 'Vlr. G'#244'ndola'
      DisplayWidth = 10
      FieldName = 'TPIT_VLR_GONDOLA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField
      DisplayLabel = 'Vlr. M'#237'nimo'
      DisplayWidth = 10
      FieldName = 'TPIT_VLR_MINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField
      DisplayLabel = 'Vlr. Especial'
      DisplayWidth = 10
      FieldName = 'TPIT_VLR_ESPECIAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField
      DisplayLabel = 'Vlr. Atacado'
      DisplayWidth = 10
      FieldName = 'TPIT_VLR_ATACADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField
      DisplayLabel = 'Dt. Vig'#234'ncia'
      FieldName = 'TPIT_DTA_VIGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField
      DisplayLabel = 'Dt. Validade'
      FieldName = 'TPIT_DTA_VALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensTabelaPrecoGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensTabelaPrecoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensTabelaPrecoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensTabelaPrecoTPIT_ID: TIntegerField
      FieldName = 'TPIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_EMPR_ID: TIntegerField
      FieldName = 'TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_TPRC_ID: TIntegerField
      FieldName = 'TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField
      FieldName = 'TPIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTabelaPrecoTPIT_USER_ID: TIntegerField
      FieldName = 'TPIT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsItensTabelaPreco: TDataSource
    DataSet = cdsItensTabelaPreco
    Left = 216
    Top = 208
  end
  object qryPesqProd: TSQLQuery
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
      'WHERE PR.PROD_EMPR_ID = :EMPR_ID'
      'AND   PR.PROD_GENE_ID_TP_PROD IN (1,2)'
      'AND   PR.PROD_ATIVO   = 1'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 344
    Top = 64
  end
  object dspPesqProd: TDataSetProvider
    DataSet = qryPesqProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 112
  end
  object cdsPesqProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProd'
    Left = 344
    Top = 160
    object cdsPesqProdPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PROD_ID'
    end
    object cdsPesqProdPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqProdPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqProdGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsPesqProdMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqProdMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsPesqProdCOD_FORNEC1: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC1'
    end
    object cdsPesqProdCOD_FORNEC2: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC2'
    end
    object cdsPesqProdCOD_FORNEC3: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC3'
    end
    object cdsPesqProdCOD_FORNEC4: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC4'
    end
  end
end
