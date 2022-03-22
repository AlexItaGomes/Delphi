unit udmBancos;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmBancos = class(TDataModule)
    qryBancos: TSQLQuery;
    dspBancos: TDataSetProvider;
    cdsBancos: TClientDataSet;
    dsBancos: TDataSource;
    qryBancosGENE_EMPR_ID: TIntegerField;
    qryBancosGENE_TGEN_ID: TIntegerField;
    qryBancosGENE_ID: TIntegerField;
    qryBancosGENE_DESCR: TStringField;
    qryBancosGENE_COMENTARIO: TStringField;
    qryBancosGENE_NUMBER1: TIntegerField;
    qryBancosGENE_NUMBER2: TIntegerField;
    qryBancosGENE_NUMBER3: TIntegerField;
    qryBancosGENE_PAR1: TStringField;
    qryBancosGENE_PAR2: TStringField;
    qryBancosGENE_PAR3: TStringField;
    qryBancosGENE_USER_ID: TIntegerField;
    qryBancosGENE_DTA_CADASTRO: TDateField;
    qryBancosGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryBancosGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryBancosGENE_GENE_ID_PROD: TIntegerField;
    cdsBancosGENE_ID: TIntegerField;
    cdsBancosGENE_DESCR: TStringField;
    cdsBancosGENE_PAR1: TStringField;
    cdsBancosGENE_DTA_CADASTRO: TDateField;
    cdsBancosGENE_EMPR_ID: TIntegerField;
    cdsBancosGENE_TGEN_ID: TIntegerField;
    cdsBancosGENE_COMENTARIO: TStringField;
    cdsBancosGENE_NUMBER1: TIntegerField;
    cdsBancosGENE_NUMBER2: TIntegerField;
    cdsBancosGENE_NUMBER3: TIntegerField;
    cdsBancosGENE_PAR2: TStringField;
    cdsBancosGENE_PAR3: TStringField;
    cdsBancosGENE_USER_ID: TIntegerField;
    cdsBancosGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsBancosGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsBancosGENE_GENE_ID_PROD: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsBancosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsBancosNewRecord(DataSet: TDataSet);
    procedure cdsBancosBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmBancos: TdmBancos;

implementation

{$R *.dfm}

procedure TdmBancos.cdsBancosBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('GENERICA',cdsBancosGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmBancos.cdsBancosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := 0;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 505;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('505','0');
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmBancos.cdsBancosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmBancos','cdsBancosReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmBancos.DataModuleCreate(Sender: TObject);
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
  if dmBancos = nil then
    dmBancos := TdmBancos.Create(nil);
finalization
  FreeAndNil(dmBancos);

end.
