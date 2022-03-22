object dmBaixa_Contas_Receber_Auto: TdmBaixa_Contas_Receber_Auto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 799
  Width = 1079
  object qryContas_Receber: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
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
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      CASE CR.CREC_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      CR.CREC_DTA_EFETIVO,'
      '      CR.CREC_PREVISAO'
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
      'WHERE CR.CREC_EMPR_ID = :EMPR_ID'
      'AND      CR.CREC_STATUS = '#39'A'#39
      'ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 48
    object qryContas_ReceberSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object qryContas_ReceberCREC_STATUS: TStringField
      FieldName = 'CREC_STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCREC_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryContas_ReceberCREC_PROVENIENTE: TStringField
      DisplayLabel = 'Proveni'#234'ncia'
      FieldName = 'CREC_PROVENIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryContas_ReceberCREC_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CREC_DTA_EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberCREC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CREC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberCREC_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CREC_DTA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryContas_ReceberCREC_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'CREC_CLIE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object qryContas_ReceberCREC_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      FieldName = 'CREC_NR_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberTIPO_DOC: TStringField
      DisplayLabel = 'Tipo do Documento'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
    end
    object qryContas_ReceberCREC_PLCT_ID: TIntegerField
      FieldName = 'CREC_PLCT_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_OBS: TBlobField
      FieldName = 'CREC_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object qryContas_ReceberCREC_EMPR_ID: TIntegerField
      FieldName = 'CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryContas_ReceberCREC_CLIE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_USER_ID_CANC: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_DTA_CANC: TDateField
      FieldName = 'CREC_DTA_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_MOTIVO_CANC: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCREC_DTA_CADASTRO: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_USER_ID: TIntegerField
      FieldName = 'CREC_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object qryContas_ReceberCREC_VALOR_DOC: TFMTBCDField
      FieldName = 'CREC_VALOR_DOC'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_JUROS: TFMTBCDField
      FieldName = 'CREC_VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_MORA: TFMTBCDField
      FieldName = 'CREC_VALOR_MORA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_PAGO: TFMTBCDField
      FieldName = 'CREC_VALOR_PAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_DTA_EFETIVO: TDateField
      FieldName = 'CREC_DTA_EFETIVO'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_ReceberCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
    end
  end
  object dspContas_Receber: TDataSetProvider
    DataSet = qryContas_Receber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 96
  end
  object cdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas_Receber'
    OnCalcFields = cdsContas_ReceberCalcFields
    Left = 104
    Top = 144
    object cdsContas_ReceberSELECT: TIntegerField
      DisplayLabel = 'Selec.'
      FieldKind = fkCalculated
      FieldName = 'SELECT'
      Calculated = True
    end
    object cdsContas_ReceberSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 9
    end
    object cdsContas_ReceberCREC_STATUS: TStringField
      FieldName = 'CREC_STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContas_ReceberCREC_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContas_ReceberCREC_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      FieldName = 'CREC_NR_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberCREC_PROVENIENTE: TStringField
      DisplayLabel = 'Proveni'#234'ncia'
      FieldName = 'CREC_PROVENIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsContas_ReceberCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object cdsContas_ReceberPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsContas_ReceberCREC_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CREC_DTA_EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberCREC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CREC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberVALOR_APAGAR: TFloatField
      DisplayLabel = 'Vlr. Receber'
      FieldKind = fkCalculated
      FieldName = 'VALOR_APAGAR'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object cdsContas_ReceberTIPO_DOC: TStringField
      DisplayLabel = 'Tipo do Doc.'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_ReceberCREC_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CREC_DTA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberCREC_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'CREC_CLIE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberCREC_PLCT_ID: TIntegerField
      FieldName = 'CREC_PLCT_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_OBS: TBlobField
      FieldName = 'CREC_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsContas_ReceberCREC_EMPR_ID: TIntegerField
      FieldName = 'CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsContas_ReceberCREC_CLIE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_USER_ID_CANC: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_DTA_CANC: TDateField
      FieldName = 'CREC_DTA_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_MOTIVO_CANC: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsContas_ReceberCREC_DTA_CADASTRO: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_USER_ID: TIntegerField
      FieldName = 'CREC_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object cdsContas_ReceberCREC_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      FieldName = 'CREC_VALOR_DOC'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCREC_VALOR_JUROS: TFMTBCDField
      DisplayLabel = 'Vlr. Juro'
      FieldName = 'CREC_VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCREC_VALOR_MORA: TFMTBCDField
      DisplayLabel = 'Vlr. Multa'
      FieldName = 'CREC_VALOR_MORA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCREC_VALOR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'CREC_VALOR_PAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCREC_DTA_EFETIVO: TDateField
      DisplayLabel = 'Dt. Efetiva'#231#227'o'
      FieldName = 'CREC_DTA_EFETIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
      Visible = False
    end
  end
  object dsContas_Receber: TDataSource
    DataSet = cdsContas_Receber
    Left = 104
    Top = 192
  end
end
