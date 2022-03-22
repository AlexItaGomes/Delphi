object dmRel_Abc_Financas: TdmRel_Abc_Financas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 822
  Width = 1121
  object qryRel_ABC_Financas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      SUM(AC.ACPG_VALOR_DOC * -1) AS VALOR'
      'FROM  CONTAS_PAGAR CP'
      'INNER JOIN CONTAS_PAGAR_ACERTOS AC'
      'ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID'
      'AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID           = CP.CPAG_PLCT_ID'
      'AND PL.PLCT_EMPR_ID      = CP.CPAG_EMPR_ID)'
      'GROUP BY'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'ORDER BY'
      '      VALOR')
    SQLConnection = dmConexao.dbConexao
    Left = 120
    Top = 88
  end
  object dspRel_ABC_Financas: TDataSetProvider
    DataSet = qryRel_ABC_Financas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 136
  end
  object cdsRel_ABC_Financas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_ABC_Financas'
    Left = 120
    Top = 184
    object cdsRel_ABC_FinancasPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_ABC_FinancasPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsRel_ABC_FinancasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
  end
  object dsRel_ABC_Financas: TDataSource
    DataSet = cdsRel_ABC_Financas
    Left = 120
    Top = 232
  end
  object qryRel_ABC_Receitas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      SUM(AC.ACRE_VALOR_DOC) AS VALOR'
      'FROM  CONTAS_RECEBER CR'
      'INNER JOIN CONTAS_RECEBER_ACERTOS AC'
      'ON (AC.ACRE_CREC_ID      = CR.CREC_ID'
      'AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID           = CR.CREC_PLCT_ID'
      'AND PL.PLCT_EMPR_ID      = CR.CREC_EMPR_ID)'
      'GROUP BY'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'ORDER BY'
      '      VALOR DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 240
    Top = 88
  end
  object dspRel_ABC_Receitas: TDataSetProvider
    DataSet = qryRel_ABC_Receitas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 136
  end
  object cdsRel_ABC_Receitas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_ABC_Receitas'
    Left = 240
    Top = 184
    object StringField1: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object StringField2: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
  end
  object dsRel_ABC_Receitas: TDataSource
    DataSet = cdsRel_ABC_Receitas
    Left = 240
    Top = 232
  end
end
