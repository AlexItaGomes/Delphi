inherited dmFiltros: TdmFiltros
  OldCreateOrder = True
  object qryFiltros: TSQLQuery
    MaxBlobSize = 1
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
      '      GENE_IMAGE,'
      '      GENE_USER_ID,'
      '      GENE_DTA_CADASTRO'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 520'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 56
    object qryFiltrosGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFiltrosGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFiltrosGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFiltrosGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryFiltrosGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryFiltrosGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryFiltrosGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      Visible = False
      Size = 1
    end
  end
  object dspFiltros: TDataSetProvider
    DataSet = qryFiltros
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 104
  end
  object cdsFiltros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFiltros'
    BeforeDelete = cdsFiltrosBeforeDelete
    OnNewRecord = cdsFiltrosNewRecord
    OnReconcileError = cdsFiltrosReconcileError
    Left = 88
    Top = 152
    object cdsFiltrosGENE_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsFiltrosGENE_TGEN_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsFiltrosGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFiltrosGENE_DESCR: TStringField
      DisplayLabel = 'Filtro'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFiltrosGENE_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsFiltrosGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFiltrosGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      Visible = False
      Size = 1
    end
  end
  object dsFiltros: TDataSource
    DataSet = cdsFiltros
    Left = 88
    Top = 200
  end
end
