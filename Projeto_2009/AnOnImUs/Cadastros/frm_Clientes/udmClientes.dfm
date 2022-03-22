object dmClientes: TdmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 759
  Width = 1045
  object qryClientes: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      CL.CLIE_ID,'
      '      CL.CLIE_EMPR_ID,'
      '      CL.CLIE_RAZAO_SOCIAL,'
      '      CL.CLIE_FANTASIA,'
      '      CL.CLIE_CEP,'
      '      CL.CLIE_ENDERECO,'
      '      CL.CLIE_BAIRRO,'
      '      CL.CLIE_GENE_EMPR_ID_PRACA,'
      '      CL.CLIE_GENE_TGEN_ID_PRACA,'
      '      CL.CLIE_GENE_ID_PRACA,'
      '      CL.CLIE_GENE_EMPR_ID_ROTA,'
      '      CL.CLIE_GENE_TGEN_ID_ROTA,'
      '      CL.CLIE_GENE_ID_ROTA,'
      '      CL.CLIE_RG,'
      '      CL.CLIE_TIPO,'
      '      CL.CLIE_CNPJ_CPF,'
      '      CL.CLIE_USER_ID_VENDEDOR,'
      '      CL.CLIE_SITE,'
      '      CL.CLIE_EMAIL,'
      '      CL.CLIE_ATIVO,'
      '      CL.CLIE_TELEFONE1,'
      '      CL.CLIE_TELEFONE2,'
      '      CL.CLIE_TELEFONE3,'
      '      CL.CLIE_TELEFONE4,'
      '      CL.CLIE_OBS,'
      '      CL.CLIE_LIMITE_CREDITO,'
      '      CL.CLIE_ACEITA_ULT_LIMITE_CRED,'
      '      CL.CLIE_TIPO_VENDA,'
      '      CL.CLIE_TIPO_CLIENTE,'
      '      CL.CLIE_BLOQUEAR_ATENDIMENTO,'
      '      CL.CLIE_DTA_ATENDIMENTO,'
      '      CL.CLIE_USER_ID_ATENDENTE,'
      '      CL.CLIE_REFERENCIA,'
      '      CL.CLIE_DT_NASCIMENTO,'
      '      CL.CLIE_GLAUCOMA,'
      '      CL.CLIE_DEPRESSAO,'
      '      CL.CLIE_EPILEPSIA,'
      '      CL.CLIE_MARCA_PASSO,'
      '      CL.CLIE_HIPERTENSAO,'
      '      CL.CLIE_HEPATITE,'
      '      CL.CLIE_HEPATITE_TIPO,'
      '      CL.CLIE_DIABETES,'
      '      CL.CLIE_DIABETES_TIPO,'
      '      CL.CLIE_CANCER,'
      '      CL.CLIE_HIV,'
      '      CL.CLIE_ALCOOLIZADO,'
      '      CL.CLIE_GRAVIDA,'
      '      CL.CLIE_ALERGICO_METAIS_PIGMETO,'
      '      CL.CLIE_PROBLEMAS_PELE,'
      '      CL.CLIE_UTILIZOU_ANESTESIA,'
      '      CL.CLIE_TEMPO_ANESTESIA,'
      '      CL.CLIE_NIVEL_ANESTESIA,'
      '      CL.CLIE_DTA_CADASTRO,'
      '      CL.CLIE_USER_ID,'
      '      PR.GENE_DESCR               AS CIDADE,'
      '      PR.GENE_PAR1                AS UF,'
      '      VD.USER_NOME_COMPLETO       AS VENDEDOR,'
      '      RT.GENE_DESCR               AS ROTA,'
      '      RT.GENE_PAR1                AS KM_FINAL,'
      '      RT.GENE_NUMERIC1            AS VLR_FRETE,'
      '      RG.GENE_ID                  AS REGIAO_ID,'
      '      RG.GENE_DESCR               AS REGIAO,'
      '      RG.GENE_PAR1                AS AREA_TOTAL'
      'FROM  CLIENTES CL'
      'INNER JOIN GENERICA PR'
      'ON (PR.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_PRACA'
      'AND PR.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_PRACA'
      'AND PR.GENE_ID        = CL.CLIE_GENE_ID_PRACA)'
      'LEFT OUTER JOIN USUARIO VD'
      'ON (VD.USER_ID        = CL.CLIE_USER_ID_VENDEDOR)'
      'LEFT OUTER JOIN GENERICA RT'
      'ON (RT.GENE_EMPR_ID   = CL.CLIE_GENE_EMPR_ID_ROTA'
      'AND RT.GENE_TGEN_ID   = CL.CLIE_GENE_TGEN_ID_ROTA'
      'AND RT.GENE_ID        = CL.CLIE_GENE_ID_ROTA)'
      'LEFT OUTER JOIN GENERICA RG'
      'ON (RG.GENE_EMPR_ID   = RT.GENE_GENE_EMPR_ID_PROP'
      'AND RG.GENE_TGEN_ID   = RT.GENE_GENE_TGEN_ID_PROP'
      'AND RG.GENE_ID        = RT.GENE_GENE_ID_PROD)'
      'WHERE CL.CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 48
    Top = 32
    object qryClientesCLIE_ID: TIntegerField
      FieldName = 'CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesCLIE_EMPR_ID: TIntegerField
      FieldName = 'CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesCLIE_RAZAO_SOCIAL: TStringField
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object qryClientesCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryClientesCLIE_CEP: TStringField
      FieldName = 'CLIE_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryClientesCLIE_ENDERECO: TStringField
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object qryClientesCLIE_BAIRRO: TStringField
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_RG: TStringField
      FieldName = 'CLIE_RG'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO: TStringField
      FieldName = 'CLIE_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryClientesCLIE_CNPJ_CPF: TStringField
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object qryClientesCLIE_USER_ID_VENDEDOR: TIntegerField
      FieldName = 'CLIE_USER_ID_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_SITE: TStringField
      FieldName = 'CLIE_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCLIE_EMAIL: TStringField
      FieldName = 'CLIE_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCLIE_ATIVO: TIntegerField
      FieldName = 'CLIE_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_TELEFONE1: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object qryClientesCLIE_TELEFONE2: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryClientesCLIE_TELEFONE3: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryClientesCLIE_TELEFONE4: TStringField
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qryClientesCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryClientesCLIE_LIMITE_CREDITO: TFMTBCDField
      FieldName = 'CLIE_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField
      FieldName = 'CLIE_ACEITA_ULT_LIMITE_CRED'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO_VENDA: TIntegerField
      FieldName = 'CLIE_TIPO_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_TIPO_CLIENTE: TIntegerField
      FieldName = 'CLIE_TIPO_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_REFERENCIA: TStringField
      FieldName = 'CLIE_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qryClientesCLIE_DTA_CADASTRO: TDateField
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCLIE_USER_ID: TIntegerField
      FieldName = 'CLIE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object qryClientesROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesKM_FINAL: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'KM_FINAL'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesVLR_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'VLR_FRETE'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object qryClientesREGIAO_ID: TIntegerField
      FieldName = 'REGIAO_ID'
      ProviderFlags = []
      Visible = False
    end
    object qryClientesREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesAREA_TOTAL: TStringField
      DisplayLabel = #193'rea Total (KM)'
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Size = 250
    end
    object qryClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField
      FieldName = 'CLIE_BLOQUEAR_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_DTA_ATENDIMENTO: TDateField
      FieldName = 'CLIE_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'CLIE_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCLIE_DT_NASCIMENTO: TDateField
      FieldName = 'CLIE_DT_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_GLAUCOMA: TIntegerField
      FieldName = 'CLIE_GLAUCOMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_DEPRESSAO: TIntegerField
      FieldName = 'CLIE_DEPRESSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_EPILEPSIA: TIntegerField
      FieldName = 'CLIE_EPILEPSIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_MARCA_PASSO: TIntegerField
      FieldName = 'CLIE_MARCA_PASSO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_HIPERTENSAO: TIntegerField
      FieldName = 'CLIE_HIPERTENSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_HEPATITE: TIntegerField
      FieldName = 'CLIE_HEPATITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_HEPATITE_TIPO: TStringField
      FieldName = 'CLIE_HEPATITE_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
    object qryClientesCLIE_DIABETES: TIntegerField
      FieldName = 'CLIE_DIABETES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_DIABETES_TIPO: TStringField
      FieldName = 'CLIE_DIABETES_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
    object qryClientesCLIE_CANCER: TIntegerField
      FieldName = 'CLIE_CANCER'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_HIV: TIntegerField
      FieldName = 'CLIE_HIV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_ALCOOLIZADO: TIntegerField
      FieldName = 'CLIE_ALCOOLIZADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_GRAVIDA: TIntegerField
      FieldName = 'CLIE_GRAVIDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_ALERGICO_METAIS_PIGMETO: TIntegerField
      FieldName = 'CLIE_ALERGICO_METAIS_PIGMETO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_PROBLEMAS_PELE: TIntegerField
      FieldName = 'CLIE_PROBLEMAS_PELE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_UTILIZOU_ANESTESIA: TIntegerField
      FieldName = 'CLIE_UTILIZOU_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_TEMPO_ANESTESIA: TTimeField
      FieldName = 'CLIE_TEMPO_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qryClientesCLIE_NIVEL_ANESTESIA: TIntegerField
      FieldName = 'CLIE_NIVEL_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 80
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspClientes'
    BeforePost = cdsClientesBeforePost
    BeforeDelete = cdsClientesBeforeDelete
    OnNewRecord = cdsClientesNewRecord
    OnReconcileError = cdsClientesReconcileError
    Left = 48
    Top = 128
    object cdsClientesCLIE_DT_NASCIMENTO: TDateField
      FieldName = 'CLIE_DT_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesCLIE_EMPR_ID: TIntegerField
      FieldName = 'CLIE_EMPR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'CLIE_RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsClientesCLIE_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'CLIE_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsClientesCLIE_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CLIE_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '##.###-###'
      FixedChar = True
      Size = 10
    end
    object cdsClientesCLIE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIE_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsClientesCLIE_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CLIE_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_ID_PRACA: TIntegerField
      FieldName = 'CLIE_GENE_ID_PRACA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_GENE_EMPR_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_EMPR_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GENE_TGEN_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_TGEN_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GENE_ID_ROTA: TIntegerField
      FieldName = 'CLIE_GENE_ID_ROTA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_RG: TStringField
      DisplayLabel = 'CIC/RG'
      FieldName = 'CLIE_RG'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCLIE_TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'CLIE_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLIE_CNPJ_CPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CLIE_CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsClientesCLIE_USER_ID_VENDEDOR: TIntegerField
      FieldName = 'CLIE_USER_ID_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_SITE: TStringField
      FieldName = 'CLIE_SITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsClientesCLIE_EMAIL: TStringField
      FieldName = 'CLIE_EMAIL'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cdsClientesCLIE_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'CLIE_ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClientesCLIE_TELEFONE1: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE2: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE3: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE3'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLIE_TELEFONE4: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'CLIE_TELEFONE4'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLIE_OBS: TBlobField
      FieldName = 'CLIE_OBS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object cdsClientesCLIE_LIMITE_CREDITO: TFMTBCDField
      DisplayLabel = 'Limite Cr'#233'd.'
      FieldName = 'CLIE_LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsClientesCLIE_ACEITA_ULT_LIMITE_CRED: TIntegerField
      FieldName = 'CLIE_ACEITA_ULT_LIMITE_CRED'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TIPO_VENDA: TIntegerField
      FieldName = 'CLIE_TIPO_VENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TIPO_CLIENTE: TIntegerField
      FieldName = 'CLIE_TIPO_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_REFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'CLIE_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsClientesCLIE_DTA_CADASTRO: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'CLIE_DTA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 250
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 250
    end
    object cdsClientesVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Visible = False
      Size = 100
    end
    object cdsClientesROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesKM_FINAL: TStringField
      DisplayLabel = 'KM (Final)'
      FieldName = 'KM_FINAL'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesVLR_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'VLR_FRETE'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 18
      Size = 4
    end
    object cdsClientesREGIAO_ID: TIntegerField
      FieldName = 'REGIAO_ID'
      ProviderFlags = []
      Visible = False
    end
    object cdsClientesREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesAREA_TOTAL: TStringField
      DisplayLabel = #193'rea Total (KM)'
      FieldName = 'AREA_TOTAL'
      ProviderFlags = []
      Visible = False
      Size = 250
    end
    object cdsClientesCLIE_USER_ID: TIntegerField
      FieldName = 'CLIE_USER_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsClientesCLIE_BLOQUEAR_ATENDIMENTO: TIntegerField
      FieldName = 'CLIE_BLOQUEAR_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_DTA_ATENDIMENTO: TDateField
      FieldName = 'CLIE_DTA_ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_USER_ID_ATENDENTE: TIntegerField
      FieldName = 'CLIE_USER_ID_ATENDENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GLAUCOMA: TIntegerField
      FieldName = 'CLIE_GLAUCOMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_DEPRESSAO: TIntegerField
      FieldName = 'CLIE_DEPRESSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_EPILEPSIA: TIntegerField
      FieldName = 'CLIE_EPILEPSIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_MARCA_PASSO: TIntegerField
      FieldName = 'CLIE_MARCA_PASSO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_HIPERTENSAO: TIntegerField
      FieldName = 'CLIE_HIPERTENSAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_HEPATITE: TIntegerField
      FieldName = 'CLIE_HEPATITE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_HEPATITE_TIPO: TStringField
      FieldName = 'CLIE_HEPATITE_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
    object cdsClientesCLIE_DIABETES: TIntegerField
      FieldName = 'CLIE_DIABETES'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_DIABETES_TIPO: TStringField
      FieldName = 'CLIE_DIABETES_TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 25
    end
    object cdsClientesCLIE_CANCER: TIntegerField
      FieldName = 'CLIE_CANCER'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_HIV: TIntegerField
      FieldName = 'CLIE_HIV'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_ALCOOLIZADO: TIntegerField
      FieldName = 'CLIE_ALCOOLIZADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_GRAVIDA: TIntegerField
      FieldName = 'CLIE_GRAVIDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_ALERGICO_METAIS_PIGMETO: TIntegerField
      FieldName = 'CLIE_ALERGICO_METAIS_PIGMETO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_PROBLEMAS_PELE: TIntegerField
      FieldName = 'CLIE_PROBLEMAS_PELE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_UTILIZOU_ANESTESIA: TIntegerField
      FieldName = 'CLIE_UTILIZOU_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsClientesCLIE_TEMPO_ANESTESIA: TTimeField
      FieldName = 'CLIE_TEMPO_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '##:##'
    end
    object cdsClientesCLIE_NIVEL_ANESTESIA: TIntegerField
      FieldName = 'CLIE_NIVEL_ANESTESIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 48
    Top = 176
  end
  object qryHistorico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CASE AGEN.AGEN_STATUS'
      '            WHEN '#39'A'#39' THEN '#39'Agendado'#39
      '            WHEN '#39'O'#39' THEN '#39'Confirmado'#39
      '            WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '            WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '            WHEN '#39'B'#39' THEN '#39'Bloqueado'#39
      '       END                         AS ORIGEM,'
      '       AGEN.AGEN_ID                AS CODIGO,'
      '       AGEN.AGEN_DATA              AS DATA,'
      '       AGEN.AGEN_HORA              AS HORA,'
      '       USUR.USER_NOME_COMPLETO     AS PROFISSIONAL,'
      '       TPRC.TPRC_DESCRICAO         AS TABELA,'
      '       COALESCE((SELECT FIRST 1 PR.PROD_DESCRICAO'
      '                   FROM ORDEM_SERVICO_ITENS'
      '                   JOIN PRODUTOS            PR'
      '                     ON PR.PROD_ID          = ODIT_TPIT_PROD_ID'
      
        '                    AND PR.PROD_EMPR_ID     = ODIT_TPIT_PROD_EMP' +
        'R_ID'
      '                  WHERE ODIT_EMPR_ID        = AGEN.AGEN_EMPR_ID'
      '                    AND ODIT_ORDS_ID        = AGEN.AGEN_ORDS_ID'
      
        '                    AND ODIT_ORDS_EMPR_ID   = AGEN.AGEN_ORDS_EMP' +
        'R_ID'
      '                  ORDER BY ODIT_VLR_TOTAL),'
      '       '#39'NENHUM PRODUTO INFORMADO'#39') AS PRODUTO,'
      '       AGEN.AGEN_VLR_TOTAL         AS TOTAL,'
      '       AGEN.AGEN_STATUS'
      '  FROM CLIENTES                    CLIE'
      '  JOIN AGENDA                      AGEN'
      '    ON AGEN_CLIE_ID                = CLIE_ID'
      '   AND AGEN_CLIE_EMPR_ID           = CLIE_EMPR_ID'
      '  JOIN USUARIO                     USUR'
      '    ON USUR.USER_ID                = AGEN.AGEN_USER_ID_ATENDENTE'
      '  JOIN TABELA_PRECO                TPRC'
      '    ON TPRC.TPRC_ID                = AGEN.AGEN_TPRC_ID'
      '   AND TPRC.TPRC_EMPR_ID           = AGEN.AGEN_TPRC_EMPR_ID'
      ' WHERE CLIE.CLIE_ID                = :CLIE_ID'
      '   AND CLIE.CLIE_EMPR_ID           = :EMPR_ID'
      '   AND AGEN.AGEN_STATUS            <> '#39'B'#39
      ' ORDER BY'
      '       AGEN.AGEN_DATA DESC,'
      '       AGEN.AGEN_HORA DESC,'
      '       AGEN.AGEN_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 144
    Top = 32
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 80
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistorico'
    Left = 144
    Top = 128
    object cdsHistoricoORIGEM: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 12
    end
    object cdsHistoricoCODIGO: TIntegerField
      DisplayLabel = 'Nr'#186' Agenda'
      DisplayWidth = 7
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsHistoricoDATA: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATA'
      Required = True
    end
    object cdsHistoricoHORA: TStringField
      DisplayLabel = 'Hora'
      DisplayWidth = 10
      FieldName = 'HORA'
      Required = True
      Size = 5
    end
    object cdsHistoricoPROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      DisplayWidth = 26
      FieldName = 'PROFISSIONAL'
      Size = 75
    end
    object cdsHistoricoTABELA: TStringField
      DisplayLabel = 'Tab. Pre'#231'o'
      DisplayWidth = 17
      FieldName = 'TABELA'
      Required = True
      Size = 75
    end
    object cdsHistoricoPRODUTO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 29
      FieldName = 'PRODUTO'
      Size = 75
    end
    object cdsHistoricoTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      DisplayWidth = 10
      FieldName = 'TOTAL'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsHistoricoAGEN_STATUS: TStringField
      FieldName = 'AGEN_STATUS'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 144
    Top = 176
  end
  object qryFinanceiro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CAST(CREC.CREC_ID AS VARCHAR(15)) AS CREC_NR_DOC,'
      '       CREC.CREC_PROVENIENTE,'
      '       CLIE.CLIE_FANTASIA,'
      '       PLCT.PLCT_DESCRICAO,'
      '       CREC.CREC_DTA_EMISSAO,'
      '       CREC.CREC_DTA_VCTO,'
      '       CREC.CREC_DTA_PGTO,'
      '       CREC.CREC_VALOR_DOC,'
      '       CREC.CREC_STATUS,'
      '       CASE CREC.CREC_STATUS'
      '            WHEN '#39'A'#39' THEN '#39'Aberto'#39
      '            WHEN '#39'F'#39' THEN '#39'Fechado'#39
      '            WHEN '#39'C'#39' THEN '#39'Cancelado'#39
      '       END                    AS STATUS'
      '  FROM CONTAS_RECEBER         CREC'
      '  JOIN CLIENTES               CLIE'
      '    ON CLIE_ID                = CREC_CLIE_ID'
      '   AND CLIE_EMPR_ID           = CREC_CLIE_EMPR_ID'
      '  JOIN PLANO_CONTAS           PLCT'
      '    ON PLCT.PLCT_ID           = CREC.CREC_PLCT_ID'
      '   AND PLCT.PLCT_EMPR_ID      = CREC.CREC_PLCT_EMPR_ID'
      ' WHERE CREC.CREC_CLIE_ID      = :CLIE_ID'
      '   AND CREC.CREC_CLIE_EMPR_ID = :EMPR_ID')
    SQLConnection = dmConexao.dbConexao
    Left = 232
    Top = 32
  end
  object dspFinanceiro: TDataSetProvider
    DataSet = qryFinanceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 80
  end
  object cdsFinanceiro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFinanceiro'
    Left = 232
    Top = 128
    object cdsFinanceiroSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object cdsFinanceiroCREC_NR_DOC: TStringField
      DisplayLabel = 'Nr'#186' Doc.'
      DisplayWidth = 14
      FieldName = 'CREC_NR_DOC'
    end
    object cdsFinanceiroCREC_PROVENIENTE: TStringField
      DisplayLabel = 'Proveniente'
      DisplayWidth = 25
      FieldName = 'CREC_PROVENIENTE'
      Required = True
      Size = 75
    end
    object cdsFinanceiroPLCT_DESCRICAO: TStringField
      DisplayLabel = 'Plano de Contas'
      DisplayWidth = 28
      FieldName = 'PLCT_DESCRICAO'
      Required = True
      Size = 75
    end
    object cdsFinanceiroCREC_DTA_EMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      DisplayWidth = 13
      FieldName = 'CREC_DTA_EMISSAO'
      Required = True
    end
    object cdsFinanceiroCREC_DTA_VCTO: TDateField
      DisplayLabel = 'Dt. Vencto'
      DisplayWidth = 13
      FieldName = 'CREC_DTA_VCTO'
      Required = True
    end
    object cdsFinanceiroCREC_DTA_PGTO: TDateField
      DisplayLabel = 'Dt. Pagto'
      DisplayWidth = 13
      FieldName = 'CREC_DTA_PGTO'
    end
    object cdsFinanceiroCREC_VALOR_DOC: TFMTBCDField
      DisplayLabel = 'Vlr. Doc.'
      DisplayWidth = 14
      FieldName = 'CREC_VALOR_DOC'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsFinanceiroCLIE_FANTASIA: TStringField
      FieldName = 'CLIE_FANTASIA'
      Visible = False
      Size = 75
    end
    object cdsFinanceiroCREC_STATUS: TStringField
      FieldName = 'CREC_STATUS'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsFinanceiro: TDataSource
    DataSet = cdsFinanceiro
    Left = 232
    Top = 176
  end
  object qryOrdemServico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CASE OS.ORDS_STATUS'
      '            WHEN 0 THEN '#39'Agendado'#39
      '            WHEN 1 THEN '#39'O.S. Real.'#39
      '            WHEN 2 THEN '#39'O.S. Pago'#39
      '            WHEN 3 THEN '#39'O.S. Cancel.'#39
      '       END                                  AS STATUS,'
      '       OS.ORDS_ID,'
      '       OS.ORDS_DTA_INSTALACAO,'
      '       OS.ORDS_STATUS,'
      '       OS.ORDS_VLR_TOTAL_OS,'
      '       TP.TPRC_DESCRICAO,'
      '       OT.GENE_DESCR TIPO_OS,'
      '       US.USER_NOME_COMPLETO,'
      '       PR.PROD_DESCRICAO,'
      '       UN.GENE_PAR1                         AS PROD_UNIDADE,'
      '       PR.PROD_GARANTIA,'
      '       MC.GENE_DESCR MARCA_PROD,'
      '       MD.GENE_DESCR MODELO_PROD,'
      '       FN.FORN_RAZAO_SOCIAL,'
      '       UC.USER_NOME_COMPLETO,'
      '       ST.GENE_DESCR                        AS STATUS_OS,'
      '       TA.GENE_DESCR                        AS TIPO_AGENDAMENTO'
      '  FROM ORDEM_SERVICO                        OS'
      '  JOIN CLIENTES                             CL'
      '    ON (OS.ORDS_CLIE_ID                     = CL.CLIE_ID'
      '   AND OS.ORDS_CLIE_EMPR_ID                 = CL.CLIE_EMPR_ID)'
      '  JOIN TABELA_PRECO                         TP'
      '    ON (OS.ORDS_TPRC_ID                     = TP.TPRC_ID'
      '   AND OS.ORDS_TPRC_EMPR_ID                 = TP.TPRC_EMPR_ID)'
      '  JOIN GENERICA                             OT'
      '    ON (OS.ORDS_GENE_EMPR_ID_TIPO_OS        = OT.GENE_EMPR_ID'
      '   AND OS.ORDS_GENE_TGEN_ID_TIPO_OS         = OT.GENE_TGEN_ID'
      '   AND OS.ORDS_GENE_ID_TIPO_OS              = OT.GENE_ID)'
      '  JOIN USUARIO                              US'
      '    ON (OS.ORDS_USER_ID_TEC                 = US.USER_ID)'
      '  JOIN PRODUTOS                             PR'
      '    ON (OS.ORDS_PROD_ID_EQUIP               = PR.PROD_ID'
      '   AND OS.ORDS_PROD_EMPR_ID_EQUIP           = PR.PROD_EMPR_ID)'
      '  JOIN GENERICA                             UN'
      
        '    ON (UN.GENE_EMPR_ID                     = PR.PROD_GENE_EMPR_' +
        'ID_UNID'
      
        '   AND UN.GENE_TGEN_ID                      = PR.PROD_GENE_TGEN_' +
        'ID_UNID'
      
        '   AND UN.GENE_ID                           = PR.PROD_GENE_ID_UN' +
        'ID)'
      '  JOIN GENERICA                             MC'
      '    ON (PR.PROD_GENE_EMPR_ID_MARCA          = MC.GENE_EMPR_ID'
      '   AND PR.PROD_GENE_TGEN_ID_MARCA           = MC.GENE_TGEN_ID'
      '   AND PR.PROD_GENE_ID_MARCA                = MC.GENE_ID)'
      '  JOIN GENERICA                             MD'
      '    ON (PR.PROD_GENE_EMPR_ID_MODELO         = MD.GENE_EMPR_ID'
      '   AND PR.PROD_GENE_TGEN_ID_MODELO          = MD.GENE_TGEN_ID'
      '   AND PR.PROD_GENE_ID_MODELO               = MD.GENE_ID)'
      '  LEFT OUTER JOIN FORNECEDORES              FN'
      '    ON (OS.ORDS_FORN_ID_EQUIP               = FN.FORN_ID)'
      '  LEFT OUTER JOIN USUARIO                   UC'
      '    ON (OS.ORDS_USER_ID_CANC                = UC.USER_ID)'
      '  LEFT OUTER JOIN GENERICA                  ST'
      
        '    ON (ST.GENE_EMPR_ID                     = OS.ORDS_GENE_EMPR_' +
        'ID_STATUS_OS'
      
        '   AND ST.GENE_TGEN_ID                      = OS.ORDS_GENE_TGEN_' +
        'ID_STATUS_OS'
      
        '   AND ST.GENE_ID                           = OS.ORDS_GENE_ID_ST' +
        'ATUS_OS)'
      '  JOIN GENERICA                             TA'
      
        '    ON (TA.GENE_EMPR_ID                     = OS.ORDS_GENE_EMPR_' +
        'ID_TP_AGEND'
      
        '   AND TA.GENE_TGEN_ID                      = OS.ORDS_GENE_TGEN_' +
        'ID_TP_AGEND'
      
        '   AND TA.GENE_ID                           = OS.ORDS_GENE_ID_TP' +
        '_AGEND)'
      ' WHERE OS.ORDS_EMPR_ID                      = :EMPR_ID'
      '   AND OS.ORDS_CLIE_ID                      = :CLIE_ID'
      '   AND OS.ORDS_CLIE_EMPR_ID                 = :EMPR_ID'
      ' ORDER BY'
      '       OS.ORDS_STATUS, OS.ORDS_ID DESC')
    SQLConnection = dmConexao.dbConexao
    Left = 320
    Top = 32
  end
  object dspOrdemServico: TDataSetProvider
    DataSet = qryOrdemServico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 80
  end
  object cdsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspOrdemServico'
    Left = 320
    Top = 128
    object cdsOrdemServicoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 12
    end
    object cdsOrdemServicoORDS_ID: TIntegerField
      DisplayLabel = 'Nr'#186' OS'
      FieldName = 'ORDS_ID'
      Required = True
    end
    object cdsOrdemServicoORDS_DTA_INSTALACAO: TDateField
      DisplayLabel = 'Dt. Execu'#231#227'o'
      FieldName = 'ORDS_DTA_INSTALACAO'
      Required = True
    end
    object cdsOrdemServicoORDS_STATUS: TIntegerField
      FieldName = 'ORDS_STATUS'
      Required = True
      Visible = False
    end
    object cdsOrdemServicoORDS_VLR_TOTAL_OS: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'ORDS_VLR_TOTAL_OS'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 4
    end
    object cdsOrdemServicoTPRC_DESCRICAO: TStringField
      DisplayLabel = 'Tab. Pre'#231'o'
      FieldName = 'TPRC_DESCRICAO'
      Required = True
      Size = 75
    end
    object cdsOrdemServicoTIPO_OS: TStringField
      DisplayLabel = 'Tipo de OS'
      FieldName = 'TIPO_OS'
      Size = 75
    end
    object cdsOrdemServicoUSER_NOME_COMPLETO: TStringField
      DisplayLabel = 'T'#233'cnico'
      FieldName = 'USER_NOME_COMPLETO'
      Size = 75
    end
    object cdsOrdemServicoPROD_DESCRICAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PROD_DESCRICAO'
      Required = True
      Size = 75
    end
    object cdsOrdemServicoPROD_UNIDADE: TStringField
      DisplayLabel = 'Unid.'
      FieldName = 'PROD_UNIDADE'
      Size = 75
    end
    object cdsOrdemServicoPROD_GARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'PROD_GARANTIA'
    end
    object cdsOrdemServicoMARCA_PROD: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_PROD'
      Size = 75
    end
    object cdsOrdemServicoMODELO_PROD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_PROD'
      Size = 75
    end
    object cdsOrdemServicoFORN_RAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN_RAZAO_SOCIAL'
      Size = 75
    end
    object cdsOrdemServicoUSER_NOME_COMPLETO_1: TStringField
      FieldName = 'USER_NOME_COMPLETO_1'
      Visible = False
      Size = 75
    end
    object cdsOrdemServicoSTATUS_OS: TStringField
      FieldName = 'STATUS_OS'
      Visible = False
      Size = 75
    end
    object cdsOrdemServicoTIPO_AGENDAMENTO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AGENDAMENTO'
      Size = 75
    end
  end
  object dsOrdemServico: TDataSource
    DataSet = cdsOrdemServico
    Left = 320
    Top = 176
  end
end
