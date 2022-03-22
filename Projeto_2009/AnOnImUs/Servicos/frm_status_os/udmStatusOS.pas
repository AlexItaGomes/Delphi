unit udmStatusOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmStatusOS = class(TdmBasico)
    dspStatusOS: TDataSetProvider;
    cdsStatusOS: TClientDataSet;
    cdsStatusOSGENE_EMPR_ID: TIntegerField;
    cdsStatusOSGENE_TGEN_ID: TIntegerField;
    cdsStatusOSGENE_ID: TIntegerField;
    cdsStatusOSGENE_DESCR: TStringField;
    cdsStatusOSGENE_NUMBER1: TIntegerField;
    cdsStatusOSGENE_DTA_CADASTRO: TDateField;
    cdsStatusOSGENE_USER_ID: TIntegerField;
    dsStatusOS: TDataSource;
    qryStatusOS: TSQLQuery;
    qryStatusOSGENE_EMPR_ID: TIntegerField;
    qryStatusOSGENE_TGEN_ID: TIntegerField;
    qryStatusOSGENE_ID: TIntegerField;
    qryStatusOSGENE_DESCR: TStringField;
    qryStatusOSGENE_DTA_CADASTRO: TDateField;
    qryStatusOSGENE_USER_ID: TIntegerField;
    qryStatusOSGENE_NUMBER1: TIntegerField;
    procedure cdsStatusOSNewRecord(DataSet: TDataSet);
    procedure cdsStatusOSReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsStatusOSBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStatusOS: TdmStatusOS;

implementation

{$R *.dfm}

procedure TdmStatusOS.cdsStatusOSBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsStatusOSGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmStatusOS.cdsStatusOSNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger := 517;
  DataSet.FieldByName('GENE_ID').AsString      := funcLocal.ObterSequenciaGen('517',IntToStr(funcLocal.Empr_ID),true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmStatusOS.cdsStatusOSReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmStatusOS','cdsStatusOSReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmStatusOS = nil then
    dmStatusOS := TdmStatusOS.Create(nil);
finalization
  FreeAndNil(dmStatusOS);

end.
