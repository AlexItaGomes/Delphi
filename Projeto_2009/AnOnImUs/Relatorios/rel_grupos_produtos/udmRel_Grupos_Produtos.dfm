inherited dmRel_Grupos_Produtos: TdmRel_Grupos_Produtos
  OldCreateOrder = True
  object qryRelGrupos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CD.GENE_ID,'
      '      CD.GENE_DESCR'
      'FROM  GENERICA CD')
    SQLConnection = dmConexao.dbConexao
    Left = 176
    Top = 48
  end
  object dspRelGrupos: TDataSetProvider
    DataSet = qryRelGrupos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 96
  end
  object cdsRelGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelGrupos'
    Left = 176
    Top = 144
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField1: TStringField
      DisplayLabel = 'Pra'#231'a'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object dsRelGrupos: TDataSource
    DataSet = cdsRelGrupos
    Left = 176
    Top = 192
  end
end
