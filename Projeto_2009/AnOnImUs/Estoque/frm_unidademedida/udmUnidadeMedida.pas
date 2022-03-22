unit udmUnidadeMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmUnidadeMedida = class(TdmBasico)
    dspUnidadeMedida: TDataSetProvider;
    cdsUnidadeMedida: TClientDataSet;
    dsUnidadeMedida: TDataSource;
    qryUnidadeMedida: TSQLQuery;
    qryUnidadeMedidaGENE_EMPR_ID: TIntegerField;
    qryUnidadeMedidaGENE_TGEN_ID: TIntegerField;
    qryUnidadeMedidaGENE_ID: TIntegerField;
    qryUnidadeMedidaGENE_DESCR: TStringField;
    qryUnidadeMedidaGENE_PAR1: TStringField;
    qryUnidadeMedidaGENE_DTA_CADASTRO: TDateField;
    qryUnidadeMedidaGENE_USER_ID: TIntegerField;
    cdsUnidadeMedidaGENE_EMPR_ID: TIntegerField;
    cdsUnidadeMedidaGENE_TGEN_ID: TIntegerField;
    cdsUnidadeMedidaGENE_ID: TIntegerField;
    cdsUnidadeMedidaGENE_DESCR: TStringField;
    cdsUnidadeMedidaGENE_PAR1: TStringField;
    cdsUnidadeMedidaGENE_DTA_CADASTRO: TDateField;
    cdsUnidadeMedidaGENE_USER_ID: TIntegerField;
    procedure cdsUnidadeMedidaNewRecord(DataSet: TDataSet);
    procedure cdsUnidadeMedidaBeforeDelete(DataSet: TDataSet);
    procedure cdsUnidadeMedidaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUnidadeMedida: TdmUnidadeMedida;

implementation

{$R *.dfm}

procedure TdmUnidadeMedida.cdsUnidadeMedidaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsUnidadeMedidaGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmUnidadeMedida.cdsUnidadeMedidaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := 0;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 519;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('519','0',true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmUnidadeMedida.cdsUnidadeMedidaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmUnidadeMedida','cdsUnidadeMedidaReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmUnidadeMedida = nil then
    dmUnidadeMedida := TdmUnidadeMedida.Create(nil);
finalization
  FreeAndNil(dmUnidadeMedida);

end.
