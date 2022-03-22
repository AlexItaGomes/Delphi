object dmConfiguracao: TdmConfiguracao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 382
  Width = 789
  object qryConfiguracao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CS.*,'
      '      EP.EMPR_RAZAO_SOCIAL,'
      '      EP.EMPR_CNPJ,'
      '      TP.TPRC_DESCRICAO,'
      '      CL.CLIE_RAZAO_SOCIAL'
      'FROM  CONF_SISTEMA CS'
      'INNER JOIN EMPRESAS EP'
      'ON (EP.EMPR_ID = CS.CSIS_EMPR_ID)'
      'LEFT OUTER JOIN TABELA_PRECO TP'
      'ON (TP.TPRC_ID      = CS.CSIS_TPRC_ID'
      'AND TP.TPRC_EMPR_ID = CS.CSIS_TPRC_EMPR_ID)'
      'LEFT OUTER JOIN CLIENTES CL'
      'ON (CL.CLIE_ID      = CS.CSIS_CLIE_ID'
      'AND CL.CLIE_EMPR_ID = CS.CSIS_CLIE_EMPR_ID)'
      'WHERE CSIS_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 40
    object qryConfiguracaoCSIS_EMPR_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Empr.'
      FieldName = 'CSIS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryConfiguracaoEMPR_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPR_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object qryConfiguracaoCSIS_REPORTA_ERROS: TIntegerField
      FieldName = 'CSIS_REPORTA_ERROS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_USER_ID: TIntegerField
      FieldName = 'CSIS_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CSIS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_VISUAL_FINANCEIRO: TIntegerField
      FieldName = 'CSIS_VISUAL_FINANCEIRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_JURO: TFMTBCDField
      FieldName = 'CSIS_JURO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object qryConfiguracaoCSIS_MORA: TFMTBCDField
      FieldName = 'CSIS_MORA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.0000'
      Precision = 20
      Size = 4
    end
    object qryConfiguracaoCSIS_PERCENTE_RENDA: TIntegerField
      FieldName = 'CSIS_PERCENTE_RENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_ESTOQUE_NEGATIVO: TIntegerField
      FieldName = 'CSIS_ESTOQUE_NEGATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TPRC_ID: TIntegerField
      FieldName = 'CSIS_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TPRC_EMPR_ID: TIntegerField
      FieldName = 'CSIS_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_CLIE_ID: TIntegerField
      FieldName = 'CSIS_CLIE_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'CSIS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 100
    end
    object qryConfiguracaoCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 150
    end
    object qryConfiguracaoCSIS_VERSION_SYSTEM: TIntegerField
      FieldName = 'CSIS_VERSION_SYSTEM'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_REAGENDAR_OS: TIntegerField
      FieldName = 'CSIS_REAGENDAR_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_FORCAR_REAGENDA: TIntegerField
      FieldName = 'CSIS_FORCAR_REAGENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_INTEGRAR_PRODUTOS: TIntegerField
      FieldName = 'CSIS_INTEGRAR_PRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_INTEGRAR_CLIENTES: TIntegerField
      FieldName = 'CSIS_INTEGRAR_CLIENTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_VLR_META_ANO: TFMTBCDField
      FieldName = 'CSIS_VLR_META_ANO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 4
    end
    object qryConfiguracaoCSIS_TIPO_MENU: TIntegerField
      FieldName = 'CSIS_TIPO_MENU'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_CONTROLA_LIMITE_CREDITO: TIntegerField
      FieldName = 'CSIS_CONTROLA_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoEMPR_CNPJ: TStringField
      FieldName = 'EMPR_CNPJ'
      ProviderFlags = []
      Visible = False
      Size = 18
    end
    object qryConfiguracaoCSIS_EMPRESA_MATRIZ: TIntegerField
      FieldName = 'CSIS_EMPRESA_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TIPO_EMPRESA: TIntegerField
      FieldName = 'CSIS_TIPO_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_OPTANTE_SIMPLES: TIntegerField
      FieldName = 'CSIS_OPTANTE_SIMPLES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_ALIQUOTA_PADRAO_PIS: TFMTBCDField
      FieldName = 'CSIS_ALIQUOTA_PADRAO_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_ALIQUOTA_PADRAO_COFINS: TFMTBCDField
      FieldName = 'CSIS_ALIQUOTA_PADRAO_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_SEPARAR_TELEATENDIMENTO: TIntegerField
      FieldName = 'CSIS_SEPARAR_TELEATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_TRAB_TIPO_AGENDAMENTO: TIntegerField
      FieldName = 'CSIS_TRAB_TIPO_AGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_USAR_PADRAO_TELEFONE: TIntegerField
      FieldName = 'CSIS_USAR_PADRAO_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_INFORMA_NR_PEDIDO: TIntegerField
      FieldName = 'CSIS_INFORMA_NR_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TRAB_FORNEC_EQUIP: TIntegerField
      FieldName = 'CSIS_TRAB_FORNEC_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TRAB_STATUS_OS: TIntegerField
      FieldName = 'CSIS_TRAB_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_FILTRAR_PLANO_CONTAS_PAI: TIntegerField
      FieldName = 'CSIS_FILTRAR_PLANO_CONTAS_PAI'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_VINCULAR_CARTAO_CREDITO: TIntegerField
      FieldName = 'CSIS_VINCULAR_CARTAO_CREDITO'
    end
    object qryConfiguracaoCSIS_PERC_FUNDO_RESERVA: TFMTBCDField
      FieldName = 'CSIS_PERC_FUNDO_RESERVA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_APLICA_FDR_VLR_LIQUIDO: TIntegerField
      FieldName = 'CSIS_APLICA_FDR_VLR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_PERC_RESERVA_LUCRO: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_LUCRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_PERC_RESERVA_LEGAL: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_LEGAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_PERC_RESERVA_ESTATUTARIAS: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_ESTATUTARIAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_APLICA_FDE_VLR_LIQUIDO: TIntegerField
      FieldName = 'CSIS_APLICA_FDE_VLR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_REPLICA_CLIENTE_FORNECEDOR: TIntegerField
      FieldName = 'CSIS_REPLICA_CLIENTE_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_INICIO_TRABALHO: TTimeField
      FieldName = 'CSIS_INICIO_TRABALHO'
      ProviderFlags = [pfInUpdate]
      EditMask = '##:##'
    end
    object qryConfiguracaoCSIS_FINAL_TRABALHO: TTimeField
      FieldName = 'CSIS_FINAL_TRABALHO'
      ProviderFlags = [pfInUpdate]
      EditMask = '##:##'
    end
    object qryConfiguracaoCSIS_INTERVALO_HORARIO: TTimeField
      FieldName = 'CSIS_INTERVALO_HORARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##:##'
    end
    object qryConfiguracaoCSIS_HR_ALMOCO_INICIO: TTimeField
      FieldName = 'CSIS_HR_ALMOCO_INICIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_HR_ALMOCO_FIM: TTimeField
      FieldName = 'CSIS_HR_ALMOCO_FIM'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_OCULTA_CLIENTES: TIntegerField
      FieldName = 'CSIS_OCULTA_CLIENTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TX_CREDITO: TFMTBCDField
      FieldName = 'CSIS_TX_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_TX_DEBITO: TFMTBCDField
      FieldName = 'CSIS_TX_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object qryConfiguracaoCSIS_DIAS_DEP_CREDITO: TIntegerField
      FieldName = 'CSIS_DIAS_DEP_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_DIAS_DEP_DEBITO: TIntegerField
      FieldName = 'CSIS_DIAS_DEP_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfiguracaoCSIS_TIPO: TStringField
      FieldName = 'CSIS_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryConfiguracaoCSIS_CHAVE: TStringField
      FieldName = 'CSIS_CHAVE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2500
    end
    object qryConfiguracaoCSIS_BSYS: TStringField
      FieldName = 'CSIS_BSYS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryConfiguracaoCSIS_RECIBO_PGTOPARCIAL: TIntegerField
      FieldName = 'CSIS_RECIBO_PGTOPARCIAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_CBCO_ID_CREDITO: TIntegerField
      FieldName = 'CSIS_CBCO_ID_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_CBCO_EMPR_ID_CREDITO: TIntegerField
      FieldName = 'CSIS_CBCO_EMPR_ID_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_CBCO_ID_DEBITO: TIntegerField
      FieldName = 'CSIS_CBCO_ID_DEBITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_CBCO_EMPR_ID_DEBITO: TIntegerField
      FieldName = 'CSIS_CBCO_EMPR_ID_DEBITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_FORN_ID_CARTAO_CRED: TIntegerField
      FieldName = 'CSIS_FORN_ID_CARTAO_CRED'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_FORN_ID_CARTAO_DEB: TIntegerField
      FieldName = 'CSIS_FORN_ID_CARTAO_DEB'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfiguracaoCSIS_SOLICITA_NR_TRANSACAO: TIntegerField
      FieldName = 'CSIS_SOLICITA_NR_TRANSACAO'
    end
    object qryConfiguracaoCSIS_BKP_SEGUNDA: TIntegerField
      FieldName = 'CSIS_BKP_SEGUNDA'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_TERCA: TIntegerField
      FieldName = 'CSIS_BKP_TERCA'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_QUARTA: TIntegerField
      FieldName = 'CSIS_BKP_QUARTA'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_QUINTA: TIntegerField
      FieldName = 'CSIS_BKP_QUINTA'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_SEXTA: TIntegerField
      FieldName = 'CSIS_BKP_SEXTA'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_SABADO: TIntegerField
      FieldName = 'CSIS_BKP_SABADO'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_DOMINGO: TIntegerField
      FieldName = 'CSIS_BKP_DOMINGO'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_HORA1: TTimeField
      FieldName = 'CSIS_BKP_HORA1'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_HORA2: TTimeField
      FieldName = 'CSIS_BKP_HORA2'
      Visible = False
    end
    object qryConfiguracaoCSIS_BKP_HORA3: TTimeField
      FieldName = 'CSIS_BKP_HORA3'
      Visible = False
    end
  end
  object dspConfiguracao: TDataSetProvider
    DataSet = qryConfiguracao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object cdsConfiguracao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspConfiguracao'
    AfterEdit = cdsConfiguracaoAfterEdit
    BeforeDelete = cdsConfiguracaoBeforeDelete
    OnNewRecord = cdsConfiguracaoNewRecord
    OnReconcileError = cdsConfiguracaoReconcileError
    Left = 72
    Top = 136
    object cdsConfiguracaoCSIS_EMPR_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Empr.'
      DisplayWidth = 15
      FieldName = 'CSIS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfiguracaoEMPR_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 15
      FieldName = 'EMPR_RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 150
    end
    object cdsConfiguracaoCSIS_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      DisplayWidth = 15
      FieldName = 'CSIS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfiguracaoCSIS_TRAB_FORNEC_EQUIP: TIntegerField
      FieldName = 'CSIS_TRAB_FORNEC_EQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TRAB_STATUS_OS: TIntegerField
      FieldName = 'CSIS_TRAB_STATUS_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_VLR_META_ANO: TFMTBCDField
      FieldName = 'CSIS_VLR_META_ANO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object cdsConfiguracaoCSIS_REPORTA_ERROS: TIntegerField
      DisplayWidth = 15
      FieldName = 'CSIS_REPORTA_ERROS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_USER_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'CSIS_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_JURO: TFMTBCDField
      DisplayWidth = 15
      FieldName = 'CSIS_JURO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '0.0000%'
      Precision = 20
      Size = 4
    end
    object cdsConfiguracaoCSIS_MORA: TFMTBCDField
      DisplayWidth = 15
      FieldName = 'CSIS_MORA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '0.0000%'
      Precision = 20
      Size = 4
    end
    object cdsConfiguracaoCSIS_VISUAL_FINANCEIRO: TIntegerField
      DisplayWidth = 15
      FieldName = 'CSIS_VISUAL_FINANCEIRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_PERCENTE_RENDA: TIntegerField
      DisplayWidth = 15
      FieldName = 'CSIS_PERCENTE_RENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '0.0000%'
    end
    object cdsConfiguracaoCSIS_ESTOQUE_NEGATIVO: TIntegerField
      FieldName = 'CSIS_ESTOQUE_NEGATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TPRC_ID: TIntegerField
      FieldName = 'CSIS_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TPRC_EMPR_ID: TIntegerField
      FieldName = 'CSIS_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CLIE_ID: TIntegerField
      FieldName = 'CSIS_CLIE_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CLIE_EMPR_ID: TIntegerField
      FieldName = 'CSIS_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 100
    end
    object cdsConfiguracaoCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 150
    end
    object cdsConfiguracaoCSIS_VERSION_SYSTEM: TIntegerField
      FieldName = 'CSIS_VERSION_SYSTEM'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_REAGENDAR_OS: TIntegerField
      FieldName = 'CSIS_REAGENDAR_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_FORCAR_REAGENDA: TIntegerField
      FieldName = 'CSIS_FORCAR_REAGENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_INTEGRAR_PRODUTOS: TIntegerField
      FieldName = 'CSIS_INTEGRAR_PRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_INTEGRAR_CLIENTES: TIntegerField
      FieldName = 'CSIS_INTEGRAR_CLIENTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TIPO_MENU: TIntegerField
      FieldName = 'CSIS_TIPO_MENU'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CONTROLA_LIMITE_CREDITO: TIntegerField
      FieldName = 'CSIS_CONTROLA_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoEMPR_CNPJ: TStringField
      FieldName = 'EMPR_CNPJ'
      ProviderFlags = []
      Visible = False
      Size = 18
    end
    object cdsConfiguracaoCSIS_EMPRESA_MATRIZ: TIntegerField
      FieldName = 'CSIS_EMPRESA_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TIPO_EMPRESA: TIntegerField
      FieldName = 'CSIS_TIPO_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_OPTANTE_SIMPLES: TIntegerField
      FieldName = 'CSIS_OPTANTE_SIMPLES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_ALIQUOTA_PADRAO_PIS: TFMTBCDField
      FieldName = 'CSIS_ALIQUOTA_PADRAO_PIS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_ALIQUOTA_PADRAO_COFINS: TFMTBCDField
      FieldName = 'CSIS_ALIQUOTA_PADRAO_COFINS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_SEPARAR_TELEATENDIMENTO: TIntegerField
      FieldName = 'CSIS_SEPARAR_TELEATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TRAB_TIPO_AGENDAMENTO: TIntegerField
      FieldName = 'CSIS_TRAB_TIPO_AGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_USAR_PADRAO_TELEFONE: TIntegerField
      FieldName = 'CSIS_USAR_PADRAO_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_FILTRAR_PLANO_CONTAS_PAI: TIntegerField
      FieldName = 'CSIS_FILTRAR_PLANO_CONTAS_PAI'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_VINCULAR_CARTAO_CREDITO: TIntegerField
      FieldName = 'CSIS_VINCULAR_CARTAO_CREDITO'
      Visible = False
    end
    object cdsConfiguracaoCSIS_PERC_FUNDO_RESERVA: TFMTBCDField
      FieldName = 'CSIS_PERC_FUNDO_RESERVA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_APLICA_FDR_VLR_LIQUIDO: TIntegerField
      FieldName = 'CSIS_APLICA_FDR_VLR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_PERC_RESERVA_LUCRO: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_LUCRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_PERC_RESERVA_LEGAL: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_LEGAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_PERC_RESERVA_ESTATUTARIAS: TFMTBCDField
      FieldName = 'CSIS_PERC_RESERVA_ESTATUTARIAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_APLICA_FDE_VLR_LIQUIDO: TIntegerField
      FieldName = 'CSIS_APLICA_FDE_VLR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_REPLICA_CLIENTE_FORNECEDOR: TIntegerField
      FieldName = 'CSIS_REPLICA_CLIENTE_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_INFORMA_NR_PEDIDO: TIntegerField
      FieldName = 'CSIS_INFORMA_NR_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_INICIO_TRABALHO: TTimeField
      FieldName = 'CSIS_INICIO_TRABALHO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##:##'
    end
    object cdsConfiguracaoCSIS_FINAL_TRABALHO: TTimeField
      FieldName = 'CSIS_FINAL_TRABALHO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##:##'
    end
    object cdsConfiguracaoCSIS_INTERVALO_HORARIO: TTimeField
      FieldName = 'CSIS_INTERVALO_HORARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##:##'
    end
    object cdsConfiguracaoCSIS_HR_ALMOCO_INICIO: TTimeField
      FieldName = 'CSIS_HR_ALMOCO_INICIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_HR_ALMOCO_FIM: TTimeField
      FieldName = 'CSIS_HR_ALMOCO_FIM'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_OCULTA_CLIENTES: TIntegerField
      FieldName = 'CSIS_OCULTA_CLIENTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TX_CREDITO: TFMTBCDField
      FieldName = 'CSIS_TX_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_TX_DEBITO: TFMTBCDField
      FieldName = 'CSIS_TX_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 18
      Size = 4
    end
    object cdsConfiguracaoCSIS_DIAS_DEP_CREDITO: TIntegerField
      FieldName = 'CSIS_DIAS_DEP_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_DIAS_DEP_DEBITO: TIntegerField
      FieldName = 'CSIS_DIAS_DEP_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_TIPO: TStringField
      FieldName = 'CSIS_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsConfiguracaoCSIS_CHAVE: TStringField
      FieldName = 'CSIS_CHAVE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2500
    end
    object cdsConfiguracaoCSIS_BSYS: TStringField
      FieldName = 'CSIS_BSYS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsConfiguracaoCSIS_RECIBO_PGTOPARCIAL: TIntegerField
      FieldName = 'CSIS_RECIBO_PGTOPARCIAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CBCO_ID_CREDITO: TIntegerField
      FieldName = 'CSIS_CBCO_ID_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CBCO_EMPR_ID_CREDITO: TIntegerField
      FieldName = 'CSIS_CBCO_EMPR_ID_CREDITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CBCO_ID_DEBITO: TIntegerField
      FieldName = 'CSIS_CBCO_ID_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_CBCO_EMPR_ID_DEBITO: TIntegerField
      FieldName = 'CSIS_CBCO_EMPR_ID_DEBITO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_FORN_ID_CARTAO_CRED: TIntegerField
      FieldName = 'CSIS_FORN_ID_CARTAO_CRED'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_FORN_ID_CARTAO_DEB: TIntegerField
      FieldName = 'CSIS_FORN_ID_CARTAO_DEB'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfiguracaoCSIS_SOLICITA_NR_TRANSACAO: TIntegerField
      FieldName = 'CSIS_SOLICITA_NR_TRANSACAO'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_SEGUNDA: TIntegerField
      FieldName = 'CSIS_BKP_SEGUNDA'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_TERCA: TIntegerField
      FieldName = 'CSIS_BKP_TERCA'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_QUARTA: TIntegerField
      FieldName = 'CSIS_BKP_QUARTA'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_QUINTA: TIntegerField
      FieldName = 'CSIS_BKP_QUINTA'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_SEXTA: TIntegerField
      FieldName = 'CSIS_BKP_SEXTA'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_SABADO: TIntegerField
      FieldName = 'CSIS_BKP_SABADO'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_DOMINGO: TIntegerField
      FieldName = 'CSIS_BKP_DOMINGO'
      Visible = False
    end
    object cdsConfiguracaoCSIS_BKP_HORA1: TTimeField
      FieldName = 'CSIS_BKP_HORA1'
      Visible = False
      EditMask = '##:##'
    end
    object cdsConfiguracaoCSIS_BKP_HORA2: TTimeField
      FieldName = 'CSIS_BKP_HORA2'
      Visible = False
      EditMask = '##:##'
    end
    object cdsConfiguracaoCSIS_BKP_HORA3: TTimeField
      FieldName = 'CSIS_BKP_HORA3'
      Visible = False
      EditMask = '##:##'
    end
  end
  object dsConfiguracao: TDataSource
    DataSet = cdsConfiguracao
    Left = 72
    Top = 184
  end
  object qryConfOS: TSQLQuery
    MaxBlobSize = -1
    Params = <
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
      'SELECT'
      '      CFOS_ID,'
      '      CFOS_EMPR_ID,'
      '      CFOS_CSIS_EMPR_ID,'
      '      CFOS_FCOD_EQUIP,'
      '      CFOS_FEQUIPAMENTO,'
      '      CFOS_FUNIDADE,'
      '      CFOS_FMARCA,'
      '      CFOS_FMODELO,'
      '      CFOS_FGARANTIA,'
      '      CFOS_FNRPEDIDO,'
      '      CFOS_FCOD_FORNECEDOR,'
      '      CFOS_FFORNECEDOR,'
      '      CFOS_FCOD_TECNICO,'
      '      CFOS_FTECNICO,'
      '      CFOS_FDTCADASTRO,'
      '      CFOS_FDTINSTALACAO,'
      '      CFOS_FDTENTREGA,'
      '      CFOS_FGRUPO_EQUIP,'
      '      CFOS_FGRUPO_PECAS_SERVICOS,'
      '      CFOS_FDTAGENDAMENTO,'
      '      CFOS_DIAS_REAGENDAMENTO,'
      '      CFOS_MENSAGEM_RODAPE,'
      '      CFOS_USER_ID_TEC_OS,'
      '      CFOS_DTA_CADASTRO,'
      '      CFOS_USER_ID'
      'FROM  CONF_ORDEM_SERVICO'
      'WHERE CFOS_EMPR_ID      = :EMPR_ID'
      'AND   CFOS_CSIS_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 176
    Top = 40
    object qryConfOSCFOS_ID: TIntegerField
      FieldName = 'CFOS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryConfOSCFOS_EMPR_ID: TIntegerField
      FieldName = 'CFOS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryConfOSCFOS_CSIS_EMPR_ID: TIntegerField
      FieldName = 'CFOS_CSIS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryConfOSCFOS_FCOD_EQUIP: TStringField
      FieldName = 'CFOS_FCOD_EQUIP'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FEQUIPAMENTO: TStringField
      FieldName = 'CFOS_FEQUIPAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FUNIDADE: TStringField
      FieldName = 'CFOS_FUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FMARCA: TStringField
      FieldName = 'CFOS_FMARCA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FMODELO: TStringField
      FieldName = 'CFOS_FMODELO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FGARANTIA: TStringField
      FieldName = 'CFOS_FGARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FNRPEDIDO: TStringField
      FieldName = 'CFOS_FNRPEDIDO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FCOD_FORNECEDOR: TStringField
      FieldName = 'CFOS_FCOD_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FFORNECEDOR: TStringField
      FieldName = 'CFOS_FFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FCOD_TECNICO: TStringField
      FieldName = 'CFOS_FCOD_TECNICO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FTECNICO: TStringField
      FieldName = 'CFOS_FTECNICO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FDTCADASTRO: TStringField
      FieldName = 'CFOS_FDTCADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FDTINSTALACAO: TStringField
      FieldName = 'CFOS_FDTINSTALACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FDTENTREGA: TStringField
      FieldName = 'CFOS_FDTENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FGRUPO_EQUIP: TStringField
      FieldName = 'CFOS_FGRUPO_EQUIP'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FGRUPO_PECAS_SERVICOS: TStringField
      FieldName = 'CFOS_FGRUPO_PECAS_SERVICOS'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_FDTAGENDAMENTO: TStringField
      FieldName = 'CFOS_FDTAGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryConfOSCFOS_DTA_CADASTRO: TDateField
      FieldName = 'CFOS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfOSCFOS_USER_ID: TIntegerField
      FieldName = 'CFOS_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryConfOSCFOS_DIAS_REAGENDAMENTO: TIntegerField
      FieldName = 'CFOS_DIAS_REAGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryConfOSCFOS_MENSAGEM_RODAPE: TIntegerField
      FieldName = 'CFOS_MENSAGEM_RODAPE'
    end
    object qryConfOSCFOS_USER_ID_TEC_OS: TIntegerField
      FieldName = 'CFOS_USER_ID_TEC_OS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspConfOS: TDataSetProvider
    DataSet = qryConfOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 88
  end
  object cdsConfOS: TClientDataSet
    Aggregates = <>
    Params = <
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
    ProviderName = 'dspConfOS'
    OnNewRecord = cdsConfOSNewRecord
    Left = 176
    Top = 136
    object cdsConfOSCFOS_ID: TIntegerField
      FieldName = 'CFOS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfOSCFOS_EMPR_ID: TIntegerField
      FieldName = 'CFOS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfOSCFOS_CSIS_EMPR_ID: TIntegerField
      FieldName = 'CFOS_CSIS_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfOSCFOS_FCOD_EQUIP: TStringField
      FieldName = 'CFOS_FCOD_EQUIP'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FEQUIPAMENTO: TStringField
      FieldName = 'CFOS_FEQUIPAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FUNIDADE: TStringField
      FieldName = 'CFOS_FUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FMARCA: TStringField
      FieldName = 'CFOS_FMARCA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FMODELO: TStringField
      FieldName = 'CFOS_FMODELO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FGARANTIA: TStringField
      FieldName = 'CFOS_FGARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FNRPEDIDO: TStringField
      FieldName = 'CFOS_FNRPEDIDO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FCOD_FORNECEDOR: TStringField
      FieldName = 'CFOS_FCOD_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FFORNECEDOR: TStringField
      FieldName = 'CFOS_FFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FCOD_TECNICO: TStringField
      FieldName = 'CFOS_FCOD_TECNICO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FTECNICO: TStringField
      FieldName = 'CFOS_FTECNICO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FDTCADASTRO: TStringField
      FieldName = 'CFOS_FDTCADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FDTINSTALACAO: TStringField
      FieldName = 'CFOS_FDTINSTALACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FDTENTREGA: TStringField
      FieldName = 'CFOS_FDTENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FGRUPO_EQUIP: TStringField
      FieldName = 'CFOS_FGRUPO_EQUIP'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FGRUPO_PECAS_SERVICOS: TStringField
      FieldName = 'CFOS_FGRUPO_PECAS_SERVICOS'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_FDTAGENDAMENTO: TStringField
      FieldName = 'CFOS_FDTAGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfOSCFOS_DTA_CADASTRO: TDateField
      FieldName = 'CFOS_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfOSCFOS_USER_ID: TIntegerField
      FieldName = 'CFOS_USER_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfOSCFOS_DIAS_REAGENDAMENTO: TIntegerField
      FieldName = 'CFOS_DIAS_REAGENDAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfOSCFOS_MENSAGEM_RODAPE: TIntegerField
      FieldName = 'CFOS_MENSAGEM_RODAPE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfOSCFOS_USER_ID_TEC_OS: TIntegerField
      FieldName = 'CFOS_USER_ID_TEC_OS'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsConfOS: TDataSource
    DataSet = cdsConfOS
    Left = 176
    Top = 184
  end
  object qryIRPF: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT IR.IRPF_EMPR_ID,'
      '       IR.IRPF_ALIMENTADOS,'
      '       IR.IRPF_RENDIMENTOS_RECEBIDOS,'
      '       IR.IRPF_CONTRIBUICAO_PREVIDENCIA,'
      '       IR.IRPF_IMPOSTO_RETIDO_FONTE,'
      '       IR.IRPF_13_SALARIO,'
      '       IR.IRPF_RENDIMENTOS_PESSOA_FISICA,'
      '       IR.IRPF_REDIMENTOS_EXTERIOR,'
      '       IR.IRPF_PREVIDENCIA_OFICIAL,'
      '       IR.IRPF_PENSAO_ALIMENTICIA,'
      '       IR.IRPF_LIVRO_CAIXA,'
      '       IR.IRPF_DARF_PAGO,'
      '       IR.IRPF_RENDIMENTOS_ISENTOS,'
      '       IR.IRPF_RENDIMENTOS_SUJEITOS_TRIB,'
      '       IR.IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ,'
      '       IR.IRPF_REND_TRIB_DEP_JUDICIAIS,'
      '       IR.IRPF_RENDIMENTOS_RECEB_ACUMUL,'
      '       IR.IRPF_IMPOSTO_PAGO_RETIDO,'
      '       IR.IRPF_PAGAMENTOS_EFETUADOS,'
      '       IR.IRPF_DOACOES_EFETUADAS,'
      '       IR.IRPF_BENS_DIREITOS,'
      '       IR.IRPF_DIVIDAS_ONUS,'
      '       IR.IRPF_DOACOES_PARTIDOS_POLITICOS,'
      '       IR.IRPF_DTA_CADASTRO,'
      '       IR.IRPF_USER_ID,'
      '       IR.IRPF_RENDIMENTOS_POUPANCA'
      '  FROM IRPF IR'
      ' WHERE IR.IRPF_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 272
    Top = 40
    object qryIRPFIRPF_EMPR_ID: TIntegerField
      FieldName = 'IRPF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryIRPFIRPF_ALIMENTADOS: TStringField
      FieldName = 'IRPF_ALIMENTADOS'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_RECEBIDOS: TStringField
      FieldName = 'IRPF_RENDIMENTOS_RECEBIDOS'
      Size = 250
    end
    object qryIRPFIRPF_CONTRIBUICAO_PREVIDENCIA: TStringField
      FieldName = 'IRPF_CONTRIBUICAO_PREVIDENCIA'
      Size = 250
    end
    object qryIRPFIRPF_IMPOSTO_RETIDO_FONTE: TStringField
      FieldName = 'IRPF_IMPOSTO_RETIDO_FONTE'
      Size = 250
    end
    object qryIRPFIRPF_13_SALARIO: TStringField
      FieldName = 'IRPF_13_SALARIO'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_PESSOA_FISICA: TStringField
      FieldName = 'IRPF_RENDIMENTOS_PESSOA_FISICA'
      Size = 250
    end
    object qryIRPFIRPF_REDIMENTOS_EXTERIOR: TStringField
      FieldName = 'IRPF_REDIMENTOS_EXTERIOR'
      Size = 250
    end
    object qryIRPFIRPF_PREVIDENCIA_OFICIAL: TStringField
      FieldName = 'IRPF_PREVIDENCIA_OFICIAL'
      Size = 250
    end
    object qryIRPFIRPF_PENSAO_ALIMENTICIA: TStringField
      FieldName = 'IRPF_PENSAO_ALIMENTICIA'
      Size = 250
    end
    object qryIRPFIRPF_LIVRO_CAIXA: TStringField
      FieldName = 'IRPF_LIVRO_CAIXA'
      Size = 250
    end
    object qryIRPFIRPF_DARF_PAGO: TStringField
      FieldName = 'IRPF_DARF_PAGO'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_ISENTOS: TStringField
      FieldName = 'IRPF_RENDIMENTOS_ISENTOS'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_SUJEITOS_TRIB: TStringField
      FieldName = 'IRPF_RENDIMENTOS_SUJEITOS_TRIB'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ: TStringField
      FieldName = 'IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_RECEB_ACUMUL: TStringField
      FieldName = 'IRPF_RENDIMENTOS_RECEB_ACUMUL'
      Size = 250
    end
    object qryIRPFIRPF_IMPOSTO_PAGO_RETIDO: TStringField
      FieldName = 'IRPF_IMPOSTO_PAGO_RETIDO'
      Size = 250
    end
    object qryIRPFIRPF_PAGAMENTOS_EFETUADOS: TStringField
      FieldName = 'IRPF_PAGAMENTOS_EFETUADOS'
      Size = 250
    end
    object qryIRPFIRPF_DOACOES_EFETUADAS: TStringField
      FieldName = 'IRPF_DOACOES_EFETUADAS'
      Size = 250
    end
    object qryIRPFIRPF_BENS_DIREITOS: TStringField
      FieldName = 'IRPF_BENS_DIREITOS'
      Size = 250
    end
    object qryIRPFIRPF_DIVIDAS_ONUS: TStringField
      FieldName = 'IRPF_DIVIDAS_ONUS'
      Size = 250
    end
    object qryIRPFIRPF_DOACOES_PARTIDOS_POLITICOS: TStringField
      FieldName = 'IRPF_DOACOES_PARTIDOS_POLITICOS'
      Size = 250
    end
    object qryIRPFIRPF_DTA_CADASTRO: TDateField
      FieldName = 'IRPF_DTA_CADASTRO'
      Required = True
    end
    object qryIRPFIRPF_USER_ID: TIntegerField
      FieldName = 'IRPF_USER_ID'
      Required = True
    end
    object qryIRPFIRPF_REND_TRIB_DEP_JUDICIAIS: TStringField
      FieldName = 'IRPF_REND_TRIB_DEP_JUDICIAIS'
      Size = 250
    end
    object qryIRPFIRPF_RENDIMENTOS_POUPANCA: TStringField
      FieldName = 'IRPF_RENDIMENTOS_POUPANCA'
      Size = 250
    end
  end
  object dspIRPF: TDataSetProvider
    DataSet = qryIRPF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 88
  end
  object cdsIRPF: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspIRPF'
    OnNewRecord = cdsIRPFNewRecord
    Left = 272
    Top = 136
    object cdsIRPFIRPF_EMPR_ID: TIntegerField
      FieldName = 'IRPF_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIRPFIRPF_ALIMENTADOS: TStringField
      FieldName = 'IRPF_ALIMENTADOS'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_RECEBIDOS: TStringField
      FieldName = 'IRPF_RENDIMENTOS_RECEBIDOS'
      Size = 250
    end
    object cdsIRPFIRPF_CONTRIBUICAO_PREVIDENCIA: TStringField
      FieldName = 'IRPF_CONTRIBUICAO_PREVIDENCIA'
      Size = 250
    end
    object cdsIRPFIRPF_IMPOSTO_RETIDO_FONTE: TStringField
      FieldName = 'IRPF_IMPOSTO_RETIDO_FONTE'
      Size = 250
    end
    object cdsIRPFIRPF_13_SALARIO: TStringField
      FieldName = 'IRPF_13_SALARIO'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_PESSOA_FISICA: TStringField
      FieldName = 'IRPF_RENDIMENTOS_PESSOA_FISICA'
      Size = 250
    end
    object cdsIRPFIRPF_REDIMENTOS_EXTERIOR: TStringField
      FieldName = 'IRPF_REDIMENTOS_EXTERIOR'
      Size = 250
    end
    object cdsIRPFIRPF_PREVIDENCIA_OFICIAL: TStringField
      FieldName = 'IRPF_PREVIDENCIA_OFICIAL'
      Size = 250
    end
    object cdsIRPFIRPF_PENSAO_ALIMENTICIA: TStringField
      FieldName = 'IRPF_PENSAO_ALIMENTICIA'
      Size = 250
    end
    object cdsIRPFIRPF_LIVRO_CAIXA: TStringField
      FieldName = 'IRPF_LIVRO_CAIXA'
      Size = 250
    end
    object cdsIRPFIRPF_DARF_PAGO: TStringField
      FieldName = 'IRPF_DARF_PAGO'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_ISENTOS: TStringField
      FieldName = 'IRPF_RENDIMENTOS_ISENTOS'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_SUJEITOS_TRIB: TStringField
      FieldName = 'IRPF_RENDIMENTOS_SUJEITOS_TRIB'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_TRIBUTAVEIS_PJ: TStringField
      FieldName = 'IRPF_RENDIMENTOS_TRIBUTAVEIS_PJ'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_RECEB_ACUMUL: TStringField
      FieldName = 'IRPF_RENDIMENTOS_RECEB_ACUMUL'
      Size = 250
    end
    object cdsIRPFIRPF_IMPOSTO_PAGO_RETIDO: TStringField
      FieldName = 'IRPF_IMPOSTO_PAGO_RETIDO'
      Size = 250
    end
    object cdsIRPFIRPF_PAGAMENTOS_EFETUADOS: TStringField
      FieldName = 'IRPF_PAGAMENTOS_EFETUADOS'
      Size = 250
    end
    object cdsIRPFIRPF_DOACOES_EFETUADAS: TStringField
      FieldName = 'IRPF_DOACOES_EFETUADAS'
      Size = 250
    end
    object cdsIRPFIRPF_BENS_DIREITOS: TStringField
      FieldName = 'IRPF_BENS_DIREITOS'
      Size = 250
    end
    object cdsIRPFIRPF_DIVIDAS_ONUS: TStringField
      FieldName = 'IRPF_DIVIDAS_ONUS'
      Size = 250
    end
    object cdsIRPFIRPF_DOACOES_PARTIDOS_POLITICOS: TStringField
      FieldName = 'IRPF_DOACOES_PARTIDOS_POLITICOS'
      Size = 250
    end
    object cdsIRPFIRPF_DTA_CADASTRO: TDateField
      FieldName = 'IRPF_DTA_CADASTRO'
      Required = True
    end
    object cdsIRPFIRPF_USER_ID: TIntegerField
      FieldName = 'IRPF_USER_ID'
      Required = True
    end
    object cdsIRPFIRPF_REND_TRIB_DEP_JUDICIAIS: TStringField
      FieldName = 'IRPF_REND_TRIB_DEP_JUDICIAIS'
      Size = 250
    end
    object cdsIRPFIRPF_RENDIMENTOS_POUPANCA: TStringField
      FieldName = 'IRPF_RENDIMENTOS_POUPANCA'
      Size = 250
    end
  end
  object dsIRPF: TDataSource
    DataSet = cdsIRPF
    Left = 272
    Top = 184
  end
  object qryAgendaRetornos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CF.*,'
      '       PR.PROD_DESCRICAO'
      '  FROM CONF_AGENDA_RETORNO CF'
      '  JOIN PRODUTOS            PR'
      '    ON PR.PROD_ID          = CF.CFAR_PROD_ID'
      '   AND PR.PROD_EMPR_ID     = CF.CFAR_PROD_EMPR_ID'
      ' WHERE CF.CFAR_EMPR_ID     = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 368
    Top = 40
    object qryAgendaRetornosCFAR_EMPR_ID: TIntegerField
      FieldName = 'CFAR_EMPR_ID'
      Required = True
    end
    object qryAgendaRetornosCFAR_PROD_ID: TIntegerField
      FieldName = 'CFAR_PROD_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgendaRetornosCFAR_PROD_EMPR_ID: TIntegerField
      FieldName = 'CFAR_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgendaRetornosCFAR_DIA_RETORNO: TIntegerField
      FieldName = 'CFAR_DIA_RETORNO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgendaRetornosCFAR_DTA_CADASTRO: TDateField
      FieldName = 'CFAR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgendaRetornosCFAR_USER_ID: TIntegerField
      FieldName = 'CFAR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgendaRetornosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dspAgendaRetornos: TDataSetProvider
    DataSet = qryAgendaRetornos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 368
    Top = 88
  end
  object cdsAgendaRetornos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspIRPF'
    OnNewRecord = cdsAgendaRetornosNewRecord
    Left = 368
    Top = 136
    object cdsAgendaRetornosCFAR_PROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'CFAR_PROD_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAgendaRetornosPROD_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PROD_DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsAgendaRetornosCFAR_DIA_RETORNO: TIntegerField
      DisplayLabel = 'Dias p/ Retorno'
      FieldName = 'CFAR_DIA_RETORNO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAgendaRetornosCFAR_EMPR_ID: TIntegerField
      FieldName = 'CFAR_EMPR_ID'
      Required = True
      Visible = False
    end
    object cdsAgendaRetornosCFAR_PROD_EMPR_ID: TIntegerField
      FieldName = 'CFAR_PROD_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsAgendaRetornosCFAR_DTA_CADASTRO: TDateField
      FieldName = 'CFAR_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsAgendaRetornosCFAR_USER_ID: TIntegerField
      FieldName = 'CFAR_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dsAgendaRetornos: TDataSource
    DataSet = cdsAgendaRetornos
    Left = 368
    Top = 184
  end
end
