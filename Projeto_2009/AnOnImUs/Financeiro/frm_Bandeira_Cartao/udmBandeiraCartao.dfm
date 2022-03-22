inherited dmBandeiraCartao: TdmBandeiraCartao
  OldCreateOrder = True
  object dspBandeiras: TDataSetProvider
    DataSet = qryBandeiras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsBandeiras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBandeiras'
    BeforeDelete = cdsBandeirasBeforeDelete
    OnNewRecord = cdsBandeirasNewRecord
    OnReconcileError = cdsBandeirasReconcileError
    Left = 72
    Top = 144
    object cdsBandeirasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsBandeirasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsBandeirasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBandeirasGENE_DESCR: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object cdsBandeirasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      Required = True
    end
    object cdsBandeirasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      Required = True
      Visible = False
    end
  end
  object dsBandeiras: TDataSource
    DataSet = cdsBandeiras
    Left = 72
    Top = 192
  end
  object qryBandeiras: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_USER_ID'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 14'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryBandeirasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryBandeirasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryBandeirasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBandeirasGENE_DESCR: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object qryBandeirasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      Required = True
    end
    object qryBandeirasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      Required = True
      Visible = False
    end
  end
end
