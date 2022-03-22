object dmContas_Receber: TdmContas_Receber
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 526
  Width = 1022
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
      '      CL.CLIE_FANTASIA,'
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
      '      CR.CREC_DTA_EFETIVO,'
      '      CR.CREC_PREVISAO,'
      '      CR.CREC_CCRE_ID,'
      '      CR.CREC_CCRE_EMPR_ID,'
      '      CASE CCRE.CCRE_ATIVO'
      '           WHEN 1 THEN '#39'Sim'#39
      '           ELSE '#39'N'#227'o'#39
      '      END  AS CCRE_ATIVO,'
      '      CASE CCRE.CCRE_TIPO_CARTAO'
      '           WHEN '#39'C'#39' THEN '#39'Cr'#233'dito'#39
      '           WHEN '#39'D'#39' THEN '#39'D'#233'bito'#39
      '           WHEN '#39'A'#39' THEN '#39'Cr'#233'dito/D'#233'bito'#39
      '      END  AS CCRE_TIPO_CARTAO,'
      '      CCRE.CCRE_NUMERO_CARTAO,'
      '      CCRE.CCRE_VENCIMENTO,'
      '      CCRE.CCRE_TITULAR,'
      '      CCRE.CCRE_LIMITE_SAQUE,'
      '      CCRE.CCRE_LIMITE_COMPRAS,'
      '      CCRE.CCRE_DIA_VCTO_FATURA,'
      '      CCRE.CCRE_DIA_FECHAMENTO_FATURA,'
      '      CCRE.CCRE_CBCO_ID,'
      '      CCRE.CCRE_CBCO_EMPR_ID,'
      '      CCRE.CCRE_IMAGE'
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
      'LEFT OUTER JOIN CARTAO_CREDITO CCRE'
      '  ON (CCRE.CCRE_ID      = CR.CREC_CCRE_ID'
      '  AND CCRE.CCRE_EMPR_ID = CR.CREC_CCRE_EMPR_ID)'
      'WHERE CR.CREC_EMPR_ID = :EMPR_ID'
      'ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS')
    SQLConnection = dmConexao.dbConexao
    Left = 152
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
      Size = 50
    end
    object qryContas_ReceberCREC_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CREC_DTA_EMISSAO'
    end
    object qryContas_ReceberCREC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CREC_DTA_VCTO'
    end
    object qryContas_ReceberCREC_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CREC_DTA_PGTO'
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
    end
    object qryContas_ReceberTIPO_DOC: TStringField
      DisplayLabel = 'Tipo do Documento'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
    end
    object qryContas_ReceberCREC_PLCT_ID: TIntegerField
      FieldName = 'CREC_PLCT_ID'
      Visible = False
    end
    object qryContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
      Visible = False
    end
    object qryContas_ReceberCREC_OBS: TBlobField
      FieldName = 'CREC_OBS'
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
      Visible = False
    end
    object qryContas_ReceberCREC_USER_ID_CANC: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
      Visible = False
    end
    object qryContas_ReceberCREC_DTA_CANC: TDateField
      FieldName = 'CREC_DTA_CANC'
      Visible = False
    end
    object qryContas_ReceberCREC_MOTIVO_CANC: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      Visible = False
      Size = 50
    end
    object qryContas_ReceberCREC_DTA_CADASTRO: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
      Visible = False
    end
    object qryContas_ReceberCREC_USER_ID: TIntegerField
      FieldName = 'CREC_USER_ID'
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
      Visible = False
    end
    object qryContas_ReceberCREC_CBCO_ID: TIntegerField
      FieldName = 'CREC_CBCO_ID'
      Visible = False
    end
    object qryContas_ReceberCREC_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CREC_CBCO_EMPR_ID'
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
      Required = True
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_JUROS: TFMTBCDField
      FieldName = 'CREC_VALOR_JUROS'
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_MORA: TFMTBCDField
      FieldName = 'CREC_VALOR_MORA'
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_VALOR_PAGO: TFMTBCDField
      FieldName = 'CREC_VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCREC_DTA_EFETIVO: TDateField
      FieldName = 'CREC_DTA_EFETIVO'
    end
    object qryContas_ReceberCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object qryContas_ReceberCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
    end
    object qryContas_ReceberCREC_CCRE_ID: TIntegerField
      FieldName = 'CREC_CCRE_ID'
    end
    object qryContas_ReceberCREC_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CCRE_EMPR_ID'
    end
    object qryContas_ReceberCCRE_ATIVO: TStringField
      FieldName = 'CCRE_ATIVO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryContas_ReceberCCRE_TIPO_CARTAO: TStringField
      FieldName = 'CCRE_TIPO_CARTAO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 14
    end
    object qryContas_ReceberCCRE_NUMERO_CARTAO: TStringField
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = []
      Visible = False
      Size = 19
    end
    object qryContas_ReceberCCRE_VENCIMENTO: TStringField
      FieldName = 'CCRE_VENCIMENTO'
      ProviderFlags = []
      Visible = False
      Size = 5
    end
    object qryContas_ReceberCCRE_TITULAR: TStringField
      FieldName = 'CCRE_TITULAR'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object qryContas_ReceberCCRE_LIMITE_SAQUE: TFMTBCDField
      FieldName = 'CCRE_LIMITE_SAQUE'
      ProviderFlags = []
      Visible = False
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCCRE_LIMITE_COMPRAS: TFMTBCDField
      FieldName = 'CCRE_LIMITE_COMPRAS'
      ProviderFlags = []
      Visible = False
      Precision = 18
      Size = 2
    end
    object qryContas_ReceberCCRE_DIA_VCTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_ReceberCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_ReceberCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_ReceberCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_ReceberCCRE_IMAGE: TBlobField
      FieldName = 'CCRE_IMAGE'
      ProviderFlags = []
      Visible = False
      Size = 1
    end
  end
  object dspContas_Receber: TDataSetProvider
    DataSet = qryContas_Receber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 152
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
    BeforeDelete = cdsContas_ReceberBeforeDelete
    OnCalcFields = cdsContas_ReceberCalcFields
    OnNewRecord = cdsContas_ReceberNewRecord
    OnReconcileError = cdsContas_ReceberReconcileError
    Left = 152
    Top = 144
    object cdsContas_ReceberCREC_CCRE_ID: TIntegerField
      FieldName = 'CREC_CCRE_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCREC_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CCRE_EMPR_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCCRE_ATIVO: TStringField
      FieldName = 'CCRE_ATIVO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsContas_ReceberCCRE_TIPO_CARTAO: TStringField
      FieldName = 'CCRE_TIPO_CARTAO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 14
    end
    object cdsContas_ReceberCCRE_NUMERO_CARTAO: TStringField
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = []
      Visible = False
      Size = 19
    end
    object cdsContas_ReceberCCRE_VENCIMENTO: TStringField
      FieldName = 'CCRE_VENCIMENTO'
      ProviderFlags = []
      Visible = False
      Size = 5
    end
    object cdsContas_ReceberCCRE_TITULAR: TStringField
      FieldName = 'CCRE_TITULAR'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object cdsContas_ReceberCCRE_LIMITE_SAQUE: TFMTBCDField
      FieldName = 'CCRE_LIMITE_SAQUE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCCRE_LIMITE_COMPRAS: TFMTBCDField
      FieldName = 'CCRE_LIMITE_COMPRAS'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_ReceberCCRE_DIA_VCTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_ReceberCCRE_IMAGE: TBlobField
      FieldName = 'CCRE_IMAGE'
      ProviderFlags = []
      Visible = False
      Size = 1
    end
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
    object cdsContas_ReceberCLIE_FANTASIA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object cdsContas_ReceberCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Visible = False
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
      EditFormat = '###,###,##0.00'
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
      DisplayLabel = 'Vlr. Juros'
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
    end
    object cdsContas_ReceberCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
      Visible = False
    end
  end
  object dsContas_Receber: TDataSource
    DataSet = cdsContas_Receber
    Left = 152
    Top = 192
  end
  object dspPesq_Cliente: TDataSetProvider
    DataSet = qryPesq_Cliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 96
  end
  object cdsPesq_Cliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesq_Cliente'
    Left = 272
    Top = 144
    object cdsPesq_ClienteCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIE_ID'
    end
    object cdsPesq_ClienteCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesq_ClienteCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsPesq_ClienteCLIE_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CLIE_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPesq_ClienteCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsPesq_ClienteCLIE_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsPesq_ClienteCLIE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIE_ENDERECO'
      Required = True
      Size = 150
    end
    object cdsPesq_ClienteCLIE_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLIE_BAIRRO'
      Required = True
      Size = 100
    end
    object cdsPesq_ClienteCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      Required = True
      Size = 14
    end
    object cdsPesq_ClienteCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsPesq_ClienteCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      Size = 14
    end
    object cdsPesq_ClienteCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      Size = 14
    end
    object cdsPesq_ClienteGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object cdsPesq_ClienteGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
  end
  object dsPesq_Cliente: TDataSource
    DataSet = cdsPesq_Cliente
    Left = 272
    Top = 192
  end
  object qryPesq_Cliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_TIPO,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CID.GENE_DESCR,'
      '      CID.GENE_PAR1'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA CID'
      'ON (CID.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND CID.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND CID.GENE_ID'#9'     = CL.CLIE_GENE_ID_PRACA)'
      'WHERE CL.CLIE_EMPR_ID = :EMPR_ID'
      'AND   CL.CLIE_ATIVO   = 1'
      'ORDER BY CL.CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 273
    Top = 49
  end
  object qryPesq_Plano_Contas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO'
      'FROM  PLANO_CONTAS'
      'WHERE PLCT_EMPR_ID = 0'
      'AND  PLCT_SISTEMA = 0'
      'AND PLCT_ATIVO = 1'
      'AND   PLCT_TIPO    = '#39'C'#39
      'ORDER BY PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 392
    Top = 48
  end
  object dspPesq_Plano_Contas: TDataSetProvider
    DataSet = qryPesq_Plano_Contas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 96
  end
  object cdsPesq_Plano_Contas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Plano_Contas'
    Left = 392
    Top = 144
    object cdsPesq_Plano_ContasPLCT_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PLCT_ID'
    end
    object cdsPesq_Plano_ContasPLCT_COD_SIMPLIFICADO: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsPesq_Plano_ContasPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
  end
  object dsPesq_Plano_Contas: TDataSource
    DataSet = cdsPesq_Plano_Contas
    Left = 392
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
    Left = 504
    Top = 48
  end
  object dspPesq_Tipo_Doc: TDataSetProvider
    DataSet = qryPesq_Tipo_Doc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 504
    Top = 96
  end
  object cdsPesq_Tipo_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Tipo_Doc'
    Left = 504
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
    Left = 504
    Top = 192
  end
  object qryPesq_Conta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CB.CBCO_ID,'
      '      CB.CBCO_DESCRICAO,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1 COD_BANCO,'
      '      COALESCE(CB.CBCO_SALDO_ATUAL,0) SALDO_ATUAL,'
      '      CB.CBCO_LIMITE'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      'WHERE CB.CBCO_EMPR_ID = :EMPR_ID'
      'AND   CB.CBCO_ATIVO   = 1')
    SQLConnection = dmConexao.dbConexao
    Left = 624
    Top = 48
  end
  object dspPesq_Conta: TDataSetProvider
    DataSet = qryPesq_Conta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 624
    Top = 96
  end
  object cdsPesq_Conta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesq_Conta'
    Left = 624
    Top = 144
    object cdsPesq_ContaCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
    end
    object cdsPesq_ContaCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'COD_BANCO'
      Size = 50
    end
    object cdsPesq_ContaBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 50
    end
    object cdsPesq_ContaCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object cdsPesq_ContaSALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsPesq_ContaCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'CBCO_LIMITE'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
  end
  object dsPesq_Conta: TDataSource
    DataSet = cdsPesq_Conta
    Left = 624
    Top = 192
  end
  object qryContas_Receber_Mov: TSQLQuery
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
      '      CM.ACRE_ID,'
      '      CM.ACRE_EMPR_ID,'
      '      CM.ACRE_CREC_ID,'
      '      CM.ACRE_CREC_EMPR_ID,'
      '      CM.ACRE_GENE_EMPR_ID_TIPO_PGTO,'
      '      CM.ACRE_GENE_TGEN_ID_TIPO_PGTO,'
      '      CM.ACRE_GENE_ID_TIPO_PGTO,'
      '      CM.ACRE_VALOR_DOC,'
      '      CM.ACRE_DTA_CADASTRO,'
      '      CM.ACRE_USER_ID,'
      '      TP.GENE_DESCR,'
      '      US.USER_LOGIN'
      'FROM  CONTAS_RECEBER_ACERTOS CM'
      'INNER JOIN CONTAS_RECEBER CR'
      'ON (CM.ACRE_CREC_ID      = CR.CREC_ID'
      'AND CM.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID      = CM.ACRE_GENE_EMPR_ID_TIPO_PGTO'
      'AND TP.GENE_TGEN_ID      = CM.ACRE_GENE_TGEN_ID_TIPO_PGTO'
      'AND TP.GENE_ID           = CM.ACRE_GENE_ID_TIPO_PGTO)'
      'INNER JOIN USUARIO US'
      'ON (US.USER_ID             = CM.ACRE_USER_ID)'
      'WHERE CM.ACRE_EMPR_ID      = :EMPR_ID'
      'AND   CM.ACRE_CREC_ID      = :CREC_ID'
      'AND   CM.ACRE_CREC_EMPR_ID = :EMPR_ID'
      'ORDER BY CM.ACRE_DTA_CADASTRO DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 152
    Top = 288
  end
  object dspContas_Receber_Mov: TDataSetProvider
    DataSet = qryContas_Receber_Mov
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 336
  end
  object cdsContas_Receber_Mov: TClientDataSet
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
    ProviderName = 'dspContas_Receber_Mov'
    Left = 152
    Top = 384
    object cdsContas_Receber_MovACRE_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'ACRE_ID'
    end
    object cdsContas_Receber_MovGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de Lan'#231'amento'
      DisplayWidth = 25
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsContas_Receber_MovACRE_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Lan'#231'amento'
      DisplayWidth = 12
      FieldName = 'ACRE_VALOR_DOC'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_Receber_MovACRE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Lan'#231'amento'
      DisplayWidth = 12
      FieldName = 'ACRE_DTA_CADASTRO'
    end
    object cdsContas_Receber_MovUSER_LOGIN: TStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 22
      FieldName = 'USER_LOGIN'
      FixedChar = True
      Size = 8
    end
    object cdsContas_Receber_MovACRE_EMPR_ID: TIntegerField
      FieldName = 'ACRE_EMPR_ID'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_CREC_ID: TIntegerField
      FieldName = 'ACRE_CREC_ID'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_CREC_EMPR_ID: TIntegerField
      FieldName = 'ACRE_CREC_EMPR_ID'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_EMPR_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_TGEN_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_GENE_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACRE_GENE_ID_TIPO_PGTO'
      Visible = False
    end
    object cdsContas_Receber_MovACRE_USER_ID: TIntegerField
      FieldName = 'ACRE_USER_ID'
      Visible = False
    end
  end
  object dsContas_Receber_Mov: TDataSource
    DataSet = cdsContas_Receber_Mov
    Left = 152
    Top = 432
  end
  object qryParcelamento: TSQLQuery
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
      '      CR.CREC_PREVISAO,'
      '      CR.CREC_CCRE_EMPR_ID,'
      '      CR.CREC_CCRE_ID'
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
      'AND 1 = 0'
      'ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS')
    SQLConnection = dmConexao.dbConexao
    Left = 40
    Top = 48
    object StringField1: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object StringField2: TStringField
      FieldName = 'CREC_STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField3: TStringField
      DisplayLabel = 'Proveni'#234'ncia'
      FieldName = 'CREC_PROVENIENTE'
      Size = 50
    end
    object DateField1: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CREC_DTA_EMISSAO'
    end
    object DateField2: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CREC_DTA_VCTO'
    end
    object DateField3: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CREC_DTA_PGTO'
    end
    object StringField4: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'CREC_CLIE_ID'
    end
    object StringField5: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object StringField6: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      FieldName = 'CREC_NR_DOC'
    end
    object StringField7: TStringField
      DisplayLabel = 'Tipo do Documento'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
    end
    object IntegerField3: TIntegerField
      FieldName = 'CREC_PLCT_ID'
      Visible = False
    end
    object IntegerField4: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
      Visible = False
    end
    object IntegerField5: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
      Visible = False
    end
    object IntegerField6: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
      Visible = False
    end
    object IntegerField7: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
      Visible = False
    end
    object BlobField1: TBlobField
      FieldName = 'CREC_OBS'
      Visible = False
      Size = 1
    end
    object IntegerField8: TIntegerField
      FieldName = 'CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object IntegerField9: TIntegerField
      FieldName = 'CREC_CLIE_EMPR_ID'
      Visible = False
    end
    object IntegerField10: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
      Visible = False
    end
    object DateField4: TDateField
      FieldName = 'CREC_DTA_CANC'
      Visible = False
    end
    object StringField8: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      Visible = False
      Size = 50
    end
    object DateField5: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
      Visible = False
    end
    object IntegerField11: TIntegerField
      FieldName = 'CREC_USER_ID'
      Visible = False
    end
    object StringField9: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object IntegerField12: TIntegerField
      FieldName = 'CREC_VIA_BANCO'
      Visible = False
    end
    object IntegerField13: TIntegerField
      FieldName = 'CREC_CBCO_ID'
      Visible = False
    end
    object IntegerField14: TIntegerField
      FieldName = 'CREC_CBCO_EMPR_ID'
      Visible = False
    end
    object StringField10: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField12: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField13: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField14: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryParcelamentoCREC_VALOR_DOC: TFMTBCDField
      FieldName = 'CREC_VALOR_DOC'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryParcelamentoCREC_VALOR_JUROS: TFMTBCDField
      FieldName = 'CREC_VALOR_JUROS'
      Precision = 18
      Size = 2
    end
    object qryParcelamentoCREC_VALOR_MORA: TFMTBCDField
      FieldName = 'CREC_VALOR_MORA'
      Precision = 18
      Size = 2
    end
    object qryParcelamentoCREC_VALOR_PAGO: TFMTBCDField
      FieldName = 'CREC_VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object qryParcelamentoCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
    end
    object qryParcelamentoCREC_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CCRE_EMPR_ID'
    end
    object qryParcelamentoCREC_CCRE_ID: TIntegerField
      FieldName = 'CREC_CCRE_ID'
    end
  end
  object dspParcelamento: TDataSetProvider
    DataSet = qryParcelamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 96
  end
  object cdsParcelamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspParcelamento'
    BeforeDelete = cdsContas_ReceberBeforeDelete
    OnCalcFields = cdsContas_ReceberCalcFields
    OnNewRecord = cdsContas_ReceberNewRecord
    OnReconcileError = cdsContas_ReceberReconcileError
    BeforeApplyUpdates = cdsParcelamentoBeforeApplyUpdates
    Left = 40
    Top = 144
    object StringField18: TStringField
      DisplayLabel = 'Proveni'#234'ncia'
      DisplayWidth = 40
      FieldName = 'CREC_PROVENIENTE'
      Size = 50
    end
    object DateField7: TDateField
      DisplayLabel = 'Dt. Vencto'
      DisplayWidth = 15
      FieldName = 'CREC_DTA_VCTO'
    end
    object StringField15: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 9
    end
    object StringField16: TStringField
      FieldName = 'CREC_STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CREC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object StringField17: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      FieldName = 'CREC_NR_DOC'
      Visible = False
    end
    object StringField19: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object StringField20: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object DateField6: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CREC_DTA_EMISSAO'
      Visible = False
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Vlr. Pagar'
      FieldKind = fkCalculated
      FieldName = 'VALOR_APAGAR'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object StringField21: TStringField
      DisplayLabel = 'Tipo do Doc.'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object DateField8: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CREC_DTA_PGTO'
      Visible = False
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'CREC_CLIE_ID'
      Visible = False
    end
    object IntegerField17: TIntegerField
      FieldName = 'CREC_PLCT_ID'
      Visible = False
    end
    object cdsParcelamentoCREC_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      DisplayWidth = 15
      FieldName = 'CREC_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParcelamentoCREC_VALOR_JUROS: TFMTBCDField
      DisplayLabel = 'Vlr. Juros'
      FieldName = 'CREC_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParcelamentoCREC_VALOR_MORA: TFMTBCDField
      DisplayLabel = 'Vlr. Multa'
      FieldName = 'CREC_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParcelamentoCREC_VALOR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'CREC_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object IntegerField18: TIntegerField
      FieldName = 'CREC_PLCT_EMPR_ID'
      Visible = False
    end
    object IntegerField19: TIntegerField
      FieldName = 'CREC_GENE_EMPR_ID_TIPO_DOC'
      Visible = False
    end
    object IntegerField20: TIntegerField
      FieldName = 'CREC_GENE_TGEN_ID_TIPO_DOC'
      Visible = False
    end
    object IntegerField21: TIntegerField
      FieldName = 'CREC_GENE_ID_TIPO_DOC'
      Visible = False
    end
    object BlobField2: TBlobField
      FieldName = 'CREC_OBS'
      Visible = False
      Size = 1
    end
    object IntegerField22: TIntegerField
      FieldName = 'CREC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object IntegerField23: TIntegerField
      FieldName = 'CREC_CLIE_EMPR_ID'
      Visible = False
    end
    object IntegerField24: TIntegerField
      FieldName = 'CREC_USER_ID_CANC'
      Visible = False
    end
    object DateField9: TDateField
      FieldName = 'CREC_DTA_CANC'
      Visible = False
    end
    object StringField22: TStringField
      FieldName = 'CREC_MOTIVO_CANC'
      Visible = False
      Size = 50
    end
    object DateField10: TDateField
      FieldName = 'CREC_DTA_CADASTRO'
      Visible = False
    end
    object IntegerField25: TIntegerField
      FieldName = 'CREC_USER_ID'
      Visible = False
    end
    object StringField23: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object IntegerField26: TIntegerField
      FieldName = 'CREC_VIA_BANCO'
      Visible = False
    end
    object IntegerField27: TIntegerField
      FieldName = 'CREC_CBCO_ID'
      Visible = False
    end
    object IntegerField28: TIntegerField
      FieldName = 'CREC_CBCO_EMPR_ID'
      Visible = False
    end
    object StringField24: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField25: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField26: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField27: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object StringField28: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsParcelamentoCREC_PREVISAO: TIntegerField
      FieldName = 'CREC_PREVISAO'
      Visible = False
    end
    object cdsParcelamentoCREC_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CREC_CCRE_EMPR_ID'
      Visible = False
    end
    object cdsParcelamentoCREC_CCRE_ID: TIntegerField
      FieldName = 'CREC_CCRE_ID'
      Visible = False
    end
  end
  object dsParcelamento: TDataSource
    DataSet = cdsParcelamento
    Left = 40
    Top = 192
  end
end
