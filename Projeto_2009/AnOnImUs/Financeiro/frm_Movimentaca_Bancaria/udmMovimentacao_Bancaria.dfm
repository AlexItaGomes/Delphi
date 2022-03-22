object dmMovimentacao_Bancaria: TdmMovimentacao_Bancaria
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 343
  Width = 771
  object qryMovimentacao_Bancaria: TSQLQuery
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
      '      CM.CBMV_GENE_EMPR_ID_ORIG,'
      '      CM.CBMV_GENE_TGEN_ID_ORIG,'
      '      CM.CBMV_GENE_ID_ORIG,'
      '      CM.CBMV_CAMPO1_EMPR_ID_ORIG,'
      '      CM.CBMV_CAMPO2_TGEN_ID_ORIG,'
      '      CM.CBMV_CAMPO3_ID_ORIG,'
      '      CM.CBMV_VALOR_MOV,'
      '      CM.CBMV_SALDO_DISP,'
      '      CM.CBMV_NR_DOCUMENTO,'
      '      CM.CBMV_DTA_CADASTRO,'
      '      CM.CBMV_USER_ID,'
      '      TP.GENE_DESCR MOVIMENTACAO,'
      '      TP.GENE_PAR1  TIPO_MOV,'
      '      TP.GENE_PAR2  DEDUTIVEL,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1  COD_BANCO,'
      '      CB.CBCO_SALDO_ATUAL,'
      '      CB.CBCO_LIMITE'
      'FROM  CONTAS_BANCARIAS_MOV CM'
      'INNER JOIN CONTAS_BANCARIAS CB'
      'ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID'
      'AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)'
      'INNER JOIN GENERICA TP'
      'ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV'
      'AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV'
      'AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      'WHERE CM.CBMV_EMPR_ID      = :EMPR_ID'
      'AND   CM.CBMV_CBCO_ID      = :CBCO_ID'
      'AND   CM.CBMV_CBCO_EMPR_ID = :EMPR_ID'
      'ORDER BY CM.CBMV_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 248
    Top = 48
    object qryMovimentacao_BancariaCBMV_ID: TIntegerField
      FieldName = 'CBMV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField
      FieldName = 'CBMV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField
      FieldName = 'CBMV_CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CBMV_CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField
      FieldName = 'CBMV_VALOR_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField
      FieldName = 'CBMV_SALDO_DISP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField
      FieldName = 'CBMV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_USER_ID: TIntegerField
      FieldName = 'CBMV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaMOVIMENTACAO: TStringField
      DisplayLabel = 'Movimenta'#231#227'o'
      FieldName = 'MOVIMENTACAO'
      ProviderFlags = []
      Size = 50
    end
    object qryMovimentacao_BancariaTIPO_MOV: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MOV'
      ProviderFlags = []
      Size = 50
    end
    object qryMovimentacao_BancariaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryMovimentacao_BancariaCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryMovimentacao_BancariaDEDUTIVEL: TStringField
      FieldName = 'DEDUTIVEL'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object qryMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      Precision = 20
      Size = 2
    end
    object qryMovimentacao_BancariaCBMV_GENE_EMPR_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_GENE_TGEN_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_GENE_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_CAMPO1_EMPR_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO1_EMPR_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_CAMPO2_TGEN_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO2_TGEN_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_CAMPO3_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO3_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMovimentacao_BancariaCBMV_NR_DOCUMENTO: TStringField
      FieldName = 'CBMV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
  end
  object dspMovimentacao_Bancaria: TDataSetProvider
    DataSet = qryMovimentacao_Bancaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 248
    Top = 96
  end
  object cdsMovimentacao_Bancaria: TClientDataSet
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
    ProviderName = 'dspMovimentacao_Bancaria'
    BeforeDelete = cdsMovimentacao_BancariaBeforeDelete
    OnNewRecord = cdsMovimentacao_BancariaNewRecord
    OnReconcileError = cdsMovimentacao_BancariaReconcileError
    Left = 248
    Top = 144
    object cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_ID_ORIG: TIntegerField
      FieldName = 'CBMV_GENE_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CAMPO1_EMPR_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO1_EMPR_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CAMPO2_TGEN_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO2_TGEN_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CAMPO3_ID_ORIG: TIntegerField
      FieldName = 'CBMV_CAMPO3_ID_ORIG'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      DisplayWidth = 7
      FieldName = 'CBMV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMovimentacao_BancariaMOVIMENTACAO: TStringField
      DisplayLabel = 'Movimenta'#231#227'o'
      DisplayWidth = 27
      FieldName = 'MOVIMENTACAO'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaTIPO_MOV: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'TIPO_MOV'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaDEDUTIVEL: TStringField
      DisplayLabel = 'Dedutivel'
      DisplayWidth = 5
      FieldName = 'DEDUTIVEL'
      ProviderFlags = []
      Size = 50
    end
    object cdsMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField
      DisplayLabel = 'Vlr. Mov.'
      DisplayWidth = 10
      FieldName = 'CBMV_VALOR_MOV'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField
      DisplayLabel = 'Vlr. Atual'
      DisplayWidth = 10
      FieldName = 'CBMV_SALDO_DISP'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Vlr. Atual'
      DisplayWidth = 10
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Movimento'
      FieldName = 'CBMV_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentacao_BancariaCBMV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'CBMV_NR_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField
      FieldName = 'CBMV_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField
      FieldName = 'CBMV_CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CBMV_CBCO_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_EMPR_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_TGEN_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField
      FieldName = 'CBMV_GENE_ID_TIPO_MOV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaCBMV_USER_ID: TIntegerField
      FieldName = 'CBMV_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMovimentacao_BancariaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsMovimentacao_BancariaCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Visible = False
      Size = 50
    end
    object cdsMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField
      FieldName = 'CBCO_LIMITE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
  end
  object dsMovimentacao_Bancaria: TDataSource
    DataSet = cdsMovimentacao_Bancaria
    Left = 248
    Top = 192
  end
  object qryContas_Bancarias: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
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
      '      CB.CBCO_DTA_ABERTURA,'
      '      CB.CBCO_DTA_CADASTRO,'
      '      CB.CBCO_USER_ID,'
      '      BC.GENE_DESCR BANCO_DESCR,'
      '      BC.GENE_PAR1  COD_BANCO'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      'WHERE CB.CBCO_EMPR_ID = :EMPR_ID'
      'AND      CB.CBCO_ATIVO = 1')
    SQLConnection = dmConexao.dbConexao
    Left = 104
    Top = 48
    object qryContas_BancariasCBCO_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'CBCO_ATIVO'
    end
    object qryContas_BancariasCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object qryContas_BancariasCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object qryContas_BancariasCBCO_DTA_ABERTURA: TDateField
      FieldName = 'CBCO_DTA_ABERTURA'
    end
  end
  object dspContas_Bancarias: TDataSetProvider
    DataSet = qryContas_Bancarias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 96
  end
  object cdsContas_Bancarias: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas_Bancarias'
    Left = 104
    Top = 144
    object cdsContas_BancariasCBCO_ATIVO: TIntegerField
      DisplayLabel = 'Status'
      DisplayWidth = 7
      FieldName = 'CBCO_ATIVO'
    end
    object cdsContas_BancariasCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'CBCO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContas_BancariasBANCO_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO_DESCR'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_BancariasCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 150
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object cdsContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField
      DisplayLabel = 'Vlr. Inicial'
      DisplayWidth = 20
      FieldName = 'CBCO_VALOR_INICIAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 20
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsContas_BancariasCBCO_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 2
      FieldName = 'CBCO_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContas_BancariasCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Bco'
      DisplayWidth = 35
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      Size = 50
    end
    object cdsContas_BancariasCBCO_AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 35
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsContas_BancariasCBCO_CONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 35
      FieldName = 'CBCO_CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsContas_BancariasCBCO_GERENTE: TStringField
      DisplayLabel = 'Gerente'
      DisplayWidth = 100
      FieldName = 'CBCO_GERENTE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsContas_BancariasCBCO_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CBCO_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_BancariasCBCO_GENE_ID_BCO: TIntegerField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'CBCO_GENE_ID_BCO'
      ProviderFlags = [pfInUpdate]
      Visible = False
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
      FieldName = 'CBCO_DTA_ABERTURA'
      Visible = False
    end
  end
  object dsContas_Bancarias: TDataSource
    DataSet = cdsContas_Bancarias
    OnDataChange = dsContas_BancariasDataChange
    Left = 104
    Top = 192
  end
  object qryPesq_Conta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CB.CBCO_ID,'
      '      CB.CBCO_DESCRICAO,'
      '      BC.GENE_DESCR BANCO,'
      '      BC.GENE_PAR1 COD_BANCO,'
      '      COALESCE(CB.CBCO_SALDO_ATUAL,0) SALDO_ATUAL,'
      '      CB.CBCO_LIMITE'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO'
      'AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO'
      'AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)'
      'WHERE CB.CBCO_EMPR_ID = :EMPR_ID'
      'AND   CB.CBCO_ATIVO   = 1')
    SQLConnection = dmConexao.dbConexao
    Left = 440
    Top = 48
  end
  object dspPesq_Conta: TDataSetProvider
    DataSet = qryPesq_Conta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 440
    Top = 96
  end
  object cdsPesq_Conta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesq_Conta'
    Left = 440
    Top = 144
    object cdsPesq_ContaCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
    end
    object cdsPesq_ContaCOD_BANCO: TStringField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'COD_BANCO'
      Size = 50
    end
    object cdsPesq_ContaBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 50
    end
    object cdsPesq_ContaCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object cdsPesq_ContaSALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
    object cdsPesq_ContaCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'CBCO_LIMITE'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 2
    end
  end
  object dsPesq_Conta: TDataSource
    DataSet = cdsPesq_Conta
    Left = 440
    Top = 192
  end
  object qryPesqTipoMov: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1,'
      '      GENE_PAR2'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 506'
      'AND   GENE_ID      < 1000'
      'ORDER BY GENE_DESCR, GENE_PAR1')
    SQLConnection = dmConexao.dbConexao
    Left = 568
    Top = 48
  end
  object dspPesqTipoMov: TDataSetProvider
    DataSet = qryPesqTipoMov
    Left = 568
    Top = 96
  end
  object cdsPesqTipoMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipoMov'
    Left = 568
    Top = 144
    object cdsPesqTipoMovGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      Required = True
    end
    object cdsPesqTipoMovGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de Movimenta'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object cdsPesqTipoMovGENE_PAR1: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
    object cdsPesqTipoMovGENE_PAR2: TStringField
      DisplayLabel = 'Dedut'#237'vel'
      FieldName = 'GENE_PAR2'
      Size = 250
    end
  end
end
