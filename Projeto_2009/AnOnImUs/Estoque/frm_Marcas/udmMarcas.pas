unit udmMarcas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmMarcas = class(TdmBasico)
    qryMarcas: TSQLQuery;
    dspMarcas: TDataSetProvider;
    cdsMarcas: TClientDataSet;
    dsMarcas: TDataSource;
    qryMarcasGENE_EMPR_ID: TIntegerField;
    qryMarcasGENE_TGEN_ID: TIntegerField;
    qryMarcasGENE_ID: TIntegerField;
    qryMarcasGENE_DESCR: TStringField;
    qryMarcasGENE_USER_ID: TIntegerField;
    qryMarcasGENE_DTA_CADASTRO: TDateField;
    cdsMarcasGENE_EMPR_ID: TIntegerField;
    cdsMarcasGENE_TGEN_ID: TIntegerField;
    cdsMarcasGENE_ID: TIntegerField;
    cdsMarcasGENE_DESCR: TStringField;
    cdsMarcasGENE_USER_ID: TIntegerField;
    cdsMarcasGENE_DTA_CADASTRO: TDateField;
    procedure cdsMarcasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMarcasNewRecord(DataSet: TDataSet);
    procedure cdsMarcasBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMarcas: TdmMarcas;

implementation

{$R *.dfm}

procedure TdmMarcas.cdsMarcasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsMarcasGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmMarcas.cdsMarcasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 504;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('504',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmMarcas.cdsMarcasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro no processo de inclusão do registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmMarcas','cdsMarcasReconcileError',e.Message);
end;

initialization
  if dmMarcas = nil then
    dmMarcas := TdmMarcas.Create(nil);
finalization
  FreeAndNil(dmMarcas);

end.
