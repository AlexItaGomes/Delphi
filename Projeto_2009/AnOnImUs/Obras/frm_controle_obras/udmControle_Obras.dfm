inherited dmControle_Obras: TdmControle_Obras
  OldCreateOrder = True
  Height = 587
  Width = 983
  object qryControle_Obras: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OB.OBRA_ID,'
      '      OB.OBRA_EMPR_ID,'
      '      OB.OBRA_ENG_RESPONSAVEL,'
      '      OB.OBRA_DESCRICAO,'
      '      OB.OBRA_ENDERECO,'
      '      OB.OBRA_BAIRRO,'
      '      OB.OBRA_GENE_EMPR_ID_PRACA,'
      '      OB.OBRA_GENE_TGEN_ID_PRACA,'
      '      OB.OBRA_GENE_ID_PRACA,'
      '      OB.OBRA_AREA_CONTRUIDA,'
      '      OB.OBRA_AREA_TOTAL,'
      '      OB.OBRA_VLR_INVESTIMENTO,'
      '      OB.OBRA_VLR_TOTAL,'
      '      OB.OBRA_DTA_PREV_INICIO_OBRA,'
      '      OB.OBRA_DTA_PREV_FIM_OBRA,'
      '      OB.OBRA_DTA_INICIO_OBRA,'
      '      OB.OBRA_DTA_FIM_OBRA,'
      '      OB.OBRA_STATUS,'
      '      OB.OBRA_DTA_CADASTRO,'
      '      OB.OBRA_USER_ID,'
      '      CD.GENE_DESCR           AS CIDADE,'
      '      CD.GENE_PAR1            AS UF'
      'FROM  OBRAS OB'
      'INNER JOIN GENERICA CD'
      'ON (CD.GENE_EMPR_ID   = OB.OBRA_GENE_EMPR_ID_PRACA'
      'AND CD.GENE_TGEN_ID   = OB.OBRA_GENE_TGEN_ID_PRACA'
      'AND CD.GENE_ID        = OB.OBRA_GENE_ID_PRACA)'
      'WHERE OB.OBRA_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 40
    object qryControle_ObrasOBRA_ID: TIntegerField
      FieldName = 'OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryControle_ObrasOBRA_EMPR_ID: TIntegerField
      FieldName = 'OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryControle_ObrasOBRA_ENG_RESPONSAVEL: TStringField
      FieldName = 'OBRA_ENG_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryControle_ObrasOBRA_DESCRICAO: TStringField
      FieldName = 'OBRA_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryControle_ObrasOBRA_ENDERECO: TStringField
      FieldName = 'OBRA_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryControle_ObrasOBRA_BAIRRO: TStringField
      FieldName = 'OBRA_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryControle_ObrasOBRA_AREA_CONTRUIDA: TFMTBCDField
      FieldName = 'OBRA_AREA_CONTRUIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryControle_ObrasOBRA_AREA_TOTAL: TFMTBCDField
      FieldName = 'OBRA_AREA_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryControle_ObrasOBRA_VLR_INVESTIMENTO: TFMTBCDField
      FieldName = 'OBRA_VLR_INVESTIMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryControle_ObrasOBRA_VLR_TOTAL: TFMTBCDField
      FieldName = 'OBRA_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryControle_ObrasOBRA_DTA_PREV_INICIO_OBRA: TDateField
      FieldName = 'OBRA_DTA_PREV_INICIO_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_DTA_PREV_FIM_OBRA: TDateField
      FieldName = 'OBRA_DTA_PREV_FIM_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_DTA_INICIO_OBRA: TDateField
      FieldName = 'OBRA_DTA_INICIO_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_DTA_FIM_OBRA: TDateField
      FieldName = 'OBRA_DTA_FIM_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_STATUS: TIntegerField
      FieldName = 'OBRA_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_DTA_CADASTRO: TDateField
      FieldName = 'OBRA_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_USER_ID: TIntegerField
      FieldName = 'OBRA_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object qryControle_ObrasUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object qryControle_ObrasOBRA_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
    object qryControle_ObrasOBRA_GENE_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspControle_Obras: TDataSetProvider
    DataSet = qryControle_Obras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object cdsControle_Obras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspControle_Obras'
    BeforeDelete = cdsControle_ObrasBeforeDelete
    OnNewRecord = cdsControle_ObrasNewRecord
    Left = 72
    Top = 136
    object cdsControle_ObrasOBRA_STATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'OBRA_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsControle_ObrasOBRA_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'OBRA_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Obra'
      FieldName = 'OBRA_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsControle_ObrasOBRA_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'OBRA_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsControle_ObrasOBRA_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'OBRA_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsControle_ObrasOBRA_ENG_RESPONSAVEL: TStringField
      DisplayLabel = 'Eng. Respons'#225'vel'
      FieldName = 'OBRA_ENG_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsControle_ObrasOBRA_AREA_CONTRUIDA: TFMTBCDField
      DisplayLabel = #193'rea Construida'
      FieldName = 'OBRA_AREA_CONTRUIDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsControle_ObrasOBRA_AREA_TOTAL: TFMTBCDField
      DisplayLabel = #193'rea Total'
      FieldName = 'OBRA_AREA_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsControle_ObrasOBRA_VLR_INVESTIMENTO: TFMTBCDField
      DisplayLabel = 'Vlr. Investimento'
      FieldName = 'OBRA_VLR_INVESTIMENTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsControle_ObrasOBRA_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'OBRA_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsControle_ObrasOBRA_DTA_PREV_INICIO_OBRA: TDateField
      DisplayLabel = 'Dt. Prev. Inicio'
      FieldName = 'OBRA_DTA_PREV_INICIO_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_DTA_PREV_FIM_OBRA: TDateField
      DisplayLabel = 'Dt. Prev. Fim'
      FieldName = 'OBRA_DTA_PREV_FIM_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_DTA_INICIO_OBRA: TDateField
      DisplayLabel = 'Dt. Inicio'
      FieldName = 'OBRA_DTA_INICIO_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_DTA_FIM_OBRA: TDateField
      DisplayLabel = 'Dt. Fim'
      FieldName = 'OBRA_DTA_FIM_OBRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsControle_ObrasOBRA_EMPR_ID: TIntegerField
      FieldName = 'OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsControle_ObrasOBRA_USER_ID: TIntegerField
      FieldName = 'OBRA_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsControle_ObrasCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object cdsControle_ObrasUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object cdsControle_ObrasOBRA_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsControle_ObrasOBRA_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsControle_ObrasOBRA_GENE_ID_PRACA: TIntegerField
      FieldName = 'OBRA_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsControle_Obras: TDataSource
    DataSet = cdsControle_Obras
    Left = 72
    Top = 184
  end
  object qryEtapas_Obras: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      ET.OBET_ID,'
      '      ET.OBET_EMPR_ID,'
      '      ET.OBET_OBRA_ID,'
      '      ET.OBET_OBRA_EMPR_ID,'
      '      ET.OBET_DESCRICAO,'
      '      ET.OBET_DTA_PREV_INICIO,'
      '      ET.OBET_DTA_PREV_FIM,'
      '      ET.OBET_DTA_INICIO,'
      '      ET.OBET_DTA_FIM,'
      '      ET.OBET_VLR_PREVISAO,'
      '      ET.OBET_STATUS,'
      '      ET.OBET_SEQUENCIA,'
      '      ET.OBET_SEQUENCIA_ANTERIOR,'
      '      ET.OBET_DTA_CADASTRO,'
      '      ET.OBET_USER_ID'
      'FROM  OBRAS_ETAPAS ET'
      'INNER JOIN OBRAS OB'
      'ON (OB.OBRA_ID      = ET.OBET_OBRA_ID'
      'AND OB.OBRA_EMPR_ID = ET.OBET_OBRA_EMPR_ID)'
      'WHERE ET.OBET_EMPR_ID      = :EMPR_ID'
      'AND   ET.OBET_OBRA_ID      = :OBRA_ID'
      'AND   ET.OBET_OBRA_EMPR_ID = :EMPR_ID'
      'ORDER BY '
      '      ET.OBET_SEQUENCIA')
    SQLConnection = dmConexao.dbConexao
    Left = 200
    Top = 40
    object qryEtapas_ObrasOBET_ID: TIntegerField
      FieldName = 'OBET_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEtapas_ObrasOBET_EMPR_ID: TIntegerField
      FieldName = 'OBET_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEtapas_ObrasOBET_OBRA_ID: TIntegerField
      FieldName = 'OBET_OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEtapas_ObrasOBET_OBRA_EMPR_ID: TIntegerField
      FieldName = 'OBET_OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEtapas_ObrasOBET_DESCRICAO: TStringField
      FieldName = 'OBET_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryEtapas_ObrasOBET_DTA_PREV_INICIO: TDateField
      FieldName = 'OBET_DTA_PREV_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_DTA_PREV_FIM: TDateField
      FieldName = 'OBET_DTA_PREV_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_DTA_INICIO: TDateField
      FieldName = 'OBET_DTA_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_DTA_FIM: TDateField
      FieldName = 'OBET_DTA_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_VLR_PREVISAO: TFMTBCDField
      FieldName = 'OBET_VLR_PREVISAO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryEtapas_ObrasOBET_STATUS: TIntegerField
      FieldName = 'OBET_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_SEQUENCIA: TIntegerField
      FieldName = 'OBET_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_SEQUENCIA_ANTERIOR: TIntegerField
      FieldName = 'OBET_SEQUENCIA_ANTERIOR'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_DTA_CADASTRO: TDateField
      FieldName = 'OBET_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEtapas_ObrasOBET_USER_ID: TIntegerField
      FieldName = 'OBET_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEtapas_Obras: TDataSetProvider
    DataSet = qryEtapas_Obras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 88
  end
  object cdsEtapas_Obras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEtapas_Obras'
    OnNewRecord = cdsEtapas_ObrasNewRecord
    OnReconcileError = cdsEtapas_ObrasReconcileError
    Left = 200
    Top = 136
    object cdsEtapas_ObrasOBET_STATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'OBET_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_SEQUENCIA: TIntegerField
      DisplayLabel = 'Seq.'
      DisplayWidth = 7
      FieldName = 'OBET_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 25
      FieldName = 'OBET_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsEtapas_ObrasOBET_DTA_PREV_INICIO: TDateField
      DisplayLabel = 'Dt. Prev. Inicio'
      FieldName = 'OBET_DTA_PREV_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_DTA_PREV_FIM: TDateField
      DisplayLabel = 'Dt. Prev. Fim'
      FieldName = 'OBET_DTA_PREV_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_DTA_INICIO: TDateField
      DisplayLabel = 'Dt. Inicio'
      FieldName = 'OBET_DTA_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_DTA_FIM: TDateField
      DisplayLabel = 'Dt. Fim'
      FieldName = 'OBET_DTA_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEtapas_ObrasOBET_VLR_PREVISAO: TFMTBCDField
      DisplayLabel = 'Vlr. Previs'#227'o'
      FieldName = 'OBET_VLR_PREVISAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsEtapas_ObrasOBET_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'OBET_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_EMPR_ID: TIntegerField
      FieldName = 'OBET_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_OBRA_ID: TIntegerField
      FieldName = 'OBET_OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_OBRA_EMPR_ID: TIntegerField
      FieldName = 'OBET_OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_SEQUENCIA_ANTERIOR: TIntegerField
      FieldName = 'OBET_SEQUENCIA_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_DTA_CADASTRO: TDateField
      FieldName = 'OBET_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsEtapas_ObrasOBET_USER_ID: TIntegerField
      FieldName = 'OBET_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsEtapas_Obras: TDataSource
    DataSet = cdsEtapas_Obras
    Left = 200
    Top = 184
  end
  object qryPesq_Praca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 304
    Top = 40
  end
  object dspPesq_Praca: TDataSetProvider
    DataSet = qryPesq_Praca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 88
  end
  object cdsPesq_Praca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Praca'
    Left = 304
    Top = 136
    object cdsPesq_PracaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesq_PracaGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesq_PracaGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object dsPesq_Praca: TDataSource
    DataSet = cdsPesq_Praca
    Left = 304
    Top = 184
  end
  object qryItensEtapas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBET_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OI.OBEI_ID,'
      '      OI.OBEI_EMPR_ID,'
      '      OI.OBEI_OBET_ID,'
      '      OI.OBEI_OBET_EMPR_ID,'
      '      OI.OBEI_OBET_OBRA_ID,'
      '      OI.OBEI_OBET_OBRA_EMPR_ID,'
      '      OI.OBEI_PROD_ID,'
      '      OI.OBEI_PROD_EMPR_ID,'
      '      OI.OBEI_QTDE,'
      '      OI.OBEI_VLR_UNIT,'
      '      OI.OBEI_DTA_CADASTRO,'
      '      OI.OBEI_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      PR.PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  OBRAS_ETAPAS_ITENS OI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OI.OBEI_PROD_ID'
      'AND PR.PROD_EMPR_ID = OI.OBEI_PROD_EMPR_ID)'
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
      'WHERE OI.OBEI_EMPR_ID           = :EMPR_ID'
      'AND   OI.OBEI_OBET_ID           = :OBET_ID'
      'AND   OI.OBEI_OBET_EMPR_ID      = :EMPR_ID'
      'AND   OI.OBEI_OBET_OBRA_ID      = :OBRA_ID'
      'AND   OI.OBEI_OBET_OBRA_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 408
    Top = 40
    object qryItensEtapasOBEI_ID: TIntegerField
      FieldName = 'OBEI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_EMPR_ID: TIntegerField
      FieldName = 'OBEI_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_OBET_ID: TIntegerField
      FieldName = 'OBEI_OBET_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_OBET_EMPR_ID: TIntegerField
      FieldName = 'OBEI_OBET_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_OBET_OBRA_ID: TIntegerField
      FieldName = 'OBEI_OBET_OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_OBET_OBRA_EMPR_ID: TIntegerField
      FieldName = 'OBEI_OBET_OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensEtapasOBEI_PROD_ID: TIntegerField
      FieldName = 'OBEI_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEtapasOBEI_PROD_EMPR_ID: TIntegerField
      FieldName = 'OBEI_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEtapasOBEI_QTDE: TFMTBCDField
      FieldName = 'OBEI_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensEtapasOBEI_DTA_CADASTRO: TDateField
      FieldName = 'OBEI_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEtapasOBEI_USER_ID: TIntegerField
      FieldName = 'OBEI_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensEtapasPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryItensEtapasPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryItensEtapasGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      ProviderFlags = []
      Size = 250
    end
    object qryItensEtapasMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 250
    end
    object qryItensEtapasMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 250
    end
    object qryItensEtapasPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = []
      Visible = False
    end
    object qryItensEtapasOBEI_VLR_UNIT: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      FieldName = 'OBEI_VLR_UNIT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
  end
  object dspItensEtapas: TDataSetProvider
    DataSet = qryItensEtapas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 88
  end
  object cdsItensEtapas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBET_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensEtapas'
    OnNewRecord = cdsItensEtapasNewRecord
    Left = 408
    Top = 136
    object cdsItensEtapasPROD_FLG_FRACIONADO: TIntegerField
      FieldName = 'PROD_FLG_FRACIONADO'
      ProviderFlags = []
      Visible = False
    end
    object cdsItensEtapasOBEI_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'OBEI_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensEtapasPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 52
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsItensEtapasPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsItensEtapasOBEI_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 10
      FieldName = 'OBEI_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object cdsItensEtapasOBEI_VLR_UNIT: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 12
      FieldName = 'OBEI_VLR_UNIT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensEtapasGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 20
      FieldName = 'GRUPO_PROD'
      ProviderFlags = []
      Size = 250
    end
    object cdsItensEtapasMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 250
    end
    object cdsItensEtapasMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 250
    end
    object cdsItensEtapasOBEI_ID: TIntegerField
      FieldName = 'OBEI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_EMPR_ID: TIntegerField
      FieldName = 'OBEI_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_OBET_ID: TIntegerField
      FieldName = 'OBEI_OBET_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_OBET_EMPR_ID: TIntegerField
      FieldName = 'OBEI_OBET_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_OBET_OBRA_ID: TIntegerField
      FieldName = 'OBEI_OBET_OBRA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_OBET_OBRA_EMPR_ID: TIntegerField
      FieldName = 'OBEI_OBET_OBRA_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensEtapasOBEI_PROD_EMPR_ID: TIntegerField
      FieldName = 'OBEI_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensEtapasOBEI_DTA_CADASTRO: TDateField
      FieldName = 'OBEI_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensEtapasOBEI_USER_ID: TIntegerField
      FieldName = 'OBEI_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsItensEtapas: TDataSource
    DataSet = cdsItensEtapas
    Left = 408
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
      '      PR.PROD_UNIDADE,'
      '      PR.PROD_FLG_FRACIONADO,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  PRODUTOS PR'
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
      'AND   PR.PROD_ATIVO = 1'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 528
    Top = 40
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = qryPesqProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 528
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
    Left = 528
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
  end
  object qryPesqObra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OBRA_ID,'
      '      OBRA_DESCRICAO,'
      '      OBRA_DTA_PREV_INICIO_OBRA,'
      '      OBRA_DTA_PREV_FIM_OBRA,'
      '      OBRA_DTA_INICIO_OBRA,'
      '      OBRA_DTA_FIM_OBRA'
      'FROM  OBRAS'
      'WHERE OBRA_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 632
    Top = 40
  end
  object dspPesqObra: TDataSetProvider
    DataSet = qryPesqObra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 632
    Top = 88
  end
  object cdsPesqObra: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqObra'
    Left = 632
    Top = 136
    object cdsPesqObraOBRA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'OBRA_ID'
    end
    object cdsPesqObraOBRA_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'OBRA_DESCRICAO'
      Size = 100
    end
    object cdsPesqObraOBRA_DTA_PREV_INICIO_OBRA: TDateField
      DisplayLabel = 'Dt. Prev. Inicio'
      FieldName = 'OBRA_DTA_PREV_INICIO_OBRA'
    end
    object cdsPesqObraOBRA_DTA_PREV_FIM_OBRA: TDateField
      DisplayLabel = 'Dt. Prev. Fim'
      FieldName = 'OBRA_DTA_PREV_FIM_OBRA'
    end
    object cdsPesqObraOBRA_DTA_INICIO_OBRA: TDateField
      DisplayLabel = 'Dt. Inicio Obra'
      FieldName = 'OBRA_DTA_INICIO_OBRA'
    end
    object cdsPesqObraOBRA_DTA_FIM_OBRA: TDateField
      DisplayLabel = 'Dt. Fim Obra'
      FieldName = 'OBRA_DTA_FIM_OBRA'
    end
  end
  object qryPesqSeq: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OBET_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OBET_SEQUENCIA,'
      '      OBET_DESCRICAO,'
      '      OBET_DTA_PREV_INICIO,'
      '      OBET_DTA_PREV_FIM'
      'FROM  OBRAS_ETAPAS'
      'WHERE OBET_ID          <> :OBET_ID'
      'AND   OBET_EMPR_ID      = :EMPR_ID'
      'AND   OBET_OBRA_ID      = :OBRA_ID'
      'AND   OBET_OBRA_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 728
    Top = 40
  end
  object dspPesqSeq: TDataSetProvider
    DataSet = qryPesqSeq
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 728
    Top = 88
  end
  object cdsPesqSeq: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'OBET_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBRA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqSeq'
    Left = 728
    Top = 136
    object cdsPesqSeqOBET_SEQUENCIA: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'OBET_SEQUENCIA'
    end
    object cdsPesqSeqOBET_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'OBET_DESCRICAO'
      Size = 100
    end
    object cdsPesqSeqOBET_DTA_PREV_INICIO: TDateField
      DisplayLabel = 'Dt. Prev. Inicio'
      FieldName = 'OBET_DTA_PREV_INICIO'
    end
    object cdsPesqSeqOBET_DTA_PREV_FIM: TDateField
      DisplayLabel = 'Dt. Prev. Fim'
      FieldName = 'OBET_DTA_PREV_FIM'
    end
  end
end
