unit udmTipo_Movimentacoes_Bancarias;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmTipos_Movimentacoes_Bancarias = class(TDataModule)
    qryTipos_Movimentacoes: TSQLQuery;
    dspTipos_Movimentacoes: TDataSetProvider;
    cdsTipos_Movimentacoes: TClientDataSet;
    dsTipos_Movimentacoes: TDataSource;
    qryTipos_MovimentacoesGENE_EMPR_ID: TIntegerField;
    qryTipos_MovimentacoesGENE_TGEN_ID: TIntegerField;
    qryTipos_MovimentacoesGENE_ID: TIntegerField;
    qryTipos_MovimentacoesGENE_DESCR: TStringField;
    qryTipos_MovimentacoesGENE_COMENTARIO: TStringField;
    qryTipos_MovimentacoesGENE_NUMBER1: TIntegerField;
    qryTipos_MovimentacoesGENE_NUMBER2: TIntegerField;
    qryTipos_MovimentacoesGENE_NUMBER3: TIntegerField;
    qryTipos_MovimentacoesGENE_PAR1: TStringField;
    qryTipos_MovimentacoesGENE_PAR2: TStringField;
    qryTipos_MovimentacoesGENE_PAR3: TStringField;
    qryTipos_MovimentacoesGENE_USER_ID: TIntegerField;
    qryTipos_MovimentacoesGENE_DTA_CADASTRO: TDateField;
    qryTipos_MovimentacoesGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryTipos_MovimentacoesGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryTipos_MovimentacoesGENE_GENE_ID_PROD: TIntegerField;
    cdsTipos_MovimentacoesGENE_EMPR_ID: TIntegerField;
    cdsTipos_MovimentacoesGENE_TGEN_ID: TIntegerField;
    cdsTipos_MovimentacoesGENE_ID: TIntegerField;
    cdsTipos_MovimentacoesGENE_DESCR: TStringField;
    cdsTipos_MovimentacoesGENE_COMENTARIO: TStringField;
    cdsTipos_MovimentacoesGENE_NUMBER1: TIntegerField;
    cdsTipos_MovimentacoesGENE_NUMBER2: TIntegerField;
    cdsTipos_MovimentacoesGENE_NUMBER3: TIntegerField;
    cdsTipos_MovimentacoesGENE_PAR1: TStringField;
    cdsTipos_MovimentacoesGENE_PAR2: TStringField;
    cdsTipos_MovimentacoesGENE_PAR3: TStringField;
    cdsTipos_MovimentacoesGENE_USER_ID: TIntegerField;
    cdsTipos_MovimentacoesGENE_DTA_CADASTRO: TDateField;
    cdsTipos_MovimentacoesGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsTipos_MovimentacoesGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsTipos_MovimentacoesGENE_GENE_ID_PROD: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTipos_MovimentacoesReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsTipos_MovimentacoesNewRecord(DataSet: TDataSet);
    procedure cdsTipos_MovimentacoesBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmTipos_Movimentacoes_Bancarias: TdmTipos_Movimentacoes_Bancarias;

implementation

{$R *.dfm}

procedure TdmTipos_Movimentacoes_Bancarias.cdsTipos_MovimentacoesBeforeDelete(
  DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('GENERICA',cdsTipos_MovimentacoesGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmTipos_Movimentacoes_Bancarias.cdsTipos_MovimentacoesNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := 0;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 506;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('506','0');
  DataSet.FieldByName('GENE_PAR1').AsString           := 'C';
  DataSet.FieldByName('GENE_PAR2').AsString           := 'N';
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmTipos_Movimentacoes_Bancarias.cdsTipos_MovimentacoesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmTipos_Movimentacoes_Bancarias','cdsTipos_MovimentacoesReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmTipos_Movimentacoes_Bancarias.DataModuleCreate(Sender: TObject);
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
  if dmTipos_Movimentacoes_Bancarias = nil then
    dmTipos_Movimentacoes_Bancarias := TdmTipos_Movimentacoes_Bancarias.Create(nil);
finalization
  FreeAndNil(dmTipos_Movimentacoes_Bancarias);

end.
