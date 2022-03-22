object dmRel_Contas_Receber_X_Pagar: TdmRel_Contas_Receber_X_Pagar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 825
  Width = 1118
  object qryRel_Contas_Pagar: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      '#39'Pagar'#39' AS TIPO,'
      '      CP.CPAG_ID,'
      '      CP.CPAG_EMPR_ID,'
      '      CP.CPAG_NR_DOC,'
      '      CP.CPAG_PROVENIENTE,'
      '      CP.CPAG_FORN_ID,'
      '      CP.CPAG_PLCT_ID,'
      '      CP.CPAG_PLCT_EMPR_ID,'
      '      CP.CPAG_DTA_EMISSAO,'
      '      CP.CPAG_DTA_VCTO,'
      '      CP.CPAG_DTA_PGTO,'
      '      CP.CPAG_VALOR_DOC,'
      '      CP.CPAG_VALOR_JUROS,'
      '      CP.CPAG_VALOR_MORA,'
      '      CP.CPAG_STATUS,'
      '      CP.CPAG_VALOR_PAGO,'
      '      CP.CPAG_GENE_EMPR_ID_TIPO_DOC,'
      '      CP.CPAG_GENE_TGEN_ID_TIPO_DOC,'
      '      CP.CPAG_GENE_ID_TIPO_DOC,'
      '      CP.CPAG_OBS,'
      '      CP.CPAG_USER_ID_CANC,'
      '      CP.CPAG_DTA_CANC,'
      '      CP.CPAG_MOTIVO_CANC,'
      '      CP.CPAG_DTA_CADASTRO,'
      '      CP.CPAG_USER_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      PL.PLCT_TIPO,'
      '      CASE CP.CPAG_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      UC.USER_LOGIN USER_CANCEL,'
      '      CP.CPAG_DTA_EFETIVO'
      'FROM  CONTAS_PAGAR CP'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = CP.CPAG_FORN_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID      = CP.CPAG_PLCT_ID'
      'AND PL.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC'
      'AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC'
      'AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)'
      'LEFT OUTER JOIN USUARIO UC'
      'ON (UC.USER_ID = CP.CPAG_USER_ID_CANC)')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 56
  end
  object dspRel_Contas_Pagar: TDataSetProvider
    DataSet = qryRel_Contas_Pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 104
  end
  object cdsRel_Contas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Contas_Pagar'
    Left = 96
    Top = 152
    object cdsRel_Contas_PagarCPAG_ID: TIntegerField
      FieldName = 'CPAG_ID'
    end
    object cdsRel_Contas_PagarCPAG_EMPR_ID: TIntegerField
      FieldName = 'CPAG_EMPR_ID'
    end
    object cdsRel_Contas_PagarCPAG_NR_DOC: TStringField
      FieldName = 'CPAG_NR_DOC'
    end
    object cdsRel_Contas_PagarCPAG_PROVENIENTE: TStringField
      FieldName = 'CPAG_PROVENIENTE'
      Size = 250
    end
    object cdsRel_Contas_PagarCPAG_FORN_ID: TIntegerField
      FieldName = 'CPAG_FORN_ID'
    end
    object cdsRel_Contas_PagarCPAG_PLCT_ID: TIntegerField
      FieldName = 'CPAG_PLCT_ID'
    end
    object cdsRel_Contas_PagarCPAG_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CPAG_PLCT_EMPR_ID'
    end
    object cdsRel_Contas_PagarCPAG_DTA_EMISSAO: TDateField
      FieldName = 'CPAG_DTA_EMISSAO'
    end
    object cdsRel_Contas_PagarCPAG_DTA_VCTO: TDateField
      FieldName = 'CPAG_DTA_VCTO'
    end
    object cdsRel_Contas_PagarCPAG_DTA_PGTO: TDateField
      FieldName = 'CPAG_DTA_PGTO'
    end
    object cdsRel_Contas_PagarCPAG_STATUS: TStringField
      FieldName = 'CPAG_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Contas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_EMPR_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_TGEN_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_OBS: TBlobField
      FieldName = 'CPAG_OBS'
      Size = 1
    end
    object cdsRel_Contas_PagarCPAG_USER_ID_CANC: TIntegerField
      FieldName = 'CPAG_USER_ID_CANC'
    end
    object cdsRel_Contas_PagarCPAG_DTA_CANC: TDateField
      FieldName = 'CPAG_DTA_CANC'
    end
    object cdsRel_Contas_PagarCPAG_MOTIVO_CANC: TStringField
      FieldName = 'CPAG_MOTIVO_CANC'
      Size = 50
    end
    object cdsRel_Contas_PagarCPAG_DTA_CADASTRO: TDateField
      FieldName = 'CPAG_DTA_CADASTRO'
    end
    object cdsRel_Contas_PagarCPAG_USER_ID: TIntegerField
      FieldName = 'CPAG_USER_ID'
    end
    object cdsRel_Contas_PagarFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsRel_Contas_PagarPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_Contas_PagarPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsRel_Contas_PagarPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Contas_PagarSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object cdsRel_Contas_PagarTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      Size = 50
    end
    object cdsRel_Contas_PagarUSER_CANCEL: TStringField
      FieldName = 'USER_CANCEL'
      FixedChar = True
      Size = 8
    end
    object cdsRel_Contas_PagarCPAG_VALOR_DOC: TFMTBCDField
      FieldName = 'CPAG_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_JUROS: TFMTBCDField
      FieldName = 'CPAG_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_MORA: TFMTBCDField
      FieldName = 'CPAG_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_PAGO: TFMTBCDField
      FieldName = 'CPAG_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
    end
    object cdsRel_Contas_PagarTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object dsRel_Contas_Pagar: TDataSource
    DataSet = cdsRel_Contas_Pagar
    Left = 96
    Top = 200
  end
  object dspRel_Contas_Receber: TDataSetProvider
    DataSet = qryRel_Contas_Receber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 256
    Top = 104
  end
  object cdsRel_Contas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Contas_Receber'
    Left = 256
    Top = 152
    object cdsRel_Contas_ReceberCREC_ID: TIntegerField
      FieldName = 'CREC_ID'
    end
    object cdsRel_Contas_ReceberCREC_EMPR_ID: TIntegerField
      FieldName = 'CREC_EMPR_ID'
    end
    object cdsRel_Contas_ReceberCREC_NR_DOC: TStringField
      FieldName = 'CREC_NR_DOC'
    end
    object cdsRel_Contas_ReceberCREC_PROVENIENTE: TStringField
      FieldName = 'CREC_PROVENIENTE'
      Size = 50
    end
    object cdsRel_Contas_ReceberCREC_CLIE_ID: TIntegerField
      FieldName = 'CREC_CLIE_ID'
    end
    object cdsRel_Contas_ReceberCREC_CLIE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CLIE_EMPR_ID'
    end
    object cdsRel_Contas_ReceberCREC_PLCT_ID: TIntegerField
      FieldName = 'CREC_PLCT_ID'
    end
    object cdsRel_Contas_ReceberCREC_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
    end
    object cdsRel_Contas_ReceberCREC_DTA_EMISSAO: TDateField
      FieldName = 'CREC_DTA_EMISSAO'
    end
    object cdsRel_Contas_ReceberCREC_DTA_VCTO: TDateField
      FieldName = 'CREC_DTA_VCTO'
    end
    object cdsRel_Contas_ReceberCREC_DTA_PGTO: TDateField
      FieldName = 'CREC_DTA_PGTO'
    end
    object cdsRel_Contas_ReceberCREC_STATUS: TStringField
      FieldName = 'CREC_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Contas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
    end
    object cdsRel_Contas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
    end
    object cdsRel_Contas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
    end
    object cdsRel_Contas_ReceberCREC_OBS: TBlobField
      FieldName = 'CREC_OBS'
      Size = 1
    end
    object cdsRel_Contas_ReceberCREC_USER_ID_CANC: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
    end
    object cdsRel_Contas_ReceberCREC_DTA_CANC: TDateField
      FieldName = 'CREC_DTA_CANC'
    end
    object cdsRel_Contas_ReceberCREC_MOTIVO_CANC: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      Size = 50
    end
    object cdsRel_Contas_ReceberCREC_DTA_CADASTRO: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
    end
    object cdsRel_Contas_ReceberCREC_USER_ID: TIntegerField
      FieldName = 'CREC_USER_ID'
    end
    object cdsRel_Contas_ReceberCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsRel_Contas_ReceberPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_Contas_ReceberPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsRel_Contas_ReceberSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object cdsRel_Contas_ReceberTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      Size = 50
    end
    object cdsRel_Contas_ReceberUSER_CANC: TStringField
      FieldName = 'USER_CANC'
      FixedChar = True
      Size = 8
    end
    object cdsRel_Contas_ReceberCREC_VALOR_DOC: TFMTBCDField
      FieldName = 'CREC_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_ReceberCREC_VALOR_JUROS: TFMTBCDField
      FieldName = 'CREC_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_ReceberCREC_VALOR_MORA: TFMTBCDField
      FieldName = 'CREC_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_ReceberCREC_VALOR_PAGO: TFMTBCDField
      FieldName = 'CREC_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_ReceberCREC_DTA_EFETIVO: TDateField
      FieldName = 'CREC_DTA_EFETIVO'
    end
    object cdsRel_Contas_ReceberTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 7
    end
  end
  object dsRel_Contas_Receber: TDataSource
    DataSet = cdsRel_Contas_Receber
    Left = 256
    Top = 200
  end
  object qryRel_Contas_Receber: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      '#39'Receber'#39' AS TIPO,'
      '      CR.CREC_ID,'
      '      CR.CREC_EMPR_ID,'
      '      CR.CREC_NR_DOC,'
      '      CR.CREC_PROVENIENTE,'
      '      CR.CREC_CLIE_ID,'
      '      CR.CREC_CLIE_EMPR_ID,'
      '      CR.CREC_PLCT_ID,'
      '      CR.CREC_PLCT_EMPR_ID,'
      '      CR.CREC_DTA_EMISSAO,'
      '      CR.CREC_DTA_VCTO,'
      '      CR.CREC_DTA_PGTO,'
      '      CR.CREC_VALOR_DOC,'
      '      CR.CREC_VALOR_JUROS,'
      '      CR.CREC_VALOR_MORA,'
      '      CR.CREC_STATUS,'
      '      CR.CREC_VALOR_PAGO,'
      '      CR.CREC_GENE_EMPR_ID_TIPO_DOC,'
      '      CR.CREC_GENE_TGEN_ID_TIPO_DOC,'
      '      CR.CREC_GENE_ID_TIPO_DOC,'
      '      CR.CREC_OBS,'
      '      CR.CREC_USER_ID_CANC,'
      '      CR.CREC_DTA_CANC,'
      '      CR.CREC_MOTIVO_CANC,'
      '      CR.CREC_DTA_CADASTRO,'
      '      CR.CREC_USER_ID,'
      '      CL.CLIE_FANTASIA,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      CASE CR.CREC_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      UC.USER_LOGIN USER_CANC,'
      '      CR.CREC_DTA_EFETIVO'
      'FROM  CONTAS_RECEBER CR'
      'INNER JOIN CLIENTES CL'
      'ON (CL.CLIE_ID      = CR.CREC_CLIE_ID'
      'AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID      = CR.CREC_PLCT_ID'
      'AND PL.PLCT_EMPR_ID = CR.CREC_PLCT_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CR.CREC_GENE_EMPR_ID_TIPO_DOC'
      'AND TP.GENE_TGEN_ID = CR.CREC_GENE_TGEN_ID_TIPO_DOC'
      'AND TP.GENE_ID      = CR.CREC_GENE_ID_TIPO_DOC)'
      'LEFT OUTER JOIN USUARIO UC'
      'ON (UC.USER_ID      = CR.CREC_USER_ID_CANC)')
    SQLConnection = dmConexao.dbConexao
    Left = 256
    Top = 56
  end
end
