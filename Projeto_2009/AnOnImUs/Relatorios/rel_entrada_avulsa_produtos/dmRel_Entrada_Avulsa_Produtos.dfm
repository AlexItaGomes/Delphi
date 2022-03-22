inherited dmRel_Entr_Avulsa_Produtos: TdmRel_Entr_Avulsa_Produtos
  OldCreateOrder = True
  object qryRelEntradaAvulsa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      ENAV_ID,'
      '      ENAV_EMPR_ID,'
      '      ENAV_NR_DOCUMENTO,'
      '      CASE ENAV_CONCILIADO'
      '           WHEN 0 THEN '#39'Aberto'#39
      '           WHEN 1 THEN '#39'Conciliado'#39
      '           WHEN 2 THEN '#39'Cancelado'#39
      '      END AS ENAV_CONCILIADO,'
      '      ENAV_OBS,'
      '      ENAV_DTA_CADASTRO,'
      '      ENAV_USER_ID'
      'FROM  ENTRADA_AVULSA')
    SQLConnection = dmConexao.dbConexao
    Left = 168
    Top = 40
  end
  object dspRelEntradaAvulsa: TDataSetProvider
    DataSet = qryRelEntradaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 88
  end
  object cdsRelEntradaAvulsa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelEntradaAvulsa'
    Left = 168
    Top = 136
    object cdsRelEntradaAvulsaENAV_ID: TIntegerField
      FieldName = 'ENAV_ID'
    end
    object cdsRelEntradaAvulsaENAV_EMPR_ID: TIntegerField
      FieldName = 'ENAV_EMPR_ID'
    end
    object cdsRelEntradaAvulsaENAV_NR_DOCUMENTO: TStringField
      FieldName = 'ENAV_NR_DOCUMENTO'
      Size = 25
    end
    object cdsRelEntradaAvulsaENAV_CONCILIADO: TStringField
      FieldName = 'ENAV_CONCILIADO'
      FixedChar = True
      Size = 10
    end
    object cdsRelEntradaAvulsaENAV_OBS: TBlobField
      FieldName = 'ENAV_OBS'
    end
    object cdsRelEntradaAvulsaENAV_DTA_CADASTRO: TDateField
      FieldName = 'ENAV_DTA_CADASTRO'
    end
    object cdsRelEntradaAvulsaENAV_USER_ID: TIntegerField
      FieldName = 'ENAV_USER_ID'
    end
  end
  object dsRelEntradaAvulsa: TDataSource
    DataSet = cdsRelEntradaAvulsa
    Left = 168
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
        DataType = ftUnknown
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
      'AND   EI.ENIT_ENAV_ID      = :SAAV_ID'
      'AND   EI.ENIT_ENAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 288
    Top = 40
  end
  object dspItensEntradaAvulsa: TDataSetProvider
    DataSet = qryItensEntradaAvulsa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 288
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
    Left = 288
    Top = 136
    object cdsItensEntradaAvulsaENIT_ID: TIntegerField
      FieldName = 'ENIT_ID'
    end
    object cdsItensEntradaAvulsaENIT_EMPR_ID: TIntegerField
      FieldName = 'ENIT_EMPR_ID'
    end
    object cdsItensEntradaAvulsaENIT_ENAV_ID: TIntegerField
      FieldName = 'ENIT_ENAV_ID'
    end
    object cdsItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField
      FieldName = 'ENIT_ENAV_EMPR_ID'
    end
    object cdsItensEntradaAvulsaENIT_PROD_ID: TIntegerField
      FieldName = 'ENIT_PROD_ID'
    end
    object cdsItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'ENIT_PROD_EMPR_ID'
    end
    object cdsItensEntradaAvulsaENIT_QTDE: TFMTBCDField
      FieldName = 'ENIT_QTDE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField
      FieldName = 'ENIT_DTA_CADASTRO'
    end
    object cdsItensEntradaAvulsaENIT_USER_ID: TIntegerField
      FieldName = 'ENIT_USER_ID'
    end
    object cdsItensEntradaAvulsaPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsItensEntradaAvulsaPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensEntradaAvulsaGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsItensEntradaAvulsaMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsItensEntradaAvulsaMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object dsItensEntradaAvulsa: TDataSource
    DataSet = cdsItensEntradaAvulsa
    Left = 288
    Top = 184
  end
end
