inherited dmStatusAtendimento: TdmStatusAtendimento
  OldCreateOrder = True
  Height = 416
  Width = 741
  object dspStatusAtendimento: TDataSetProvider
    DataSet = qryStatusAtendimento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsStatusAtendimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspStatusAtendimento'
    BeforeDelete = cdsStatusAtendimentoBeforeDelete
    OnNewRecord = cdsStatusAtendimentoNewRecord
    OnReconcileError = cdsStatusAtendimentoReconcileError
    Left = 72
    Top = 144
    object cdsStatusAtendimentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsStatusAtendimentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsStatusAtendimentoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStatusAtendimentoGENE_DESCR: TStringField
      DisplayLabel = 'Status do Atendimento'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsStatusAtendimentoGENE_NUMBER1: TIntegerField
      DisplayLabel = 'Dias p/ Atendimento'
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsStatusAtendimentoGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsStatusAtendimentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
  end
  object dsStatusAtendimento: TDataSource
    DataSet = cdsStatusAtendimento
    Left = 72
    Top = 192
  end
  object qryStatusAtendimento: TSQLQuery
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
      'AND   GENE_TGEN_ID = 516'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryStatusAtendimentoGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryStatusAtendimentoGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryStatusAtendimentoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryStatusAtendimentoGENE_DESCR: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object qryStatusAtendimentoGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryStatusAtendimentoGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qryStatusAtendimentoGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
    end
  end
end
