unit udmEntradaNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmEntradaNotaFiscal = class(TdmBasico)
    qryEntradaNotaFiscal: TSQLQuery;
    dspEntradaNotaFiscal: TDataSetProvider;
    cdsEntradaNotaFiscal: TClientDataSet;
    dsEntradaNotaFiscal: TDataSource;
    qryItensNotaFiscal: TSQLQuery;
    dspItensNotaFiscal: TDataSetProvider;
    cdsItensNotaFiscal: TClientDataSet;
    dsItensNotaFiscal: TDataSource;
    qryAcertosNotaFiscal: TSQLQuery;
    dspAcertosNotaFiscal: TDataSetProvider;
    cdsAcertosNotaFiscal: TClientDataSet;
    dsAcertosNotaFiscal: TDataSource;
    qryEntradaNotaFiscalNFEN_ID: TIntegerField;
    qryEntradaNotaFiscalNFEN_EMPR_ID: TIntegerField;
    qryEntradaNotaFiscalNFEN_FORN_ID: TIntegerField;
    qryEntradaNotaFiscalNFEN_DTA_EMISSAO: TDateField;
    qryEntradaNotaFiscalNFEN_DTA_ENTRADA: TDateField;
    qryEntradaNotaFiscalNFEN_NR_NOTA: TIntegerField;
    qryEntradaNotaFiscalNFEN_NR_SERIE: TIntegerField;
    qryEntradaNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_CONCILIADO: TIntegerField;
    qryEntradaNotaFiscalNFEN_DTA_CONCILIADO: TDateField;
    qryEntradaNotaFiscalNFEN_DTA_CANCELADO: TDateField;
    qryEntradaNotaFiscalNFEN_USER_ID_CANC: TIntegerField;
    qryEntradaNotaFiscalNFEN_MOTIVO_CANC: TBlobField;
    qryEntradaNotaFiscalNFEN_DTA_CADASTRO: TDateField;
    qryEntradaNotaFiscalNFEN_USER_ID: TIntegerField;
    qryEntradaNotaFiscalFORN_NOME_FANTASIA: TStringField;
    qryEntradaNotaFiscalUSER_CANC: TStringField;
    cdsEntradaNotaFiscalNFEN_ID: TIntegerField;
    cdsEntradaNotaFiscalNFEN_EMPR_ID: TIntegerField;
    cdsEntradaNotaFiscalNFEN_FORN_ID: TIntegerField;
    cdsEntradaNotaFiscalNFEN_DTA_EMISSAO: TDateField;
    cdsEntradaNotaFiscalNFEN_DTA_ENTRADA: TDateField;
    cdsEntradaNotaFiscalNFEN_NR_NOTA: TIntegerField;
    cdsEntradaNotaFiscalNFEN_NR_SERIE: TIntegerField;
    cdsEntradaNotaFiscalNFEN_VLR_TOTAL_PROD: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_CONCILIADO: TIntegerField;
    cdsEntradaNotaFiscalNFEN_DTA_CONCILIADO: TDateField;
    cdsEntradaNotaFiscalNFEN_DTA_CANCELADO: TDateField;
    cdsEntradaNotaFiscalNFEN_USER_ID_CANC: TIntegerField;
    cdsEntradaNotaFiscalNFEN_MOTIVO_CANC: TBlobField;
    cdsEntradaNotaFiscalNFEN_DTA_CADASTRO: TDateField;
    cdsEntradaNotaFiscalNFEN_USER_ID: TIntegerField;
    cdsEntradaNotaFiscalFORN_NOME_FANTASIA: TStringField;
    cdsEntradaNotaFiscalUSER_CANC: TStringField;
    qryItensNotaFiscalNFIT_ID: TIntegerField;
    qryItensNotaFiscalNFIT_EMPR_ID: TIntegerField;
    qryItensNotaFiscalNFIT_NFEN_ID: TIntegerField;
    qryItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField;
    qryItensNotaFiscalNFIT_PROD_ID: TIntegerField;
    qryItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField;
    qryItensNotaFiscalNFIT_QTDE: TFMTBCDField;
    qryItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField;
    qryItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField;
    qryItensNotaFiscalNFIT_DTA_CADASTRO: TDateField;
    qryItensNotaFiscalNFIT_USER_ID: TIntegerField;
    qryItensNotaFiscalPROD_DESCRICAO: TStringField;
    qryItensNotaFiscalPROD_UNIDADE: TStringField;
    qryItensNotaFiscalGRUPO_PROD: TStringField;
    qryItensNotaFiscalMARCA_PROD: TStringField;
    qryItensNotaFiscalMODELO_PROD: TStringField;
    cdsItensNotaFiscalNFIT_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_NFEN_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_NFEN_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_PROD_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_PROD_EMPR_ID: TIntegerField;
    cdsItensNotaFiscalNFIT_QTDE: TFMTBCDField;
    cdsItensNotaFiscalNFIT_VLR_UNITARIO: TFMTBCDField;
    cdsItensNotaFiscalNFIT_VLR_TOTAL_ITEM: TFMTBCDField;
    cdsItensNotaFiscalNFIT_DTA_CADASTRO: TDateField;
    cdsItensNotaFiscalNFIT_USER_ID: TIntegerField;
    cdsItensNotaFiscalPROD_DESCRICAO: TStringField;
    cdsItensNotaFiscalPROD_UNIDADE: TStringField;
    cdsItensNotaFiscalGRUPO_PROD: TStringField;
    cdsItensNotaFiscalMARCA_PROD: TStringField;
    cdsItensNotaFiscalMODELO_PROD: TStringField;
    qryPesqFornec: TSQLQuery;
    dspPesqFornec: TDataSetProvider;
    cdsPesqFornec: TClientDataSet;
    cdsPesqFornecFORN_ID: TIntegerField;
    cdsPesqFornecFORN_NOME_FANTASIA: TStringField;
    cdsPesqFornecFORN_RAZAO_SOCIAL: TStringField;
    cdsPesqFornecFORN_CNPJ_CPF: TStringField;
    qryPesqProdutos: TSQLQuery;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPROD_ID: TIntegerField;
    cdsPesqProdutosPROD_DESCRICAO: TStringField;
    cdsPesqProdutosPROD_UNIDADE: TStringField;
    cdsPesqProdutosGRUPO_PROD: TStringField;
    cdsPesqProdutosMARCA_PROD: TStringField;
    cdsPesqProdutosMODELO_PROD: TStringField;
    cdsItensNotaFiscalTOTAL_ITENS: TAggregateField;
    qryEntradaNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_TOTAL_DESC: TFMTBCDField;
    qryAcertosNotaFiscalNFAC_ID: TIntegerField;
    qryAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField;
    qryAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField;
    qryAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField;
    qryAcertosNotaFiscalNFAC_DESCRICAO: TStringField;
    qryAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField;
    qryAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField;
    qryAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField;
    qryAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField;
    qryAcertosNotaFiscalNFAC_DTA_LANC: TDateField;
    qryAcertosNotaFiscalNFAC_DTA_VCTO: TDateField;
    qryAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField;
    qryAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField;
    qryAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField;
    qryAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField;
    qryAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField;
    qryAcertosNotaFiscalNFAC_USER_ID: TIntegerField;
    qryAcertosNotaFiscalTIPO_DOC: TStringField;
    cdsAcertosNotaFiscalNFAC_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_EMPR_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_NFEN_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_NFEN_EMPR_ID: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DESCRICAO: TStringField;
    cdsAcertosNotaFiscalNFAC_NR_DOCUMENTO: TStringField;
    cdsAcertosNotaFiscalNFAC_GENE_EMPR_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_GENE_TGEN_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_GENE_ID_TP_DOC: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DTA_LANC: TDateField;
    cdsAcertosNotaFiscalNFAC_DTA_VCTO: TDateField;
    cdsAcertosNotaFiscalNFAC_VALOR_DOC: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_VALOR_JUROS: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_VALOR_MORA: TFMTBCDField;
    cdsAcertosNotaFiscalNFAC_CONCILIADO: TIntegerField;
    cdsAcertosNotaFiscalNFAC_DTA_CADASTRO: TDateField;
    cdsAcertosNotaFiscalNFAC_USER_ID: TIntegerField;
    cdsAcertosNotaFiscalTIPO_DOC: TStringField;
    cdsAcertosNotaFiscalTOTAL_TITULO: TAggregateField;
    qryPesqDoc: TSQLQuery;
    dspPesqDoc: TDataSetProvider;
    cdsPesqDoc: TClientDataSet;
    cdsPesqDocGENE_ID: TIntegerField;
    cdsPesqDocGENE_DESCR: TStringField;
    cdsPesqProdutosPROD_FLG_FRACIONADO: TIntegerField;
    qryItensNotaFiscalPROD_FLG_FRACIONADO: TIntegerField;
    cdsItensNotaFiscalPROD_FLG_FRACIONADO: TIntegerField;
    qryEntradaNotaFiscalNFEN_CHAVEACESSO_NFE: TStringField;
    cdsEntradaNotaFiscalNFEN_CHAVEACESSO_NFE: TStringField;
    qryEntradaNotaFiscalFORN_CNPJ_CPF: TStringField;
    qryEntradaNotaFiscalFORN_IE: TStringField;
    qryEntradaNotaFiscalFORN_ENDERECO: TStringField;
    qryEntradaNotaFiscalFORN_BAIRRO: TStringField;
    qryEntradaNotaFiscalFORN_CEP: TStringField;
    qryEntradaNotaFiscalGENE_DESCR: TStringField;
    qryEntradaNotaFiscalGENE_PAR1: TStringField;
    qryEntradaNotaFiscalFORN_TELEFONE: TStringField;
    cdsEntradaNotaFiscalFORN_CNPJ_CPF: TStringField;
    cdsEntradaNotaFiscalFORN_IE: TStringField;
    cdsEntradaNotaFiscalFORN_ENDERECO: TStringField;
    cdsEntradaNotaFiscalFORN_BAIRRO: TStringField;
    cdsEntradaNotaFiscalFORN_CEP: TStringField;
    cdsEntradaNotaFiscalGENE_DESCR: TStringField;
    cdsEntradaNotaFiscalGENE_PAR1: TStringField;
    cdsEntradaNotaFiscalFORN_TELEFONE: TStringField;
    qryEntradaNotaFiscalNFEN_BASE_CALC_ICMS: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_ICMS: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_BASE_CALC_ICMS_SUBST: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_ICMS_SUBST: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_FRETE: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_SEGURO: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_OUTRAS_DESPESAS: TFMTBCDField;
    qryEntradaNotaFiscalNFEN_VLR_IPI: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_BASE_CALC_ICMS: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_ICMS: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_BASE_CALC_ICMS_SUBST: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_ICMS_SUBST: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_FRETE: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_SEGURO: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_OUTRAS_DESPESAS: TFMTBCDField;
    cdsEntradaNotaFiscalNFEN_VLR_IPI: TFMTBCDField;
    cdsPesqFornecFORN_IE: TStringField;
    cdsPesqFornecFORN_CEP: TStringField;
    cdsPesqFornecFORN_ENDERECO: TStringField;
    cdsPesqFornecFORN_BAIRRO: TStringField;
    cdsPesqFornecGENE_DESCR: TStringField;
    cdsPesqFornecGENE_PAR1: TStringField;
    cdsPesqFornecFORN_TELEFONE: TStringField;
    qryEntradaNotaFiscalNFEN_MODELO_NF: TIntegerField;
    cdsEntradaNotaFiscalNFEN_MODELO_NF: TIntegerField;
    cdsPesqProdutosCOD_FORNEC1: TIntegerField;
    cdsPesqProdutosCOD_FORNEC2: TIntegerField;
    cdsPesqProdutosCOD_FORNEC3: TIntegerField;
    cdsPesqProdutosCOD_FORNEC4: TIntegerField;
    procedure cdsEntradaNotaFiscalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsEntradaNotaFiscalNewRecord(DataSet: TDataSet);
    procedure cdsItensNotaFiscalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsItensNotaFiscalNewRecord(DataSet: TDataSet);
    procedure cdsAcertosNotaFiscalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAcertosNotaFiscalNewRecord(DataSet: TDataSet);
    procedure cdsEntradaNotaFiscalBeforeDelete(DataSet: TDataSet);
  private
  public
    { Public declarations }
  end;

var
  dmEntradaNotaFiscal: TdmEntradaNotaFiscal;

implementation

{$R *.dfm}

procedure TdmEntradaNotaFiscal.cdsAcertosNotaFiscalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NFAC_ID').AsString                   := funcLocal.ObterSequencia('NOTA_FISCAL_ACERTOS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('NFAC_EMPR_ID').AsInteger             := funcLocal.Empr_ID;
  DataSet.FieldByName('NFAC_NFEN_ID').AsInteger             := cdsEntradaNotaFiscalNFEN_ID.AsInteger;
  DataSet.FieldByName('NFAC_NFEN_EMPR_ID').AsInteger        := funcLocal.Empr_ID;
  DataSet.FieldByName('NFAC_DESCRICAO').AsString            := 'REFERENTE A ENTRADA NF. NRº ' + cdsEntradaNotaFiscalNFEN_NR_NOTA.AsString;
  DataSet.FieldByName('NFAC_GENE_EMPR_ID_TP_DOC').AsInteger := 0;
  DataSet.FieldByName('NFAC_GENE_TGEN_ID_TP_DOC').AsInteger := 5;
  DataSet.FieldByName('NFAC_DTA_LANC').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFAC_DTA_VCTO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  try
    DataSet.FieldByName('NFAC_VALOR_DOC').AsFloat           := (cdsEntradaNotaFiscalNFEN_VLR_TOTAL_NOTA.AsFloat - cdsAcertosNotaFiscalTOTAL_TITULO.Value);
  except
    DataSet.FieldByName('NFAC_VALOR_DOC').AsFloat           := 0;
  end;
  DataSet.FieldByName('NFAC_VALOR_JUROS').AsFloat           := funcLocal.Juro;
  DataSet.FieldByName('NFAC_VALOR_MORA').AsFloat            := funcLocal.Mora;
  DataSet.FieldByName('NFAC_NR_DOCUMENTO').AsString         := cdsEntradaNotaFiscalNFEN_NR_NOTA.AsString;
  DataSet.FieldByName('NFAC_CONCILIADO').AsInteger          := 0;
  DataSet.FieldByName('NFAC_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFAC_USER_ID').AsInteger             := funcLocal.User_ID;
end;

procedure TdmEntradaNotaFiscal.cdsAcertosNotaFiscalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmEntradaNotaFiscal','cdsAcertosNotaFiscalReconcileError',e.Message);
end;

procedure TdmEntradaNotaFiscal.cdsEntradaNotaFiscalBeforeDelete(
  DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if funcLocal.DeletaRegistro('NOTA_FISCAL',cdsEntradaNotaFiscalNFEN_ID.AsString,'NOTA_FISCAL_ACERTOS;NOTA_FISCAL_ITENS') then begin
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
          sql.Add('DELETE FROM NOTA_FISCAL_ACERTOS');
          sql.Add('WHERE  NFAC_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    NFAC_NFEN_ID      = ' + cdsEntradaNotaFiscalNFEN_ID.AsString);
          sql.Add('AND    NFAC_NFEN_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit;
          except
          end;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('DELETE FROM NOTA_FISCAL_ITENS');
          sql.Add('WHERE  NFIT_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    NFIT_NFEN_ID      = ' + cdsEntradaNotaFiscalNFEN_ID.AsString);
          sql.Add('AND    NFIT_NFEN_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmEntradaNotaFiscal','cdsEntradaNotaFiscalBeforeDelete',e.Message);
        funcLocal.Alerta('Erro no processo de exclusão do registro selecionado.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmEntradaNotaFiscal.cdsEntradaNotaFiscalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NFEN_ID').AsString                   := funcLocal.ObterSequencia('NOTA_FISCAL',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('NFEN_EMPR_ID').AsInteger             := funcLocal.Empr_ID;
  DataSet.FieldByName('NFEN_DTA_EMISSAO').AsDateTime        := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFEN_DTA_ENTRADA').AsDateTime        := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFEN_VLR_TOTAL_PROD').AsFloat        := 0;
  DataSet.FieldByName('NFEN_VLR_TOTAL_DESC').AsFloat        := 0;
  DataSet.FieldByName('NFEN_VLR_TOTAL_NOTA').AsFloat        := 0;
  DataSet.FieldByName('NFEN_CONCILIADO').AsInteger          := 0;
  DataSet.FieldByName('NFEN_BASE_CALC_ICMS').AsFloat        := 0;
  DataSet.FieldByName('NFEN_VLR_ICMS').AsFloat              := 0;
  DataSet.FieldByName('NFEN_BASE_CALC_ICMS_SUBST').AsFloat  := 0;
  DataSet.FieldByName('NFEN_VLR_ICMS_SUBST').AsFloat        := 0;
  DataSet.FieldByName('NFEN_VLR_FRETE').AsFloat             := 0;
  DataSet.FieldByName('NFEN_VLR_SEGURO').AsFloat            := 0;
  DataSet.FieldByName('NFEN_VLR_OUTRAS_DESPESAS').AsFloat   := 0;
  DataSet.FieldByName('NFEN_VLR_IPI').AsFloat               := 0;
  DataSet.FieldByName('NFEN_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFEN_USER_ID').AsInteger             := funcLocal.User_ID;
end;

procedure TdmEntradaNotaFiscal.cdsEntradaNotaFiscalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmEntradaNotaFiscal','cdsEntradaNotaFiscalReconcileError',e.Message);
end;

procedure TdmEntradaNotaFiscal.cdsItensNotaFiscalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NFIT_ID').AsString             := funcLocal.ObterSequencia('NOTA_FISCAL_ITENS',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('NFIT_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('NFIT_NFEN_ID').AsInteger       := cdsEntradaNotaFiscalNFEN_ID.AsInteger;
  DataSet.FieldByName('NFIT_NFEN_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('NFIT_PROD_EMPR_ID').AsInteger  := funcLocal.Empr_ID;
  DataSet.FieldByName('NFIT_QTDE').AsInteger          := 0;
  DataSet.FieldByName('NFIT_VLR_UNITARIO').AsFloat    := 0;
  DataSet.FieldByName('NFIT_VLR_TOTAL_ITEM').AsFloat  := 0;
  DataSet.FieldByName('NFIT_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('NFIT_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmEntradaNotaFiscal.cdsItensNotaFiscalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
  funcLocal.ReportaErro('TdmEntradaNotaFiscal','cdsItensNotaFiscalReconcileError',e.Message);
end;

initialization
  if dmEntradaNotaFiscal = nil then
    dmEntradaNotaFiscal := TdmEntradaNotaFiscal.Create(nil);
finalization
  FreeAndNil(dmEntradaNotaFiscal);

end.
