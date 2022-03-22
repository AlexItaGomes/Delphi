inherited dmRel_Ordem_Servico: TdmRel_Ordem_Servico
  OldCreateOrder = True
  Height = 723
  Width = 963
  object qryRel_Ordem_Servico: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      '#39'ETIQUETA'#39' AS ETIQUETA,'
      '      OS.ORDS_ID,'
      '      OS.ORDS_EMPR_ID,'
      '      OS.ORDS_CLIE_ID,'
      '      OS.ORDS_CLIE_EMPR_ID,'
      '      OS.ORDS_TPRC_ID,'
      '      OS.ORDS_TPRC_EMPR_ID,'
      '      OS.ORDS_DTA_INSTALACAO,'
      '      OS.ORDS_GENE_EMPR_ID_TIPO_OS,'
      '      OS.ORDS_GENE_TGEN_ID_TIPO_OS,'
      '      OS.ORDS_GENE_ID_TIPO_OS,'
      '      OS.ORDS_STATUS,'
      '      OS.ORDS_USER_ID_TEC,'
      '      OS.ORDS_PROD_ID_EQUIP,'
      '      OS.ORDS_PROD_EMPR_ID_EQUIP,'
      '      OS.ORDS_FORN_ID_EQUIP,'
      '      OS.ORDS_NR_PEDIDO_SERIE,'
      '      OS.ORDS_VLR_TOTAL_OS,'
      '      OS.ORDS_VLR_DESCONTO,'
      '      OS.ORDS_VLR_PAGO,'
      '      OS.ORDS_OBSERVACAO,'
      '      OS.ORDS_INFORMACOES,'
      '      OS.ORDS_USER_ID_CANC,'
      '      OS.ORDS_MOTIVO_CANC,'
      '      OS.ORDS_DTA_CANC,'
      '      OS.ORDS_DTA_ENTREGA,'
      '      OS.ORDS_USER_ID_ENTREG,'
      '      OS.ORDS_BAIXADO_ESTOQUE,'
      '      OS.ORDS_DTA_CADASTRO,'
      '      OS.ORDS_USER_ID,'
      '      CL.CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_RG,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_REFERENCIA,'
      '      PC.GENE_DESCR PRACA,'
      '      PC.GENE_PAR1  UF,'
      '      TP.GENE_DESCR TIPO_OS,'
      '      CASE OS.ORDS_STATUS'
      '           WHEN 0 THEN '#39'Agendado'#39
      '           WHEN 1 THEN '#39'Realizado'#39
      '           WHEN 2 THEN '#39'Real./Pago'#39
      '           WHEN 3 THEN '#39'Cancelado'#39
      '      END AS ORDS_STATUS,'
      '      TC.USER_NOME_COMPLETO,'
      '      PR.PROD_DESCRICAO,'
      '      PR.PROD_GARANTIA,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      US.USER_NOME_COMPLETO AS ATENDENTE,'
      '      FN.FORN_ID,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      ST.GENE_DESCR         AS STATUS_OS,'
      '      TA.GENE_DESCR        AS TIPO_AGENDAMENTO,'
      '      FI.GENE_DESCR        AS FILTRO,'
      '      OS.ORDS_HORARIO'
      'FROM  ORDEM_SERVICO OS'
      'INNER JOIN CLIENTES CL'
      'ON (CL.CLIE_ID      = OS.ORDS_CLIE_ID'
      'AND CL.CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)'
      'INNER JOIN GENERICA PC'
      'ON (PC.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PC.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PC.GENE_ID      = CL.CLIE_GENE_ID_PRACA)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TIPO_OS'
      'AND TP.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TIPO_OS'
      'AND TP.GENE_ID      = OS.ORDS_GENE_ID_TIPO_OS)'
      'INNER JOIN USUARIO TC'
      'ON (TC.USER_ID      = OS.ORDS_USER_ID_TEC)'
      'INNER JOIN PRODUTOS PR'
      'ON (PR.PROD_ID      = OS.ORDS_PROD_ID_EQUIP'
      'AND PR.PROD_EMPR_ID = OS.ORDS_PROD_EMPR_ID_EQUIP)'
      'LEFT OUTER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'LEFT OUTER JOIN GENERICA FI'
      'ON (FI.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND FI.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND FI.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'INNER JOIN USUARIO US'
      'ON (US.USER_ID      = OS.ORDS_USER_ID)'
      'LEFT OUTER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID      = OS.ORDS_FORN_ID_EQUIP)'
      'LEFT OUTER JOIN GENERICA ST'
      'ON (ST.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_STATUS_OS'
      'AND ST.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_STATUS_OS'
      'AND ST.GENE_ID      = OS.ORDS_GENE_ID_STATUS_OS)'
      'LEFT OUTER JOIN GENERICA TA'
      'ON (TA.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_TP_AGEND'
      'AND TA.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_TP_AGEND'
      'AND TA.GENE_ID      = OS.ORDS_GENE_ID_TP_AGEND)')
    SQLConnection = dmConexao.dbConexao
    Left = 64
    Top = 24
  end
  object dspRel_Ordem_Servico: TDataSetProvider
    DataSet = qryRel_Ordem_Servico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 72
  end
  object cdsRel_Ordem_Servico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel_Ordem_Servico'
    Left = 64
    Top = 120
    object cdsRel_Ordem_ServicoORDS_ID: TIntegerField
      FieldName = 'ORDS_ID'
      DisplayFormat = '00000'
    end
    object cdsRel_Ordem_ServicoORDS_EMPR_ID: TIntegerField
      FieldName = 'ORDS_EMPR_ID'
    end
    object cdsRel_Ordem_ServicoORDS_CLIE_ID: TIntegerField
      FieldName = 'ORDS_CLIE_ID'
      DisplayFormat = '00000'
    end
    object cdsRel_Ordem_ServicoORDS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'ORDS_CLIE_EMPR_ID'
    end
    object cdsRel_Ordem_ServicoORDS_TPRC_ID: TIntegerField
      FieldName = 'ORDS_TPRC_ID'
      DisplayFormat = '00000'
    end
    object cdsRel_Ordem_ServicoORDS_TPRC_EMPR_ID: TIntegerField
      FieldName = 'ORDS_TPRC_EMPR_ID'
    end
    object cdsRel_Ordem_ServicoORDS_DTA_INSTALACAO: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
    end
    object cdsRel_Ordem_ServicoORDS_GENE_EMPR_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_EMPR_ID_TIPO_OS'
    end
    object cdsRel_Ordem_ServicoORDS_GENE_TGEN_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_TGEN_ID_TIPO_OS'
    end
    object cdsRel_Ordem_ServicoORDS_GENE_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_TIPO_OS'
    end
    object cdsRel_Ordem_ServicoORDS_STATUS: TIntegerField
      FieldName = 'ORDS_STATUS'
    end
    object cdsRel_Ordem_ServicoORDS_USER_ID_TEC: TIntegerField
      FieldName = 'ORDS_USER_ID_TEC'
      DisplayFormat = '00000'
    end
    object cdsRel_Ordem_ServicoORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
      DisplayFormat = '00000'
    end
    object cdsRel_Ordem_ServicoORDS_PROD_EMPR_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_EMPR_ID_EQUIP'
    end
    object cdsRel_Ordem_ServicoORDS_NR_PEDIDO_SERIE: TStringField
      FieldName = 'ORDS_NR_PEDIDO_SERIE'
      Size = 50
    end
    object cdsRel_Ordem_ServicoORDS_VLR_TOTAL_OS: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsRel_Ordem_ServicoORDS_VLR_DESCONTO: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsRel_Ordem_ServicoORDS_VLR_PAGO: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsRel_Ordem_ServicoORDS_OBSERVACAO: TBlobField
      FieldName = 'ORDS_OBSERVACAO'
    end
    object cdsRel_Ordem_ServicoORDS_INFORMACOES: TBlobField
      FieldName = 'ORDS_INFORMACOES'
    end
    object cdsRel_Ordem_ServicoORDS_USER_ID_CANC: TIntegerField
      FieldName = 'ORDS_USER_ID_CANC'
    end
    object cdsRel_Ordem_ServicoORDS_MOTIVO_CANC: TStringField
      FieldName = 'ORDS_MOTIVO_CANC'
      Size = 100
    end
    object cdsRel_Ordem_ServicoORDS_DTA_CANC: TDateField
      FieldName = 'ORDS_DTA_CANC'
    end
    object cdsRel_Ordem_ServicoORDS_DTA_ENTREGA: TDateField
      FieldName = 'ORDS_DTA_ENTREGA'
    end
    object cdsRel_Ordem_ServicoORDS_USER_ID_ENTREG: TIntegerField
      FieldName = 'ORDS_USER_ID_ENTREG'
    end
    object cdsRel_Ordem_ServicoORDS_BAIXADO_ESTOQUE: TIntegerField
      FieldName = 'ORDS_BAIXADO_ESTOQUE'
    end
    object cdsRel_Ordem_ServicoORDS_DTA_CADASTRO: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
    end
    object cdsRel_Ordem_ServicoORDS_USER_ID: TIntegerField
      FieldName = 'ORDS_USER_ID'
    end
    object cdsRel_Ordem_ServicoCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsRel_Ordem_ServicoCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsRel_Ordem_ServicoCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      Size = 150
    end
    object cdsRel_Ordem_ServicoCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      Size = 100
    end
    object cdsRel_Ordem_ServicoCLIE_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      Size = 14
    end
    object cdsRel_Ordem_ServicoCLIE_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsRel_Ordem_ServicoCLIE_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      Size = 14
    end
    object cdsRel_Ordem_ServicoCLIE_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      Size = 14
    end
    object cdsRel_Ordem_ServicoPRACA: TStringField
      FieldName = 'PRACA'
      Size = 50
    end
    object cdsRel_Ordem_ServicoUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object cdsRel_Ordem_ServicoTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Size = 50
    end
    object cdsRel_Ordem_ServicoORDS_STATUS_1: TStringField
      FieldName = 'ORDS_STATUS_1'
      FixedChar = True
      Size = 10
    end
    object cdsRel_Ordem_ServicoUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object cdsRel_Ordem_ServicoPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsRel_Ordem_ServicoPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
    end
    object cdsRel_Ordem_ServicoMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsRel_Ordem_ServicoMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsRel_Ordem_ServicoPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsRel_Ordem_ServicoCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsRel_Ordem_ServicoCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsRel_Ordem_ServicoCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
    end
    object cdsRel_Ordem_ServicoATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Size = 100
    end
    object cdsRel_Ordem_ServicoORDS_FORN_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_FORN_ID_EQUIP'
    end
    object cdsRel_Ordem_ServicoFORN_ID: TIntegerField
      FieldName = 'FORN_ID'
    end
    object cdsRel_Ordem_ServicoFORN_RAZAO_SOCIAL: TStringField
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsRel_Ordem_ServicoCLIE_REFERENCIA: TStringField
      FieldName = 'CLIE_REFERENCIA'
      Size = 150
    end
    object cdsRel_Ordem_ServicoSTATUS_OS: TStringField
      FieldName = 'STATUS_OS'
      Size = 250
    end
    object cdsRel_Ordem_ServicoTIPO_AGENDAMENTO: TStringField
      DisplayLabel = 'Tipo Agendamento'
      FieldName = 'TIPO_AGENDAMENTO'
      Size = 250
    end
    object cdsRel_Ordem_ServicoFILTRO: TStringField
      FieldName = 'FILTRO'
      Size = 250
    end
    object cdsRel_Ordem_ServicoETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsRel_Ordem_ServicoCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
      Required = True
    end
    object cdsRel_Ordem_ServicoORDS_HORARIO: TTimeField
      FieldName = 'ORDS_HORARIO'
    end
  end
  object dsRel_Ordem_Servico: TDataSource
    DataSet = cdsRel_Ordem_Servico
    OnDataChange = dsRel_Ordem_ServicoDataChange
    Left = 64
    Top = 168
  end
  object qryOrdemServicoItens: TSQLQuery
    MaxBlobSize = 1
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
      '      OI.ODIT_DTA_CADASTRO,'
      '      OI.ODIT_USER_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      TF.GENE_IMAGE'
      'FROM  ORDEM_SERVICO_ITENS OI'
      'INNER JOIN ORDEM_SERVICO OS'
      ' ON (OS.ORDS_ID          = OI.ODIT_ORDS_ID'
      ' AND OS.ORDS_EMPR_ID     = OI.ODIT_ORDS_EMPR_ID)'
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
      'LEFT OUTER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'LEFT OUTER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'LEFT OUTER JOIN GENERICA TF'
      'ON (TF.GENE_EMPR_ID = OS.ORDS_GENE_EMPR_ID_FILTRO'
      'AND TF.GENE_TGEN_ID = OS.ORDS_GENE_TGEN_ID_FILTRO'
      'AND TF.GENE_ID      = OS.ORDS_GENE_ID_FILTRO)'
      'WHERE OI.ODIT_EMPR_ID           = :EMPR_ID'
      'AND   OI.ODIT_ORDS_ID           = :ORDS_ID'
      'AND   OI.ODIT_ORDS_EMPR_ID      = :EMPR_ID'
      'AND   OI.ODIT_ORDS_CLIE_ID      = :CLIE_ID'
      'AND   OI.ODIT_ORDS_CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 190
    Top = 24
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
    object qryOrdemServicoItensGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      Size = 1
    end
  end
  object dspOrdemServicoItens: TDataSetProvider
    DataSet = qryOrdemServicoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 190
    Top = 72
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
    Left = 190
    Top = 120
    object cdsOrdemServicoItensODIT_TPIT_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'ODIT_TPIT_PROD_ID'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000'
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
    object cdsOrdemServicoItensGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      Size = 1
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
    Left = 192
    Top = 168
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
    Left = 320
    Top = 24
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
    Left = 320
    Top = 72
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
    Left = 320
    Top = 120
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
  end
  object dsAcertos_OS: TDataSource
    DataSet = cdsAcertos_OS
    Left = 320
    Top = 168
  end
  object qryComissao_Pecas_Servicos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      ORDS_ID,'
      '      ORDS_EMPR_ID,'
      '      ORDS_CLIE_ID,'
      '      CLIE_RAZAO_SOCIAL,'
      '      ORDS_TPRC_ID,'
      '      TPRC_DESCRICAO,'
      '      ORDS_DTA_INSTALACAO,'
      '      ORDS_GENE_ID_TIPO_OS,'
      '      DESCR_TIPO_OS,'
      '      ORDS_STATUS,'
      '      STATUS_OS,'
      '      ORDS_PROD_ID_EQUIP,'
      '      EQUIP_DESCRICAO,'
      '      EQUIP_UNIDADE,'
      '      EQUIP_MARCA,'
      '      EQUIP_MODELO,'
      '      EQUIP_FORNECEDOR,'
      '      ORDS_DTA_CADASTRO,'
      '      ORDS_USER_ID,'
      '      USER_ATENDENTE,'
      '      ORDS_VLR_PAGO,'
      '      ORDS_VLR_DESCONTO,'
      '      ORDS_VLR_TOTAL_OS,'
      '      CASE'
      
        '           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_D' +
        'ESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))'
      '           ELSE 0'
      
        '      END                                                       ' +
        '                AS VLR_PERC_DESC,'
      '      ORDS_USER_ID_TEC,'
      '      USER_NOME_TECNICO,'
      '      FILTRO,'
      '      ATENDENTE,'
      
        '      SUM(VLRCOMISSAOINTERNO)                                   ' +
        '                AS VLRCOMISSAOINTERNO,'
      
        '      SUM(VLRCOMISSAOEXTERNO)                                   ' +
        '                AS VLRCOMISSAOEXTERNO,'
      
        '      SUM(VLRCOMISSAOBALCAO)                                    ' +
        '                AS VLRCOMISSAOBALCAO,'
      '      ORDS_HORARIO,'
      '      CLIE_TELEFONE1,'
      '      CLIE_TELEFONE2,'
      '      PRACA'
      'FROM'
      '    (SELECT'
      '           OS.ORDS_ID,'
      '           OS.ORDS_EMPR_ID,'
      '           OS.ORDS_CLIE_ID,'
      '           CL.CLIE_RAZAO_SOCIAL,'
      '           OS.ORDS_TPRC_ID,'
      '           TP.TPRC_DESCRICAO,'
      '           OS.ORDS_DTA_INSTALACAO,'
      '           OS.ORDS_GENE_ID_TIPO_OS,'
      
        '           OT.GENE_DESCR                                        ' +
        '                AS DESCR_TIPO_OS,'
      '           OS.ORDS_STATUS,'
      '           CASE OS.ORDS_STATUS'
      '                WHEN 0 THEN '#39'Agendado'#39
      '                WHEN 1 THEN '#39'Realizado'#39
      '                WHEN 2 THEN '#39'Real./Pago'#39
      '                WHEN 3 THEN '#39'Cancelado'#39
      
        '           END                                                  ' +
        '                AS STATUS_OS,'
      '           OS.ORDS_PROD_ID_EQUIP,'
      
        '           EP.PROD_DESCRICAO                                    ' +
        '                AS EQUIP_DESCRICAO,'
      
        '           UEP.GENE_PAR1                                        ' +
        '               AS EQUIP_UNIDADE,'
      
        '           EM.GENE_DESCR                                        ' +
        '                AS EQUIP_MARCA,'
      
        '           ME.GENE_DESCR                                        ' +
        '                AS EQUIP_MODELO,'
      
        '           FE.FORN_RAZAO_SOCIAL                                 ' +
        '                AS EQUIP_FORNECEDOR,'
      '           OS.ORDS_DTA_CADASTRO,'
      '           OS.ORDS_USER_ID,'
      
        '           UA.USER_NOME_COMPLETO                                ' +
        '                AS USER_ATENDENTE,'
      '           OI.ODIT_TPIT_PROD_ID,'
      '           PR.PROD_DESCRICAO,'
      '           UN.GENE_PAR1 AS PROD_UNIDADE,'
      
        '           MC.GENE_DESCR                                        ' +
        '                AS MARCA_PROD,'
      
        '           MD.GENE_DESCR                                        ' +
        '                AS MODELO_PROD,'
      '           PR.PROD_TIPO_COMISSAO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      '                WHEN 0 THEN '#39'%'#39
      '                WHEN 1 THEN '#39'R$'#39
      
        '           END                                                  ' +
        '                AS TIPO_COMISSAO,'
      '           PR.PROD_COMISSAO_VEND_INTERNA,'
      '           PR.PROD_COMISSAO_VEND_EXTERNO,'
      '           PR.PROD_COMISSAO_VEND_BALCAO,'
      '           OI.ODIT_VLR_UNITARIO,'
      '           OI.ODIT_QTDE,'
      '           OI.ODIT_VLR_TOTAL,'
      '           OS.ORDS_VLR_PAGO,'
      '           OS.ORDS_VLR_DESCONTO,'
      '           OS.ORDS_VLR_TOTAL_OS,'
      '           OS.ORDS_USER_ID_TEC,'
      
        '           UT.USER_NOME_COMPLETO                                ' +
        '                AS USER_NOME_TECNICO,'
      
        '           FI.GENE_DESCR                                        ' +
        '                AS FILTRO,'
      
        '           ATE.USER_NOME_COMPLETO                               ' +
        '                AS ATENDENTE,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_INTERNA/100)'
      
        '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_INTERN' +
        'A'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOINTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_EXTERNO/100)'
      
        '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_EXTERN' +
        'O'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOEXTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_BALCAO/100)'
      '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_BALCAO'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOBALCAO,'
      '           OS.ORDS_HORARIO,'
      '           CL.CLIE_TELEFONE1,'
      '           CL.CLIE_TELEFONE2,'
      '           CL.CLIE_GENE_ID_PRACA AS PRACA'
      '     FROM  ORDEM_SERVICO OS'
      '     INNER JOIN ORDEM_SERVICO_ITENS OI'
      '     ON (OI.ODIT_ORDS_ID            = OS.ORDS_ID'
      '     AND OI.ODIT_ORDS_EMPR_ID       = OS.ORDS_EMPR_ID'
      '     AND OI.ODIT_ORDS_CLIE_ID       = OS.ORDS_CLIE_ID'
      '     AND OI.ODIT_ORDS_CLIE_EMPR_ID  = OS.ORDS_CLIE_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA FI'
      
        '     ON (FI.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_FILTR' +
        'O'
      
        '     AND FI.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_FILTR' +
        'O'
      '     AND FI.GENE_ID                 = OS.ORDS_GENE_ID_FILTRO)'
      '     INNER JOIN CLIENTES CL'
      '     ON (CL.CLIE_ID                 = OS.ORDS_CLIE_ID'
      '     AND CL.CLIE_EMPR_ID            = OS.ORDS_CLIE_EMPR_ID)'
      '     INNER JOIN TABELA_PRECO TP'
      '     ON (TP.TPRC_ID                 = OS.ORDS_TPRC_ID'
      '     AND TP.TPRC_EMPR_ID            = OS.ORDS_TPRC_EMPR_ID)'
      '     INNER JOIN GENERICA OT'
      
        '     ON (OT.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_TIPO_' +
        'OS'
      
        '     AND OT.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_TIPO_' +
        'OS'
      '     AND OT.GENE_ID                 = OS.ORDS_GENE_ID_TIPO_OS)'
      '     INNER JOIN PRODUTOS EP'
      '     ON (EP.PROD_ID                 = OS.ORDS_PROD_ID_EQUIP'
      
        '     AND EP.PROD_EMPR_ID            = OS.ORDS_PROD_EMPR_ID_EQUIP' +
        ')'
      '     LEFT OUTER JOIN GENERICA UEP'
      '     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID'
      '     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID'
      '     AND UEP.GENE_ID = EP.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA EM'
      '     ON (EM.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MARCA'
      '     AND EM.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MARCA'
      '     AND EM.GENE_ID                 = EP.PROD_GENE_ID_MARCA)'
      '     LEFT OUTER JOIN GENERICA ME'
      
        '     ON (ME.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MODEL' +
        'O'
      
        '     AND ME.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MODEL' +
        'O'
      '     AND ME.GENE_ID                 = EP.PROD_GENE_ID_MODELO)'
      '     INNER JOIN FORNECEDORES FE'
      '     ON (FE.FORN_ID                 = EP.PROD_FORN_ID)'
      '     INNER JOIN USUARIO UA'
      '     ON (UA.USER_ID                 = OS.ORDS_USER_ID)'
      '     INNER JOIN PRODUTOS PR'
      '     ON (PR.PROD_ID                 = OI.ODIT_TPIT_PROD_ID'
      '     AND PR.PROD_EMPR_ID            = OI.ODIT_TPIT_PROD_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA UN'
      '     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      '     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      '     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA MC'
      '     ON (MC.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MARCA'
      '     AND MC.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MARCA'
      '     AND MC.GENE_ID                 = PR.PROD_GENE_ID_MARCA)'
      '     LEFT OUTER JOIN GENERICA MD'
      
        '     ON (MD.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MODEL' +
        'O'
      
        '     AND MD.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MODEL' +
        'O'
      '     AND MD.GENE_ID                 = PR.PROD_GENE_ID_MODELO)'
      '     INNER JOIN USUARIO UT'
      '     ON (UT.USER_ID                 = OS.ORDS_USER_ID_TEC)'
      '     INNER JOIN USUARIO ATE'
      '     ON (ATE.USER_ID  = OS.ORDS_USER_ID)'
      '     WHERE OI.ODIT_TPIT_PROD_ID NOT IN (SELECT'
      
        '                                              OT.OSTI_ODIT_TPIT_' +
        'PROD_ID'
      
        '                                        FROM  ORDEM_SERVICO_TRAN' +
        'SF_ITENS OT'
      
        '                                        WHERE OT.OSTI_EMPR_ID   ' +
        '             = OS.ORDS_EMPR_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'ID           = OS.ORDS_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'EMPR_ID      = OS.ORDS_EMPR_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'CLIE_ID      = OS.ORDS_CLIE_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)'
      '     UNION'
      '     SELECT'
      
        '           OT.OSTF_ORDS_ID                                      ' +
        '                AS ORDS_ID,'
      
        '           OT.OSTF_ORDS_EMPR_ID                                 ' +
        '                AS ORDS_EMPR_ID,'
      
        '           OT.OSTF_ORDS_CLIE_ID                                 ' +
        '                AS ORDS_CLIE_ID,'
      '           CL.CLIE_RAZAO_SOCIAL,'
      '           OS.ORDS_TPRC_ID,'
      '           TP.TPRC_DESCRICAO,'
      '           OS.ORDS_DTA_INSTALACAO,'
      '           OS.ORDS_GENE_ID_TIPO_OS,'
      
        '           TS.GENE_DESCR                                        ' +
        '                AS DESCR_TIPO_OS,'
      '           OS.ORDS_STATUS,'
      '           CASE OS.ORDS_STATUS'
      '                WHEN 0 THEN '#39'Agendado'#39
      '                WHEN 1 THEN '#39'Realizado'#39
      '                WHEN 2 THEN '#39'Real./Pago'#39
      '                WHEN 3 THEN '#39'Cancelado'#39
      
        '           END                                                  ' +
        '                AS STATUS_OS,'
      '           OS.ORDS_PROD_ID_EQUIP,'
      
        '           EP.PROD_DESCRICAO                                    ' +
        '                AS EQUIP_DESCRICAO,'
      
        '           UEP.GENE_PAR1                                        ' +
        '               AS EQUIP_UNIDADE,'
      
        '           EM.GENE_DESCR                                        ' +
        '                AS EQUIP_MARCA,'
      
        '           ME.GENE_DESCR                                        ' +
        '                AS EQUIP_MODELO,'
      
        '           FE.FORN_RAZAO_SOCIAL                                 ' +
        '                AS EQUIP_FORNECEDOR,'
      '           OS.ORDS_DTA_CADASTRO,'
      '           OS.ORDS_USER_ID,'
      
        '           UA.USER_NOME_COMPLETO                                ' +
        '                AS USER_ATENDENTE,'
      
        '           OI.OSTI_ODIT_TPIT_PROD_ID                            ' +
        '                AS ODIT_TPIT_PROD_ID,'
      '           PR.PROD_DESCRICAO,'
      '           UN.GENE_PAR1 AS PROD_UNIDADE,'
      
        '           MC.GENE_DESCR                                        ' +
        '                AS MARCA_PROD,'
      
        '           MD.GENE_DESCR                                        ' +
        '                AS MODELO_PROD,'
      '           PR.PROD_TIPO_COMISSAO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      '                WHEN 0 THEN '#39'%'#39
      '                WHEN 1 THEN '#39'R$'#39
      
        '           END                                                  ' +
        '                AS TIPO_COMISSAO,'
      
        '           OI.OSTI_COMISSAO_VENDA_INTERNA                       ' +
        '                AS PROD_COMISSAO_VEND_INTERNA,'
      
        '           OI.OSTI_COMISSAO_VENDA_EXTERNA                       ' +
        '                AS PROD_COMISSAO_VEND_EXTERNO,'
      
        '           OI.OSTI_COMISSAO_VENDA_BALCAO                        ' +
        '                AS PROD_COMISSAO_VEND_BALCAO,'
      
        '           OI.OSTI_ODIT_VLR_UNITARIO                            ' +
        '                AS ODIT_VLR_UNITARIO,'
      
        '           OI.OSTI_ODIT_QTDE                                    ' +
        '                AS ODIT_QTDE,'
      
        '           OI.OSTI_ODIT_VLR_TOTAL                               ' +
        '                AS ODIT_VLR_TOTAL,'
      '           OS.ORDS_VLR_PAGO,'
      '           OS.ORDS_VLR_DESCONTO,'
      '           OS.ORDS_VLR_TOTAL_OS,'
      
        '           OT.OSTF_USER_ID_TEC_DEST                             ' +
        '                AS ODIT_USER_ID_TEC,'
      
        '           UT.USER_NOME_COMPLETO                                ' +
        '                AS USER_NOME_TECNICO,'
      
        '           FI.GENE_DESCR                                        ' +
        '                AS FILTRO,'
      
        '           ATE.USER_NOME_COMPLETO                               ' +
        '                AS ATENDENTE,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_INTERNA/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'INTERNA'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOINTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_EXTERNA/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'EXTERNA'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOEXTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_BALCAO/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'BALCAO'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOBALCAO,'
      '           OS.ORDS_HORARIO,'
      '           CL.CLIE_TELEFONE1,'
      '           CL.CLIE_TELEFONE2,'
      '           CL.CLIE_GENE_ID_PRACA AS PRACA'
      '     FROM  ORDEM_SERVICO_TRANSF OT'
      '     INNER JOIN ORDEM_SERVICO_TRANSF_ITENS OI'
      '     ON (OI.OSTI_OSTF_ID                   = OT.OSTF_ID'
      '     AND OI.OSTI_OSTF_EMPR_ID              = OT.OSTF_EMPR_ID'
      '     AND OI.OSTI_OSTF_ORDS_ID              = OT.OSTF_ORDS_ID'
      
        '     AND OI.OSTI_OSTF_ORDS_EMPR_ID         = OT.OSTF_ORDS_EMPR_I' +
        'D'
      
        '     AND OI.OSTI_OSTF_ORDS_CLIE_ID         = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND OI.OSTI_OSTF_ORDS_CLIE_EMPR_ID    = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     INNER JOIN ORDEM_SERVICO OS'
      '     ON (OS.ORDS_ID                        = OT.OSTF_ORDS_ID'
      
        '     AND OS.ORDS_EMPR_ID                   = OT.OSTF_ORDS_EMPR_I' +
        'D'
      
        '     AND OS.ORDS_CLIE_ID                   = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND OS.ORDS_CLIE_EMPR_ID              = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     LEFT OUTER JOIN GENERICA FI'
      
        '     ON (FI.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_I' +
        'D_FILTRO'
      
        '     AND FI.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_I' +
        'D_FILTRO'
      
        '     AND FI.GENE_ID                        = OS.ORDS_GENE_ID_FIL' +
        'TRO)'
      '     INNER JOIN CLIENTES CL'
      
        '     ON (CL.CLIE_ID                        = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND CL.CLIE_EMPR_ID                   = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     INNER JOIN TABELA_PRECO TP'
      '     ON (TP.TPRC_ID                        = OS.ORDS_TPRC_ID'
      
        '     AND TP.TPRC_EMPR_ID                   = OS.ORDS_TPRC_EMPR_I' +
        'D)'
      '     INNER JOIN GENERICA TS'
      
        '     ON (TS.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_I' +
        'D_TIPO_OS'
      
        '     AND TS.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_I' +
        'D_TIPO_OS'
      
        '     AND TS.GENE_ID                        = OS.ORDS_GENE_ID_TIP' +
        'O_OS)'
      '     INNER JOIN PRODUTOS EP'
      
        '     ON (EP.PROD_ID                        = OS.ORDS_PROD_ID_EQU' +
        'IP'
      
        '     AND EP.PROD_EMPR_ID                   = OS.ORDS_PROD_EMPR_I' +
        'D_EQUIP)'
      '     LEFT OUTER JOIN GENERICA UEP'
      '     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID'
      '     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID'
      '     AND UEP.GENE_ID    = EP.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA EM'
      
        '     ON (EM.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_I' +
        'D_MARCA'
      
        '     AND EM.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_I' +
        'D_MARCA'
      
        '     AND EM.GENE_ID                        = EP.PROD_GENE_ID_MAR' +
        'CA)'
      '     LEFT OUTER JOIN GENERICA ME'
      
        '     ON (ME.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_I' +
        'D_MODELO'
      
        '     AND ME.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_I' +
        'D_MODELO'
      
        '     AND ME.GENE_ID                        = EP.PROD_GENE_ID_MOD' +
        'ELO)'
      '     INNER JOIN FORNECEDORES FE'
      '     ON (FE.FORN_ID                        = EP.PROD_FORN_ID)'
      '     INNER JOIN USUARIO UA'
      '     ON (UA.USER_ID                        = OS.ORDS_USER_ID)'
      '     INNER JOIN PRODUTOS PR'
      
        '     ON (PR.PROD_ID                        = OI.OSTI_ODIT_TPIT_P' +
        'ROD_ID'
      
        '     AND PR.PROD_EMPR_ID                   = OI.OSTI_ODIT_TPIT_P' +
        'ROD_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA UN'
      '     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      '     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      '     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA MC'
      
        '     ON (MC.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_I' +
        'D_MARCA'
      
        '     AND MC.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_I' +
        'D_MARCA'
      
        '     AND MC.GENE_ID                        = PR.PROD_GENE_ID_MAR' +
        'CA)'
      '     LEFT OUTER JOIN GENERICA MD'
      
        '     ON (MD.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_I' +
        'D_MODELO'
      
        '     AND MD.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_I' +
        'D_MODELO'
      
        '     AND MD.GENE_ID                        = PR.PROD_GENE_ID_MOD' +
        'ELO)'
      '     INNER JOIN USUARIO UT'
      
        '     ON (UT.USER_ID                        = OT.OSTF_USER_ID_TEC' +
        '_DEST)'
      '     INNER JOIN USUARIO ATE'
      '     ON (ATE.USER_ID  = OS.ORDS_USER_ID)'
      '     )'
      'GROUP BY'
      '      ORDS_ID,'
      '      ORDS_EMPR_ID,'
      '      ORDS_CLIE_ID,'
      '      CLIE_RAZAO_SOCIAL,'
      '      ORDS_TPRC_ID,'
      '      TPRC_DESCRICAO,'
      '      ORDS_DTA_INSTALACAO,'
      '      ORDS_GENE_ID_TIPO_OS,'
      '      DESCR_TIPO_OS,'
      '      ORDS_STATUS,'
      '      STATUS_OS,'
      '      ORDS_PROD_ID_EQUIP,'
      '      EQUIP_DESCRICAO,'
      '      EQUIP_UNIDADE,'
      '      EQUIP_MARCA,'
      '      EQUIP_MODELO,'
      '      EQUIP_FORNECEDOR,'
      '      ORDS_DTA_CADASTRO,'
      '      ORDS_USER_ID,'
      '      USER_ATENDENTE,'
      '      ORDS_VLR_PAGO,'
      '      ORDS_VLR_DESCONTO,'
      '      ORDS_VLR_TOTAL_OS,'
      '      CASE'
      
        '           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_D' +
        'ESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))'
      '           ELSE 0'
      '      END,'
      '      ORDS_USER_ID_TEC,'
      '      USER_NOME_TECNICO,'
      '      FILTRO,'
      '      ATENDENTE,'
      '      ORDS_HORARIO,'
      '      CLIE_TELEFONE1,'
      '      CLIE_TELEFONE2,'
      '      PRACA'
      'ORDER BY'
      '      USER_NOME_TECNICO,'
      '      ORDS_DTA_INSTALACAO,'
      '      CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 456
    Top = 24
  end
  object dspComissao_Pecas_Servicos: TDataSetProvider
    DataSet = qryComissao_Pecas_Servicos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 456
    Top = 72
  end
  object cdsComissao_Pecas_Servicos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspComissao_Pecas_Servicos'
    Left = 456
    Top = 120
    object cdsComissao_Pecas_ServicosORDS_ID: TIntegerField
      FieldName = 'ORDS_ID'
      Required = True
    end
    object cdsComissao_Pecas_ServicosORDS_EMPR_ID: TIntegerField
      FieldName = 'ORDS_EMPR_ID'
      Required = True
    end
    object cdsComissao_Pecas_ServicosORDS_CLIE_ID: TIntegerField
      FieldName = 'ORDS_CLIE_ID'
      Required = True
    end
    object cdsComissao_Pecas_ServicosCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Required = True
      Size = 150
    end
    object cdsComissao_Pecas_ServicosORDS_TPRC_ID: TIntegerField
      FieldName = 'ORDS_TPRC_ID'
      Required = True
    end
    object cdsComissao_Pecas_ServicosTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsComissao_Pecas_ServicosORDS_DTA_INSTALACAO: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
      Required = True
    end
    object cdsComissao_Pecas_ServicosORDS_GENE_ID_TIPO_OS: TIntegerField
      FieldName = 'ORDS_GENE_ID_TIPO_OS'
      Required = True
    end
    object cdsComissao_Pecas_ServicosDESCR_TIPO_OS: TStringField
      FieldName = 'DESCR_TIPO_OS'
      Size = 250
    end
    object cdsComissao_Pecas_ServicosORDS_STATUS: TIntegerField
      FieldName = 'ORDS_STATUS'
      Required = True
    end
    object cdsComissao_Pecas_ServicosSTATUS_OS: TStringField
      FieldName = 'STATUS_OS'
      FixedChar = True
      Size = 10
    end
    object cdsComissao_Pecas_ServicosORDS_PROD_ID_EQUIP: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
    end
    object cdsComissao_Pecas_ServicosEQUIP_DESCRICAO: TStringField
      FieldName = 'EQUIP_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsComissao_Pecas_ServicosEQUIP_UNIDADE: TStringField
      FieldName = 'EQUIP_UNIDADE'
      Size = 250
    end
    object cdsComissao_Pecas_ServicosEQUIP_MARCA: TStringField
      FieldName = 'EQUIP_MARCA'
      Size = 250
    end
    object cdsComissao_Pecas_ServicosEQUIP_MODELO: TStringField
      FieldName = 'EQUIP_MODELO'
      Size = 250
    end
    object cdsComissao_Pecas_ServicosEQUIP_FORNECEDOR: TStringField
      FieldName = 'EQUIP_FORNECEDOR'
      Required = True
      Size = 150
    end
    object cdsComissao_Pecas_ServicosORDS_DTA_CADASTRO: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
      Required = True
    end
    object cdsComissao_Pecas_ServicosORDS_USER_ID: TIntegerField
      FieldName = 'ORDS_USER_ID'
      Required = True
    end
    object cdsComissao_Pecas_ServicosUSER_ATENDENTE: TStringField
      FieldName = 'USER_ATENDENTE'
      Size = 100
    end
    object cdsComissao_Pecas_ServicosORDS_VLR_PAGO: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsComissao_Pecas_ServicosORDS_VLR_DESCONTO: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsComissao_Pecas_ServicosORDS_VLR_TOTAL_OS: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsComissao_Pecas_ServicosVLR_PERC_DESC: TFMTBCDField
      FieldName = 'VLR_PERC_DESC'
      Required = True
      Precision = 18
    end
    object cdsComissao_Pecas_ServicosORDS_USER_ID_TEC: TIntegerField
      FieldName = 'ORDS_USER_ID_TEC'
      Required = True
    end
    object cdsComissao_Pecas_ServicosUSER_NOME_TECNICO: TStringField
      FieldName = 'USER_NOME_TECNICO'
      Size = 100
    end
    object cdsComissao_Pecas_ServicosFILTRO: TStringField
      FieldName = 'FILTRO'
      Size = 250
    end
    object cdsComissao_Pecas_ServicosATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Size = 100
    end
    object cdsComissao_Pecas_ServicosVLRCOMISSAOINTERNO: TFMTBCDField
      FieldName = 'VLRCOMISSAOINTERNO'
      Precision = 18
    end
    object cdsComissao_Pecas_ServicosVLRCOMISSAOEXTERNO: TFMTBCDField
      FieldName = 'VLRCOMISSAOEXTERNO'
      Precision = 18
    end
    object cdsComissao_Pecas_ServicosVLRCOMISSAOBALCAO: TFMTBCDField
      FieldName = 'VLRCOMISSAOBALCAO'
      Precision = 18
    end
    object cdsComissao_Pecas_ServicosORDS_HORARIO: TTimeField
      FieldName = 'ORDS_HORARIO'
    end
    object cdsComissao_Pecas_ServicosCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      Required = True
      Size = 14
    end
    object cdsComissao_Pecas_ServicosCLIE_TELEFONE2: TStringField
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsComissao_Pecas_ServicosPRACA: TIntegerField
      FieldName = 'PRACA'
      Required = True
    end
  end
  object dsComissao_Pecas_Servicos: TDataSource
    DataSet = cdsComissao_Pecas_Servicos
    OnDataChange = dsComissao_Pecas_ServicosDataChange
    Left = 456
    Top = 168
  end
  object qryPecas_Servicos: TSQLQuery
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
      end>
    SQL.Strings = (
      'SELECT'
      '      ORDS_ID,'
      '      ORDS_EMPR_ID,'
      '      ORDS_CLIE_ID,'
      '      CLIE_RAZAO_SOCIAL,'
      '      ORDS_TPRC_ID,'
      '      TPRC_DESCRICAO,'
      '      ORDS_DTA_INSTALACAO,'
      '      ORDS_GENE_ID_TIPO_OS,'
      '      DESCR_TIPO_OS,'
      '      ORDS_STATUS,'
      '      STATUS_OS,'
      '      ORDS_PROD_ID_EQUIP,'
      '      EQUIP_DESCRICAO,'
      '      EQUIP_UNIDADE,'
      '      EQUIP_MARCA,'
      '      EQUIP_MODELO,'
      '      EQUIP_FORNECEDOR,'
      '      ORDS_DTA_CADASTRO,'
      '      ORDS_USER_ID,'
      '      USER_ATENDENTE,'
      '      ODIT_TPIT_PROD_ID,'
      '      PROD_DESCRICAO,'
      '      PROD_UNIDADE,'
      '      MARCA_PROD,'
      '      MODELO_PROD,'
      '      PROD_TIPO_COMISSAO,'
      '      TIPO_COMISSAO,'
      
        '      COALESCE(PROD_COMISSAO_VEND_INTERNA,0)                    ' +
        '                AS PROD_COMISSAO_VEND_INTERNA,'
      
        '      COALESCE(PROD_COMISSAO_VEND_EXTERNO,0)                    ' +
        '                AS PROD_COMISSAO_VEND_EXTERNO,'
      
        '      COALESCE(PROD_COMISSAO_VEND_BALCAO,0)                     ' +
        '                AS PROD_COMISSAO_VEND_BALCAO,'
      
        '      COALESCE(ODIT_VLR_UNITARIO,0)                             ' +
        '                AS ODIT_VLR_UNITARIO,'
      
        '      COALESCE(ODIT_QTDE,0)                                     ' +
        '                AS ODIT_QTDE,'
      
        '      COALESCE(ODIT_VLR_TOTAL,0)                                ' +
        '                AS ODIT_VLR_TOTAL,'
      '      ORDS_VLR_PAGO,'
      '      ORDS_VLR_DESCONTO,'
      '      ORDS_VLR_TOTAL_OS,'
      '      CASE'
      
        '           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_D' +
        'ESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))'
      '           ELSE 0'
      
        '      END                                                       ' +
        '                AS VLR_PERC_DESC,'
      '      ODIT_USER_ID_TEC,'
      '      USER_NOME_TECNICO,'
      '      FILTRO,'
      '      ATENDENTE,'
      '      VLRCOMISSAOINTERNO,'
      '      VLRCOMISSAOEXTERNO,'
      '      VLRCOMISSAOBALCAO,'
      '      ORDS_HORARIO'
      'FROM'
      '    (SELECT'
      '           OS.ORDS_ID,'
      '           OS.ORDS_EMPR_ID,'
      '           OS.ORDS_CLIE_ID,'
      '           CL.CLIE_RAZAO_SOCIAL,'
      '           OS.ORDS_TPRC_ID,'
      '           TP.TPRC_DESCRICAO,'
      '           OS.ORDS_DTA_INSTALACAO,'
      '           OS.ORDS_GENE_ID_TIPO_OS,'
      
        '           OT.GENE_DESCR                                        ' +
        '                AS DESCR_TIPO_OS,'
      '           OS.ORDS_STATUS,'
      '           CASE OS.ORDS_STATUS'
      '                WHEN 0 THEN '#39'Agendado'#39
      '                WHEN 1 THEN '#39'Realizado'#39
      '                WHEN 2 THEN '#39'Real./Pago'#39
      '                WHEN 3 THEN '#39'Cancelado'#39
      
        '           END                                                  ' +
        '                AS STATUS_OS,'
      '           OS.ORDS_PROD_ID_EQUIP,'
      
        '           EP.PROD_DESCRICAO                                    ' +
        '                AS EQUIP_DESCRICAO,'
      
        '           UEP.GENE_PAR1                                        ' +
        '               AS EQUIP_UNIDADE,'
      
        '           EM.GENE_DESCR                                        ' +
        '                AS EQUIP_MARCA,'
      
        '           ME.GENE_DESCR                                        ' +
        '                AS EQUIP_MODELO,'
      
        '           FE.FORN_RAZAO_SOCIAL                                 ' +
        '                AS EQUIP_FORNECEDOR,'
      '           OS.ORDS_DTA_CADASTRO,'
      '           OS.ORDS_USER_ID,'
      
        '           UA.USER_NOME_COMPLETO                                ' +
        '                AS USER_ATENDENTE,'
      '           OI.ODIT_TPIT_PROD_ID,'
      '           PR.PROD_DESCRICAO,'
      '           UN.GENE_PAR1 AS PROD_UNIDADE,'
      
        '           MC.GENE_DESCR                                        ' +
        '                AS MARCA_PROD,'
      
        '           MD.GENE_DESCR                                        ' +
        '                AS MODELO_PROD,'
      '           PR.PROD_TIPO_COMISSAO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      '                WHEN 0 THEN '#39'%'#39
      '                WHEN 1 THEN '#39'R$'#39
      
        '           END                                                  ' +
        '                AS TIPO_COMISSAO,'
      '           PR.PROD_COMISSAO_VEND_INTERNA,'
      '           PR.PROD_COMISSAO_VEND_EXTERNO,'
      '           PR.PROD_COMISSAO_VEND_BALCAO,'
      '           OI.ODIT_VLR_UNITARIO,'
      '           OI.ODIT_QTDE,'
      '           OI.ODIT_VLR_TOTAL,'
      '           OS.ORDS_VLR_PAGO,'
      '           OS.ORDS_VLR_DESCONTO,'
      '           OS.ORDS_VLR_TOTAL_OS,'
      '           OI.ODIT_USER_ID_TEC,'
      
        '           UT.USER_NOME_COMPLETO                                ' +
        '                AS USER_NOME_TECNICO,'
      
        '           FI.GENE_DESCR                                        ' +
        '                AS FILTRO,'
      
        '           ATE.USER_NOME_COMPLETO                               ' +
        '                AS ATENDENTE,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_INTERNA/100)'
      
        '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_INTERN' +
        'A'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOINTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_EXTERNO/100)'
      
        '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_EXTERN' +
        'O'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOEXTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.ODIT_VLR_TOTAL*(PR.PROD_COMISSAO_' +
        'VEND_BALCAO/100)'
      '                ELSE OI.ODIT_QTDE * PR.PROD_COMISSAO_VEND_BALCAO'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOBALCAO,'
      '           OS.ORDS_HORARIO'
      '     FROM  ORDEM_SERVICO OS'
      '     INNER JOIN ORDEM_SERVICO_ITENS OI'
      '     ON (OI.ODIT_ORDS_ID            = OS.ORDS_ID'
      '     AND OI.ODIT_ORDS_EMPR_ID       = OS.ORDS_EMPR_ID'
      '     AND OI.ODIT_ORDS_CLIE_ID       = OS.ORDS_CLIE_ID'
      '     AND OI.ODIT_ORDS_CLIE_EMPR_ID  = OS.ORDS_CLIE_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA FI'
      
        '     ON (FI.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_FILTR' +
        'O'
      
        '     AND FI.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_FILTR' +
        'O'
      '     AND FI.GENE_ID                 = OS.ORDS_GENE_ID_FILTRO)'
      '     INNER JOIN CLIENTES CL'
      '     ON (CL.CLIE_ID                 = OS.ORDS_CLIE_ID'
      '     AND CL.CLIE_EMPR_ID            = OS.ORDS_CLIE_EMPR_ID)'
      '     INNER JOIN TABELA_PRECO TP'
      '     ON (TP.TPRC_ID                 = OS.ORDS_TPRC_ID'
      '     AND TP.TPRC_EMPR_ID            = OS.ORDS_TPRC_EMPR_ID)'
      '     INNER JOIN GENERICA OT'
      
        '     ON (OT.GENE_EMPR_ID            = OS.ORDS_GENE_EMPR_ID_TIPO_' +
        'OS'
      
        '     AND OT.GENE_TGEN_ID            = OS.ORDS_GENE_TGEN_ID_TIPO_' +
        'OS'
      '     AND OT.GENE_ID                 = OS.ORDS_GENE_ID_TIPO_OS)'
      '     LEFT OUTER JOIN PRODUTOS EP'
      '     ON (EP.PROD_ID                 = OS.ORDS_PROD_ID_EQUIP'
      
        '     AND EP.PROD_EMPR_ID            = OS.ORDS_PROD_EMPR_ID_EQUIP' +
        ')'
      '     LEFT OUTER JOIN GENERICA UEP'
      '     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID'
      '     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID'
      '     AND UEP.GENE_ID = EP.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA EM'
      '     ON (EM.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MARCA'
      '     AND EM.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MARCA'
      '     AND EM.GENE_ID                 = EP.PROD_GENE_ID_MARCA)'
      '     LEFT OUTER JOIN GENERICA ME'
      
        '     ON (ME.GENE_EMPR_ID            = EP.PROD_GENE_EMPR_ID_MODEL' +
        'O'
      
        '     AND ME.GENE_TGEN_ID            = EP.PROD_GENE_TGEN_ID_MODEL' +
        'O'
      '     AND ME.GENE_ID                 = EP.PROD_GENE_ID_MODELO)'
      '     LEFT OUTER JOIN FORNECEDORES FE'
      '     ON (FE.FORN_ID                 = EP.PROD_FORN_ID)'
      '     INNER JOIN USUARIO UA'
      '     ON (UA.USER_ID                 = OS.ORDS_USER_ID)'
      '     INNER JOIN PRODUTOS PR'
      '     ON (PR.PROD_ID                 = OI.ODIT_TPIT_PROD_ID'
      '     AND PR.PROD_EMPR_ID            = OI.ODIT_TPIT_PROD_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA UN'
      '     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      '     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      '     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA MC'
      '     ON (MC.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MARCA'
      '     AND MC.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MARCA'
      '     AND MC.GENE_ID                 = PR.PROD_GENE_ID_MARCA)'
      '     LEFT OUTER JOIN GENERICA MD'
      
        '     ON (MD.GENE_EMPR_ID            = PR.PROD_GENE_EMPR_ID_MODEL' +
        'O'
      
        '     AND MD.GENE_TGEN_ID            = PR.PROD_GENE_TGEN_ID_MODEL' +
        'O'
      '     AND MD.GENE_ID                 = PR.PROD_GENE_ID_MODELO)'
      '     INNER JOIN USUARIO UT'
      '     ON (UT.USER_ID                 = OI.ODIT_USER_ID_TEC)'
      '     INNER JOIN USUARIO ATE'
      '     ON (ATE.USER_ID  = OS.ORDS_USER_ID)'
      '     WHERE OI.ODIT_TPIT_PROD_ID NOT IN (SELECT'
      
        '                                              OT.OSTI_ODIT_TPIT_' +
        'PROD_ID'
      
        '                                        FROM  ORDEM_SERVICO_TRAN' +
        'SF_ITENS OT'
      
        '                                        WHERE OT.OSTI_EMPR_ID   ' +
        '             = OS.ORDS_EMPR_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'ID           = OS.ORDS_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'EMPR_ID      = OS.ORDS_EMPR_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'CLIE_ID      = OS.ORDS_CLIE_ID'
      
        '                                        AND   OT.OSTI_OSTF_ORDS_' +
        'CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)'
      '     UNION'
      '     SELECT'
      
        '           OT.OSTF_ORDS_ID                                      ' +
        '                AS ORDS_ID,'
      
        '           OT.OSTF_ORDS_EMPR_ID                                 ' +
        '                AS ORDS_EMPR_ID,'
      
        '           OT.OSTF_ORDS_CLIE_ID                                 ' +
        '                AS ORDS_CLIE_ID,'
      '           CL.CLIE_RAZAO_SOCIAL,'
      '           OS.ORDS_TPRC_ID,'
      '           TP.TPRC_DESCRICAO,'
      '           OS.ORDS_DTA_INSTALACAO,'
      '           OS.ORDS_GENE_ID_TIPO_OS,'
      
        '           TS.GENE_DESCR                                        ' +
        '                AS DESCR_TIPO_OS,'
      '           OS.ORDS_STATUS,'
      '           CASE OS.ORDS_STATUS'
      '                WHEN 0 THEN '#39'Agendado'#39
      '                WHEN 1 THEN '#39'Realizado'#39
      '                WHEN 2 THEN '#39'Real./Pago'#39
      '                WHEN 3 THEN '#39'Cancelado'#39
      
        '           END                                                  ' +
        '                AS STATUS_OS,'
      '           OS.ORDS_PROD_ID_EQUIP,'
      
        '           EP.PROD_DESCRICAO                                    ' +
        '                AS EQUIP_DESCRICAO,'
      
        '           UEP.GENE_PAR1                                        ' +
        '               AS EQUIP_UNIDADE,'
      
        '           EM.GENE_DESCR                                        ' +
        '                AS EQUIP_MARCA,'
      
        '           ME.GENE_DESCR                                        ' +
        '                AS EQUIP_MODELO,'
      
        '           FE.FORN_RAZAO_SOCIAL                                 ' +
        '                AS EQUIP_FORNECEDOR,'
      '           OS.ORDS_DTA_CADASTRO,'
      '           OS.ORDS_USER_ID,'
      
        '           UA.USER_NOME_COMPLETO                                ' +
        '                AS USER_ATENDENTE,'
      
        '           OI.OSTI_ODIT_TPIT_PROD_ID                            ' +
        '                AS ODIT_TPIT_PROD_ID,'
      '           PR.PROD_DESCRICAO,'
      '           UN.GENE_PAR1 AS PROD_UNIDADE,'
      
        '           MC.GENE_DESCR                                        ' +
        '                AS MARCA_PROD,'
      
        '           MD.GENE_DESCR                                        ' +
        '                AS MODELO_PROD,'
      '           PR.PROD_TIPO_COMISSAO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      '                WHEN 0 THEN '#39'%'#39
      '                WHEN 1 THEN '#39'R$'#39
      
        '           END                                                  ' +
        '                AS TIPO_COMISSAO,'
      
        '           OI.OSTI_COMISSAO_VENDA_INTERNA                       ' +
        '                AS PROD_COMISSAO_VEND_INTERNA,'
      
        '           OI.OSTI_COMISSAO_VENDA_EXTERNA                       ' +
        '                AS PROD_COMISSAO_VEND_EXTERNO,'
      
        '           OI.OSTI_COMISSAO_VENDA_BALCAO                        ' +
        '                AS PROD_COMISSAO_VEND_BALCAO,'
      
        '           OI.OSTI_ODIT_VLR_UNITARIO                            ' +
        '                AS ODIT_VLR_UNITARIO,'
      
        '           OI.OSTI_ODIT_QTDE                                    ' +
        '                AS ODIT_QTDE,'
      
        '           OI.OSTI_ODIT_VLR_TOTAL                               ' +
        '                AS ODIT_VLR_TOTAL,'
      '           OS.ORDS_VLR_PAGO,'
      '           OS.ORDS_VLR_DESCONTO,'
      '           OS.ORDS_VLR_TOTAL_OS,'
      
        '           OT.OSTF_USER_ID_TEC_DEST                             ' +
        '                AS ODIT_USER_ID_TEC,'
      
        '           UT.USER_NOME_COMPLETO                                ' +
        '                AS USER_NOME_TECNICO,'
      
        '           FI.GENE_DESCR                                        ' +
        '                AS FILTRO,'
      
        '           ATE.USER_NOME_COMPLETO                               ' +
        '                AS ATENDENTE,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_INTERNA/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'INTERNA'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOINTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_EXTERNA/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'EXTERNA'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOEXTERNO,'
      '           CASE PR.PROD_TIPO_COMISSAO'
      
        '                WHEN 0 THEN OI.OSTI_ODIT_VLR_TOTAL*(OI.OSTI_COMI' +
        'SSAO_VENDA_BALCAO/100)'
      
        '                ELSE OI.OSTI_ODIT_QTDE * OI.OSTI_COMISSAO_VENDA_' +
        'BALCAO'
      
        '           END                                                  ' +
        '                AS VLRCOMISSAOBALCAO,'
      '           OS.ORDS_HORARIO'
      '     FROM  ORDEM_SERVICO_TRANSF OT'
      '     INNER JOIN ORDEM_SERVICO_TRANSF_ITENS OI'
      '     ON (OI.OSTI_OSTF_ID                   = OT.OSTF_ID'
      '     AND OI.OSTI_OSTF_EMPR_ID              = OT.OSTF_EMPR_ID'
      '     AND OI.OSTI_OSTF_ORDS_ID              = OT.OSTF_ORDS_ID'
      
        '     AND OI.OSTI_OSTF_ORDS_EMPR_ID         = OT.OSTF_ORDS_EMPR_I' +
        'D'
      
        '     AND OI.OSTI_OSTF_ORDS_CLIE_ID         = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND OI.OSTI_OSTF_ORDS_CLIE_EMPR_ID    = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     INNER JOIN ORDEM_SERVICO OS'
      '     ON (OS.ORDS_ID                        = OT.OSTF_ORDS_ID'
      
        '     AND OS.ORDS_EMPR_ID                   = OT.OSTF_ORDS_EMPR_I' +
        'D'
      
        '     AND OS.ORDS_CLIE_ID                   = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND OS.ORDS_CLIE_EMPR_ID              = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     LEFT OUTER JOIN GENERICA FI'
      
        '     ON (FI.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_I' +
        'D_FILTRO'
      
        '     AND FI.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_I' +
        'D_FILTRO'
      
        '     AND FI.GENE_ID                        = OS.ORDS_GENE_ID_FIL' +
        'TRO)'
      '     INNER JOIN CLIENTES CL'
      
        '     ON (CL.CLIE_ID                        = OT.OSTF_ORDS_CLIE_I' +
        'D'
      
        '     AND CL.CLIE_EMPR_ID                   = OT.OSTF_ORDS_CLIE_E' +
        'MPR_ID)'
      '     INNER JOIN TABELA_PRECO TP'
      '     ON (TP.TPRC_ID                        = OS.ORDS_TPRC_ID'
      
        '     AND TP.TPRC_EMPR_ID                   = OS.ORDS_TPRC_EMPR_I' +
        'D)'
      '     INNER JOIN GENERICA TS'
      
        '     ON (TS.GENE_EMPR_ID                   = OS.ORDS_GENE_EMPR_I' +
        'D_TIPO_OS'
      
        '     AND TS.GENE_TGEN_ID                   = OS.ORDS_GENE_TGEN_I' +
        'D_TIPO_OS'
      
        '     AND TS.GENE_ID                        = OS.ORDS_GENE_ID_TIP' +
        'O_OS)'
      '     LEFT OUTER JOIN PRODUTOS EP'
      
        '     ON (EP.PROD_ID                        = OS.ORDS_PROD_ID_EQU' +
        'IP'
      
        '     AND EP.PROD_EMPR_ID                   = OS.ORDS_PROD_EMPR_I' +
        'D_EQUIP)'
      '     LEFT OUTER JOIN GENERICA UEP'
      '     ON (UEP.GENE_EMPR_ID = EP.PROD_GENE_EMPR_ID_UNID'
      '     AND UEP.GENE_TGEN_ID = EP.PROD_GENE_TGEN_ID_UNID'
      '     AND UEP.GENE_ID    = EP.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA EM'
      
        '     ON (EM.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_I' +
        'D_MARCA'
      
        '     AND EM.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_I' +
        'D_MARCA'
      
        '     AND EM.GENE_ID                        = EP.PROD_GENE_ID_MAR' +
        'CA)'
      '     LEFT OUTER JOIN GENERICA ME'
      
        '     ON (ME.GENE_EMPR_ID                   = EP.PROD_GENE_EMPR_I' +
        'D_MODELO'
      
        '     AND ME.GENE_TGEN_ID                   = EP.PROD_GENE_TGEN_I' +
        'D_MODELO'
      
        '     AND ME.GENE_ID                        = EP.PROD_GENE_ID_MOD' +
        'ELO)'
      '     LEFT OUTER JOIN FORNECEDORES FE'
      '     ON (FE.FORN_ID                        = EP.PROD_FORN_ID)'
      '     INNER JOIN USUARIO UA'
      '     ON (UA.USER_ID                        = OS.ORDS_USER_ID)'
      '     INNER JOIN PRODUTOS PR'
      
        '     ON (PR.PROD_ID                        = OI.OSTI_ODIT_TPIT_P' +
        'ROD_ID'
      
        '     AND PR.PROD_EMPR_ID                   = OI.OSTI_ODIT_TPIT_P' +
        'ROD_EMPR_ID)'
      '     LEFT OUTER JOIN GENERICA UN'
      '     ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      '     AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      '     AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      '     LEFT OUTER JOIN GENERICA MC'
      
        '     ON (MC.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_I' +
        'D_MARCA'
      
        '     AND MC.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_I' +
        'D_MARCA'
      
        '     AND MC.GENE_ID                        = PR.PROD_GENE_ID_MAR' +
        'CA)'
      '     LEFT OUTER JOIN GENERICA MD'
      
        '     ON (MD.GENE_EMPR_ID                   = PR.PROD_GENE_EMPR_I' +
        'D_MODELO'
      
        '     AND MD.GENE_TGEN_ID                   = PR.PROD_GENE_TGEN_I' +
        'D_MODELO'
      
        '     AND MD.GENE_ID                        = PR.PROD_GENE_ID_MOD' +
        'ELO)'
      '     INNER JOIN USUARIO UT'
      
        '     ON (UT.USER_ID                        = OT.OSTF_USER_ID_TEC' +
        '_DEST)'
      '     INNER JOIN USUARIO ATE'
      '     ON (ATE.USER_ID  = OS.ORDS_USER_ID)'
      '     )'
      'WHERE ORDS_ID      = :ORDS_ID'
      '  AND ORDS_EMPR_ID = :EMPR_ID'
      'GROUP BY'
      '      ORDS_ID,'
      '      ORDS_EMPR_ID,'
      '      ORDS_CLIE_ID,'
      '      CLIE_RAZAO_SOCIAL,'
      '      ORDS_TPRC_ID,'
      '      TPRC_DESCRICAO,'
      '      ORDS_DTA_INSTALACAO,'
      '      ORDS_GENE_ID_TIPO_OS,'
      '      DESCR_TIPO_OS,'
      '      ORDS_STATUS,'
      '      STATUS_OS,'
      '      ORDS_PROD_ID_EQUIP,'
      '      EQUIP_DESCRICAO,'
      '      EQUIP_UNIDADE,'
      '      EQUIP_MARCA,'
      '      EQUIP_MODELO,'
      '      EQUIP_FORNECEDOR,'
      '      ORDS_DTA_CADASTRO,'
      '      ORDS_USER_ID,'
      '      USER_ATENDENTE,'
      '      ODIT_TPIT_PROD_ID,'
      '      PROD_DESCRICAO,'
      '      PROD_UNIDADE,'
      '      MARCA_PROD,'
      '      MODELO_PROD,'
      '      PROD_TIPO_COMISSAO,'
      '      TIPO_COMISSAO,'
      '      PROD_COMISSAO_VEND_INTERNA,'
      '      PROD_COMISSAO_VEND_EXTERNO,'
      '      PROD_COMISSAO_VEND_BALCAO,'
      '      ODIT_VLR_UNITARIO,'
      '      ODIT_QTDE,'
      '      ODIT_VLR_TOTAL,'
      '      ORDS_VLR_PAGO,'
      '      ORDS_VLR_DESCONTO,'
      '      ORDS_VLR_TOTAL_OS,'
      '      CASE'
      
        '           WHEN ORDS_VLR_DESCONTO > 0 THEN ((COALESCE(ORDS_VLR_D' +
        'ESCONTO,0)*100)/COALESCE(ORDS_VLR_TOTAL_OS,1))'
      '           ELSE 0'
      '      END,'
      '      ODIT_USER_ID_TEC,'
      '      USER_NOME_TECNICO,'
      '      FILTRO,'
      '      ATENDENTE,'
      '      VLRCOMISSAOINTERNO,'
      '      VLRCOMISSAOEXTERNO,'
      '      VLRCOMISSAOBALCAO,'
      '      ORDS_HORARIO'
      'ORDER BY'
      '      USER_NOME_TECNICO,'
      '      ORDS_DTA_INSTALACAO,'
      '      CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 600
    Top = 24
  end
  object dspPecas_Servicos: TDataSetProvider
    DataSet = qryPecas_Servicos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 600
    Top = 72
  end
  object cdsPecas_Servicos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
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
      end>
    ProviderName = 'dspPecas_Servicos'
    Left = 600
    Top = 120
    object IntegerField1: TIntegerField
      FieldName = 'ORDS_ID'
      DisplayFormat = '00000'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ORDS_EMPR_ID'
    end
    object IntegerField3: TIntegerField
      FieldName = 'ORDS_CLIE_ID'
    end
    object StringField1: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object IntegerField4: TIntegerField
      FieldName = 'ORDS_TPRC_ID'
    end
    object StringField2: TStringField
      FieldName = 'TPRC_DESCRICAO'
      Size = 100
    end
    object DateField1: TDateField
      FieldName = 'ORDS_DTA_INSTALACAO'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ORDS_GENE_ID_TIPO_OS'
    end
    object StringField3: TStringField
      FieldName = 'DESCR_TIPO_OS'
      Size = 250
    end
    object IntegerField6: TIntegerField
      FieldName = 'ORDS_STATUS'
    end
    object StringField4: TStringField
      FieldName = 'STATUS_OS'
      FixedChar = True
      Size = 10
    end
    object IntegerField7: TIntegerField
      FieldName = 'ORDS_PROD_ID_EQUIP'
    end
    object StringField5: TStringField
      FieldName = 'EQUIP_DESCRICAO'
      Size = 100
    end
    object StringField6: TStringField
      DisplayWidth = 3
      FieldName = 'EQUIP_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object StringField7: TStringField
      FieldName = 'EQUIP_MARCA'
      Size = 250
    end
    object StringField8: TStringField
      FieldName = 'EQUIP_MODELO'
      Size = 250
    end
    object StringField9: TStringField
      FieldName = 'EQUIP_FORNECEDOR'
      Size = 150
    end
    object DateField2: TDateField
      FieldName = 'ORDS_DTA_CADASTRO'
    end
    object IntegerField8: TIntegerField
      FieldName = 'ORDS_USER_ID'
    end
    object StringField10: TStringField
      FieldName = 'USER_ATENDENTE'
      Size = 100
    end
    object IntegerField9: TIntegerField
      FieldName = 'ODIT_TPIT_PROD_ID'
    end
    object StringField11: TStringField
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object StringField12: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object StringField13: TStringField
      FieldName = 'MARCA_PROD'
      Size = 250
    end
    object StringField14: TStringField
      FieldName = 'MODELO_PROD'
      Size = 250
    end
    object IntegerField10: TIntegerField
      FieldName = 'PROD_TIPO_COMISSAO'
    end
    object StringField15: TStringField
      FieldName = 'TIPO_COMISSAO'
      FixedChar = True
      Size = 2
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_INTERNA'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_EXTERNO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'PROD_COMISSAO_VEND_BALCAO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'ODIT_VLR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'ODIT_QTDE'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'ODIT_VLR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object StringField16: TStringField
      FieldName = 'USER_NOME_TECNICO'
      Size = 100
    end
    object IntegerField11: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
    end
    object StringField17: TStringField
      FieldName = 'FILTRO'
      Size = 250
    end
    object StringField18: TStringField
      FieldName = 'ATENDENTE'
      Size = 100
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'ORDS_VLR_DESCONTO'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'ORDS_VLR_TOTAL_OS'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object FMTBCDField9: TFMTBCDField
      FieldName = 'VLR_PERC_DESC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
    end
    object FMTBCDField10: TFMTBCDField
      FieldName = 'VLRCOMISSAOINTERNO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
    end
    object FMTBCDField11: TFMTBCDField
      FieldName = 'VLRCOMISSAOEXTERNO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
    end
    object FMTBCDField12: TFMTBCDField
      FieldName = 'VLRCOMISSAOBALCAO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
    end
    object FMTBCDField13: TFMTBCDField
      FieldName = 'ORDS_VLR_PAGO'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsPecas_ServicosORDS_HORARIO: TTimeField
      FieldName = 'ORDS_HORARIO'
    end
  end
  object dsPecas_Servicos: TDataSource
    DataSet = cdsPecas_Servicos
    Left = 600
    Top = 168
  end
end
