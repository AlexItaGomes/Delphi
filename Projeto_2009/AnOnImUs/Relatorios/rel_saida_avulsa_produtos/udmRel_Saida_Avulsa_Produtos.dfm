inherited dmRel_Saida_Avulsa_Produtos: TdmRel_Saida_Avulsa_Produtos
  OldCreateOrder = True
  object qryRelSaidaAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      SAAV_ID,'
      '      SAAV_EMPR_ID,'
      '      SAAV_NR_DOCUMENTO,'
      '      CASE SAAV_CONCILIADO'
      '           WHEN 0 THEN '#39'Aberto'#39
      '           WHEN 1 THEN '#39'Conciliado'#39
      '           WHEN 2 THEN '#39'Cancelado'#39
      '      END AS SAAV_CONCILIADO,'
      '      SAAV_OBS,'
      '      SAAV_DTA_CADASTRO,'
      '      SAAV_USER_ID'
      'FROM  SAIDA_AVULSA')
    SQLConnection = dmConexao.dbConexao
    Left = 168
    Top = 40
  end
  object dspRelSaidaAvulsa: TDataSetProvider
    DataSet = qryRelSaidaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 88
  end
  object cdsRelSaidaAvulsa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelSaidaAvulsa'
    Left = 168
    Top = 136
    object cdsRelSaidaAvulsaSAAV_ID: TIntegerField
      FieldName = 'SAAV_ID'
    end
    object cdsRelSaidaAvulsaSAAV_EMPR_ID: TIntegerField
      FieldName = 'SAAV_EMPR_ID'
    end
    object cdsRelSaidaAvulsaSAAV_NR_DOCUMENTO: TStringField
      FieldName = 'SAAV_NR_DOCUMENTO'
      Size = 25
    end
    object cdsRelSaidaAvulsaSAAV_CONCILIADO: TStringField
      FieldName = 'SAAV_CONCILIADO'
      FixedChar = True
      Size = 10
    end
    object cdsRelSaidaAvulsaSAAV_OBS: TBlobField
      FieldName = 'SAAV_OBS'
    end
    object cdsRelSaidaAvulsaSAAV_DTA_CADASTRO: TDateField
      FieldName = 'SAAV_DTA_CADASTRO'
    end
    object cdsRelSaidaAvulsaSAAV_USER_ID: TIntegerField
      FieldName = 'SAAV_USER_ID'
    end
  end
  object dsRelSaidaAvulsa: TDataSource
    DataSet = cdsRelSaidaAvulsa
    Left = 168
    Top = 184
  end
  object qryItensSaidaAvulsa: TSQLQuery
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
      '      SI.SAIT_ID,'
      '      SI.SAIT_EMPR_ID,'
      '      SI.SAIT_SAAV_ID,'
      '      SI.SAIT_SAAV_EMPR_ID,'
      '      SI.SAIT_PROD_ID,'
      '      SI.SAIT_PROD_EMPR_ID,'
      '      SI.SAIT_QTDE,'
      '      SI.SAIT_DTA_CADASTRO,'
      '      SI.SAIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  SAIDA_AVULSA_ITENS SI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = SI.SAIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = SI.SAIT_PROD_EMPR_ID)'
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
      'WHERE SI.SAIT_EMPR_ID      = :EMPR_ID'
      'AND   SI.SAIT_SAAV_ID      = :SAAV_ID'
      'AND   SI.SAIT_SAAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 272
    Top = 40
  end
  object dspItensSaidaAvulsa: TDataSetProvider
    DataSet = qryItensSaidaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 88
  end
  object cdsItensSaidaAvulsa: TClientDataSet
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
    ProviderName = 'dspItensSaidaAvulsa'
    Left = 272
    Top = 136
    object cdsItensSaidaAvulsaSAIT_ID: TIntegerField
      FieldName = 'SAIT_ID'
    end
    object cdsItensSaidaAvulsaSAIT_EMPR_ID: TIntegerField
      FieldName = 'SAIT_EMPR_ID'
    end
    object cdsItensSaidaAvulsaSAIT_SAAV_ID: TIntegerField
      FieldName = 'SAIT_SAAV_ID'
    end
    object cdsItensSaidaAvulsaSAIT_SAAV_EMPR_ID: TIntegerField
      FieldName = 'SAIT_SAAV_EMPR_ID'
    end
    object cdsItensSaidaAvulsaSAIT_PROD_ID: TIntegerField
      FieldName = 'SAIT_PROD_ID'
    end
    object cdsItensSaidaAvulsaSAIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'SAIT_PROD_EMPR_ID'
    end
    object cdsItensSaidaAvulsaSAIT_QTDE: TFMTBCDField
      FieldName = 'SAIT_QTDE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensSaidaAvulsaSAIT_DTA_CADASTRO: TDateField
      FieldName = 'SAIT_DTA_CADASTRO'
    end
    object cdsItensSaidaAvulsaSAIT_USER_ID: TIntegerField
      FieldName = 'SAIT_USER_ID'
    end
    object cdsItensSaidaAvulsaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsItensSaidaAvulsaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensSaidaAvulsaGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsItensSaidaAvulsaMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsItensSaidaAvulsaMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object dsItensSaidaAvulsa: TDataSource
    DataSet = cdsItensSaidaAvulsa
    Left = 272
    Top = 184
  end
end
