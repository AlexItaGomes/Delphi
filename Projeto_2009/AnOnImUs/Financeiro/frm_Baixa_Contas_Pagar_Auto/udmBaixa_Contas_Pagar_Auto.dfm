object dmBaixa_Contas_Pagar_Auto: TdmBaixa_Contas_Pagar_Auto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 805
  Width = 1093
  object qryContas_Pagar: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
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
      '      COALESCE(CP.CPAG_VALOR_DOC,0) CPAG_VALOR_DOC,'
      '      COALESCE(CP.CPAG_VALOR_JUROS,0) CPAG_VALOR_JUROS,'
      '      COALESCE(CP.CPAG_VALOR_MORA,0) CPAG_VALOR_MORA,'
      '      CP.CPAG_STATUS,'
      '      COALESCE(CP.CPAG_VALOR_PAGO,0) CPAG_VALOR_PAGO,'
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
      '      PC.PLCT_COD_SIMPLIFICADO,'
      '      PC.PLCT_DESCRICAO,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      CASE CP.CPAG_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      CP.CPAG_DTA_EFETIVO,'
      '      CP.CPAG_PREVISAO'
      'FROM  CONTAS_PAGAR CP'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = CP.CPAG_FORN_ID)'
      'INNER JOIN PLANO_CONTAS PC'
      'ON (PC.PLCT_ID      = CP.CPAG_PLCT_ID'
      'AND PC.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC'
      'AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC'
      'AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)'
      'WHERE CP.CPAG_EMPR_ID = :EMPR_ID'
      'AND     CP.CPAG_STATUS = '#39'A'#39
      'ORDER BY CP.CPAG_DTA_VCTO, CP.CPAG_STATUS')
    SQLConnection = dmConexao.dbConexao
    Left = 128
    Top = 88
    object qryContas_PagarCPAG_ID: TIntegerField
      FieldName = 'CPAG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryContas_PagarCPAG_EMPR_ID: TIntegerField
      FieldName = 'CPAG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryContas_PagarCPAG_NR_DOC: TStringField
      FieldName = 'CPAG_NR_DOC'
      Visible = False
    end
    object qryContas_PagarCPAG_PROVENIENTE: TStringField
      FieldName = 'CPAG_PROVENIENTE'
      Visible = False
      Size = 250
    end
    object qryContas_PagarCPAG_FORN_ID: TIntegerField
      FieldName = 'CPAG_FORN_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_PLCT_ID: TIntegerField
      FieldName = 'CPAG_PLCT_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CPAG_PLCT_EMPR_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_DTA_EMISSAO: TDateField
      FieldName = 'CPAG_DTA_EMISSAO'
      Visible = False
    end
    object qryContas_PagarCPAG_DTA_VCTO: TDateField
      FieldName = 'CPAG_DTA_VCTO'
      Visible = False
    end
    object qryContas_PagarCPAG_DTA_PGTO: TDateField
      FieldName = 'CPAG_DTA_PGTO'
      Visible = False
    end
    object qryContas_PagarCPAG_STATUS: TStringField
      FieldName = 'CPAG_STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_EMPR_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_TGEN_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_PagarCPAG_OBS: TBlobField
      FieldName = 'CPAG_OBS'
      Visible = False
      Size = 1
    end
    object qryContas_PagarCPAG_USER_ID_CANC: TIntegerField
      FieldName = 'CPAG_USER_ID_CANC'
      Visible = False
    end
    object qryContas_PagarCPAG_DTA_CANC: TDateField
      FieldName = 'CPAG_DTA_CANC'
      Visible = False
    end
    object qryContas_PagarCPAG_MOTIVO_CANC: TStringField
      FieldName = 'CPAG_MOTIVO_CANC'
      Visible = False
      Size = 50
    end
    object qryContas_PagarCPAG_DTA_CADASTRO: TDateField
      FieldName = 'CPAG_DTA_CADASTRO'
      Visible = False
    end
    object qryContas_PagarCPAG_USER_ID: TIntegerField
      FieldName = 'CPAG_USER_ID'
      Visible = False
    end
    object qryContas_PagarFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object qryContas_PagarPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object qryContas_PagarTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_PagarPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object qryContas_PagarSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 9
    end
    object qryContas_PagarCPAG_VALOR_DOC: TFMTBCDField
      FieldName = 'CPAG_VALOR_DOC'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_JUROS: TFMTBCDField
      FieldName = 'CPAG_VALOR_JUROS'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_MORA: TFMTBCDField
      FieldName = 'CPAG_VALOR_MORA'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_PAGO: TFMTBCDField
      FieldName = 'CPAG_VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
    end
    object qryContas_PagarCPAG_PREVISAO: TIntegerField
      FieldName = 'CPAG_PREVISAO'
    end
  end
  object dspContas_Pagar: TDataSetProvider
    DataSet = qryContas_Pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 136
  end
  object cdsContas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas_Pagar'
    OnCalcFields = cdsContas_PagarCalcFields
    Left = 128
    Top = 184
    object cdsContas_PagarSELECT: TIntegerField
      DisplayLabel = 'Selec.'
      FieldKind = fkCalculated
      FieldName = 'SELECT'
      Calculated = True
    end
    object cdsContas_PagarSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 9
    end
    object cdsContas_PagarCPAG_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CPAG_STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContas_PagarCPAG_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CPAG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContas_PagarCPAG_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      FieldName = 'CPAG_NR_DOC'
    end
    object cdsContas_PagarCPAG_PROVENIENTE: TStringField
      DisplayLabel = 'Proveni'#234'nte'
      FieldName = 'CPAG_PROVENIENTE'
      Size = 250
    end
    object cdsContas_PagarFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object cdsContas_PagarPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsContas_PagarCPAG_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CPAG_DTA_EMISSAO'
    end
    object cdsContas_PagarCPAG_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CPAG_DTA_VCTO'
    end
    object cdsContas_PagarVALOR_APAGAR: TFloatField
      DisplayLabel = 'Vlr. Pagar'
      FieldKind = fkCalculated
      FieldName = 'VALOR_APAGAR'
      ProviderFlags = []
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object cdsContas_PagarTIPO_DOC: TStringField
      DisplayLabel = 'Tipo de Doc.'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_PagarCPAG_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CPAG_DTA_PGTO'
    end
    object cdsContas_PagarCPAG_FORN_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Fornec.'
      FieldName = 'CPAG_FORN_ID'
    end
    object cdsContas_PagarCPAG_PLCT_ID: TIntegerField
      FieldName = 'CPAG_PLCT_ID'
      Visible = False
    end
    object cdsContas_PagarCPAG_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CPAG_PLCT_EMPR_ID'
      Visible = False
    end
    object cdsContas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_EMPR_ID_TIPO_DOC'
      Visible = False
    end
    object cdsContas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_TGEN_ID_TIPO_DOC'
      Visible = False
    end
    object cdsContas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_ID_TIPO_DOC'
      Visible = False
    end
    object cdsContas_PagarCPAG_OBS: TBlobField
      FieldName = 'CPAG_OBS'
      Visible = False
      Size = 1
    end
    object cdsContas_PagarCPAG_USER_ID_CANC: TIntegerField
      FieldName = 'CPAG_USER_ID_CANC'
      Visible = False
    end
    object cdsContas_PagarCPAG_DTA_CANC: TDateField
      FieldName = 'CPAG_DTA_CANC'
      Visible = False
    end
    object cdsContas_PagarCPAG_MOTIVO_CANC: TStringField
      FieldName = 'CPAG_MOTIVO_CANC'
      Visible = False
      Size = 50
    end
    object cdsContas_PagarCPAG_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CPAG_DTA_CADASTRO'
      Visible = False
    end
    object cdsContas_PagarCPAG_USER_ID: TIntegerField
      FieldName = 'CPAG_USER_ID'
      Visible = False
    end
    object cdsContas_PagarCPAG_EMPR_ID: TIntegerField
      FieldName = 'CPAG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsContas_PagarPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object cdsContas_PagarCPAG_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      FieldName = 'CPAG_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCPAG_VALOR_JUROS: TFMTBCDField
      DisplayLabel = 'Vlr. Juro'
      FieldName = 'CPAG_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCPAG_VALOR_MORA: TFMTBCDField
      DisplayLabel = 'Vlr. Multa'
      FieldName = 'CPAG_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCPAG_VALOR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'CPAG_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
      Visible = False
    end
    object cdsContas_PagarCPAG_PREVISAO: TIntegerField
      FieldName = 'CPAG_PREVISAO'
      Visible = False
    end
  end
  object dsContas_Pagar: TDataSource
    DataSet = cdsContas_Pagar
    Left = 128
    Top = 232
  end
end
