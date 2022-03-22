unit udmAliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmAliquotas = class(TdmBasico)
    qryAliquotas: TSQLQuery;
    qryAliquotasGENE_EMPR_ID: TIntegerField;
    qryAliquotasGENE_TGEN_ID: TIntegerField;
    qryAliquotasGENE_ID: TIntegerField;
    qryAliquotasGENE_DESCR: TStringField;
    qryAliquotasGENE_USER_ID: TIntegerField;
    qryAliquotasGENE_DTA_CADASTRO: TDateField;
    dspAliquotas: TDataSetProvider;
    cdsAliquotas: TClientDataSet;
    cdsAliquotasGENE_EMPR_ID: TIntegerField;
    cdsAliquotasGENE_TGEN_ID: TIntegerField;
    cdsAliquotasGENE_ID: TIntegerField;
    cdsAliquotasGENE_DESCR: TStringField;
    cdsAliquotasGENE_USER_ID: TIntegerField;
    cdsAliquotasGENE_DTA_CADASTRO: TDateField;
    dsAliquotas: TDataSource;
    qryAliquotasGENE_PAR1: TStringField;
    cdsAliquotasGENE_PAR1: TStringField;
    procedure cdsAliquotasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAliquotasNewRecord(DataSet: TDataSet);
    procedure cdsAliquotasBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAliquotas: TdmAliquotas;

implementation

{$R *.dfm}

procedure TdmAliquotas.cdsAliquotasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsAliquotasGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmAliquotas.cdsAliquotasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 508;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('508',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_PAR1').AsString           := '0,00';
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmAliquotas.cdsAliquotasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro no processo de inclusão do registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmAliquotas','cdsAliquotasReconcileError',e.Message);
end;

initialization
  if dmAliquotas = nil then  
    dmAliquotas := TdmAliquotas.Create(nil);
finalization
  FreeAndNil(dmAliquotas);

end.
