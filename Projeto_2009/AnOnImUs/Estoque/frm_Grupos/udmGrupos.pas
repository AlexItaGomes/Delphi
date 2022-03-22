unit udmGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmGrupos = class(TdmBasico)
    qryGrupos: TSQLQuery;
    dspGrupos: TDataSetProvider;
    cdsGrupos: TClientDataSet;
    dsGrupos: TDataSource;
    qryGruposGENE_EMPR_ID: TIntegerField;
    qryGruposGENE_TGEN_ID: TIntegerField;
    qryGruposGENE_ID: TIntegerField;
    qryGruposGENE_DESCR: TStringField;
    qryGruposGENE_USER_ID: TIntegerField;
    qryGruposGENE_DTA_CADASTRO: TDateField;
    cdsGruposGENE_EMPR_ID: TIntegerField;
    cdsGruposGENE_TGEN_ID: TIntegerField;
    cdsGruposGENE_ID: TIntegerField;
    cdsGruposGENE_DESCR: TStringField;
    cdsGruposGENE_USER_ID: TIntegerField;
    cdsGruposGENE_DTA_CADASTRO: TDateField;
    procedure cdsGruposReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsGruposNewRecord(DataSet: TDataSet);
    procedure cdsGruposBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGrupos: TdmGrupos;

implementation

{$R *.dfm}

procedure TdmGrupos.cdsGruposBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('GENERICA',cdsGruposGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmGrupos.cdsGruposNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 503;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('503',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmGrupos.cdsGruposReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmGrupos','cdsGruposReconcileError',e.Message);
end;

initialization
  if dmGrupos = nil then  
    dmGrupos := TdmGrupos.Create(nil);
finalization
  FreeAndNil(dmGrupos);

end.
