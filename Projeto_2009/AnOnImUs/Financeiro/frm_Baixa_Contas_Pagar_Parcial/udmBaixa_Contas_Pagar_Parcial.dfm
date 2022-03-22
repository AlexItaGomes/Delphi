object dmBaixa_Contas_Pagar_Parcial: TdmBaixa_Contas_Pagar_Parcial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 787
  Width = 1117
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
      '      COALESCE(CP.CPAG_VIA_BANCO,0) AS CPAG_VIA_BANCO,'
      '      COALESCE(CP.CPAG_CBCO_ID,0) AS CPAG_CBCO_ID,'
      '      CP.CPAG_CBCO_EMPR_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      FN.FORN_CNPJ_CPF,'
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
      '      CP.CPAG_DTA_EFETIVO'
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
    object qryContas_PagarFORN_CNPJ_CPF: TStringField
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = []
      Required = True
      Size = 18
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
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_PagarCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
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
    object cdsContas_PagarFORN_CNPJ_CPF: TStringField
      FieldName = 'FORN_CNPJ_CPF'
      ProviderFlags = []
      Required = True
      Visible = False
      Size = 18
    end
  end
  object dsContas_Pagar: TDataSource
    DataSet = cdsContas_Pagar
    Left = 128
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
    Left = 240
    Top = 88
  end
  object dspPesq_Tipo_Doc: TDataSetProvider
    DataSet = qryPesq_Tipo_Doc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 136
  end
  object cdsPesq_Tipo_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Tipo_Doc'
    Left = 240
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
    Left = 240
    Top = 232
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
        Name = 'CPAG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      AC.ACPG_ID,'
      '      AC.ACPG_EMPR_ID,'
      '      AC.ACPG_CPAG_ID,'
      '      AC.ACPG_CPAG_EMPR_ID,'
      '      AC.ACPG_GENE_EMPR_ID_TIPO_PGTO,'
      '      AC.ACPG_GENE_TGEN_ID_TIPO_PGTO,'
      '      AC.ACPG_GENE_ID_TIPO_PGTO,'
      '      AC.ACPG_VALOR_DOC,'
      '      AC.ACPG_DTA_CADASTRO,'
      '      AC.ACPG_USER_ID,'
      '      TP.GENE_DESCR TIPO_DOC'
      'FROM  CONTAS_PAGAR_ACERTOS AC'
      'INNER JOIN CONTAS_PAGAR CP'
      'ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID'
      'AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = AC.ACPG_GENE_EMPR_ID_TIPO_PGTO'
      'AND TP.GENE_TGEN_ID = AC.ACPG_GENE_TGEN_ID_TIPO_PGTO'
      'AND TP.GENE_ID      = AC.ACPG_GENE_ID_TIPO_PGTO)'
      'WHERE AC.ACPG_EMPR_ID      = :EMPR_ID'
      'AND   AC.ACPG_CPAG_ID      = :CPAG_ID'
      'AND   AC.ACPG_CPAG_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 336
    Top = 88
    object qryAcertosACPG_ID: TIntegerField
      FieldName = 'ACPG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACPG_EMPR_ID: TIntegerField
      FieldName = 'ACPG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACPG_CPAG_ID: TIntegerField
      FieldName = 'ACPG_CPAG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACPG_CPAG_EMPR_ID: TIntegerField
      FieldName = 'ACPG_CPAG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAcertosACPG_GENE_EMPR_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_EMPR_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACPG_GENE_TGEN_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_TGEN_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACPG_GENE_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_ID_TIPO_PGTO'
      Visible = False
    end
    object qryAcertosACPG_VALOR_DOC: TFMTBCDField
      FieldName = 'ACPG_VALOR_DOC'
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryAcertosACPG_DTA_CADASTRO: TDateField
      FieldName = 'ACPG_DTA_CADASTRO'
      Visible = False
    end
    object qryAcertosACPG_USER_ID: TIntegerField
      FieldName = 'ACPG_USER_ID'
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
    Left = 336
    Top = 136
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
        Name = 'CPAG_ID'
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
    Left = 336
    Top = 184
    object cdsAcertosACPG_ID: TIntegerField
      FieldName = 'ACPG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACPG_EMPR_ID: TIntegerField
      FieldName = 'ACPG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACPG_CPAG_ID: TIntegerField
      FieldName = 'ACPG_CPAG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACPG_CPAG_EMPR_ID: TIntegerField
      FieldName = 'ACPG_CPAG_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertosACPG_GENE_EMPR_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_EMPR_ID_TIPO_PGTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosACPG_GENE_TGEN_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_TGEN_ID_TIPO_PGTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosACPG_GENE_ID_TIPO_PGTO: TIntegerField
      FieldName = 'ACPG_GENE_ID_TIPO_PGTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosACPG_VALOR_DOC: TFMTBCDField
      FieldName = 'ACPG_VALOR_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsAcertosACPG_DTA_CADASTRO: TDateField
      FieldName = 'ACPG_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertosACPG_USER_ID: TIntegerField
      FieldName = 'ACPG_USER_ID'
      ProviderFlags = [pfInUpdate]
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
    Left = 336
    Top = 232
  end
end
