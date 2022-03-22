object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 502
  Width = 794
  object dbConexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=D:\AnOnImUs.Info\DataBase\ANONIMUS.GDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 296
    Top = 112
  end
  object dbUpdate: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Desenv\Projetos_2009\AnOnImUs\DataBase\UPSYSTEM.GDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 360
    Top = 112
  end
  object qryRotinas: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      ROTI_CAMINHO,'
      '      ROTI_NOME_ARQUIVO,'
      '      ROTI_VERSAO_ARQUIVO,'
      '      ROTI_MD5,'
      '      ROTI_ARQUIVO'
      'FROM  ROTINAS'
      'ORDER BY'
      '      ROTI_CAMINHO,'
      '      ROTI_NOME_ARQUIVO')
    SQLConnection = dbUpdate
    Left = 360
    Top = 160
    object qryRotinasROTI_CAMINHO: TStringField
      FieldName = 'ROTI_CAMINHO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryRotinasROTI_NOME_ARQUIVO: TStringField
      FieldName = 'ROTI_NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryRotinasROTI_VERSAO_ARQUIVO: TStringField
      FieldName = 'ROTI_VERSAO_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryRotinasROTI_MD5: TStringField
      FieldName = 'ROTI_MD5'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryRotinasROTI_ARQUIVO: TBlobField
      FieldName = 'ROTI_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspRotinas: TDataSetProvider
    DataSet = qryRotinas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 208
  end
  object cdsRotinas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRotinas'
    Left = 360
    Top = 256
    object cdsRotinasROTI_CAMINHO: TStringField
      FieldName = 'ROTI_CAMINHO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsRotinasROTI_NOME_ARQUIVO: TStringField
      FieldName = 'ROTI_NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsRotinasROTI_VERSAO_ARQUIVO: TStringField
      FieldName = 'ROTI_VERSAO_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsRotinasROTI_MD5: TStringField
      FieldName = 'ROTI_MD5'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsRotinasROTI_ARQUIVO: TBlobField
      FieldName = 'ROTI_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
  end
end
