unit udmBandeiraCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TdmBandeiraCartao = class(TdmBasico)
    dspBandeiras: TDataSetProvider;
    cdsBandeiras: TClientDataSet;
    cdsBandeirasGENE_EMPR_ID: TIntegerField;
    cdsBandeirasGENE_TGEN_ID: TIntegerField;
    cdsBandeirasGENE_ID: TIntegerField;
    cdsBandeirasGENE_DESCR: TStringField;
    cdsBandeirasGENE_DTA_CADASTRO: TDateField;
    cdsBandeirasGENE_USER_ID: TIntegerField;
    dsBandeiras: TDataSource;
    qryBandeiras: TSQLQuery;
    qryBandeirasGENE_EMPR_ID: TIntegerField;
    qryBandeirasGENE_TGEN_ID: TIntegerField;
    qryBandeirasGENE_ID: TIntegerField;
    qryBandeirasGENE_DESCR: TStringField;
    qryBandeirasGENE_DTA_CADASTRO: TDateField;
    qryBandeirasGENE_USER_ID: TIntegerField;
    procedure cdsBandeirasBeforeDelete(DataSet: TDataSet);
    procedure cdsBandeirasNewRecord(DataSet: TDataSet);
    procedure cdsBandeirasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBandeiraCartao: TdmBandeiraCartao;

implementation

{$R *.dfm}

procedure TdmBandeiraCartao.cdsBandeirasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsBandeirasGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmBandeiraCartao.cdsBandeirasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger := 0;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger := 14;
  DataSet.FieldByName('GENE_ID').AsString      := funcLocal.ObterSequenciaGen('14',IntToStr(funcLocal.Empr_ID),true);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmBandeiraCartao.cdsBandeirasReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmBandeiraCartao','cdsBandeirasReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  dmBandeiraCartao := TdmBandeiraCartao.Create(nil);
finalization
  FreeAndNil(dmBandeiraCartao);

end.
