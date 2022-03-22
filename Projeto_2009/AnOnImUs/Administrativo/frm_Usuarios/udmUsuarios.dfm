object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 794
  Width = 1038
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 80
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    BeforeDelete = cdsUsuarioBeforeDelete
    OnNewRecord = cdsUsuarioNewRecord
    OnReconcileError = cdsUsuarioReconcileError
    Left = 88
    Top = 128
    object cdsUsuarioUSER_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'USER_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsUsuarioUSER_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'USER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuarioUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'Nome Completo'
      DisplayWidth = 15
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsUsuarioUSER_LOGIN: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 15
      FieldName = 'USER_LOGIN'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsUsuarioUSER_SENHA: TStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 15
      FieldName = 'USER_SENHA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsUsuarioUSER_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'USER_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '##/##/####'
    end
    object cdsUsuarioUSER_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'USER_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsUsuarioUSER_CEP: TStringField
      DisplayWidth = 15
      FieldName = 'USER_CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsUsuarioUSER_ENDERECO: TStringField
      DisplayWidth = 15
      FieldName = 'USER_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsUsuarioUSER_BAIRRO: TStringField
      DisplayWidth = 15
      FieldName = 'USER_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsUsuarioUSER_GENE_EMPR_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'USER_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioUSER_GENE_TGEN_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'USER_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioUSER_GENE_ID_PRACA: TIntegerField
      DisplayWidth = 15
      FieldName = 'USER_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioUSER_EMAIL: TStringField
      DisplayWidth = 15
      FieldName = 'USER_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsUsuarioUSER_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object cdsUsuarioUSER_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object cdsUsuarioUSER_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object cdsUsuarioUSER_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object cdsUsuarioGENE_DESCR: TStringField
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsUsuarioUSER_NIVEL_SENHA: TIntegerField
      FieldName = 'USER_NIVEL_SENHA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioUSER_USER_ID_SUPERVISOR: TIntegerField
      FieldName = 'USER_USER_ID_SUPERVISOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsUsuarioGENE_PAR1: TStringField
      DisplayWidth = 15
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsUsuarioUSER_VENDEDOR: TIntegerField
      FieldName = 'USER_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsUsuarioUSER_LIMITAR_PROFISSIONAIS: TIntegerField
      FieldName = 'USER_LIMITAR_PROFISSIONAIS'
      Visible = False
    end
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    OnDataChange = dsUsuarioDataChange
    Left = 88
    Top = 176
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      US.USER_ID,'
      '      US.USER_NOME_COMPLETO,'
      '      US.USER_LOGIN,'
      '      US.USER_SENHA,'
      '      US.USER_ATIVO,'
      '      US.USER_CEP,'
      '      US.USER_ENDERECO,'
      '      US.USER_BAIRRO,'
      '      US.USER_GENE_EMPR_ID_PRACA,'
      '      US.USER_GENE_TGEN_ID_PRACA,'
      '      US.USER_GENE_ID_PRACA,'
      '      US.USER_EMAIL,'
      '      US.USER_TELEFONE1,'
      '      US.USER_TELEFONE2,'
      '      US.USER_TELEFONE3,'
      '      US.USER_TELEFONE4,'
      '      US.USER_NIVEL_SENHA,'
      '      US.USER_USER_ID_SUPERVISOR,'
      '      COALESCE(US.USER_VENDEDOR,0) AS USER_VENDEDOR,'
      '      US.USER_DTA_CADASTRO,'
      '      US.USER_USER_ID,'
      '      PR.GENE_DESCR,'
      '      PR.GENE_PAR1,'
      '      SP.USER_NOME_COMPLETO AS SUPERVISOR,'
      
        '      COALESCE(US.USER_LIMITAR_PROFISSIONAIS,0) AS USER_LIMITAR_' +
        'PROFISSIONAIS'
      'FROM  USUARIO US'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = US.USER_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = US.USER_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = US.USER_GENE_ID_PRACA)'
      'LEFT OUTER JOIN USUARIO SP'
      'ON (SP.USER_USER_ID_SUPERVISOR = US.USER_ID)'
      'ORDER BY US.USER_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 88
    Top = 32
    object qryUsuarioUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryUsuarioUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryUsuarioUSER_LOGIN: TStringField
      FieldName = 'USER_LOGIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object qryUsuarioUSER_SENHA: TStringField
      FieldName = 'USER_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object qryUsuarioUSER_ATIVO: TIntegerField
      FieldName = 'USER_ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_CEP: TStringField
      FieldName = 'USER_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryUsuarioUSER_ENDERECO: TStringField
      FieldName = 'USER_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryUsuarioUSER_BAIRRO: TStringField
      FieldName = 'USER_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryUsuarioUSER_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'USER_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'USER_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_GENE_ID_PRACA: TIntegerField
      FieldName = 'USER_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_EMAIL: TStringField
      FieldName = 'USER_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryUsuarioUSER_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryUsuarioUSER_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryUsuarioUSER_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryUsuarioUSER_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'USER_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryUsuarioUSER_DTA_CADASTRO: TDateField
      FieldName = 'USER_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_USER_ID: TIntegerField
      FieldName = 'USER_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Size = 50
    end
    object qryUsuarioGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = []
      Size = 50
    end
    object qryUsuarioUSER_NIVEL_SENHA: TIntegerField
      FieldName = 'USER_NIVEL_SENHA'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioUSER_USER_ID_SUPERVISOR: TIntegerField
      FieldName = 'USER_USER_ID_SUPERVISOR'
      ProviderFlags = [pfInUpdate]
    end
    object qryUsuarioSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      ProviderFlags = []
      Size = 100
    end
    object qryUsuarioUSER_VENDEDOR: TIntegerField
      FieldName = 'USER_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryUsuarioUSER_LIMITAR_PROFISSIONAIS: TIntegerField
      FieldName = 'USER_LIMITAR_PROFISSIONAIS'
    end
  end
  object qryPesq_Praca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 192
    Top = 32
  end
  object dspPesq_Praca: TDataSetProvider
    DataSet = qryPesq_Praca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 80
  end
  object cdsPesq_Praca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Praca'
    Left = 192
    Top = 128
    object cdsPesq_PracaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
    end
    object cdsPesq_PracaGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesq_PracaGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 15
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object dspProfissionais: TDataSetProvider
    DataSet = qryProfissionais
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 88
  end
  object cdsProfissionais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'USER_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspProfissionais'
    BeforeDelete = cdsUsuarioBeforeDelete
    OnNewRecord = cdsUsuarioNewRecord
    OnReconcileError = cdsUsuarioReconcileError
    Left = 296
    Top = 136
    object cdsProfissionaisUSPR_ID: TIntegerField
      FieldName = 'USPR_ID'
      Required = True
    end
    object cdsProfissionaisUSPR_USER_ID_USUARIO: TIntegerField
      FieldName = 'USPR_USER_ID_USUARIO'
      Required = True
    end
    object cdsProfissionaisUSPR_USER_ID_PROFISSIONAL: TIntegerField
      FieldName = 'USPR_USER_ID_PROFISSIONAL'
      Required = True
    end
    object cdsProfissionaisUSPR_DTA_CADASTRO: TDateField
      FieldName = 'USPR_DTA_CADASTRO'
      Required = True
    end
    object cdsProfissionaisUSPR_USER_ID: TIntegerField
      FieldName = 'USPR_USER_ID'
      Required = True
    end
  end
  object dsProfissionais: TDataSource
    DataSet = cdsProfissionais
    Left = 296
    Top = 184
  end
  object qryProfissionais: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'USER_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      '  FROM USUARIO_PROFISSIONAIS'
      ' WHERE USPR_USER_ID_USUARIO = :USER_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 296
    Top = 40
    object qryProfissionaisUSPR_ID: TIntegerField
      FieldName = 'USPR_ID'
      Required = True
    end
    object qryProfissionaisUSPR_USER_ID_USUARIO: TIntegerField
      FieldName = 'USPR_USER_ID_USUARIO'
      Required = True
    end
    object qryProfissionaisUSPR_USER_ID_PROFISSIONAL: TIntegerField
      FieldName = 'USPR_USER_ID_PROFISSIONAL'
      Required = True
    end
    object qryProfissionaisUSPR_DTA_CADASTRO: TDateField
      FieldName = 'USPR_DTA_CADASTRO'
      Required = True
    end
    object qryProfissionaisUSPR_USER_ID: TIntegerField
      FieldName = 'USPR_USER_ID'
      Required = True
    end
  end
end
