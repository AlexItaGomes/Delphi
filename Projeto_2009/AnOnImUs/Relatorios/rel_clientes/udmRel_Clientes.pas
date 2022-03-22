unit udmRel_Clientes;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Clientes = class(TDataModule)
    qryRel_Clientes: TSQLQuery;
    dspRel_Clientes: TDataSetProvider;
    cdsRel_Clientes: TClientDataSet;
    dsRel_Clientes: TDataSource;
    cdsRel_ClientesCLIE_ID: TIntegerField;
    cdsRel_ClientesCLIE_EMPR_ID: TIntegerField;
    cdsRel_ClientesCLIE_RAZAO_SOCIAL: TStringField;
    cdsRel_ClientesCLIE_FANTASIA: TStringField;
    cdsRel_ClientesCLIE_CEP: TStringField;
    cdsRel_ClientesCLIE_ENDERECO: TStringField;
    cdsRel_ClientesCLIE_BAIRRO: TStringField;
    cdsRel_ClientesCLIE_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsRel_ClientesCLIE_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsRel_ClientesCLIE_GENE_ID_PRACA: TIntegerField;
    cdsRel_ClientesCLIE_RG: TStringField;
    cdsRel_ClientesCLIE_TIPO: TStringField;
    cdsRel_ClientesCLIE_CNPJ_CPF: TStringField;
    cdsRel_ClientesCLIE_SITE: TStringField;
    cdsRel_ClientesCLIE_EMAIL: TStringField;
    cdsRel_ClientesCLIE_ATIVO: TIntegerField;
    cdsRel_ClientesCLIE_TELEFONE1: TStringField;
    cdsRel_ClientesCLIE_TELEFONE2: TStringField;
    cdsRel_ClientesCLIE_TELEFONE3: TStringField;
    cdsRel_ClientesCLIE_TELEFONE4: TStringField;
    cdsRel_ClientesCLIE_DTA_CADASTRO: TDateField;
    cdsRel_ClientesCLIE_USER_ID: TIntegerField;
    cdsRel_ClientesGENE_DESCR: TStringField;
    cdsRel_ClientesGENE_PAR1: TStringField;
    cdsRel_ClientesATIVO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Clientes: TdmRel_Clientes;

implementation

{$R *.dfm}

procedure TdmRel_Clientes.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

initialization
  if dmRel_Clientes = nil then
    dmRel_Clientes := TdmRel_Clientes.Create(nil);

finalization
  FreeAndNil(dmRel_Clientes);

end.
