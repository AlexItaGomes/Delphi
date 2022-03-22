object dmContas_Bancarias: TdmContas_Bancarias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 796
  Width = 1056
  object qryContas_Bancarias: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      CB.CBCO_ID,'
      '      CB.CBCO_EMPR_ID,'
      '      CB.CBCO_DESCRICAO,'
      '      CB.CBCO_GENE_EMPR_ID_BCO,'
      '      CB.CBCO_GENE_TGEN_ID_BCO,'
      '      CB.CBCO_GENE_ID_BCO,'
      '      CB.CBCO_AGENCIA,'
      '      CB.CBCO_CONTA,'
      '      CB.CBCO_TIPO,'
      '      CB.CBCO_GERENTE,'
      '      CB.CBCO_VALOR_INICIAL,'
      '      CB.CBCO_SALDO_ATUAL,'
      '      CB.CBCO_ATIVO,'
      
        '      COALESCE(CB.CBCO_CONSIDERAR_SALDOS,1) AS CBCO_CONSIDERAR_S' +
        'ALDOS,'
      '      CB.CBCO_DTA_CADASTRO,'
      '      CB.CBCO_USER_ID,'
      '      CB.CBCO_LIMITE,'
      '      CB.CBCO_DIA_LIMITE,'
      '      CB.CBCO_DTA_ABERTURA,'
      '      BC.GENE_DESCR BANCO_DESCR,'
      '      BC.GENE_PAR1  COD_BANCO,'
      
        '      COALESCE(CB.CBCO_PARTICIPA_METAS,0) AS CBCO_PARTICIPA_META' +
        'S,'
      '      COALESCE(CB.CBCO_MULTI_EMPRESA,0) AS CBCO_MULTI_EMPRESA'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)')
    SQLConnection = dmConexao.dbConexao
    Left = 96
    Top = 40
    object qryContas_BancariasCBCO_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'CBCO_ATIVO'
    end
    object qryContas_BancariasCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryContas_BancariasCBCO_DESCRICAO: TStringField
      FieldName = 'CBCO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryContas_BancariasCBCO_GENE_ID_BCO: TIntegerField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'CBCO_GENE_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_BancariasBANCO_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_DESCR'
      ProviderFlags = []
      Size = 50
    end
    object qryContas_BancariasCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Banc'#225'rio'
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Size = 50
    end
    object qryContas_BancariasCBCO_AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryContas_BancariasCBCO_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CBCO_CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryContas_BancariasCBCO_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CBCO_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField
      DisplayLabel = 'Vlr. Inicial'
      FieldName = 'CBCO_VALOR_INICIAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Vlr. Atual'
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object qryContas_BancariasCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object qryContas_BancariasCBCO_GERENTE: TStringField
      DisplayLabel = 'Gerente'
      FieldName = 'CBCO_GERENTE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryContas_BancariasCBCO_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CBCO_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_BancariasCBCO_EMPR_ID: TIntegerField
      FieldName = 'CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_EMPR_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_TGEN_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_BancariasCBCO_USER_ID: TIntegerField
      FieldName = 'CBCO_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_BancariasCBCO_DIA_LIMITE: TIntegerField
      FieldName = 'CBCO_DIA_LIMITE'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_BancariasCBCO_DTA_ABERTURA: TDateField
      FieldName = 'CBCO_DTA_ABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object qryContas_BancariasCBCO_CONSIDERAR_SALDOS: TIntegerField
      FieldName = 'CBCO_CONSIDERAR_SALDOS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryContas_BancariasCBCO_PARTICIPA_METAS: TIntegerField
      FieldName = 'CBCO_PARTICIPA_METAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryContas_BancariasCBCO_MULTI_EMPRESA: TIntegerField
      FieldName = 'CBCO_MULTI_EMPRESA'
    end
  end
  object dspContas_Bancarias: TDataSetProvider
    DataSet = qryContas_Bancarias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 88
  end
  object cdsContas_Bancarias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_Bancarias'
    BeforeDelete = cdsContas_BancariasBeforeDelete
    OnNewRecord = cdsContas_BancariasNewRecord
    OnReconcileError = cdsContas_BancariasReconcileError
    Left = 96
    Top = 136
    object cdsContas_BancariasCBCO_PARTICIPA_METAS: TIntegerField
      FieldName = 'CBCO_PARTICIPA_METAS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasCBCO_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'CBCO_ATIVO'
    end
    object cdsContas_BancariasCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContas_BancariasCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsContas_BancariasCBCO_DIA_LIMITE: TIntegerField
      DisplayLabel = 'Dia Limite'
      FieldName = 'CBCO_DIA_LIMITE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_BancariasCBCO_GENE_ID_BCO: TIntegerField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'CBCO_GENE_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasBANCO_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_DESCR'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_BancariasCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Bco'
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_BancariasCBCO_AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsContas_BancariasCBCO_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CBCO_CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsContas_BancariasCBCO_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CBCO_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField
      DisplayLabel = 'Vlr. Inicial'
      FieldName = 'CBCO_VALOR_INICIAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Vlr. Atual'
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_GERENTE: TStringField
      DisplayLabel = 'Gerente'
      FieldName = 'CBCO_GERENTE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsContas_BancariasCBCO_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CBCO_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_BancariasCBCO_EMPR_ID: TIntegerField
      FieldName = 'CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_EMPR_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField
      FieldName = 'CBCO_GENE_TGEN_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasCBCO_USER_ID: TIntegerField
      FieldName = 'CBCO_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasCBCO_DTA_ABERTURA: TDateField
      DisplayLabel = 'Dt. Abertura'
      FieldName = 'CBCO_DTA_ABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_BancariasCBCO_CONSIDERAR_SALDOS: TIntegerField
      FieldName = 'CBCO_CONSIDERAR_SALDOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsContas_BancariasCBCO_MULTI_EMPRESA: TIntegerField
      FieldName = 'CBCO_MULTI_EMPRESA'
      Visible = False
    end
  end
  object dsContas_Bancarias: TDataSource
    DataSet = cdsContas_Bancarias
    OnDataChange = dsContas_BancariasDataChange
    Left = 96
    Top = 184
  end
  object dspPesq_Bancos: TDataSetProvider
    DataSet = qryPesq_Bancos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 432
    Top = 88
  end
  object cdsPesq_Bancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Bancos'
    OnNewRecord = cdsContas_BancariasNewRecord
    OnReconcileError = cdsContas_BancariasReconcileError
    Left = 432
    Top = 136
    object cdsPesq_BancosGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesq_BancosGENE_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesq_BancosGENE_PAR1: TStringField
      DisplayLabel = 'C'#243'd. Banc'#225'rio'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object dsPesq_Bancos: TDataSource
    DataSet = cdsPesq_Bancos
    Left = 432
    Top = 184
  end
  object qryContas_Bancarias_Mov: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CBCO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CM.CBMV_ID,'
      '      CM.CBMV_EMPR_ID,'
      '      CM.CBMV_CBCO_ID,'
      '      CM.CBMV_CBCO_EMPR_ID,'
      '      CM.CBMV_GENE_EMPR_ID_TIPO_MOV,'
      '      CM.CBMV_GENE_TGEN_ID_TIPO_MOV,'
      '      CM.CBMV_GENE_ID_TIPO_MOV,'
      '      CM.CBMV_VALOR_MOV,'
      '      CM.CBMV_SALDO_DISP,'
      '      CM.CBMV_DTA_CADASTRO,'
      '      CM.CBMV_USER_ID,'
      '      TP.GENE_DESCR,'
      '      TP.GENE_PAR1'
      'FROM  CONTAS_BANCARIAS_MOV CM'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      'AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      'AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      'WHERE CM.CBMV_EMPR_ID      = :EMPR_ID'
      'AND   CM.CBMV_CBCO_ID      = :CBCO_ID'
      'AND   CM.CBMV_CBCO_EMPR_ID = :EMPR_ID'
      'ORDER BY CM.CBMV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 264
    Top = 40
  end
  object dspContas_Bancarias_Mov: TDataSetProvider
    DataSet = qryContas_Bancarias_Mov
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 264
    Top = 88
  end
  object cdsContas_Bancarias_Mov: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CBCO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas_Bancarias_Mov'
    OnNewRecord = cdsContas_BancariasNewRecord
    OnReconcileError = cdsContas_BancariasReconcileError
    Left = 264
    Top = 136
    object cdsContas_Bancarias_MovCBMV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      DisplayWidth = 7
      FieldName = 'CBMV_ID'
    end
    object cdsContas_Bancarias_MovGENE_DESCR: TStringField
      DisplayLabel = 'Movimenta'#231#227'o'
      DisplayWidth = 30
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsContas_Bancarias_MovGENE_PAR1: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'GENE_PAR1'
      Size = 50
    end
    object cdsContas_Bancarias_MovCBMV_VALOR_MOV: TFMTBCDField
      DisplayLabel = 'Vlr. Mov.'
      DisplayWidth = 10
      FieldName = 'CBMV_VALOR_MOV'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_Bancarias_MovCBMV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Mov.'
      DisplayWidth = 10
      FieldName = 'CBMV_DTA_CADASTRO'
    end
    object cdsContas_Bancarias_MovCBMV_EMPR_ID: TIntegerField
      FieldName = 'CBMV_EMPR_ID'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_CBCO_ID: TIntegerField
      FieldName = 'CBMV_CBCO_ID'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CBMV_CBCO_EMPR_ID'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_TIPO_MOV'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_TIPO_MOV'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_GENE_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_ID_TIPO_MOV'
      Visible = False
    end
    object cdsContas_Bancarias_MovCBMV_SALDO_DISP: TFMTBCDField
      FieldName = 'CBMV_SALDO_DISP'
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_Bancarias_MovCBMV_USER_ID: TIntegerField
      FieldName = 'CBMV_USER_ID'
      Visible = False
    end
  end
  object dsContas_Bancarias_Mov: TDataSource
    DataSet = cdsContas_Bancarias_Mov
    Left = 264
    Top = 184
  end
  object qryPesq_Bancos: TSQLQuery
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
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 432
    Top = 40
  end
end
