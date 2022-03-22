inherited dmSaida_Avaria: TdmSaida_Avaria
  OldCreateOrder = True
  Width = 957
  object qrySaidaAvaria: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      SIAV_ID,'
      '      SIAV_EMPR_ID,'
      '      SIAV_NR_DOCUMENTO,'
      '      SIAV_CONCILIADO,'
      '      SIAV_VLR_TOTAL,'
      '      SIAV_OBS,'
      '      SIAV_DTA_CADASTRO,'
      '      SIAV_USER_ID'
      'FROM  SAIDA_AVARIA'
      'WHERE SIAV_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      SIAV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 40
    object qrySaidaAvariaSIAV_ID: TIntegerField
      FieldName = 'SIAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySaidaAvariaSIAV_EMPR_ID: TIntegerField
      FieldName = 'SIAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySaidaAvariaSIAV_NR_DOCUMENTO: TStringField
      FieldName = 'SIAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object qrySaidaAvariaSIAV_CONCILIADO: TIntegerField
      FieldName = 'SIAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField
      FieldName = 'SIAV_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qrySaidaAvariaSIAV_OBS: TBlobField
      FieldName = 'SIAV_OBS'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvariaSIAV_DTA_CADASTRO: TDateField
      FieldName = 'SIAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qrySaidaAvariaSIAV_USER_ID: TIntegerField
      FieldName = 'SIAV_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspSaidaAvaria: TDataSetProvider
    DataSet = qrySaidaAvaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 88
  end
  object dsSaidaAvaria: TDataSource
    DataSet = cdsSaidaAvaria
    Left = 104
    Top = 184
  end
  object cdsSaidaAvaria: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspSaidaAvaria'
    BeforePost = cdsSaidaAvariaBeforePost
    BeforeDelete = cdsSaidaAvariaBeforeDelete
    OnNewRecord = cdsSaidaAvariaNewRecord
    OnReconcileError = cdsSaidaAvariaReconcileError
    Left = 104
    Top = 136
    object cdsSaidaAvariaSIAV_CONCILIADO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'SIAV_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaidaAvariaSIAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'SIAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSaidaAvariaSIAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'SIAV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsSaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'SIAV_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsSaidaAvariaSIAV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'SIAV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaidaAvariaSIAV_EMPR_ID: TIntegerField
      FieldName = 'SIAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsSaidaAvariaSIAV_OBS: TBlobField
      FieldName = 'SIAV_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsSaidaAvariaSIAV_USER_ID: TIntegerField
      FieldName = 'SIAV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object qryItensSaidaAvaria: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SIAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      SA.SIIT_ID,'
      '      SA.SIIT_EMPR_ID,'
      '      SA.SIIT_SIAV_ID,'
      '      SA.SIIT_SIAV_EMPR_ID,'
      '      SA.SIIT_PROD_ID,'
      '      SA.SIIT_PROD_EMPR_ID,'
      '      SA.SIIT_QTDE,'
      '      SA.SIIT_VLR_CUSTO,'
      '      SA.SIIT_VLR_TOTAL,'
      '      SA.SIIT_DTA_CADASTRO,'
      '      SA.SIIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR PROD_GRUPO,'
      '      MC.GENE_DESCR PROD_MARCA,'
      '      MD.GENE_DESCR PROD_MODELO'
      'FROM  SAIDA_AVARIA_ITENS SA'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID          = SA.SIIT_PROD_ID'
      'AND PR.PROD_EMPR_ID     = SA.SIIT_PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID          = PR.PROD_GENE_ID_GRUPO)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID          = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID          = PR.PROD_GENE_ID_MODELO)'
      'WHERE SIIT_EMPR_ID      = :EMPR_ID'
      'AND   SIIT_SIAV_ID      = :SIAV_ID'
      'AND   SIIT_SIAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 248
    Top = 40
    object qryItensSaidaAvariaSIIT_ID: TIntegerField
      FieldName = 'SIIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidaAvariaSIIT_EMPR_ID: TIntegerField
      FieldName = 'SIIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidaAvariaSIIT_SIAV_ID: TIntegerField
      FieldName = 'SIIT_SIAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField
      FieldName = 'SIIT_SIAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensSaidaAvariaSIIT_PROD_ID: TIntegerField
      FieldName = 'SIIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SIIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidaAvariaSIIT_QTDE: TFMTBCDField
      FieldName = 'SIIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField
      FieldName = 'SIIT_VLR_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField
      FieldName = 'SIIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidaAvariaSIIT_USER_ID: TIntegerField
      FieldName = 'SIIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensSaidaAvariaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryItensSaidaAvariaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryItensSaidaAvariaPROD_GRUPO: TStringField
      FieldName = 'PROD_GRUPO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensSaidaAvariaPROD_MARCA: TStringField
      FieldName = 'PROD_MARCA'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensSaidaAvariaPROD_MODELO: TStringField
      FieldName = 'PROD_MODELO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryItensSaidaAvariaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object qryItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField
      FieldName = 'SIIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
  end
  object dspItensSaidaAvaria: TDataSetProvider
    DataSet = qryItensSaidaAvaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 248
    Top = 88
  end
  object dsItensSaidaAvaria: TDataSource
    DataSet = cdsItensSaidaAvaria
    Left = 248
    Top = 184
  end
  object cdsItensSaidaAvaria: TClientDataSet
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
        Name = 'SIAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensSaidaAvaria'
    OnNewRecord = cdsItensSaidaAvariaNewRecord
    OnReconcileError = cdsItensSaidaAvariaReconcileError
    Left = 248
    Top = 136
    object cdsItensSaidaAvariaSIIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 8
      FieldName = 'SIIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensSaidaAvariaPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 35
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsItensSaidaAvariaPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsItensSaidaAvariaSIIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 11
      FieldName = 'SIIT_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 11
      FieldName = 'SIIT_VLR_CUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 11
      FieldName = 'SIIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvariaPROD_GRUPO: TStringField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'PROD_GRUPO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidaAvariaPROD_MARCA: TStringField
      DisplayLabel = 'Marca Produto'
      FieldName = 'PROD_MARCA'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidaAvariaPROD_MODELO: TStringField
      DisplayLabel = 'Modelo Produto'
      FieldName = 'PROD_MODELO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsItensSaidaAvariaSIIT_ID: TIntegerField
      FieldName = 'SIIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_EMPR_ID: TIntegerField
      FieldName = 'SIIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_SIAV_ID: TIntegerField
      FieldName = 'SIIT_SIAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField
      FieldName = 'SIIT_SIAV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SIIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField
      FieldName = 'SIIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensSaidaAvariaSIIT_USER_ID: TIntegerField
      FieldName = 'SIIT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensSaidaAvariaPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsItensSaidaAvariaTOTAL_ITENS: TAggregateField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'TOTAL_ITENS'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.0000'
      Expression = 'SUM(SIIT_VLR_TOTAL)'
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
      '      PR.PROD_VLR_CUSTO,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR PROD_GRUPO,'
      '      MC.GENE_DESCR PROD_MARCA,'
      '      MD.GENE_DESCR PROD_MODELO,'
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
      'AND   PR.PROD_GENE_ID_TP_PROD <> 2'
      'AND   PR.PROD_FLG_ESTOQUE = 1'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 384
    Top = 40
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = qryPesqProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 88
  end
  object cdsPesqProdutos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProdutos'
    Left = 384
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
    object cdsPesqProdutosPROD_VLR_CUSTO: TFMTBCDField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'PROD_VLR_CUSTO'
      Precision = 20
      Size = 4
    end
    object cdsPesqProdutosPROD_GRUPO: TStringField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'PROD_GRUPO'
      Size = 50
    end
    object cdsPesqProdutosPROD_MARCA: TStringField
      DisplayLabel = 'Marca Produto'
      FieldName = 'PROD_MARCA'
      Size = 50
    end
    object cdsPesqProdutosPROD_MODELO: TStringField
      DisplayLabel = 'Modelo Produto'
      FieldName = 'PROD_MODELO'
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
