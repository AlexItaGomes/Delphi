unit udmTabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmTabelaPreco = class(TdmBasico)
    qryTabelaPreco: TSQLQuery;
    dspTabelaPreco: TDataSetProvider;
    cdsTabelaPreco: TClientDataSet;
    dsTabelaPreco: TDataSource;
    qryTabelaPrecoTPRC_ID: TIntegerField;
    qryTabelaPrecoTPRC_EMPR_ID: TIntegerField;
    qryTabelaPrecoTPRC_DESCRICAO: TStringField;
    qryTabelaPrecoTPRC_ATIVO: TIntegerField;
    qryTabelaPrecoTPRC_DTA_CADASTRO: TDateField;
    qryTabelaPrecoTPRC_USER_ID: TIntegerField;
    cdsTabelaPrecoTPRC_ID: TIntegerField;
    cdsTabelaPrecoTPRC_EMPR_ID: TIntegerField;
    cdsTabelaPrecoTPRC_DESCRICAO: TStringField;
    cdsTabelaPrecoTPRC_ATIVO: TIntegerField;
    cdsTabelaPrecoTPRC_DTA_CADASTRO: TDateField;
    cdsTabelaPrecoTPRC_USER_ID: TIntegerField;
    qryItensTabelaPreco: TSQLQuery;
    dspItensTabelaPreco: TDataSetProvider;
    cdsItensTabelaPreco: TClientDataSet;
    dsItensTabelaPreco: TDataSource;
    qryItensTabelaPrecoTPIT_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_EMPR_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_TPRC_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_PROD_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField;
    qryItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField;
    qryItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField;
    qryItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField;
    qryItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField;
    qryItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField;
    qryItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField;
    qryItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField;
    qryItensTabelaPrecoTPIT_USER_ID: TIntegerField;
    qryItensTabelaPrecoPROD_DESCRICAO: TStringField;
    qryItensTabelaPrecoPROD_UNIDADE: TStringField;
    qryItensTabelaPrecoGRUPO_PROD: TStringField;
    qryItensTabelaPrecoMARCA_PROD: TStringField;
    qryItensTabelaPrecoMODELO_PROD: TStringField;
    cdsItensTabelaPrecoTPIT_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_TPRC_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_TPRC_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_PROD_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_PROD_EMPR_ID: TIntegerField;
    cdsItensTabelaPrecoTPIT_DTA_VIGENCIA: TDateField;
    cdsItensTabelaPrecoTPIT_DTA_VALIDADE: TDateField;
    cdsItensTabelaPrecoTPIT_VLR_GONDOLA: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_MINIMO: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_ESPECIAL: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_VLR_ATACADO: TFMTBCDField;
    cdsItensTabelaPrecoTPIT_DTA_CADASTRO: TDateField;
    cdsItensTabelaPrecoTPIT_USER_ID: TIntegerField;
    cdsItensTabelaPrecoPROD_DESCRICAO: TStringField;
    cdsItensTabelaPrecoPROD_UNIDADE: TStringField;
    cdsItensTabelaPrecoGRUPO_PROD: TStringField;
    cdsItensTabelaPrecoMARCA_PROD: TStringField;
    cdsItensTabelaPrecoMODELO_PROD: TStringField;
    qryPesqProd: TSQLQuery;
    dspPesqProd: TDataSetProvider;
    cdsPesqProd: TClientDataSet;
    cdsPesqProdPROD_DESCRICAO: TStringField;
    cdsPesqProdPROD_UNIDADE: TStringField;
    cdsPesqProdGRUPO_PROD: TStringField;
    cdsPesqProdMARCA_PROD: TStringField;
    cdsPesqProdMODELO_PROD: TStringField;
    cdsPesqProdPROD_ID: TIntegerField;
    cdsPesqProdCOD_FORNEC1: TIntegerField;
    cdsPesqProdCOD_FORNEC2: TIntegerField;
    cdsPesqProdCOD_FORNEC3: TIntegerField;
    cdsPesqProdCOD_FORNEC4: TIntegerField;
    procedure cdsTabelaPrecoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsTabelaPrecoNewRecord(DataSet: TDataSet);
    procedure cdsItensTabelaPrecoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsItensTabelaPrecoNewRecord(DataSet: TDataSet);
    procedure dsTabelaPrecoDataChange(Sender: TObject; Field: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTabelaPrecoBeforeDelete(DataSet: TDataSet);
    procedure cdsItensTabelaPrecoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    boolAlter : Boolean;
  end;

var
  dmTabelaPreco: TdmTabelaPreco;

implementation

{$R *.dfm}

procedure TdmTabelaPreco.cdsItensTabelaPrecoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  inherited;
  if funcLocal.DeletaRegistro('TABELA_PRECO_ITENS',cdsItensTabelaPrecoTPIT_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmTabelaPreco.cdsItensTabelaPrecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TPIT_ID').AsString             := funcLocal.ObterSequencia('TABELA_PRECO_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('TPIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('TPIT_TPRC_ID').AsInteger       := cdsTabelaPrecoTPRC_ID.AsInteger;
  DataSet.FieldByName('TPIT_TPRC_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('TPIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('TPIT_DTA_VIGENCIA').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('TPIT_DTA_VALIDADE').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('TPIT_VLR_GONDOLA').AsFloat     := 0;
  DataSet.FieldByName('TPIT_VLR_MINIMO').AsFloat      := 0;
  DataSet.FieldByName('TPIT_VLR_ESPECIAL').AsFloat    := 0;
  DataSet.FieldByName('TPIT_VLR_ATACADO').AsFloat     := 0;
  DataSet.FieldByName('TPIT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('TPIT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmTabelaPreco.cdsItensTabelaPrecoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmTabelaPreco','cdsItensPedidoVendaReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1)
end;

procedure TdmTabelaPreco.cdsTabelaPrecoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if funcLocal.DeletaRegistro('TABELA_PRECO',cdsTabelaPrecoTPRC_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está condicionado a outras partes do sistema, por tanto o mesmo não poderá ser excluido.',1);
    Abort;
  end;
end;

procedure TdmTabelaPreco.cdsTabelaPrecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TPRC_ID').AsString             := funcLocal.ObterSequencia('TABELA_PRECO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('TPRC_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('TPRC_ATIVO').AsInteger         := 1;
  DataSet.FieldByName('TPRC_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('TPRC_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmTabelaPreco.cdsTabelaPrecoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmTabelaPreco','cdsTabelaPrecoReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1)
end;

procedure TdmTabelaPreco.DataModuleCreate(Sender: TObject);
begin
  inherited;
  boolAlter := true;
end;

procedure TdmTabelaPreco.dsTabelaPrecoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if boolAlter then begin
    with cdsItensTabelaPreco do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('TPRC_ID').AsInteger := cdsTabelaPrecoTPRC_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  if dmTabelaPreco = nil then  
    dmTabelaPreco := TdmTabelaPreco.Create(nil);
finalization
  FreeAndNil(dmTabelaPreco);

end.
