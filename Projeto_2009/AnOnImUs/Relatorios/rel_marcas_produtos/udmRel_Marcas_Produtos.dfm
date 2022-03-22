inherited dmRel_Marcas_Produtos: TdmRel_Marcas_Produtos
  OldCreateOrder = True
  object qryRelMarcas: TSQLQuery
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
  object dspRelMarcas: TDataSetProvider
    DataSet = qryRelMarcas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 96
  end
  object cdsRelMarcas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelMarcas'
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
  object dsRelMarcas: TDataSource
    DataSet = cdsRelMarcas
    Left = 176
    Top = 192
  end
end
