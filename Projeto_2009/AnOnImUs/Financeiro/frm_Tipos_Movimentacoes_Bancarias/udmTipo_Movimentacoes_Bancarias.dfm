object dmTipos_Movimentacoes_Bancarias: TdmTipos_Movimentacoes_Bancarias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 546
  Width = 589
  object qryTipos_Movimentacoes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_EMPR_ID,'
      '      GENE_TGEN_ID,'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_COMENTARIO,'
      '      GENE_NUMBER1,'
      '      GENE_NUMBER2,'
      '      GENE_NUMBER3,'
      '      GENE_PAR1,'
      '      GENE_PAR2,'
      '      GENE_PAR3,'
      '      GENE_USER_ID,'
      '      GENE_DTA_CADASTRO,'
      '      GENE_GENE_EMPR_ID_PROP,'
      '      GENE_GENE_TGEN_ID_PROP,'
      '      GENE_GENE_ID_PROD'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 506'
      'AND   GENE_ID      < 1000'
      'ORDER BY GENE_DESCR, GENE_PAR1')
    SQLConnection = dmConexao.dbConexao
    Left = 112
    Top = 64
    object qryTipos_MovimentacoesGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_ID: TIntegerField
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_DESCR: TStringField
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryTipos_MovimentacoesGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object qryTipos_MovimentacoesGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_PAR1: TStringField
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryTipos_MovimentacoesGENE_PAR2: TStringField
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryTipos_MovimentacoesGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryTipos_MovimentacoesGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_DTA_CADASTRO: TDateField
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryTipos_MovimentacoesGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspTipos_Movimentacoes: TDataSetProvider
    DataSet = qryTipos_Movimentacoes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 112
  end
  object cdsTipos_Movimentacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipos_Movimentacoes'
    BeforeDelete = cdsTipos_MovimentacoesBeforeDelete
    OnNewRecord = cdsTipos_MovimentacoesNewRecord
    OnReconcileError = cdsTipos_MovimentacoesReconcileError
    Left = 112
    Top = 160
    object cdsTipos_MovimentacoesGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTipos_MovimentacoesGENE_DESCR: TStringField
      DisplayLabel = 'Movimenta'#231#227'o'
      FieldName = 'GENE_DESCR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsTipos_MovimentacoesGENE_PAR1: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'GENE_PAR1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsTipos_MovimentacoesGENE_PAR2: TStringField
      DisplayLabel = 'Dedut'#237'vel'
      FieldName = 'GENE_PAR2'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsTipos_MovimentacoesGENE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'GENE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTipos_MovimentacoesGENE_EMPR_ID: TIntegerField
      FieldName = 'GENE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_TGEN_ID: TIntegerField
      FieldName = 'GENE_TGEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_COMENTARIO: TStringField
      FieldName = 'GENE_COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 500
    end
    object cdsTipos_MovimentacoesGENE_NUMBER1: TIntegerField
      FieldName = 'GENE_NUMBER1'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_NUMBER2: TIntegerField
      FieldName = 'GENE_NUMBER2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_NUMBER3: TIntegerField
      FieldName = 'GENE_NUMBER3'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_PAR3: TStringField
      FieldName = 'GENE_PAR3'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsTipos_MovimentacoesGENE_USER_ID: TIntegerField
      FieldName = 'GENE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_GENE_EMPR_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_EMPR_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_GENE_TGEN_ID_PROP: TIntegerField
      FieldName = 'GENE_GENE_TGEN_ID_PROP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsTipos_MovimentacoesGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsTipos_Movimentacoes: TDataSource
    DataSet = cdsTipos_Movimentacoes
    Left = 112
    Top = 208
  end
end
