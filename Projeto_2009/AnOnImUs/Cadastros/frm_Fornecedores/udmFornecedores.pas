unit udmFornecedores;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Forms, Funcoes;

type
  TdmFornecedores = class(TDataModule)
    qryFornecedores: TSQLQuery;
    dspFornecedores: TDataSetProvider;
    cdsFornecedores: TClientDataSet;
    dsFornecedores: TDataSource;
    qryFornecedoresFORN_ID: TIntegerField;
    qryFornecedoresFORN_RAZAO_SOCIAL: TStringField;
    qryFornecedoresFORN_NOME_FANTASIA: TStringField;
    qryFornecedoresFORN_CNPJ_CPF: TStringField;
    qryFornecedoresFORN_IE: TStringField;
    qryFornecedoresFORN_CEP: TStringField;
    qryFornecedoresFORN_ENDERECO: TStringField;
    qryFornecedoresFORN_BAIRRO: TStringField;
    qryFornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField;
    qryFornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField;
    qryFornecedoresFORN_GENE_ID_PRACA: TIntegerField;
    qryFornecedoresFORN_CONTATO: TStringField;
    qryFornecedoresFORN_TELEFONE: TStringField;
    qryFornecedoresFORN_FAX: TStringField;
    qryFornecedoresFORN_SITE: TStringField;
    qryFornecedoresFORN_EMAIL: TStringField;
    qryFornecedoresFORN_ATIVO: TIntegerField;
    qryFornecedoresFORN_TIPO: TStringField;
    qryFornecedoresFORN_DTA_CADASTRO: TDateField;
    qryFornecedoresFORN_USER_ID: TIntegerField;
    qryFornecedoresCIDADE: TStringField;
    qryFornecedoresUF: TStringField;
    cdsFornecedoresFORN_ID: TIntegerField;
    cdsFornecedoresFORN_RAZAO_SOCIAL: TStringField;
    cdsFornecedoresFORN_NOME_FANTASIA: TStringField;
    cdsFornecedoresFORN_CNPJ_CPF: TStringField;
    cdsFornecedoresFORN_IE: TStringField;
    cdsFornecedoresFORN_CEP: TStringField;
    cdsFornecedoresFORN_ENDERECO: TStringField;
    cdsFornecedoresFORN_BAIRRO: TStringField;
    cdsFornecedoresFORN_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsFornecedoresFORN_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsFornecedoresFORN_GENE_ID_PRACA: TIntegerField;
    cdsFornecedoresFORN_CONTATO: TStringField;
    cdsFornecedoresFORN_SITE: TStringField;
    cdsFornecedoresFORN_EMAIL: TStringField;
    cdsFornecedoresFORN_ATIVO: TIntegerField;
    cdsFornecedoresFORN_TIPO: TStringField;
    cdsFornecedoresFORN_DTA_CADASTRO: TDateField;
    cdsFornecedoresFORN_USER_ID: TIntegerField;
    cdsFornecedoresCIDADE: TStringField;
    cdsFornecedoresUF: TStringField;
    qryPesq_Praca: TSQLQuery;
    dspPesq_Praca: TDataSetProvider;
    cdsPesq_Praca: TClientDataSet;
    cdsPesq_PracaGENE_ID: TIntegerField;
    cdsPesq_PracaGENE_DESCR: TStringField;
    cdsPesq_PracaGENE_PAR1: TStringField;
    dsPesq_Praca: TDataSource;
    cdsFornecedoresFORN_TELEFONE: TStringField;
    cdsFornecedoresFORN_FAX: TStringField;
    qryFornecedoresFORN_OBS: TBlobField;
    cdsFornecedoresFORN_OBS: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsFornecedoresReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsFornecedoresNewRecord(DataSet: TDataSet);
    procedure cdsFornecedoresBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmFornecedores: TdmFornecedores;

implementation

{$R *.dfm}

procedure TdmFornecedores.cdsFornecedoresBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('FORNECEDORES',cdsFornecedoresFORN_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;

end;

procedure TdmFornecedores.cdsFornecedoresNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('FORN_ID').AsString                   := funcLocal.ObterSequencia('FORNECEDORES','0');
  DataSet.FieldByName('FORN_ATIVO').AsInteger               := 1;
  DataSet.FieldByName('FORN_GENE_EMPR_ID_PRACA').AsInteger  := 0;
  DataSet.FieldByName('FORN_GENE_TGEN_ID_PRACA').AsInteger  := 501;
  DataSet.FieldByName('FORN_TIPO').AsString                 := 'J';
  DataSet.FieldByName('FORN_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('FORN_USER_ID').AsInteger             := funcLocal.User_ID;
end;

procedure TdmFornecedores.cdsFornecedoresReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmFornecedores','cdsFornecedoresReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmFornecedores.DataModuleCreate(Sender: TObject);
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
  if dmFornecedores = nil then
    dmFornecedores := TdmFornecedores.Create(nil);
finalization
  FreeAndNil(dmFornecedores);

end.
