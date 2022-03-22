inherited dmRel_Tabela_Preco: TdmRel_Tabela_Preco
  OldCreateOrder = True
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
      '      CASE TPRC_ATIVO'
      '           WHEN 1 THEN '#39'Ativo'#39
      '           WHEN 0 THEN '#39'Inativo'#39
      '      END AS TPRC_ATIVO,'
      '      TPRC_DTA_CADASTRO,'
      '      TPRC_USER_ID'
      'FROM  TABELA_PRECO'
      'WHERE TPRC_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      TPRC_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 88
  end
  object dspTabelaPreco: TDataSetProvider
    DataSet = qryTabelaPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 136
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
    Left = 72
    Top = 184
    object cdsTabelaPrecoTPRC_ID: TIntegerField
      FieldName = 'TPRC_ID'
    end
    object cdsTabelaPrecoTPRC_EMPR_ID: TIntegerField
      FieldName = 'TPRC_EMPR_ID'
    end
    object cdsTabelaPrecoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      Size = 100
    end
    object cdsTabelaPrecoTPRC_ATIVO: TStringField
      FieldName = 'TPRC_ATIVO'
      FixedChar = True
      Size = 7
    end
    object cdsTabelaPrecoTPRC_DTA_CADASTRO: TDateField
      FieldName = 'TPRC_DTA_CADASTRO'
    end
    object cdsTabelaPrecoTPRC_USER_ID: TIntegerField
      FieldName = 'TPRC_USER_ID'
    end
  end
  object dsTabelaPreco: TDataSource
    DataSet = cdsTabelaPreco
    Left = 72
    Top = 232
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
      '      TI.TPIT_ID,'
      '      TI.TPIT_EMPR_ID,'
      '      TI.TPIT_TPRC_ID,'
      '      TI.TPIT_TPRC_EMPR_ID,'
      '      TI.TPIT_PROD_ID,'
      '      TI.TPIT_PROD_EMPR_ID,'
      '      TI.TPIT_DTA_VIGENCIA,'
      '      TI.TPIT_DTA_VALIDADE,'
      '      TI.TPIT_VLR_GONDOLA,'
      '      TI.TPIT_VLR_MINIMO,'
      '      TI.TPIT_VLR_ESPECIAL,'
      '      TI.TPIT_VLR_ATACADO,'
      '      TI.TPIT_DTA_CADASTRO,'
      '      TI.TPIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1  AS PROD_UNIDADE, '
      
        '      COALESCE(PR.PROD_COMISSAO_VEND_INTERNA,0) PROD_COMISSAO_VE' +
        'ND_INTERNA,'
      
        '      COALESCE(PR.PROD_COMISSAO_VEND_EXTERNO,0) PROD_COMISSAO_VE' +
        'ND_EXTERNO,'
      
        '      COALESCE(PR.PROD_COMISSAO_VEND_BALCAO,0) PROD_COMISSAO_VEN' +
        'D_BALCAO,'
      '      TP.GENE_DESCR TIPO_PROD,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  TABELA_PRECO_ITENS TI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = TI.TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = TI.TPIT_PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_TP_PROD'
      'AND TP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_TP_PROD'
      'AND TP.GENE_ID      = PR.PROD_GENE_ID_TP_PROD)'
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
      'WHERE TI.TPIT_EMPR_ID      = :EMPR_ID'
      'AND   TI.TPIT_TPRC_ID      = :TPRC_ID'
      'AND   TI.TPIT_TPRC_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 168
    Top = 88
  end
  object dspItensTabelaPreco: TDataSetProvider
    DataSet = qryItensTabelaPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 136
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
    Left = 168
    Top = 184
    object cdsItensTabelaPrecoTPIT_ID: TIntegerField
      FieldName = 'TPIT_ID'
    end
    object cdsItensTabelaPrecoTPIT_EMPR_ID: TIntegerField
      FieldName = 'TPIT_EMPR_ID'
    end
    object cdsItensTabelaPrecoTPIT_TPRC_ID: TIntegerField
      FieldName = 'TPIT_TPRC_ID'
    end
    object cdsItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'TPIT_TPRC_EMPR_ID'
    end
    object cdsItensTabelaPrecoTPIT_PROD_ID: TIntegerField
      FieldName = 'TPIT_PROD_ID'
    end
    object cdsItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'TPIT_PROD_EMPR_ID'
    end
    object cdsItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField
      FieldName = 'TPIT_DTA_VIGENCIA'
    end
    object cdsItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField
      FieldName = 'TPIT_DTA_VALIDADE'
    end
    object cdsItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField
      FieldName = 'TPIT_VLR_GONDOLA'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField
      FieldName = 'TPIT_VLR_MINIMO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField
      FieldName = 'TPIT_VLR_ESPECIAL'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField
      FieldName = 'TPIT_VLR_ATACADO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField
      FieldName = 'TPIT_DTA_CADASTRO'
    end
    object cdsItensTabelaPrecoTPIT_USER_ID: TIntegerField
      FieldName = 'TPIT_USER_ID'
    end
    object cdsItensTabelaPrecoPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsItensTabelaPrecoPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensTabelaPrecoPROD_COMISSAO_VEND_INTERNA: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoPROD_COMISSAO_VEND_BALCAO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensTabelaPrecoTIPO_PROD: TStringField
      FieldName = 'TIPO_PROD'
      Size = 250
    end
    object cdsItensTabelaPrecoGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 250
    end
    object cdsItensTabelaPrecoMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 250
    end
    object cdsItensTabelaPrecoMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 250
    end
  end
  object dsItensTabelaPreco: TDataSource
    DataSet = cdsItensTabelaPreco
    Left = 168
    Top = 232
  end
end
