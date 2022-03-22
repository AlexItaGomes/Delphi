unit uDmTipoAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmTipoAgendamento = class(TdmBasico)
    dspTipoAgendamento: TDataSetProvider;
    cdsTipoAgendamento: TClientDataSet;
    cdsTipoAgendamentoGENE_EMPR_ID: TIntegerField;
    cdsTipoAgendamentoGENE_TGEN_ID: TIntegerField;
    cdsTipoAgendamentoGENE_ID: TIntegerField;
    cdsTipoAgendamentoGENE_DESCR: TStringField;
    cdsTipoAgendamentoGENE_NUMBER1: TIntegerField;
    cdsTipoAgendamentoGENE_DTA_CADASTRO: TDateField;
    cdsTipoAgendamentoGENE_USER_ID: TIntegerField;
    dsTipoAgendamento: TDataSource;
    qryTipoAgendamento: TSQLQuery;
    qryTipoAgendamentoGENE_EMPR_ID: TIntegerField;
    qryTipoAgendamentoGENE_TGEN_ID: TIntegerField;
    qryTipoAgendamentoGENE_ID: TIntegerField;
    qryTipoAgendamentoGENE_DESCR: TStringField;
    qryTipoAgendamentoGENE_DTA_CADASTRO: TDateField;
    qryTipoAgendamentoGENE_USER_ID: TIntegerField;
    qryTipoAgendamentoGENE_NUMBER1: TIntegerField;
    procedure cdsTipoAgendamentoNewRecord(DataSet: TDataSet);
    procedure cdsTipoAgendamentoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsTipoAgendamentoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTipoAgendamento: TdmTipoAgendamento;

implementation

{$R *.dfm}

procedure TdmTipoAgendamento.cdsTipoAgendamentoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsTipoAgendamentoGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmTipoAgendamento.cdsTipoAgendamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 518;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('518',IntToStr(funcLocal.Empr_ID),true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor();
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmTipoAgendamento.cdsTipoAgendamentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmTipoAgendamento','cdsTipoAgendamentoReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  dmTipoAgendamento := TdmTipoAgendamento.Create(nil);

finalization
  FreeAndNil(dmTipoAgendamento);

end.
