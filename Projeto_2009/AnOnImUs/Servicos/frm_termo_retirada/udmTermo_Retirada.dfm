inherited dmTermo_Retirada: TdmTermo_Retirada
  OldCreateOrder = True
  object qryTermosRetirada: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_COMENTARIO,'
      '      GENE_NUMBER1,'
      '      GENE_NUMBER2,'
      '      GENE_NUMBER3,'
      '      GENE_PAR1,'
      '      GENE_PAR2,'
      '      GENE_PAR3,'
      '      GENE_GENE_EMPR_ID_PROP,'
      '      GENE_GENE_TGEN_ID_PROP,'
      '      GENE_GENE_ID_PROD,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_USER_ID'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 510'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 48
    object qryTermosRetiradaGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTermosRetiradaGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTermosRetiradaGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTermosRetiradaGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryTermosRetiradaGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object qryTermosRetiradaGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTermosRetiradaGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object qryTermosRetiradaGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object qryTermosRetiradaGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
  end
  object dspTermosRetirada: TDataSetProvider
    DataSet = qryTermosRetirada
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 96
  end
  object cdsTermosRetirada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspTermosRetirada'
    BeforeDelete = cdsTermosRetiradaBeforeDelete
    OnNewRecord = cdsTermosRetiradaNewRecord
    Left = 88
    Top = 144
    object cdsTermosRetiradaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTermosRetiradaGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsTermosRetiradaGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTermosRetiradaGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTermosRetiradaGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTermosRetiradaGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object cdsTermosRetiradaGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRetiradaGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRetiradaGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRetiradaGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRetiradaGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsTermosRetirada: TDataSource
    DataSet = cdsTermosRetirada
    Left = 88
    Top = 192
  end
  object qryItensTermosRetirada: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GENE_EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GENE_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_COMENTARIO,'
      '      GENE_NUMBER1,'
      '      GENE_NUMBER2,'
      '      GENE_NUMBER3,'
      '      GENE_PAR1,'
      '      GENE_PAR2,'
      '      GENE_PAR3,'
      '      GENE_GENE_EMPR_ID_PROP,'
      '      GENE_GENE_TGEN_ID_PROP,'
      '      GENE_GENE_ID_PROD,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_USER_ID'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID           = :EMPR_ID'
      'AND   GENE_TGEN_ID           = 512'
      'AND   GENE_GENE_EMPR_ID_PROP = :GENE_EMPR_ID'
      'AND   GENE_GENE_TGEN_ID_PROP = 510'
      'AND   GENE_GENE_ID_PROD      = :GENE_ID'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 240
    Top = 48
    object IntegerField1: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object IntegerField3: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object StringField1: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object IntegerField4: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField5: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField6: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object IntegerField7: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField8: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField9: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object DateField1: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField10: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspItensTermosRetirada: TDataSetProvider
    DataSet = qryItensTermosRetirada
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 96
  end
  object cdsItensTermosRetirada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GENE_EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GENE_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensTermosRetirada'
    OnNewRecord = cdsItensTermosRetiradaNewRecord
    Left = 240
    Top = 144
    object IntegerField11: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object StringField6: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DateField2: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField12: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object IntegerField13: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object StringField7: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object IntegerField14: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField15: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField16: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object StringField8: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object IntegerField17: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField18: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField19: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object IntegerField20: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsItensTermosRetirada: TDataSource
    DataSet = cdsItensTermosRetirada
    Left = 240
    Top = 192
  end
end
