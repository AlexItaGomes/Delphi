inherited dmVendaOrcamento: TdmVendaOrcamento
  OldCreateOrder = True
  Height = 375
  Width = 782
  object qryPedido: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT PV.PEDV_ID,'
      '       PV.PEDV_EMPR_ID,'
      '       PV.PEDV_CLIE_ID,'
      '       PV.PEDV_CLIE_EMPR_ID,'
      '       PV.PEDV_TIPO_PEDIDO,'
      '       CASE PV.PEDV_TIPO_PEDIDO'
      '            WHEN '#39'OV'#39' THEN '#39'Or'#231'amento'#39
      '            WHEN '#39'PV'#39' THEN '#39'Pedido Venda'#39
      '       END AS TIPO_PEDIDO,'
      '       PV.PEDV_TPRC_ID,'
      '       PV.PEDV_TPRC_EMPR_ID,'
      '       PV.PEDV_VLR_PEDIDO,'
      '       PV.PEDV_VLR_DESCONTO,'
      '       PV.PEDV_VLR_FRETE,'
      '       PV.PEDV_VLR_LIQUIDO,'
      '       PV.PEDV_DTA_ENTREGA,'
      '       PV.PEDV_STATUS,'
      '       CASE PV.PEDV_STATUS'
      '            WHEN 0 THEN '#39'Aberto'#39
      '            WHEN 1 THEN '#39'Fechado'#39
      '            WHEN 2 THEN '#39'Cancelado'#39
      '       END AS STATUS,'
      '       PV.PEDV_OBSERVACAO,'
      '       PV.PEDV_INFORMACOES,'
      '       PV.PEDV_USER_ID_ABERTURA,'
      '       PV.PEDV_USER_ID_VENDEDOR_INTERNO,'
      '       PV.PEDV_USER_ID_VENDEDOR_EXTERNO,'
      '       PV.PEDV_USER_ID_CANCELAMENTO,'
      '       PV.PEDV_DTA_CANCELAMENTO,'
      '       PV.PEDV_MOTIVO_CANCELAMENTO,'
      '       PV.PEDV_ENTREGA_FUTURA,'
      '       PV.PEDV_NOME_REFERENCIA,'
      '       PV.PEDV_DTA_PAGTO,'
      '       PV.PEDV_DTA_CADASTRO,'
      '       PV.PEDV_USER_ID,'
      '       CL.CLIE_RAZAO_SOCIAL,'
      '       CL.CLIE_FANTASIA,'
      '       CL.CLIE_CNPJ_CPF,'
      '       TP.TPRC_DESCRICAO'
      '  FROM PEDIDO_VENDA PV'
      ' INNER JOIN CLIENTES CL'
      '    ON (CL.CLIE_ID     = PV.PEDV_CLIE_ID'
      '   AND CL.CLIE_EMPR_ID = PV.PEDV_CLIE_EMPR_ID)'
      ' INNER JOIN TABELA_PRECO TP'
      '    ON (TP.TPRC_ID     = PV.PEDV_TPRC_ID'
      '   AND TP.TPRC_EMPR_ID = PV.PEDV_TPRC_EMPR_ID)'
      ' WHERE 1 = 0')
    SQLConnection = dmConexao.dbConexao
    Left = 40
    Top = 24
    object qryPedidoPEDV_ID: TIntegerField
      FieldName = 'PEDV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoPEDV_EMPR_ID: TIntegerField
      FieldName = 'PEDV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoPEDV_CLIE_ID: TIntegerField
      FieldName = 'PEDV_CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoPEDV_CLIE_EMPR_ID: TIntegerField
      FieldName = 'PEDV_CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoPEDV_TIPO_PEDIDO: TStringField
      FieldName = 'PEDV_TIPO_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryPedidoPEDV_TPRC_ID: TIntegerField
      FieldName = 'PEDV_TPRC_ID'
      Required = True
    end
    object qryPedidoPEDV_TPRC_EMPR_ID: TIntegerField
      FieldName = 'PEDV_TPRC_EMPR_ID'
      Required = True
    end
    object qryPedidoPEDV_VLR_PEDIDO: TFMTBCDField
      FieldName = 'PEDV_VLR_PEDIDO'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryPedidoPEDV_VLR_DESCONTO: TFMTBCDField
      FieldName = 'PEDV_VLR_DESCONTO'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryPedidoPEDV_VLR_FRETE: TFMTBCDField
      FieldName = 'PEDV_VLR_FRETE'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryPedidoPEDV_VLR_LIQUIDO: TFMTBCDField
      FieldName = 'PEDV_VLR_LIQUIDO'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryPedidoPEDV_DTA_ENTREGA: TDateField
      FieldName = 'PEDV_DTA_ENTREGA'
      Required = True
    end
    object qryPedidoPEDV_STATUS: TIntegerField
      FieldName = 'PEDV_STATUS'
      Required = True
    end
    object qryPedidoPEDV_OBSERVACAO: TBlobField
      FieldName = 'PEDV_OBSERVACAO'
      Size = 1
    end
    object qryPedidoPEDV_INFORMACOES: TBlobField
      FieldName = 'PEDV_INFORMACOES'
      Size = 1
    end
    object qryPedidoPEDV_USER_ID_ABERTURA: TIntegerField
      FieldName = 'PEDV_USER_ID_ABERTURA'
      Required = True
    end
    object qryPedidoPEDV_USER_ID_VENDEDOR_INTERNO: TIntegerField
      FieldName = 'PEDV_USER_ID_VENDEDOR_INTERNO'
      Required = True
    end
    object qryPedidoPEDV_USER_ID_VENDEDOR_EXTERNO: TIntegerField
      FieldName = 'PEDV_USER_ID_VENDEDOR_EXTERNO'
      Required = True
    end
    object qryPedidoPEDV_USER_ID_CANCELAMENTO: TIntegerField
      FieldName = 'PEDV_USER_ID_CANCELAMENTO'
    end
    object qryPedidoPEDV_DTA_CANCELAMENTO: TDateField
      FieldName = 'PEDV_DTA_CANCELAMENTO'
    end
    object qryPedidoPEDV_MOTIVO_CANCELAMENTO: TBlobField
      FieldName = 'PEDV_MOTIVO_CANCELAMENTO'
      Size = 1
    end
    object qryPedidoPEDV_ENTREGA_FUTURA: TIntegerField
      FieldName = 'PEDV_ENTREGA_FUTURA'
      Required = True
    end
    object qryPedidoPEDV_NOME_REFERENCIA: TStringField
      FieldName = 'PEDV_NOME_REFERENCIA'
      Size = 50
    end
    object qryPedidoPEDV_DTA_PAGTO: TDateField
      FieldName = 'PEDV_DTA_PAGTO'
    end
    object qryPedidoPEDV_DTA_CADASTRO: TDateField
      FieldName = 'PEDV_DTA_CADASTRO'
      Required = True
    end
    object qryPedidoPEDV_USER_ID: TIntegerField
      FieldName = 'PEDV_USER_ID'
      Required = True
    end
    object qryPedidoCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 150
    end
    object qryPedidoCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object qryPedidoCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = []
      Size = 18
    end
    object qryPedidoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qryPedidoTIPO_PEDIDO: TStringField
      FieldName = 'TIPO_PEDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 12
    end
    object qryPedidoSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = qryPedido
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 72
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    Left = 40
    Top = 120
    object cdsPedidoPEDV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Or'#231'amento'
      FieldName = 'PEDV_ID'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object cdsPedidoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cdsPedidoTIPO_PEDIDO: TStringField
      DisplayLabel = 'Tipo Pedido'
      FieldName = 'TIPO_PEDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 12
    end
    object cdsPedidoPEDV_TIPO_PEDIDO: TStringField
      DisplayLabel = 'Tipo Pedido'
      FieldName = 'PEDV_TIPO_PEDIDO'
      ProviderFlags = [pfInKey]
      Required = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsPedidoPEDV_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'PEDV_CLIE_ID'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object cdsPedidoCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 35
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 150
    end
    object cdsPedidoCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      DisplayWidth = 35
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = []
      Size = 150
    end
    object cdsPedidoCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 35
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = []
      Size = 18
    end
    object cdsPedidoPEDV_NOME_REFERENCIA: TStringField
      DisplayLabel = 'Identifica'#231#227'o'
      DisplayWidth = 35
      FieldName = 'PEDV_NOME_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPedidoPEDV_TPRC_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Tab. Pre'#231'o'
      FieldName = 'PEDV_TPRC_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsPedidoPEDV_VLR_PEDIDO: TFMTBCDField
      DisplayLabel = 'Vlr. Pedido'
      FieldName = 'PEDV_VLR_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPedidoPEDV_VLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr. Desconto'
      FieldName = 'PEDV_VLR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPedidoPEDV_VLR_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'PEDV_VLR_FRETE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPedidoPEDV_VLR_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Vlr. Liquido'
      FieldName = 'PEDV_VLR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPedidoPEDV_DTA_ENTREGA: TDateField
      DisplayLabel = 'Dt. Entrega'
      FieldName = 'PEDV_DTA_ENTREGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidoPEDV_CLIE_EMPR_ID: TIntegerField
      FieldName = 'PEDV_CLIE_EMPR_ID'
      ProviderFlags = [pfInKey]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_EMPR_ID: TIntegerField
      FieldName = 'PEDV_EMPR_ID'
      ProviderFlags = [pfInKey]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_TPRC_EMPR_ID: TIntegerField
      FieldName = 'PEDV_TPRC_EMPR_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_STATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'PEDV_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_OBSERVACAO: TBlobField
      FieldName = 'PEDV_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsPedidoPEDV_INFORMACOES: TBlobField
      FieldName = 'PEDV_INFORMACOES'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsPedidoPEDV_USER_ID_ABERTURA: TIntegerField
      FieldName = 'PEDV_USER_ID_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_USER_ID_VENDEDOR_INTERNO: TIntegerField
      FieldName = 'PEDV_USER_ID_VENDEDOR_INTERNO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_USER_ID_VENDEDOR_EXTERNO: TIntegerField
      FieldName = 'PEDV_USER_ID_VENDEDOR_EXTERNO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_USER_ID_CANCELAMENTO: TIntegerField
      FieldName = 'PEDV_USER_ID_CANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPedidoPEDV_DTA_CANCELAMENTO: TDateField
      FieldName = 'PEDV_DTA_CANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsPedidoPEDV_MOTIVO_CANCELAMENTO: TBlobField
      FieldName = 'PEDV_MOTIVO_CANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsPedidoPEDV_ENTREGA_FUTURA: TIntegerField
      FieldName = 'PEDV_ENTREGA_FUTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_DTA_PAGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'PEDV_DTA_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidoPEDV_USER_ID: TIntegerField
      FieldName = 'PEDV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsPedidoPEDV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'PEDV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 40
    Top = 168
  end
end
