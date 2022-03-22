inherited dmModelos: TdmModelos
  OldCreateOrder = True
  object qryModelos: TSQLQuery
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
      'AND   GENE_TGEN_ID = 507'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 56
    object qryModelosGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryModelosGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryModelosGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryModelosGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryModelosGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryModelosGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspModelos: TDataSetProvider
    DataSet = qryModelos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 104
  end
  object cdsModelos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspModelos'
    BeforeDelete = cdsModelosBeforeDelete
    OnNewRecord = cdsModelosNewRecord
    OnReconcileError = cdsModelosReconcileError
    Left = 88
    Top = 152
    object cdsModelosGENE_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsModelosGENE_TGEN_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsModelosGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsModelosGENE_DESCR: TStringField
      DisplayLabel = 'Modelo do Produto'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsModelosGENE_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsModelosGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsModelos: TDataSource
    DataSet = cdsModelos
    Left = 88
    Top = 200
  end
end
