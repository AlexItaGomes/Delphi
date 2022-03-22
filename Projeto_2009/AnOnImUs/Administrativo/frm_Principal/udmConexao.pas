unit udmConexao;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms, System.IniFiles, System.Classes,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  Data.SqlExpr, Vcl.Dialogs;

const
  VConf_File   = 'AnOnImUs.ini';
  VConf_FileUP = 'AnOnImUsUP.ini';

type
  TdmConexao = class(TDataModule)
    dbConexao: TSQLConnection;
    dbUpdate: TSQLConnection;
    qryRotinas: TSQLQuery;
    qryRotinasROTI_CAMINHO: TStringField;
    qryRotinasROTI_NOME_ARQUIVO: TStringField;
    qryRotinasROTI_VERSAO_ARQUIVO: TStringField;
    qryRotinasROTI_MD5: TStringField;
    qryRotinasROTI_ARQUIVO: TBlobField;
    dspRotinas: TDataSetProvider;
    cdsRotinas: TClientDataSet;
    cdsRotinasROTI_CAMINHO: TStringField;
    cdsRotinasROTI_NOME_ARQUIVO: TStringField;
    cdsRotinasROTI_VERSAO_ARQUIVO: TStringField;
    cdsRotinasROTI_MD5: TStringField;
    cdsRotinasROTI_ARQUIVO: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
  private
    function Conectar(out strErro: String): Boolean;
  public
  end;

var
  dmConexao: TdmConexao;

implementation

uses
  ufPrincipal;

{$R *.dfm}
//{$WARN SYMBOL_DEPRECATED OFF}

function TdmConexao.Conectar(out strErro: String): Boolean;
var
  AnOn     : TIniFile;
  lstParam : TStringList;
begin
  Result   := true;
  try
    AnOn     := TIniFile.Create(ExtractFilePath(Application.ExeName)+VConf_File);
    lstParam := TStringList.Create;
    try
      with dbConexao,AnOn do begin
        Params.Clear;
        ReadSectionValues('DBConfig',lstParam);
        Params.Assign(lstParam);
        strErro             := ReadString('DBConfig','DataBase','');
        ConnectionName      := Trim(ReadString('DBParam','ConnectionName','FBConnection'));
        DriverName          := Trim(ReadString('DBParam','Driver','Firebird'));
        GetDriverFunc       := Trim(ReadString('DBParam','GetDriverFunc','getSQLDriverINTERBASE'));
        KeepConnection      := (ReadString('DBParam','KeepConnection','True') = 'True');
        LibraryName         := Trim(ReadString('DBParam','LibraryName','dbxfb.dll'));
        LoadParamsOnConnect := (ReadString('DBParam','LoadParamsOnConnected','False') = 'True');
        LoginPrompt         := (ReadString('DBParam','LoginPrompt','False') = 'True');
        VendorLib           := Trim(ReadString('DBParam','VendorLib','fbclient.dll'));
        Connected           := (ReadString('DBParam','Connected','True') = 'true');
        try
          dbConexao.Open;
        except on e: exception do begin
          ShowMessage(e.Message);
          Result  := false;
          Exit;
        end; end;
      end;
    except
      Result  := false;
      Exit;
    end;
  finally
    FreeAndNil(AnOn);
    FreeAndNil(lstParam);
  end;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var
  strErro : String;
begin
  if not Conectar(strErro) then begin
    fPrincipal.boolConect := false;
  end else begin
    fPrincipal.boolConect := true;
  end;
end;



end.
