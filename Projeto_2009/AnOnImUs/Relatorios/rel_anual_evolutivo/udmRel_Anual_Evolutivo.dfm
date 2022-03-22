object dmRel_Anual_Evolutivo: TdmRel_Anual_Evolutivo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 766
  Width = 1194
  object qryContas_Receber: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) AS VALOR'
      'FROM  CONTAS_RECEBER_ACERTOS AC'
      'INNER JOIN CONTAS_RECEBER CR'
      'ON (AC.ACRE_CREC_ID      = CR.CREC_ID'
      'AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID           = CR.CREC_PLCT_ID'
      'AND PL.PLCT_EMPR_ID      = CR.CREC_PLCT_EMPR_ID)'
      'GROUP BY'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'ORDER BY'
      '      PL.PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 80
  end
  object dspContas_Receber: TDataSetProvider
    DataSet = qryContas_Receber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 128
  end
  object cdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_Receber'
    Left = 96
    Top = 176
    object cdsContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsContas_ReceberPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsContas_ReceberVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 2
    end
  end
  object dsContas_Receber: TDataSource
    DataSet = cdsContas_Receber
    Left = 96
    Top = 224
  end
  object qryContas_Pagar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) AS VALOR'
      'FROM  CONTAS_PAGAR_ACERTOS AC'
      'INNER JOIN CONTAS_PAGAR CP'
      'ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID'
      'AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID           = CP.CPAG_PLCT_ID'
      'AND PL.PLCT_EMPR_ID      = CP.CPAG_PLCT_EMPR_ID)'
      'GROUP BY'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'ORDER BY'
      '      PL.PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 232
    Top = 80
  end
  object dspContas_Pagar: TDataSetProvider
    DataSet = qryContas_Pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 128
  end
  object cdsContas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_Pagar'
    Left = 232
    Top = 176
    object cdsContas_PagarPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsContas_PagarPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsContas_PagarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 2
    end
  end
  object dsContas_Pagar: TDataSource
    DataSet = cdsContas_Pagar
    Left = 232
    Top = 224
  end
end
