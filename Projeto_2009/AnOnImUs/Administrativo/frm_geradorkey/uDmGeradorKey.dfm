inherited dmGeradorKey: TdmGeradorKey
  OldCreateOrder = True
  object qryRelClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CLIE_CNPJ_CPF,CLIE_RAZAO_SOCIAL'
      '  FROM CLIENTES'
      ' ORDER BY CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 24
  end
  object dspRelClientes: TDataSetProvider
    DataSet = qryRelClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 72
  end
  object cdsRelClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelClientes'
    Left = 56
    Top = 120
    object cdsRelClientesCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 21
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsRelClientesCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 46
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Required = True
      Size = 90
    end
  end
  object dsRelClientes: TDataSource
    DataSet = cdsRelClientes
    Left = 56
    Top = 168
  end
end
