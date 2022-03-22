inherited dmAgenda: TdmAgenda
  OldCreateOrder = True
  Height = 501
  Width = 928
  object dspAgenda: TDataSetProvider
    DataSet = qryAgenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 96
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAF'
        ParamType = ptInput
      end>
    ProviderName = 'dspAgenda'
    AfterEdit = cdsAgendaAfterEdit
    OnNewRecord = cdsAgendaNewRecord
    Left = 208
    Top = 144
    object cdsAgendaAGEN_ID: TIntegerField
      FieldName = 'AGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgendaAGEN_EMPR_ID: TIntegerField
      FieldName = 'AGEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgendaAGEN_CLIE_ID: TIntegerField
      FieldName = 'AGEN_CLIE_ID'
    end
    object cdsAgendaAGEN_CLIE_EMPR_ID: TIntegerField
      FieldName = 'AGEN_CLIE_EMPR_ID'
    end
    object cdsAgendaAGEN_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'AGEN_USER_ID_ATENDENTE'
    end
    object cdsAgendaAGEN_TPRC_ID: TIntegerField
      FieldName = 'AGEN_TPRC_ID'
    end
    object cdsAgendaAGEN_TPRC_EMPR_ID: TIntegerField
      FieldName = 'AGEN_TPRC_EMPR_ID'
    end
    object cdsAgendaAGEN_HORA: TStringField
      FieldName = 'AGEN_HORA'
      EditMask = '##:##'
      Size = 5
    end
    object cdsAgendaAGEN_DATA: TDateField
      FieldName = 'AGEN_DATA'
    end
    object cdsAgendaAGEN_OBS: TBlobField
      FieldName = 'AGEN_OBS'
      Size = 1
    end
    object cdsAgendaAGEN_STATUS: TStringField
      FieldName = 'AGEN_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsAgendaAGEN_CLIENTE: TStringField
      FieldName = 'AGEN_CLIENTE'
      Size = 100
    end
    object cdsAgendaAGEN_CLIE_ID_INDICACAO: TIntegerField
      FieldName = 'AGEN_CLIE_ID_INDICACAO'
    end
    object cdsAgendaAGEN_CLIE_EMPR_ID_INDICACAO: TIntegerField
      FieldName = 'AGEN_CLIE_EMPR_ID_INDICACAO'
    end
    object cdsAgendaAGEN_DTA_CADASTRO: TDateField
      FieldName = 'AGEN_DTA_CADASTRO'
    end
    object cdsAgendaAGEN_USER_ID: TIntegerField
      FieldName = 'AGEN_USER_ID'
    end
    object cdsAgendaCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object cdsAgendaCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object cdsAgendaRAZAO_INDICACAO: TStringField
      FieldName = 'RAZAO_INDICACAO'
      ProviderFlags = []
      Size = 150
    end
    object cdsAgendaFANTASIA_INDICACAO: TStringField
      FieldName = 'FANTASIA_INDICACAO'
      ProviderFlags = []
      Size = 150
    end
    object cdsAgendaUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = []
      Size = 100
    end
    object cdsAgendaTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsAgendaCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cdsAgendaCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = []
      Size = 150
    end
    object cdsAgendaCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object cdsAgendaCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = []
      Size = 14
    end
    object cdsAgendaAGEN_FOTO_ANT: TBlobField
      FieldName = 'AGEN_FOTO_ANT'
      Size = 1
    end
    object cdsAgendaAGEN_FOTO_DEP: TBlobField
      FieldName = 'AGEN_FOTO_DEP'
      Size = 1
    end
    object cdsAgendaAGEN_VLR_TOTAL: TFMTBCDField
      FieldName = 'AGEN_VLR_TOTAL'
      Precision = 18
      Size = 4
    end
    object cdsAgendaAGEN_VLR_DESCONTO: TFMTBCDField
      FieldName = 'AGEN_VLR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsAgendaAGEN_VLR_PAGO: TFMTBCDField
      FieldName = 'AGEN_VLR_PAGO'
      Precision = 18
      Size = 4
    end
    object cdsAgendaVALOR_PAGAR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALOR_PAGAR'
      ProviderFlags = []
      Calculated = True
    end
    object cdsAgendaAGEN_ORDS_ID: TIntegerField
      FieldName = 'AGEN_ORDS_ID'
    end
    object cdsAgendaAGEN_ORDS_EMPR_ID: TIntegerField
      FieldName = 'AGEN_ORDS_EMPR_ID'
    end
    object cdsAgendaAGEN_TELEFONE: TStringField
      FieldName = 'AGEN_TELEFONE'
      Size = 14
    end
    object cdsAgendaAGEN_EXT_HORARIO: TIntegerField
      FieldName = 'AGEN_EXT_HORARIO'
    end
    object cdsAgendaAGEN_AGEN_ID: TIntegerField
      FieldName = 'AGEN_AGEN_ID'
    end
    object cdsAgendaAGEN_AGEN_EMPR_ID: TIntegerField
      FieldName = 'AGEN_AGEN_EMPR_ID'
    end
    object cdsAgendaAGEN_BLOQUEAR_HORARIO: TIntegerField
      FieldName = 'AGEN_BLOQUEAR_HORARIO'
    end
    object cdsAgendaAGEN_BAIXA_ESTOQUE: TIntegerField
      FieldName = 'AGEN_BAIXA_ESTOQUE'
      Visible = False
    end
    object cdsAgendaAGEN_FECHOU_FINANCEIRO: TIntegerField
      FieldName = 'AGEN_FECHOU_FINANCEIRO'
      Visible = False
    end
    object cdsAgendaAGEN_PIGMENTO_COR: TStringField
      FieldName = 'AGEN_PIGMENTO_COR'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_MARCA: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_LOTE: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_ORIGEM_REAGENDAMENTO: TIntegerField
      FieldName = 'AGEN_ORIGEM_REAGENDAMENTO'
      Required = True
    end
    object cdsAgendaAGEN_PIGMENTO_COR1: TStringField
      FieldName = 'AGEN_PIGMENTO_COR1'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_MARCA1: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA1'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_LOTE1: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE1'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_COR2: TStringField
      FieldName = 'AGEN_PIGMENTO_COR2'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_MARCA2: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA2'
      Visible = False
      Size = 50
    end
    object cdsAgendaAGEN_PIGMENTO_LOTE2: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE2'
      Visible = False
      Size = 50
    end
    object cdsAgendaCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = []
      Visible = False
      Size = 1
    end
    object cdsAgendaCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = []
      Visible = False
    end
  end
  object dsAgenda: TDataSource
    DataSet = cdsAgenda
    Left = 208
    Top = 192
  end
  object qryAgenda: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAF'
        ParamType = ptInput
      end>
    SQL.Strings = (
      ''
      'SELECT'
      '       AGEN.AGEN_ID,'
      '       AGEN.AGEN_EMPR_ID,'
      '       AGEN.AGEN_CLIE_ID,'
      '       AGEN.AGEN_CLIE_EMPR_ID,'
      '       AGEN.AGEN_USER_ID_ATENDENTE,'
      '       AGEN.AGEN_TPRC_ID,'
      '       AGEN.AGEN_TPRC_EMPR_ID,'
      '       AGEN.AGEN_HORA,'
      '       AGEN.AGEN_DATA,'
      '       AGEN.AGEN_OBS,'
      
        '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN AGEN.A' +
        'GEN_STATUS'
      '            ELSE '#39'Z'#39
      '       END                                  AS AGEN_STATUS,'
      
        '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN AGEN.A' +
        'GEN_CLIENTE'
      '            ELSE '#39'Hr. Reserv. Proced.'#39
      '       END                                  AS AGEN_CLIENTE,'
      '       COALESCE(CASE CLIE.CLIE_TELEFONE1'
      '                     WHEN '#39'(00)00000-0000'#39' THEN NULL'
      '                     ELSE CLIE.CLIE_TELEFONE1'
      '                END,AGEN.AGEN_TELEFONE) AS AGEN_TELEFONE,'
      '       AGEN.AGEN_CLIE_ID_INDICACAO,'
      '       AGEN.AGEN_CLIE_EMPR_ID_INDICACAO,'
      '       AGEN.AGEN_FOTO_ANT,'
      '       AGEN.AGEN_FOTO_DEP,'
      '       AGEN.AGEN_VLR_TOTAL,'
      '       AGEN.AGEN_VLR_DESCONTO,'
      '       AGEN.AGEN_VLR_PAGO,'
      '       COALESCE(AGEN.AGEN_ORDS_ID,-1) AS AGEN_ORDS_ID,'
      '       AGEN.AGEN_ORDS_EMPR_ID,'
      '       AGEN.AGEN_EXT_HORARIO,'
      '       COALESCE(AGEN.AGEN_AGEN_ID,-1) AS AGEN_AGEN_ID,'
      '       AGEN.AGEN_AGEN_EMPR_ID,'
      '       AGEN.AGEN_BLOQUEAR_HORARIO,'
      '       AGEN.AGEN_BAIXA_ESTOQUE,'
      '       AGEN.AGEN_FECHOU_FINANCEIRO,'
      '       AGEN.AGEN_PIGMENTO_COR,'
      '       AGEN.AGEN_PIGMENTO_MARCA,'
      '       AGEN.AGEN_PIGMENTO_LOTE,'
      '       AGEN.AGEN_PIGMENTO_COR1,'
      '       AGEN.AGEN_PIGMENTO_MARCA1,'
      '       AGEN.AGEN_PIGMENTO_LOTE1,'
      '       AGEN.AGEN_PIGMENTO_COR2,'
      '       AGEN.AGEN_PIGMENTO_MARCA2,'
      '       AGEN.AGEN_PIGMENTO_LOTE2,'
      '       AGEN.AGEN_DTA_CADASTRO,'
      '       AGEN.AGEN_USER_ID,'
      
        '       COALESCE(AGEN.AGEN_ORIGEM_REAGENDAMENTO,0) AS AGEN_ORIGEM' +
        '_REAGENDAMENTO,'
      
        '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN CLIE.C' +
        'LIE_RAZAO_SOCIAL'
      '            ELSE '#39'Hr. Reserv. Proced.'#39
      '       END                    AS CLIE_RAZAO_SOCIAL,'
      
        '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN CLIE.C' +
        'LIE_FANTASIA'
      '            ELSE '#39'Hr. Reserv. Proced.'#39
      '       END                    AS CLIE_FANTASIA,'
      '       CLIE.CLIE_CEP,'
      '       CLIE.CLIE_ENDERECO,'
      '       CLIE.CLIE_BAIRRO,'
      '       CLIE.CLIE_TELEFONE1,'
      '       CLIN.CLIE_RAZAO_SOCIAL AS RAZAO_INDICACAO,'
      '       CLIN.CLIE_FANTASIA     AS FANTASIA_INDICACAO,'
      '       USUA.USER_NOME_COMPLETO,'
      '       TPRC.TPRC_DESCRICAO,'
      '       CLIE.CLIE_OBS,'
      '       CLIE.CLIE_DTA_CADASTRO'
      '  FROM AGENDA            AGEN'
      '  JOIN CLIENTES          CLIE'
      '    ON CLIE.CLIE_ID      = AGEN.AGEN_CLIE_ID'
      '   AND CLIE.CLIE_EMPR_ID = AGEN.AGEN_CLIE_EMPR_ID'
      '  LEFT JOIN CLIENTES          CLIN'
      '    ON CLIN.CLIE_ID      = AGEN.AGEN_CLIE_ID_INDICACAO'
      '   AND CLIN.CLIE_EMPR_ID = AGEN.AGEN_CLIE_EMPR_ID_INDICACAO'
      '  JOIN USUARIO           USUA'
      '    ON USUA.USER_ID      = AGEN.AGEN_USER_ID_ATENDENTE'
      '  JOIN TABELA_PRECO      TPRC'
      '    ON TPRC.TPRC_ID      = AGEN.AGEN_TPRC_ID'
      '   AND TPRC.TPRC_EMPR_ID = AGEN.AGEN_TPRC_EMPR_ID'
      ' WHERE AGEN.AGEN_EMPR_ID = :EMPR_ID'
      '   AND AGEN.AGEN_DATA    >= :DATAI'
      '   AND AGEN.AGEN_DATA    <= :DATAF')
    SQLConnection = dmConexao.dbConexao
    Left = 208
    Top = 48
    object qryAgendaAGEN_ID: TIntegerField
      FieldName = 'AGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendaAGEN_EMPR_ID: TIntegerField
      FieldName = 'AGEN_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendaAGEN_CLIE_ID: TIntegerField
      FieldName = 'AGEN_CLIE_ID'
    end
    object qryAgendaAGEN_CLIE_EMPR_ID: TIntegerField
      FieldName = 'AGEN_CLIE_EMPR_ID'
    end
    object qryAgendaAGEN_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'AGEN_USER_ID_ATENDENTE'
    end
    object qryAgendaAGEN_TPRC_ID: TIntegerField
      FieldName = 'AGEN_TPRC_ID'
    end
    object qryAgendaAGEN_TPRC_EMPR_ID: TIntegerField
      FieldName = 'AGEN_TPRC_EMPR_ID'
    end
    object qryAgendaAGEN_HORA: TStringField
      FieldName = 'AGEN_HORA'
      Size = 5
    end
    object qryAgendaAGEN_DATA: TDateField
      FieldName = 'AGEN_DATA'
    end
    object qryAgendaAGEN_OBS: TBlobField
      FieldName = 'AGEN_OBS'
      Size = 1
    end
    object qryAgendaAGEN_STATUS: TStringField
      FieldName = 'AGEN_STATUS'
      FixedChar = True
      Size = 1
    end
    object qryAgendaAGEN_CLIENTE: TStringField
      FieldName = 'AGEN_CLIENTE'
      Size = 100
    end
    object qryAgendaAGEN_CLIE_ID_INDICACAO: TIntegerField
      FieldName = 'AGEN_CLIE_ID_INDICACAO'
    end
    object qryAgendaAGEN_CLIE_EMPR_ID_INDICACAO: TIntegerField
      FieldName = 'AGEN_CLIE_EMPR_ID_INDICACAO'
    end
    object qryAgendaAGEN_DTA_CADASTRO: TDateField
      FieldName = 'AGEN_DTA_CADASTRO'
    end
    object qryAgendaAGEN_USER_ID: TIntegerField
      FieldName = 'AGEN_USER_ID'
    end
    object qryAgendaCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object qryAgendaCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object qryAgendaRAZAO_INDICACAO: TStringField
      FieldName = 'RAZAO_INDICACAO'
      ProviderFlags = []
      Size = 150
    end
    object qryAgendaFANTASIA_INDICACAO: TStringField
      FieldName = 'FANTASIA_INDICACAO'
      ProviderFlags = []
      Size = 150
    end
    object qryAgendaUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      ProviderFlags = []
      Size = 100
    end
    object qryAgendaTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryAgendaCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object qryAgendaCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = []
      Size = 150
    end
    object qryAgendaCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object qryAgendaCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = []
      Size = 14
    end
    object qryAgendaAGEN_FOTO_ANT: TBlobField
      FieldName = 'AGEN_FOTO_ANT'
      Size = 1
    end
    object qryAgendaAGEN_FOTO_DEP: TBlobField
      FieldName = 'AGEN_FOTO_DEP'
      Size = 1
    end
    object qryAgendaAGEN_VLR_TOTAL: TFMTBCDField
      FieldName = 'AGEN_VLR_TOTAL'
      Precision = 18
      Size = 4
    end
    object qryAgendaAGEN_VLR_DESCONTO: TFMTBCDField
      FieldName = 'AGEN_VLR_DESCONTO'
      Precision = 18
      Size = 4
    end
    object qryAgendaAGEN_VLR_PAGO: TFMTBCDField
      FieldName = 'AGEN_VLR_PAGO'
      Precision = 18
      Size = 4
    end
    object qryAgendaAGEN_ORDS_ID: TIntegerField
      FieldName = 'AGEN_ORDS_ID'
    end
    object qryAgendaAGEN_ORDS_EMPR_ID: TIntegerField
      FieldName = 'AGEN_ORDS_EMPR_ID'
    end
    object qryAgendaAGEN_TELEFONE: TStringField
      FieldName = 'AGEN_TELEFONE'
      Size = 14
    end
    object qryAgendaAGEN_EXT_HORARIO: TIntegerField
      FieldName = 'AGEN_EXT_HORARIO'
    end
    object qryAgendaAGEN_AGEN_ID: TIntegerField
      FieldName = 'AGEN_AGEN_ID'
    end
    object qryAgendaAGEN_AGEN_EMPR_ID: TIntegerField
      FieldName = 'AGEN_AGEN_EMPR_ID'
    end
    object qryAgendaAGEN_BLOQUEAR_HORARIO: TIntegerField
      FieldName = 'AGEN_BLOQUEAR_HORARIO'
    end
    object qryAgendaAGEN_BAIXA_ESTOQUE: TIntegerField
      FieldName = 'AGEN_BAIXA_ESTOQUE'
    end
    object qryAgendaAGEN_FECHOU_FINANCEIRO: TIntegerField
      FieldName = 'AGEN_FECHOU_FINANCEIRO'
    end
    object qryAgendaAGEN_PIGMENTO_COR: TStringField
      FieldName = 'AGEN_PIGMENTO_COR'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_MARCA: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_LOTE: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_ORIGEM_REAGENDAMENTO: TIntegerField
      FieldName = 'AGEN_ORIGEM_REAGENDAMENTO'
      Required = True
    end
    object qryAgendaAGEN_PIGMENTO_COR1: TStringField
      FieldName = 'AGEN_PIGMENTO_COR1'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_MARCA1: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA1'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_LOTE1: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE1'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_COR2: TStringField
      FieldName = 'AGEN_PIGMENTO_COR2'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_MARCA2: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA2'
      Visible = False
      Size = 50
    end
    object qryAgendaAGEN_PIGMENTO_LOTE2: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE2'
      Visible = False
      Size = 50
    end
    object qryAgendaCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = []
      Size = 1
    end
    object qryAgendaCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = []
      Visible = False
    end
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
      end>
    SQL.Strings = (
      'SELECT DISTINCT'
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
      '      TF.GENE_IMAGE,'
      '      PR.PROD_DURACAO'
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
      'AND   OI.ODIT_ORDS_EMPR_ID      = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 342
    Top = 48
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
      ProviderFlags = []
      Size = 100
    end
    object qryOrdemServicoItensPROD_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryOrdemServicoItensMARCA_PROD: TStringField
      FieldName = 'MARCA_PROD'
      ProviderFlags = []
      Size = 50
    end
    object qryOrdemServicoItensMODELO_PROD: TStringField
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Size = 50
    end
    object qryOrdemServicoItensPROD_GARANTIA: TIntegerField
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = []
    end
    object qryOrdemServicoItensGENE_IMAGE: TBlobField
      FieldName = 'GENE_IMAGE'
      ProviderFlags = []
      Size = 1
    end
    object qryOrdemServicoItensODIT_USER_ID_TEC: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryOrdemServicoItensPROD_DURACAO: TIntegerField
      DisplayLabel = 'Dura'#231#227'o'
      FieldName = 'PROD_DURACAO'
      ProviderFlags = []
    end
  end
  object dspOrdemServicoItens: TDataSetProvider
    DataSet = qryOrdemServicoItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 342
    Top = 96
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
      end>
    ProviderName = 'dspOrdemServicoItens'
    OnNewRecord = cdsOrdemServicoItensNewRecord
    OnReconcileError = cdsOrdemServicoItensReconcileError
    Left = 342
    Top = 144
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
      ProviderFlags = []
      Size = 100
    end
    object cdsOrdemServicoItensPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsOrdemServicoItensPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      DisplayWidth = 7
      FieldName = 'PROD_GARANTIA'
      ProviderFlags = []
      Visible = False
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
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsOrdemServicoItensMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 20
      FieldName = 'MODELO_PROD'
      ProviderFlags = []
      Visible = False
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
      ProviderFlags = []
      Visible = False
      Size = 1
    end
    object cdsOrdemServicoItensODIT_USER_ID_TEC: TIntegerField
      FieldName = 'ODIT_USER_ID_TEC'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsOrdemServicoItensPROD_DURACAO: TIntegerField
      DisplayLabel = 'Dura'#231#227'o'
      FieldName = 'PROD_DURACAO'
      ProviderFlags = []
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
    Left = 344
    Top = 192
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
      '      COALESCE(PR.PROD_COD_FORN4,0) AS COD_FORNEC4,'
      '      COALESCE(PR.PROD_DURACAO,15)   AS PROD_DURACAO'
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
    Left = 454
    Top = 48
  end
  object dspPesqProduto: TDataSetProvider
    DataSet = qryPesqProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 454
    Top = 96
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
    Left = 454
    Top = 144
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
    object cdsPesqProdutoTPIT_EMPR_ID: TIntegerField
      FieldName = 'TPIT_EMPR_ID'
      Visible = False
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
    object cdsPesqProdutoPROD_DURACAO: TIntegerField
      DisplayLabel = 'Dura'#231#227'o'
      FieldName = 'PROD_DURACAO'
    end
  end
  object dspListaAtendimentos: TDataSetProvider
    DataSet = qryListaAtendimentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 544
    Top = 96
  end
  object cdsListaAtendimentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AGEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaAtendimentos'
    Left = 544
    Top = 144
    object cdsListaAtendimentosAGEN_ID: TIntegerField
      FieldName = 'AGEN_ID'
      Required = True
    end
    object cdsListaAtendimentosAGEN_DTA_CADASTRO: TDateField
      FieldName = 'AGEN_DTA_CADASTRO'
      Required = True
    end
    object cdsListaAtendimentosAGEN_DATA: TDateField
      FieldName = 'AGEN_DATA'
      Required = True
    end
    object cdsListaAtendimentosAGEN_HORA: TStringField
      FieldName = 'AGEN_HORA'
      Required = True
      Size = 5
    end
    object cdsListaAtendimentosAGEN_CLIE_ID: TIntegerField
      FieldName = 'AGEN_CLIE_ID'
      Required = True
    end
    object cdsListaAtendimentosCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsListaAtendimentosCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      Required = True
      Size = 150
    end
    object cdsListaAtendimentosCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      Required = True
      Size = 100
    end
    object cdsListaAtendimentosCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      FixedChar = True
      Size = 10
    end
    object cdsListaAtendimentosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 250
    end
    object cdsListaAtendimentosUF: TStringField
      FieldName = 'UF'
      Size = 250
    end
    object cdsListaAtendimentosPROFISSIONAL: TStringField
      FieldName = 'PROFISSIONAL'
      Size = 100
    end
    object cdsListaAtendimentosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 10
    end
    object cdsListaAtendimentosGLAUCOMA: TStringField
      FieldName = 'GLAUCOMA'
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsListaAtendimentosDEPRESSAO: TStringField
      FieldName = 'DEPRESSAO'
      Required = True
      FixedChar = True
      Size = 16
    end
    object cdsListaAtendimentosEPILEPSIA: TStringField
      FieldName = 'EPILEPSIA'
      Required = True
      FixedChar = True
      Size = 16
    end
    object cdsListaAtendimentosMARCA_PASSO: TStringField
      FieldName = 'MARCA_PASSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsListaAtendimentosHIPERTENSAO: TStringField
      FieldName = 'HIPERTENSAO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsListaAtendimentosHEPATITE: TStringField
      FieldName = 'HEPATITE'
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsListaAtendimentosCLIE_HEPATITE_TIPO: TStringField
      FieldName = 'CLIE_HEPATITE_TIPO'
      Size = 25
    end
    object cdsListaAtendimentosDIABETES: TStringField
      FieldName = 'DIABETES'
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsListaAtendimentosCLIE_DIABETES_TIPO: TStringField
      FieldName = 'CLIE_DIABETES_TIPO'
      Size = 25
    end
    object cdsListaAtendimentosCANCER: TStringField
      FieldName = 'CANCER'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaAtendimentosHIV: TStringField
      FieldName = 'HIV'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaAtendimentosALCOOLIZADO: TStringField
      FieldName = 'ALCOOLIZADO'
      Required = True
      FixedChar = True
      Size = 21
    end
    object cdsListaAtendimentosGRAVIDA: TStringField
      FieldName = 'GRAVIDA'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsListaAtendimentosALERGICO: TStringField
      FieldName = 'ALERGICO'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsListaAtendimentosPROBLEMA_PELE: TStringField
      FieldName = 'PROBLEMA_PELE'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsListaAtendimentosUTILIZOU_ANESTESIA: TStringField
      FieldName = 'UTILIZOU_ANESTESIA'
      Required = True
      FixedChar = True
      Size = 22
    end
    object cdsListaAtendimentosCLIE_TEMPO_ANESTESIA: TTimeField
      FieldName = 'CLIE_TEMPO_ANESTESIA'
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_COR: TStringField
      FieldName = 'AGEN_PIGMENTO_COR'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_MARCA: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_LOTE: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE'
      Size = 50
    end
    object cdsListaAtendimentosNIVEL_ANESTESIA: TStringField
      FieldName = 'NIVEL_ANESTESIA'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsListaAtendimentosAGEN_OBS: TBlobField
      FieldName = 'AGEN_OBS'
      Size = 1
    end
    object cdsListaAtendimentosAGEN_ORDS_ID: TIntegerField
      FieldName = 'AGEN_ORDS_ID'
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_COR1: TStringField
      FieldName = 'AGEN_PIGMENTO_COR1'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_MARCA1: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA1'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_LOTE1: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE1'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_COR2: TStringField
      FieldName = 'AGEN_PIGMENTO_COR2'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_MARCA2: TStringField
      FieldName = 'AGEN_PIGMENTO_MARCA2'
      Size = 50
    end
    object cdsListaAtendimentosAGEN_PIGMENTO_LOTE2: TStringField
      FieldName = 'AGEN_PIGMENTO_LOTE2'
      Size = 50
    end
  end
  object qryListaAtendimentos: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AGEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT AGEN_ID,'
      '       AGEN_DTA_CADASTRO,'
      '       AGEN_DATA,'
      '       AGEN_HORA,'
      '       AGEN_CLIE_ID,'
      '       CLIE_FANTASIA,'
      '       CLIE_ENDERECO,'
      '       CLIE_BAIRRO,'
      '       CLIE_CEP,'
      
        '       GENE_DESCR                                               ' +
        '                AS CIDADE,'
      
        '       GENE_PAR1                                                ' +
        '                AS UF,'
      
        '       USER_NOME_COMPLETO                                       ' +
        '                AS PROFISSIONAL,'
      '       CASE AGEN_STATUS'
      '            WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '            WHEN '#39'O'#39' THEN '#39'Confirmado'#39
      '            WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '            WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '            WHEN '#39'B'#39' THEN '#39'Bloqueado'#39
      
        '       END                                                      ' +
        '                AS STATUS,'
      '       CASE CLIE_GLAUCOMA'
      '            WHEN 1 THEN '#39'Glaucoma: ( X )'#39
      '            ELSE '#39'Glaucoma: (   )'#39
      
        '       END                                                      ' +
        '                AS GLAUCOMA,'
      '       CASE CLIE_DEPRESSAO'
      '            WHEN 1 THEN '#39'Depress'#227'o: ( X )'#39
      '            ELSE '#39'Depress'#227'o: (   )'#39
      
        '       END                                                      ' +
        '                AS DEPRESSAO,'
      '       CASE CLIE_EPILEPSIA'
      '            WHEN 1 THEN '#39'Epilepsia: ( X )'#39
      '            ELSE '#39'Epilepsia: (   )'#39
      
        '       END                                                      ' +
        '                AS EPILEPSIA,'
      '       CASE CLIE_MARCA_PASSO'
      '            WHEN 1 THEN '#39'Marca-Passo: ( X )'#39
      '            ELSE '#39'Marca-Passo: (   )'#39
      
        '       END                                                      ' +
        '                AS MARCA_PASSO,'
      '       CASE CLIE_HIPERTENSAO'
      '            WHEN 1 THEN '#39'Hipertens'#227'o: ( X )'#39
      '            ELSE '#39'Hipertens'#227'o: (   )'#39
      
        '       END                                                      ' +
        '                AS HIPERTENSAO,'
      '       CASE CLIE_HEPATITE'
      '            WHEN 1 THEN '#39'Hepatite: ( X )'#39
      '            ELSE '#39'Hepatite: (   )'#39
      
        '       END                                                      ' +
        '                AS HEPATITE,'
      '       CLIE_HEPATITE_TIPO,'
      '       CASE CLIE_DIABETES'
      '            WHEN 1 THEN '#39'Diabetes: ( X )'#39
      '            ELSE '#39'Diabetes: (   )'#39
      
        '       END                                                      ' +
        '                AS DIABETES,'
      '       CLIE_DIABETES_TIPO,'
      '       CASE CLIE_CANCER'
      '            WHEN 1 THEN '#39'C'#226'ncer: ( X )'#39
      '            ELSE '#39'C'#226'ncer: (   )'#39
      
        '       END                                                      ' +
        '                AS CANCER,'
      '       CASE CLIE_HIV'
      '            WHEN 1 THEN '#39'HIV: ( X )'#39
      '            ELSE '#39'HIV: (   )'#39
      
        '       END                                                      ' +
        '                  AS HIV,'
      '       CASE CLIE_ALCOOLIZADO'
      '            WHEN 1 THEN '#39'Alcoolizado(a): ( X )'#39
      '            ELSE '#39'Alcoolizado(a): (   )'#39
      
        '       END                                                      ' +
        '                AS ALCOOLIZADO,'
      '       CASE CLIE_GRAVIDA'
      '            WHEN 1 THEN '#39'Gr'#225'vida: ( X )'#39
      '            ELSE '#39'Gr'#225'vida: (   )'#39
      
        '       END                                                      ' +
        '                AS GRAVIDA,'
      '       CASE CLIE_ALERGICO_METAIS_PIGMETO'
      '            WHEN 1 THEN '#39'Alergia: ( X )'#39
      '            ELSE '#39'Alergia: (   )'#39
      
        '       END                                                      ' +
        '                AS ALERGICO,'
      '       CASE CLIE_PROBLEMAS_PELE'
      '            WHEN 1 THEN '#39'Probl. Pele: ( X )'#39
      '            ELSE '#39'Probl. Pele: (   )'#39
      
        '       END                                                      ' +
        '                AS PROBLEMA_PELE,'
      '       CASE CLIE_UTILIZOU_ANESTESIA'
      '            WHEN 1 THEN '#39'Util. Anestesia: ( X )'#39
      '            ELSE '#39'Util. Anestesia: (   )'#39
      
        '       END                                                      ' +
        '                AS UTILIZOU_ANESTESIA,'
      '       CLIE_TEMPO_ANESTESIA,'
      '       AGEN_PIGMENTO_COR,'
      '       AGEN_PIGMENTO_MARCA,'
      '       AGEN_PIGMENTO_LOTE,'
      '       AGEN_PIGMENTO_COR1,'
      '       AGEN_PIGMENTO_MARCA1,'
      '       AGEN_PIGMENTO_LOTE1,'
      '       AGEN_PIGMENTO_COR2,'
      '       AGEN_PIGMENTO_MARCA2,'
      '       AGEN_PIGMENTO_LOTE2,'
      '       CASE CLIE_UTILIZOU_ANESTESIA'
      '            WHEN 1 THEN CASE CLIE_NIVEL_ANESTESIA'
      '                             WHEN 0 THEN '#39'Baixo'#39
      '                             WHEN 1 THEN '#39'M'#233'dio'#39
      '                             WHEN 2 THEN '#39'Alto'#39
      '                             WHEN 3 THEN '#39'N'#227'o Pegou'#39
      '                             ELSE '#39#39
      '                        END'
      '           ELSE '#39#39
      
        '       END                                                      ' +
        '                AS NIVEL_ANESTESIA,'
      '       AGEN_OBS,'
      '       AGEN_ORDS_ID'
      '  FROM AGENDA'
      '  JOIN CLIENTES'
      '    ON CLIE_ID       = AGEN_CLIE_ID'
      '   AND CLIE_EMPR_ID  = AGEN_CLIE_EMPR_ID'
      '  JOIN GENERICA'
      '    ON GENE_EMPR_ID  = CLIE_GENE_EMPR_ID_PRACA'
      '   AND GENE_TGEN_ID  = CLIE_GENE_TGEN_ID_PRACA'
      '   AND GENE_ID       = CLIE_GENE_ID_PRACA'
      '  JOIN USUARIO'
      '    ON USER_ID       = AGEN_USER_ID_ATENDENTE'
      ' WHERE AGEN_CLIE_ID  = :CLIE_ID'
      '   AND AGEN_ID      <> :AGEN_ID'
      '   AND AGEN_EMPR_ID  = :EMPR_ID'
      '   AND AGEN_AGEN_ID IS NULL'
      '   AND AGEN_STATUS = '#39'F'#39
      ' ORDER BY'
      '       AGEN_DATA DESC,'
      '       AGEN_HORA DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 544
    Top = 48
  end
  object dsListaAtendimentos: TDataSource
    DataSet = cdsListaAtendimentos
    OnDataChange = dsListaAtendimentosDataChange
    Left = 544
    Top = 192
  end
  object dspListaItensAtendimentos: TDataSetProvider
    DataSet = qryListaItensAtendimentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 656
    Top = 96
  end
  object cdsListaItensAtendimentos: TClientDataSet
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
      end>
    ProviderName = 'dspListaItensAtendimentos'
    Left = 656
    Top = 144
    object cdsListaItensAtendimentosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsListaItensAtendimentosPROD_DURACAO: TIntegerField
      FieldName = 'PROD_DURACAO'
    end
  end
  object qryListaItensAtendimentos: TSQLQuery
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
      end>
    SQL.Strings = (
      'SELECT PROD_DESCRICAO,'
      '       PROD_DURACAO'
      '  FROM ORDEM_SERVICO_ITENS'
      '  JOIN PRODUTOS'
      '    ON PROD_ID            = ODIT_TPIT_PROD_ID'
      '   AND PROD_EMPR_ID       = ODIT_TPIT_PROD_EMPR_ID'
      ' WHERE ODIT_ORDS_ID       = :ORDS_ID'
      '   AND ODIT_ORDS_EMPR_ID  = :EMPR_ID'
      ' ORDER BY'
      '       PROD_DURACAO DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 656
    Top = 48
  end
  object dsListaItensAtendimentos: TDataSource
    DataSet = cdsListaItensAtendimentos
    Left = 656
    Top = 192
  end
  object dspAniversario: TDataSetProvider
    DataSet = qryAniversario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 776
    Top = 96
  end
  object cdsAniversario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAniversario'
    Left = 776
    Top = 144
    object cdsAniversarioCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
      Required = True
    end
    object cdsAniversarioCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsAniversarioCLIE_TELEFONE1: TStringField
      FieldName = 'CLIE_TELEFONE1'
      Required = True
      Size = 14
    end
    object cdsAniversarioCLIE_TELEFONE2: TStringField
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsAniversarioCLIE_TELEFONE3: TStringField
      FieldName = 'CLIE_TELEFONE3'
      Size = 14
    end
    object cdsAniversarioCLIE_TELEFONE4: TStringField
      FieldName = 'CLIE_TELEFONE4'
      Size = 14
    end
    object cdsAniversarioCLIE_DT_NASCIMENTO: TDateField
      FieldName = 'CLIE_DT_NASCIMENTO'
    end
  end
  object qryAniversario: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CLIE_ID,'
      '       CLIE_FANTASIA,'
      '       CLIE_DT_NASCIMENTO,'
      '       CLIE_TELEFONE1,'
      '       CLIE_TELEFONE2,'
      '       CLIE_TELEFONE3,'
      '       CLIE_TELEFONE4'
      '  FROM CLIENTES'
      ' WHERE CLIE_EMPR_ID       = :EMPR_ID'
      
        '   AND EXTRACT(DAY   FROM CLIE_DT_NASCIMENTO) = EXTRACT(DAY   FR' +
        'OM (SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE))'
      
        '   AND EXTRACT(MONTH FROM CLIE_DT_NASCIMENTO) = EXTRACT(MONTH FR' +
        'OM (SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE))')
    SQLConnection = dmConexao.dbConexao
    Left = 776
    Top = 48
  end
  object dsAniversario: TDataSource
    DataSet = cdsAniversario
    Left = 776
    Top = 192
  end
  object qryAcertos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT GENE_DESCR,'
      '       ACER_VLR_DOC,'
      '       ACER_DTA_CADASTRO,'
      '       ACER_DTA_VCTO,'
      '       CASE ACER_STATUS'
      '            WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '            WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '       END                 AS STATUS'
      '  FROM ACERTOS'
      '  JOIN AGENDA'
      '    ON AGEN_ID             = ACER_ID_ORIGEM'
      '   AND AGEN_EMPR_ID        = ACER_EMPR_ID_ORIGEM'
      '  JOIN GENERICA'
      '    ON GENE_EMPR_ID        = ACER_GENE_EMPR_ID_TP_DOC'
      '   AND GENE_TGEN_ID        = ACER_GENE_TGEN_ID_TP_DOC'
      '   AND GENE_ID             = ACER_GENE_ID_TP_DOC'
      ' WHERE ACER_EMPR_ID        = :EMPR_ID'
      '   AND ACER_ORIGEM         = '#39'A'#39
      '   AND ACER_ID_ORIGEM      = :ID'
      '   AND ACER_EMPR_ID_ORIGEM = :EMPR_ID'
      ' ORDER BY'
      '       ACER_ID DESC, ACER_STATUS')
    SQLConnection = dmConexao.dbConexao
    Left = 208
    Top = 272
  end
  object dspAcertos: TDataSetProvider
    DataSet = qryAcertos
    Left = 208
    Top = 320
  end
  object cdsAcertos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcertos'
    Left = 208
    Top = 368
    object cdsAcertosGENE_DESCR: TStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsAcertosACER_VLR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      FieldName = 'ACER_VLR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsAcertosACER_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cad.'
      FieldName = 'ACER_DTA_CADASTRO'
      Required = True
    end
    object cdsAcertosACER_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vecto'
      FieldName = 'ACER_DTA_VCTO'
    end
    object cdsAcertosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
  end
  object dsAcertos: TDataSource
    DataSet = cdsAcertos
    Left = 208
    Top = 416
  end
  object qryItensSintetico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AGEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT AGEN_ID,'
      '       AGEN_DATA,'
      '       AGEN_HORA,'
      '       USER_NOME_COMPLETO,'
      '       PROD_DESCRICAO,'
      '       PROD_DURACAO,'
      '       ODIT_VLR_UNITARIO,'
      '       ODIT_QTDE,'
      '       ODIT_VLR_TOTAL,'
      '       CASE AGEN_STATUS'
      '            WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '            WHEN '#39'O'#39' THEN '#39'Confirmado'#39
      '            WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '            WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '            WHEN '#39'B'#39' THEN '#39'Bloqueado'#39
      '            WHEN '#39'L'#39' THEN '#39'Lista Negra'#39
      '       END STATUS'
      '  FROM ORDEM_SERVICO_ITENS'
      '  JOIN PRODUTOS'
      '    ON PROD_ID            = ODIT_TPIT_PROD_ID'
      '   AND PROD_EMPR_ID       = ODIT_TPIT_PROD_EMPR_ID'
      '  JOIN USUARIO'
      '    ON USER_ID            = ODIT_USER_ID_TEC'
      '  JOIN AGENDA'
      '    ON AGEN_ORDS_ID       = ODIT_ORDS_ID'
      '   AND AGEN_ORDS_EMPR_ID  = ODIT_ORDS_EMPR_ID'
      ' WHERE ODIT_ORDS_ID      IN (SELECT AGEN_ORDS_ID'
      '                               FROM AGENDA'
      '                               JOIN CLIENTES'
      '                                 ON CLIE_ID       = AGEN_CLIE_ID'
      
        '                                AND CLIE_EMPR_ID  = AGEN_CLIE_EM' +
        'PR_ID'
      '                               JOIN GENERICA'
      
        '                                 ON GENE_EMPR_ID  = CLIE_GENE_EM' +
        'PR_ID_PRACA'
      
        '                                AND GENE_TGEN_ID  = CLIE_GENE_TG' +
        'EN_ID_PRACA'
      
        '                                AND GENE_ID       = CLIE_GENE_ID' +
        '_PRACA'
      '                               JOIN USUARIO'
      
        '                                 ON USER_ID       = AGEN_USER_ID' +
        '_ATENDENTE'
      '                              WHERE AGEN_CLIE_ID  = :CLIE_ID'
      '                                AND AGEN_ID      <> :AGEN_ID'
      '                                AND AGEN_EMPR_ID  = :EMPR_ID'
      '                                AND AGEN_AGEN_ID IS NULL'
      '                                AND AGEN_STATUS  <> '#39'B'#39')'
      '   AND ODIT_ORDS_EMPR_ID  = :EMPR_ID'
      ' ORDER BY'
      '       AGEN_DATA DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 344
    Top = 272
  end
  object dspItensSintetico: TDataSetProvider
    DataSet = qryItensSintetico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 320
  end
  object cdsItensSintetico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AGEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensSintetico'
    Left = 344
    Top = 368
    object cdsItensSinteticoAGEN_ID: TIntegerField
      FieldName = 'AGEN_ID'
      Required = True
    end
    object cdsItensSinteticoAGEN_DATA: TDateField
      FieldName = 'AGEN_DATA'
      Required = True
    end
    object cdsItensSinteticoAGEN_HORA: TStringField
      FieldName = 'AGEN_HORA'
      Required = True
      Size = 5
    end
    object cdsItensSinteticoUSER_NOME_COMPLETO: TStringField
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object cdsItensSinteticoPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsItensSinteticoPROD_DURACAO: TIntegerField
      FieldName = 'PROD_DURACAO'
    end
    object cdsItensSinteticoODIT_VLR_UNITARIO: TFMTBCDField
      FieldName = 'ODIT_VLR_UNITARIO'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsItensSinteticoODIT_QTDE: TFMTBCDField
      FieldName = 'ODIT_QTDE'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsItensSinteticoODIT_VLR_TOTAL: TFMTBCDField
      FieldName = 'ODIT_VLR_TOTAL'
      Required = True
      Precision = 18
      Size = 4
    end
    object cdsItensSinteticoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 11
    end
  end
  object dsItensSintetico: TDataSource
    DataSet = cdsItensSintetico
    Left = 344
    Top = 416
  end
end
