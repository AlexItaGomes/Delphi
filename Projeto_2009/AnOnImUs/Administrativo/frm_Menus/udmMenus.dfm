object dmMenus: TdmMenus
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 808
  Width = 1084
  object qryMenu: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      M.MENU_ID,'
      '      M.MENU_GENE_EMPR_ID_TP,'
      '      M.MENU_GENE_TGEN_ID_TP,'
      '      M.MENU_GENE_ID_TP,'
      '      M.MENU_CODIGO,'
      '      M.MENU_DESCRICAO,'
      '      M.MENU_ATIVO,'
      '      M.MENU_NOME_BPL,'
      '      M.MENU_CLASSE_FORM_BPL,'
      '      M.MENU_PARAMETRO_ABERTURA,'
      '      M.MENU_MENU_ID,'
      '      M.MENU_IMAGE1,'
      '      MM.MENU_DESCRICAO'
      'FROM  MENU M'
      'LEFT OUTER JOIN MENU MM'
      'ON (MM.MENU_ID = M.MENU_MENU_ID)'
      'WHERE M.MENU_GENE_EMPR_ID_TP = 0'
      'AND   M.MENU_GENE_TGEN_ID_TP = 1'
      'ORDER BY M.MENU_CODIGO, M.MENU_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 80
    Top = 48
    object qryMenuMENU_ID: TIntegerField
      FieldName = 'MENU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryMenuMENU_GENE_EMPR_ID_TP: TIntegerField
      FieldName = 'MENU_GENE_EMPR_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMenuMENU_GENE_TGEN_ID_TP: TIntegerField
      FieldName = 'MENU_GENE_TGEN_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMenuMENU_GENE_ID_TP: TIntegerField
      FieldName = 'MENU_GENE_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMenuMENU_CODIGO: TStringField
      FieldName = 'MENU_CODIGO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object qryMenuMENU_DESCRICAO: TStringField
      FieldName = 'MENU_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object qryMenuMENU_ATIVO: TIntegerField
      FieldName = 'MENU_ATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMenuMENU_NOME_BPL: TStringField
      FieldName = 'MENU_NOME_BPL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryMenuMENU_CLASSE_FORM_BPL: TStringField
      FieldName = 'MENU_CLASSE_FORM_BPL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryMenuMENU_PARAMETRO_ABERTURA: TStringField
      FieldName = 'MENU_PARAMETRO_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object qryMenuMENU_MENU_ID: TIntegerField
      FieldName = 'MENU_MENU_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryMenuMENU_DESCRICAO_1: TStringField
      FieldName = 'MENU_DESCRICAO_1'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object qryMenuMENU_IMAGE1: TBlobField
      FieldName = 'MENU_IMAGE1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
  end
  object dspMenu: TDataSetProvider
    DataSet = qryMenu
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 96
  end
  object cdsMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMenu'
    BeforeDelete = cdsMenuBeforeDelete
    OnNewRecord = cdsMenuNewRecord
    OnReconcileError = cdsMenuReconcileError
    Left = 80
    Top = 144
    object cdsMenuMENU_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'MENU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMenuMENU_CODIGO: TStringField
      DisplayLabel = 'C'#243'd. Menu'
      DisplayWidth = 15
      FieldName = 'MENU_CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsMenuMENU_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 15
      FieldName = 'MENU_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsMenuMENU_NOME_BPL: TStringField
      DisplayLabel = 'Nome da BPL'
      DisplayWidth = 15
      FieldName = 'MENU_NOME_BPL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsMenuMENU_CLASSE_FORM_BPL: TStringField
      DisplayLabel = 'Classe do Form'
      DisplayWidth = 15
      FieldName = 'MENU_CLASSE_FORM_BPL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsMenuMENU_GENE_EMPR_ID_TP: TIntegerField
      DisplayWidth = 15
      FieldName = 'MENU_GENE_EMPR_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMenuMENU_GENE_TGEN_ID_TP: TIntegerField
      DisplayWidth = 15
      FieldName = 'MENU_GENE_TGEN_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMenuMENU_GENE_ID_TP: TIntegerField
      DisplayWidth = 15
      FieldName = 'MENU_GENE_ID_TP'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMenuMENU_ATIVO: TIntegerField
      DisplayWidth = 15
      FieldName = 'MENU_ATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMenuMENU_PARAMETRO_ABERTURA: TStringField
      DisplayWidth = 15
      FieldName = 'MENU_PARAMETRO_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 50
    end
    object cdsMenuMENU_MENU_ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'MENU_MENU_ID'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsMenuMENU_DESCRICAO_1: TStringField
      DisplayWidth = 15
      FieldName = 'MENU_DESCRICAO_1'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsMenuMENU_IMAGE1: TBlobField
      DisplayWidth = 15
      FieldName = 'MENU_IMAGE1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
  end
  object dsMenu: TDataSource
    DataSet = cdsMenu
    Left = 80
    Top = 192
  end
  object qryPesq_Menu: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      MENU_ID,'
      '      MENU_CODIGO,'
      '      MENU_DESCRICAO'
      'FROM  MENU'
      'WHERE MENU_GENE_EMPR_ID_TP = 0'
      'AND   MENU_GENE_TGEN_ID_TP = 1'
      'AND   (MENU_NOME_BPL      <> '#39#39
      'OR    MENU_NOME_BPL       <> NULL)'
      'AND   MENU_ATIVO           = 1'
      'ORDER BY MENU_CODIGO, MENU_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 200
    Top = 48
  end
  object dspPesq_Menu: TDataSetProvider
    DataSet = qryPesq_Menu
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 96
  end
  object cdsPesq_Menu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Menu'
    Left = 200
    Top = 144
    object cdsPesq_MenuMENU_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'MENU_ID'
    end
    object cdsPesq_MenuMENU_CODIGO: TStringField
      DisplayLabel = 'C'#243'd. Menu'
      DisplayWidth = 15
      FieldName = 'MENU_CODIGO'
      Size = 10
    end
    object cdsPesq_MenuMENU_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 15
      FieldName = 'MENU_DESCRICAO'
      Size = 100
    end
  end
  object dsPesq_Menu: TDataSource
    DataSet = cdsPesq_Menu
    Left = 200
    Top = 192
  end
end
