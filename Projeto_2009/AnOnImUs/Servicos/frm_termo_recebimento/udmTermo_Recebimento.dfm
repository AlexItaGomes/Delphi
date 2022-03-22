inherited dmTermo_Recebimento: TdmTermo_Recebimento
  OldCreateOrder = True
  object qryTermosRecebimento: TSQLQuery
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
      'AND   GENE_TGEN_ID = 509'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 48
    object qryTermosRecebimentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTermosRecebimentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTermosRecebimentoGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTermosRecebimentoGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryTermosRecebimentoGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object qryTermosRecebimentoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryTermosRecebimentoGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryTermosRecebimentoGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryTermosRecebimentoGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryTermosRecebimentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspTermosRecebimento: TDataSetProvider
    DataSet = qryTermosRecebimento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 96
  end
  object cdsTermosRecebimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspTermosRecebimento'
    BeforeDelete = cdsTermosRecebimentoBeforeDelete
    OnNewRecord = cdsTermosRecebimentoNewRecord
    OnReconcileError = cdsTermosRecebimentoReconcileError
    Left = 88
    Top = 144
    object cdsTermosRecebimentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTermosRecebimentoGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsTermosRecebimentoGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object cdsTermosRecebimentoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRecebimentoGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRecebimentoGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 250
    end
    object cdsTermosRecebimentoGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTermosRecebimentoGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTermosRecebimentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsTermosRecebimento: TDataSource
    DataSet = cdsTermosRecebimento
    Left = 88
    Top = 192
  end
  object qryItensTermosRecebimento: TSQLQuery
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
      'AND   GENE_TGEN_ID           = 511'
      'AND   GENE_GENE_EMPR_ID_PROP = :GENE_EMPR_ID'
      'AND   GENE_GENE_TGEN_ID_PROP = 509'
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
  object dspItensTermosRecebimento: TDataSetProvider
    DataSet = qryItensTermosRecebimento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 96
  end
  object cdsItensTermosRecebimento: TClientDataSet
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
    ProviderName = 'dspItensTermosRecebimento'
    OnNewRecord = cdsItensTermosRecebimentoNewRecord
    OnReconcileError = cdsItensTermosRecebimentoReconcileError
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
  object dsItensTermosRecebimento: TDataSource
    DataSet = cdsItensTermosRecebimento
    Left = 240
    Top = 192
  end
end
