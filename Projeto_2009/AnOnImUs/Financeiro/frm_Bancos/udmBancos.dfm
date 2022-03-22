object dmBancos: TdmBancos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 818
  Width = 1096
  object qryBancos: TSQLQuery
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
      'AND   GENE_TGEN_ID = 505'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 64
    object qryBancosGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryBancosGENE_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryBancosGENE_PAR1: TStringField
      DisplayLabel = 'C'#243'd. Banc.'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryBancosGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryBancosGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryBancosGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryBancosGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object qryBancosGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryBancosGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryBancosGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryBancosGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspBancos: TDataSetProvider
    DataSet = qryBancos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 112
  end
  object cdsBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    BeforeDelete = cdsBancosBeforeDelete
    OnNewRecord = cdsBancosNewRecord
    OnReconcileError = cdsBancosReconcileError
    Left = 104
    Top = 160
    object cdsBancosGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsBancosGENE_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsBancosGENE_PAR1: TStringField
      DisplayLabel = 'C'#243'd. Banc.'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsBancosGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsBancosGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsBancosGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsBancosGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object cdsBancosGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsBancosGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsBancosGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsBancosGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsBancos: TDataSource
    DataSet = cdsBancos
    Left = 104
    Top = 208
  end
end
