inherited dmAliquotas: TdmAliquotas
  OldCreateOrder = True
  object qryAliquotas: TSQLQuery
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
      '      GENE_PAR1,'
      '      GENE_USER_ID,'
      '      GENE_DTA_CADASTRO'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 508'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 56
    object qryAliquotasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAliquotasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAliquotasGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAliquotasGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryAliquotasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryAliquotasGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAliquotasGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspAliquotas: TDataSetProvider
    DataSet = qryAliquotas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 104
  end
  object cdsAliquotas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAliquotas'
    BeforeDelete = cdsAliquotasBeforeDelete
    OnNewRecord = cdsAliquotasNewRecord
    OnReconcileError = cdsAliquotasReconcileError
    Left = 88
    Top = 152
    object cdsAliquotasGENE_EMPR_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAliquotasGENE_TGEN_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAliquotasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsAliquotasGENE_DESCR: TStringField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAliquotasGENE_PAR1: TStringField
      DisplayLabel = 'ICMS'
      DisplayWidth = 15
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsAliquotasGENE_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAliquotasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsAliquotas: TDataSource
    DataSet = cdsAliquotas
    Left = 88
    Top = 200
  end
end
