object dmPlano_Contas: TdmPlano_Contas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 775
  Width = 1057
  object qryPesq_Plano: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO'
      'FROM  PLANO_CONTAS'
      'WHERE PLCT_EMPR_ID = 0'
      'AND   PLCT_ATIVO   = 1'
      'AND   PLCT_TIPO    = :TIPO'
      'AND  PLCT_SISTEMA = 0'
      'ORDER BY PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 216
    Top = 96
  end
  object dspPesq_Plano: TDataSetProvider
    DataSet = qryPesq_Plano
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 216
    Top = 144
  end
  object cdsPesq_Plano: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesq_Plano'
    Left = 216
    Top = 192
    object cdsPesq_PlanoPLCT_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PLCT_ID'
    end
    object cdsPesq_PlanoPLCT_COD_SIMPLIFICADO: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsPesq_PlanoPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
  end
  object dsPesq_Plano: TDataSource
    DataSet = cdsPesq_Plano
    Left = 216
    Top = 240
  end
  object qryPlano_Contas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       PL.PLCT_ID,'
      '       PL.PLCT_EMPR_ID,'
      '       PL.PLCT_COD_SIMPLIFICADO,'
      '       PL.PLCT_DESCRICAO,'
      '       PC.PLCT_COD_SIMPLIFICADO,'
      '       PC.PLCT_DESCRICAO,'
      '       PL.PLCT_TIPO,'
      '       PL.PLCT_ATIVO,'
      '       PL.PLCT_PLCT_ID,'
      '       PL.PLCT_PLCT_EMPR_ID,'
      '       PL.PLCT_DTA_CADASTRO,'
      '       PL.PLCT_USER_ID,'
      '       PL.PLCT_SISTEMA'
      '  FROM PLANO_CONTAS PL'
      '  LEFT OUTER JOIN PLANO_CONTAS PC'
      '    ON (PC.PLCT_ID     = PL.PLCT_PLCT_ID'
      '   AND PC.PLCT_EMPR_ID = PL.PLCT_PLCT_EMPR_ID)'
      ' WHERE PL.PLCT_EMPR_ID = 0'
      '   AND PL.PLCT_SISTEMA = 0'
      ' ORDER BY PL.PLCT_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 112
    Top = 96
    object qryPlano_ContasPLCT_ID: TIntegerField
      FieldName = 'PLCT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPlano_ContasPLCT_EMPR_ID: TIntegerField
      FieldName = 'PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPlano_ContasPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object qryPlano_ContasPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryPlano_ContasPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPlano_ContasPLCT_ATIVO: TIntegerField
      FieldName = 'PLCT_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPlano_ContasPLCT_PLCT_ID: TIntegerField
      FieldName = 'PLCT_PLCT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_ContasPLCT_PLCT_EMPR_ID: TIntegerField
      FieldName = 'PLCT_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_ContasPLCT_DTA_CADASTRO: TDateField
      FieldName = 'PLCT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPlano_ContasPLCT_USER_ID: TIntegerField
      FieldName = 'PLCT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPlano_ContasPLCT_SISTEMA: TIntegerField
      FieldName = 'PLCT_SISTEMA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPlano_ContasPLCT_COD_SIMPLIFICADO_1: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO_1'
      ProviderFlags = []
      Size = 150
    end
    object qryPlano_ContasPLCT_DESCRICAO_1: TStringField
      FieldName = 'PLCT_DESCRICAO_1'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspPlano_Contas: TDataSetProvider
    DataSet = qryPlano_Contas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 144
  end
  object cdsPlano_Contas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlano_Contas'
    BeforeDelete = cdsPlano_ContasBeforeDelete
    OnNewRecord = cdsPlano_ContasNewRecord
    OnReconcileError = cdsPlano_ContasReconcileError
    Left = 112
    Top = 192
    object cdsPlano_ContasPLCT_ID: TIntegerField
      FieldName = 'PLCT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPlano_ContasPLCT_EMPR_ID: TIntegerField
      FieldName = 'PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPlano_ContasPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsPlano_ContasPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPlano_ContasPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPlano_ContasPLCT_ATIVO: TIntegerField
      FieldName = 'PLCT_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasPLCT_PLCT_ID: TIntegerField
      FieldName = 'PLCT_PLCT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPlano_ContasPLCT_PLCT_EMPR_ID: TIntegerField
      FieldName = 'PLCT_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPlano_ContasPLCT_DTA_CADASTRO: TDateField
      FieldName = 'PLCT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasPLCT_USER_ID: TIntegerField
      FieldName = 'PLCT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasPLCT_SISTEMA: TIntegerField
      FieldName = 'PLCT_SISTEMA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasPLCT_COD_SIMPLIFICADO_1: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO_1'
      ProviderFlags = []
      Size = 150
    end
    object cdsPlano_ContasPLCT_DESCRICAO_1: TStringField
      FieldName = 'PLCT_DESCRICAO_1'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsPlano_Contas: TDataSource
    DataSet = cdsPlano_Contas
    Left = 112
    Top = 240
  end
end
