inherited dmCartaoCredito: TdmCartaoCredito
  OldCreateOrder = True
  object qryCartaoCredito: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CCRE.CCRE_ID,'
      '       CCRE.CCRE_EMPR_ID,'
      '       CCRE.CCRE_NUMERO_CARTAO,'
      '       CCRE.CCRE_TITULAR,'
      '       CCRE.CCRE_VENCIMENTO,'
      '       CCRE.CCRE_CBCO_ID,'
      '       CCRE.CCRE_CBCO_EMPR_ID,'
      '       CCRE.CCRE_LIMITE_SAQUE,'
      '       CCRE.CCRE_LIMITE_COMPRAS,'
      '       CCRE.CCRE_DIA_VCTO_FATURA,'
      '       CCRE.CCRE_DIA_FECHAMENTO_FATURA,'
      '       CCRE.CCRE_ENCARGOS_CONTRATUAIS,'
      '       CCRE.CCRE_ENCARGOS_CASH,'
      '       CCRE.CCRE_ATIVO,'
      '       CCRE.CCRE_DTA_CADASTRO,'
      '       CCRE.CCRE_USER_ID,'
      '       CBCO.CBCO_AGENCIA,'
      '       CBCO.CBCO_CONTA,'
      '       CBCO.CBCO_DESCRICAO,'
      '       CBCO.CBCO_SALDO_ATUAL,'
      '       BCO.GENE_PAR1         AS NR_BANCO,'
      '       BCO.GENE_DESCR        AS BANCO,'
      '       CASE CCRE.CCRE_ATIVO'
      '            WHEN 1 THEN '#39'Sim'#39
      '            WHEN 0 THEN '#39'N'#227'o'#39
      '       END AS                STATUS,'
      '       CCRE.CCRE_IMAGE,'
      '       CCRE.CCRE_TIPO_CARTAO,'
      '       CASE CCRE.CCRE_TIPO_CARTAO'
      '            WHEN '#39'C'#39' THEN '#39'Cr'#233'dito'#39
      '            WHEN '#39'D'#39' THEN '#39'D'#233'bito'#39
      '            WHEN '#39'A'#39' THEN '#39'Cr'#233'dito/D'#233'bito'#39
      '       END AS TIPO_CARTAO'
      '  FROM CARTAO_CREDITO        CCRE'
      ' INNER JOIN CONTAS_BANCARIAS CBCO'
      '    ON (CBCO.CBCO_ID         = CCRE.CCRE_CBCO_ID'
      '   AND CBCO.CBCO_EMPR_ID     = CCRE.CCRE_CBCO_EMPR_ID)'
      ' INNER JOIN GENERICA         BCO'
      '    ON (BCO.GENE_EMPR_ID     = CBCO.CBCO_GENE_EMPR_ID_BCO'
      '   AND BCO.GENE_TGEN_ID      = CBCO.CBCO_GENE_TGEN_ID_BCO'
      '   AND BCO.GENE_ID           = CBCO.CBCO_GENE_ID_BCO)'
      ' WHERE CCRE.CCRE_EMPR_ID     = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 72
    Top = 48
    object qryCartaoCreditoCCRE_ID: TIntegerField
      FieldName = 'CCRE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCartaoCreditoCCRE_EMPR_ID: TIntegerField
      FieldName = 'CCRE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCartaoCreditoCCRE_NUMERO_CARTAO: TStringField
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 19
    end
    object qryCartaoCreditoCCRE_TITULAR: TStringField
      FieldName = 'CCRE_TITULAR'
      Required = True
      Size = 80
    end
    object qryCartaoCreditoCCRE_VENCIMENTO: TStringField
      FieldName = 'CCRE_VENCIMENTO'
      Required = True
      Size = 5
    end
    object qryCartaoCreditoCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      Required = True
    end
    object qryCartaoCreditoCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      Required = True
    end
    object qryCartaoCreditoCCRE_LIMITE_SAQUE: TFMTBCDField
      FieldName = 'CCRE_LIMITE_SAQUE'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCartaoCreditoCCRE_LIMITE_COMPRAS: TFMTBCDField
      FieldName = 'CCRE_LIMITE_COMPRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCartaoCreditoCCRE_DIA_VCTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      Required = True
    end
    object qryCartaoCreditoCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      Required = True
    end
    object qryCartaoCreditoCCRE_ENCARGOS_CONTRATUAIS: TFMTBCDField
      FieldName = 'CCRE_ENCARGOS_CONTRATUAIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCartaoCreditoCCRE_ENCARGOS_CASH: TFMTBCDField
      FieldName = 'CCRE_ENCARGOS_CASH'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCartaoCreditoCCRE_DTA_CADASTRO: TDateField
      FieldName = 'CCRE_DTA_CADASTRO'
      Required = True
    end
    object qryCartaoCreditoCCRE_USER_ID: TIntegerField
      FieldName = 'CCRE_USER_ID'
      Required = True
    end
    object qryCartaoCreditoCBCO_AGENCIA: TStringField
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Size = 50
    end
    object qryCartaoCreditoCBCO_CONTA: TStringField
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Size = 50
    end
    object qryCartaoCreditoCBCO_DESCRICAO: TStringField
      FieldName = 'CBCO_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object qryCartaoCreditoCBCO_SALDO_ATUAL: TFMTBCDField
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryCartaoCreditoNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      ProviderFlags = []
      Size = 250
    end
    object qryCartaoCreditoBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 250
    end
    object qryCartaoCreditoCCRE_ATIVO: TIntegerField
      FieldName = 'CCRE_ATIVO'
    end
    object qryCartaoCreditoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryCartaoCreditoCCRE_IMAGE: TBlobField
      FieldName = 'CCRE_IMAGE'
      Size = 1
    end
    object qryCartaoCreditoCCRE_TIPO_CARTAO: TStringField
      FieldName = 'CCRE_TIPO_CARTAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCartaoCreditoTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
  end
  object dspCartaoCredito: TDataSetProvider
    DataSet = qryCartaoCredito
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 96
  end
  object cdsCartaoCredito: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspCartaoCredito'
    BeforeDelete = cdsCartaoCreditoBeforeDelete
    OnNewRecord = cdsCartaoCreditoNewRecord
    OnReconcileError = cdsCartaoCreditoReconcileError
    Left = 72
    Top = 144
    object cdsCartaoCreditoSTATUS: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsCartaoCreditoCCRE_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'CCRE_ATIVO'
      Required = True
      Visible = False
    end
    object cdsCartaoCreditoCCRE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CCRE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCartaoCreditoCCRE_EMPR_ID: TIntegerField
      FieldName = 'CCRE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsCartaoCreditoCCRE_NUMERO_CARTAO: TStringField
      DisplayLabel = 'Nr'#186' Cart'#227'o'
      FieldName = 'CCRE_NUMERO_CARTAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '#### XXXX XXXX ####'
      Size = 19
    end
    object cdsCartaoCreditoCCRE_TITULAR: TStringField
      DisplayLabel = 'Titular'
      FieldName = 'CCRE_TITULAR'
      Required = True
      Size = 80
    end
    object cdsCartaoCreditoCCRE_VENCIMENTO: TStringField
      DisplayLabel = 'Vencto Cart'#227'o'
      FieldName = 'CCRE_VENCIMENTO'
      Required = True
      EditMask = '##/##'
      Size = 5
    end
    object cdsCartaoCreditoCCRE_CBCO_ID: TIntegerField
      FieldName = 'CCRE_CBCO_ID'
      Required = True
      Visible = False
    end
    object cdsCartaoCreditoCCRE_CBCO_EMPR_ID: TIntegerField
      FieldName = 'CCRE_CBCO_EMPR_ID'
      Required = True
      Visible = False
    end
    object cdsCartaoCreditoCCRE_LIMITE_SAQUE: TFMTBCDField
      DisplayLabel = 'Limite Saque'
      FieldName = 'CCRE_LIMITE_SAQUE'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCartaoCreditoCCRE_LIMITE_COMPRAS: TFMTBCDField
      DisplayLabel = 'Limite Compras'
      FieldName = 'CCRE_LIMITE_COMPRAS'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCartaoCreditoCCRE_DIA_VCTO_FATURA: TIntegerField
      DisplayLabel = 'Dt.  Vencto Cart'#227'o'
      FieldName = 'CCRE_DIA_VCTO_FATURA'
      Required = True
      EditFormat = '00'
    end
    object cdsCartaoCreditoCCRE_DIA_FECHAMENTO_FATURA: TIntegerField
      DisplayLabel = 'Dt. Fech. Fatura'
      FieldName = 'CCRE_DIA_FECHAMENTO_FATURA'
      Required = True
      EditFormat = '00'
    end
    object cdsCartaoCreditoCCRE_ENCARGOS_CONTRATUAIS: TFMTBCDField
      DisplayLabel = 'Encargos Contratuais'
      FieldName = 'CCRE_ENCARGOS_CONTRATUAIS'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCartaoCreditoCCRE_ENCARGOS_CASH: TFMTBCDField
      DisplayLabel = 'Encargos Cash'
      FieldName = 'CCRE_ENCARGOS_CASH'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCartaoCreditoCCRE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CCRE_DTA_CADASTRO'
      Required = True
    end
    object cdsCartaoCreditoCCRE_USER_ID: TIntegerField
      FieldName = 'CCRE_USER_ID'
      Required = True
      Visible = False
    end
    object cdsCartaoCreditoCBCO_AGENCIA: TStringField
      DisplayLabel = 'Nr'#186' Ag'#234'ncia'
      FieldName = 'CBCO_AGENCIA'
      ProviderFlags = []
      Size = 50
    end
    object cdsCartaoCreditoCBCO_CONTA: TStringField
      DisplayLabel = 'Nr'#186' Conta'
      FieldName = 'CBCO_CONTA'
      ProviderFlags = []
      Size = 50
    end
    object cdsCartaoCreditoCBCO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CBCO_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object cdsCartaoCreditoCBCO_SALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'CBCO_SALDO_ATUAL'
      ProviderFlags = []
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCartaoCreditoNR_BANCO: TStringField
      DisplayLabel = 'Nr'#186' Banco'
      FieldName = 'NR_BANCO'
      ProviderFlags = []
      Size = 250
    end
    object cdsCartaoCreditoBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 250
    end
    object cdsCartaoCreditoCCRE_IMAGE: TBlobField
      DisplayLabel = 'Bandeira'
      FieldName = 'CCRE_IMAGE'
      Visible = False
      Size = 1
    end
    object cdsCartaoCreditoCCRE_TIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CCRE_TIPO_CARTAO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsCartaoCreditoTIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cart'#227'o'
      FieldName = 'TIPO_CARTAO'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
  end
  object dsCartaoCredito: TDataSource
    DataSet = cdsCartaoCredito
    Left = 72
    Top = 192
  end
end
