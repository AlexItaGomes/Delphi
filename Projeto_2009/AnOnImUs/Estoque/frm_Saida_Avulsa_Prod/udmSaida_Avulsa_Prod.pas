unit udmSaida_Avulsa_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, Provider, DBClient, SqlExpr;

type
  TdmSaida_Avulsa_Prod = class(TdmBasico)
    qrySaidaAvulsa: TSQLQuery;
    cdsSaidaAvulsa: TClientDataSet;
    dspSaidaAvulsa: TDataSetProvider;
    dsSaidaAvulsa: TDataSource;
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
    qrySaidaAvulsaSAAV_ID: TIntegerField;
    qrySaidaAvulsaSAAV_EMPR_ID: TIntegerField;
    qrySaidaAvulsaSAAV_NR_DOCUMENTO: TStringField;
    qrySaidaAvulsaSAAV_CONCILIADO: TIntegerField;
    qrySaidaAvulsaSAAV_OBS: TBlobField;
    qrySaidaAvulsaSAAV_DTA_CADASTRO: TDateField;
    qrySaidaAvulsaSAAV_USER_ID: TIntegerField;
    cdsSaidaAvulsaSAAV_ID: TIntegerField;
    cdsSaidaAvulsaSAAV_EMPR_ID: TIntegerField;
    cdsSaidaAvulsaSAAV_NR_DOCUMENTO: TStringField;
    cdsSaidaAvulsaSAAV_CONCILIADO: TIntegerField;
    cdsSaidaAvulsaSAAV_OBS: TBlobField;
    cdsSaidaAvulsaSAAV_DTA_CADASTRO: TDateField;
    cdsSaidaAvulsaSAAV_USER_ID: TIntegerField;
    qryItensSaidasAvulsa: TSQLQuery;
    dspItensSaidasAvulsa: TDataSetProvider;
    cdsItensSaidasAvulsa: TClientDataSet;
    dsItensSaidasAvulsa: TDataSource;
    qryItensSaidasAvulsaSAIT_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_EMPR_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_SAAV_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_SAAV_EMPR_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_PROD_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_PROD_EMPR_ID: TIntegerField;
    qryItensSaidasAvulsaSAIT_QTDE: TFMTBCDField;
    qryItensSaidasAvulsaSAIT_DTA_CADASTRO: TDateField;
    qryItensSaidasAvulsaSAIT_USER_ID: TIntegerField;
    qryItensSaidasAvulsaPROD_DESCRICAO: TStringField;
    qryItensSaidasAvulsaPROD_UNIDADE: TStringField;
    qryItensSaidasAvulsaPROD_FLG_FRACIONADO: TIntegerField;
    qryItensSaidasAvulsaGRUPO_PROD: TStringField;
    qryItensSaidasAvulsaMARCA_PROD: TStringField;
    qryItensSaidasAvulsaMODELO_PROD: TStringField;
    cdsItensSaidasAvulsaSAIT_PROD_ID: TIntegerField;
    cdsItensSaidasAvulsaPROD_DESCRICAO: TStringField;
    cdsItensSaidasAvulsaPROD_UNIDADE: TStringField;
    cdsItensSaidasAvulsaSAIT_QTDE: TFMTBCDField;
    cdsItensSaidasAvulsaGRUPO_PROD: TStringField;
    cdsItensSaidasAvulsaMARCA_PROD: TStringField;
    cdsItensSaidasAvulsaMODELO_PROD: TStringField;
    cdsItensSaidasAvulsaPROD_FLG_FRACIONADO: TIntegerField;
    cdsItensSaidasAvulsaSAIT_ID: TIntegerField;
    cdsItensSaidasAvulsaSAIT_EMPR_ID: TIntegerField;
    cdsItensSaidasAvulsaSAIT_SAAV_ID: TIntegerField;
    cdsItensSaidasAvulsaSAIT_SAAV_EMPR_ID: TIntegerField;
    cdsItensSaidasAvulsaSAIT_PROD_EMPR_ID: TIntegerField;
    cdsItensSaidasAvulsaSAIT_DTA_CADASTRO: TDateField;
    cdsItensSaidasAvulsaSAIT_USER_ID: TIntegerField;
    cdsPesqProdutosCOD_FORNEC1: TIntegerField;
    cdsPesqProdutosCOD_FORNEC2: TIntegerField;
    cdsPesqProdutosCOD_FORNEC3: TIntegerField;
    cdsPesqProdutosCOD_FORNEC4: TIntegerField;
    procedure cdsSaidaAvulsaBeforeDelete(DataSet: TDataSet);
    procedure cdsSaidaAvulsaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsSaidaAvulsaNewRecord(DataSet: TDataSet);
    procedure cdsItensSaidasAvulsaNewRecord(DataSet: TDataSet);
    procedure cdsItensSaidasAvulsaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSaida_Avulsa_Prod: TdmSaida_Avulsa_Prod;

implementation

{$R *.dfm}

procedure TdmSaida_Avulsa_Prod.cdsItensSaidasAvulsaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('SAIT_ID').AsString             := funcLocal.ObterSequencia('SAIDA_AVULSA_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('SAIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('SAIT_SAAV_ID').AsInteger       := cdsSaidaAvulsaSAAV_ID.AsInteger;
  DataSet.FieldByName('SAIT_SAAV_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('SAIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('SAIT_QTDE').AsFloat            := 0;
  DataSet.FieldByName('SAIT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('SAIT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmSaida_Avulsa_Prod.cdsItensSaidasAvulsaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmSaida_Avulsa_Prod','cdsItensSaidaAvulsaReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar incluir o registro.'+#13+'['+e.Message+']',1)
end;

procedure TdmSaida_Avulsa_Prod.cdsSaidaAvulsaBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if funcLocal.DeletaRegistro('SAIDA_AVULSA',cdsSaidaAvulsaSAAV_ID.AsString,'SAIDA_AVULSA_ITENS') then begin
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
          sql.Add('DELETE FROM SAIDA_AVULSA_ITENS');
          sql.Add('WHERE  SAIT_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    SAIT_SAAV_ID      = ' + cdsSaidaAvulsaSAAV_ID.AsString);
          sql.Add('AND    SAIT_SAAV_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmSaida_Avulsa_Prod','cdsSaidaAvulsaBeforeDelete',e.Message);
        funcLocal.Alerta('Erro no processo de exclusão do item selecionado.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmSaida_Avulsa_Prod.cdsSaidaAvulsaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('SAAV_ID').AsString             := funcLocal.ObterSequencia('SAIDA_AVULSA',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('SAAV_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('SAAV_CONCILIADO').AsInteger    := 0;
  DataSet.FieldByName('SAAV_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('SAAV_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmSaida_Avulsa_Prod.cdsSaidaAvulsaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmSaida_Avulsa_Prod','cdsSaidaAvulsaReconcileError',e.Message);
  funcLocal.Alerta('Erro na inclusão do registro.'+#13+'['+e.Message+']',1);
end;

initialization
  if dmSaida_Avulsa_Prod = nil then
    dmSaida_Avulsa_Prod := TdmSaida_Avulsa_Prod.Create(nil);
finalization
  FreeAndNil(dmSaida_Avulsa_Prod);

end.
