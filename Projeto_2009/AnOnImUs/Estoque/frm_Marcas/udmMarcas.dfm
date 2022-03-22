inherited dmMarcas: TdmMarcas
  OldCreateOrder = True
  Height = 661
  Width = 1011
  object qryMarcas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_USER_ID,'
      '      GENE_DTA_CADASTRO'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 504'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 56
    object qryMarcasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMarcasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMarcasGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryMarcasGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryMarcasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryMarcasGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMarcas: TDataSetProvider
    DataSet = qryMarcas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 104
  end
  object cdsMarcas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspMarcas'
    BeforeDelete = cdsMarcasBeforeDelete
    OnNewRecord = cdsMarcasNewRecord
    OnReconcileError = cdsMarcasReconcileError
    Left = 88
    Top = 152
    object cdsMarcasGENE_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMarcasGENE_TGEN_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMarcasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMarcasGENE_DESCR: TStringField
      DisplayLabel = 'Marca do Produtos'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsMarcasGENE_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMarcasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsMarcas: TDataSource
    DataSet = cdsMarcas
    Left = 88
    Top = 200
  end
end
