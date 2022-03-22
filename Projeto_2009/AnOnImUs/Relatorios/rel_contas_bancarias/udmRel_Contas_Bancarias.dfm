object dmRel_Contas_Bancarias: TdmRel_Contas_Bancarias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 749
  Width = 1028
  object qryContas_Bancarias: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CB.CBCO_ID,'
      '      CB.CBCO_EMPR_ID,'
      '      CB.CBCO_DESCRICAO,'
      '      CB.CBCO_GENE_EMPR_ID_BCO,'
      '      CB.CBCO_GENE_TGEN_ID_BCO,'
      '      CB.CBCO_GENE_ID_BCO,'
      '      CB.CBCO_AGENCIA,'
      '      CB.CBCO_CONTA,'
      '      CB.CBCO_TIPO,'
      '      CASE CB.CBCO_TIPO'
      '           WHEN '#39'C'#39' THEN '#39'C. Corrente'#39
      '           WHEN '#39'P'#39' THEN '#39'C. Poupan'#231'a'#39
      '      END AS TIPO,'
      '      CB.CBCO_GERENTE,'
      '      CB.CBCO_VALOR_INICIAL,'
      '      CB.CBCO_SALDO_ATUAL,'
      '      CB.CBCO_ATIVO,'
      '      CASE CB.CBCO_ATIVO'
      '           WHEN 1 THEN '#39'Sim'#39
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '      END AS ATIVO,'
      '      CB.CBCO_DTA_CADASTRO,'
      '      CB.CBCO_USER_ID,'
      '      CB.CBCO_LIMITE,'
      '      CB.CBCO_DIA_LIMITE,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1  COD_BANCO'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 56
  end
  object dspContas_Bancarias: TDataSetProvider
    DataSet = qryContas_Bancarias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 104
  end
  object cdsContas_Bancarias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_Bancarias'
    Left = 104
    Top = 152
    object cdsContas_BancariasCBCO_ID: TIntegerField
      FieldName = 'CBCO_ID'
    end
    object cdsContas_BancariasCBCO_EMPR_ID: TIntegerField
      FieldName = 'CBCO_EMPR_ID'
    end
    object cdsContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_EMPR_ID_BCO'
    end
    object cdsContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_TGEN_ID_BCO'
    end
    object cdsContas_BancariasCBCO_GENE_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_ID_BCO'
    end
    object cdsContas_BancariasCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      Size = 50
    end
    object cdsContas_BancariasCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      Size = 50
    end
    object cdsContas_BancariasCBCO_TIPO: TStringField
      FieldName = 'CBCO_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsContas_BancariasTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 11
    end
    object cdsContas_BancariasCBCO_GERENTE: TStringField
      FieldName = 'CBCO_GERENTE'
      Size = 100
    end
    object cdsContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField
      FieldName = 'CBCO_VALOR_INICIAL'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_ATIVO: TIntegerField
      FieldName = 'CBCO_ATIVO'
    end
    object cdsContas_BancariasATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 3
    end
    object cdsContas_BancariasCBCO_DTA_CADASTRO: TDateField
      FieldName = 'CBCO_DTA_CADASTRO'
    end
    object cdsContas_BancariasCBCO_USER_ID: TIntegerField
      FieldName = 'CBCO_USER_ID'
    end
    object cdsContas_BancariasCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasBANCO: TStringField
      FieldName = 'BANCO'
      Size = 50
    end
    object cdsContas_BancariasCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      Size = 50
    end
    object cdsContas_BancariasCBCO_DESCRICAO: TStringField
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object cdsContas_BancariasCBCO_DIA_LIMITE: TIntegerField
      FieldName = 'CBCO_DIA_LIMITE'
    end
  end
  object dsContas_Bancarias: TDataSource
    DataSet = cdsContas_Bancarias
    OnDataChange = dsContas_BancariasDataChange
    Left = 104
    Top = 200
  end
  object qryMovimentacao_Bancaria: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      ORIGEM_DOCUMENTO,'
      '      NR_DOCUMENTO,'
      '      PROVENIENTE,'
      '      CBMV_ID,'
      '      CBMV_EMPR_ID,'
      '      CBMV_CBCO_ID,'
      '      CBMV_CBCO_EMPR_ID,'
      '      CBMV_GENE_EMPR_ID_TIPO_MOV,'
      '      CBMV_GENE_TGEN_ID_TIPO_MOV,'
      '      CBMV_GENE_ID_TIPO_MOV,'
      '      CBMV_VALOR_MOV,'
      '      CBMV_SALDO_DISP,'
      '      CBMV_DTA_CADASTRO,'
      '      CBMV_USER_ID,'
      '      MOVIMENTACAO,'
      '      TIPO_MOV,'
      '      DEDUTIVEL,'
      '      BANCO,'
      '      COD_BANCO,'
      '      CBCO_SALDO_ATUAL,'
      '      CBCO_LIMITE,'
      '      CLIENTE_FORNECEDOR'
      'FROM'
      '    ('
      '     SELECT'
      '           '#39'Contas Pagar'#39'        AS ORIGEM_DOCUMENTO,'
      '           CP.CPAG_NR_DOC        AS NR_DOCUMENTO,'
      '           CP.CPAG_PROVENIENTE   AS PROVENIENTE,'
      '           CM.CBMV_ID,'
      '           CM.CBMV_EMPR_ID,'
      '           CM.CBMV_CBCO_ID,'
      '           CM.CBMV_CBCO_EMPR_ID,'
      '           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_ID_TIPO_MOV,'
      '           CM.CBMV_VALOR_MOV,'
      '           CM.CBMV_SALDO_DISP,'
      '           CM.CBMV_DTA_CADASTRO,'
      '           CM.CBMV_USER_ID,'
      '           TP.GENE_DESCR MOVIMENTACAO,'
      '           TP.GENE_PAR1  TIPO_MOV,'
      '           TP.GENE_PAR2  DEDUTIVEL,'
      '           BC.GENE_DESCR BANCO,'
      '           BC.GENE_PAR1  COD_BANCO,'
      '           CB.CBCO_SALDO_ATUAL,'
      '           CB.CBCO_LIMITE,'
      '           FR.FORN_NOME_FANTASIA AS CLIENTE_FORNECEDOR'
      '     FROM  CONTAS_BANCARIAS_MOV CM'
      '     INNER JOIN CONTAS_BANCARIAS CB'
      '     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID'
      '     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)'
      '     INNER JOIN GENERICA TP'
      '     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      '     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      '     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      '     INNER JOIN GENERICA BC'
      '     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      '     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      '     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      '     INNER JOIN CONTAS_PAGAR CP'
      '     ON (CP.CPAG_ID      = CM.CBMV_CAMPO3_ID_ORIG'
      '     AND CP.CPAG_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)'
      '     INNER JOIN FORNECEDORES FR'
      '     ON (FR.FORN_ID      = CP.CPAG_ID)'
      '     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0'
      '     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13'
      '     AND   CM.CBMV_GENE_ID_ORIG      = 1'
      ''
      '     UNION'
      ''
      '     SELECT'
      '           '#39'Contas Receber'#39'      AS ORIGEM_DOCUMENTO,'
      '           CR.CREC_NR_DOC        AS NR_DOCUMENTO,'
      '           CR.CREC_PROVENIENTE   AS PROVENIENTE,'
      '           CM.CBMV_ID,'
      '           CM.CBMV_EMPR_ID,'
      '           CM.CBMV_CBCO_ID,'
      '           CM.CBMV_CBCO_EMPR_ID,'
      '           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_ID_TIPO_MOV,'
      '           CM.CBMV_VALOR_MOV,'
      '           CM.CBMV_SALDO_DISP,'
      '           CM.CBMV_DTA_CADASTRO,'
      '           CM.CBMV_USER_ID,'
      '           TP.GENE_DESCR MOVIMENTACAO,'
      '           TP.GENE_PAR1  TIPO_MOV,'
      '           TP.GENE_PAR2  DEDUTIVEL,'
      '           BC.GENE_DESCR BANCO,'
      '           BC.GENE_PAR1  COD_BANCO,'
      '           CB.CBCO_SALDO_ATUAL,'
      '           CB.CBCO_LIMITE,'
      '           CL.CLIE_FANTASIA AS CLIENTE_FORNECEDOR'
      '     FROM  CONTAS_BANCARIAS_MOV CM'
      '     INNER JOIN CONTAS_BANCARIAS CB'
      '     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID'
      '     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)'
      '     INNER JOIN GENERICA TP'
      '     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      '     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      '     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      '     INNER JOIN GENERICA BC'
      '     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      '     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      '     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      '     INNER JOIN CONTAS_RECEBER CR'
      '     ON (CR.CREC_ID      = CM.CBMV_CAMPO3_ID_ORIG'
      '     AND CR.CREC_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)'
      '     INNER JOIN CLIENTES CL'
      '     ON (CL.CLIE_ID      = CR.CREC_CLIE_ID'
      '     AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)'
      '     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0'
      '     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13'
      '     AND   CM.CBMV_GENE_ID_ORIG      = 2'
      ''
      '     UNION'
      ''
      '     SELECT'
      '           '#39'Movimenta'#231#227'o Banc'#225'ria'#39' AS ORIGEM_DOCUMENTO,'
      '           CM.CBMV_ID              AS NR_DOCUMENTO,'
      '           BB.CBCO_DESCRICAO       AS PROVENIENTE,'
      '           CM.CBMV_ID,'
      '           CM.CBMV_EMPR_ID,'
      '           CM.CBMV_CBCO_ID,'
      '           CM.CBMV_CBCO_EMPR_ID,'
      '           CM.CBMV_GENE_EMPR_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_TGEN_ID_TIPO_MOV,'
      '           CM.CBMV_GENE_ID_TIPO_MOV,'
      '           CM.CBMV_VALOR_MOV,'
      '           CM.CBMV_SALDO_DISP,'
      '           CM.CBMV_DTA_CADASTRO,'
      '           CM.CBMV_USER_ID,'
      '           TP.GENE_DESCR MOVIMENTACAO,'
      '           TP.GENE_PAR1  TIPO_MOV,'
      '           TP.GENE_PAR2  DEDUTIVEL,'
      '           BC.GENE_DESCR BANCO,'
      '           BC.GENE_PAR1  COD_BANCO,'
      '           CB.CBCO_SALDO_ATUAL,'
      '           CB.CBCO_LIMITE,'
      '           '#39'Mov. entre bancos'#39' AS CLIENTE_FORNECEDOR'
      '     FROM  CONTAS_BANCARIAS_MOV CM'
      '     INNER JOIN CONTAS_BANCARIAS CB'
      '     ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID'
      '     AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)'
      '     INNER JOIN GENERICA TP'
      '     ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      '     AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      '     AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      '     INNER JOIN GENERICA BC'
      '     ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      '     AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      '     AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      '     INNER JOIN CONTAS_BANCARIAS BB'
      '     ON (BB.CBCO_ID      = CM.CBMV_CAMPO3_ID_ORIG'
      '     AND BB.CBCO_EMPR_ID = CM.CBMV_CAMPO1_EMPR_ID_ORIG)'
      '     WHERE CM.CBMV_GENE_EMPR_ID_ORIG = 0'
      '     AND   CM.CBMV_GENE_TGEN_ID_ORIG = 13'
      '     AND   CM.CBMV_GENE_ID_ORIG      = 3'
      '     )'
      'ORDER BY CBMV_DTA_CADASTRO DESC,CBMV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 256
    Top = 56
  end
  object dspMovimentacao_Bancaria: TDataSetProvider
    DataSet = qryMovimentacao_Bancaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 256
    Top = 104
  end
  object cdsMovimentacao_Bancaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentacao_Bancaria'
    Left = 256
    Top = 152
    object cdsMovimentacao_BancariaORIGEM_DOCUMENTO: TStringField
      FieldName = 'ORIGEM_DOCUMENTO'
      FixedChar = True
      Size = 21
    end
    object cdsMovimentacao_BancariaNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
    end
    object cdsMovimentacao_BancariaCBMV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      DisplayWidth = 7
      FieldName = 'CBMV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMovimentacao_BancariaMOVIMENTACAO: TStringField
      DisplayLabel = 'Movimenta'#231#227'o'
      DisplayWidth = 30
      FieldName = 'MOVIMENTACAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaTIPO_MOV: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 7
      FieldName = 'TIPO_MOV'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaDEDUTIVEL: TStringField
      DisplayLabel = 'Dedutivel'
      DisplayWidth = 7
      FieldName = 'DEDUTIVEL'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField
      DisplayLabel = 'Vlr. Mov.'
      DisplayWidth = 11
      FieldName = 'CBMV_VALOR_MOV'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField
      DisplayLabel = 'Vlr. Anterior'
      DisplayWidth = 11
      FieldName = 'CBMV_SALDO_DISP'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Vlr. Atual'
      DisplayWidth = 12
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Movimento'
      FieldName = 'CBMV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField
      FieldName = 'CBMV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField
      FieldName = 'CBMV_CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CBMV_CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_USER_ID: TIntegerField
      FieldName = 'CBMV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsMovimentacao_BancariaCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCLIENTE_FORNECEDOR: TStringField
      FieldName = 'CLIENTE_FORNECEDOR'
      Size = 150
    end
    object cdsMovimentacao_BancariaPROVENIENTE: TStringField
      FieldName = 'PROVENIENTE'
      Required = True
      Size = 250
    end
  end
  object dsMovimentacao_Bancaria: TDataSource
    DataSet = cdsMovimentacao_Bancaria
    Left = 256
    Top = 200
  end
end
