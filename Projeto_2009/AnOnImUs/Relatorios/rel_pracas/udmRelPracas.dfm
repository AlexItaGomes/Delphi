inherited dmRelPracas: TdmRelPracas
  OldCreateOrder = True
  object qryPesqPraca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CD.GENE_ID,'
      '      CD.GENE_DESCR,'
      '      CD.GENE_PAR1,'
      '      CD.GENE_PAR2'
      'FROM  GENERICA CD'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 80
    Top = 48
    object qryPesqPracaGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      Required = True
    end
    object qryPesqPracaGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object qryPesqPracaGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      Size = 250
    end
    object qryPesqPracaGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      Size = 250
    end
  end
  object dspPesqPraca: TDataSetProvider
    DataSet = qryPesqPraca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 96
  end
  object cdsPesqPraca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqPraca'
    Left = 80
    Top = 144
    object cdsPesqPracaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqPracaGENE_DESCR: TStringField
      DisplayLabel = 'Pra'#231'a'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqPracaGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsPesqPracaGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      Size = 250
    end
  end
  object qryRelPracas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CD.GENE_ID,'
      '      CD.GENE_DESCR,'
      '      CD.GENE_PAR1,'
      '      CD.GENE_PAR2'
      'FROM  GENERICA CD'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 176
    Top = 48
  end
  object dspRelPracas: TDataSetProvider
    DataSet = qryRelPracas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 96
  end
  object cdsRelPracas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelPracas'
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
    object StringField2: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsRelPracasGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      Size = 250
    end
  end
  object dsRelPracas: TDataSource
    DataSet = cdsRelPracas
    Left = 176
    Top = 192
  end
end
