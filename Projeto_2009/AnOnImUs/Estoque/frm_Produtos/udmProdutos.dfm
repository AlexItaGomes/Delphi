inherited dmProdutos: TdmProdutos
  OldCreateOrder = True
  Width = 956
  object qryProdutos: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.*,'
      '      FN.FORN_NOME_FANTASIA,'
      '      TP.GENE_DESCR TIPO_PROD,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      AL.GENE_DESCR ALIQUOTA,'
      '      AL.GENE_PAR1 ICMS,'
      '      ET.ESTQ_EST_ATUAL,'
      '      ET.ESTQ_EST_DISP,'
      '      UN.GENE_DESCR    AS UNIDADE,'
      '      UN.GENE_PAR1     AS UNID'
      'FROM  PRODUTOS PR'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = PR.PROD_FORN_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_TP_PROD'
      'AND TP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_TP_PROD'
      'AND TP.GENE_ID      = PR.PROD_GENE_ID_TP_PROD)'
      'LEFT OUTER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA AL'
      'ON (AL.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_ALQ_ECF'
      'AND AL.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_ALQ_ECF'
      'AND AL.GENE_ID      = PR.PROD_GENE_ID_ALQ_ECF)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID      = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN ESTOQUE ET'
      'ON (ET.ESTQ_PROD_ID      = PR.PROD_ID'
      'AND ET.ESTQ_PROD_EMPR_ID = PR.PROD_EMPR_ID)'
      'WHERE PR.PROD_EMPR_ID = :EMPR_ID'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 40
    object qryProdutosPROD_ID: TIntegerField
      FieldName = 'PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryProdutosPROD_COD_NCM: TStringField
      DisplayLabel = 'C'#243'd. NCM'
      FieldName = 'PROD_COD_NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qryProdutosPROD_EMPR_ID: TIntegerField
      FieldName = 'PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryProdutosPROD_FORN_ID: TIntegerField
      FieldName = 'PROD_FORN_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryProdutosPROD_ABREVIACAO: TStringField
      FieldName = 'PROD_ABREVIACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryProdutosPROD_ATIVO: TIntegerField
      FieldName = 'PROD_ATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_EMPR_ID_TP_PROD: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_TGEN_ID_TP_PROD: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_ID_TP_PROD: TIntegerField
      FieldName = 'PROD_GENE_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_EMPR_ID_GRUPO: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_TGEN_ID_GRUPO: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_ID_GRUPO: TIntegerField
      FieldName = 'PROD_GENE_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_EMPR_ID_MARCA: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_TGEN_ID_MARCA: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_ID_MARCA: TIntegerField
      FieldName = 'PROD_GENE_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_EMPR_ID_MODELO: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_TGEN_ID_MODELO: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_ID_MODELO: TIntegerField
      FieldName = 'PROD_GENE_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_EMPR_ID_ALQ_ECF: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_TGEN_ID_ALQ_ECF: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_GENE_ID_ALQ_ECF: TIntegerField
      FieldName = 'PROD_GENE_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_DTA_ULT_COMPRA: TDateField
      FieldName = 'PROD_DTA_ULT_COMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_VLR_CUSTO: TFMTBCDField
      FieldName = 'PROD_VLR_CUSTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_ESTQ_INICIAL: TFMTBCDField
      FieldName = 'PROD_ESTQ_INICIAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_ESTQ_MINIMO: TFMTBCDField
      FieldName = 'PROD_ESTQ_MINIMO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_DTA_CADASTRO: TDateField
      FieldName = 'PROD_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_USER_ID: TIntegerField
      FieldName = 'PROD_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 150
    end
    object qryProdutosTIPO_PROD: TStringField
      FieldName = 'TIPO_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosESTQ_EST_ATUAL: TFMTBCDField
      FieldName = 'ESTQ_EST_ATUAL'
      ProviderFlags = [pfInWhere]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosESTQ_EST_DISP: TFMTBCDField
      FieldName = 'ESTQ_EST_DISP'
      ProviderFlags = [pfInWhere]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_IMAGEM: TBlobField
      FieldName = 'PROD_IMAGEM'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object qryProdutosICMS: TStringField
      FieldName = 'ICMS'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object qryProdutosPROD_GRADE: TIntegerField
      FieldName = 'PROD_GRADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_FLG_ESTOQUE: TIntegerField
      FieldName = 'PROD_FLG_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_TIPO_COMISSAO: TIntegerField
      FieldName = 'PROD_TIPO_COMISSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COMISSAO_VEND_INTERNA: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_COMISSAO_VEND_BALCAO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryProdutosPROD_COD_GTIN: TStringField
      FieldName = 'PROD_COD_GTIN'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COD_ORIGINAL: TIntegerField
      FieldName = 'PROD_COD_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COD_FABRICA: TIntegerField
      FieldName = 'PROD_COD_FABRICA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_CST_PADRAO: TStringField
      FieldName = 'PROD_CST_PADRAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryProdutosPROD_TIPO_ALIQUOTA_PIS: TStringField
      FieldName = 'PROD_TIPO_ALIQUOTA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProdutosPROD_TIPO_ALIQUOTA_COFINS: TStringField
      FieldName = 'PROD_TIPO_ALIQUOTA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProdutosPROD_NATUREZA_PIS_COFINS: TIntegerField
      FieldName = 'PROD_NATUREZA_PIS_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_CST_ENTRADA_PIS: TStringField
      FieldName = 'PROD_CST_ENTRADA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryProdutosPROD_CST_SAIDA_PIS: TStringField
      FieldName = 'PROD_CST_SAIDA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryProdutosPROD_ALIQUOTA_PIS: TFMTBCDField
      FieldName = 'PROD_ALIQUOTA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryProdutosPROD_CST_ENTRADA_COFINS: TStringField
      FieldName = 'PROD_CST_ENTRADA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryProdutosPROD_CST_SAIDA_COFINS: TStringField
      FieldName = 'PROD_CST_SAIDA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryProdutosPROD_ALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'PROD_ALIQUOTA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryProdutosPROD_REGIME_TRIBUTARIO: TStringField
      FieldName = 'PROD_REGIME_TRIBUTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProdutosPROD_PESO_LIQUIDO: TFMTBCDField
      FieldName = 'PROD_PESO_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryProdutosPROD_GENE_EMPR_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryProdutosPROD_GENE_TGEN_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryProdutosPROD_GENE_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 250
    end
    object qryProdutosUNID: TStringField
      FieldName = 'UNID'
      ProviderFlags = []
      Size = 250
    end
    object qryProdutosPROD_COD_FORN1: TIntegerField
      FieldName = 'PROD_COD_FORN1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COD_FORN2: TIntegerField
      FieldName = 'PROD_COD_FORN2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COD_FORN3: TIntegerField
      FieldName = 'PROD_COD_FORN3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_COD_FORN4: TIntegerField
      FieldName = 'PROD_COD_FORN4'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_DURACAO: TIntegerField
      FieldName = 'PROD_DURACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryProdutosPROD_PERIODO_RETORNO: TStringField
      FieldName = 'PROD_PERIODO_RETORNO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = qryProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 72
    Top = 184
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutos'
    AfterEdit = cdsProdutosAfterEdit
    BeforeDelete = cdsProdutosBeforeDelete
    OnNewRecord = cdsProdutosNewRecord
    OnReconcileError = cdsProdutosReconcileError
    Left = 72
    Top = 136
    object cdsProdutosPROD_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      DisplayWidth = 15
      FieldName = 'PROD_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPROD_COD_NCM: TStringField
      DisplayLabel = 'C'#243'd. NCM'
      FieldName = 'PROD_COD_NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsProdutosPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosPROD_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 15
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsProdutosFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 15
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = [pfInWhere]
      Size = 150
    end
    object cdsProdutosTIPO_PROD: TStringField
      DisplayLabel = 'Tipo Prod.'
      DisplayWidth = 15
      FieldName = 'TIPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsProdutosGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo Prod.'
      DisplayWidth = 15
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsProdutosMARCA_PROD: TStringField
      DisplayLabel = 'Marca Prod.'
      DisplayWidth = 15
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsProdutosMODELO_PROD: TStringField
      DisplayLabel = 'Modelo Prod.'
      DisplayWidth = 15
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsProdutosPROD_ESTQ_INICIAL: TFMTBCDField
      DisplayLabel = 'Est. Inicial'
      DisplayWidth = 15
      FieldName = 'PROD_ESTQ_INICIAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosESTQ_EST_DISP: TFMTBCDField
      DisplayLabel = 'Est. Disp.'
      FieldName = 'ESTQ_EST_DISP'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosESTQ_EST_ATUAL: TFMTBCDField
      DisplayLabel = 'Est. Atual'
      FieldName = 'ESTQ_EST_ATUAL'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_ESTQ_MINIMO: TFMTBCDField
      DisplayLabel = 'Est. Min'#237'mo'
      DisplayWidth = 15
      FieldName = 'PROD_ESTQ_MINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_DTA_ULT_COMPRA: TDateField
      DisplayLabel = 'Dt. Ult. Compra'
      DisplayWidth = 15
      FieldName = 'PROD_DTA_ULT_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPROD_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'PROD_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPROD_FORN_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_FORN_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_EMPR_ID_TP_PROD: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_EMPR_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_TP_PROD: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_TGEN_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_TP_PROD: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_ID_TP_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_EMPR_ID_GRUPO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_EMPR_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_GRUPO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_TGEN_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_GRUPO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_EMPR_ID_MARCA: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_EMPR_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_MARCA: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_TGEN_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_MARCA: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_ID_MARCA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_EMPR_ID_MODELO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_EMPR_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_MODELO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_TGEN_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_MODELO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_ID_MODELO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_EMPR_ID_ALQ_ECF: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_EMPR_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_ALQ_ECF: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_TGEN_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_ALQ_ECF: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GENE_ID_ALQ_ECF'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_VLR_CUSTO: TFMTBCDField
      DisplayWidth = 15
      FieldName = 'PROD_VLR_CUSTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_GARANTIA: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_FLG_FRACIONADO: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_ABREVIACAO: TStringField
      DisplayWidth = 15
      FieldName = 'PROD_ABREVIACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsProdutosALIQUOTA: TStringField
      DisplayWidth = 15
      FieldName = 'ALIQUOTA'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object cdsProdutosPROD_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsProdutosPROD_IMAGEM: TBlobField
      FieldName = 'PROD_IMAGEM'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosICMS: TStringField
      FieldName = 'ICMS'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object cdsProdutosPROD_GRADE: TIntegerField
      FieldName = 'PROD_GRADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_FLG_ESTOQUE: TIntegerField
      FieldName = 'PROD_FLG_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_TIPO_COMISSAO: TIntegerField
      FieldName = 'PROD_TIPO_COMISSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COMISSAO_VEND_INTERNA: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_COD_GTIN: TStringField
      FieldName = 'PROD_COD_GTIN'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COD_ORIGINAL: TIntegerField
      FieldName = 'PROD_COD_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COD_FABRICA: TIntegerField
      FieldName = 'PROD_COD_FABRICA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COMISSAO_VEND_BALCAO: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsProdutosPROD_CST_PADRAO: TStringField
      FieldName = 'PROD_CST_PADRAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsProdutosPROD_TIPO_ALIQUOTA_PIS: TStringField
      FieldName = 'PROD_TIPO_ALIQUOTA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPROD_TIPO_ALIQUOTA_COFINS: TStringField
      FieldName = 'PROD_TIPO_ALIQUOTA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPROD_NATUREZA_PIS_COFINS: TIntegerField
      FieldName = 'PROD_NATUREZA_PIS_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_CST_ENTRADA_PIS: TStringField
      FieldName = 'PROD_CST_ENTRADA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsProdutosPROD_CST_SAIDA_PIS: TStringField
      FieldName = 'PROD_CST_SAIDA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsProdutosPROD_ALIQUOTA_PIS: TFMTBCDField
      FieldName = 'PROD_ALIQUOTA_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsProdutosPROD_CST_ENTRADA_COFINS: TStringField
      FieldName = 'PROD_CST_ENTRADA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsProdutosPROD_CST_SAIDA_COFINS: TStringField
      FieldName = 'PROD_CST_SAIDA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsProdutosPROD_ALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'PROD_ALIQUOTA_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsProdutosPROD_REGIME_TRIBUTARIO: TStringField
      FieldName = 'PROD_REGIME_TRIBUTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPROD_GENE_EMPR_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_EMPR_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsProdutosPROD_GENE_TGEN_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_TGEN_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsProdutosPROD_GENE_ID_UNID: TIntegerField
      FieldName = 'PROD_GENE_ID_UNID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 250
    end
    object cdsProdutosUNID: TStringField
      FieldName = 'UNID'
      ProviderFlags = []
      Size = 250
    end
    object cdsProdutosPROD_PESO_LIQUIDO: TFMTBCDField
      FieldName = 'PROD_PESO_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsProdutosPROD_COD_FORN1: TIntegerField
      FieldName = 'PROD_COD_FORN1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COD_FORN2: TIntegerField
      FieldName = 'PROD_COD_FORN2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COD_FORN3: TIntegerField
      FieldName = 'PROD_COD_FORN3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_COD_FORN4: TIntegerField
      FieldName = 'PROD_COD_FORN4'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_DURACAO: TIntegerField
      FieldName = 'PROD_DURACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsProdutosPROD_PERIODO_RETORNO: TStringField
      FieldName = 'PROD_PERIODO_RETORNO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
  end
  object qryPesqFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FORN_ID,'
      '      FORN_NOME_FANTASIA,'
      '      FORN_RAZAO_SOCIAL,'
      '      FORN_CNPJ_CPF'
      'FROM  FORNECEDORES'
      'ORDER BY FORN_NOME_FANTASIA')
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 40
  end
  object dspPesqFornec: TDataSetProvider
    DataSet = qryPesqFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 88
  end
  object cdsPesqFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqFornec'
    Left = 192
    Top = 136
    object cdsPesqFornecFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'FORN_ID'
    end
    object cdsPesqFornecFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      DisplayWidth = 15
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 15
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqFornecFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 15
      FieldName = 'FORN_CNPJ_CPF'
      Size = 18
    end
  end
  object qryPesqTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 10')
    SQLConnection = dmConexao.dbConexao
    Left = 296
    Top = 40
  end
  object dspPesqTipo: TDataSetProvider
    DataSet = qryPesqTipo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 88
  end
  object cdsPesqTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipo'
    Left = 296
    Top = 136
    object cdsPesqTipoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
    end
    object cdsPesqTipoGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 503')
    SQLConnection = dmConexao.dbConexao
    Left = 400
    Top = 40
  end
  object dspPesqGrupo: TDataSetProvider
    DataSet = qryPesqGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 400
    Top = 88
  end
  object cdsPesqGrupo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqGrupo'
    Left = 400
    Top = 136
    object cdsPesqGrupoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqGrupoGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqMarca: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 504')
    SQLConnection = dmConexao.dbConexao
    Left = 504
    Top = 40
  end
  object dspPesqMarca: TDataSetProvider
    DataSet = qryPesqMarca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 504
    Top = 88
  end
  object cdsPesqMarca: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqMarca'
    Left = 504
    Top = 136
    object cdsPesqMarcaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqMarcaGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqModelo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 507')
    SQLConnection = dmConexao.dbConexao
    Left = 616
    Top = 40
  end
  object dspPesqModelo: TDataSetProvider
    DataSet = qryPesqModelo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 616
    Top = 88
  end
  object cdsPesqModelo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqModelo'
    Left = 616
    Top = 136
    object cdsPesqModeloGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqModeloGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqAliq: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 508')
    SQLConnection = dmConexao.dbConexao
    Left = 720
    Top = 40
  end
  object dspPesqAliq: TDataSetProvider
    DataSet = qryPesqAliq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 88
  end
  object cdsPesqAliq: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqAliq'
    Left = 720
    Top = 136
    object cdsPesqAliqGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqAliqGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqAliqGENE_PAR1: TStringField
      DisplayLabel = 'ICMS'
      DisplayWidth = 15
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object qryCodBarras: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
      '      CB.PRCB_ID,'
      '      CB.PRCB_EMPR_ID,'
      '      CB.PRCB_PROD_ID,'
      '      CB.PRCB_PROD_EMPR_ID,'
      '      CB.PRCB_COD_BARRA,'
      '      CB.PRCB_DTA_CADASTRO,'
      '      CB.PRCB_USER_ID'
      'FROM  PRODUTOS_BAR CB'
      'WHERE CB.PRCB_EMPR_ID      = :EMPR_ID'
      'AND   CB.PRCB_PROD_ID      = :PROD_ID'
      'AND   CB.PRCB_PROD_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 248
    object qryCodBarrasPRCB_ID: TIntegerField
      FieldName = 'PRCB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryCodBarrasPRCB_EMPR_ID: TIntegerField
      FieldName = 'PRCB_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryCodBarrasPRCB_PROD_ID: TIntegerField
      FieldName = 'PRCB_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryCodBarrasPRCB_PROD_EMPR_ID: TIntegerField
      FieldName = 'PRCB_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryCodBarrasPRCB_COD_BARRA: TStringField
      FieldName = 'PRCB_COD_BARRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
    object qryCodBarrasPRCB_DTA_CADASTRO: TDateField
      FieldName = 'PRCB_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryCodBarrasPRCB_USER_ID: TIntegerField
      FieldName = 'PRCB_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspCodBarras: TDataSetProvider
    DataSet = qryCodBarras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 296
  end
  object dsCodBarras: TDataSource
    DataSet = cdsCodBarras
    Left = 72
    Top = 392
  end
  object cdsCodBarras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspCodBarras'
    OnNewRecord = cdsCodBarrasNewRecord
    OnReconcileError = cdsCodBarrasReconcileError
    Left = 72
    Top = 344
    object cdsCodBarrasPRCB_COD_BARRA: TStringField
      DisplayLabel = 'C'#243'd. Barras'
      FieldName = 'PRCB_COD_BARRA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsCodBarrasPRCB_ID: TIntegerField
      FieldName = 'PRCB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsCodBarrasPRCB_EMPR_ID: TIntegerField
      FieldName = 'PRCB_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsCodBarrasPRCB_PROD_ID: TIntegerField
      FieldName = 'PRCB_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsCodBarrasPRCB_PROD_EMPR_ID: TIntegerField
      FieldName = 'PRCB_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsCodBarrasPRCB_DTA_CADASTRO: TDateField
      FieldName = 'PRCB_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsCodBarrasPRCB_USER_ID: TIntegerField
      FieldName = 'PRCB_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object qryPesqProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  PRODUTOS PR'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PR.PROD_EMPR_ID          = :EMPR_ID'
      'AND   PR.PROD_ID              <> :PROD_ID'
      'AND   PR.PROD_GENE_ID_TP_PROD IN (1,4)'
      'AND   PR.PROD_ATIVO = 1'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 808
    Top = 40
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = qryPesqProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 808
    Top = 88
  end
  object cdsPesqProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROD_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProdutos'
    Left = 808
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
  end
  object qryComposicaoProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
      '      PC.PRCP_ID,'
      '      PC.PRCP_EMPR_ID,'
      '      PC.PRCP_PROD_ID,'
      '      PC.PRCP_PROD_EMPR_ID,'
      '      PC.PRCP_PROD_ID_COMP,'
      '      PC.PRCP_PROD_EMPR_ID_COMP,'
      '      PC.PRCP_QTDE,'
      '      PC.PRCP_DTA_CADASTRO,'
      '      PC.PRCP_USER_ID,'
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
      'LEFT OUTER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PC.PRCP_EMPR_ID      = :EMPR_ID'
      'AND   PC.PRCP_PROD_ID      = :PROD_ID'
      'AND   PC.PRCP_PROD_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 248
    object qryComposicaoProdPRCP_ID: TIntegerField
      FieldName = 'PRCP_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryComposicaoProdPRCP_EMPR_ID: TIntegerField
      FieldName = 'PRCP_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryComposicaoProdPRCP_PROD_ID: TIntegerField
      FieldName = 'PRCP_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryComposicaoProdPRCP_PROD_EMPR_ID: TIntegerField
      FieldName = 'PRCP_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryComposicaoProdPRCP_PROD_ID_COMP: TIntegerField
      FieldName = 'PRCP_PROD_ID_COMP'
      ProviderFlags = [pfInUpdate]
    end
    object qryComposicaoProdPRCP_PROD_EMPR_ID_COMP: TIntegerField
      FieldName = 'PRCP_PROD_EMPR_ID_COMP'
      ProviderFlags = [pfInUpdate]
    end
    object qryComposicaoProdPRCP_QTDE: TFMTBCDField
      FieldName = 'PRCP_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryComposicaoProdPRCP_DTA_CADASTRO: TDateField
      FieldName = 'PRCP_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryComposicaoProdPRCP_USER_ID: TIntegerField
      FieldName = 'PRCP_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryComposicaoProdPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryComposicaoProdPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryComposicaoProdGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryComposicaoProdMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryComposicaoProdMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspComposicaoProd: TDataSetProvider
    DataSet = qryComposicaoProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 296
  end
  object dsComposicaoProd: TDataSource
    DataSet = cdsComposicaoProd
    Left = 192
    Top = 392
  end
  object cdsComposicaoProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspComposicaoProd'
    OnNewRecord = cdsComposicaoProdNewRecord
    OnReconcileError = cdsComposicaoProdReconcileError
    Left = 192
    Top = 344
    object cdsComposicaoProdPRCP_PROD_ID_COMP: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 10
      FieldName = 'PRCP_PROD_ID_COMP'
      ProviderFlags = [pfInUpdate]
    end
    object cdsComposicaoProdPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 60
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsComposicaoProdPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsComposicaoProdPRCP_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 9
      FieldName = 'PRCP_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.0000'
      Precision = 20
      Size = 4
    end
    object cdsComposicaoProdGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 20
      FieldName = 'GRUPO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsComposicaoProdMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsComposicaoProdMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsComposicaoProdPRCP_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsComposicaoProdPRCP_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsComposicaoProdPRCP_PROD_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsComposicaoProdPRCP_PROD_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsComposicaoProdPRCP_PROD_EMPR_ID_COMP: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_PROD_EMPR_ID_COMP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsComposicaoProdPRCP_DTA_CADASTRO: TDateField
      DisplayWidth = 15
      FieldName = 'PRCP_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsComposicaoProdPRCP_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PRCP_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object qryTabelasPreco: TSQLQuery
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
      '      CASE TP.TPRC_ATIVO'
      '        WHEN 0 THEN '#39'Inativo'#39
      '        WHEN 1 THEN '#39'Ativo'#39
      '      END AS TPRC_ATIVO,'
      '      TP.TPRC_DESCRICAO,'
      '      TI.TPIT_DTA_VIGENCIA,'
      '      TI.TPIT_DTA_VALIDADE,'
      '      TI.TPIT_VLR_GONDOLA,'
      '      TI.TPIT_VLR_MINIMO,'
      '      TI.TPIT_VLR_ESPECIAL,'
      '      TI.TPIT_VLR_ATACADO'
      'FROM  TABELA_PRECO TP'
      'INNER JOIN TABELA_PRECO_ITENS TI'
      'ON (TI.TPIT_TPRC_ID      = TP.TPRC_ID'
      'AND TI.TPIT_TPRC_EMPR_ID = TP.TPRC_EMPR_ID)'
      'WHERE TPIT_PROD_ID      = :PROD_ID'
      'AND   TPIT_PROD_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 304
    Top = 248
  end
  object dspTabelasPreco: TDataSetProvider
    DataSet = qryTabelasPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 296
  end
  object dsTabelasPreco: TDataSource
    DataSet = cdsTabelasPreco
    Left = 304
    Top = 392
  end
  object cdsTabelasPreco: TClientDataSet
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
    ProviderName = 'dspTabelasPreco'
    OnNewRecord = cdsComposicaoProdNewRecord
    OnReconcileError = cdsComposicaoProdReconcileError
    Left = 304
    Top = 344
    object cdsTabelasPrecoTPRC_ATIVO: TStringField
      DisplayLabel = 'Status'
      FieldName = 'TPRC_ATIVO'
      FixedChar = True
      Size = 7
    end
    object cdsTabelasPrecoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      DisplayWidth = 25
      FieldName = 'TPRC_DESCRICAO'
      Size = 100
    end
    object cdsTabelasPrecoTPIT_DTA_VIGENCIA: TDateField
      DisplayLabel = 'Dt. Vig'#234'ncia'
      FieldName = 'TPIT_DTA_VIGENCIA'
    end
    object cdsTabelasPrecoTPIT_DTA_VALIDADE: TDateField
      DisplayLabel = 'Dt. Validade'
      FieldName = 'TPIT_DTA_VALIDADE'
    end
    object cdsTabelasPrecoTPIT_VLR_GONDOLA: TFMTBCDField
      DisplayLabel = 'Vlr. Gondola'
      DisplayWidth = 12
      FieldName = 'TPIT_VLR_GONDOLA'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTabelasPrecoTPIT_VLR_MINIMO: TFMTBCDField
      DisplayLabel = 'Vlr. Minimo'
      DisplayWidth = 12
      FieldName = 'TPIT_VLR_MINIMO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTabelasPrecoTPIT_VLR_ESPECIAL: TFMTBCDField
      DisplayLabel = 'Vlr. Especial'
      DisplayWidth = 12
      FieldName = 'TPIT_VLR_ESPECIAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTabelasPrecoTPIT_VLR_ATACADO: TFMTBCDField
      DisplayLabel = 'Vlr. Atacado'
      DisplayWidth = 12
      FieldName = 'TPIT_VLR_ATACADO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
  end
  object qryProdutosCodFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
      '      CF.PRCF_ID,'
      '      CF.PRCF_EMPR_ID,'
      '      CF.PRCF_PROD_ID,'
      '      CF.PRCF_PROD_EMPR_ID,'
      '      CF.PRCF_FORN_ID,'
      '      CF.PRCF_CODFORN_ID,'
      '      CF.PRCF_DTA_CADASTRO,'
      '      CF.PRCF_USER_ID,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      FN.FORN_NOME_FANTASIA'
      'FROM  PRODUTOS_COD_FORNEC CF'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = CF.PRCF_FORN_ID)'
      'WHERE CF.PRCF_EMPR_ID      = :EMPR_ID'
      'AND   CF.PRCF_PROD_ID      = :PROD_ID'
      'AND   CF.PRCF_PROD_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 408
    Top = 248
    object qryProdutosCodFornecPRCF_ID: TIntegerField
      FieldName = 'PRCF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosCodFornecPRCF_EMPR_ID: TIntegerField
      FieldName = 'PRCF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosCodFornecPRCF_PROD_ID: TIntegerField
      FieldName = 'PRCF_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosCodFornecPRCF_PROD_EMPR_ID: TIntegerField
      FieldName = 'PRCF_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosCodFornecPRCF_FORN_ID: TIntegerField
      FieldName = 'PRCF_FORN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosCodFornecPRCF_CODFORN_ID: TIntegerField
      FieldName = 'PRCF_CODFORN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryProdutosCodFornecPRCF_DTA_CADASTRO: TDateField
      FieldName = 'PRCF_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryProdutosCodFornecPRCF_USER_ID: TIntegerField
      FieldName = 'PRCF_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryProdutosCodFornecFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object qryProdutosCodFornecFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
  end
  object dspProdutosCodFornec: TDataSetProvider
    DataSet = qryProdutosCodFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 296
  end
  object dsProdutosCodFornec: TDataSource
    DataSet = cdsProdutosCodFornec
    Left = 408
    Top = 392
  end
  object cdsProdutosCodFornec: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspProdutosCodFornec'
    OnNewRecord = cdsProdutosCodFornecNewRecord
    Left = 408
    Top = 344
    object cdsProdutosCodFornecPRCF_ID: TIntegerField
      FieldName = 'PRCF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosCodFornecPRCF_EMPR_ID: TIntegerField
      FieldName = 'PRCF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosCodFornecPRCF_PROD_ID: TIntegerField
      FieldName = 'PRCF_PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosCodFornecPRCF_PROD_EMPR_ID: TIntegerField
      FieldName = 'PRCF_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosCodFornecPRCF_FORN_ID: TIntegerField
      FieldName = 'PRCF_FORN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsProdutosCodFornecPRCF_DTA_CADASTRO: TDateField
      FieldName = 'PRCF_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosCodFornecPRCF_CODFORN_ID: TIntegerField
      FieldName = 'PRCF_CODFORN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosCodFornecPRCF_USER_ID: TIntegerField
      FieldName = 'PRCF_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosCodFornecFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object cdsProdutosCodFornecFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
  end
end
