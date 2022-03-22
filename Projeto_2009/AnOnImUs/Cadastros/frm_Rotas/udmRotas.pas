unit udmRotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmRotas = class(TdmBasico)
    dspRotas: TDataSetProvider;
    cdsRotas: TClientDataSet;
    cdsRotasGENE_EMPR_ID: TIntegerField;
    cdsRotasGENE_TGEN_ID: TIntegerField;
    cdsRotasGENE_ID: TIntegerField;
    cdsRotasGENE_DESCR: TStringField;
    cdsRotasGENE_PAR1: TStringField;
    cdsRotasGENE_DTA_CADASTRO: TDateField;
    cdsRotasGENE_USER_ID: TIntegerField;
    dsRotas: TDataSource;
    qryRotas: TSQLQuery;
    qryRotasGENE_EMPR_ID: TIntegerField;
    qryRotasGENE_TGEN_ID: TIntegerField;
    qryRotasGENE_ID: TIntegerField;
    qryRotasGENE_DESCR: TStringField;
    qryRotasGENE_PAR1: TStringField;
    qryRotasGENE_DTA_CADASTRO: TDateField;
    qryRotasGENE_USER_ID: TIntegerField;
    qryRotasGENE_NUMERIC1: TFMTBCDField;
    cdsRotasGENE_NUMERIC1: TFMTBCDField;
    qryRotasGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryRotasGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryRotasGENE_GENE_ID_PROD: TIntegerField;
    qryRotasREGIAO: TStringField;
    qryRotasAREA_TOTAL: TStringField;
    cdsRotasGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsRotasGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsRotasGENE_GENE_ID_PROD: TIntegerField;
    cdsRotasREGIAO: TStringField;
    cdsRotasAREA_TOTAL: TStringField;
    procedure cdsRotasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsRotasNewRecord(DataSet: TDataSet);
    procedure cdsRotasBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRotas: TdmRotas;

implementation

{$R *.dfm}

procedure TdmRotas.cdsRotasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsRotasGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmRotas.cdsRotasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger           := 515;
  DataSet.FieldByName('GENE_ID').AsString                 := funcLocal.ObterSequenciaGen('515',IntToStr(funcLocal.Empr_ID),true);
  DataSet.FieldByName('GENE_NUMERIC1').AsFloat            := 0;
  DataSet.FieldByName('GENE_GENE_EMPR_ID_PROP').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_GENE_TGEN_ID_PROP').AsInteger := 514;
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger           := funcLocal.User_ID;
end;

procedure TdmRotas.cdsRotasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmRegioes','cdsRegioesReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmRotas = nil then
    dmRotas := TdmRotas.Create(nil);
finalization
  FreeAndNil(dmRotas);

end.
