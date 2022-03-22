inherited dmRotas: TdmRotas
  OldCreateOrder = True
  object dspRotas: TDataSetProvider
    DataSet = qryRotas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsRotas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspRotas'
    BeforeDelete = cdsRotasBeforeDelete
    OnNewRecord = cdsRotasNewRecord
    OnReconcileError = cdsRotasReconcileError
    Left = 72
    Top = 144
    object cdsRotasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsRotasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsRotasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRotasGENE_DESCR: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Size = 250
    end
    object cdsRotasGENE_PAR1: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Size = 250
    end
    object cdsRotasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = []
      Required = True
    end
    object cdsRotasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = []
      Required = True
      Visible = False
    end
    object cdsRotasGENE_NUMERIC1: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'GENE_NUMERIC1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsRotasGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsRotasGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsRotasGENE_GENE_ID_PROD: TIntegerField
      DisplayLabel = 'C'#243'd. Regi'#227'o'
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
    end
    object cdsRotasREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = []
      Size = 250
    end
    object cdsRotasAREA_TOTAL: TStringField
      DisplayLabel = #193'rea Total'
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Size = 250
    end
  end
  object dsRotas: TDataSource
    DataSet = cdsRotas
    Left = 72
    Top = 192
  end
  object qryRotas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      RT.GENE_EMPR_ID,'
      '      RT.GENE_TGEN_ID,'
      '      RT.GENE_ID,'
      '      RT.GENE_DESCR,'
      '      RT.GENE_PAR1,'
      '      RT.GENE_NUMERIC1,'
      '      RT.GENE_GENE_EMPR_ID_PROP,'
      '      RT.GENE_GENE_TGEN_ID_PROP,'
      '      RT.GENE_GENE_ID_PROD,'
      '      RT.GENE_DTA_CADASTRO,'
      '      RT.GENE_USER_ID,'
      '      RG.GENE_DESCR        AS REGIAO,'
      '      RG.GENE_PAR1         AS AREA_TOTAL'
      'FROM  GENERICA RT'
      'INNER JOIN GENERICA RG'
      'ON (RG.GENE_EMPR_ID   = RT.GENE_GENE_EMPR_ID_PROP'
      'AND RG.GENE_TGEN_ID   = RT.GENE_GENE_TGEN_ID_PROP'
      'AND RG.GENE_ID        = RT.GENE_GENE_ID_PROD)'
      'WHERE RT.GENE_EMPR_ID = :EMPR_ID'
      'AND   RT.GENE_TGEN_ID = 515'
      'ORDER BY RT.GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryRotasGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryRotasGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryRotasGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRotasGENE_DESCR: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryRotasGENE_PAR1: TStringField
      DisplayLabel = 'KM (Total)'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryRotasGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryRotasGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qryRotasGENE_NUMERIC1: TFMTBCDField
      FieldName = 'GENE_NUMERIC1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryRotasGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
    end
    object qryRotasGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
    end
    object qryRotasGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
    end
    object qryRotasREGIAO: TStringField
      FieldName = 'REGIAO'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object qryRotasAREA_TOTAL: TStringField
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
  end
end
