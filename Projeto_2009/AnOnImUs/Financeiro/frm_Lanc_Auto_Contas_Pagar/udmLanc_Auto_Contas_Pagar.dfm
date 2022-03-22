object dmLanc_Auto_Contas_Pagar: TdmLanc_Auto_Contas_Pagar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 446
  Width = 857
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
      '      CP.CPAG_VIA_BANCO,'
      '      CP.CPAG_CBCO_ID,'
      '      CP.CPAG_CBCO_EMPR_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      PC.PLCT_COD_SIMPLIFICADO,'
      '      PC.PLCT_DESCRICAO,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      CASE CP.CPAG_STATUS'
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
      '      CP.CPAG_DTA_EFETIVO,'
      '      CP.CPAG_PREVISAO,'
      '      CP.CPAG_CCRE_ID,'
      '      CP.CPAG_CCRE_EMPR_ID,'
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
      'LEFT OUTER JOIN CONTAS_BANCARIAS CB'
      'ON (CB.CBCO_ID      = CP.CPAG_CBCO_ID'
      'AND CB.CBCO_EMPR_ID = CP.CPAG_CBCO_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      'LEFT OUTER JOIN CARTAO_CREDITO CCRE'
      '  ON (CCRE.CCRE_ID      = CP.CPAG_CCRE_ID'
      '  AND CCRE.CCRE_EMPR_ID = CP.CPAG_CCRE_EMPR_ID)'
      'WHERE CP.CPAG_EMPR_ID = :EMPR_ID'
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
    object qryContas_PagarBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_PagarCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_PagarCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_PagarCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryContas_PagarCBCO_TIPO: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryContas_PagarCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryContas_PagarCPAG_VIA_BANCO: TIntegerField
      FieldName = 'CPAG_VIA_BANCO'
      Visible = False
    end
    object qryContas_PagarCPAG_CBCO_ID: TIntegerField
      FieldName = 'CPAG_CBCO_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CPAG_CBCO_EMPR_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_VALOR_DOC: TFMTBCDField
      FieldName = 'CPAG_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_JUROS: TFMTBCDField
      FieldName = 'CPAG_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_MORA: TFMTBCDField
      FieldName = 'CPAG_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_VALOR_PAGO: TFMTBCDField
      FieldName = 'CPAG_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
    end
    object qryContas_PagarCPAG_PREVISAO: TIntegerField
      FieldName = 'CPAG_PREVISAO'
    end
    object qryContas_PagarCPAG_CCRE_ID: TIntegerField
      FieldName = 'CPAG_CCRE_ID'
      Visible = False
    end
    object qryContas_PagarCPAG_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CPAG_CCRE_EMPR_ID'
      Visible = False
    end
    object qryContas_PagarCCRE_ATIVO: TStringField
      FieldName = 'CCRE_ATIVO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryContas_PagarCCRE_TIPO_CARTAO: TStringField
      FieldName = 'CCRE_TIPO_CARTAO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 14
    end
    object qryContas_PagarCCRE_NUMERO_CARTAO: TStringField
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = []
      Visible = False
      Size = 19
    end
    object qryContas_PagarCCRE_VENCIMENTO: TStringField
      FieldName = 'CCRE_VENCIMENTO'
      ProviderFlags = []
      Visible = False
      Size = 5
    end
    object qryContas_PagarCCRE_TITULAR: TStringField
      FieldName = 'CCRE_TITULAR'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object qryContas_PagarCCRE_LIMITE_SAQUE: TFMTBCDField
      FieldName = 'CCRE_LIMITE_SAQUE'
      ProviderFlags = []
      Visible = False
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCCRE_LIMITE_COMPRAS: TFMTBCDField
      FieldName = 'CCRE_LIMITE_COMPRAS'
      ProviderFlags = []
      Visible = False
      Precision = 18
      Size = 2
    end
    object qryContas_PagarCCRE_DIA_VCTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_PagarCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_PagarCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_PagarCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryContas_PagarCCRE_IMAGE: TBlobField
      FieldName = 'CCRE_IMAGE'
      ProviderFlags = []
      Visible = False
      Size = 1
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
    OnNewRecord = cdsContas_PagarNewRecord
    OnReconcileError = cdsContas_PagarReconcileError
    Left = 128
    Top = 184
    object cdsContas_PagarCPAG_CCRE_ID: TIntegerField
      FieldName = 'CPAG_CCRE_ID'
      Visible = False
    end
    object cdsContas_PagarCPAG_CCRE_EMPR_ID: TIntegerField
      FieldName = 'CPAG_CCRE_EMPR_ID'
      Visible = False
    end
    object cdsContas_PagarCCRE_ATIVO: TStringField
      FieldName = 'CCRE_ATIVO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsContas_PagarCCRE_TIPO_CARTAO: TStringField
      FieldName = 'CCRE_TIPO_CARTAO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 14
    end
    object cdsContas_PagarCCRE_NUMERO_CARTAO: TStringField
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = []
      Visible = False
      Size = 19
    end
    object cdsContas_PagarCCRE_VENCIMENTO: TStringField
      FieldName = 'CCRE_VENCIMENTO'
      ProviderFlags = []
      Visible = False
      Size = 5
    end
    object cdsContas_PagarCCRE_TITULAR: TStringField
      FieldName = 'CCRE_TITULAR'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object cdsContas_PagarCCRE_LIMITE_SAQUE: TFMTBCDField
      FieldName = 'CCRE_LIMITE_SAQUE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCCRE_LIMITE_COMPRAS: TFMTBCDField
      FieldName = 'CCRE_LIMITE_COMPRAS'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsContas_PagarCCRE_DIA_VCTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_PagarCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_PagarCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_PagarCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsContas_PagarCCRE_IMAGE: TBlobField
      FieldName = 'CCRE_IMAGE'
      ProviderFlags = []
      Visible = False
      Size = 1
    end
    object cdsContas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
      Visible = False
    end
    object cdsContas_PagarSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
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
    object cdsContas_PagarCPAG_PROVENIENTE: TStringField
      DisplayLabel = 'Proveni'#234'nte'
      FieldName = 'CPAG_PROVENIENTE'
      Size = 250
    end
    object cdsContas_PagarCPAG_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'CPAG_DTA_EMISSAO'
    end
    object cdsContas_PagarCPAG_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CPAG_DTA_VCTO'
    end
    object cdsContas_PagarCPAG_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'CPAG_DTA_PGTO'
    end
    object cdsContas_PagarPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsContas_PagarCPAG_FORN_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Fornec.'
      FieldName = 'CPAG_FORN_ID'
    end
    object cdsContas_PagarFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_NOME_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object cdsContas_PagarCPAG_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'CPAG_NR_DOC'
    end
    object cdsContas_PagarTIPO_DOC: TStringField
      DisplayLabel = 'Tipo de Documento'
      FieldName = 'TIPO_DOC'
      ProviderFlags = []
      Size = 50
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
    object cdsContas_PagarBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_PagarCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_PagarCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_PagarCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsContas_PagarCBCO_TIPO: TStringField
      FieldName = 'CBCO_TIPO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_PagarCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_PagarCPAG_VIA_BANCO: TIntegerField
      FieldName = 'CPAG_VIA_BANCO'
      Visible = False
    end
    object cdsContas_PagarCPAG_CBCO_ID: TIntegerField
      FieldName = 'CPAG_CBCO_ID'
      Visible = False
    end
    object cdsContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CPAG_CBCO_EMPR_ID'
      Visible = False
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
      DisplayLabel = 'Vlr. Mora'
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
    object cdsContas_PagarCPAG_PREVISAO: TIntegerField
      FieldName = 'CPAG_PREVISAO'
    end
  end
  object dsContas_Pagar: TDataSource
    DataSet = cdsContas_Pagar
    Left = 128
    Top = 232
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
      'AND   PLCT_TIPO    = '#39'D'#39
      'AND PLCT_SISTEMA = 0'
      'AND PLCT_ATIVO = 1'
      'ORDER BY PLCT_COD_SIMPLIFICADO')
    SQLConnection = dmConexao.dbConexao
    Left = 368
    Top = 88
  end
  object dspPesq_Plano_Contas: TDataSetProvider
    DataSet = qryPesq_Plano_Contas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 368
    Top = 136
  end
  object cdsPesq_Plano_Contas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Plano_Contas'
    Left = 368
    Top = 184
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
    Left = 368
    Top = 232
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
    Left = 480
    Top = 88
  end
  object dspPesq_Tipo_Doc: TDataSetProvider
    DataSet = qryPesq_Tipo_Doc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 480
    Top = 136
  end
  object cdsPesq_Tipo_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Tipo_Doc'
    Left = 480
    Top = 184
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
    Left = 480
    Top = 232
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
    Left = 600
    Top = 88
  end
  object dspPesq_Conta: TDataSetProvider
    DataSet = qryPesq_Conta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 600
    Top = 136
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
    Left = 600
    Top = 184
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
    object cdsPesq_ContaSALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsPesq_ContaCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'CBCO_LIMITE'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsPesq_ContaCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
  end
  object dsPesq_Conta: TDataSource
    DataSet = cdsPesq_Conta
    Left = 600
    Top = 232
  end
  object qryPesq_Fornecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FN.FORN_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      FN.FORN_CNPJ_CPF,'
      '      FN.FORN_TIPO,'
      '      FN.FORN_CEP,'
      '      FN.FORN_ENDERECO,'
      '      FN.FORN_BAIRRO,'
      '      FN.FORN_CONTATO,'
      '      FN.FORN_TELEFONE,'
      '      FN.FORN_FAX,'
      '      CD.GENE_DESCR AS CIDADE,'
      '      CD.GENE_PAR1  AS UF'
      'FROM  FORNECEDORES FN'
      'INNER JOIN GENERICA CD'
      '   ON (CD.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA'
      '  AND  CD.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA'
      '  AND  CD.GENE_ID      = FN.FORN_GENE_ID_PRACA)'
      'ORDER BY FN.FORN_NOME_FANTASIA')
    SQLConnection = dmConexao.dbConexao
    Left = 248
    Top = 88
  end
  object dspPesq_Fornecedor: TDataSetProvider
    DataSet = qryPesq_Fornecedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 248
    Top = 136
  end
  object cdsPesq_Fornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Fornecedor'
    Left = 248
    Top = 184
    object cdsPesq_FornecedorFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORN_ID'
    end
    object cdsPesq_FornecedorFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesq_FornecedorFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesq_FornecedorFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORN_CNPJ_CPF'
      Size = 18
    end
    object cdsPesq_FornecedorFORN_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'FORN_TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPesq_FornecedorFORN_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'FORN_CEP'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsPesq_FornecedorFORN_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'FORN_ENDERECO'
      Required = True
      Size = 150
    end
    object cdsPesq_FornecedorFORN_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FORN_BAIRRO'
      Size = 100
    end
    object cdsPesq_FornecedorFORN_CONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'FORN_CONTATO'
      Size = 100
    end
    object cdsPesq_FornecedorFORN_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FORN_TELEFONE'
      Required = True
      Size = 14
    end
    object cdsPesq_FornecedorFORN_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FORN_FAX'
      Size = 14
    end
    object cdsPesq_FornecedorCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 250
    end
    object cdsPesq_FornecedorUF: TStringField
      FieldName = 'UF'
      Size = 250
    end
  end
  object dsPesq_Fornecedor: TDataSource
    DataSet = cdsPesq_Fornecedor
    Left = 248
    Top = 232
  end
end
