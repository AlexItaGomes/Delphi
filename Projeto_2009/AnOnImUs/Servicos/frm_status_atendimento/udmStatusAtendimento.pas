unit udmStatusAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmStatusAtendimento = class(TdmBasico)
    dspStatusAtendimento: TDataSetProvider;
    cdsStatusAtendimento: TClientDataSet;
    cdsStatusAtendimentoGENE_EMPR_ID: TIntegerField;
    cdsStatusAtendimentoGENE_TGEN_ID: TIntegerField;
    cdsStatusAtendimentoGENE_ID: TIntegerField;
    cdsStatusAtendimentoGENE_DESCR: TStringField;
    cdsStatusAtendimentoGENE_DTA_CADASTRO: TDateField;
    cdsStatusAtendimentoGENE_USER_ID: TIntegerField;
    dsStatusAtendimento: TDataSource;
    qryStatusAtendimento: TSQLQuery;
    qryStatusAtendimentoGENE_EMPR_ID: TIntegerField;
    qryStatusAtendimentoGENE_TGEN_ID: TIntegerField;
    qryStatusAtendimentoGENE_ID: TIntegerField;
    qryStatusAtendimentoGENE_DESCR: TStringField;
    qryStatusAtendimentoGENE_DTA_CADASTRO: TDateField;
    qryStatusAtendimentoGENE_USER_ID: TIntegerField;
    qryStatusAtendimentoGENE_NUMBER1: TIntegerField;
    cdsStatusAtendimentoGENE_NUMBER1: TIntegerField;
    procedure cdsStatusAtendimentoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsStatusAtendimentoNewRecord(DataSet: TDataSet);
    procedure cdsStatusAtendimentoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStatusAtendimento: TdmStatusAtendimento;

implementation

{$R *.dfm}

procedure TdmStatusAtendimento.cdsStatusAtendimentoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsStatusAtendimentoGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmStatusAtendimento.cdsStatusAtendimentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 516;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('516','0',true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmStatusAtendimento.cdsStatusAtendimentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmStatusAtendimento','cdsGrupoClienteReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmStatusAtendimento = nil then
    dmStatusAtendimento := TdmStatusAtendimento.Create(nil);
finalization
  FreeAndNil(dmStatusAtendimento);

end.
