unit udmRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRegioes = class(TdmBasico)
    dspRegioes: TDataSetProvider;
    cdsRegioes: TClientDataSet;
    dsRegioes: TDataSource;
    qryRegioes: TSQLQuery;
    qryRegioesGENE_EMPR_ID: TIntegerField;
    qryRegioesGENE_TGEN_ID: TIntegerField;
    qryRegioesGENE_ID: TIntegerField;
    qryRegioesGENE_DESCR: TStringField;
    qryRegioesGENE_PAR1: TStringField;
    qryRegioesGENE_DTA_CADASTRO: TDateField;
    qryRegioesGENE_USER_ID: TIntegerField;
    cdsRegioesGENE_EMPR_ID: TIntegerField;
    cdsRegioesGENE_TGEN_ID: TIntegerField;
    cdsRegioesGENE_ID: TIntegerField;
    cdsRegioesGENE_DESCR: TStringField;
    cdsRegioesGENE_PAR1: TStringField;
    cdsRegioesGENE_DTA_CADASTRO: TDateField;
    cdsRegioesGENE_USER_ID: TIntegerField;
    procedure cdsRegioesNewRecord(DataSet: TDataSet);
    procedure cdsRegioesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsRegioesBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRegioes: TdmRegioes;

implementation

{$R *.dfm}

procedure TdmRegioes.cdsRegioesBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsRegioesGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmRegioes.cdsRegioesNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 514;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('514',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmRegioes.cdsRegioesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmRegioes','cdsRegioesReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

initialization
  if dmRegioes = nil then
    dmRegioes := TdmRegioes.Create(nil);
finalization
  FreeAndNil(dmRegioes);

end.
