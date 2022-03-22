unit udmGrupoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmGrupoCliente = class(TdmBasico)
    dspGrupoCliente: TDataSetProvider;
    cdsGrupoCliente: TClientDataSet;
    cdsGrupoClienteGENE_EMPR_ID: TIntegerField;
    cdsGrupoClienteGENE_TGEN_ID: TIntegerField;
    cdsGrupoClienteGENE_ID: TIntegerField;
    cdsGrupoClienteGENE_DESCR: TStringField;
    cdsGrupoClienteGENE_DTA_CADASTRO: TDateField;
    cdsGrupoClienteGENE_USER_ID: TIntegerField;
    dsGrupoCliente: TDataSource;
    qryGrupoCliente: TSQLQuery;
    qryGrupoClienteGENE_EMPR_ID: TIntegerField;
    qryGrupoClienteGENE_TGEN_ID: TIntegerField;
    qryGrupoClienteGENE_ID: TIntegerField;
    qryGrupoClienteGENE_DESCR: TStringField;
    qryGrupoClienteGENE_DTA_CADASTRO: TDateField;
    qryGrupoClienteGENE_USER_ID: TIntegerField;
    procedure cdsGrupoClienteBeforeDelete(DataSet: TDataSet);
    procedure cdsGrupoClienteNewRecord(DataSet: TDataSet);
    procedure cdsGrupoClienteReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGrupoCliente: TdmGrupoCliente;

implementation

{$R *.dfm}

procedure TdmGrupoCliente.cdsGrupoClienteBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsGrupoClienteGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmGrupoCliente.cdsGrupoClienteNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 513;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('513','0',true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmGrupoCliente.cdsGrupoClienteReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmGrupoCliente','cdsGrupoClienteReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmGrupoCliente = nil then
    dmGrupoCliente := TdmGrupoCliente.Create(nil);
finalization
  FreeAndNil(dmGrupoCliente);

end.
