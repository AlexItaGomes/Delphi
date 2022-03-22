unit udmFiltros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmFiltros = class(TdmBasico)
    qryFiltros: TSQLQuery;
    qryFiltrosGENE_EMPR_ID: TIntegerField;
    qryFiltrosGENE_TGEN_ID: TIntegerField;
    qryFiltrosGENE_ID: TIntegerField;
    qryFiltrosGENE_DESCR: TStringField;
    qryFiltrosGENE_USER_ID: TIntegerField;
    qryFiltrosGENE_DTA_CADASTRO: TDateField;
    dspFiltros: TDataSetProvider;
    cdsFiltros: TClientDataSet;
    cdsFiltrosGENE_EMPR_ID: TIntegerField;
    cdsFiltrosGENE_TGEN_ID: TIntegerField;
    cdsFiltrosGENE_ID: TIntegerField;
    cdsFiltrosGENE_DESCR: TStringField;
    cdsFiltrosGENE_USER_ID: TIntegerField;
    cdsFiltrosGENE_DTA_CADASTRO: TDateField;
    dsFiltros: TDataSource;
    qryFiltrosGENE_IMAGE: TBlobField;
    cdsFiltrosGENE_IMAGE: TBlobField;
    procedure cdsFiltrosBeforeDelete(DataSet: TDataSet);
    procedure cdsFiltrosNewRecord(DataSet: TDataSet);
    procedure cdsFiltrosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFiltros: TdmFiltros;

implementation

{$R *.dfm}

procedure TdmFiltros.cdsFiltrosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('GENERICA',cdsFiltrosGENE_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmFiltros.cdsFiltrosNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 520;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequenciaGen('520',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmFiltros.cdsFiltrosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro no processo de inclusão do registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmModelos','cdsModelosReconcileError',e.Message);
end;

initialization
  dmFiltros := TdmFiltros.Create(nil);
finalization
  FreeAndNil(dmFiltros);

end.
