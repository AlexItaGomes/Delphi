inherited dmTipoAgendamento: TdmTipoAgendamento
  OldCreateOrder = True
  Height = 328
  Width = 669
  object dspTipoAgendamento: TDataSetProvider
    DataSet = qryTipoAgendamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsTipoAgendamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspTipoAgendamento'
    BeforeDelete = cdsTipoAgendamentoBeforeDelete
    OnNewRecord = cdsTipoAgendamentoNewRecord
    OnReconcileError = cdsTipoAgendamentoReconcileError
    Left = 72
    Top = 144
    object cdsTipoAgendamentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsTipoAgendamentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsTipoAgendamentoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTipoAgendamentoGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de Agendamento'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsTipoAgendamentoGENE_NUMBER1: TIntegerField
      DisplayLabel = 'Dias p/ Atendimento'
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipoAgendamentoGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsTipoAgendamentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dsTipoAgendamento: TDataSource
    DataSet = cdsTipoAgendamento
    Left = 72
    Top = 192
  end
  object qryTipoAgendamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_NUMBER1,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_USER_ID'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 518'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryTipoAgendamentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryTipoAgendamentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryTipoAgendamentoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTipoAgendamentoGENE_DESCR: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryTipoAgendamentoGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryTipoAgendamentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qryTipoAgendamentoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
    end
  end
end
