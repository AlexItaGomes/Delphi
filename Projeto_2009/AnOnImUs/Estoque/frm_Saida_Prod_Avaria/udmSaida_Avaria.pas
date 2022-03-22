unit udmSaida_Avaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmSaida_Avaria = class(TdmBasico)
    qrySaidaAvaria: TSQLQuery;
    dspSaidaAvaria: TDataSetProvider;
    dsSaidaAvaria: TDataSource;
    cdsSaidaAvaria: TClientDataSet;
    qrySaidaAvariaSIAV_ID: TIntegerField;
    qrySaidaAvariaSIAV_EMPR_ID: TIntegerField;
    qrySaidaAvariaSIAV_NR_DOCUMENTO: TStringField;
    qrySaidaAvariaSIAV_CONCILIADO: TIntegerField;
    qrySaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField;
    qrySaidaAvariaSIAV_OBS: TBlobField;
    qrySaidaAvariaSIAV_DTA_CADASTRO: TDateField;
    qrySaidaAvariaSIAV_USER_ID: TIntegerField;
    cdsSaidaAvariaSIAV_ID: TIntegerField;
    cdsSaidaAvariaSIAV_EMPR_ID: TIntegerField;
    cdsSaidaAvariaSIAV_NR_DOCUMENTO: TStringField;
    cdsSaidaAvariaSIAV_CONCILIADO: TIntegerField;
    cdsSaidaAvariaSIAV_VLR_TOTAL: TFMTBCDField;
    cdsSaidaAvariaSIAV_OBS: TBlobField;
    cdsSaidaAvariaSIAV_DTA_CADASTRO: TDateField;
    cdsSaidaAvariaSIAV_USER_ID: TIntegerField;
    qryItensSaidaAvaria: TSQLQuery;
    dspItensSaidaAvaria: TDataSetProvider;
    dsItensSaidaAvaria: TDataSource;
    cdsItensSaidaAvaria: TClientDataSet;
    qryItensSaidaAvariaSIIT_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_EMPR_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_SIAV_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_PROD_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField;
    qryItensSaidaAvariaSIIT_QTDE: TFMTBCDField;
    qryItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField;
    qryItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField;
    qryItensSaidaAvariaSIIT_USER_ID: TIntegerField;
    qryItensSaidaAvariaPROD_DESCRICAO: TStringField;
    qryItensSaidaAvariaPROD_UNIDADE: TStringField;
    qryItensSaidaAvariaPROD_GRUPO: TStringField;
    qryItensSaidaAvariaPROD_MARCA: TStringField;
    qryItensSaidaAvariaPROD_MODELO: TStringField;
    cdsItensSaidaAvariaSIIT_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_SIAV_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_SIAV_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_PROD_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_PROD_EMPR_ID: TIntegerField;
    cdsItensSaidaAvariaSIIT_QTDE: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_VLR_CUSTO: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_DTA_CADASTRO: TDateField;
    cdsItensSaidaAvariaSIIT_USER_ID: TIntegerField;
    cdsItensSaidaAvariaPROD_DESCRICAO: TStringField;
    cdsItensSaidaAvariaPROD_UNIDADE: TStringField;
    cdsItensSaidaAvariaPROD_GRUPO: TStringField;
    cdsItensSaidaAvariaPROD_MARCA: TStringField;
    cdsItensSaidaAvariaPROD_MODELO: TStringField;
    qryPesqProdutos: TSQLQuery;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPROD_ID: TIntegerField;
    cdsPesqProdutosPROD_DESCRICAO: TStringField;
    cdsPesqProdutosPROD_UNIDADE: TStringField;
    cdsPesqProdutosPROD_VLR_CUSTO: TFMTBCDField;
    cdsPesqProdutosPROD_GRUPO: TStringField;
    cdsPesqProdutosPROD_MARCA: TStringField;
    cdsPesqProdutosPROD_MODELO: TStringField;
    cdsItensSaidaAvariaTOTAL_ITENS: TAggregateField;
    cdsPesqProdutosPROD_FLG_FRACIONADO: TIntegerField;
    qryItensSaidaAvariaPROD_FLG_FRACIONADO: TIntegerField;
    cdsItensSaidaAvariaPROD_FLG_FRACIONADO: TIntegerField;
    qryItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField;
    cdsItensSaidaAvariaSIIT_VLR_TOTAL: TFMTBCDField;
    cdsPesqProdutosCOD_FORNEC1: TIntegerField;
    cdsPesqProdutosCOD_FORNEC2: TIntegerField;
    cdsPesqProdutosCOD_FORNEC3: TIntegerField;
    cdsPesqProdutosCOD_FORNEC4: TIntegerField;
    procedure cdsSaidaAvariaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsSaidaAvariaNewRecord(DataSet: TDataSet);
    procedure cdsItensSaidaAvariaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsItensSaidaAvariaNewRecord(DataSet: TDataSet);
    procedure cdsSaidaAvariaBeforePost(DataSet: TDataSet);
    procedure cdsSaidaAvariaBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSaida_Avaria: TdmSaida_Avaria;

implementation

{$R *.dfm}

procedure TdmSaida_Avaria.cdsItensSaidaAvariaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('SIIT_ID').AsString             := funcLocal.ObterSequencia('SAIDA_AVARIA_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('SIIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('SIIT_SIAV_ID').AsInteger       := cdsSaidaAvariaSIAV_ID.AsInteger;
  DataSet.FieldByName('SIIT_SIAV_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('SIIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('SIIT_QTDE').AsFloat            := 0;
  DataSet.FieldByName('SIIT_VLR_CUSTO').AsFloat       := 0;
  DataSet.FieldByName('SIIT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('SIIT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmSaida_Avaria.cdsItensSaidaAvariaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro na inclusão do registro.'+#13+'['+e.Message+']',1)
end;

procedure TdmSaida_Avaria.cdsSaidaAvariaBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if funcLocal.DeletaRegistro('SAIDA_AVARIA',cdsSaidaAvariaSIAV_ID.AsString,'SAIDA_AVARIA_ITENS') then begin
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
          sql.Add('DELETE FROM SAIDA_AVARIA_ITENS');
          sql.Add('WHERE  SIIT_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    SIIT_SIAV_ID      = ' + cdsSaidaAvariaSIAV_ID.AsString);
          sql.Add('AND    SIIT_SIAV_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmSaida_Avaria','cdsSaidaAvariaBeforeDelete',e.Message);
        funcLocal.Alerta('Erro no processo de exclusão do item selecionado.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmSaida_Avaria.cdsSaidaAvariaBeforePost(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('SIAV_VLR_TOTAL').AsFloat := cdsItensSaidaAvariaTOTAL_ITENS.Value;
end;

procedure TdmSaida_Avaria.cdsSaidaAvariaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('SIAV_ID').AsString             := funcLocal.ObterSequencia('SAIDA_AVARIA',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('SIAV_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('SIAV_CONCILIADO').AsInteger    := 0;
  DataSet.FieldByName('SIAV_VLR_TOTAL').AsFloat       := 0;
  DataSet.FieldByName('SIAV_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('SIAV_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmSaida_Avaria.cdsSaidaAvariaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmSaida_Avaria','cdsSaidaAvariaReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
end;

initialization
  if dmSaida_Avaria = nil then
    dmSaida_Avaria := TdmSaida_Avaria.Create(nil);
finalization
  FreeAndNil(dmSaida_Avaria);

end.
