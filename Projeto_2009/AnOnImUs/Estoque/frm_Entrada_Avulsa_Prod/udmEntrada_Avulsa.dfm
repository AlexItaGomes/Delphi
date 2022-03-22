inherited dmEntradaAvulsa: TdmEntradaAvulsa
  OldCreateOrder = True
  object qryEntradaAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '     ENAV_ID,'
      '     ENAV_EMPR_ID,'
      '     ENAV_NR_DOCUMENTO,'
      '     ENAV_CONCILIADO,'
      '     ENAV_OBS,'
      '     ENAV_DTA_CADASTRO,'
      '     ENAV_USER_ID'
      'FROM ENTRADA_AVULSA'
      'WHERE ENAV_EMPR_ID = :EMPR_ID'
      'ORDER BY ENAV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 40
    object qryEntradaAvulsaENAV_ID: TIntegerField
      FieldName = 'ENAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryEntradaAvulsaENAV_EMPR_ID: TIntegerField
      FieldName = 'ENAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryEntradaAvulsaENAV_NR_DOCUMENTO: TStringField
      FieldName = 'ENAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object qryEntradaAvulsaENAV_CONCILIADO: TIntegerField
      FieldName = 'ENAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEntradaAvulsaENAV_OBS: TBlobField
      FieldName = 'ENAV_OBS'
      ProviderFlags = [pfInUpdate]
    end
    object qryEntradaAvulsaENAV_DTA_CADASTRO: TDateField
      FieldName = 'ENAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEntradaAvulsaENAV_USER_ID: TIntegerField
      FieldName = 'ENAV_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsEntradaAvulsa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntradaAvulsa'
    BeforeDelete = cdsEntradaAvulsaBeforeDelete
    OnNewRecord = cdsEntradaAvulsaNewRecord
    OnReconcileError = cdsEntradaAvulsaReconcileError
    Left = 96
    Top = 136
    object cdsEntradaAvulsaENAV_CONCILIADO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'ENAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaAvulsaENAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'ENAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsEntradaAvulsaENAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'ENAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsEntradaAvulsaENAV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'ENAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaAvulsaENAV_EMPR_ID: TIntegerField
      FieldName = 'ENAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEntradaAvulsaENAV_OBS: TBlobField
      FieldName = 'ENAV_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEntradaAvulsaENAV_USER_ID: TIntegerField
      FieldName = 'ENAV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspEntradaAvulsa: TDataSetProvider
    DataSet = qryEntradaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 88
  end
  object dsEntradaAvulsa: TDataSource
    DataSet = cdsEntradaAvulsa
    Left = 96
    Top = 184
  end
  object qryItensEntradaAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      EI.ENIT_ID,'
      '      EI.ENIT_EMPR_ID,'
      '      EI.ENIT_ENAV_ID,'
      '      EI.ENIT_ENAV_EMPR_ID,'
      '      EI.ENIT_PROD_ID,'
      '      EI.ENIT_PROD_EMPR_ID,'
      '      EI.ENIT_QTDE,'
      '      EI.ENIT_DTA_CADASTRO,'
      '      EI.ENIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  ENTRADA_AVULSA_ITENS EI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = EI.ENIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = EI.ENIT_PROD_EMPR_ID)'
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
      'WHERE EI.ENIT_EMPR_ID      = :EMPR_ID'
      'AND   EI.ENIT_ENAV_ID      = :ENAV_ID'
      'AND   EI.ENIT_ENAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 224
    Top = 40
    object qryItensEntradaAvulsaENIT_ID: TIntegerField
      FieldName = 'ENIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEntradaAvulsaENIT_EMPR_ID: TIntegerField
      FieldName = 'ENIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEntradaAvulsaENIT_ENAV_ID: TIntegerField
      FieldName = 'ENIT_ENAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField
      FieldName = 'ENIT_ENAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEntradaAvulsaENIT_PROD_ID: TIntegerField
      FieldName = 'ENIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'ENIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEntradaAvulsaENIT_QTDE: TFMTBCDField
      FieldName = 'ENIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField
      FieldName = 'ENIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEntradaAvulsaENIT_USER_ID: TIntegerField
      FieldName = 'ENIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEntradaAvulsaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryItensEntradaAvulsaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryItensEntradaAvulsaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
    end
    object qryItensEntradaAvulsaGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensEntradaAvulsaMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensEntradaAvulsaMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspItensEntradaAvulsa: TDataSetProvider
    DataSet = qryItensEntradaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 88
  end
  object cdsItensEntradaAvulsa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensEntradaAvulsa'
    OnNewRecord = cdsItensEntradaAvulsaNewRecord
    OnReconcileError = cdsItensEntradaAvulsaReconcileError
    Left = 224
    Top = 136
    object cdsItensEntradaAvulsaENIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'ENIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensEntradaAvulsaPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 55
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsItensEntradaAvulsaPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsItensEntradaAvulsaENIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 10
      FieldName = 'ENIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object cdsItensEntradaAvulsaGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 25
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensEntradaAvulsaMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 25
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensEntradaAvulsaMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 25
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensEntradaAvulsaENIT_ID: TIntegerField
      FieldName = 'ENIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_EMPR_ID: TIntegerField
      FieldName = 'ENIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_ENAV_ID: TIntegerField
      FieldName = 'ENIT_ENAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField
      FieldName = 'ENIT_ENAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'ENIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField
      FieldName = 'ENIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensEntradaAvulsaENIT_USER_ID: TIntegerField
      FieldName = 'ENIT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensEntradaAvulsaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
  end
  object dsItensEntradaAvulsa: TDataSource
    DataSet = cdsItensEntradaAvulsa
    Left = 224
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
      'AND   PR.PROD_ATIVO            = 1'
      'AND   PR.PROD_FLG_ESTOQUE      = 1'
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
end
