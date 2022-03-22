unit udmPlano_Contas;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider,
  Dialogs;

type
  TdmPlano_Contas = class(TDataModule)
    qryPesq_Plano: TSQLQuery;
    dspPesq_Plano: TDataSetProvider;
    cdsPesq_Plano: TClientDataSet;
    dsPesq_Plano: TDataSource;
    cdsPesq_PlanoPLCT_ID: TIntegerField;
    cdsPesq_PlanoPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesq_PlanoPLCT_DESCRICAO: TStringField;
    qryPlano_Contas: TSQLQuery;
    dspPlano_Contas: TDataSetProvider;
    cdsPlano_Contas: TClientDataSet;
    dsPlano_Contas: TDataSource;
    qryPlano_ContasPLCT_ID: TIntegerField;
    qryPlano_ContasPLCT_EMPR_ID: TIntegerField;
    qryPlano_ContasPLCT_COD_SIMPLIFICADO: TStringField;
    qryPlano_ContasPLCT_DESCRICAO: TStringField;
    qryPlano_ContasPLCT_TIPO: TStringField;
    qryPlano_ContasPLCT_ATIVO: TIntegerField;
    qryPlano_ContasPLCT_PLCT_ID: TIntegerField;
    qryPlano_ContasPLCT_PLCT_EMPR_ID: TIntegerField;
    qryPlano_ContasPLCT_DTA_CADASTRO: TDateField;
    qryPlano_ContasPLCT_USER_ID: TIntegerField;
    qryPlano_ContasPLCT_SISTEMA: TIntegerField;
    qryPlano_ContasPLCT_COD_SIMPLIFICADO_1: TStringField;
    qryPlano_ContasPLCT_DESCRICAO_1: TStringField;
    cdsPlano_ContasPLCT_ID: TIntegerField;
    cdsPlano_ContasPLCT_EMPR_ID: TIntegerField;
    cdsPlano_ContasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPlano_ContasPLCT_DESCRICAO: TStringField;
    cdsPlano_ContasPLCT_TIPO: TStringField;
    cdsPlano_ContasPLCT_ATIVO: TIntegerField;
    cdsPlano_ContasPLCT_PLCT_ID: TIntegerField;
    cdsPlano_ContasPLCT_PLCT_EMPR_ID: TIntegerField;
    cdsPlano_ContasPLCT_DTA_CADASTRO: TDateField;
    cdsPlano_ContasPLCT_USER_ID: TIntegerField;
    cdsPlano_ContasPLCT_SISTEMA: TIntegerField;
    cdsPlano_ContasPLCT_COD_SIMPLIFICADO_1: TStringField;
    cdsPlano_ContasPLCT_DESCRICAO_1: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPlano_ContasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsPlano_ContasNewRecord(DataSet: TDataSet);
    procedure cdsPlano_ContasBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmPlano_Contas: TdmPlano_Contas;

implementation

{$R *.dfm}

procedure TdmPlano_Contas.cdsPlano_ContasBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('PLANO_CONTAS',cdsPlano_ContasPLCT_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmPlano_Contas.cdsPlano_ContasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('PLCT_ID').AsString             := funcLocal.ObterSequencia('PLANO_CONTAS','0');
  DataSet.FieldByName('PLCT_EMPR_ID').AsInteger       := 0;
  DataSet.FieldByName('PLCT_TIPO').AsString           := 'D';
  DataSet.FieldByName('PLCT_ATIVO').AsInteger         := 1;
  DataSet.FieldByName('PLCT_PLCT_EMPR_ID').AsInteger  := 0;
  DataSet.FieldByName('PLCT_SISTEMA').AsInteger       := 0;
  DataSet.FieldByName('PLCT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PLCT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmPlano_Contas.cdsPlano_ContasReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmPlano_Contas','cdsPlano_ContasReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmPlano_Contas.DataModuleCreate(Sender: TObject);
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
  if dmPlano_Contas = nil then
    dmPlano_Contas := TdmPlano_Contas.Create(nil); 
finalization
  FreeAndNil(dmPlano_Contas);
end.
