inherited dmRel_Modelos_Produtos: TdmRel_Modelos_Produtos
  OldCreateOrder = True
  Height = 371
  Width = 768
  object qryRelModelos: TSQLQuery
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
  object dspRelModelos: TDataSetProvider
    DataSet = qryRelModelos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 96
  end
  object cdsRelModelos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelModelos'
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
  object dsRelModelos: TDataSource
    DataSet = cdsRelModelos
    Left = 176
    Top = 192
  end
end
