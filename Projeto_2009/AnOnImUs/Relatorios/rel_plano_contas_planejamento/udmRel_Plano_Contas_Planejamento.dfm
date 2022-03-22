object dmRel_Plano_Contas_Planejamento: TdmRel_Plano_Contas_Planejamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 783
  Width = 1104
  object qryRel_Planejamento_Anual: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PJ.PCPJ_ID,'
      '      PJ.PCPJ_EMPR_ID,'
      '      PJ.PCPJ_PLCT_ID,'
      '      PJ.PCPJ_PLCT_EMPR_ID,'
      '      PJ.PCPJ_ANO,'
      '      PJ.PCPJ_MES_01,'
      '      PJ.PCPJ_MES_02,'
      '      PJ.PCPJ_MES_03,'
      '      PJ.PCPJ_MES_04,'
      '      PJ.PCPJ_MES_05,'
      '      PJ.PCPJ_MES_06,'
      '      PJ.PCPJ_MES_07,'
      '      PJ.PCPJ_MES_08,'
      '      PJ.PCPJ_MES_09,'
      '      PJ.PCPJ_MES_10,'
      '      PJ.PCPJ_MES_11,'
      '      PJ.PCPJ_MES_12,'
      '      PJ.PCPJ_DTA_CADASTRO,'
      '      PJ.PCPJ_USER_ID,'
      '      PJ.PCPJ_CONCILIADO,'
      '      CASE PJ.PCPJ_CONCILIADO'
      '           WHEN 1 THEN '#39'Sim'#39
      '           WHEN 0 THEN '#39'N'#227'o'#39
      '      END AS CONCILIADO,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'FROM  PLANO_CONTAS_PLANEJAMENTO PJ'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID      = PJ.PCPJ_PLCT_ID'
      'AND PL.PLCT_EMPR_ID = PJ.PCPJ_PLCT_EMPR_ID)')
    SQLConnection = dmConexao.dbConexao
    Left = 120
    Top = 56
  end
  object dspRel_Planejamento_Anual: TDataSetProvider
    DataSet = qryRel_Planejamento_Anual
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 104
  end
  object cdsRel_Planejamento_Anual: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Planejamento_Anual'
    Left = 120
    Top = 152
    object cdsRel_Planejamento_AnualPCPJ_ID: TIntegerField
      FieldName = 'PCPJ_ID'
    end
    object cdsRel_Planejamento_AnualPCPJ_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_EMPR_ID'
    end
    object cdsRel_Planejamento_AnualPCPJ_PLCT_ID: TIntegerField
      FieldName = 'PCPJ_PLCT_ID'
    end
    object cdsRel_Planejamento_AnualPCPJ_PLCT_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_PLCT_EMPR_ID'
    end
    object cdsRel_Planejamento_AnualPCPJ_ANO: TIntegerField
      FieldName = 'PCPJ_ANO'
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_01: TFMTBCDField
      FieldName = 'PCPJ_MES_01'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_02: TFMTBCDField
      FieldName = 'PCPJ_MES_02'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_03: TFMTBCDField
      FieldName = 'PCPJ_MES_03'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_04: TFMTBCDField
      FieldName = 'PCPJ_MES_04'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_05: TFMTBCDField
      FieldName = 'PCPJ_MES_05'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_06: TFMTBCDField
      FieldName = 'PCPJ_MES_06'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_07: TFMTBCDField
      FieldName = 'PCPJ_MES_07'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_08: TFMTBCDField
      FieldName = 'PCPJ_MES_08'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_09: TFMTBCDField
      FieldName = 'PCPJ_MES_09'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_10: TFMTBCDField
      FieldName = 'PCPJ_MES_10'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_11: TFMTBCDField
      FieldName = 'PCPJ_MES_11'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_MES_12: TFMTBCDField
      FieldName = 'PCPJ_MES_12'
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsRel_Planejamento_AnualPCPJ_DTA_CADASTRO: TDateField
      FieldName = 'PCPJ_DTA_CADASTRO'
    end
    object cdsRel_Planejamento_AnualPCPJ_USER_ID: TIntegerField
      FieldName = 'PCPJ_USER_ID'
    end
    object cdsRel_Planejamento_AnualPCPJ_CONCILIADO: TIntegerField
      FieldName = 'PCPJ_CONCILIADO'
    end
    object cdsRel_Planejamento_AnualCONCILIADO: TStringField
      FieldName = 'CONCILIADO'
      FixedChar = True
      Size = 3
    end
    object cdsRel_Planejamento_AnualPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsRel_Planejamento_AnualPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
  end
  object dsRel_Planejamento_Anual: TDataSource
    DataSet = cdsRel_Planejamento_Anual
    Left = 120
    Top = 200
  end
end
