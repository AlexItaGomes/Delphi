unit udmProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DBClient, DB, Provider, SqlExpr, Funcoes;

type
  TdmProdutos = class(TdmBasico)
    qryProdutos: TSQLQuery;
    dspProdutos: TDataSetProvider;
    dsProdutos: TDataSource;
    cdsProdutos: TClientDataSet;
    qryProdutosPROD_ID: TIntegerField;
    qryProdutosPROD_EMPR_ID: TIntegerField;
    qryProdutosPROD_FORN_ID: TIntegerField;
    qryProdutosPROD_DESCRICAO: TStringField;
    qryProdutosPROD_ABREVIACAO: TStringField;
    qryProdutosPROD_ATIVO: TIntegerField;
    qryProdutosPROD_GENE_EMPR_ID_TP_PROD: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_TP_PROD: TIntegerField;
    qryProdutosPROD_GENE_ID_TP_PROD: TIntegerField;
    qryProdutosPROD_GENE_EMPR_ID_GRUPO: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_GRUPO: TIntegerField;
    qryProdutosPROD_GENE_ID_GRUPO: TIntegerField;
    qryProdutosPROD_GENE_EMPR_ID_MARCA: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_MARCA: TIntegerField;
    qryProdutosPROD_GENE_ID_MARCA: TIntegerField;
    qryProdutosPROD_GENE_EMPR_ID_MODELO: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_MODELO: TIntegerField;
    qryProdutosPROD_GENE_ID_MODELO: TIntegerField;
    qryProdutosPROD_GENE_EMPR_ID_ALQ_ECF: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_ALQ_ECF: TIntegerField;
    qryProdutosPROD_GENE_ID_ALQ_ECF: TIntegerField;
    qryProdutosPROD_DTA_ULT_COMPRA: TDateField;
    qryProdutosPROD_VLR_CUSTO: TFMTBCDField;
    qryProdutosPROD_ESTQ_INICIAL: TFMTBCDField;
    qryProdutosPROD_ESTQ_MINIMO: TFMTBCDField;
    qryProdutosPROD_GARANTIA: TIntegerField;
    qryProdutosPROD_FLG_FRACIONADO: TIntegerField;
    qryProdutosPROD_DTA_CADASTRO: TDateField;
    qryProdutosPROD_USER_ID: TIntegerField;
    qryProdutosFORN_NOME_FANTASIA: TStringField;
    qryProdutosTIPO_PROD: TStringField;
    qryProdutosGRUPO_PROD: TStringField;
    qryProdutosMARCA_PROD: TStringField;
    qryProdutosMODELO_PROD: TStringField;
    qryProdutosALIQUOTA: TStringField;
    cdsProdutosPROD_ID: TIntegerField;
    cdsProdutosPROD_EMPR_ID: TIntegerField;
    cdsProdutosPROD_FORN_ID: TIntegerField;
    cdsProdutosPROD_DESCRICAO: TStringField;
    cdsProdutosPROD_ABREVIACAO: TStringField;
    cdsProdutosPROD_ATIVO: TIntegerField;
    cdsProdutosPROD_GENE_EMPR_ID_TP_PROD: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_TP_PROD: TIntegerField;
    cdsProdutosPROD_GENE_ID_TP_PROD: TIntegerField;
    cdsProdutosPROD_GENE_EMPR_ID_GRUPO: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_GRUPO: TIntegerField;
    cdsProdutosPROD_GENE_ID_GRUPO: TIntegerField;
    cdsProdutosPROD_GENE_EMPR_ID_MARCA: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_MARCA: TIntegerField;
    cdsProdutosPROD_GENE_ID_MARCA: TIntegerField;
    cdsProdutosPROD_GENE_EMPR_ID_MODELO: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_MODELO: TIntegerField;
    cdsProdutosPROD_GENE_ID_MODELO: TIntegerField;
    cdsProdutosPROD_GENE_EMPR_ID_ALQ_ECF: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_ALQ_ECF: TIntegerField;
    cdsProdutosPROD_GENE_ID_ALQ_ECF: TIntegerField;
    cdsProdutosPROD_DTA_ULT_COMPRA: TDateField;
    cdsProdutosPROD_VLR_CUSTO: TFMTBCDField;
    cdsProdutosPROD_ESTQ_INICIAL: TFMTBCDField;
    cdsProdutosPROD_ESTQ_MINIMO: TFMTBCDField;
    cdsProdutosPROD_GARANTIA: TIntegerField;
    cdsProdutosPROD_FLG_FRACIONADO: TIntegerField;
    cdsProdutosPROD_DTA_CADASTRO: TDateField;
    cdsProdutosPROD_USER_ID: TIntegerField;
    cdsProdutosFORN_NOME_FANTASIA: TStringField;
    cdsProdutosTIPO_PROD: TStringField;
    cdsProdutosGRUPO_PROD: TStringField;
    cdsProdutosMARCA_PROD: TStringField;
    cdsProdutosMODELO_PROD: TStringField;
    cdsProdutosALIQUOTA: TStringField;
    qryProdutosESTQ_EST_ATUAL: TFMTBCDField;
    qryProdutosESTQ_EST_DISP: TFMTBCDField;
    cdsProdutosESTQ_EST_ATUAL: TFMTBCDField;
    cdsProdutosESTQ_EST_DISP: TFMTBCDField;
    qryPesqFornec: TSQLQuery;
    dspPesqFornec: TDataSetProvider;
    cdsPesqFornec: TClientDataSet;
    qryPesqTipo: TSQLQuery;
    dspPesqTipo: TDataSetProvider;
    cdsPesqTipo: TClientDataSet;
    qryPesqGrupo: TSQLQuery;
    dspPesqGrupo: TDataSetProvider;
    cdsPesqGrupo: TClientDataSet;
    qryPesqMarca: TSQLQuery;
    dspPesqMarca: TDataSetProvider;
    cdsPesqMarca: TClientDataSet;
    qryPesqModelo: TSQLQuery;
    dspPesqModelo: TDataSetProvider;
    cdsPesqModelo: TClientDataSet;
    qryPesqAliq: TSQLQuery;
    dspPesqAliq: TDataSetProvider;
    cdsPesqAliq: TClientDataSet;
    cdsPesqFornecFORN_ID: TIntegerField;
    cdsPesqFornecFORN_NOME_FANTASIA: TStringField;
    cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField;
    cdsPesqFornecFORN_CNPJ_CPF: TStringField;
    cdsPesqTipoGENE_ID: TIntegerField;
    cdsPesqTipoGENE_DESCR: TStringField;
    cdsPesqGrupoGENE_ID: TIntegerField;
    cdsPesqGrupoGENE_DESCR: TStringField;
    cdsPesqMarcaGENE_ID: TIntegerField;
    cdsPesqMarcaGENE_DESCR: TStringField;
    cdsPesqModeloGENE_ID: TIntegerField;
    cdsPesqModeloGENE_DESCR: TStringField;
    cdsPesqAliqGENE_ID: TIntegerField;
    cdsPesqAliqGENE_DESCR: TStringField;
    qryProdutosPROD_IMAGEM: TBlobField;
    cdsProdutosPROD_IMAGEM: TBlobField;
    qryCodBarras: TSQLQuery;
    dspCodBarras: TDataSetProvider;
    dsCodBarras: TDataSource;
    cdsCodBarras: TClientDataSet;
    qryCodBarrasPRCB_ID: TIntegerField;
    qryCodBarrasPRCB_EMPR_ID: TIntegerField;
    qryCodBarrasPRCB_PROD_ID: TIntegerField;
    qryCodBarrasPRCB_PROD_EMPR_ID: TIntegerField;
    qryCodBarrasPRCB_COD_BARRA: TStringField;
    qryCodBarrasPRCB_DTA_CADASTRO: TDateField;
    qryCodBarrasPRCB_USER_ID: TIntegerField;
    cdsCodBarrasPRCB_ID: TIntegerField;
    cdsCodBarrasPRCB_EMPR_ID: TIntegerField;
    cdsCodBarrasPRCB_PROD_ID: TIntegerField;
    cdsCodBarrasPRCB_PROD_EMPR_ID: TIntegerField;
    cdsCodBarrasPRCB_COD_BARRA: TStringField;
    cdsCodBarrasPRCB_DTA_CADASTRO: TDateField;
    cdsCodBarrasPRCB_USER_ID: TIntegerField;
    cdsPesqAliqGENE_PAR1: TStringField;
    qryProdutosICMS: TStringField;
    cdsProdutosICMS: TStringField;
    qryProdutosPROD_GRADE: TIntegerField;
    cdsProdutosPROD_GRADE: TIntegerField;
    qryPesqProdutos: TSQLQuery;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPROD_ID: TIntegerField;
    cdsPesqProdutosPROD_DESCRICAO: TStringField;
    cdsPesqProdutosPROD_UNIDADE: TStringField;
    cdsPesqProdutosGRUPO_PROD: TStringField;
    cdsPesqProdutosMARCA_PROD: TStringField;
    cdsPesqProdutosMODELO_PROD: TStringField;
    qryComposicaoProd: TSQLQuery;
    dspComposicaoProd: TDataSetProvider;
    dsComposicaoProd: TDataSource;
    cdsComposicaoProd: TClientDataSet;
    qryComposicaoProdPRCP_ID: TIntegerField;
    qryComposicaoProdPRCP_EMPR_ID: TIntegerField;
    qryComposicaoProdPRCP_PROD_ID: TIntegerField;
    qryComposicaoProdPRCP_PROD_EMPR_ID: TIntegerField;
    qryComposicaoProdPRCP_PROD_ID_COMP: TIntegerField;
    qryComposicaoProdPRCP_PROD_EMPR_ID_COMP: TIntegerField;
    qryComposicaoProdPRCP_QTDE: TFMTBCDField;
    qryComposicaoProdPRCP_DTA_CADASTRO: TDateField;
    qryComposicaoProdPRCP_USER_ID: TIntegerField;
    qryComposicaoProdPROD_DESCRICAO: TStringField;
    qryComposicaoProdPROD_UNIDADE: TStringField;
    qryComposicaoProdGRUPO_PROD: TStringField;
    qryComposicaoProdMARCA_PROD: TStringField;
    qryComposicaoProdMODELO_PROD: TStringField;
    cdsComposicaoProdPRCP_ID: TIntegerField;
    cdsComposicaoProdPRCP_EMPR_ID: TIntegerField;
    cdsComposicaoProdPRCP_PROD_ID: TIntegerField;
    cdsComposicaoProdPRCP_PROD_EMPR_ID: TIntegerField;
    cdsComposicaoProdPRCP_PROD_ID_COMP: TIntegerField;
    cdsComposicaoProdPRCP_PROD_EMPR_ID_COMP: TIntegerField;
    cdsComposicaoProdPRCP_QTDE: TFMTBCDField;
    cdsComposicaoProdPRCP_DTA_CADASTRO: TDateField;
    cdsComposicaoProdPRCP_USER_ID: TIntegerField;
    cdsComposicaoProdPROD_DESCRICAO: TStringField;
    cdsComposicaoProdPROD_UNIDADE: TStringField;
    cdsComposicaoProdGRUPO_PROD: TStringField;
    cdsComposicaoProdMARCA_PROD: TStringField;
    cdsComposicaoProdMODELO_PROD: TStringField;
    qryProdutosPROD_FLG_ESTOQUE: TIntegerField;
    cdsProdutosPROD_FLG_ESTOQUE: TIntegerField;
    qryProdutosPROD_TIPO_COMISSAO: TIntegerField;
    qryProdutosPROD_COMISSAO_VEND_INTERNA: TFMTBCDField;
    qryProdutosPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField;
    qryProdutosPROD_COMISSAO_VEND_BALCAO: TFMTBCDField;
    cdsProdutosPROD_TIPO_COMISSAO: TIntegerField;
    cdsProdutosPROD_COMISSAO_VEND_INTERNA: TFMTBCDField;
    cdsProdutosPROD_COMISSAO_VEND_EXTERNO: TFMTBCDField;
    cdsProdutosPROD_COMISSAO_VEND_BALCAO: TFMTBCDField;
    qryProdutosPROD_COD_NCM: TStringField;
    cdsProdutosPROD_COD_NCM: TStringField;
    qryTabelasPreco: TSQLQuery;
    dspTabelasPreco: TDataSetProvider;
    dsTabelasPreco: TDataSource;
    cdsTabelasPreco: TClientDataSet;
    cdsTabelasPrecoTPRC_ATIVO: TStringField;
    cdsTabelasPrecoTPRC_DESCRICAO: TStringField;
    cdsTabelasPrecoTPIT_DTA_VIGENCIA: TDateField;
    cdsTabelasPrecoTPIT_DTA_VALIDADE: TDateField;
    cdsTabelasPrecoTPIT_VLR_GONDOLA: TFMTBCDField;
    cdsTabelasPrecoTPIT_VLR_MINIMO: TFMTBCDField;
    cdsTabelasPrecoTPIT_VLR_ESPECIAL: TFMTBCDField;
    cdsTabelasPrecoTPIT_VLR_ATACADO: TFMTBCDField;
    qryProdutosCodFornec: TSQLQuery;
    dspProdutosCodFornec: TDataSetProvider;
    dsProdutosCodFornec: TDataSource;
    cdsProdutosCodFornec: TClientDataSet;
    qryProdutosCodFornecPRCF_ID: TIntegerField;
    qryProdutosCodFornecPRCF_EMPR_ID: TIntegerField;
    qryProdutosCodFornecPRCF_PROD_ID: TIntegerField;
    qryProdutosCodFornecPRCF_PROD_EMPR_ID: TIntegerField;
    qryProdutosCodFornecPRCF_FORN_ID: TIntegerField;
    qryProdutosCodFornecPRCF_CODFORN_ID: TIntegerField;
    qryProdutosCodFornecPRCF_DTA_CADASTRO: TDateField;
    qryProdutosCodFornecPRCF_USER_ID: TIntegerField;
    qryProdutosCodFornecFORN_RAZAO_SOCIAL: TStringField;
    qryProdutosCodFornecFORN_NOME_FANTASIA: TStringField;
    cdsProdutosCodFornecPRCF_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_EMPR_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_PROD_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_PROD_EMPR_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_FORN_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_CODFORN_ID: TIntegerField;
    cdsProdutosCodFornecPRCF_DTA_CADASTRO: TDateField;
    cdsProdutosCodFornecPRCF_USER_ID: TIntegerField;
    cdsProdutosCodFornecFORN_RAZAO_SOCIAL: TStringField;
    cdsProdutosCodFornecFORN_NOME_FANTASIA: TStringField;
    qryProdutosPROD_COD_GTIN: TStringField;
    qryProdutosPROD_COD_ORIGINAL: TIntegerField;
    qryProdutosPROD_COD_FABRICA: TIntegerField;
    cdsProdutosPROD_COD_GTIN: TStringField;
    cdsProdutosPROD_COD_ORIGINAL: TIntegerField;
    cdsProdutosPROD_COD_FABRICA: TIntegerField;
    qryProdutosPROD_CST_PADRAO: TStringField;
    qryProdutosPROD_TIPO_ALIQUOTA_PIS: TStringField;
    qryProdutosPROD_TIPO_ALIQUOTA_COFINS: TStringField;
    qryProdutosPROD_NATUREZA_PIS_COFINS: TIntegerField;
    qryProdutosPROD_CST_ENTRADA_PIS: TStringField;
    qryProdutosPROD_CST_SAIDA_PIS: TStringField;
    qryProdutosPROD_ALIQUOTA_PIS: TFMTBCDField;
    qryProdutosPROD_CST_ENTRADA_COFINS: TStringField;
    qryProdutosPROD_CST_SAIDA_COFINS: TStringField;
    qryProdutosPROD_ALIQUOTA_COFINS: TFMTBCDField;
    qryProdutosPROD_REGIME_TRIBUTARIO: TStringField;
    qryProdutosPROD_PESO_LIQUIDO: TFMTBCDField;
    cdsProdutosPROD_CST_PADRAO: TStringField;
    cdsProdutosPROD_TIPO_ALIQUOTA_PIS: TStringField;
    cdsProdutosPROD_TIPO_ALIQUOTA_COFINS: TStringField;
    cdsProdutosPROD_NATUREZA_PIS_COFINS: TIntegerField;
    cdsProdutosPROD_CST_ENTRADA_PIS: TStringField;
    cdsProdutosPROD_CST_SAIDA_PIS: TStringField;
    cdsProdutosPROD_ALIQUOTA_PIS: TFMTBCDField;
    cdsProdutosPROD_CST_ENTRADA_COFINS: TStringField;
    cdsProdutosPROD_CST_SAIDA_COFINS: TStringField;
    cdsProdutosPROD_ALIQUOTA_COFINS: TFMTBCDField;
    cdsProdutosPROD_REGIME_TRIBUTARIO: TStringField;
    cdsProdutosPROD_PESO_LIQUIDO: TFMTBCDField;
    qryProdutosPROD_GENE_EMPR_ID_UNID: TIntegerField;
    qryProdutosPROD_GENE_TGEN_ID_UNID: TIntegerField;
    qryProdutosPROD_GENE_ID_UNID: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosUNID: TStringField;
    cdsProdutosPROD_GENE_EMPR_ID_UNID: TIntegerField;
    cdsProdutosPROD_GENE_TGEN_ID_UNID: TIntegerField;
    cdsProdutosPROD_GENE_ID_UNID: TIntegerField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosUNID: TStringField;
    qryProdutosPROD_COD_FORN1: TIntegerField;
    qryProdutosPROD_COD_FORN2: TIntegerField;
    qryProdutosPROD_COD_FORN3: TIntegerField;
    qryProdutosPROD_COD_FORN4: TIntegerField;
    cdsProdutosPROD_COD_FORN1: TIntegerField;
    cdsProdutosPROD_COD_FORN2: TIntegerField;
    cdsProdutosPROD_COD_FORN3: TIntegerField;
    cdsProdutosPROD_COD_FORN4: TIntegerField;
    qryProdutosPROD_DURACAO: TIntegerField;
    cdsProdutosPROD_DURACAO: TIntegerField;
    qryProdutosPROD_PERIODO_RETORNO: TStringField;
    cdsProdutosPROD_PERIODO_RETORNO: TStringField;
    procedure cdsProdutosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsProdutosNewRecord(DataSet: TDataSet);
    procedure cdsCodBarrasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsCodBarrasNewRecord(DataSet: TDataSet);
    procedure cdsComposicaoProdReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsComposicaoProdNewRecord(DataSet: TDataSet);
    procedure cdsProdutosBeforeDelete(DataSet: TDataSet);
    procedure cdsProdutosCodFornecNewRecord(DataSet: TDataSet);
    procedure cdsProdutosAfterEdit(DataSet: TDataSet);
  private
  public
  end;

var
  dmProdutos: TdmProdutos;

implementation

{$R *.dfm}

procedure TdmProdutos.cdsCodBarrasNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRCB_ID').AsString := funcLocal.ObterSequencia('PRODUTOS_BAR',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('PRCB_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCB_PROD_ID').AsInteger := cdsProdutosPROD_ID.AsInteger;
  DataSet.FieldByName('PRCB_PROD_EMPR_ID').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCB_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PRCB_USER_ID').AsInteger := funcLocal.User_ID;
end;

procedure TdmProdutos.cdsCodBarrasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmProdutos','cdsCodBarrasReconcileError',e.Message);
end;

procedure TdmProdutos.cdsComposicaoProdNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRCP_ID').AsString                 := funcLocal.ObterSequencia('PRODUTOS_COMP',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('PRCP_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCP_PROD_ID').AsInteger           := cdsProdutosPROD_ID.AsInteger;
  DataSet.FieldByName('PRCP_PROD_EMPR_ID').AsInteger      := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCP_PROD_EMPR_ID_COMP').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCP_QTDE').AsInteger              := 0;
  DataSet.FieldByName('PRCP_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PRCP_USER_ID').AsInteger           := funcLocal.User_ID;
end;

procedure TdmProdutos.cdsComposicaoProdReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmProdutos','cdsComposicaoProdReconcileError',e.Message);
  funcLocal.Alerta('Erro na inserção do novo registro.'+#13+'['+e.Message+']',1)
end;

procedure TdmProdutos.cdsProdutosAfterEdit(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_UNID').AsInteger     := 0;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_UNID').AsInteger     := 519;
end;

procedure TdmProdutos.cdsProdutosBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if funcLocal.DeletaRegistro('PRODUTOS',cdsProdutosPROD_ID.AsString,'PRODUTOS_BAR;PRODUTOS_COMP') then begin
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
          sql.Add('DELETE FROM PRODUTOS_BAR');
          sql.Add('WHERE  PRCB_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    PRCB_PROD_ID      = ' + cdsProdutosPROD_ID.AsString);
          sql.Add('AND    PRCB_PROD_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
          SQL.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          SQL.Add('DELETE FROM PRODUTOS_COMP');
          SQL.Add('WHERE  PRCP_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          SQL.Add('AND    PRCP_PROD_ID      = ' + cdsProdutosPROD_ID.AsString);
          SQL.Add('AND    PRCP_PROD_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmProdutos','cdsProdutosBeforeDelete',e.Message);
        funcLocal.Alerta('Erro na exclusão do registro selecioando.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmProdutos.cdsProdutosCodFornecNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRCF_ID').AsString             := funcLocal.ObterSequencia('PRODUTOS_COD_FORNEC',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('PRCF_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCF_PROD_ID').AsInteger       := cdsProdutosPROD_ID.AsInteger;
  DataSet.FieldByName('PRCF_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('PRCF_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PRCF_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmProdutos.cdsProdutosNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PROD_ID').AsString                     := funcLocal.ObterSequencia('PRODUTOS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('PROD_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('PROD_ATIVO').AsInteger                 := 1;
  DataSet.FieldByName('PROD_FLG_ESTOQUE').AsInteger           := 1;
  DataSet.FieldByName('PROD_ESTQ_INICIAL').AsInteger          := 0;
  DataSet.FieldByName('PROD_ESTQ_MINIMO').AsInteger           := 0;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_TP_PROD').AsInteger  := 0;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_TP_PROD').AsInteger  := 10;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_GRUPO').AsInteger    := funcLocal.Empr_ID;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_GRUPO').AsInteger    := 503;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_MARCA').AsInteger    := funcLocal.Empr_ID;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_MARCA').AsInteger    := 504;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_MODELO').AsInteger   := funcLocal.Empr_ID;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_MODELO').AsInteger   := 507;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_ALQ_ECF').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_ALQ_ECF').AsInteger  := 508;
  DataSet.FieldByName('PROD_GENE_EMPR_ID_UNID').AsInteger     := 0;
  DataSet.FieldByName('PROD_GENE_TGEN_ID_UNID').AsInteger     := 519;
  DataSet.FieldByName('PROD_VLR_CUSTO').AsFloat               := 0;
  DataSet.FieldByName('PROD_GARANTIA').AsInteger              := 0;
  DataSet.FieldByName('PROD_FLG_FRACIONADO').AsInteger        := 0;
  DataSet.FieldByName('PROD_GRADE').AsInteger                 := 0;
  DataSet.FieldByName('PROD_FLG_ESTOQUE').AsInteger           := 1;
  DataSet.FieldByName('PROD_TIPO_COMISSAO').AsInteger         := 0;
  DataSet.FieldByName('PROD_COMISSAO_VEND_INTERNA').AsFloat   := 0;
  DataSet.FieldByName('PROD_COMISSAO_VEND_EXTERNO').AsFloat   := 0;
  DataSet.FieldByName('PROD_COMISSAO_VEND_BALCAO').AsFloat    := 0;
  DataSet.FieldByName('PROD_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PROD_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmProdutos.cdsProdutosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmProdutos','cdsProdutosReconcileError',e.Message);
  funcLocal.Alerta('Erro na inserção do novo registro.'+#13+'['+e.Message+']',1)
end;

initialization
  if dmProdutos = nil then
    dmProdutos := TdmProdutos.Create(nil);
finalization
  FreeAndNil(dmProdutos);

end.
