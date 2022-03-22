unit udmRel_Fornecedores;

interface

uses
  SysUtils, Classes, SQLExpr, Forms, Funcoes, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Fornecedores = class(TDataModule)
    qryRel_Fornecedores: TSQLQuery;
    dspRel_Fornecedores: TDataSetProvider;
    cdsRel_Fornecedores: TClientDataSet;
    dsRel_Fornecedores: TDataSource;
    cdsRel_FornecedoresFORN_ID: TIntegerField;
    cdsRel_FornecedoresFORN_RAZAO_SOCIAL: TStringField;
    cdsRel_FornecedoresFORN_NOME_FANTASIA: TStringField;
    cdsRel_FornecedoresFORN_CNPJ_CPF: TStringField;
    cdsRel_FornecedoresFORN_IE: TStringField;
    cdsRel_FornecedoresFORN_CEP: TStringField;
    cdsRel_FornecedoresFORN_ENDERECO: TStringField;
    cdsRel_FornecedoresFORN_BAIRRO: TStringField;
    cdsRel_FornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsRel_FornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsRel_FornecedoresFORN_GENE_ID_PRACA: TIntegerField;
    cdsRel_FornecedoresFORN_CONTATO: TStringField;
    cdsRel_FornecedoresFORN_TELEFONE: TStringField;
    cdsRel_FornecedoresFORN_FAX: TStringField;
    cdsRel_FornecedoresFORN_SITE: TStringField;
    cdsRel_FornecedoresFORN_EMAIL: TStringField;
    cdsRel_FornecedoresFORN_ATIVO: TIntegerField;
    cdsRel_FornecedoresFORN_TIPO: TStringField;
    cdsRel_FornecedoresFORN_DTA_CADASTRO: TDateField;
    cdsRel_FornecedoresFORN_USER_ID: TIntegerField;
    cdsRel_FornecedoresATIVO: TStringField;
    CIDA: TStringField;
    cdsRel_FornecedoresUF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Fornecedores: TdmRel_Fornecedores;

implementation

{$R *.dfm}

procedure TdmRel_Fornecedores.DataModuleCreate(Sender: TObject);
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

end.
