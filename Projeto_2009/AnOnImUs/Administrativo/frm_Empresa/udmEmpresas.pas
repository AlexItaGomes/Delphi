unit udmEmpresas;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmEmpresas = class(TDataModule)
    qryEmpresas: TSQLQuery;
    dspEmpresas: TDataSetProvider;
    dsEmpresas: TDataSource;
    cdsEmpresas: TClientDataSet;
    qryEmpresasEMPR_ID: TIntegerField;
    qryEmpresasEMPR_NOME_FANTASIA: TStringField;
    qryEmpresasEMPR_RAZAO_SOCIAL: TStringField;
    qryEmpresasEMPR_ATIVO: TIntegerField;
    qryEmpresasEMPR_CNPJ: TStringField;
    qryEmpresasEMPR_IE: TStringField;
    qryEmpresasEMPR_CEP: TStringField;
    qryEmpresasEMPR_ENDERECO: TStringField;
    qryEmpresasEMPR_NR_ENDERECO: TIntegerField;
    qryEmpresasEMPR_BAIRRO: TStringField;
    qryEmpresasEMPR_COMPLEMENTO: TStringField;
    qryEmpresasEMPR_GENE_EMPR_ID_PRACA: TIntegerField;
    qryEmpresasEMPR_GENE_TGEN_ID_PRACA: TIntegerField;
    qryEmpresasEMPR_GENE_ID_PRACA: TIntegerField;
    qryEmpresasEMPR_TELEFONE: TStringField;
    qryEmpresasEMPR_FAX: TStringField;
    qryEmpresasEMPR_SITE: TStringField;
    qryEmpresasEMPR_EMAIL: TStringField;
    qryEmpresasEMPR_LOGOTIPO: TBlobField;
    qryEmpresasEMPR_DTA_CADASTRO: TDateField;
    qryEmpresasEMPR_USER_ID: TIntegerField;
    qryEmpresasCIDADE: TStringField;
    qryEmpresasUF: TStringField;
    cdsEmpresasEMPR_ATIVO: TIntegerField;
    cdsEmpresasEMPR_ID: TIntegerField;
    cdsEmpresasEMPR_RAZAO_SOCIAL: TStringField;
    cdsEmpresasEMPR_NOME_FANTASIA: TStringField;
    cdsEmpresasEMPR_DTA_CADASTRO: TDateField;
    cdsEmpresasEMPR_CNPJ: TStringField;
    cdsEmpresasEMPR_IE: TStringField;
    cdsEmpresasEMPR_CEP: TStringField;
    cdsEmpresasEMPR_ENDERECO: TStringField;
    cdsEmpresasEMPR_NR_ENDERECO: TIntegerField;
    cdsEmpresasEMPR_BAIRRO: TStringField;
    cdsEmpresasCIDADE: TStringField;
    cdsEmpresasUF: TStringField;
    cdsEmpresasEMPR_COMPLEMENTO: TStringField;
    cdsEmpresasEMPR_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsEmpresasEMPR_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsEmpresasEMPR_GENE_ID_PRACA: TIntegerField;
    cdsEmpresasEMPR_TELEFONE: TStringField;
    cdsEmpresasEMPR_FAX: TStringField;
    cdsEmpresasEMPR_SITE: TStringField;
    cdsEmpresasEMPR_EMAIL: TStringField;
    cdsEmpresasEMPR_LOGOTIPO: TBlobField;
    cdsEmpresasEMPR_USER_ID: TIntegerField;
    qryEmpresasEMPR_INSC_MUNICIPAL: TStringField;
    cdsEmpresasEMPR_INSC_MUNICIPAL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsEmpresasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsEmpresasNewRecord(DataSet: TDataSet);
    procedure cdsEmpresasBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmEmpresas: TdmEmpresas;

implementation

{$R *.dfm}

procedure TdmEmpresas.cdsEmpresasBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('EMPRESAS',cdsEmpresasEMPR_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmEmpresas.cdsEmpresasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('EMPR_ID').AsString                   := funcLocal.ObterSequencia('EMPRESAS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('EMPR_ATIVO').AsInteger               := 1;
  DataSet.FieldByName('EMPR_GENE_EMPR_ID_PRACA').AsInteger  := 0;
  DataSet.FieldByName('EMPR_GENE_TGEN_ID_PRACA').AsInteger  := 501;
  DataSet.FieldByName('EMPR_USER_ID').AsInteger             := funcLocal.User_ID;
  DataSet.FieldByName('EMPR_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(funcLocal.Conexao);
end;

procedure TdmEmpresas.cdsEmpresasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmEmpresas','cdsEmpresasReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmEmpresas.DataModuleCreate(Sender: TObject);
var
  intI      : Integer;
  formPrinc : TForm;
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
  if dmEmpresas = nil then
    dmEmpresas := TdmEmpresas.Create(nil);
finalization
  FreeAndNil(dmEmpresas);

end.
