unit udmModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmModelos = class(TdmBasico)
    qryModelos: TSQLQuery;
    qryModelosGENE_EMPR_ID: TIntegerField;
    qryModelosGENE_TGEN_ID: TIntegerField;
    qryModelosGENE_ID: TIntegerField;
    qryModelosGENE_DESCR: TStringField;
    qryModelosGENE_USER_ID: TIntegerField;
    qryModelosGENE_DTA_CADASTRO: TDateField;
    dspModelos: TDataSetProvider;
    cdsModelos: TClientDataSet;
    cdsModelosGENE_EMPR_ID: TIntegerField;
    cdsModelosGENE_TGEN_ID: TIntegerField;
    cdsModelosGENE_ID: TIntegerField;
    cdsModelosGENE_DESCR: TStringField;
    cdsModelosGENE_USER_ID: TIntegerField;
    cdsModelosGENE_DTA_CADASTRO: TDateField;
    dsModelos: TDataSource;
    procedure cdsModelosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsModelosNewRecord(DataSet: TDataSet);
    procedure cdsModelosBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmModelos: TdmModelos;

implementation

{$R *.dfm}

procedure TdmModelos.cdsModelosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsModelosGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmModelos.cdsModelosNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 507;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('507',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmModelos.cdsModelosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro no processo de inclusão do registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmModelos','cdsModelosReconcileError',e.Message);
end;

initialization
  dmModelos := TdmModelos.Create(nil);
finalization
  FreeAndNil(dmModelos);

end.
