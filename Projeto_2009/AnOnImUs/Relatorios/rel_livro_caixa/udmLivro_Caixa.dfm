object dmLivro_Caixa: TdmLivro_Caixa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 803
  Width = 1115
  object qryRel_Livro_Caixa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      LCAX_ID,'
      '      LCAX_EMPR_ID,'
      '      PROVENIENTE,'
      '      LCAX_DTA_LANCAMENTO,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      SALDO_ANT,'
      '      LCAX_VLR_LANCAMENTO,'
      '      LCAX_VLR_SALDO,'
      '      PLCT_TIPO,'
      '      ID,'
      '      CLIENTE_FORNECEDOR'
      'FROM'
      '      (SELECT'
      '            LC.LCAX_ID,'
      '            LC.LCAX_EMPR_ID,'
      '            CR.CREC_PROVENIENTE AS PROVENIENTE,'
      '            LC.LCAX_DTA_LANCAMENTO,'
      '            PL.PLCT_COD_SIMPLIFICADO,'
      '            PL.PLCT_DESCRICAO,'
      
        '            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALD' +
        'O_ANT,'
      '            LC.LCAX_VLR_LANCAMENTO,'
      '            LC.LCAX_VLR_SALDO,'
      '            PL.PLCT_TIPO,'
      
        '            CL.CLIE_ID                                     AS ID' +
        ','
      
        '            CL.CLIE_RAZAO_SOCIAL                           AS CL' +
        'IENTE_FORNECEDOR'
      '      FROM  LIVRO_CAIXA LC'
      '      INNER JOIN PLANO_CONTAS PL'
      '      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID'
      '      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)'
      '      INNER JOIN CONTAS_RECEBER CR'
      '      ON (CR.CREC_ID      = LC.LCAX_CAMPO1_TAB_MOV'
      '      AND CR.CREC_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)'
      '      INNER JOIN CLIENTES CL'
      '      ON (CL.CLIE_ID      = CR.CREC_CLIE_ID'
      '      AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)'
      '      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0'
      '      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11'
      '      AND   LC.LCAX_GENE_ID_TP_ORIG      = 2'
      ''
      '      UNION'
      ''
      '      SELECT'
      '            LC.LCAX_ID,'
      '            LC.LCAX_EMPR_ID,'
      '            CP.CPAG_PROVENIENTE AS PROVENIENTE,'
      '            LC.LCAX_DTA_LANCAMENTO,'
      '            PL.PLCT_COD_SIMPLIFICADO,'
      '            PL.PLCT_DESCRICAO,'
      
        '            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALD' +
        'O_ANT,'
      '            LC.LCAX_VLR_LANCAMENTO,'
      '            LC.LCAX_VLR_SALDO,'
      '            PL.PLCT_TIPO,'
      '            FN.FORN_ID                                   AS ID,'
      
        '            FN.FORN_RAZAO_SOCIAL                         AS CLIE' +
        'NTE_FORNECEDOR'
      '      FROM  LIVRO_CAIXA LC'
      '      INNER JOIN PLANO_CONTAS PL'
      '      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID'
      '      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)'
      '      INNER JOIN CONTAS_PAGAR CP'
      '      ON (CP.CPAG_ID      = LC.LCAX_CAMPO1_TAB_MOV'
      '      AND CP.CPAG_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)'
      '      INNER JOIN FORNECEDORES FN'
      '      ON (FN.FORN_ID      = CP.CPAG_FORN_ID)'
      '      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0'
      '      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11'
      '      AND   LC.LCAX_GENE_ID_TP_ORIG      = 3'
      ''
      '      UNION'
      ''
      '      SELECT'
      '            LC.LCAX_ID,'
      '            LC.LCAX_EMPR_ID,'
      '            TP.GENE_DESCR AS PROVENIENTE,'
      '            LC.LCAX_DTA_LANCAMENTO,'
      '            '#39#39' AS PLCT_COD_SIMPLIFICADO,'
      '            '#39'MOVIMENTACAO BANCARIA'#39','
      
        '            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALD' +
        'O_ANT,'
      '            LC.LCAX_VLR_LANCAMENTO,'
      '            LC.LCAX_VLR_SALDO,'
      '            TP.GENE_PAR1,'
      '            CB.CBCO_ID                                   AS ID,'
      
        '            CB.CBCO_DESCRICAO                            AS CLIE' +
        'NTE_FORNECEDOR'
      '      FROM  LIVRO_CAIXA LC'
      '      INNER JOIN CONTAS_BANCARIAS_MOV CM'
      '      ON (CM.CBMV_ID      = LC.LCAX_CAMPO1_TAB_MOV'
      '      AND CM.CBMV_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)'
      '      INNER JOIN CONTAS_BANCARIAS CB'
      '      ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID'
      '      AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)'
      '      INNER JOIN GENERICA TP'
      '      ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      '      AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      '      AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      '      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0'
      '      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11'
      '      AND   LC.LCAX_GENE_ID_TP_ORIG      = 6'
      ''
      '      UNION'
      ''
      '      SELECT'
      '            LC.LCAX_ID,'
      '            LC.LCAX_EMPR_ID,'
      '            '#39'ACERTO ORDEM DE SERVI'#199'O'#39' AS PROVENIENTE,'
      '            LC.LCAX_DTA_LANCAMENTO,'
      '            PL.PLCT_COD_SIMPLIFICADO,'
      '            PL.PLCT_DESCRICAO,'
      
        '            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALD' +
        'O_ANT,'
      '            LC.LCAX_VLR_LANCAMENTO,'
      '            LC.LCAX_VLR_SALDO,'
      '            PL.PLCT_TIPO,'
      '            CL.CLIE_ID                                   AS ID,'
      
        '            CL.CLIE_RAZAO_SOCIAL                         AS CLIE' +
        'NTE_FORNECEDOR'
      '      FROM  LIVRO_CAIXA LC'
      '      INNER JOIN PLANO_CONTAS PL'
      '      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID'
      '      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)'
      '      INNER JOIN ORDEM_SERVICO_ACERTOS AC'
      '      ON (AC.ODAC_ID      = LC.LCAX_CAMPO1_TAB_MOV'
      '      AND AC.ODAC_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)'
      '      INNER JOIN ORDEM_SERVICO OS'
      '      ON (OS.ORDS_ID      = AC.ODAC_ORDS_ID'
      '      AND OS.ORDS_EMPR_ID = AC.ODAC_ORDS_EMPR_ID)'
      '      INNER JOIN CLIENTES CL'
      '      ON (CL.CLIE_ID      = OS.ORDS_CLIE_ID'
      '      AND CL.CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)'
      '      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0'
      '      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11'
      '      AND   LC.LCAX_GENE_ID_TP_ORIG      = 7'
      ''
      '      UNION'
      ''
      '      SELECT'
      '            LC.LCAX_ID,'
      '            LC.LCAX_EMPR_ID,'
      '            '#39'ACERTO AGENDA'#39' AS PROVENIENTE,'
      '            LC.LCAX_DTA_LANCAMENTO,'
      '            PL.PLCT_COD_SIMPLIFICADO,'
      '            PL.PLCT_DESCRICAO,'
      
        '            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALD' +
        'O_ANT,'
      '            LC.LCAX_VLR_LANCAMENTO,'
      '            LC.LCAX_VLR_SALDO,'
      '            PL.PLCT_TIPO,'
      '            CL.CLIE_ID                                   AS ID,'
      
        '            CL.CLIE_RAZAO_SOCIAL                         AS CLIE' +
        'NTE_FORNECEDOR'
      '      FROM  LIVRO_CAIXA LC'
      '      INNER JOIN PLANO_CONTAS PL'
      '      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID'
      '      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)'
      '      INNER JOIN AGENDA   AG'
      '      ON (AG.AGEN_ID      = LC.LCAX_CAMPO1_TAB_MOV'
      '      AND AG.AGEN_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)'
      '      INNER JOIN CLIENTES CL'
      '      ON (CL.CLIE_ID      = AG.AGEN_CLIE_ID'
      '      AND CL.CLIE_EMPR_ID = AG.AGEN_CLIE_EMPR_ID)'
      '      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0'
      '      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11'
      '      AND   LC.LCAX_GENE_ID_TP_ORIG      = 8'
      '      )')
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 56
  end
  object dspRel_Livro_Caixa: TDataSetProvider
    DataSet = qryRel_Livro_Caixa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 104
  end
  object cdsRel_Livro_Caixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Livro_Caixa'
    Left = 192
    Top = 152
    object cdsRel_Livro_CaixaLCAX_ID: TIntegerField
      FieldName = 'LCAX_ID'
      DisplayFormat = '00000'
    end
    object cdsRel_Livro_CaixaLCAX_DTA_LANCAMENTO: TDateField
      FieldName = 'LCAX_DTA_LANCAMENTO'
    end
    object cdsRel_Livro_CaixaPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_Livro_CaixaPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsRel_Livro_CaixaSALDO_ANT: TFMTBCDField
      FieldName = 'SALDO_ANT'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Livro_CaixaLCAX_VLR_LANCAMENTO: TFMTBCDField
      FieldName = 'LCAX_VLR_LANCAMENTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Livro_CaixaLCAX_VLR_SALDO: TFMTBCDField
      FieldName = 'LCAX_VLR_SALDO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Livro_CaixaPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Livro_CaixaPROVENIENTE: TStringField
      FieldName = 'PROVENIENTE'
      Size = 150
    end
    object cdsRel_Livro_CaixaLCAX_EMPR_ID: TIntegerField
      FieldName = 'LCAX_EMPR_ID'
    end
    object cdsRel_Livro_CaixaID: TIntegerField
      FieldName = 'ID'
      DisplayFormat = '00000'
    end
    object cdsRel_Livro_CaixaCLIENTE_FORNECEDOR: TStringField
      FieldName = 'CLIENTE_FORNECEDOR'
      Size = 250
    end
  end
  object dsRel_Livro_Caixa: TDataSource
    DataSet = cdsRel_Livro_Caixa
    Left = 192
    Top = 200
  end
end
