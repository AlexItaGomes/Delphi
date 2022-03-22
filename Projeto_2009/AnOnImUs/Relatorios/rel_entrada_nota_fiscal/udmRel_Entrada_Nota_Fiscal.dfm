inherited dmRel_Entrada_Nota_Fiscal: TdmRel_Entrada_Nota_Fiscal
  OldCreateOrder = True
  Height = 674
  Width = 1037
  object qryRelNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      NF.NFEN_ID,'
      '      NF.NFEN_EMPR_ID,'
      '      NF.NFEN_FORN_ID,'
      '      NF.NFEN_DTA_EMISSAO,'
      '      NF.NFEN_DTA_ENTRADA,'
      '      NF.NFEN_NR_NOTA,'
      '      NF.NFEN_NR_SERIE,'
      '      NF.NFEN_VLR_TOTAL_PROD,'
      '      NF.NFEN_VLR_TOTAL_NOTA,'
      '      CASE NF.NFEN_CONCILIADO'
      '           WHEN 0 THEN '#39'Aberto'#39
      '           WHEN 1 THEN '#39'Conciliado'#39
      '           WHEN 2 THEN '#39'Cancelado'#39
      '      END AS NFEN_CONCILIADO,'
      '      NF.NFEN_DTA_CONCILIADO,'
      '      NF.NFEN_DTA_CANCELADO,'
      '      NF.NFEN_USER_ID_CANC,'
      '      NF.NFEN_MOTIVO_CANC,'
      '      NF.NFEN_DTA_CADASTRO,'
      '      NF.NFEN_USER_ID,'
      '      NF.NFEN_VLR_TOTAL_DESC,'
      '      FN.FORN_NOME_FANTASIA'
      'FROM  NOTA_FISCAL NF'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID          = NF.NFEN_FORN_ID)')
    SQLConnection = dmConexao.dbConexao
    Left = 304
    Top = 48
  end
  object dspRelNotaFiscal: TDataSetProvider
    DataSet = qryRelNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 96
  end
  object cdsRelNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelNotaFiscal'
    Left = 304
    Top = 144
    object cdsRelNotaFiscalNFEN_ID: TIntegerField
      FieldName = 'NFEN_ID'
    end
    object cdsRelNotaFiscalNFEN_EMPR_ID: TIntegerField
      FieldName = 'NFEN_EMPR_ID'
    end
    object cdsRelNotaFiscalNFEN_FORN_ID: TIntegerField
      FieldName = 'NFEN_FORN_ID'
    end
    object cdsRelNotaFiscalNFEN_DTA_EMISSAO: TDateField
      FieldName = 'NFEN_DTA_EMISSAO'
    end
    object cdsRelNotaFiscalNFEN_DTA_ENTRADA: TDateField
      FieldName = 'NFEN_DTA_ENTRADA'
    end
    object cdsRelNotaFiscalNFEN_NR_NOTA: TIntegerField
      FieldName = 'NFEN_NR_NOTA'
    end
    object cdsRelNotaFiscalNFEN_NR_SERIE: TIntegerField
      FieldName = 'NFEN_NR_SERIE'
    end
    object cdsRelNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_PROD'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRelNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_NOTA'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRelNotaFiscalNFEN_CONCILIADO: TStringField
      FieldName = 'NFEN_CONCILIADO'
      FixedChar = True
      Size = 10
    end
    object cdsRelNotaFiscalNFEN_DTA_CONCILIADO: TDateField
      FieldName = 'NFEN_DTA_CONCILIADO'
    end
    object cdsRelNotaFiscalNFEN_DTA_CANCELADO: TDateField
      FieldName = 'NFEN_DTA_CANCELADO'
    end
    object cdsRelNotaFiscalNFEN_USER_ID_CANC: TIntegerField
      FieldName = 'NFEN_USER_ID_CANC'
    end
    object cdsRelNotaFiscalNFEN_MOTIVO_CANC: TBlobField
      FieldName = 'NFEN_MOTIVO_CANC'
    end
    object cdsRelNotaFiscalNFEN_DTA_CADASTRO: TDateField
      FieldName = 'NFEN_DTA_CADASTRO'
    end
    object cdsRelNotaFiscalNFEN_USER_ID: TIntegerField
      FieldName = 'NFEN_USER_ID'
    end
    object cdsRelNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField
      FieldName = 'NFEN_VLR_TOTAL_DESC'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsRelNotaFiscalFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
  end
  object dsRelNotaFiscal: TDataSource
    DataSet = cdsRelNotaFiscal
    Left = 304
    Top = 192
  end
  object qryItensNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      NI.NFIT_ID,'
      '      NI.NFIT_EMPR_ID,'
      '      NI.NFIT_NFEN_ID,'
      '      NI.NFIT_NFEN_EMPR_ID,'
      '      NI.NFIT_PROD_ID,'
      '      NI.NFIT_PROD_EMPR_ID,'
      '      NI.NFIT_QTDE,'
      '      NI.NFIT_VLR_UNITARIO,'
      '      NI.NFIT_VLR_TOTAL_ITEM,'
      '      NI.NFIT_DTA_CADASTRO,'
      '      NI.NFIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  NOTA_FISCAL_ITENS NI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = NI.NFIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = NI.NFIT_PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE NI.NFIT_EMPR_ID      = :EMPR_ID'
      'AND   NI.NFIT_NFEN_ID      = :NFEN_ID'
      'AND   NI.NFIT_NFEN_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 424
    Top = 48
  end
  object dspItensNotaFiscal: TDataSetProvider
    DataSet = qryItensNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 424
    Top = 96
  end
  object cdsItensNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensNotaFiscal'
    Left = 424
    Top = 144
    object cdsItensNotaFiscalNFIT_ID: TIntegerField
      FieldName = 'NFIT_ID'
    end
    object cdsItensNotaFiscalNFIT_EMPR_ID: TIntegerField
      FieldName = 'NFIT_EMPR_ID'
    end
    object cdsItensNotaFiscalNFIT_NFEN_ID: TIntegerField
      FieldName = 'NFIT_NFEN_ID'
    end
    object cdsItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFIT_NFEN_EMPR_ID'
    end
    object cdsItensNotaFiscalNFIT_PROD_ID: TIntegerField
      FieldName = 'NFIT_PROD_ID'
    end
    object cdsItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'NFIT_PROD_EMPR_ID'
    end
    object cdsItensNotaFiscalNFIT_QTDE: TFMTBCDField
      FieldName = 'NFIT_QTDE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField
      FieldName = 'NFIT_VLR_UNITARIO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField
      FieldName = 'NFIT_VLR_TOTAL_ITEM'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsItensNotaFiscalNFIT_DTA_CADASTRO: TDateField
      FieldName = 'NFIT_DTA_CADASTRO'
    end
    object cdsItensNotaFiscalNFIT_USER_ID: TIntegerField
      FieldName = 'NFIT_USER_ID'
    end
    object cdsItensNotaFiscalPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsItensNotaFiscalPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsItensNotaFiscalGRUPO_PROD: TStringField
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsItensNotaFiscalMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsItensNotaFiscalMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object dsItensNotaFiscal: TDataSource
    DataSet = cdsItensNotaFiscal
    Left = 424
    Top = 192
  end
  object qryAcertosNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      NA.NFAC_ID,'
      '      NA.NFAC_EMPR_ID,'
      '      NA.NFAC_NFEN_ID,'
      '      NA.NFAC_NFEN_EMPR_ID,'
      '      NA.NFAC_DESCRICAO,'
      '      NA.NFAC_NR_DOCUMENTO,'
      '      NA.NFAC_GENE_EMPR_ID_TP_DOC,'
      '      NA.NFAC_GENE_TGEN_ID_TP_DOC,'
      '      NA.NFAC_GENE_ID_TP_DOC,'
      '      NA.NFAC_DTA_LANC,'
      '      NA.NFAC_DTA_VCTO,'
      '      NA.NFAC_VALOR_DOC,'
      '      NA.NFAC_VALOR_JUROS,'
      '      NA.NFAC_VALOR_MORA,'
      '      NA.NFAC_CONCILIADO,'
      '      NA.NFAC_DTA_CADASTRO,'
      '      NA.NFAC_USER_ID,'
      '      TP.GENE_DESCR TIPO_DOC'
      'FROM  NOTA_FISCAL_ACERTOS NA'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID   = NA.NFAC_GENE_EMPR_ID_TP_DOC'
      'AND TP.GENE_TGEN_ID   = NA.NFAC_GENE_TGEN_ID_TP_DOC'
      'AND TP.GENE_ID        = NA.NFAC_GENE_ID_TP_DOC)'
      'WHERE NA.NFAC_EMPR_ID      = :EMPR_ID'
      'AND   NA.NFAC_NFEN_ID      = :NFEN_ID'
      'AND   NA.NFAC_NFEN_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 552
    Top = 48
  end
  object dspAcertosNotaFiscal: TDataSetProvider
    DataSet = qryAcertosNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 552
    Top = 96
  end
  object cdsAcertosNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NFEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertosNotaFiscal'
    Left = 552
    Top = 144
    object cdsAcertosNotaFiscalNFAC_ID: TIntegerField
      FieldName = 'NFAC_ID'
    end
    object cdsAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField
      FieldName = 'NFAC_EMPR_ID'
    end
    object cdsAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField
      FieldName = 'NFAC_NFEN_ID'
    end
    object cdsAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField
      FieldName = 'NFAC_NFEN_EMPR_ID'
    end
    object cdsAcertosNotaFiscalNFAC_DESCRICAO: TStringField
      FieldName = 'NFAC_DESCRICAO'
      Size = 50
    end
    object cdsAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField
      FieldName = 'NFAC_NR_DOCUMENTO'
      Size = 25
    end
    object cdsAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_EMPR_ID_TP_DOC'
    end
    object cdsAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_TGEN_ID_TP_DOC'
    end
    object cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField
      FieldName = 'NFAC_GENE_ID_TP_DOC'
    end
    object cdsAcertosNotaFiscalNFAC_DTA_LANC: TDateField
      FieldName = 'NFAC_DTA_LANC'
    end
    object cdsAcertosNotaFiscalNFAC_DTA_VCTO: TDateField
      FieldName = 'NFAC_DTA_VCTO'
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField
      FieldName = 'NFAC_VALOR_DOC'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField
      FieldName = 'NFAC_VALOR_JUROS'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField
      FieldName = 'NFAC_VALOR_MORA'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField
      FieldName = 'NFAC_CONCILIADO'
    end
    object cdsAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField
      FieldName = 'NFAC_DTA_CADASTRO'
    end
    object cdsAcertosNotaFiscalNFAC_USER_ID: TIntegerField
      FieldName = 'NFAC_USER_ID'
    end
    object cdsAcertosNotaFiscalTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      Size = 50
    end
  end
  object dsAcertosNotaFiscal: TDataSource
    DataSet = cdsAcertosNotaFiscal
    Left = 552
    Top = 192
  end
end
