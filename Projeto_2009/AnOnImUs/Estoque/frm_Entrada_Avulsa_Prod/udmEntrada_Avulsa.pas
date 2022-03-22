unit udmEntrada_Avulsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, Provider, DBClient, SqlExpr;

type
  TdmEntradaAvulsa = class(TdmBasico)
    qryEntradaAvulsa: TSQLQuery;
    cdsEntradaAvulsa: TClientDataSet;
    dspEntradaAvulsa: TDataSetProvider;
    dsEntradaAvulsa: TDataSource;
    qryEntradaAvulsaENAV_ID: TIntegerField;
    qryEntradaAvulsaENAV_EMPR_ID: TIntegerField;
    qryEntradaAvulsaENAV_NR_DOCUMENTO: TStringField;
    qryEntradaAvulsaENAV_CONCILIADO: TIntegerField;
    qryEntradaAvulsaENAV_OBS: TBlobField;
    qryEntradaAvulsaENAV_DTA_CADASTRO: TDateField;
    qryEntradaAvulsaENAV_USER_ID: TIntegerField;
    cdsEntradaAvulsaENAV_ID: TIntegerField;
    cdsEntradaAvulsaENAV_EMPR_ID: TIntegerField;
    cdsEntradaAvulsaENAV_NR_DOCUMENTO: TStringField;
    cdsEntradaAvulsaENAV_CONCILIADO: TIntegerField;
    cdsEntradaAvulsaENAV_OBS: TBlobField;
    cdsEntradaAvulsaENAV_DTA_CADASTRO: TDateField;
    cdsEntradaAvulsaENAV_USER_ID: TIntegerField;
    qryItensEntradaAvulsa: TSQLQuery;
    dspItensEntradaAvulsa: TDataSetProvider;
    cdsItensEntradaAvulsa: TClientDataSet;
    dsItensEntradaAvulsa: TDataSource;
    qryItensEntradaAvulsaENIT_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_EMPR_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_ENAV_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_PROD_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField;
    qryItensEntradaAvulsaENIT_QTDE: TFMTBCDField;
    qryItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField;
    qryItensEntradaAvulsaENIT_USER_ID: TIntegerField;
    qryItensEntradaAvulsaPROD_DESCRICAO: TStringField;
    qryItensEntradaAvulsaPROD_UNIDADE: TStringField;
    qryItensEntradaAvulsaPROD_FLG_FRACIONADO: TIntegerField;
    qryItensEntradaAvulsaGRUPO_PROD: TStringField;
    qryItensEntradaAvulsaMARCA_PROD: TStringField;
    qryItensEntradaAvulsaMODELO_PROD: TStringField;
    cdsItensEntradaAvulsaENIT_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_ENAV_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_ENAV_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_PROD_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_PROD_EMPR_ID: TIntegerField;
    cdsItensEntradaAvulsaENIT_QTDE: TFMTBCDField;
    cdsItensEntradaAvulsaENIT_DTA_CADASTRO: TDateField;
    cdsItensEntradaAvulsaENIT_USER_ID: TIntegerField;
    cdsItensEntradaAvulsaPROD_DESCRICAO: TStringField;
    cdsItensEntradaAvulsaPROD_UNIDADE: TStringField;
    cdsItensEntradaAvulsaPROD_FLG_FRACIONADO: TIntegerField;
    cdsItensEntradaAvulsaGRUPO_PROD: TStringField;
    cdsItensEntradaAvulsaMARCA_PROD: TStringField;
    cdsItensEntradaAvulsaMODELO_PROD: TStringField;
    qryPesqProdutos: TSQLQuery;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPROD_ID: TIntegerField;
    cdsPesqProdutosPROD_DESCRICAO: TStringField;
    cdsPesqProdutosPROD_UNIDADE: TStringField;
    cdsPesqProdutosGRUPO_PROD: TStringField;
    cdsPesqProdutosMARCA_PROD: TStringField;
    cdsPesqProdutosMODELO_PROD: TStringField;
    cdsPesqProdutosPROD_FLG_FRACIONADO: TIntegerField;
    cdsPesqProdutosCOD_FORNEC1: TIntegerField;
    cdsPesqProdutosCOD_FORNEC2: TIntegerField;
    cdsPesqProdutosCOD_FORNEC3: TIntegerField;
    cdsPesqProdutosCOD_FORNEC4: TIntegerField;
    procedure cdsEntradaAvulsaBeforeDelete(DataSet: TDataSet);
    procedure cdsEntradaAvulsaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsEntradaAvulsaNewRecord(DataSet: TDataSet);
    procedure cdsItensEntradaAvulsaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsItensEntradaAvulsaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEntradaAvulsa: TdmEntradaAvulsa;

implementation

{$R *.dfm}

procedure TdmEntradaAvulsa.cdsEntradaAvulsaBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if funcLocal.DeletaRegistro('ENTRADA_AVULSA',cdsEntradaAvulsaENAV_ID.AsString,'ENTRADA_AVULSA_ITENS') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end else begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('DELETE FROM ENTRADA_AVULSA_ITENS');
          sql.Add('WHERE  ENIT_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    ENIT_ENAV_ID      = ' + cdsEntradaAvulsaENAV_ID.AsString);
          sql.Add('AND    ENIT_ENAV_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmEntradaAvulsa','cdsEntradaAvulsaBeforeDelete',e.Message);
        funcLocal.Alerta('Erro no processo de exclusão do item selecionado.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmEntradaAvulsa.cdsEntradaAvulsaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ENAV_ID').AsString             := funcLocal.ObterSequencia('ENTRADA_AVULSA',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('ENAV_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('ENAV_CONCILIADO').AsInteger    := 0;
  DataSet.FieldByName('ENAV_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ENAV_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmEntradaAvulsa.cdsEntradaAvulsaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmEntradaAvulsa','cdsEntradaAvulsaReconcileError',e.Message);
  funcLocal.Alerta('Erro na inclusão do registro.'+#13+'['+e.Message+']',1);
end;

procedure TdmEntradaAvulsa.cdsItensEntradaAvulsaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ENIT_ID').AsString             := funcLocal.ObterSequencia('ENTRADA_AVULSA_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('ENIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('ENIT_ENAV_ID').AsInteger       := cdsEntradaAvulsaENAV_ID.AsInteger;
  DataSet.FieldByName('ENIT_ENAV_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('ENIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('ENIT_QTDE').AsFloat            := 0;
  DataSet.FieldByName('ENIT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ENIT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmEntradaAvulsa.cdsItensEntradaAvulsaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmEntradaAvulsa','cdsItensEntradaAvulsaReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar incluir o registro.'+#13+'['+e.Message+']',1)
end;

initialization
  if dmEntradaAvulsa = nil then
    dmEntradaAvulsa := TdmEntradaAvulsa.Create(nil);
finalization
  FreeAndNil(dmEntradaAvulsa);

end.
