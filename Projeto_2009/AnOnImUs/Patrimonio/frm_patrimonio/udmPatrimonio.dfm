inherited dmPatrimonio: TdmPatrimonio
  OldCreateOrder = True
  Height = 338
  Width = 794
  object qryPatrimonio: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '       PT.PATR_ID,'
      '       PT.PATR_EMPR_ID,'
      '       PT.PATR_DESCRICAO,'
      '       PT.PATR_VLR_COMPRA,'
      '       PT.PATR_OBS,'
      '       PT.PATR_PATR_ID,'
      '       PT.PATR_PATR_EMPR_ID,'
      '       PT.PATR_FORN_ID,'
      '       PT.PATR_CLIE_ID,'
      '       PT.PATR_CLIE_EMPR_ID,'
      '       PT.PATR_MARCA,'
      '       PT.PATR_MODELO,'
      '       PT.PATR_DTA_COMPRA,'
      '       PT.PATR_DTA_VENDA,'
      '       PT.PATR_VLR_VENDA,'
      '       PT.PATR_NR_SERIE,'
      '       PT.PATR_NR_NOTAFISCAL,'
      '       PT.PATR_NR_DANFE,'
      '       PT.PATR_FOTO_NF,'
      '       PT.PATR_DTA_CADASTRO,'
      '       PT.PATR_USER_ID'
      '  FROM PATRIMONIO PT'
      ' WHERE PT.PATR_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 62
    Top = 24
    object qryPatrimonioPATR_ID: TIntegerField
      FieldName = 'PATR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPatrimonioPATR_EMPR_ID: TIntegerField
      FieldName = 'PATR_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPatrimonioPATR_DESCRICAO: TStringField
      FieldName = 'PATR_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryPatrimonioPATR_VLR_COMPRA: TFMTBCDField
      FieldName = 'PATR_VLR_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qryPatrimonioPATR_PATR_ID: TIntegerField
      FieldName = 'PATR_PATR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_PATR_EMPR_ID: TIntegerField
      FieldName = 'PATR_PATR_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_DTA_CADASTRO: TDateField
      FieldName = 'PATR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPatrimonioPATR_USER_ID: TIntegerField
      FieldName = 'PATR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPatrimonioPATR_OBS: TStringField
      FieldName = 'PATR_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 2500
    end
    object qryPatrimonioPATR_FORN_ID: TIntegerField
      FieldName = 'PATR_FORN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_MARCA: TStringField
      FieldName = 'PATR_MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryPatrimonioPATR_MODELO: TStringField
      FieldName = 'PATR_MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryPatrimonioPATR_DTA_COMPRA: TDateField
      FieldName = 'PATR_DTA_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_DTA_VENDA: TDateField
      FieldName = 'PATR_DTA_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_VLR_VENDA: TFMTBCDField
      FieldName = 'PATR_VLR_VENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 4
    end
    object qryPatrimonioPATR_CLIE_ID: TIntegerField
      FieldName = 'PATR_CLIE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_CLIE_EMPR_ID: TIntegerField
      FieldName = 'PATR_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_NR_SERIE: TStringField
      FieldName = 'PATR_NR_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryPatrimonioPATR_NR_NOTAFISCAL: TIntegerField
      FieldName = 'PATR_NR_NOTAFISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryPatrimonioPATR_NR_DANFE: TStringField
      FieldName = 'PATR_NR_DANFE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 60
    end
    object qryPatrimonioPATR_FOTO_NF: TBlobField
      FieldName = 'PATR_FOTO_NF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspPatrimonio: TDataSetProvider
    DataSet = qryPatrimonio
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 62
    Top = 72
  end
  object cdsPatrimonio: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPatrimonio'
    OnNewRecord = cdsPatrimonioNewRecord
    Left = 62
    Top = 120
    object cdsPatrimonioPATR_NR_SERIE: TStringField
      FieldName = 'PATR_NR_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPatrimonioPATR_ID: TIntegerField
      FieldName = 'PATR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPatrimonioPATR_EMPR_ID: TIntegerField
      FieldName = 'PATR_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPatrimonioPATR_DESCRICAO: TStringField
      FieldName = 'PATR_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPatrimonioPATR_VLR_COMPRA: TFMTBCDField
      FieldName = 'PATR_VLR_COMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsPatrimonioPATR_PATR_ID: TIntegerField
      FieldName = 'PATR_PATR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_PATR_EMPR_ID: TIntegerField
      FieldName = 'PATR_PATR_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_DTA_CADASTRO: TDateField
      FieldName = 'PATR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPatrimonioPATR_USER_ID: TIntegerField
      FieldName = 'PATR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPatrimonioPATR_FORN_ID: TIntegerField
      FieldName = 'PATR_FORN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_MARCA: TStringField
      FieldName = 'PATR_MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPatrimonioPATR_MODELO: TStringField
      FieldName = 'PATR_MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPatrimonioPATR_DTA_COMPRA: TDateField
      FieldName = 'PATR_DTA_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_DTA_VENDA: TDateField
      FieldName = 'PATR_DTA_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_CLIE_ID: TIntegerField
      FieldName = 'PATR_CLIE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_CLIE_EMPR_ID: TIntegerField
      FieldName = 'PATR_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_VLR_VENDA: TFMTBCDField
      FieldName = 'PATR_VLR_VENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsPatrimonioPATR_NR_NOTAFISCAL: TIntegerField
      FieldName = 'PATR_NR_NOTAFISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioPATR_OBS: TStringField
      FieldName = 'PATR_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 2500
    end
    object cdsPatrimonioPATR_NR_DANFE: TStringField
      FieldName = 'PATR_NR_DANFE'
      ProviderFlags = [pfInUpdate]
      EditMask = '##-####-##.###.###/####-##-##-###-###.###.###-###.###.###-#'
      Size = 60
    end
    object cdsPatrimonioPATR_FOTO_NF: TBlobField
      FieldName = 'PATR_FOTO_NF'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
  end
  object dsPatrimonio: TDataSource
    DataSet = cdsPatrimonio
    Left = 64
    Top = 168
  end
end
