inherited dmTeleAtendimentoOS: TdmTeleAtendimentoOS
  OldCreateOrder = True
  Height = 375
  Width = 744
  object qryClientes: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_EMPR_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_GENE_EMPR_ID_PRACA,'
      '      CL.CLIE_GENE_TGEN_ID_PRACA,'
      '      CL.CLIE_GENE_ID_PRACA,'
      '      CL.CLIE_GENE_EMPR_ID_ROTA,'
      '      CL.CLIE_GENE_TGEN_ID_ROTA,'
      '      CL.CLIE_GENE_ID_ROTA,'
      '      CL.CLIE_RG,'
      '      CL.CLIE_TIPO,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_USER_ID_VENDEDOR,'
      '      CL.CLIE_SITE,'
      '      CL.CLIE_EMAIL,'
      '      CL.CLIE_ATIVO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_OBS,'
      '      CL.CLIE_LIMITE_CREDITO,'
      '      CL.CLIE_ACEITA_ULT_LIMITE_CRED,'
      '      CL.CLIE_TIPO_VENDA,'
      '      CL.CLIE_TIPO_CLIENTE,'
      '      CL.CLIE_BLOQUEAR_ATENDIMENTO,'
      '      CL.CLIE_DTA_ATENDIMENTO,'
      '      CL.CLIE_HORA_ATEND,'
      '      CL.CLIE_USER_ID_ATENDENTE,'
      '      CL.CLIE_REFERENCIA,'
      '      CL.CLIE_DTA_CADASTRO,'
      '      CL.CLIE_USER_ID,'
      '      PR.GENE_DESCR               AS CIDADE,'
      '      PR.GENE_PAR1                AS UF,'
      '      VD.USER_NOME_COMPLETO       AS VENDEDOR,'
      '      RT.GENE_DESCR               AS ROTA,'
      '      RT.GENE_PAR1                AS KM_FINAL,'
      '      RT.GENE_NUMERIC1            AS VLR_FRETE,'
      '      RG.GENE_ID                  AS REGIAO_ID,'
      '      RG.GENE_DESCR               AS REGIAO,'
      '      RG.GENE_PAR1                AS AREA_TOTAL'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID        = CL.CLIE_GENE_ID_PRACA)'
      'LEFT OUTER JOIN USUARIO VD'
      'ON (VD.USER_ID        = CL.CLIE_USER_ID_VENDEDOR)'
      'LEFT OUTER JOIN GENERICA RT'
      'ON (RT.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_ROTA'
      'AND RT.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_ROTA'
      'AND RT.GENE_ID        = CL.CLIE_GENE_ID_ROTA)'
      'LEFT OUTER JOIN GENERICA RG'
      'ON (RG.GENE_EMPR_ID   = RT.GENE_GENE_EMPR_ID_PROP'
      'AND RG.GENE_TGEN_ID   = RT.GENE_GENE_TGEN_ID_PROP'
      'AND RG.GENE_ID        = RT.GENE_GENE_ID_PROD)'
      'WHERE CL.CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 48
    Top = 32
    object qryClientesCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesCLIE_EMPR_ID: TIntegerField
      FieldName = 'CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object qryClientesCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryClientesCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryClientesCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object qryClientesCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO: TStringField
      FieldName = 'CLIE_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryClientesCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object qryClientesCLIE_USER_ID_VENDEDOR: TIntegerField
      FieldName = 'CLIE_USER_ID_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_SITE: TStringField
      FieldName = 'CLIE_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCLIE_EMAIL: TStringField
      FieldName = 'CLIE_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCLIE_ATIVO: TIntegerField
      FieldName = 'CLIE_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryClientesCLIE_LIMITE_CREDITO: TFMTBCDField
      FieldName = 'CLIE_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField
      FieldName = 'CLIE_ACEITA_ULT_LIMITE_CRED'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO_VENDA: TIntegerField
      FieldName = 'CLIE_TIPO_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO_CLIENTE: TIntegerField
      FieldName = 'CLIE_TIPO_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_REFERENCIA: TStringField
      FieldName = 'CLIE_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryClientesCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_USER_ID: TIntegerField
      FieldName = 'CLIE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object qryClientesROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesKM_FINAL: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'KM_FINAL'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesVLR_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'VLR_FRETE'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object qryClientesREGIAO_ID: TIntegerField
      FieldName = 'REGIAO_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryClientesREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesAREA_TOTAL: TStringField
      DisplayLabel = #193'rea Total (KM)'
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField
      FieldName = 'CLIE_BLOQUEAR_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_DTA_ATENDIMENTO: TDateField
      FieldName = 'CLIE_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'CLIE_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_HORA_ATEND: TTimeField
      FieldName = 'CLIE_HORA_ATEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object qryClientesCLIE_TELEFONE2: TStringField
      FieldName = 'CLIE_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryClientesCLIE_TELEFONE3: TStringField
      FieldName = 'CLIE_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryClientesCLIE_TELEFONE4: TStringField
      FieldName = 'CLIE_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 80
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspClientes'
    Left = 48
    Top = 128
    object cdsClientesCLIE_DTA_ATENDIMENTO: TDateField
      DisplayLabel = 'Dt. Agendamento'
      FieldName = 'CLIE_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCLIE_HORA_ATEND: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'CLIE_HORA_ATEND'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesCLIE_EMPR_ID: TIntegerField
      FieldName = 'CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsClientesCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsClientesCLIE_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CLIE_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsClientesCLIE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsClientesCLIE_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_RG: TStringField
      DisplayLabel = 'CIC/RG'
      FieldName = 'CLIE_RG'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCLIE_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CLIE_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsClientesCLIE_USER_ID_VENDEDOR: TIntegerField
      FieldName = 'CLIE_USER_ID_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_SITE: TStringField
      FieldName = 'CLIE_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsClientesCLIE_EMAIL: TStringField
      FieldName = 'CLIE_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsClientesCLIE_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'CLIE_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClientesCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsClientesCLIE_LIMITE_CREDITO: TFMTBCDField
      DisplayLabel = 'Limite Cr'#233'd.'
      FieldName = 'CLIE_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField
      FieldName = 'CLIE_ACEITA_ULT_LIMITE_CRED'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TIPO_VENDA: TIntegerField
      FieldName = 'CLIE_TIPO_VENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TIPO_CLIENTE: TIntegerField
      FieldName = 'CLIE_TIPO_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_REFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'CLIE_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsClientesCLIE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object cdsClientesVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsClientesROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesKM_FINAL: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'KM_FINAL'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesVLR_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'VLR_FRETE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsClientesREGIAO_ID: TIntegerField
      FieldName = 'REGIAO_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsClientesREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesAREA_TOTAL: TStringField
      DisplayLabel = #193'rea Total (KM)'
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesCLIE_USER_ID: TIntegerField
      FieldName = 'CLIE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField
      FieldName = 'CLIE_BLOQUEAR_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'CLIE_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 48
    Top = 176
  end
  object qryHistorico: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '       HA.HTAT_ID,'
      '       HA.HTAT_EMPR_ID,'
      '       HA.HTAT_CLIE_ID,'
      '       HA.HTAT_CLIE_EMPR_ID,'
      '       HA.HTAT_GENE_EMPR_ID_STATUS,'
      '       HA.HTAT_GENE_TGEN_ID_STATUS,'
      '       HA.HTAT_GENE_ID_STATUS,'
      '       HA.HTAT_HISTORICO,'
      '       HA.HTAT_USER_ID_ATENDENTE,'
      '       HA.HTAT_DTA_ATENDIMENTO,'
      '       HA.HTAT_DTA_PROX_ATENDIMENTO,'
      '       HA.HTAT_DTA_CADASTRO,'
      '       HA.HTAT_USER_ID,'
      '       US.USER_LOGIN,'
      '       ST.GENE_DESCR,'
      '       ST.GENE_NUMBER1'
      '  FROM HISTORICO_ATENDIMENTO HA'
      ' INNER JOIN USUARIO US'
      '    ON (US.USER_ID          = HA.HTAT_USER_ID_ATENDENTE)'
      ' INNER JOIN GENERICA ST'
      '    ON (ST.GENE_EMPR_ID     = HA.HTAT_GENE_EMPR_ID_STATUS'
      '   AND ST.GENE_TGEN_ID      = HA.HTAT_GENE_TGEN_ID_STATUS'
      '   AND ST.GENE_ID'#9#9#9'= HA.HTAT_GENE_ID_STATUS)'
      ' WHERE HA.HTAT_EMPR_ID      = :EMPR_ID'
      '   AND HA.HTAT_CLIE_ID      = :CLIE_ID'
      '   AND HA.HTAT_CLIE_EMPR_ID = :EMPR_ID'
      ' ORDER BY HA.HTAT_DTA_ATENDIMENTO')
    SQLConnection = dmConexao.dbConexao
    Left = 144
    Top = 32
    object qryHistoricoHTAT_ID: TIntegerField
      FieldName = 'HTAT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoHTAT_EMPR_ID: TIntegerField
      FieldName = 'HTAT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoHTAT_CLIE_ID: TIntegerField
      FieldName = 'HTAT_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoHTAT_CLIE_EMPR_ID: TIntegerField
      FieldName = 'HTAT_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistoricoHTAT_GENE_EMPR_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_EMPR_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_GENE_TGEN_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_TGEN_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_GENE_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_HISTORICO: TBlobField
      FieldName = 'HTAT_HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object qryHistoricoHTAT_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'HTAT_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_DTA_ATENDIMENTO: TDateField
      FieldName = 'HTAT_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_DTA_PROX_ATENDIMENTO: TDateField
      FieldName = 'HTAT_DTA_PROX_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_DTA_CADASTRO: TDateField
      FieldName = 'HTAT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoHTAT_USER_ID: TIntegerField
      FieldName = 'HTAT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistoricoUSER_LOGIN: TStringField
      FieldName = 'USER_LOGIN'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object qryHistoricoGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Size = 250
    end
    object qryHistoricoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = []
    end
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 80
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistorico'
    OnNewRecord = cdsHistoricoNewRecord
    Left = 144
    Top = 128
    object cdsHistoricoHTAT_ID: TIntegerField
      FieldName = 'HTAT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsHistoricoHTAT_EMPR_ID: TIntegerField
      FieldName = 'HTAT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsHistoricoHTAT_CLIE_ID: TIntegerField
      FieldName = 'HTAT_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsHistoricoHTAT_CLIE_EMPR_ID: TIntegerField
      FieldName = 'HTAT_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsHistoricoHTAT_GENE_EMPR_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_EMPR_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_GENE_TGEN_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_TGEN_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_GENE_ID_STATUS: TIntegerField
      FieldName = 'HTAT_GENE_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_HISTORICO: TBlobField
      FieldName = 'HTAT_HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsHistoricoHTAT_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'HTAT_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_DTA_ATENDIMENTO: TDateField
      FieldName = 'HTAT_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_DTA_PROX_ATENDIMENTO: TDateField
      FieldName = 'HTAT_DTA_PROX_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_DTA_CADASTRO: TDateField
      FieldName = 'HTAT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoHTAT_USER_ID: TIntegerField
      FieldName = 'HTAT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHistoricoUSER_LOGIN: TStringField
      FieldName = 'USER_LOGIN'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsHistoricoGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsHistoricoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = []
      Visible = False
    end
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 144
    Top = 176
  end
  object qryListaAtendimento: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '       HA.HTAT_ID,'
      '       HA.HTAT_EMPR_ID,'
      '       HA.HTAT_CLIE_ID,'
      '       HA.HTAT_CLIE_EMPR_ID,'
      '       HA.HTAT_GENE_EMPR_ID_STATUS,'
      '       HA.HTAT_GENE_TGEN_ID_STATUS,'
      '       HA.HTAT_GENE_ID_STATUS,'
      '       HA.HTAT_HISTORICO,'
      '       HA.HTAT_USER_ID_ATENDENTE,'
      '       HA.HTAT_DTA_ATENDIMENTO,'
      '       HA.HTAT_DTA_PROX_ATENDIMENTO,'
      '       HA.HTAT_DTA_CADASTRO,'
      '       HA.HTAT_USER_ID,'
      '       US.USER_LOGIN,'
      '       ST.GENE_DESCR,'
      '       ST.GENE_NUMBER1'
      '  FROM HISTORICO_ATENDIMENTO HA'
      ' INNER JOIN USUARIO US'
      '    ON (US.USER_ID          = HA.HTAT_USER_ID_ATENDENTE)'
      ' INNER JOIN GENERICA ST'
      '    ON (ST.GENE_EMPR_ID     = HA.HTAT_GENE_EMPR_ID_STATUS'
      '   AND ST.GENE_TGEN_ID      = HA.HTAT_GENE_TGEN_ID_STATUS'
      '   AND ST.GENE_ID'#9#9#9'= HA.HTAT_GENE_ID_STATUS)'
      ' WHERE HA.HTAT_EMPR_ID      = :EMPR_ID'
      '   AND HA.HTAT_CLIE_ID      = :CLIE_ID'
      '   AND HA.HTAT_CLIE_EMPR_ID = :EMPR_ID'
      ' ORDER BY HA.HTAT_DTA_ATENDIMENTO DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 232
    Top = 32
    object IntegerField1: TIntegerField
      FieldName = 'HTAT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'HTAT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'HTAT_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'HTAT_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'HTAT_GENE_EMPR_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'HTAT_GENE_TGEN_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'HTAT_GENE_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object BlobField1: TBlobField
      FieldName = 'HTAT_HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object IntegerField8: TIntegerField
      FieldName = 'HTAT_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'HTAT_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'HTAT_DTA_PROX_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField3: TDateField
      FieldName = 'HTAT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'HTAT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryListaAtendimentoUSER_LOGIN: TStringField
      FieldName = 'USER_LOGIN'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryListaAtendimentoGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object qryListaAtendimentoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
    end
  end
  object dspListaAtendimento: TDataSetProvider
    DataSet = qryListaAtendimento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 80
  end
  object cdsListaAtendimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaAtendimento'
    OnNewRecord = cdsHistoricoNewRecord
    Left = 232
    Top = 128
    object DateField4: TDateField
      DisplayLabel = 'Dt. Atendimento'
      DisplayWidth = 16
      FieldName = 'HTAT_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField5: TDateField
      DisplayLabel = 'Dt. Prox. Atend.'
      DisplayWidth = 16
      FieldName = 'HTAT_DTA_PROX_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsListaAtendimentoGENE_DESCR: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 24
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object cdsListaAtendimentoGENE_NUMBER1: TIntegerField
      DisplayLabel = 'Pr'#243'x. Atendimento'
      DisplayWidth = 19
      FieldName = 'GENE_NUMBER1'
    end
    object cdsListaAtendimentoUSER_LOGIN: TStringField
      DisplayLabel = 'Atendente'
      DisplayWidth = 19
      FieldName = 'USER_LOGIN'
      Required = True
      FixedChar = True
      Size = 8
    end
    object IntegerField16: TIntegerField
      FieldName = 'HTAT_GENE_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object IntegerField10: TIntegerField
      FieldName = 'HTAT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField11: TIntegerField
      FieldName = 'HTAT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField12: TIntegerField
      FieldName = 'HTAT_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField13: TIntegerField
      FieldName = 'HTAT_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField14: TIntegerField
      FieldName = 'HTAT_GENE_EMPR_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object IntegerField15: TIntegerField
      FieldName = 'HTAT_GENE_TGEN_ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object BlobField2: TBlobField
      FieldName = 'HTAT_HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
      Size = 1
    end
    object IntegerField17: TIntegerField
      FieldName = 'HTAT_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object DateField6: TDateField
      FieldName = 'HTAT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object IntegerField18: TIntegerField
      FieldName = 'HTAT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dsListaAtendimento: TDataSource
    DataSet = cdsListaAtendimento
    Left = 232
    Top = 176
  end
  object qryListaEquipamentos: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PR.PROD_ID,'
      '       PR.PROD_DESCRICAO,'
      '       MC.GENE_DESCR     AS MARCA,'
      '       MD.GENE_DESCR     AS MODELO'
      '  FROM ORDEM_SERVICO OS'
      ' INNER JOIN PRODUTOS PR'
      '    ON (PR.PROD_ID     = OS.ORDS_PROD_ID_EQUIP'
      '   AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      ' INNER JOIN GENERICA MC'
      '    ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      '    AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      '    AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      ' INNER JOIN GENERICA MD'
      '    ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      '   AND MD.GENE_TGEN_ID  = PR.PROD_GENE_TGEN_ID_MODELO'
      '   AND MD.GENE_ID       = PR.PROD_GENE_ID_MODELO)'
      ' WHERE OS.ORDS_CLIE_ID      = :CLIE_ID'
      '   AND OS.ORDS_CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 344
    Top = 32
  end
  object dspListaEquipamentos: TDataSetProvider
    DataSet = qryListaEquipamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 80
  end
  object cdsListaEquipamentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspListaEquipamentos'
    OnNewRecord = cdsHistoricoNewRecord
    Left = 344
    Top = 128
    object cdsListaEquipamentosPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'PROD_ID'
      Required = True
    end
    object cdsListaEquipamentosPROD_DESCRICAO: TStringField
      DisplayLabel = 'Equipamento'
      DisplayWidth = 35
      FieldName = 'PROD_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsListaEquipamentosMARCA: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 16
      FieldName = 'MARCA'
      Size = 250
    end
    object cdsListaEquipamentosMODELO: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 15
      FieldName = 'MODELO'
      Size = 250
    end
  end
  object dsListaEquipamentos: TDataSource
    DataSet = cdsListaEquipamentos
    Left = 344
    Top = 176
  end
end
