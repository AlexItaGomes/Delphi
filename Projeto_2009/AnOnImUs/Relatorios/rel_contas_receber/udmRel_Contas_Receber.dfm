object dmRel_Contas_Receber: TdmRel_Contas_Receber
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 820
  Width = 1244
  object dspRel_Contas_Receber: TDataSetProvider
    DataSet = qryRel_Contas_Receber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 104
  end
  object cdsRel_Contas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Contas_Receber'
    Left = 80
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
    object cdsRel_Contas_ReceberANO: TSmallintField
      FieldName = 'ANO'
    end
    object cdsRel_Contas_ReceberMES: TSmallintField
      FieldName = 'MES'
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
  end
  object dsRel_Contas_Receber: TDataSource
    DataSet = cdsRel_Contas_Receber
    OnDataChange = dsRel_Contas_ReceberDataChange
    Left = 80
    Top = 200
  end
  object qryRel_Contas_Receber: TSQLQuery
    MaxBlobSize = 1
    Params = <>
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
      '      EXTRACT(YEAR FROM CR.CREC_DTA_VCTO) AS ANO,'
      '      EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) AS MES,'
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
    Left = 80
    Top = 56
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
      '      TP.GENE_DESCR,'
      '      AC.ACRE_VALOR_DOC,'
      '      AC.ACRE_DTA_CADASTRO'
      'FROM  CONTAS_RECEBER_ACERTOS AC'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = AC.ACRE_GENE_EMPR_ID_TIPO_PGTO'
      'AND TP.GENE_TGEN_ID = AC.ACRE_GENE_TGEN_ID_TIPO_PGTO'
      'AND TP.GENE_ID      = AC.ACRE_GENE_ID_TIPO_PGTO)'
      'WHERE AC.ACRE_EMPR_ID      = :EMPR_ID'
      'AND   AC.ACRE_CREC_ID      = :CREC_ID'
      'AND   AC.ACRE_CREC_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 216
    Top = 56
  end
  object dspAcertos: TDataSetProvider
    DataSet = qryAcertos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 216
    Top = 104
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
    Left = 216
    Top = 152
    object cdsAcertosACRE_ID: TIntegerField
      FieldName = 'ACRE_ID'
    end
    object cdsAcertosGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsAcertosACRE_VALOR_DOC: TFMTBCDField
      FieldName = 'ACRE_VALOR_DOC'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsAcertosACRE_DTA_CADASTRO: TDateField
      FieldName = 'ACRE_DTA_CADASTRO'
    end
  end
  object dsAcertos: TDataSource
    DataSet = cdsAcertos
    Left = 216
    Top = 200
  end
end
