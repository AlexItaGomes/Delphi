inherited dmRel_Agenda: TdmRel_Agenda
  OldCreateOrder = True
  object qryRelAgenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT AGEN_USER_ID_ATENDENTE,'
      '       USER_NOME_COMPLETO,'
      '       PROD_ID,'
      '       PROD_DESCRICAO,'
      '       SUM(ODIT_QTDE)                   AS ODIT_QTDE,'
      '       SUM(ODIT_QTDE*ODIT_VLR_UNITARIO) AS ODIT_VLR_TOTAL,'
      '       SUM(AGEN_VLR_DESCONTO)           AS AGEN_VLR_DESCONTO'
      '  FROM AGENDA'
      '  JOIN ORDEM_SERVICO_ITENS'
      '    ON ODIT_ORDS_ID       = AGEN_ORDS_ID'
      '   AND ODIT_ORDS_EMPR_ID  = AGEN_ORDS_EMPR_ID'
      '  JOIN USUARIO'
      '    ON USER_ID            = AGEN_USER_ID_ATENDENTE'
      '  JOIN PRODUTOS'
      '    ON PROD_ID            = ODIT_TPIT_PROD_ID'
      '   AND PROD_EMPR_ID       = ODIT_TPIT_PROD_EMPR_ID'
      ' GROUP BY'
      '       AGEN_USER_ID_ATENDENTE,'
      '       USER_NOME_COMPLETO,'
      '       PROD_ID,'
      '       PROD_DESCRICAO'
      ' ORDER BY'
      '       USER_NOME_COMPLETO'
      ' ')
    SQLConnection = dmConexao.dbConexao
    Left = 48
    Top = 24
  end
  object dsRelAgenda: TDataSource
    DataSet = qryRelAgenda
    Left = 48
    Top = 72
  end
  object qryAcertos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT GENE_ID,'
      '       AGEN_USER_ID_ATENDENTE,'
      '       SUM(ACER_VLR_DOC)      AS VALOR'
      '  FROM ACERTOS'
      '  JOIN GENERICA'
      '    ON GENE_EMPR_ID           = ACER_GENE_EMPR_ID_TP_DOC'
      '   AND GENE_TGEN_ID           = ACER_GENE_TGEN_ID_TP_DOC'
      '   AND GENE_ID                = ACER_GENE_ID_TP_DOC'
      '  JOIN AGENDA'
      '    ON AGEN_ID                = ACER_ID_ORIGEM'
      '   AND AGEN_EMPR_ID           = ACER_EMPR_ID_ORIGEM'
      ' WHERE ACER_ORIGEM            = '#39'A'#39
      '   AND ACER_STATUS            = '#39'A'#39
      ' GROUP BY'
      '       GENE_ID,'
      '       AGEN_USER_ID_ATENDENTE')
    SQLConnection = dmConexao.dbConexao
    Left = 152
    Top = 24
  end
end
