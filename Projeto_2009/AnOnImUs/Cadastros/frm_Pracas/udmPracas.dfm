object dmPracas: TdmPracas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 796
  Width = 1053
  object qryPracas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_COMENTARIO,'
      '      GENE_NUMBER1,'
      '      GENE_NUMBER2,'
      '      GENE_NUMBER3,'
      '      GENE_PAR1,'
      '      GENE_PAR2,'
      '      GENE_PAR3,'
      '      GENE_USER_ID,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_GENE_EMPR_ID_PROP,'
      '      GENE_GENE_TGEN_ID_PROP,'
      '      GENE_GENE_ID_PROD'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 152
    Top = 80
    object qryPracasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryPracasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryPracasGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryPracasGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryPracasGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object qryPracasGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryPracasGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryPracasGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryPracasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryPracasGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspPracas: TDataSetProvider
    DataSet = qryPracas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 128
  end
  object cdsPracas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPracas'
    BeforeDelete = cdsPracasBeforeDelete
    OnNewRecord = cdsPracasNewRecord
    OnReconcileError = cdsPracasReconcileError
    Left = 152
    Top = 176
    object cdsPracasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPracasGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPracasGENE_PAR2: TStringField
      DisplayLabel = 'C'#243'd. IBGE'
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPracasGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPracasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPracasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsPracasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsPracasGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object cdsPracasGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsPracasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPracasGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsPracas: TDataSource
    DataSet = cdsPracas
    Left = 152
    Top = 224
  end
end
