inherited dmRegioes: TdmRegioes
  OldCreateOrder = True
  object dspRegioes: TDataSetProvider
    DataSet = qryRegioes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsRegioes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspRegioes'
    BeforeDelete = cdsRegioesBeforeDelete
    OnNewRecord = cdsRegioesNewRecord
    OnReconcileError = cdsRegioesReconcileError
    Left = 72
    Top = 144
    object cdsRegioesGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsRegioesGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsRegioesGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegioesGENE_DESCR: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Size = 250
    end
    object cdsRegioesGENE_PAR1: TStringField
      DisplayLabel = 'KM (Total)'
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Size = 250
    end
    object cdsRegioesGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = []
      Required = True
    end
    object cdsRegioesGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = []
      Required = True
      Visible = False
    end
  end
  object dsRegioes: TDataSource
    DataSet = cdsRegioes
    Left = 72
    Top = 192
  end
  object qryRegioes: TSQLQuery
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
      '      GENE_DTA_CADASTRO,'
      '      GENE_USER_ID'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 514'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryRegioesGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryRegioesGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryRegioesGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRegioesGENE_DESCR: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryRegioesGENE_PAR1: TStringField
      DisplayLabel = 'KM (Total)'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryRegioesGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryRegioesGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
end
