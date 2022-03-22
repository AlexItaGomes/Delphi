inherited dmRel_Saida_Avaria: TdmRel_Saida_Avaria
  OldCreateOrder = True
  object qryRelSaidaAvaria: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      SIAV_ID,'
      '      SIAV_EMPR_ID,'
      '      SIAV_NR_DOCUMENTO,'
      '      CASE SIAV_CONCILIADO'
      '           WHEN 0 THEN '#39'Aberto'#39
      '           WHEN 1 THEN '#39'Conciliado'#39
      '           WHEN 2 THEN '#39'Cancelado'#39
      '      END AS SIAV_CONCILIADO,'
      '      SIAV_VLR_TOTAL,'
      '      SIAV_OBS,'
      '      SIAV_DTA_CADASTRO,'
      '      SIAV_USER_ID'
      'FROM  SAIDA_AVARIA')
    SQLConnection = dmConexao.dbConexao
    Left = 168
    Top = 40
  end
  object dspRelSaidaAvaria: TDataSetProvider
    DataSet = qryRelSaidaAvaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 88
  end
  object cdsRelSaidaAvaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelSaidaAvaria'
    Left = 168
    Top = 136
    object cdsRelSaidaAvariaSIAV_ID: TIntegerField
      FieldName = 'SIAV_ID'
    end
    object cdsRelSaidaAvariaSIAV_EMPR_ID: TIntegerField
      FieldName = 'SIAV_EMPR_ID'
    end
    object cdsRelSaidaAvariaSIAV_NR_DOCUMENTO: TStringField
      FieldName = 'SIAV_NR_DOCUMENTO'
      Size = 25
    end
    object cdsRelSaidaAvariaSIAV_CONCILIADO: TStringField
      FieldName = 'SIAV_CONCILIADO'
      FixedChar = True
      Size = 10
    end
    object cdsRelSaidaAvariaSIAV_OBS: TBlobField
      FieldName = 'SIAV_OBS'
    end
    object cdsRelSaidaAvariaSIAV_DTA_CADASTRO: TDateField
      FieldName = 'SIAV_DTA_CADASTRO'
    end
    object cdsRelSaidaAvariaSIAV_USER_ID: TIntegerField
      FieldName = 'SIAV_USER_ID'
    end
    object cdsRelSaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField
      FieldName = 'SIAV_VLR_TOTAL'
      DisplayFormat = '###,###,##0.000'
      Precision = 20
      Size = 4
    end
  end
  object dsRelEntradaAvulsa: TDataSource
    DataSet = cdsRelSaidaAvaria
    Left = 168
    Top = 184
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
      '      SI.SIIT_ID,'
      '      SI.SIIT_EMPR_ID,'
      '      SI.SIIT_SIAV_ID,'
      '      SI.SIIT_SIAV_EMPR_ID,'
      '      SI.SIIT_PROD_ID,'
      '      SI.SIIT_PROD_EMPR_ID,'
      '      SI.SIIT_QTDE,'
      '      SI.SIIT_VLR_CUSTO,'
      '      SI.SIIT_VLR_TOTAL,'
      '      SI.SIIT_DTA_CADASTRO,'
      '      SI.SIIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  SAIDA_AVARIA_ITENS SI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = SI.SIIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = SI.SIIT_PROD_EMPR_ID)'
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
      'WHERE SI.SIIT_EMPR_ID      = :EMPR_ID'
      'AND   SI.SIIT_SIAV_ID      = :SIAV_ID'
      'AND   SI.SIIT_SIAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 288
    Top = 40
  end
  object dspItensSaidaAvaria: TDataSetProvider
    DataSet = qryItensSaidaAvaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 88
  end
  object cdsItensSaidaAvaria: TClientDataSet
    Aggregates = <>
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
    Left = 288
    Top = 136
    object cdsItensSaidaAvariaSIIT_ID: TIntegerField
      FieldName = 'SIIT_ID'
    end
    object cdsItensSaidaAvariaSIIT_EMPR_ID: TIntegerField
      FieldName = 'SIIT_EMPR_ID'
    end
    object cdsItensSaidaAvariaSIIT_SIAV_ID: TIntegerField
      FieldName = 'SIIT_SIAV_ID'
    end
    object cdsItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField
      FieldName = 'SIIT_SIAV_EMPR_ID'
    end
    object cdsItensSaidaAvariaSIIT_PROD_ID: TIntegerField
      FieldName = 'SIIT_PROD_ID'
    end
    object cdsItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SIIT_PROD_EMPR_ID'
    end
    object cdsItensSaidaAvariaSIIT_QTDE: TFMTBCDField
      FieldName = 'SIIT_QTDE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField
      FieldName = 'SIIT_DTA_CADASTRO'
    end
    object cdsItensSaidaAvariaSIIT_USER_ID: TIntegerField
      FieldName = 'SIIT_USER_ID'
    end
    object cdsItensSaidaAvariaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsItensSaidaAvariaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensSaidaAvariaGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsItensSaidaAvariaMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsItensSaidaAvariaMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField
      FieldName = 'SIIT_VLR_CUSTO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField
      FieldName = 'SIIT_VLR_TOTAL'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
  end
  object dsItensSaidaAvaria: TDataSource
    DataSet = cdsItensSaidaAvaria
    Left = 288
    Top = 184
  end
end
