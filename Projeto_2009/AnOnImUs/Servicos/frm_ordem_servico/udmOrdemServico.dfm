inherited dmOrdemServico: TdmOrdemServico
  OldCreateOrder = True
  Height = 468
  Width = 1024
  object qryPesqClie: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_CEP,'
      '      PR.GENE_DESCR CIDADE,'
      '      PR.GENE_PAR1  UF,'
      '      CL.CLIE_REFERENCIA,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = CL.CLIE_GENE_ID_PRACA)'
      'WHERE CL.CLIE_EMPR_ID = :EMPR_ID'
      'AND      CL.CLIE_ATIVO = 1'
      'ORDER BY'
      '      CL.CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 48
    Top = 32
  end
  object dspPesqClie: TDataSetProvider
    DataSet = qryPesqClie
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 80
  end
  object cdsPesqClie: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqClie'
    Left = 48
    Top = 128
    object cdsPesqClieCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'CLIE_ID'
    end
    object cdsPesqClieCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqClieCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsPesqClieCLIE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIE_ENDERECO'
      Size = 150
    end
    object cdsPesqClieCLIE_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLIE_BAIRRO'
      Size = 100
    end
    object cdsPesqClieCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsPesqClieUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object cdsPesqClieCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object cdsPesqClieCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object cdsPesqClieCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object cdsPesqClieCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object cdsPesqClieCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsPesqClieCLIE_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsPesqClieCLIE_REFERENCIA: TStringField
      DisplayLabel = 'Ponto Refer'#234'ncia'
      FieldName = 'CLIE_REFERENCIA'
      Size = 150
    end
  end
  object qryPesqTabPreco: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      TPRC_ID,'
      '      TPRC_DESCRICAO'
      'FROM  TABELA_PRECO'
      'WHERE TPRC_EMPR_ID = :EMPR_ID'
      'AND   TPRC_ATIVO   = 1'
      'ORDER BY'
      '      TPRC_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 142
    Top = 32
  end
  object dspPesqTabPreco: TDataSetProvider
    DataSet = qryPesqTabPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 142
    Top = 80
  end
  object cdsPesqTabPreco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqTabPreco'
    Left = 142
    Top = 128
    object cdsPesqTabPrecoTPRC_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TPRC_ID'
    end
    object cdsPesqTabPrecoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      Size = 100
    end
  end
  object qryPesqTipoOS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 12'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 238
    Top = 32
  end
  object dspPesqTipoOS: TDataSetProvider
    DataSet = qryPesqTipoOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 238
    Top = 80
  end
  object cdsPesqTipoOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipoOS'
    Left = 238
    Top = 128
    object cdsPesqTipoOSGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqTipoOSGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de O.S.'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqTecnico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      USER_ID,'
      '      USER_LOGIN,'
      '      USER_NOME_COMPLETO'
      'FROM  USUARIO'
      'INNER JOIN USUARIO_EMPR'
      'ON (USER_ID = USEP_USER_ID)'
      'WHERE USEP_EMPR_ID = :EMPR_ID'
      'AND  USER_ATIVO = 1'
      'AND  USER_ID <> 0'
      'ORDER BY'
      '      USER_NOME_COMPLETO')
    SQLConnection = dmConexao.dbConexao
    Left = 334
    Top = 32
  end
  object dspPesqTecnico: TDataSetProvider
    DataSet = qryPesqTecnico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 334
    Top = 80
  end
  object cdsPesqTecnico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqTecnico'
    Left = 334
    Top = 128
    object cdsPesqTecnicoUSER_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USER_ID'
    end
    object cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object cdsPesqTecnicoUSER_LOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'USER_LOGIN'
      FixedChar = True
      Size = 8
    end
  end
  object qryPesqEquipamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  PRODUTOS PR'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PR.PROD_EMPR_ID = :EMPR_ID'
      'AND   PR.PROD_ATIVO   = 1'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 526
    Top = 32
  end
  object dspPesqEquipamento: TDataSetProvider
    DataSet = qryPesqEquipamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 526
    Top = 80
  end
  object cdsPesqEquipamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqEquipamento'
    Left = 526
    Top = 128
    object cdsPesqEquipamentoPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PROD_ID'
    end
    object cdsPesqEquipamentoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Equipamento'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqEquipamentoPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqEquipamentoPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object cdsPesqEquipamentoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqEquipamentoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object qryOrdemServico: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OS.*,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      TP.TPRC_DESCRICAO,'
      '      OT.GENE_DESCR TIPO_OS,'
      '      US.USER_NOME_COMPLETO,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      UC.USER_NOME_COMPLETO USER_CANC,'
      '      CL.CLIE_GENE_ID_ROTA,'
      '      ST.GENE_DESCR AS STATUS_OS,'
      '      TA.GENE_DESCR AS TIPO_AGENDAMENTO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN CLIENTES CL'
      'ON (OS.ORDS_CLIE_ID      = CL.CLIE_ID'
      'AND OS.ORDS_CLIE_EMPR_ID = CL.CLIE_EMPR_ID)'
      'INNER JOIN TABELA_PRECO TP'
      'ON (OS.ORDS_TPRC_ID      = TP.TPRC_ID'
      'AND OS.ORDS_TPRC_EMPR_ID = TP.TPRC_EMPR_ID)'
      'INNER JOIN GENERICA OT'
      'ON (OS.ORDS_GENE_EMPR_ID_TIPO_OS = OT.GENE_EMPR_ID'
      'AND OS.ORDS_GENE_TGEN_ID_TIPO_OS = OT.GENE_TGEN_ID'
      'AND OS.ORDS_GENE_ID_TIPO_OS      = OT.GENE_ID)'
      'INNER JOIN USUARIO US'
      'ON (OS.ORDS_USER_ID_TEC = US.USER_ID)'
      'INNER JOIN PRODUTOS PR'
      'ON (OS.ORDS_PROD_ID_EQUIP      = PR.PROD_ID'
      'AND OS.ORDS_PROD_EMPR_ID_EQUIP = PR.PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (PR.PROD_GENE_EMPR_ID_MARCA = MC.GENE_EMPR_ID'
      'AND PR.PROD_GENE_TGEN_ID_MARCA = MC.GENE_TGEN_ID'
      'AND PR.PROD_GENE_ID_MARCA      = MC.GENE_ID)'
      'INNER JOIN GENERICA MD'
      'ON (PR.PROD_GENE_EMPR_ID_MODELO = MD.GENE_EMPR_ID'
      'AND PR.PROD_GENE_TGEN_ID_MODELO = MD.GENE_TGEN_ID'
      'AND PR.PROD_GENE_ID_MODELO      = MD.GENE_ID)'
      'LEFT OUTER JOIN FORNECEDORES FN'
      'ON (OS.ORDS_FORN_ID_EQUIP = FN.FORN_ID)'
      'LEFT OUTER JOIN USUARIO UC'
      'ON (OS.ORDS_USER_ID_CANC = UC.USER_ID)'
      'LEFT OUTER JOIN GENERICA ST'
      'ON (ST.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_STATUS_OS'
      'AND ST.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_STATUS_OS'
      'AND ST.GENE_ID            = OS.ORDS_GENE_ID_STATUS_OS)'
      'INNER JOIN GENERICA TA'
      'ON (TA.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TP_AGEND'
      'AND TA.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TP_AGEND'
      'AND TA.GENE_ID            = OS.ORDS_GENE_ID_TP_AGEND)'
      'WHERE OS.ORDS_EMPR_ID = :EMPR_ID'
      'AND   OS.ORDS_STATUS IN (0,1)'
      'ORDER BY'
      '      OS.ORDS_STATUS, OS.ORDS_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 46
    Top = 248
    object qryOrdemServicoORDS_ID: TIntegerField
      FieldName = 'ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoORDS_EMPR_ID: TIntegerField
      FieldName = 'ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoORDS_CLIE_ID: TIntegerField
      FieldName = 'ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoORDS_TPRC_ID: TIntegerField
      FieldName = 'ORDS_TPRC_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_TPRC_EMPR_ID: TIntegerField
      FieldName = 'ORDS_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_DTA_INSTALACAO: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_GENE_EMPR_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_GENE_TGEN_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_GENE_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_STATUS: TIntegerField
      FieldName = 'ORDS_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_USER_ID_TEC: TIntegerField
      FieldName = 'ORDS_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_PROD_EMPR_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_EMPR_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_NR_PEDIDO_SERIE: TStringField
      FieldName = 'ORDS_NR_PEDIDO_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoORDS_VLR_DESCONTO: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoORDS_VLR_PAGO: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoORDS_OBSERVACAO: TBlobField
      FieldName = 'ORDS_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryOrdemServicoORDS_INFORMACOES: TBlobField
      FieldName = 'ORDS_INFORMACOES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryOrdemServicoORDS_USER_ID_CANC: TIntegerField
      FieldName = 'ORDS_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_MOTIVO_CANC: TStringField
      FieldName = 'ORDS_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryOrdemServicoORDS_DTA_CANC: TDateField
      FieldName = 'ORDS_DTA_CANC'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_DTA_CADASTRO: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_USER_ID: TIntegerField
      FieldName = 'ORDS_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInWhere]
      Size = 150
    end
    object qryOrdemServicoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryOrdemServicoTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryOrdemServicoUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryOrdemServicoPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryOrdemServicoPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryOrdemServicoMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryOrdemServicoMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryOrdemServicoUSER_CANC: TStringField
      FieldName = 'USER_CANC'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryOrdemServicoPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object qryOrdemServicoORDS_BAIXADO_ESTOQUE: TIntegerField
      FieldName = 'ORDS_BAIXADO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoORDS_FORN_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_FORN_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object qryOrdemServicoCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = []
    end
    object qryOrdemServicoORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoORDS_GENE_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoSTATUS_OS: TStringField
      FieldName = 'STATUS_OS'
      ProviderFlags = []
      Size = 250
    end
    object qryOrdemServicoORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoORDS_GENE_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoTIPO_AGENDAMENTO: TStringField
      FieldName = 'TIPO_AGENDAMENTO'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object qryOrdemServicoORDS_GENE_EMPR_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_GENE_TGEN_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_GENE_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_CLIE_ID_GARANTIA: TIntegerField
      FieldName = 'ORDS_CLIE_ID_GARANTIA'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_CLIE_EMPR_ID_GARANTIA: TIntegerField
      FieldName = 'ORDS_CLIE_EMPR_ID_GARANTIA'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoORDS_DTA_ENTREGA: TDateField
      FieldName = 'ORDS_DTA_ENTREGA'
    end
    object qryOrdemServicoORDS_USER_ID_ENTREG: TIntegerField
      FieldName = 'ORDS_USER_ID_ENTREG'
    end
    object qryOrdemServicoORDS_HORARIO: TTimeField
      FieldName = 'ORDS_HORARIO'
    end
  end
  object dspOrdemServico: TDataSetProvider
    DataSet = qryOrdemServico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 46
    Top = 296
  end
  object cdsOrdemServico: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspOrdemServico'
    AfterEdit = cdsOrdemServicoAfterEdit
    OnCalcFields = cdsOrdemServicoCalcFields
    OnNewRecord = cdsOrdemServicoNewRecord
    OnReconcileError = cdsOrdemServicoReconcileError
    Left = 46
    Top = 344
    object cdsOrdemServicoORDS_STATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'ORDS_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrdemServicoSTATUS_OS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_OS'
      ProviderFlags = []
      Size = 250
    end
    object cdsOrdemServicoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Tipo de Corte'
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsOrdemServicoORDS_NR_PEDIDO_SERIE: TStringField
      DisplayLabel = 'Ref.:'
      FieldName = 'ORDS_NR_PEDIDO_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsOrdemServicoORDS_HORARIO: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'ORDS_HORARIO'
      Visible = False
      EditMask = '##:##'
    end
    object cdsOrdemServicoORDS_ID: TIntegerField
      DisplayLabel = 'Nr'#186' O.S.'
      FieldName = 'ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOrdemServicoTIPO_OS: TStringField
      DisplayLabel = 'Tipo O.S.'
      FieldName = 'TIPO_OS'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsOrdemServicoORDS_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOrdemServicoCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInWhere]
      Size = 150
    end
    object cdsOrdemServicoORDS_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'ORDS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrdemServicoORDS_DTA_INSTALACAO: TDateField
      DisplayLabel = 'Dt. Entrega'
      DisplayWidth = 10
      FieldName = 'ORDS_DTA_INSTALACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrdemServicoTOTALPECAS: TFloatField
      DisplayLabel = 'Total Pe'#231'as'
      FieldKind = fkCalculated
      FieldName = 'TOTALPECAS'
      Calculated = True
    end
    object cdsOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField
      DisplayLabel = 'Vlr. Total O.S.'
      FieldName = 'ORDS_VLR_TOTAL_OS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoORDS_VLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr. Desconto'
      FieldName = 'ORDS_VLR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoORDS_VLR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'ORDS_VLR_PAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoVALOR_PAGAR: TFloatField
      DisplayLabel = 'Vlr. Pagar'
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'VALOR_PAGAR'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object cdsOrdemServicoPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsOrdemServicoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object cdsOrdemServicoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 50
    end
    object cdsOrdemServicoUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 100
    end
    object cdsOrdemServicoORDS_EMPR_ID: TIntegerField
      FieldName = 'ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoORDS_TPRC_ID: TIntegerField
      FieldName = 'ORDS_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_TPRC_EMPR_ID: TIntegerField
      FieldName = 'ORDS_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_EMPR_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_TGEN_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_TIPO_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_USER_ID_TEC: TIntegerField
      FieldName = 'ORDS_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_PROD_EMPR_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_EMPR_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_OBSERVACAO: TBlobField
      FieldName = 'ORDS_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_INFORMACOES: TBlobField
      FieldName = 'ORDS_INFORMACOES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_USER_ID_CANC: TIntegerField
      FieldName = 'ORDS_USER_ID_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_MOTIVO_CANC: TStringField
      FieldName = 'ORDS_MOTIVO_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsOrdemServicoORDS_DTA_CANC: TDateField
      FieldName = 'ORDS_DTA_CANC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_USER_ID: TIntegerField
      FieldName = 'ORDS_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 100
    end
    object cdsOrdemServicoUSER_CANC: TStringField
      FieldName = 'USER_CANC'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 100
    end
    object cdsOrdemServicoPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInWhere]
      Visible = False
    end
    object cdsOrdemServicoORDS_BAIXADO_ESTOQUE: TIntegerField
      FieldName = 'ORDS_BAIXADO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_FORN_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_FORN_ID_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_RAZAO_SOCIAL'
      ProviderFlags = []
      Visible = False
      Size = 150
    end
    object cdsOrdemServicoCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = []
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_ID_TP_AGEND'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoTIPO_AGENDAMENTO: TStringField
      DisplayLabel = 'Tipo de Agendamento'
      FieldName = 'TIPO_AGENDAMENTO'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsOrdemServicoORDS_GENE_EMPR_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_TGEN_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_GENE_ID_FILTRO: TIntegerField
      FieldName = 'ORDS_GENE_ID_FILTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_CLIE_ID_GARANTIA: TIntegerField
      FieldName = 'ORDS_CLIE_ID_GARANTIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_CLIE_EMPR_ID_GARANTIA: TIntegerField
      FieldName = 'ORDS_CLIE_EMPR_ID_GARANTIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoORDS_DTA_ENTREGA: TDateField
      FieldName = 'ORDS_DTA_ENTREGA'
      Visible = False
    end
    object cdsOrdemServicoORDS_USER_ID_ENTREG: TIntegerField
      FieldName = 'ORDS_USER_ID_ENTREG'
      Visible = False
    end
  end
  object dsOrdemServico: TDataSource
    DataSet = cdsOrdemServico
    Left = 48
    Top = 392
  end
  object qryClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <
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
      'SELECT'
      '      CLIE_ID,'
      '      CLIE_DTA_CADASTRO,'
      '      CLIE_ATIVO,'
      '      CLIE_RAZAO_SOCIAL,'
      '      CLIE_FANTASIA,'
      '      CLIE_CNPJ_CPF,'
      '      CLIE_RG,'
      '      CLIE_CEP,'
      '      CLIE_ENDERECO,'
      '      CLIE_BAIRRO,'
      '      CLIE_TELEFONE1,'
      '      CLIE_TELEFONE2,'
      '      CLIE_TELEFONE3,'
      '      CLIE_TELEFONE4,'
      '      CLIE_REFERENCIA,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  CLIENTES'
      'INNER JOIN GENERICA'
      'ON (GENE_EMPR_ID   = CLIE_GENE_EMPR_ID_PRACA'
      'AND GENE_TGEN_ID   = CLIE_GENE_TGEN_ID_PRACA'
      'AND GENE_ID        = CLIE_GENE_ID_PRACA)'
      'WHERE CLIE_ID      = :CLIE_ID'
      'AND   CLIE_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 254
    Top = 248
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 254
    Top = 296
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
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
    ProviderName = 'dspClientes'
    Left = 254
    Top = 344
    object cdsClientesCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
    end
    object cdsClientesCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
    end
    object cdsClientesCLIE_ATIVO: TIntegerField
      FieldName = 'CLIE_ATIVO'
    end
    object cdsClientesCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsClientesCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsClientesCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsClientesCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      Size = 150
    end
    object cdsClientesCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      Size = 100
    end
    object cdsClientesCLIE_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      EditMask = '(##)#####-####'
      Size = 13
    end
    object cdsClientesCLIE_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      EditMask = '(##)#####-####'
      Size = 13
    end
    object cdsClientesCLIE_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      EditMask = '(##)#####-####'
      Size = 13
    end
    object cdsClientesCLIE_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object cdsClientesGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsClientesGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsClientesCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsClientesCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
    end
    object cdsClientesCLIE_REFERENCIA: TStringField
      FieldName = 'CLIE_REFERENCIA'
      Visible = False
      Size = 150
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 256
    Top = 392
  end
  object qryListaOS: TSQLQuery
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
      'SELECT'
      '      OS.ORDS_ID,'
      '      OS.ORDS_DTA_CADASTRO,'
      '      OS.ORDS_DTA_INSTALACAO,'
      '      OS.ORDS_STATUS,'
      '      CASE OS.ORDS_STATUS'
      '           WHEN 0 THEN '#39'Agendado'#39
      '           WHEN 1 THEN '#39'O.S. Real.'#39
      '           WHEN 2 THEN '#39'O.S. Paga'#39
      '           WHEN 3 THEN '#39'Cancelado'#39
      '      END AS STATUS,'
      '      OS.ORDS_VLR_TOTAL_OS,'
      '      OT.GENE_DESCR TIPO_OS,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      US.USER_NOME_COMPLETO,'
      '      OS.ORDS_NR_PEDIDO_SERIE,'
      '      OS.ORDS_OBSERVACAO,'
      '      OS.ORDS_INFORMACOES,'
      '      OS.ORDS_VLR_DESCONTO,'
      '      OS.ORDS_VLR_PAGO,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      AD.USER_NOME_COMPLETO AS ATENDENTE,'
      '      ST.GENE_DESCR         AS STATUS_OS,'
      '      OS.ORDS_GENE_EMPR_ID_STATUS_OS,'
      '      OS.ORDS_GENE_TGEN_ID_STATUS_OS,'
      '      OS.ORDS_GENE_ID_STATUS_OS,'
      '      OS.ORDS_GENE_EMPR_ID_TP_AGEND,'
      '      OS.ORDS_GENE_TGEN_ID_TP_AGEND,'
      '      OS.ORDS_GENE_ID_TP_AGEND,'
      '      TA.GENE_DESCR AS TIPO_AGENDAMENTO,'
      '      FI.GENE_DESCR AS FILTRO,'
      '      CL.CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_RG,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_REFERENCIA,'
      '      CID.GENE_DESCR     AS CIDADE,'
      '      CID.GENE_PAR1      AS UF,'
      '      OS.ORDS_HORARIO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN CLIENTES CL'
      
        'ON (CL.CLIE_ID      = COALESCE(OS.ORDS_CLIE_ID_GARANTIA,OS.ORDS_' +
        'CLIE_ID)'
      
        'AND CL.CLIE_EMPR_ID = COALESCE(OS.ORDS_CLIE_EMPR_ID_GARANTIA,OS.' +
        'ORDS_CLIE_EMPR_ID))'
      'INNER JOIN GENERICA CID'
      'ON (CID.GENE_EMPR_ID   = CLIE_GENE_EMPR_ID_PRACA'
      'AND CID.GENE_TGEN_ID   = CLIE_GENE_TGEN_ID_PRACA'
      'AND CID.GENE_ID        = CLIE_GENE_ID_PRACA)'
      'INNER JOIN GENERICA OT'
      'ON (OT.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TIPO_OS'
      'AND OT.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TIPO_OS'
      'AND OT.GENE_ID      = OS.ORDS_GENE_ID_TIPO_OS)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA FI'
      'ON (FI.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND FI.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND FI.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'LEFT OUTER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID      = OS.ORDS_FORN_ID_EQUIP)'
      'INNER JOIN USUARIO US'
      'ON (US.USER_ID      = OS.ORDS_USER_ID_TEC)'
      'INNER JOIN USUARIO AD'
      'ON (AD.USER_ID      = OS.ORDS_USER_ID)'
      'LEFT JOIN GENERICA ST'
      'ON (ST.GENE_EMPR_ID      = OS.ORDS_GENE_EMPR_ID_STATUS_OS'
      'AND ST.GENE_TGEN_ID      = OS.ORDS_GENE_TGEN_ID_STATUS_OS'
      'AND ST.GENE_ID           = OS.ORDS_GENE_ID_STATUS_OS)'
      'LEFT OUTER JOIN GENERICA TA'
      'ON (TA.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TP_AGEND'
      'AND TA.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TP_AGEND'
      'AND TA.GENE_ID = OS.ORDS_GENE_ID_TP_AGEND)'
      'WHERE OS.ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OS.ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OS.ORDS_CLIE_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      OS.ORDS_STATUS, OS.ORDS_HORARIO, OS.ORDS_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 350
    Top = 248
  end
  object dspListaOS: TDataSetProvider
    DataSet = qryListaOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 350
    Top = 296
  end
  object cdsListaOS: TClientDataSet
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
    ProviderName = 'dspListaOS'
    OnCalcFields = cdsListaOSCalcFields
    Left = 350
    Top = 344
    object cdsListaOSORDS_STATUS: TIntegerField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'ORDS_STATUS'
    end
    object cdsListaOSSTATUS_OS: TStringField
      DisplayLabel = 'Status OS'
      DisplayWidth = 25
      FieldName = 'STATUS_OS'
      Size = 25
    end
    object cdsListaOSPROD_DESCRICAO: TStringField
      DisplayLabel = 'Tipo de Corte'
      DisplayWidth = 25
      FieldName = 'PROD_DESCRICAO'
      Size = 130
    end
    object cdsListaOSORDS_NR_PEDIDO_SERIE: TStringField
      DisplayLabel = 'Ref.:'
      FieldName = 'ORDS_NR_PEDIDO_SERIE'
      Size = 15
    end
    object cdsListaOSSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsListaOSORDS_HORARIO: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'ORDS_HORARIO'
      Visible = False
    end
    object cdsListaOSTIPO_AGENDAMENTO: TStringField
      DisplayLabel = 'Tipo Agendamento'
      DisplayWidth = 30
      FieldName = 'TIPO_AGENDAMENTO'
      Visible = False
      Size = 250
    end
    object cdsListaOSORDS_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'ORDS_DTA_CADASTRO'
    end
    object cdsListaOSORDS_DTA_INSTALACAO: TDateField
      DisplayLabel = 'Dt. Entrega'
      DisplayWidth = 12
      FieldName = 'ORDS_DTA_INSTALACAO'
    end
    object cdsListaOSTOTALPECAS: TFloatField
      DisplayLabel = 'Total Pe'#231'as'
      FieldKind = fkCalculated
      FieldName = 'TOTALPECAS'
      Calculated = True
    end
    object cdsListaOSORDS_VLR_TOTAL_OS: TFMTBCDField
      DisplayLabel = 'Vlr. Total O.S.'
      DisplayWidth = 10
      FieldName = 'ORDS_VLR_TOTAL_OS'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaOSORDS_VLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr. Desconto'
      DisplayWidth = 10
      FieldName = 'ORDS_VLR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaOSORDS_VLR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      DisplayWidth = 10
      FieldName = 'ORDS_VLR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaOSVALOR_PAGAR: TFloatField
      DisplayLabel = 'Vlr. Pagar'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'VALOR_PAGAR'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object cdsListaOSORDS_ID: TIntegerField
      DisplayLabel = 'Nr'#186' O.S.'
      DisplayWidth = 7
      FieldName = 'ORDS_ID'
    end
    object cdsListaOSTIPO_OS: TStringField
      DisplayLabel = 'Tipo O.S.'
      DisplayWidth = 22
      FieldName = 'TIPO_OS'
      Size = 50
    end
    object cdsListaOSMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 18
      FieldName = 'MARCA_PROD'
      Visible = False
      Size = 50
    end
    object cdsListaOSMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 18
      FieldName = 'MODELO_PROD'
      Visible = False
      Size = 50
    end
    object cdsListaOSPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsListaOSUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      Visible = False
      Size = 100
    end
    object cdsListaOSORDS_OBSERVACAO: TBlobField
      FieldName = 'ORDS_OBSERVACAO'
      Visible = False
    end
    object cdsListaOSORDS_INFORMACOES: TBlobField
      FieldName = 'ORDS_INFORMACOES'
      Visible = False
    end
    object cdsListaOSORDS_GENE_EMPR_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TP_AGEND'
      Visible = False
    end
    object cdsListaOSFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Visible = False
      Size = 150
    end
    object cdsListaOSATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Visible = False
      Size = 100
    end
    object cdsListaOSORDS_GENE_EMPR_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_STATUS_OS'
      Visible = False
    end
    object cdsListaOSORDS_GENE_TGEN_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_STATUS_OS'
      Visible = False
    end
    object cdsListaOSORDS_GENE_ID_STATUS_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_STATUS_OS'
      Visible = False
    end
    object cdsListaOSORDS_GENE_TGEN_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TP_AGEND'
      Visible = False
    end
    object cdsListaOSORDS_GENE_ID_TP_AGEND: TIntegerField
      FieldName = 'ORDS_GENE_ID_TP_AGEND'
      Visible = False
    end
    object cdsListaOSFILTRO: TStringField
      FieldName = 'FILTRO'
      Visible = False
      Size = 250
    end
    object cdsListaOSCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
      Required = True
      Visible = False
    end
    object cdsListaOSCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Required = True
      Visible = False
      Size = 150
    end
    object cdsListaOSCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      Visible = False
      Size = 18
    end
    object cdsListaOSCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
      Visible = False
    end
    object cdsListaOSCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      Required = True
      Visible = False
      Size = 150
    end
    object cdsListaOSCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      Required = True
      Visible = False
      Size = 14
    end
    object cdsListaOSCLIE_TELEFONE2: TStringField
      FieldName = 'CLIE_TELEFONE2'
      Visible = False
      Size = 14
    end
    object cdsListaOSCLIE_TELEFONE3: TStringField
      FieldName = 'CLIE_TELEFONE3'
      Visible = False
      Size = 14
    end
    object cdsListaOSCLIE_TELEFONE4: TStringField
      FieldName = 'CLIE_TELEFONE4'
      Visible = False
      Size = 14
    end
    object cdsListaOSCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsListaOSCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      Required = True
      Visible = False
      Size = 100
    end
    object cdsListaOSCLIE_REFERENCIA: TStringField
      FieldName = 'CLIE_REFERENCIA'
      Visible = False
      Size = 150
    end
    object cdsListaOSCIDADE: TStringField
      FieldName = 'CIDADE'
      Visible = False
      Size = 250
    end
    object cdsListaOSUF: TStringField
      FieldName = 'UF'
      Visible = False
      Size = 250
    end
  end
  object dsListaOS: TDataSource
    DataSet = cdsListaOS
    OnDataChange = dsListaOSDataChange
    Left = 352
    Top = 392
  end
  object qryListaEquip: TSQLQuery
    MaxBlobSize = -1
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
      'SELECT'
      '      PR.PROD_DESCRICAO,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      FI.GENE_DESCR FILTRO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA FI'
      'ON (FI.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND FI.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND FI.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'WHERE OS.ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OS.ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OS.ORDS_CLIE_EMPR_ID = :EMPR_ID'
      'GROUP BY'
      '      PR.PROD_DESCRICAO,'
      '      PR.PROD_GARANTIA,'
      '      MARCA_PROD,'
      '      MODELO_PROD,'
      '      FILTRO'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 446
    Top = 248
  end
  object dspListaEquip: TDataSetProvider
    DataSet = qryListaEquip
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 446
    Top = 296
  end
  object cdsListaEquip: TClientDataSet
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
    ProviderName = 'dspListaEquip'
    Left = 446
    Top = 344
    object cdsListaEquipPROD_DESCRICAO: TStringField
      DisplayLabel = 'Equipamento'
      DisplayWidth = 25
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsListaEquipPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      DisplayWidth = 8
      FieldName = 'PROD_GARANTIA'
    end
    object cdsListaEquipMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 15
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsListaEquipMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 15
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsListaEquipFILTRO: TStringField
      DisplayLabel = 'Filtro'
      DisplayWidth = 75
      FieldName = 'FILTRO'
      Size = 75
    end
  end
  object dsListaEquip: TDataSource
    DataSet = cdsListaEquip
    Left = 448
    Top = 392
  end
  object qryListaPecas: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
      'SELECT'
      '      OI.ODIT_TPIT_PROD_ID,'
      '      OI.ODIT_VLR_UNITARIO,'
      '      OI.ODIT_QTDE,'
      '      OI.ODIT_VLR_TOTAL,'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      TF.GENE_IMAGE'
      'FROM  ORDEM_SERVICO_ITENS OI'
      'INNER JOIN ORDEM_SERVICO  OS'
      '  ON (OS.ORDS_ID          = OI.ODIT_ORDS_ID'
      ' AND  OS.ORDS_EMPR_ID     = OI.ODIT_ORDS_EMPR_ID)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OI.ODIT_TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = OI.ODIT_TPIT_PROD_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA TF'
      'ON (TF.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND TF.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND TF.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'WHERE OI.ODIT_ORDS_ID           = :ORDS_ID'
      'AND   OI.ODIT_ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OI.ODIT_ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OI.ODIT_ORDS_CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 550
    Top = 248
  end
  object dspListaPecas: TDataSetProvider
    DataSet = qryListaPecas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 550
    Top = 296
  end
  object cdsListaPecas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspListaPecas'
    Left = 550
    Top = 344
    object cdsListaPecasODIT_TPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 7
      FieldName = 'ODIT_TPIT_PROD_ID'
    end
    object cdsListaPecasPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 22
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsListaPecasPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsListaPecasODIT_VLR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 8
      FieldName = 'ODIT_VLR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaPecasODIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 6
      FieldName = 'ODIT_QTDE'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaPecasODIT_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 8
      FieldName = 'ODIT_VLR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsListaPecasMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 25
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsListaPecasMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 25
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsListaPecasPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object cdsListaPecasPROD_ID: TIntegerField
      FieldName = 'PROD_ID'
      Visible = False
    end
    object cdsListaPecasGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      Visible = False
      Size = 1
    end
  end
  object dsListaPecas: TDataSource
    DataSet = cdsListaPecas
    Left = 552
    Top = 392
  end
  object qryPesqProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TPRC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      TI.TPIT_ID,'
      '      TI.TPIT_EMPR_ID,'
      '      TI.TPIT_TPRC_ID,'
      '      TI.TPIT_TPRC_EMPR_ID,'
      '      TI.TPIT_PROD_ID,'
      '      TI.TPIT_PROD_EMPR_ID,'
      '      TI.TPIT_DTA_VIGENCIA,'
      '      TI.TPIT_DTA_VALIDADE,'
      '      TI.TPIT_VLR_GONDOLA,'
      '      TI.TPIT_VLR_MINIMO,'
      '      TI.TPIT_VLR_ESPECIAL,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      ES.ESTQ_EST_ATUAL,'
      '      ES.ESTQ_EST_DISP,'
      '      COALESCE(PR.PROD_COD_FORN1,0) AS COD_FORNEC1,'
      '      COALESCE(PR.PROD_COD_FORN2,0) AS COD_FORNEC2,'
      '      COALESCE(PR.PROD_COD_FORN3,0) AS COD_FORNEC3,'
      '      COALESCE(PR.PROD_COD_FORN4,0) AS COD_FORNEC4'
      'FROM  TABELA_PRECO_ITENS TI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = TI.TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = TI.TPIT_PROD_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN ESTOQUE ES'
      'ON (ES.ESTQ_PROD_ID      = PR.PROD_ID'
      'AND ES.ESTQ_PROD_EMPR_ID = PR.PROD_EMPR_ID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE TI.TPIT_EMPR_ID      = :EMPR_ID'
      'AND   TI.TPIT_TPRC_ID      = :TPRC_ID'
      'AND   TI.TPIT_TPRC_EMPR_ID = :EMPR_ID'
      'AND   TI.TPIT_DTA_VIGENCIA <= :DATA'
      'AND   TI.TPIT_DTA_VALIDADE >= :DATA'
      'AND  PR.PROD_ATIVO = 1'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 430
    Top = 32
  end
  object dspPesqProduto: TDataSetProvider
    DataSet = qryPesqProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 430
    Top = 80
  end
  object cdsPesqProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TPRC_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProduto'
    Left = 430
    Top = 128
    object cdsPesqProdutoTPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'TPIT_PROD_ID'
    end
    object cdsPesqProdutoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqProdutoPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqProdutoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqProdutoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsPesqProdutoTPIT_VLR_GONDOLA: TFMTBCDField
      DisplayLabel = 'Vlr. Gondola'
      FieldName = 'TPIT_VLR_GONDOLA'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsPesqProdutoTPIT_DTA_VIGENCIA: TDateField
      DisplayLabel = 'Dt. Vig'#234'ncia'
      FieldName = 'TPIT_DTA_VIGENCIA'
    end
    object cdsPesqProdutoTPIT_DTA_VALIDADE: TDateField
      DisplayLabel = 'Dt. Validade'
      FieldName = 'TPIT_DTA_VALIDADE'
    end
    object cdsPesqProdutoPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object cdsPesqProdutoTPIT_ID: TIntegerField
      FieldName = 'TPIT_ID'
      Visible = False
    end
    object cdsPesqProdutoTPIT_EMPR_ID: TIntegerField
      FieldName = 'TPIT_EMPR_ID'
      Visible = False
    end
    object cdsPesqProdutoTPIT_TPRC_ID: TIntegerField
      FieldName = 'TPIT_TPRC_ID'
      Visible = False
    end
    object cdsPesqProdutoTPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'TPIT_TPRC_EMPR_ID'
      Visible = False
    end
    object cdsPesqProdutoTPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'TPIT_PROD_EMPR_ID'
      Visible = False
    end
    object cdsPesqProdutoTPIT_VLR_MINIMO: TFMTBCDField
      FieldName = 'TPIT_VLR_MINIMO'
      Visible = False
      Precision = 20
      Size = 4
    end
    object cdsPesqProdutoTPIT_VLR_ESPECIAL: TFMTBCDField
      FieldName = 'TPIT_VLR_ESPECIAL'
      Visible = False
      Precision = 20
      Size = 4
    end
    object cdsPesqProdutoESTQ_EST_ATUAL: TFMTBCDField
      DisplayLabel = 'Est. Atual'
      FieldName = 'ESTQ_EST_ATUAL'
      EditFormat = '0.000'
      Precision = 18
      Size = 4
    end
    object cdsPesqProdutoESTQ_EST_DISP: TFMTBCDField
      DisplayLabel = 'Est. Disp.'
      FieldName = 'ESTQ_EST_DISP'
      EditFormat = '0.000'
      Precision = 18
      Size = 4
    end
    object cdsPesqProdutoCOD_FORNEC1: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC1'
    end
    object cdsPesqProdutoCOD_FORNEC2: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC2'
    end
    object cdsPesqProdutoCOD_FORNEC3: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC3'
    end
    object cdsPesqProdutoCOD_FORNEC4: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC4'
    end
  end
  object qryOrdemServicoItens: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
      'SELECT'
      '      OI.ODIT_ID,'
      '      OI.ODIT_EMPR_ID,'
      '      OI.ODIT_ORDS_ID,'
      '      OI.ODIT_ORDS_EMPR_ID,'
      '      OI.ODIT_ORDS_CLIE_ID,'
      '      OI.ODIT_ORDS_CLIE_EMPR_ID,'
      '      OI.ODIT_TPIT_ID,'
      '      OI.ODIT_TPIT_EMPR_ID,'
      '      OI.ODIT_TPIT_TPRC_ID,'
      '      OI.ODIT_TPIT_TPRC_EMPR_ID,'
      '      OI.ODIT_TPIT_PROD_ID,'
      '      OI.ODIT_TPIT_PROD_EMPR_ID,'
      '      OI.ODIT_VLR_UNITARIO,'
      '      OI.ODIT_QTDE,'
      '      OI.ODIT_VLR_TOTAL,'
      '      OI.ODIT_USER_ID_TEC,'
      '      OI.ODIT_DTA_CADASTRO,'
      '      OI.ODIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      COALESCE(ES.ESTQ_EST_DISP,0) AS ESTQ_EST_DISP'
      'FROM  ORDEM_SERVICO_ITENS OI'
      'INNER JOIN TABELA_PRECO_ITENS TI'
      'ON (TI.TPIT_ID           = OI.ODIT_TPIT_ID'
      'AND TI.TPIT_EMPR_ID      = OI.ODIT_TPIT_EMPR_ID'
      'AND TI.TPIT_TPRC_ID      = OI.ODIT_TPIT_TPRC_ID'
      'AND TI.TPIT_TPRC_EMPR_ID = OI.ODIT_TPIT_TPRC_EMPR_ID'
      'AND TI.TPIT_PROD_ID      = OI.ODIT_TPIT_PROD_ID'
      'AND TI.TPIT_PROD_EMPR_ID = OI.ODIT_TPIT_PROD_EMPR_ID)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = TI.TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = TI.TPIT_PROD_EMPR_ID)'
      'LEFT OUTER JOIN ESTOQUE ES'
      'ON (ES.ESTQ_PROD_ID = PR.PROD_ID'
      'AND ES.ESTQ_PROD_ID = PR.PROD_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE OI.ODIT_EMPR_ID           = :EMPR_ID'
      'AND   OI.ODIT_ORDS_ID           = :ORDS_ID'
      'AND   OI.ODIT_ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OI.ODIT_ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OI.ODIT_ORDS_CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 150
    Top = 248
    object qryOrdemServicoItensODIT_ID: TIntegerField
      FieldName = 'ODIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_EMPR_ID: TIntegerField
      FieldName = 'ODIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_ORDS_ID: TIntegerField
      FieldName = 'ODIT_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_ORDS_EMPR_ID: TIntegerField
      FieldName = 'ODIT_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_ORDS_CLIE_ID: TIntegerField
      FieldName = 'ODIT_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ODIT_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOrdemServicoItensODIT_TPIT_ID: TIntegerField
      FieldName = 'ODIT_TPIT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_TPIT_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_TPIT_TPRC_ID: TIntegerField
      FieldName = 'ODIT_TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_TPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField
      FieldName = 'ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_TPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField
      FieldName = 'ODIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoItensODIT_QTDE: TFMTBCDField
      FieldName = 'ODIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField
      FieldName = 'ODIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoItensODIT_DTA_CADASTRO: TDateField
      FieldName = 'ODIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensODIT_USER_ID: TIntegerField
      FieldName = 'ODIT_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryOrdemServicoItensPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object qryOrdemServicoItensPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object qryOrdemServicoItensMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryOrdemServicoItensMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryOrdemServicoItensPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInWhere]
    end
    object qryOrdemServicoItensODIT_USER_ID_TEC: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoItensESTQ_EST_DISP: TFMTBCDField
      FieldName = 'ESTQ_EST_DISP'
      ProviderFlags = []
      Precision = 18
      Size = 4
    end
  end
  object dspOrdemServicoItens: TDataSetProvider
    DataSet = qryOrdemServicoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 150
    Top = 296
  end
  object cdsOrdemServicoItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspOrdemServicoItens'
    OnNewRecord = cdsOrdemServicoItensNewRecord
    OnReconcileError = cdsOrdemServicoItensReconcileError
    Left = 150
    Top = 344
    object cdsOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrdemServicoItensPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 40
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object cdsOrdemServicoItensPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 3
    end
    object cdsOrdemServicoItensPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      DisplayWidth = 7
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = [pfInWhere]
    end
    object cdsOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 12
      FieldName = 'ODIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensODIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 12
      FieldName = 'ODIT_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 12
      FieldName = 'ODIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 20
      FieldName = 'MARCA_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsOrdemServicoItensMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'MODELO_PROD'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsOrdemServicoItensODIT_ID: TIntegerField
      FieldName = 'ODIT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_EMPR_ID: TIntegerField
      FieldName = 'ODIT_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_ORDS_ID: TIntegerField
      FieldName = 'ODIT_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_ORDS_EMPR_ID: TIntegerField
      FieldName = 'ODIT_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_ORDS_CLIE_ID: TIntegerField
      FieldName = 'ODIT_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ODIT_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_TPIT_ID: TIntegerField
      FieldName = 'ODIT_TPIT_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_TPIT_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_TPIT_TPRC_ID: TIntegerField
      FieldName = 'ODIT_TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_TPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_TPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'ODIT_TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_DTA_CADASTRO: TDateField
      FieldName = 'ODIT_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_USER_ID: TIntegerField
      FieldName = 'ODIT_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensESTQ_EST_DISP: TFMTBCDField
      FieldName = 'ESTQ_EST_DISP'
      ProviderFlags = []
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsOrdemServicoItensTOTALITENS: TAggregateField
      FieldName = 'TOTALITENS'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(ODIT_VLR_TOTAL)'
    end
  end
  object dsOrdemServicoItens: TDataSource
    DataSet = cdsOrdemServicoItens
    Left = 152
    Top = 392
  end
  object qryPesqEquipCliente: TSQLQuery
    MaxBlobSize = -1
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
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      FN.FORN_ID,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      OS.ORDS_GENE_ID_FILTRO,'
      '      FI.GENE_DESCR          AS FILTRO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA FI'
      'ON (FI.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND FI.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND FI.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'LEFT OUTER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID      = OS.ORDS_FORN_ID_EQUIP)'
      'WHERE OS.ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OS.ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OS.ORDS_CLIE_EMPR_ID = :EMPR_ID'
      'GROUP BY'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MARCA_PROD,'
      '      MODELO_PROD,'
      '      FN.FORN_ID,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      OS.ORDS_GENE_ID_FILTRO,'
      '      FI.GENE_DESCR'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 630
    Top = 32
  end
  object dspPesqEquipCliente: TDataSetProvider
    DataSet = qryPesqEquipCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 630
    Top = 80
  end
  object cdsPesqEquipCliente: TClientDataSet
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
    ProviderName = 'dspPesqEquipCliente'
    Left = 630
    Top = 128
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PROD_ID'
    end
    object StringField1: TStringField
      DisplayLabel = 'Equipamento'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object StringField2: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object StringField3: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsPesqEquipClienteFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORN_ID'
    end
    object cdsPesqEquipClienteFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqEquipClienteORDS_GENE_ID_FILTRO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ORDS_GENE_ID_FILTRO'
      Visible = False
    end
    object cdsPesqEquipClienteFILTRO: TStringField
      DisplayLabel = 'Filtro'
      FieldName = 'FILTRO'
      Size = 250
    end
  end
  object qryTipoDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 5'
      'ORDER BY'
      '      GENE_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 752
    Top = 32
  end
  object dspTipoDoc: TDataSetProvider
    DataSet = qryTipoDoc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 752
    Top = 80
  end
  object cdsTipoDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDoc'
    Left = 752
    Top = 128
    object cdsTipoDocGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsTipoDocGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de Pagamento'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryAcertos_OS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      AC.ODAC_ID,'
      '      AC.ODAC_EMPR_ID,'
      '      AC.ODAC_ORDS_ID,'
      '      AC.ODAC_ORDS_EMPR_ID,'
      '      AC.ODAC_ORDS_CLIE_ID,'
      '      AC.ODAC_ORDS_CLIE_EMPR_ID,'
      '      AC.ODAC_GENE_EMPR_ID_TIPO_DOC,'
      '      AC.ODAC_GENE_TGEN_ID_TIPO_DOC,'
      '      AC.ODAC_GENE_ID_TIPO_DOC,'
      '      AC.ODAC_GENE_EMPR_ID_BCO,'
      '      AC.ODAC_GENE_TGEN_ID_BCO,'
      '      AC.ODAC_GENE_ID_BCO,'
      '      AC.ODAC_NR_DOC,'
      '      AC.ODAC_NR_AGENCIA,'
      '      AC.ODAC_NR_CONTA,'
      '      AC.ODAC_TITULAR,'
      '      AC.ODAC_DTA_VCTO,'
      '      AC.ODAC_VLR_DOC,'
      '      AC.ODAC_STATUS,'
      '      AC.ODAC_DTA_CADASTRO,'
      '      AC.ODAC_USER_ID,'
      '      TD.GENE_DESCR TIPO_DOC,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1  COD_BANCO'
      'FROM  ORDEM_SERVICO_ACERTOS AC'
      'INNER JOIN GENERICA TD'
      'ON (TD.GENE_EMPR_ID = AC.ODAC_GENE_EMPR_ID_TIPO_DOC'
      'AND TD.GENE_TGEN_ID = AC.ODAC_GENE_TGEN_ID_TIPO_DOC'
      'AND TD.GENE_ID      = AC.ODAC_GENE_ID_TIPO_DOC)'
      'LEFT OUTER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = AC.ODAC_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = AC.ODAC_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = AC.ODAC_GENE_ID_BCO)'
      'WHERE AC.ODAC_EMPR_ID      = :EMPR_ID'
      'AND   AC.ODAC_ORDS_ID      = :ORDS_ID'
      'AND   AC.ODAC_ORDS_EMPR_ID = :EMPR_ID'
      'AND   AC.ODAC_STATUS       = 1')
    SQLConnection = dmConexao.dbConexao
    Left = 840
    Top = 32
    object qryAcertos_OSODAC_ID: TIntegerField
      FieldName = 'ODAC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_EMPR_ID: TIntegerField
      FieldName = 'ODAC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_ORDS_ID: TIntegerField
      FieldName = 'ODAC_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_ORDS_EMPR_ID: TIntegerField
      FieldName = 'ODAC_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_ORDS_CLIE_ID: TIntegerField
      FieldName = 'ODAC_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ODAC_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAcertos_OSODAC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_EMPR_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_TGEN_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_GENE_EMPR_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_EMPR_ID_BCO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_GENE_TGEN_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_TGEN_ID_BCO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_GENE_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_ID_BCO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_NR_DOC: TStringField
      FieldName = 'ODAC_NR_DOC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryAcertos_OSODAC_NR_AGENCIA: TStringField
      FieldName = 'ODAC_NR_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryAcertos_OSODAC_NR_CONTA: TStringField
      FieldName = 'ODAC_NR_CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryAcertos_OSODAC_TITULAR: TStringField
      FieldName = 'ODAC_TITULAR'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryAcertos_OSODAC_DTA_VCTO: TDateField
      FieldName = 'ODAC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_VLR_DOC: TFMTBCDField
      FieldName = 'ODAC_VLR_DOC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryAcertos_OSODAC_STATUS: TIntegerField
      FieldName = 'ODAC_STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_DTA_CADASTRO: TDateField
      FieldName = 'ODAC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSODAC_USER_ID: TIntegerField
      FieldName = 'ODAC_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryAcertos_OSTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryAcertos_OSBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object qryAcertos_OSCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
  end
  object dspAcertos_OS: TDataSetProvider
    DataSet = qryAcertos_OS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 840
    Top = 80
  end
  object cdsAcertos_OS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertos_OS'
    OnNewRecord = cdsAcertos_OSNewRecord
    Left = 840
    Top = 128
    object cdsAcertos_OSTIPO_DOC: TStringField
      DisplayLabel = 'Tipo de Pagamento'
      DisplayWidth = 35
      FieldName = 'TIPO_DOC'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsAcertos_OSODAC_VLR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      DisplayWidth = 15
      FieldName = 'ODAC_VLR_DOC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsAcertos_OSCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Banco'
      DisplayWidth = 10
      FieldName = 'COD_BANCO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsAcertos_OSBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 35
      FieldName = 'BANCO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object cdsAcertos_OSODAC_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      DisplayWidth = 25
      FieldName = 'ODAC_NR_DOC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAcertos_OSODAC_NR_AGENCIA: TStringField
      DisplayLabel = 'Nr'#186' Ag'#234'ncia'
      DisplayWidth = 25
      FieldName = 'ODAC_NR_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAcertos_OSODAC_NR_CONTA: TStringField
      DisplayLabel = 'Nr'#186' Conta'
      DisplayWidth = 25
      FieldName = 'ODAC_NR_CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsAcertos_OSODAC_TITULAR: TStringField
      DisplayLabel = 'T'#237'tular'
      DisplayWidth = 35
      FieldName = 'ODAC_TITULAR'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsAcertos_OSODAC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vecto'
      DisplayWidth = 13
      FieldName = 'ODAC_DTA_VCTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAcertos_OSODAC_ID: TIntegerField
      FieldName = 'ODAC_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_EMPR_ID: TIntegerField
      FieldName = 'ODAC_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_ORDS_ID: TIntegerField
      FieldName = 'ODAC_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_ORDS_EMPR_ID: TIntegerField
      FieldName = 'ODAC_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_ORDS_CLIE_ID: TIntegerField
      FieldName = 'ODAC_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ODAC_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_EMPR_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_EMPR_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_TGEN_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_TGEN_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_ID_TIPO_DOC: TIntegerField
      FieldName = 'ODAC_GENE_ID_TIPO_DOC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_EMPR_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_EMPR_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_TGEN_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_TGEN_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_GENE_ID_BCO: TIntegerField
      FieldName = 'ODAC_GENE_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_STATUS: TIntegerField
      FieldName = 'ODAC_STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_DTA_CADASTRO: TDateField
      FieldName = 'ODAC_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSODAC_USER_ID: TIntegerField
      FieldName = 'ODAC_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsAcertos_OSSOMA: TAggregateField
      FieldName = 'SOMA'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(ODAC_VLR_DOC)'
    end
  end
  object dsAcertos_OS: TDataSource
    DataSet = cdsAcertos_OS
    Left = 840
    Top = 184
  end
  object qryPesqBanco: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 505'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 936
    Top = 32
  end
  object dspPesqBanco: TDataSetProvider
    DataSet = qryPesqBanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 936
    Top = 80
  end
  object cdsPesqBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqBanco'
    Left = 936
    Top = 128
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqBancoGENE_PAR1: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Tipo de Pagamento'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryListaPecasRequisicao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
      'SELECT'
      '      OI.ODIT_TPIT_PROD_ID,'
      '      OI.ODIT_VLR_UNITARIO,'
      '      OI.ODIT_QTDE,'
      '      OI.ODIT_VLR_TOTAL,'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      OI.ODIT_ORDS_ID'
      'FROM  ORDEM_SERVICO_ITENS OI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OI.ODIT_TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = OI.ODIT_TPIT_PROD_EMPR_ID)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE OI.ODIT_ORDS_ID              = :ORDS_ID'
      'AND   OI.ODIT_ORDS_EMPR_ID         = :EMPR_ID'
      'AND   OI.ODIT_ORDS_CLIE_ID         = :CLIE_ID'
      'AND   OI.ODIT_ORDS_CLIE_EMPR_ID    = :EMPR_ID'
      'AND   PR.PROD_GENE_EMPR_ID_TP_PROD = 0'
      'AND   PR.PROD_GENE_TGEN_ID_TP_PROD = 10'
      'AND   PR.PROD_GENE_ID_TP_PROD NOT IN (2)')
    SQLConnection = dmConexao.dbConexao
    Left = 750
    Top = 248
  end
  object dspListaPecasRequisicao: TDataSetProvider
    DataSet = qryListaPecasRequisicao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 750
    Top = 296
  end
  object cdsListaPecasRequisicao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ORDS_ID'
        ParamType = ptInput
      end
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
    ProviderName = 'dspListaPecasRequisicao'
    Left = 750
    Top = 344
    object IntegerField4: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 7
      FieldName = 'ODIT_TPIT_PROD_ID'
    end
    object StringField6: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 22
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object StringField7: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 8
      FieldName = 'ODIT_VLR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField2: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 6
      FieldName = 'ODIT_QTDE'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField3: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 8
      FieldName = 'ODIT_VLR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object StringField8: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 25
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 25
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object IntegerField6: TIntegerField
      FieldName = 'PROD_ID'
      Visible = False
    end
    object cdsListaPecasRequisicaoODIT_ORDS_ID: TIntegerField
      FieldName = 'ODIT_ORDS_ID'
      Required = True
      Visible = False
    end
  end
  object dsListaPecasRequisicao: TDataSource
    DataSet = cdsListaPecasRequisicao
    Left = 752
    Top = 392
  end
  object dsPesqTipoOS: TDataSource
    DataSet = cdsPesqTipoOS
    Left = 240
    Top = 176
  end
  object qryPesqFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FORN_ID,'
      '      FORN_RAZAO_SOCIAL,'
      '      FORN_NOME_FANTASIA,'
      '      FORN_CNPJ_CPF'
      'FROM  FORNECEDORES'
      'ORDER BY FORN_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 640
    Top = 248
  end
  object dspPesqFornec: TDataSetProvider
    DataSet = qryPesqFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 640
    Top = 296
  end
  object cdsPesqFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqFornec'
    Left = 640
    Top = 344
    object cdsPesqFornecFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORN_ID'
      Required = True
    end
    object cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Required = True
      Size = 150
    end
    object cdsPesqFornecFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesqFornecFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORN_CNPJ_CPF'
      Required = True
      Size = 18
    end
  end
end
