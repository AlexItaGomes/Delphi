object dmRel_Contas_Pagar: TdmRel_Contas_Pagar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 644
  Width = 969
  object qryRel_Contas_Pagar: TSQLQuery
    MaxBlobSize = 1
    Params = <>
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
      '      CP.CPAG_VALOR_DOC,'
      '      CP.CPAG_VALOR_JUROS,'
      '      CP.CPAG_VALOR_MORA,'
      '      CP.CPAG_STATUS,'
      '      CP.CPAG_VALOR_PAGO,'
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
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO,'
      '      PL.PLCT_TIPO,'
      '      CASE CP.CPAG_STATUS'
      '           WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '           WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '           WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      TP.GENE_DESCR TIPO_DOC,'
      '      UC.USER_LOGIN USER_CANCEL,'
      '      EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO) AS ANO,'
      '      EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) AS MES,'
      '      CP.CPAG_DTA_EFETIVO'
      'FROM  CONTAS_PAGAR CP'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID = CP.CPAG_FORN_ID)'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID      = CP.CPAG_PLCT_ID'
      'AND PL.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC'
      'AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC'
      'AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)'
      'LEFT OUTER JOIN USUARIO UC'
      'ON (UC.USER_ID = CP.CPAG_USER_ID_CANC)')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 56
  end
  object dspRel_Contas_Pagar: TDataSetProvider
    DataSet = qryRel_Contas_Pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 104
  end
  object cdsRel_Contas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Contas_Pagar'
    Left = 96
    Top = 152
    object cdsRel_Contas_PagarCPAG_ID: TIntegerField
      FieldName = 'CPAG_ID'
    end
    object cdsRel_Contas_PagarCPAG_EMPR_ID: TIntegerField
      FieldName = 'CPAG_EMPR_ID'
    end
    object cdsRel_Contas_PagarCPAG_NR_DOC: TStringField
      FieldName = 'CPAG_NR_DOC'
    end
    object cdsRel_Contas_PagarCPAG_PROVENIENTE: TStringField
      FieldName = 'CPAG_PROVENIENTE'
      Size = 250
    end
    object cdsRel_Contas_PagarCPAG_FORN_ID: TIntegerField
      FieldName = 'CPAG_FORN_ID'
    end
    object cdsRel_Contas_PagarCPAG_PLCT_ID: TIntegerField
      FieldName = 'CPAG_PLCT_ID'
    end
    object cdsRel_Contas_PagarCPAG_PLCT_EMPR_ID: TIntegerField
      FieldName = 'CPAG_PLCT_EMPR_ID'
    end
    object cdsRel_Contas_PagarCPAG_DTA_EMISSAO: TDateField
      FieldName = 'CPAG_DTA_EMISSAO'
    end
    object cdsRel_Contas_PagarCPAG_DTA_VCTO: TDateField
      FieldName = 'CPAG_DTA_VCTO'
    end
    object cdsRel_Contas_PagarCPAG_DTA_PGTO: TDateField
      FieldName = 'CPAG_DTA_PGTO'
    end
    object cdsRel_Contas_PagarCPAG_STATUS: TStringField
      FieldName = 'CPAG_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Contas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_EMPR_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_TGEN_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'CPAG_GENE_ID_TIPO_DOC'
    end
    object cdsRel_Contas_PagarCPAG_OBS: TBlobField
      FieldName = 'CPAG_OBS'
      Size = 1
    end
    object cdsRel_Contas_PagarCPAG_USER_ID_CANC: TIntegerField
      FieldName = 'CPAG_USER_ID_CANC'
    end
    object cdsRel_Contas_PagarCPAG_DTA_CANC: TDateField
      FieldName = 'CPAG_DTA_CANC'
    end
    object cdsRel_Contas_PagarCPAG_MOTIVO_CANC: TStringField
      FieldName = 'CPAG_MOTIVO_CANC'
      Size = 50
    end
    object cdsRel_Contas_PagarCPAG_DTA_CADASTRO: TDateField
      FieldName = 'CPAG_DTA_CADASTRO'
    end
    object cdsRel_Contas_PagarCPAG_USER_ID: TIntegerField
      FieldName = 'CPAG_USER_ID'
    end
    object cdsRel_Contas_PagarFORN_NOME_FANTASIA: TStringField
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsRel_Contas_PagarPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_Contas_PagarPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsRel_Contas_PagarPLCT_TIPO: TStringField
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsRel_Contas_PagarSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object cdsRel_Contas_PagarTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      Size = 50
    end
    object cdsRel_Contas_PagarUSER_CANCEL: TStringField
      FieldName = 'USER_CANCEL'
      FixedChar = True
      Size = 8
    end
    object cdsRel_Contas_PagarANO: TSmallintField
      FieldName = 'ANO'
    end
    object cdsRel_Contas_PagarMES: TSmallintField
      FieldName = 'MES'
    end
    object cdsRel_Contas_PagarCPAG_VALOR_DOC: TFMTBCDField
      FieldName = 'CPAG_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_JUROS: TFMTBCDField
      FieldName = 'CPAG_VALOR_JUROS'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_MORA: TFMTBCDField
      FieldName = 'CPAG_VALOR_MORA'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_VALOR_PAGO: TFMTBCDField
      FieldName = 'CPAG_VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRel_Contas_PagarCPAG_DTA_EFETIVO: TDateField
      FieldName = 'CPAG_DTA_EFETIVO'
    end
  end
  object dsRel_Contas_Pagar: TDataSource
    DataSet = cdsRel_Contas_Pagar
    OnDataChange = dsRel_Contas_PagarDataChange
    Left = 96
    Top = 200
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
      '      TP.GENE_DESCR,'
      '      AC.ACPG_VALOR_DOC,'
      '      AC.ACPG_DTA_CADASTRO'
      'FROM  CONTAS_PAGAR_ACERTOS AC'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = AC.ACPG_GENE_EMPR_ID_TIPO_PGTO'
      'AND TP.GENE_TGEN_ID = AC.ACPG_GENE_TGEN_ID_TIPO_PGTO'
      'AND TP.GENE_ID      = AC.ACPG_GENE_ID_TIPO_PGTO)'
      'WHERE AC.ACPG_EMPR_ID      = :EMPR_ID'
      'AND   AC.ACPG_CPAG_ID      = :CPAG_ID'
      'AND   AC.ACPG_CPAG_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 208
    Top = 56
  end
  object dspAcertos: TDataSetProvider
    DataSet = qryAcertos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 208
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
        Name = 'CPAG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertos'
    Left = 208
    Top = 152
    object cdsAcertosACPG_ID: TIntegerField
      FieldName = 'ACPG_ID'
    end
    object cdsAcertosGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsAcertosACPG_VALOR_DOC: TFMTBCDField
      FieldName = 'ACPG_VALOR_DOC'
      DisplayFormat = '##,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsAcertosACPG_DTA_CADASTRO: TDateField
      FieldName = 'ACPG_DTA_CADASTRO'
    end
  end
  object dsAcertos: TDataSource
    DataSet = cdsAcertos
    Left = 208
    Top = 200
  end
end
