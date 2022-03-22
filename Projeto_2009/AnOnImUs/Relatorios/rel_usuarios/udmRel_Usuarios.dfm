object dmRel_Usuarios: TdmRel_Usuarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 807
  Width = 1102
  object qryRel_Usuarios: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.dbConexao
    Left = 64
    Top = 40
  end
  object dspRel_Usuarios: TDataSetProvider
    DataSet = qryRel_Usuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 88
  end
  object cdsRel_Usuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Usuarios'
    Left = 64
    Top = 136
  end
  object dsRel_Usuarios: TDataSource
    DataSet = cdsRel_Usuarios
    Left = 64
    Top = 184
  end
  object qryRel_Empresas_Usuarios: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 40
  end
  object dspRel_Empresas_Usuarios: TDataSetProvider
    DataSet = qryRel_Empresas_Usuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 88
  end
  object cdsRel_Empresas_Usuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Empresas_Usuarios'
    Left = 192
    Top = 136
  end
  object dsRel_Empresas_Usuarios: TDataSource
    DataSet = cdsRel_Empresas_Usuarios
    Left = 192
    Top = 184
  end
end
