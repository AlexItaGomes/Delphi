object dmPlano_Contas_Planejamento: TdmPlano_Contas_Planejamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 818
  Width = 1072
  object qryPlano_Conta_Planejamento: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
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
      '      PJ.PCPJ_CONCILIADO,'
      '      PJ.PCPJ_DTA_CADASTRO,'
      '      PJ.PCPJ_USER_ID,'
      '      PJ.PCPJ_OBS,'
      '      PJ.PCPJ_TIPO_PLANO,'
      '      PL.PLCT_COD_SIMPLIFICADO,'
      '      PL.PLCT_DESCRICAO'
      'FROM  PLANO_CONTAS_PLANEJAMENTO PJ'
      'INNER JOIN PLANO_CONTAS PL'
      'ON (PL.PLCT_ID      = PJ.PCPJ_PLCT_ID'
      'AND PL.PLCT_EMPR_ID = PJ.PCPJ_PLCT_EMPR_ID)'
      'WHERE PJ.PCPJ_EMPR_ID = :EMPR_ID'
      'ORDER BY PL.PLCT_COD_SIMPLIFICADO, PL.PLCT_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 48
    object qryPlano_Conta_PlanejamentoPCPJ_ID: TIntegerField
      FieldName = 'PCPJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_PLCT_ID: TIntegerField
      FieldName = 'PCPJ_PLCT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_PLCT_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_ANO: TIntegerField
      FieldName = 'PCPJ_ANO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_01: TFMTBCDField
      FieldName = 'PCPJ_MES_01'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_02: TFMTBCDField
      FieldName = 'PCPJ_MES_02'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_03: TFMTBCDField
      FieldName = 'PCPJ_MES_03'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_04: TFMTBCDField
      FieldName = 'PCPJ_MES_04'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_05: TFMTBCDField
      FieldName = 'PCPJ_MES_05'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_06: TFMTBCDField
      FieldName = 'PCPJ_MES_06'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_07: TFMTBCDField
      FieldName = 'PCPJ_MES_07'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_08: TFMTBCDField
      FieldName = 'PCPJ_MES_08'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_09: TFMTBCDField
      FieldName = 'PCPJ_MES_09'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_10: TFMTBCDField
      FieldName = 'PCPJ_MES_10'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_11: TFMTBCDField
      FieldName = 'PCPJ_MES_11'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_MES_12: TFMTBCDField
      FieldName = 'PCPJ_MES_12'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryPlano_Conta_PlanejamentoPCPJ_CONCILIADO: TIntegerField
      FieldName = 'PCPJ_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_DTA_CADASTRO: TDateField
      FieldName = 'PCPJ_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_Conta_PlanejamentoPCPJ_USER_ID: TIntegerField
      FieldName = 'PCPJ_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPlano_Conta_PlanejamentoPLCT_COD_SIMPLIFICADO: TStringField
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Size = 150
    end
    object qryPlano_Conta_PlanejamentoPLCT_DESCRICAO: TStringField
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryPlano_Conta_PlanejamentoPCPJ_OBS: TBlobField
      FieldName = 'PCPJ_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object qryPlano_Conta_PlanejamentoPCPJ_TIPO_PLANO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'PCPJ_TIPO_PLANO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPlano_Conta_Planejamento: TDataSetProvider
    DataSet = qryPlano_Conta_Planejamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 96
  end
  object cdsPlano_Conta_Planejamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlano_Conta_Planejamento'
    BeforeDelete = cdsPlano_Conta_PlanejamentoBeforeDelete
    OnNewRecord = cdsPlano_Conta_PlanejamentoNewRecord
    OnReconcileError = cdsPlano_Conta_PlanejamentoReconcileError
    Left = 88
    Top = 144
    object cdsPlano_Conta_PlanejamentoPCPJ_CONCILIADO: TIntegerField
      DisplayLabel = 'Conciliado'
      FieldName = 'PCPJ_CONCILIADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PCPJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_PLCT_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Plano'
      FieldName = 'PCPJ_PLCT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPlano_Conta_PlanejamentoPLCT_COD_SIMPLIFICADO: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      ProviderFlags = []
      Size = 150
    end
    object cdsPlano_Conta_PlanejamentoPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLCT_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_ANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'PCPJ_ANO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_01: TFMTBCDField
      DisplayLabel = 'Janeiro'
      FieldName = 'PCPJ_MES_01'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_02: TFMTBCDField
      DisplayLabel = 'Fevereiro'
      FieldName = 'PCPJ_MES_02'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_03: TFMTBCDField
      DisplayLabel = 'Mar'#231'o'
      FieldName = 'PCPJ_MES_03'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_04: TFMTBCDField
      DisplayLabel = 'Abril'
      FieldName = 'PCPJ_MES_04'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_05: TFMTBCDField
      DisplayLabel = 'Maio'
      FieldName = 'PCPJ_MES_05'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_06: TFMTBCDField
      DisplayLabel = 'Junho'
      FieldName = 'PCPJ_MES_06'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_07: TFMTBCDField
      DisplayLabel = 'Julho'
      FieldName = 'PCPJ_MES_07'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_08: TFMTBCDField
      DisplayLabel = 'Agosto'
      FieldName = 'PCPJ_MES_08'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_09: TFMTBCDField
      DisplayLabel = 'Setembro'
      FieldName = 'PCPJ_MES_09'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_10: TFMTBCDField
      DisplayLabel = 'Outubro'
      FieldName = 'PCPJ_MES_10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_11: TFMTBCDField
      DisplayLabel = 'Novembro'
      FieldName = 'PCPJ_MES_11'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_MES_12: TFMTBCDField
      DisplayLabel = 'Dezembro'
      FieldName = 'PCPJ_MES_12'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##,###,###0.00'
      Precision = 20
      Size = 2
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'PCPJ_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_PLCT_EMPR_ID: TIntegerField
      FieldName = 'PCPJ_PLCT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_USER_ID: TIntegerField
      FieldName = 'PCPJ_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_OBS: TBlobField
      FieldName = 'PCPJ_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPlano_Conta_PlanejamentoPCPJ_TIPO_PLANO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'PCPJ_TIPO_PLANO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsPlano_Conta_Planejamento: TDataSource
    DataSet = cdsPlano_Conta_Planejamento
    Left = 88
    Top = 192
  end
  object qryPesq_Plano_Contas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      PLCT_TIPO'
      'FROM  PLANO_CONTAS'
      'WHERE PLCT_TIPO = '#39'D'#39
      'OR   PLCT_COD_SIMPLIFICADO = '#39'40002'#39
      'AND PLCT_ATIVO = 1'
      'ORDER BY'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      PLCT_TIPO')
    SQLConnection = dmConexao.dbConexao
    Left = 256
    Top = 48
  end
  object dspPesq_Plano_Contas: TDataSetProvider
    DataSet = qryPesq_Plano_Contas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 256
    Top = 96
  end
  object cdsPesq_Plano_Contas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Plano_Contas'
    Left = 256
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
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsPesq_Plano_ContasPLCT_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPesq_Plano_Contas: TDataSource
    DataSet = cdsPesq_Plano_Contas
    Left = 256
    Top = 192
  end
end
