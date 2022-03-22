object dmFrPesquisa: TdmFrPesquisa
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 848
  Width = 1005
  object dspPesqCliente: TDataSetProvider
    DataSet = qryPesqCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 72
  end
  object cdsPesqCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqCliente'
    Left = 56
    Top = 120
    object cdsPesqClienteCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIE_ID'
    end
    object cdsPesqClienteCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsPesqClienteCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqClienteCLIE_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CLIE_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPesqClienteCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsPesqClienteCLIE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIE_ENDERECO'
      Required = True
      Size = 150
    end
    object cdsPesqClienteCLIE_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLIE_BAIRRO'
      Required = True
      Size = 100
    end
    object cdsPesqClienteCLIE_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CLIE_CEP'
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsPesqClienteCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 250
    end
    object cdsPesqClienteUF: TStringField
      FieldName = 'UF'
      Size = 250
    end
    object cdsPesqClienteCLIE_REFERENCIA: TStringField
      DisplayLabel = 'Ponto Refer'#234'ncia'
      FieldName = 'CLIE_REFERENCIA'
      Size = 150
    end
    object cdsPesqClienteCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE1'
      Required = True
      EditMask = '(##)####-####'
      Size = 13
    end
    object cdsPesqClienteCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE2'
      EditMask = '(##)####-####'
      Size = 13
    end
    object cdsPesqClienteCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE3'
      EditMask = '(##)####-####'
      Size = 13
    end
    object cdsPesqClienteCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE4'
      EditMask = '(##)####-####'
      Size = 13
    end
    object cdsPesqClienteCLIE_OBS: TBlobField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'CLIE_OBS'
      OnGetText = cdsPesqClienteCLIE_OBSGetText
      Size = 1
    end
  end
  object qryPesqCliente: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_TIPO,'
      '      CL.CLIE_CEP,'
      '      PR.GENE_DESCR CIDADE,'
      '      PR.GENE_PAR1  UF,'
      '      CL.CLIE_REFERENCIA,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_OBS'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID      = CL.CLIE_GENE_ID_PRACA)'
      'WHERE CL.CLIE_EMPR_ID = :EMPR_ID'
      'AND      CL.CLIE_ATIVO = 1'
      'ORDER BY'
      '      CL.CLIE_RAZAO_SOCIAL')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 24
  end
  object qryPesqPraca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 501'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 152
    Top = 24
  end
  object dspPesqPraca: TDataSetProvider
    DataSet = qryPesqPraca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 152
    Top = 72
  end
  object cdsPesqPraca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqPraca'
    Left = 152
    Top = 120
    object cdsPesqPracaGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqPracaGENE_DESCR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqPracaGENE_PAR1: TStringField
      DisplayLabel = 'UF'
      FieldName = 'GENE_PAR1'
      Size = 50
    end
  end
  object qryPesqFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      FN.FORN_ID,'
      '      FN.FORN_NOME_FANTASIA,'
      '      FN.FORN_RAZAO_SOCIAL,'
      '      FN.FORN_CNPJ_CPF,'
      '      FN.FORN_TIPO,'
      '      FN.FORN_CEP,'
      '      FN.FORN_ENDERECO,'
      '      FN.FORN_BAIRRO,'
      '      FN.FORN_CONTATO,'
      '      FN.FORN_TELEFONE,'
      '      FN.FORN_FAX,'
      '      CD.GENE_DESCR AS CIDADE,'
      '      CD.GENE_PAR1  AS UF'
      'FROM  FORNECEDORES FN'
      'INNER JOIN GENERICA CD'
      '   ON (CD.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA'
      '  AND  CD.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA'
      '  AND  CD.GENE_ID      = FN.FORN_GENE_ID_PRACA)'
      'ORDER BY FN.FORN_NOME_FANTASIA')
    SQLConnection = dmConexao.dbConexao
    Left = 240
    Top = 24
  end
  object dspPesqFornec: TDataSetProvider
    DataSet = qryPesqFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 72
  end
  object cdsPesqFornec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqFornec'
    Left = 240
    Top = 120
    object cdsPesqFornecFORN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORN_ID'
    end
    object cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 150
    end
    object cdsPesqFornecFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesqFornecFORN_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'FORN_CNPJ_CPF'
      Size = 18
    end
    object cdsPesqFornecFORN_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'FORN_TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPesqFornecFORN_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'FORN_CEP'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsPesqFornecFORN_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'FORN_ENDERECO'
      Required = True
      Size = 150
    end
    object cdsPesqFornecFORN_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FORN_BAIRRO'
      Size = 100
    end
    object cdsPesqFornecFORN_CONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'FORN_CONTATO'
      Size = 100
    end
    object cdsPesqFornecFORN_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FORN_TELEFONE'
      Required = True
      Size = 14
    end
    object cdsPesqFornecFORN_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FORN_FAX'
      Size = 14
    end
    object cdsPesqFornecCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 250
    end
    object cdsPesqFornecUF: TStringField
      FieldName = 'UF'
      Size = 250
    end
  end
  object qryPesqContaPagar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CPAG_ID,'
      '      CPAG_PROVENIENTE,'
      '      CPAG_DTA_VCTO'
      'FROM  CONTAS_PAGAR'
      'WHERE CPAG_EMPR_ID = :EMPR_ID'
      'ORDER BY CPAG_PROVENIENTE')
    SQLConnection = dmConexao.dbConexao
    Left = 448
    Top = 24
  end
  object dspPesqContaPagar: TDataSetProvider
    DataSet = qryPesqContaPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 72
  end
  object cdsPesqContaPagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqContaPagar'
    Left = 448
    Top = 120
    object cdsPesqContaPagarCPAG_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CPAG_ID'
    end
    object cdsPesqContaPagarCPAG_PROVENIENTE: TStringField
      DisplayLabel = 'Proveniente'
      FieldName = 'CPAG_PROVENIENTE'
      Size = 250
    end
    object cdsPesqContaPagarCPAG_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vcto'
      FieldName = 'CPAG_DTA_VCTO'
    end
  end
  object qryPesqPlanoContas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      PLCT_TIPO'
      'FROM  PLANO_CONTAS'
      'WHERE PLCT_TIPO = :TIPO'
      'AND PLCT_SISTEMA = 0'
      'AND PLCT_ATIVO = 1'
      'ORDER BY PLCT_COD_SIMPLIFICADO,PLCT_DESCRICAO,PLCT_TIPO')
    SQLConnection = dmConexao.dbConexao
    Left = 576
    Top = 24
  end
  object dspPesqPlanoContas: TDataSetProvider
    DataSet = qryPesqPlanoContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 72
  end
  object cdsPesqPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqPlanoContas'
    Left = 576
    Top = 120
    object cdsPesqPlanoContasPLCT_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PLCT_ID'
    end
    object cdsPesqPlanoContasPLCT_COD_SIMPLIFICADO: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsPesqPlanoContasPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsPesqPlanoContasPLCT_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qryPesqTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 5'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 344
    Top = 24
  end
  object dspPesqTipo: TDataSetProvider
    DataSet = qryPesqTipo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 344
    Top = 72
  end
  object cdsPesqTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipo'
    Left = 344
    Top = 120
    object cdsPesqTipoGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqTipoGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object cdsPesqContaReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqContaReceber'
    Left = 696
    Top = 120
    object cdsPesqContaReceberCREC_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Reg.'
      FieldName = 'CREC_ID'
    end
    object cdsPesqContaReceberCREC_PROVENIENTE: TStringField
      DisplayLabel = 'Prov'#234'niente'
      FieldName = 'CREC_PROVENIENTE'
      Size = 50
    end
    object cdsPesqContaReceberCREC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      FieldName = 'CREC_DTA_VCTO'
    end
  end
  object dspPesqContaReceber: TDataSetProvider
    DataSet = qryPesqContaReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 72
  end
  object qryPesqContaReceber: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CREC_ID,'
      '      CREC_PROVENIENTE,'
      '      CREC_DTA_VCTO'
      'FROM  CONTAS_RECEBER'
      'WHERE CREC_EMPR_ID = :EMPR_ID'
      'ORDER BY CREC_PROVENIENTE')
    SQLConnection = dmConexao.dbConexao
    Left = 696
    Top = 24
  end
  object qryPesqPlanoContasGeral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      PLCT_ID,'
      '      PLCT_COD_SIMPLIFICADO,'
      '      PLCT_DESCRICAO,'
      '      PLCT_TIPO'
      'FROM  PLANO_CONTAS'
      'ORDER BY PLCT_COD_SIMPLIFICADO,PLCT_DESCRICAO,PLCT_TIPO')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 184
  end
  object dspPesqPlanoContasGeral: TDataSetProvider
    DataSet = qryPesqPlanoContasGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 232
  end
  object cdsPesqPlanoContasGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqPlanoContasGeral'
    Left = 56
    Top = 280
    object cdsPesqPlanoContasGeralPLCT_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PLCT_ID'
    end
    object cdsPesqPlanoContasGeralPLCT_COD_SIMPLIFICADO: TStringField
      DisplayLabel = 'C'#243'd. Simplif.'
      FieldName = 'PLCT_COD_SIMPLIFICADO'
      Size = 150
    end
    object cdsPesqPlanoContasGeralPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PLCT_DESCRICAO'
      Size = 100
    end
    object cdsPesqPlanoContasGeralPLCT_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'PLCT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPesqContaBancaria: TDataSetProvider
    DataSet = qryPesqContaBancaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 232
  end
  object cdsPesqContaBancaria: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqContaBancaria'
    Left = 184
    Top = 280
    object cdsPesqContaBancariaCBCO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CBCO_ID'
    end
    object cdsPesqContaBancariaGENE_DESCR: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqContaBancariaCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      Size = 250
    end
    object cdsPesqContaBancariaCBCO_AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'CBCO_AGENCIA'
      Required = True
      Size = 50
    end
    object cdsPesqContaBancariaCBCO_CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CBCO_CONTA'
      Required = True
      Size = 50
    end
    object cdsPesqContaBancariaCBCO_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CBCO_TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPesqContaBancariaCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'CBCO_SALDO_ATUAL'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPesqContaBancariaCBCO_LIMITE: TFMTBCDField
      DisplayLabel = 'Limite'
      FieldName = 'CBCO_LIMITE'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryPesqContaBancaria: TSQLQuery
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
      '      BC.GENE_DESCR,'
      '      CB.CBCO_DESCRICAO,'
      '      CB.CBCO_AGENCIA,'
      '      CB.CBCO_CONTA,'
      '      CB.CBCO_TIPO,'
      '      COALESCE(CB.CBCO_SALDO_ATUAL,0) AS CBCO_SALDO_ATUAL,'
      '      COALESCE(CB.CBCO_LIMITE,0)      AS CBCO_LIMITE'
      'FROM  CONTAS_BANCARIAS CB'
      'INNER JOIN GENERICA BC'
      'ON (CB.CBCO_GENE_EMPR_ID_BCO = BC.GENE_EMPR_ID'
      'AND CB.CBCO_GENE_TGEN_ID_BCO = BC.GENE_TGEN_ID'
      'AND CB.CBCO_GENE_ID_BCO      = BC.GENE_ID)'
      'WHERE CB.CBCO_EMPR_ID = :EMPR_ID'
      '  AND CB.CBCO_ATIVO   = 1'
      'ORDER BY CB.CBCO_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 184
    Top = 184
  end
  object qryPesqPrc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      TPRC_ID,'
      '      TPRC_DESCRICAO'
      'FROM  TABELA_PRECO'
      'WHERE TPRC_EMPR_ID = :EMPR_ID'
      'AND   TPRC_ATIVO   = 1'
      'ORDER BY'
      '      TPRC_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 288
    Top = 184
  end
  object dspPesqPrc: TDataSetProvider
    DataSet = qryPesqPrc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 232
  end
  object cdsPesqPrc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqPrc'
    Left = 288
    Top = 280
    object cdsPesqPrcTPRC_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TPRC_ID'
    end
    object cdsPesqPrcTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      Size = 100
    end
  end
  object qryPesqEquipamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      PR.PROD_GARANTIA,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD'
      'FROM  PRODUTOS PR'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PR.PROD_EMPR_ID = :EMPR_ID'
      'AND   PR.PROD_ATIVO   = 1'
      'ORDER BY'
      '      PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 374
    Top = 184
  end
  object dspPesqEquipamento: TDataSetProvider
    DataSet = qryPesqEquipamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 374
    Top = 232
  end
  object cdsPesqEquipamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqEquipamento'
    Left = 374
    Top = 280
    object cdsPesqEquipamentoPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PROD_ID'
    end
    object cdsPesqEquipamentoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Equipamento'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqEquipamentoPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqEquipamentoPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object cdsPesqEquipamentoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqEquipamentoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
  end
  object qryPesqTecnico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      USER_ID,'
      '      USER_LOGIN,'
      '      USER_NOME_COMPLETO'
      'FROM  USUARIO'
      'INNER JOIN USUARIO_EMPR'
      'ON (USER_ID = USEP_USER_ID)'
      'WHERE USEP_EMPR_ID = :EMPR_ID'
      'AND  USER_ATIVO = 1'
      'AND  USER_ID   <> 0'
      'ORDER BY'
      '      USER_NOME_COMPLETO')
    SQLConnection = dmConexao.dbConexao
    Left = 470
    Top = 184
  end
  object dspPesqTecnico: TDataSetProvider
    DataSet = qryPesqTecnico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 470
    Top = 232
  end
  object cdsPesqTecnico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqTecnico'
    Left = 470
    Top = 280
    object cdsPesqTecnicoUSER_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USER_ID'
    end
    object cdsPesqTecnicoUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object cdsPesqTecnicoUSER_LOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'USER_LOGIN'
      FixedChar = True
      Size = 8
    end
  end
  object qryPesqTipoProd: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 10')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 352
  end
  object dspPesqTipoProd: TDataSetProvider
    DataSet = qryPesqTipoProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 400
  end
  object cdsPesqTipoProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipoProd'
    Left = 56
    Top = 448
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'GENE_ID'
    end
    object StringField1: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 15
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqGrupoProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 503')
    SQLConnection = dmConexao.dbConexao
    Left = 160
    Top = 352
  end
  object dspPesqGrupoProd: TDataSetProvider
    DataSet = qryPesqGrupoProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 400
  end
  object cdsPesqGrupoProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqGrupoProd'
    Left = 160
    Top = 448
    object cdsPesqGrupoProdGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqGrupoProdGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqMarcaProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 504')
    SQLConnection = dmConexao.dbConexao
    Left = 264
    Top = 352
  end
  object dspPesqMarcaProd: TDataSetProvider
    DataSet = qryPesqMarcaProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 264
    Top = 400
  end
  object cdsPesqMarcaProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqMarcaProd'
    Left = 264
    Top = 448
    object cdsPesqMarcaProdGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqMarcaProdGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqModeloProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 507')
    SQLConnection = dmConexao.dbConexao
    Left = 376
    Top = 352
  end
  object dspPesqModeloProd: TDataSetProvider
    DataSet = qryPesqModeloProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 376
    Top = 400
  end
  object cdsPesqModeloProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqModeloProd'
    Left = 376
    Top = 448
    object cdsPesqModeloProdGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqModeloProdGENE_DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      PR.PROD_ID,'
      '      PR.PROD_DESCRICAO,'
      '      UN.GENE_PAR1 AS PROD_UNIDADE,'
      '      GP.GENE_DESCR GRUPO_PROD,'
      '      MC.GENE_DESCR MARCA_PROD,'
      '      MD.GENE_DESCR MODELO_PROD,'
      '      COALESCE(PR.PROD_COD_FORN1,0) AS COD_FORNEC1,'
      '      COALESCE(PR.PROD_COD_FORN2,0) AS COD_FORNEC2,'
      '      COALESCE(PR.PROD_COD_FORN3,0) AS COD_FORNEC3,'
      '      COALESCE(PR.PROD_COD_FORN4,0) AS COD_FORNEC4'
      'FROM  PRODUTOS PR'
      'INNER JOIN GENERICA UN'
      'ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID'
      'AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID'
      'AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)'
      'INNER JOIN GENERICA GP'
      'ON (GP.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_GRUPO'
      'AND GP.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_GRUPO'
      'AND GP.GENE_ID      = PR.PROD_GENE_ID_GRUPO)'
      'INNER JOIN GENERICA MC'
      'ON (MC.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MARCA'
      'AND MC.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MARCA'
      'AND MC.GENE_ID      = PR.PROD_GENE_ID_MARCA)'
      'INNER JOIN GENERICA MD'
      'ON (MD.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_MODELO'
      'AND MD.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_MODELO'
      'AND MD.GENE_ID      = PR.PROD_GENE_ID_MODELO)'
      'WHERE PR.PROD_EMPR_ID = :EMPR_ID'
      'ORDER BY PR.PROD_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 808
    Top = 24
  end
  object dspPesqProd: TDataSetProvider
    DataSet = qryPesqProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 808
    Top = 72
  end
  object cdsPesqProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProd'
    Left = 808
    Top = 120
    object cdsPesqProdPROD_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'PROD_ID'
    end
    object cdsPesqProdPROD_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PROD_DESCRICAO'
      Size = 100
    end
    object cdsPesqProdPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 3
      FieldName = 'PROD_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsPesqProdMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 50
    end
    object cdsPesqProdMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 50
    end
    object cdsPesqProdGRUPO_PROD: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Size = 50
    end
    object cdsPesqProdCOD_FORNEC1: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC1'
    end
    object cdsPesqProdCOD_FORNEC2: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC2'
    end
    object cdsPesqProdCOD_FORNEC3: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC3'
    end
    object cdsPesqProdCOD_FORNEC4: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'COD_FORNEC4'
    end
  end
  object qryPesqNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      NF.NFEN_ID,'
      '      NF.NFEN_NR_NOTA,'
      '      NF.NFEN_VLR_TOTAL_NOTA,'
      '      NF.NFEN_DTA_ENTRADA,'
      '      FN.FORN_NOME_FANTASIA'
      'FROM  NOTA_FISCAL NF'
      'INNER JOIN FORNECEDORES FN'
      'ON (FN.FORN_ID          = NF.NFEN_FORN_ID)'
      'WHERE NF.NFEN_EMPR_ID   = :EMPR_ID'
      'ORDER BY NF.NFEN_DTA_ENTRADA DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 496
    Top = 352
  end
  object dspPesqNotaFiscal: TDataSetProvider
    DataSet = qryPesqNotaFiscal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 400
  end
  object cdsPesqNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqNotaFiscal'
    Left = 496
    Top = 448
    object cdsPesqNotaFiscalNFEN_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'NFEN_ID'
    end
    object cdsPesqNotaFiscalNFEN_NR_NOTA: TIntegerField
      DisplayLabel = 'Nr'#186' Nota'
      FieldName = 'NFEN_NR_NOTA'
    end
    object cdsPesqNotaFiscalFORN_NOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_NOME_FANTASIA'
      Size = 150
    end
    object cdsPesqNotaFiscalNFEN_DTA_ENTRADA: TDateField
      DisplayLabel = 'Dt. Entrada'
      FieldName = 'NFEN_DTA_ENTRADA'
    end
    object cdsPesqNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'NFEN_VLR_TOTAL_NOTA'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
  end
  object qryPesqSaida: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      SAAV_ID,'
      '      SAAV_NR_DOCUMENTO'
      'FROM  SAIDA_AVULSA'
      'WHERE SAAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 600
    Top = 352
  end
  object dspPesqSaida: TDataSetProvider
    DataSet = qryPesqSaida
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 600
    Top = 400
  end
  object cdsPesqSaida: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqSaida'
    Left = 600
    Top = 448
    object cdsPesqSaidaSAAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'SAAV_ID'
    end
    object cdsPesqSaidaSAAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'SAAV_NR_DOCUMENTO'
      Size = 25
    end
  end
  object qryPesqEntrada: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      ENAV_ID,'
      '      ENAV_NR_DOCUMENTO'
      'FROM  ENTRADA_AVULSA'
      'WHERE ENAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 696
    Top = 352
  end
  object dspPesqEntrada: TDataSetProvider
    DataSet = qryPesqEntrada
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 400
  end
  object cdsPesqEntrada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqEntrada'
    Left = 696
    Top = 448
    object cdsPesqEntradaENAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'ENAV_ID'
    end
    object cdsPesqEntradaENAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'ENAV_NR_DOCUMENTO'
      Size = 25
    end
  end
  object qryPesqSaidaAvaria: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      SIAV_ID,'
      '      SIAV_NR_DOCUMENTO'
      'FROM  SAIDA_AVARIA'
      'WHERE SIAV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 800
    Top = 352
  end
  object dspPesqSaidaAvaria: TDataSetProvider
    DataSet = qryPesqSaidaAvaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 800
    Top = 400
  end
  object cdsPesqSaidaAvaria: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqSaidaAvaria'
    Left = 800
    Top = 448
    object cdsPesqSaidaAvariaSIAV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Registro'
      FieldName = 'SIAV_ID'
    end
    object cdsPesqSaidaAvariaSIAV_NR_DOCUMENTO: TStringField
      DisplayLabel = 'Nr'#186' Documento'
      FieldName = 'SIAV_NR_DOCUMENTO'
      Size = 25
    end
  end
  object qryPesqTipoOS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 12'
      'ORDER BY'
      '      GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 574
    Top = 184
  end
  object dspPesqTipoOS: TDataSetProvider
    DataSet = qryPesqTipoOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 574
    Top = 232
  end
  object cdsPesqTipoOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipoOS'
    Left = 574
    Top = 280
    object cdsPesqTipoOSGENE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object cdsPesqTipoOSGENE_DESCR: TStringField
      DisplayLabel = 'Tipo de O.S.'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      USER_ID,'
      '      USER_LOGIN,'
      '      USER_NOME_COMPLETO'
      'FROM  USUARIO'
      'INNER JOIN USUARIO_EMPR'
      'ON (USER_ID = USEP_USER_ID)'
      'WHERE USEP_EMPR_ID = :EMPR_ID'
      'ORDER BY'
      '      USER_NOME_COMPLETO')
    SQLConnection = dmConexao.dbConexao
    Left = 694
    Top = 184
  end
  object dspPesqUsuario: TDataSetProvider
    DataSet = qryPesqUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 694
    Top = 232
  end
  object cdsPesqUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqUsuario'
    Left = 694
    Top = 280
    object IntegerField2: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USER_ID'
    end
    object StringField2: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object StringField3: TStringField
      DisplayLabel = 'Login'
      FieldName = 'USER_LOGIN'
      FixedChar = True
      Size = 8
    end
  end
  object qryPesqVendedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      USER_ID,'
      '      USER_LOGIN,'
      '      USER_NOME_COMPLETO'
      'FROM  USUARIO'
      'INNER JOIN USUARIO_EMPR'
      'ON (USER_ID = USEP_USER_ID)'
      'WHERE USEP_EMPR_ID = :EMPR_ID'
      'AND  USER_ID              <> 0'
      'AND  USER_VENDEDOR = 1'
      'ORDER BY'
      '      USER_NOME_COMPLETO')
    SQLConnection = dmConexao.dbConexao
    Left = 806
    Top = 184
  end
  object dspPesqVendedor: TDataSetProvider
    DataSet = qryPesqVendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 806
    Top = 232
  end
  object cdsPesqVendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqVendedor'
    Left = 806
    Top = 280
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USER_ID'
    end
    object StringField4: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 100
    end
    object StringField5: TStringField
      DisplayLabel = 'Login'
      FieldName = 'USER_LOGIN'
      FixedChar = True
      Size = 8
    end
  end
  object qryPesqRegiao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 514')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 512
  end
  object dspPesqRegiao: TDataSetProvider
    DataSet = qryPesqRegiao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 560
  end
  object cdsPesqRegiao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqRegiao'
    Left = 56
    Top = 608
    object IntegerField4: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField6: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqRegiaoGENE_PAR1: TStringField
      DisplayLabel = #193'rea Total (KM)'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
  end
  object qryPesqRota: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      RT.GENE_ID,'
      '      RT.GENE_DESCR,'
      '      RT.GENE_PAR1,'
      '      RT.GENE_NUMERIC1,'
      '      RT.GENE_GENE_ID_PROD'
      'FROM  GENERICA RT'
      'INNER JOIN GENERICA RG'
      'ON (RG.GENE_EMPR_ID = RT.GENE_GENE_EMPR_ID_PROP'
      'AND RG.GENE_TGEN_ID = RT.GENE_GENE_TGEN_ID_PROP'
      'AND RG.GENE_ID      = RT.GENE_GENE_ID_PROD)'
      'WHERE RT.GENE_EMPR_ID = :EMPR_ID'
      'AND   RT.GENE_TGEN_ID = 515')
    SQLConnection = dmConexao.dbConexao
    Left = 160
    Top = 512
  end
  object dspPesqRota: TDataSetProvider
    DataSet = qryPesqRota
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 560
  end
  object cdsPesqRota: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqRota'
    Left = 160
    Top = 608
    object IntegerField5: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField7: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqRotaGENE_PAR1: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
    object cdsPesqRotaGENE_NUMERIC1: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'GENE_NUMERIC1'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPesqRotaGENE_GENE_ID_PROD: TIntegerField
      FieldName = 'GENE_GENE_ID_PROD'
      Visible = False
    end
  end
  object qryPesqGrupoCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 513')
    SQLConnection = dmConexao.dbConexao
    Left = 264
    Top = 512
  end
  object dspPesqGrupoCliente: TDataSetProvider
    DataSet = qryPesqGrupoCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 264
    Top = 560
  end
  object cdsPesqGrupoCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqGrupoCliente'
    Left = 264
    Top = 608
    object IntegerField6: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField8: TStringField
      DisplayLabel = 'Grupo Cliente'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
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
      '--AND   GENE_ID      < 1000'
      'ORDER BY GENE_DESCR, GENE_PAR1')
    SQLConnection = dmConexao.dbConexao
    Left = 376
    Top = 512
  end
  object dspPesqTipoMov: TDataSetProvider
    DataSet = qryPesqTipoMov
    Left = 376
    Top = 560
  end
  object cdsPesqTipoMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqTipoMov'
    Left = 376
    Top = 608
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
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_NUMBER1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 516'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 496
    Top = 512
  end
  object dspStatusAtendimento: TDataSetProvider
    DataSet = qryStatusAtendimento
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 560
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
    Left = 496
    Top = 608
    object IntegerField7: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
      Required = True
    end
    object StringField9: TStringField
      DisplayLabel = 'Status Atendimento'
      FieldName = 'GENE_DESCR'
      Size = 250
    end
    object cdsStatusAtendimentoGENE_NUMBER1: TIntegerField
      DisplayLabel = 'Pr'#243'x. Atendimento'
      FieldName = 'GENE_NUMBER1'
    end
  end
  object qryStatusOS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 517'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 608
    Top = 512
  end
  object dspStatusOS: TDataSetProvider
    DataSet = qryStatusOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 608
    Top = 560
  end
  object cdsStatusOS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspStatusOS'
    Left = 608
    Top = 608
    object IntegerField8: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField10: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object dspPesq_Bancos: TDataSetProvider
    DataSet = qryPesq_Bancos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 896
    Top = 72
  end
  object cdsPesq_Bancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesq_Bancos'
    Left = 896
    Top = 120
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
    Left = 896
    Top = 24
  end
  object dspPesqPatrimonio: TDataSetProvider
    DataSet = qryPesqPatrimonio
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 896
    Top = 232
  end
  object cdsPesqPatrimonio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqPatrimonio'
    Left = 896
    Top = 280
    object cdsPesqPatrimonioPATR_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PATR_ID'
      Required = True
    end
    object cdsPesqPatrimonioPATR_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PATR_DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object qryPesqPatrimonio: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '       PATR_ID,'
      '       PATR_DESCRICAO'
      '  FROM PATRIMONIO'
      ' WHERE PATR_EMPR_ID = :EMPR_ID'
      ' ORDER BY PATR_DESCRICAO')
    SQLConnection = dmConexao.dbConexao
    Left = 896
    Top = 184
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
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 518'
      'ORDER BY GENE_DESCR')
    SQLConnection = dmConexao.dbConexao
    Left = 696
    Top = 512
  end
  object dspTipoAgendamento: TDataSetProvider
    DataSet = qryTipoAgendamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 560
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
    Left = 696
    Top = 608
    object IntegerField9: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField11: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPedidoOrcamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT PV.PEDV_ID,'
      '       PV.PEDV_CLIE_ID,'
      '       PV.PEDV_VLR_PEDIDO,'
      '       PV.PEDV_DTA_CADASTRO,'
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
      ' WHERE PV.PEDV_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 800
    Top = 512
  end
  object dspPedidoOrcamento: TDataSetProvider
    DataSet = qryPedidoOrcamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 800
    Top = 560
  end
  object cdsPedidoOrcamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedidoOrcamento'
    Left = 800
    Top = 608
    object cdsPedidoOrcamentoPEDV_ID: TIntegerField
      DisplayLabel = 'Nr'#186' Pedido'
      FieldName = 'PEDV_ID'
      Required = True
    end
    object cdsPedidoOrcamentoPEDV_CLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'PEDV_CLIE_ID'
      Required = True
    end
    object cdsPedidoOrcamentoCLIE_FANTASIA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsPedidoOrcamentoCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CNPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      Size = 18
    end
    object cdsPedidoOrcamentoPEDV_VLR_PEDIDO: TFMTBCDField
      DisplayLabel = 'Vlr. Pedido'
      FieldName = 'PEDV_VLR_PEDIDO'
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsPedidoOrcamentoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tabela de Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsPedidoOrcamentoPEDV_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Pedido'
      FieldName = 'PEDV_DTA_CADASTRO'
      Required = True
    end
  end
  object qryPesqUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR,'
      '      GENE_PAR1'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 519'
      'ORDER BY GENE_PAR1')
    SQLConnection = dmConexao.dbConexao
    Left = 912
    Top = 352
  end
  object dspPesqUnidade: TDataSetProvider
    DataSet = qryPesqUnidade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 912
    Top = 400
  end
  object cdsPesqUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqUnidade'
    Left = 912
    Top = 448
    object IntegerField10: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField12: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
    object cdsPesqUnidadeGENE_PAR1: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'GENE_PAR1'
      Size = 250
    end
  end
  object qryPesqFiltro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = :EMPR_ID'
      'AND   GENE_TGEN_ID = 520')
    SQLConnection = dmConexao.dbConexao
    Left = 912
    Top = 512
  end
  object dspPesqFiltro: TDataSetProvider
    DataSet = qryPesqFiltro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 912
    Top = 560
  end
  object cdsPesqFiltro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqFiltro'
    Left = 912
    Top = 608
    object IntegerField11: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField13: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryPesqBandeira: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      GENE_ID,'
      '      GENE_DESCR'
      'FROM  GENERICA'
      'WHERE GENE_EMPR_ID = 0'
      'AND   GENE_TGEN_ID = 14'
      'ORDER BY GENE_PAR1')
    SQLConnection = dmConexao.dbConexao
    Left = 56
    Top = 672
  end
  object dspPesqBandeira: TDataSetProvider
    DataSet = qryPesqBandeira
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 720
  end
  object cdsPesqBandeira: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqBandeira'
    Left = 56
    Top = 768
    object IntegerField12: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GENE_ID'
    end
    object StringField14: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'GENE_DESCR'
      Size = 50
    end
  end
  object qryAgendamentos: TSQLQuery
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
      'SELECT AGEN.AGEN_ID,'
      '       AGEN.AGEN_DATA,'
      '       AGEN.AGEN_HORA,'
      '       CASE'
      
        '            WHEN (AGEN.AGEN_CLIE_ID = (SELECT CSIS_CLIE_ID FROM ' +
        'CONF_SISTEMA WHERE CSIS_EMPR_ID = :EMPR_ID)) THEN AGEN.AGEN_CLIE' +
        'NTE'
      '            ELSE CLIE.CLIE_FANTASIA'
      '       END CLIE_FANTASIA,'
      '       CASE'
      
        '            WHEN (AGEN.AGEN_CLIE_ID = (SELECT CSIS_CLIE_ID FROM ' +
        'CONF_SISTEMA WHERE CSIS_EMPR_ID = :EMPR_ID)) THEN AGEN.AGEN_TELE' +
        'FONE'
      '            ELSE CLIE.CLIE_TELEFONE1'
      '       END CLIE_TELEFONE1,'
      '       CLIE.CLIE_TELEFONE2,'
      '       CLIE.CLIE_TELEFONE3,'
      '       CLIE.CLIE_TELEFONE4'
      '  FROM AGENDA    AGEN'
      '  JOIN CLIENTES  CLIE'
      '    ON CLIE.CLIE_ID      = AGEN.AGEN_CLIE_ID'
      '   AND CLIE.CLIE_EMPR_ID = AGEN.AGEN_CLIE_EMPR_ID'
      ' WHERE AGEN.AGEN_EMPR_ID = :EMPR_ID'
      '   AND CASE'
      
        '            WHEN (AGEN.AGEN_CLIE_ID = (SELECT CSIS_CLIE_ID FROM ' +
        'CONF_SISTEMA WHERE CSIS_EMPR_ID = :EMPR_ID)) THEN AGEN.AGEN_CLIE' +
        'NTE'
      '            ELSE CLIE.CLIE_FANTASIA'
      '       END <> '#39'HOR'#193'RIO BLOQUEADO'#39
      '   AND AGEN.AGEN_CLIENTE <> '#39'Ext. Procedimento(s)'#39
      
        '   AND AGEN.AGEN_DATA >= (SELECT CURRENT_TIMESTAMP FROM RDB$DATA' +
        'BASE)'
      ' ORDER BY'
      '       AGEN.AGEN_DATA,'
      '       AGEN.AGEN_HORA')
    SQLConnection = dmConexao.dbConexao
    Left = 160
    Top = 672
  end
  object dspAgendamentos: TDataSetProvider
    DataSet = qryAgendamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 720
  end
  object cdsAgendamentos: TClientDataSet
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
    ProviderName = 'dspAgendamentos'
    Left = 160
    Top = 768
    object cdsAgendamentosAGEN_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'AGEN_ID'
      Required = True
    end
    object cdsAgendamentosAGEN_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'AGEN_DATA'
      Required = True
    end
    object AGEN_HORA: TStringField
      DisplayLabel = 'Hora'
      FieldName = 'AGEN_HORA'
      Required = True
      Size = 5
    end
    object cdsAgendamentosCLIE_FANTASIA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIE_FANTASIA'
      Size = 150
    end
    object cdsAgendamentosCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE1'
      Size = 14
    end
    object cdsAgendamentosCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE2'
      Size = 14
    end
    object cdsAgendamentosCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE3'
      Size = 14
    end
    object cdsAgendamentosCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIE_TELEFONE4'
      Size = 14
    end
  end
end
