object dmRel_Plano_Contas: TdmRel_Plano_Contas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 741
  Width = 1099
  object qryListaPlano: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      PLCT_TIPO'
      'FROM  PLANO_CONTAS'
      'WHERE PLCT_EMPR_ID = 0'
      'AND   PLCT_ATIVO   = 1'
      'AND   PLCT_PLCT_ID IS NULL'
      'ORDER BY'
      '      PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 80
    Top = 56
  end
  object dspListaPlano: TDataSetProvider
    DataSet = qryListaPlano
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 104
  end
  object cdsListaPlano: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaPlano'
    Left = 80
    Top = 152
    object cdsListaPlanoPLCT_ID: TIntegerField
      FieldName = 'PLCT_ID'
    end
    object cdsListaPlanoPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsListaPlanoPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsListaPlanoPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsListaPlano: TDataSource
    DataSet = cdsListaPlano
    Left = 80
    Top = 200
  end
end
