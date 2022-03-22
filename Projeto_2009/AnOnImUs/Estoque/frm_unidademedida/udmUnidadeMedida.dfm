inherited dmUnidadeMedida: TdmUnidadeMedida
  OldCreateOrder = True
  object dspUnidadeMedida: TDataSetProvider
    DataSet = qryUnidadeMedida
    Left = 56
    Top = 96
  end
  object cdsUnidadeMedida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeMedida'
    BeforeDelete = cdsUnidadeMedidaBeforeDelete
    OnNewRecord = cdsUnidadeMedidaNewRecord
    OnReconcileError = cdsUnidadeMedidaReconcileError
    Left = 56
    Top = 144
    object cdsUnidadeMedidaGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsUnidadeMedidaGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsUnidadeMedidaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnidadeMedidaGENE_DESCR: TStringField
      DisplayLabel = 'Unidade de Medida'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsUnidadeMedidaGENE_PAR1: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsUnidadeMedidaGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUnidadeMedidaGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsUnidadeMedida: TDataSource
    DataSet = cdsUnidadeMedida
    Left = 56
    Top = 192
  end
  object qryUnidadeMedida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT GENE_EMPR_ID,'
      '       GENE_TGEN_ID,'
      '       GENE_ID,'
      '       GENE_DESCR,'
      '       GENE_PAR1,'
      '       GENE_DTA_CADASTRO,'
      '       GENE_USER_ID'
      '  FROM GENERICA'
      ' WHERE GENE_EMPR_ID = 0'
      '   AND GENE_TGEN_ID = 519'
      ' ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 48
    object qryUnidadeMedidaGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryUnidadeMedidaGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryUnidadeMedidaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidadeMedidaGENE_DESCR: TStringField
      DisplayLabel = 'Unidade de Medida'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object qryUnidadeMedidaGENE_PAR1: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
    object qryUnidadeMedidaGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
    end
    object qryUnidadeMedidaGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      Visible = False
    end
  end
end
