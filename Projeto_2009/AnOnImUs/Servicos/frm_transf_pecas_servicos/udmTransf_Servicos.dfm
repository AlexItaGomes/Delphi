inherited dmTranf_Servicos: TdmTranf_Servicos
  OldCreateOrder = True
  object qryTransf: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OT.OSTF_ID,'
      '      OT.OSTF_EMPR_ID,'
      '      OT.OSTF_ORDS_ID,'
      '      OT.OSTF_ORDS_EMPR_ID,'
      '      OT.OSTF_ORDS_CLIE_ID,'
      '      OT.OSTF_ORDS_CLIE_EMPR_ID,'
      '      OT.OSTF_USER_ID_TEC_ORIG,'
      '      OT.OSTF_USER_ID_TEC_DEST,'
      '      OT.OSTF_DTA_CADASTRO,'
      '      OT.OSTF_USER_ID,'
      '      OS.ORDS_DTA_INSTALACAO,'
      '      OS.ORDS_PROD_ID_EQUIP,'
      '      OS.ORDS_VLR_TOTAL_OS,'
      '      OS.ORDS_VLR_DESCONTO,'
      '      OS.ORDS_VLR_PAGO,'
      '      OS.ORDS_DTA_CADASTRO,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      UO.USER_NOME_COMPLETO USER_NOME_COMPLETO_ORIG,'
      '      UD.USER_NOME_COMPLETO USER_NOME_COMPLETO_DEST'
      'FROM  ORDEM_SERVICO_TRANSF OT'
      'INNER JOIN ORDEM_SERVICO OS'
      'ON (OS.ORDS_ID           = OT.OSTF_ORDS_ID'
      'AND OS.ORDS_EMPR_ID      = OT.OSTF_ORDS_EMPR_ID'
      'AND OS.ORDS_CLIE_ID      = OT.OSTF_ORDS_CLIE_ID'
      'AND OS.ORDS_CLIE_EMPR_ID = OT.OSTF_ORDS_CLIE_EMPR_ID)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID           = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID      = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID      = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID      = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID           = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID      = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID      = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID           = PR.PROD_GENE_ID_MODELO)'
      'INNER JOIN CLIENTES CL'
      'ON (CL.CLIE_ID      = OT.OSTF_ORDS_CLIE_ID'
      'AND CL.CLIE_EMPR_ID = OT.OSTF_ORDS_CLIE_EMPR_ID)'
      'INNER JOIN USUARIO UO'
      'ON (UO.USER_ID      = OT.OSTF_USER_ID_TEC_ORIG)'
      'INNER JOIN USUARIO UD'
      'ON (UD.USER_ID      = OT.OSTF_USER_ID_TEC_DEST)'
      'WHERE OT.OSTF_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 32
    object qryTransfOSTF_ID: TIntegerField
      FieldName = 'OSTF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_EMPR_ID: TIntegerField
      FieldName = 'OSTF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_ORDS_ID: TIntegerField
      FieldName = 'OSTF_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_ORDS_EMPR_ID: TIntegerField
      FieldName = 'OSTF_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_ORDS_CLIE_ID: TIntegerField
      FieldName = 'OSTF_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'OSTF_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTransfOSTF_USER_ID_TEC_ORIG: TIntegerField
      FieldName = 'OSTF_USER_ID_TEC_ORIG'
      ProviderFlags = [pfInUpdate]
    end
    object qryTransfOSTF_USER_ID_TEC_DEST: TIntegerField
      FieldName = 'OSTF_USER_ID_TEC_DEST'
      ProviderFlags = [pfInUpdate]
    end
    object qryTransfOSTF_DTA_CADASTRO: TDateField
      FieldName = 'OSTF_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryTransfOSTF_USER_ID: TIntegerField
      FieldName = 'OSTF_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryTransfCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object qryTransfUSER_NOME_COMPLETO_ORIG: TStringField
      FieldName = 'USER_NOME_COMPLETO_ORIG'
      ProviderFlags = []
      Size = 100
    end
    object qryTransfUSER_NOME_COMPLETO_DEST: TStringField
      FieldName = 'USER_NOME_COMPLETO_DEST'
      ProviderFlags = []
      Size = 100
    end
    object qryTransfORDS_DTA_INSTALACAO: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
      ProviderFlags = []
    end
    object qryTransfORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
      ProviderFlags = []
    end
    object qryTransfORDS_VLR_TOTAL_OS: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      ProviderFlags = []
      Precision = 20
      Size = 4
    end
    object qryTransfORDS_VLR_DESCONTO: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      ProviderFlags = []
      Precision = 20
      Size = 4
    end
    object qryTransfORDS_VLR_PAGO: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      ProviderFlags = []
      Precision = 20
      Size = 4
    end
    object qryTransfORDS_DTA_CADASTRO: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
      ProviderFlags = []
    end
    object qryTransfPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryTransfPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryTransfMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 250
    end
    object qryTransfMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 250
    end
  end
  object dspTransf: TDataSetProvider
    DataSet = qryTransf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 80
  end
  object cdsTransf: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspTransf'
    OnNewRecord = cdsTransfNewRecord
    Left = 72
    Top = 128
    object cdsTransfOSTF_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'OSTF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTransfOSTF_ORDS_ID: TIntegerField
      DisplayLabel = 'O.S.'
      FieldName = 'OSTF_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTransfOSTF_ORDS_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'OSTF_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTransfCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente/Fornecedor'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object cdsTransfOSTF_USER_ID_TEC_ORIG: TIntegerField
      DisplayLabel = 'C'#243'd. Tec. Orig.'
      FieldName = 'OSTF_USER_ID_TEC_ORIG'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTransfUSER_NOME_COMPLETO_ORIG: TStringField
      DisplayLabel = 'T'#233'cnico Origem'
      FieldName = 'USER_NOME_COMPLETO_ORIG'
      ProviderFlags = []
      Size = 100
    end
    object cdsTransfOSTF_USER_ID_TEC_DEST: TIntegerField
      DisplayLabel = 'C'#243'd. Tec. Dest.'
      FieldName = 'OSTF_USER_ID_TEC_DEST'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTransfUSER_NOME_COMPLETO_DEST: TStringField
      DisplayLabel = 'T'#233'cnico Destino'
      FieldName = 'USER_NOME_COMPLETO_DEST'
      ProviderFlags = []
      Size = 100
    end
    object cdsTransfOSTF_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'OSTF_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTransfOSTF_EMPR_ID: TIntegerField
      FieldName = 'OSTF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTransfOSTF_ORDS_EMPR_ID: TIntegerField
      FieldName = 'OSTF_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTransfOSTF_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'OSTF_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTransfORDS_DTA_INSTALACAO: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
      ProviderFlags = []
      Visible = False
    end
    object cdsTransfORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
      ProviderFlags = []
      Visible = False
    end
    object cdsTransfORDS_VLR_TOTAL_OS: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTransfORDS_VLR_DESCONTO: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTransfORDS_VLR_PAGO: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsTransfORDS_DTA_CADASTRO: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
      ProviderFlags = []
      Visible = False
    end
    object cdsTransfPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsTransfPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsTransfMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsTransfMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsTransfOSTF_USER_ID: TIntegerField
      FieldName = 'OSTF_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsTransf: TDataSource
    DataSet = cdsTransf
    Left = 72
    Top = 176
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
      'WHERE USER_ID     <> 0'
      'AND   USEP_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 352
    Top = 32
  end
  object dspPesqTecnico: TDataSetProvider
    DataSet = qryPesqTecnico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 352
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
    OnNewRecord = cdsTransfNewRecord
    Left = 352
    Top = 128
    object cdsPesqTecnicoUSER_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USER_ID'
    end
    object cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'Usu'#225'rio'
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
  object qryPesqCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CLIE_ID,'
      '      CLIE_RAZAO_SOCIAL,'
      '      CLIE_FANTASIA,'
      '      CLIE_CNPJ_CPF'
      'FROM  CLIENTES'
      'WHERE CLIE_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 448
    Top = 32
  end
  object dspPesqCliente: TDataSetProvider
    DataSet = qryPesqCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 80
  end
  object cdsPesqCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqCliente'
    OnNewRecord = cdsTransfNewRecord
    Left = 448
    Top = 128
    object cdsPesqClienteCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIE_ID'
    end
    object cdsPesqClienteCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqClienteCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsPesqClienteCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
  end
  object qryPesqOS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      OS.ORDS_ID,'
      '      OS.ORDS_CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      OS.ORDS_DTA_INSTALACAO,'
      '      OS.ORDS_USER_ID_TEC,'
      '      US.USER_NOME_COMPLETO,'
      '      OS.ORDS_PROD_ID_EQUIP,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      OS.ORDS_VLR_TOTAL_OS,'
      '      OS.ORDS_VLR_DESCONTO,'
      '      OS.ORDS_VLR_PAGO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN CLIENTES CL'
      'ON (CL.CLIE_ID      = OS.ORDS_CLIE_ID'
      'AND CL.CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)'
      'INNER JOIN USUARIO US'
      'ON (US.USER_ID      = OS.ORDS_USER_ID_TEC)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'INNER JOIN GENERICA UN'
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
      'WHERE OS.ORDS_EMPR_ID = :EMPR_ID'
      'AND   OS.ORDS_STATUS  = 2'
      'ORDER BY OS.ORDS_DTA_INSTALACAO DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 544
    Top = 32
  end
  object dspPesqOS: TDataSetProvider
    DataSet = qryPesqOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 544
    Top = 80
  end
  object cdsPesqOS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqOS'
    OnNewRecord = cdsTransfNewRecord
    Left = 544
    Top = 128
    object cdsPesqOSORDS_ID: TIntegerField
      DisplayLabel = 'O.S.'
      FieldName = 'ORDS_ID'
    end
    object cdsPesqOSORDS_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Clie.'
      FieldName = 'ORDS_CLIE_ID'
    end
    object cdsPesqOSCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Cliente/Fornecedor'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqOSORDS_DTA_INSTALACAO: TDateField
      DisplayLabel = 'Dt. Instala'#231#227'o'
      FieldName = 'ORDS_DTA_INSTALACAO'
    end
    object cdsPesqOSORDS_USER_ID_TEC: TIntegerField
      DisplayLabel = 'C'#243'd. Tec.'
      FieldName = 'ORDS_USER_ID_TEC'
    end
    object cdsPesqOSUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object cdsPesqOSORDS_PROD_ID_EQUIP: TIntegerField
      DisplayLabel = 'C'#243'd. Equip.'
      FieldName = 'ORDS_PROD_ID_EQUIP'
    end
    object cdsPesqOSPROD_DESCRICAO: TStringField
      DisplayLabel = 'Equipamento'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqOSPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsPesqOSMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 250
    end
    object cdsPesqOSMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 250
    end
    object cdsPesqOSORDS_VLR_TOTAL_OS: TFMTBCDField
      DisplayLabel = 'Vlr. Total O.S.'
      FieldName = 'ORDS_VLR_TOTAL_OS'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsPesqOSORDS_VLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr. Desconto'
      FieldName = 'ORDS_VLR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsPesqOSORDS_VLR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'ORDS_VLR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
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
      '      CASE PR.PROD_TIPO_COMISSAO'
      '           WHEN 0 THEN '#39'Percentual'#39
      '           WHEN 1 THEN '#39'Valor Fixo'#39
      '      END AS TIPO_COMISSAO,'
      '      PR.PROD_COMISSAO_VEND_INTERNA,'
      '      PR.PROD_COMISSAO_VEND_EXTERNO,'
      '      PR.PROD_COMISSAO_VEND_BALCAO'
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
      'INNER JOIN GENERICA UN'
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
    Left = 646
    Top = 32
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
    object qryOrdemServicoItensTIPO_COMISSAO: TStringField
      DisplayLabel = 'Tipo Comiss'#227'o'
      FieldName = 'TIPO_COMISSAO'
      FixedChar = True
      Size = 10
    end
    object qryOrdemServicoItensPROD_COMISSAO_VEND_INTERNA: TFMTBCDField
      DisplayLabel = 'Venda Interna'
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoItensPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField
      DisplayLabel = 'Venda Externa'
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      Precision = 20
      Size = 4
    end
    object qryOrdemServicoItensPROD_COMISSAO_VEND_BALCAO: TFMTBCDField
      DisplayLabel = 'Venda Balc'#227'o'
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      Precision = 20
      Size = 4
    end
  end
  object dspOrdemServicoItens: TDataSetProvider
    DataSet = qryOrdemServicoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 646
    Top = 80
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
    Left = 646
    Top = 128
    object cdsOrdemServicoItensSELEC: TIntegerField
      DisplayLabel = 'Seleciona'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'SELEC'
      Calculated = True
    end
    object cdsOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      DisplayWidth = 7
      FieldName = 'ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrdemServicoItensPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 35
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
      Visible = False
    end
    object cdsOrdemServicoItensODIT_VLR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 10
      FieldName = 'ODIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensODIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 10
      FieldName = 'ODIT_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensODIT_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
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
    object cdsOrdemServicoItensTIPO_COMISSAO: TStringField
      DisplayLabel = 'Tipo Comiss'#227'o'
      DisplayWidth = 7
      FieldName = 'TIPO_COMISSAO'
      FixedChar = True
      Size = 10
    end
    object cdsOrdemServicoItensPROD_COMISSAO_VEND_INTERNA: TFMTBCDField
      DisplayLabel = 'Venda Interna'
      DisplayWidth = 7
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField
      DisplayLabel = 'Venda Externa'
      DisplayWidth = 7
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensPROD_COMISSAO_VEND_BALCAO: TFMTBCDField
      DisplayLabel = 'Venda Balc'#227'o'
      DisplayWidth = 7
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsOrdemServicoItens: TDataSource
    DataSet = cdsOrdemServicoItens
    Left = 648
    Top = 176
  end
  object qryItensTransf: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OSTF_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      TI.OSTI_ID,'
      '      TI.OSTI_EMPR_ID,'
      '      TI.OSTI_OSTF_ID,'
      '      TI.OSTI_OSTF_EMPR_ID,'
      '      TI.OSTI_OSTF_ORDS_ID,'
      '      TI.OSTI_OSTF_ORDS_EMPR_ID,'
      '      TI.OSTI_OSTF_ORDS_CLIE_ID,'
      '      TI.OSTI_OSTF_ORDS_CLIE_EMPR_ID,'
      '      TI.OSTI_ODIT_TPIT_ID,'
      '      TI.OSTI_ODIT_TPIT_EMPR_ID,'
      '      TI.OSTI_ODIT_TPIT_TPRC_ID,'
      '      TI.OSTI_ODIT_TPIT_TPRC_EMPR_ID,'
      '      TI.OSTI_ODIT_TPIT_PROD_ID,'
      '      TI.OSTI_ODIT_TPIT_PROD_EMPR_ID,'
      '      TI.OSTI_ODIT_VLR_UNITARIO,'
      '      TI.OSTI_ODIT_QTDE,'
      '      TI.OSTI_ODIT_VLR_TOTAL,'
      '      TI.OSTI_COMISSAO_VENDA_INTERNA,'
      '      TI.OSTI_COMISSAO_VENDA_EXTERNA,'
      '      TI.OSTI_COMISSAO_VENDA_BALCAO,'
      '      TI.OSTI_DTA_CADASTRO,'
      '      TI.OSTI_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  ORDEM_SERVICO_TRANSF_ITENS TI'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = TI.OSTI_ODIT_TPIT_PROD_ID'
      'AND PR.PROD_EMPR_ID = TI.OSTI_ODIT_TPIT_PROD_EMPR_ID)'
      'INNER JOIN GENERICA UN'
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
      'WHERE TI.OSTI_EMPR_ID                = :EMPR_ID'
      'AND   TI.OSTI_OSTF_ID                = :OSTF_ID'
      'AND   TI.OSTI_OSTF_EMPR_ID           = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 176
    Top = 32
    object qryItensTransfOSTI_ID: TIntegerField
      FieldName = 'OSTI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_EMPR_ID: TIntegerField
      FieldName = 'OSTI_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_ORDS_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_ORDS_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_ORDS_CLIE_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_OSTF_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryItensTransfOSTI_ODIT_TPIT_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_TPIT_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_TPIT_TPRC_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_TPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_TPIT_PROD_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_TPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_ODIT_VLR_UNITARIO: TFMTBCDField
      FieldName = 'OSTI_ODIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_ODIT_QTDE: TFMTBCDField
      FieldName = 'OSTI_ODIT_QTDE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_ODIT_VLR_TOTAL: TFMTBCDField
      FieldName = 'OSTI_ODIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_COMISSAO_VENDA_INTERNA: TFMTBCDField
      FieldName = 'OSTI_COMISSAO_VENDA_INTERNA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_COMISSAO_VENDA_EXTERNA: TFMTBCDField
      FieldName = 'OSTI_COMISSAO_VENDA_EXTERNA'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_COMISSAO_VENDA_BALCAO: TFMTBCDField
      FieldName = 'OSTI_COMISSAO_VENDA_BALCAO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object qryItensTransfOSTI_DTA_CADASTRO: TDateField
      FieldName = 'OSTI_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfOSTI_USER_ID: TIntegerField
      FieldName = 'OSTI_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryItensTransfPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryItensTransfPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryItensTransfPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = []
    end
    object qryItensTransfMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 250
    end
    object qryItensTransfMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 250
    end
  end
  object dspItensTransf: TDataSetProvider
    DataSet = qryItensTransf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 80
  end
  object cdsItensTransf: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OSTF_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensTransf'
    OnNewRecord = cdsItensTransfNewRecord
    Left = 176
    Top = 128
    object cdsItensTransfOSTI_ODIT_TPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'OSTI_ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensTransfPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto/Servi'#231'o'
      DisplayWidth = 35
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsItensTransfPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsItensTransfOSTI_ODIT_VLR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit.'
      DisplayWidth = 10
      FieldName = 'OSTI_ODIT_VLR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfOSTI_ODIT_QTDE: TFMTBCDField
      DisplayLabel = 'Qtde'
      DisplayWidth = 10
      FieldName = 'OSTI_ODIT_QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfOSTI_ODIT_VLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
      FieldName = 'OSTI_ODIT_VLR_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 25
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 250
    end
    object cdsItensTransfMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 25
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 250
    end
    object cdsItensTransfOSTI_COMISSAO_VENDA_INTERNA: TFMTBCDField
      DisplayLabel = 'Venda Interna'
      DisplayWidth = 7
      FieldName = 'OSTI_COMISSAO_VENDA_INTERNA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfOSTI_COMISSAO_VENDA_EXTERNA: TFMTBCDField
      DisplayLabel = 'Venda Externa'
      DisplayWidth = 7
      FieldName = 'OSTI_COMISSAO_VENDA_EXTERNA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfOSTI_COMISSAO_VENDA_BALCAO: TFMTBCDField
      DisplayLabel = 'Venda Balc'#227'o'
      DisplayWidth = 7
      FieldName = 'OSTI_COMISSAO_VENDA_BALCAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsItensTransfOSTI_ID: TIntegerField
      FieldName = 'OSTI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_EMPR_ID: TIntegerField
      FieldName = 'OSTI_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_ORDS_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_ORDS_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_ORDS_CLIE_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_OSTF_ORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'OSTI_OSTF_ORDS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItensTransfOSTI_ODIT_TPIT_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_ODIT_TPIT_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_ODIT_TPIT_TPRC_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_ODIT_TPIT_TPRC_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_ODIT_TPIT_PROD_EMPR_ID: TIntegerField
      FieldName = 'OSTI_ODIT_TPIT_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_DTA_CADASTRO: TDateField
      FieldName = 'OSTI_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfOSTI_USER_ID: TIntegerField
      FieldName = 'OSTI_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsItensTransfPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = []
      Visible = False
    end
  end
  object dsItensTransf: TDataSource
    DataSet = cdsItensTransf
    Left = 176
    Top = 176
  end
end
