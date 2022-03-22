unit udmPracas;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmPracas = class(TDataModule)
    qryPracas: TSQLQuery;
    dspPracas: TDataSetProvider;
    cdsPracas: TClientDataSet;
    dsPracas: TDataSource;
    qryPracasGENE_EMPR_ID: TIntegerField;
    qryPracasGENE_TGEN_ID: TIntegerField;
    qryPracasGENE_ID: TIntegerField;
    qryPracasGENE_DESCR: TStringField;
    qryPracasGENE_COMENTARIO: TStringField;
    qryPracasGENE_NUMBER1: TIntegerField;
    qryPracasGENE_NUMBER2: TIntegerField;
    qryPracasGENE_NUMBER3: TIntegerField;
    qryPracasGENE_PAR1: TStringField;
    qryPracasGENE_PAR2: TStringField;
    qryPracasGENE_PAR3: TStringField;
    qryPracasGENE_USER_ID: TIntegerField;
    qryPracasGENE_DTA_CADASTRO: TDateField;
    qryPracasGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryPracasGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryPracasGENE_GENE_ID_PROD: TIntegerField;
    cdsPracasGENE_EMPR_ID: TIntegerField;
    cdsPracasGENE_TGEN_ID: TIntegerField;
    cdsPracasGENE_ID: TIntegerField;
    cdsPracasGENE_DESCR: TStringField;
    cdsPracasGENE_COMENTARIO: TStringField;
    cdsPracasGENE_NUMBER1: TIntegerField;
    cdsPracasGENE_NUMBER2: TIntegerField;
    cdsPracasGENE_NUMBER3: TIntegerField;
    cdsPracasGENE_PAR1: TStringField;
    cdsPracasGENE_PAR2: TStringField;
    cdsPracasGENE_PAR3: TStringField;
    cdsPracasGENE_USER_ID: TIntegerField;
    cdsPracasGENE_DTA_CADASTRO: TDateField;
    cdsPracasGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsPracasGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsPracasGENE_GENE_ID_PROD: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPracasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsPracasNewRecord(DataSet: TDataSet);
    procedure cdsPracasBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmPracas: TdmPracas;

implementation

{$R *.dfm}

procedure TdmPracas.cdsPracasBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('GENERICA',cdsPracasGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmPracas.cdsPracasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := 0;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 501;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('501','0',true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmPracas.cdsPracasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmPracas','cdsPracasReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmPracas.DataModuleCreate(Sender: TObject);
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
  if dmPracas = nil then
    dmPracas := TdmPracas.Create(nil);
finalization
  FreeAndNil(dmPracas);

end.
