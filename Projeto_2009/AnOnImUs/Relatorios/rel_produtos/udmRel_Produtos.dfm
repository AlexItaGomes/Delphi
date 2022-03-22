inherited dmRel_Produtos: TdmRel_Produtos
  OldCreateOrder = True
  object qryRel_Produtos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      CASE PR.PROD_ATIVO'
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '           WHEN 1 THEN '#39'Sim'#39
      '      END AS PROD_ATIVO,'
      '      PR.PROD_DTA_ULT_COMPRA,'
      '      PR.PROD_VLR_CUSTO,'
      '      PR.PROD_ESTQ_INICIAL,'
      '      PR.PROD_ESTQ_MINIMO,'
      '      PR.PROD_GARANTIA,'
      '      CASE PR.PROD_FLG_FRACIONADO'
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '           WHEN 1 THEN '#39'Sim'#39
      '      END AS PROD_FLG_FRACIONADO,'
      '      PR.PROD_DTA_CADASTRO,'
      '      FN.FORN_NOME_FANTASIA,'
      '      TP.GENE_DESCR TIPO_PROD,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      AL.GENE_DESCR ALIQUOTA_ECF,'
      '      AL.GENE_PAR1  VLR_ALIQUOTA,'
      '      COALESCE(ET.ESTQ_EST_ATUAL,0) ESTQ_EST_ATUAL,'
      '      COALESCE(ET.ESTQ_EST_DISP,0) ESTQ_EST_DISP,'
      '      COALESCE((SELECT FIRST 1'
      '                      TPIT_VLR_GONDOLA'
      '                      FROM  TABELA_PRECO_ITENS PI'
      '               WHERE PI.TPIT_PROD_ID      = PR.PROD_ID'
      
        '               AND   PI.TPIT_PROD_EMPR_ID = PR.PROD_EMPR_ID),0) ' +
        'VLR_VENDA'
      'FROM  PRODUTOS PR'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN ESTOQUE ET'
      'ON (ET.ESTQ_PROD_ID      = PR.PROD_ID'
      'AND ET.ESTQ_PROD_EMPR_ID = PR.PROD_EMPR_ID)'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID          = PR.PROD_FORN_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_TP_PROD'
      'AND TP.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_TP_PROD'
      'AND TP.GENE_ID          = PR.PROD_GENE_ID_TP_PROD)'
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
      'LEFT OUTER JOIN GENERICA AL'
      'ON (AL.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_ALQ_ECF'
      'AND AL.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_ALQ_ECF'
      'AND AL.GENE_ID          = PR.PROD_GENE_ID_ALQ_ECF)')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 24
  end
  object dspRel_Produtos: TDataSetProvider
    DataSet = qryRel_Produtos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 72
  end
  object cdsRel_Produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Produtos'
    Left = 56
    Top = 120
    object cdsRel_ProdutosPROD_ID: TIntegerField
      FieldName = 'PROD_ID'
    end
    object cdsRel_ProdutosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsRel_ProdutosPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsRel_ProdutosPROD_ATIVO: TStringField
      FieldName = 'PROD_ATIVO'
      FixedChar = True
      Size = 3
    end
    object cdsRel_ProdutosPROD_DTA_ULT_COMPRA: TDateField
      FieldName = 'PROD_DTA_ULT_COMPRA'
    end
    object cdsRel_ProdutosPROD_VLR_CUSTO: TFMTBCDField
      FieldName = 'PROD_VLR_CUSTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsRel_ProdutosPROD_ESTQ_INICIAL: TFMTBCDField
      FieldName = 'PROD_ESTQ_INICIAL'
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRel_ProdutosPROD_ESTQ_MINIMO: TFMTBCDField
      FieldName = 'PROD_ESTQ_MINIMO'
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRel_ProdutosPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
    end
    object cdsRel_ProdutosPROD_FLG_FRACIONADO: TStringField
      FieldName = 'PROD_FLG_FRACIONADO'
      FixedChar = True
      Size = 3
    end
    object cdsRel_ProdutosPROD_DTA_CADASTRO: TDateField
      FieldName = 'PROD_DTA_CADASTRO'
    end
    object cdsRel_ProdutosFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsRel_ProdutosTIPO_PROD: TStringField
      FieldName = 'TIPO_PROD'
      Size = 50
    end
    object cdsRel_ProdutosGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsRel_ProdutosMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsRel_ProdutosMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsRel_ProdutosALIQUOTA_ECF: TStringField
      FieldName = 'ALIQUOTA_ECF'
      Size = 50
    end
    object cdsRel_ProdutosVLR_ALIQUOTA: TStringField
      FieldName = 'VLR_ALIQUOTA'
      Size = 50
    end
    object cdsRel_ProdutosESTQ_EST_ATUAL: TFMTBCDField
      FieldName = 'ESTQ_EST_ATUAL'
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRel_ProdutosESTQ_EST_DISP: TFMTBCDField
      FieldName = 'ESTQ_EST_DISP'
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRel_ProdutosVLR_VENDA: TFMTBCDField
      FieldName = 'VLR_VENDA'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
  end
  object dsRel_Produtos: TDataSource
    DataSet = cdsRel_Produtos
    OnDataChange = dsRel_ProdutosDataChange
    Left = 56
    Top = 168
  end
  object qryRelCompProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PROD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PC.PRCP_PROD_ID_COMP,'
      '      PC.PRCP_QTDE,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  PRODUTOS_COMP PC'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = PC.PRCP_PROD_ID_COMP'
      'AND PR.PROD_EMPR_ID = PC.PRCP_PROD_EMPR_ID_COMP)'
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
      'WHERE PR.PROD_ID = :PROD_ID'
      'AND      PR.PROD_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 160
    Top = 24
  end
  object dspRelCompProdutos: TDataSetProvider
    DataSet = qryRelCompProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 72
  end
  object cdsRelCompProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PROD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelCompProdutos'
    Left = 160
    Top = 120
    object cdsRelCompProdutosPRCP_PROD_ID_COMP: TIntegerField
      FieldName = 'PRCP_PROD_ID_COMP'
    end
    object cdsRelCompProdutosPRCP_QTDE: TFMTBCDField
      FieldName = 'PRCP_QTDE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRelCompProdutosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsRelCompProdutosPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsRelCompProdutosGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsRelCompProdutosMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsRelCompProdutosMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object dsRelCompProdutos: TDataSource
    DataSet = cdsRelCompProdutos
    Left = 160
    Top = 168
  end
end
