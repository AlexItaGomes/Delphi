object dmBaixa_Contas_Receber_Parcial: TdmBaixa_Contas_Receber_Parcial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 800
  Width = 1069
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
      '      CR.CREC_VIA_BANCO,'
      '      CR.CREC_CBCO_ID,'
      '      CR.CREC_CBCO_EMPR_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      CASE CR.CREC_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1 COD_BANCO,'
      '      CB.CBCO_AGENCIA,'
      '      CB.CBCO_CONTA,'
      '      CB.CBCO_TIPO,'
      '      CB.CBCO_SALDO_ATUAL,'
      '      CB.CBCO_LIMITE,'
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
      'LEFT OUTER JOIN CONTAS_BANCARIAS CB'
      'ON (CB.CBCO_ID      = CR.CREC_CBCO_ID'
      'AND CB.CBCO_EMPR_ID = CR.CREC_CBCO_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
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
    object qryContas_ReceberCREC_VIA_BANCO: TIntegerField
      FieldName = 'CREC_VIA_BANCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_CBCO_ID: TIntegerField
      FieldName = 'CREC_CBCO_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberCREC_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CREC_CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_ReceberBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCBCO_TIPO: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryContas_ReceberCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
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
    object cdsContas_ReceberSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
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
    object cdsContas_ReceberCREC_VIA_BANCO: TIntegerField
      FieldName = 'CREC_VIA_BANCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_CBCO_ID: TIntegerField
      FieldName = 'CREC_CBCO_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberCREC_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CREC_CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_ReceberBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_ReceberCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_ReceberCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_ReceberCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_ReceberCBCO_TIPO: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContas_ReceberCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_ReceberCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
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
      FieldName = 'CREC_DTA_EFETIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsContas_Receber: TDataSource
    DataSet = cdsContas_Receber
    Left = 104
    Top = 192
  end
  object qryPesq_Tipo_Doc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 5'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 224
    Top = 48
  end
  object dspPesq_Tipo_Doc: TDataSetProvider
    DataSet = qryPesq_Tipo_Doc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 96
  end
  object cdsPesq_Tipo_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Tipo_Doc'
    Left = 224
    Top = 144
    object cdsPesq_Tipo_DocGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesq_Tipo_DocGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de Documento'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object dsPesq_Tipo_Doc: TDataSource
    DataSet = cdsPesq_Tipo_Doc
    Left = 224
    Top = 192
  end
  object qryAcertos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CREC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      AC.ACRE_ID,'
      '      AC.ACRE_EMPR_ID,'
      '      AC.ACRE_CREC_ID,'
      '      AC.ACRE_CREC_EMPR_ID,'
      '      AC.ACRE_GENE_EMPR_ID_TIPO_PGTO,'
      '      AC.ACRE_GENE_TGEN_ID_TIPO_PGTO,'
      '      AC.ACRE_GENE_ID_TIPO_PGTO,'
      '      AC.ACRE_VALOR_DOC,'
      '      AC.ACRE_DTA_CADASTRO,'
      '      AC.ACRE_USER_ID,'
      '      TP.GENE_DESCR TIPO_DOC'
      'FROM  CONTAS_RECEBER_ACERTOS AC'
      'INNER JOIN CONTAS_RECEBER CR'
      'ON (AC.ACRE_CREC_ID      = CR.CREC_ID'
      'AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = AC.ACRE_GENE_EMPR_ID_TIPO_PGTO'
      'AND TP.GENE_TGEN_ID = AC.ACRE_GENE_TGEN_ID_TIPO_PGTO'
      'AND TP.GENE_ID      = AC.ACRE_GENE_ID_TIPO_PGTO)'
      'WHERE AC.ACRE_EMPR_ID      = :EMPR_ID'
      'AND   AC.ACRE_CREC_ID      = :CREC_ID'
      'AND   AC.ACRE_CREC_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 344
    Top = 48
    object qryAcertosACRE_ID: TIntegerField
      FieldName = 'ACRE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACRE_EMPR_ID: TIntegerField
      FieldName = 'ACRE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACRE_CREC_ID: TIntegerField
      FieldName = 'ACRE_CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACRE_CREC_EMPR_ID: TIntegerField
      FieldName = 'ACRE_CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_EMPR_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_TGEN_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACRE_GENE_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACRE_VALOR_DOC: TFMTBCDField
      FieldName = 'ACRE_VALOR_DOC'
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryAcertosACRE_DTA_CADASTRO: TDateField
      FieldName = 'ACRE_DTA_CADASTRO'
      Visible = False
    end
    object qryAcertosACRE_USER_ID: TIntegerField
      FieldName = 'ACRE_USER_ID'
      Visible = False
    end
    object qryAcertosTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
  end
  object dspAcertos: TDataSetProvider
    DataSet = qryAcertos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 96
  end
  object cdsAcertos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CREC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertos'
    OnNewRecord = cdsAcertosNewRecord
    OnReconcileError = cdsAcertosReconcileError
    Left = 344
    Top = 144
    object cdsAcertosACRE_ID: TIntegerField
      FieldName = 'ACRE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACRE_EMPR_ID: TIntegerField
      FieldName = 'ACRE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACRE_CREC_ID: TIntegerField
      FieldName = 'ACRE_CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACRE_CREC_EMPR_ID: TIntegerField
      FieldName = 'ACRE_CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_EMPR_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsAcertosACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_TGEN_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsAcertosACRE_GENE_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsAcertosACRE_VALOR_DOC: TFMTBCDField
      FieldName = 'ACRE_VALOR_DOC'
      Visible = False
      Precision = 20
      Size = 2
    end
    object cdsAcertosACRE_DTA_CADASTRO: TDateField
      FieldName = 'ACRE_DTA_CADASTRO'
      Visible = False
    end
    object cdsAcertosACRE_USER_ID: TIntegerField
      FieldName = 'ACRE_USER_ID'
      Visible = False
    end
    object cdsAcertosTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
  end
  object dsAcertos: TDataSource
    DataSet = cdsAcertos
    Left = 344
    Top = 192
  end
end
