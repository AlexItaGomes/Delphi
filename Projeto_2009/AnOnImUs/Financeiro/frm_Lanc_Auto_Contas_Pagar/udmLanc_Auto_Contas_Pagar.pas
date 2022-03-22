unit udmLanc_Auto_Contas_Pagar;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmLanc_Auto_Contas_Pagar = class(TDataModule)
    qryContas_Pagar: TSQLQuery;
    qryContas_PagarCPAG_ID: TIntegerField;
    qryContas_PagarCPAG_EMPR_ID: TIntegerField;
    qryContas_PagarCPAG_NR_DOC: TStringField;
    qryContas_PagarCPAG_PROVENIENTE: TStringField;
    qryContas_PagarCPAG_FORN_ID: TIntegerField;
    qryContas_PagarCPAG_PLCT_ID: TIntegerField;
    qryContas_PagarCPAG_PLCT_EMPR_ID: TIntegerField;
    qryContas_PagarCPAG_DTA_EMISSAO: TDateField;
    qryContas_PagarCPAG_DTA_VCTO: TDateField;
    qryContas_PagarCPAG_DTA_PGTO: TDateField;
    qryContas_PagarCPAG_STATUS: TStringField;
    qryContas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    qryContas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    qryContas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField;
    qryContas_PagarCPAG_OBS: TBlobField;
    qryContas_PagarCPAG_USER_ID_CANC: TIntegerField;
    qryContas_PagarCPAG_DTA_CANC: TDateField;
    qryContas_PagarCPAG_MOTIVO_CANC: TStringField;
    qryContas_PagarCPAG_DTA_CADASTRO: TDateField;
    qryContas_PagarCPAG_USER_ID: TIntegerField;
    qryContas_PagarFORN_NOME_FANTASIA: TStringField;
    qryContas_PagarPLCT_DESCRICAO: TStringField;
    qryContas_PagarTIPO_DOC: TStringField;
    qryContas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    qryContas_PagarSTATUS: TStringField;
    qryContas_PagarBANCO: TStringField;
    qryContas_PagarCOD_BANCO: TStringField;
    qryContas_PagarCBCO_AGENCIA: TStringField;
    qryContas_PagarCBCO_CONTA: TStringField;
    qryContas_PagarCBCO_TIPO: TStringField;
    qryContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField;
    qryContas_PagarCBCO_LIMITE: TFMTBCDField;
    qryContas_PagarCPAG_VIA_BANCO: TIntegerField;
    qryContas_PagarCPAG_CBCO_ID: TIntegerField;
    qryContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField;
    dspContas_Pagar: TDataSetProvider;
    cdsContas_Pagar: TClientDataSet;
    cdsContas_PagarSTATUS: TStringField;
    cdsContas_PagarCPAG_STATUS: TStringField;
    cdsContas_PagarCPAG_ID: TIntegerField;
    cdsContas_PagarCPAG_PROVENIENTE: TStringField;
    cdsContas_PagarCPAG_DTA_EMISSAO: TDateField;
    cdsContas_PagarCPAG_DTA_VCTO: TDateField;
    cdsContas_PagarCPAG_DTA_PGTO: TDateField;
    cdsContas_PagarPLCT_DESCRICAO: TStringField;
    cdsContas_PagarCPAG_FORN_ID: TIntegerField;
    cdsContas_PagarFORN_NOME_FANTASIA: TStringField;
    cdsContas_PagarCPAG_NR_DOC: TStringField;
    cdsContas_PagarTIPO_DOC: TStringField;
    cdsContas_PagarCPAG_PLCT_ID: TIntegerField;
    cdsContas_PagarCPAG_PLCT_EMPR_ID: TIntegerField;
    cdsContas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_OBS: TBlobField;
    cdsContas_PagarCPAG_USER_ID_CANC: TIntegerField;
    cdsContas_PagarCPAG_DTA_CANC: TDateField;
    cdsContas_PagarCPAG_MOTIVO_CANC: TStringField;
    cdsContas_PagarCPAG_DTA_CADASTRO: TDateField;
    cdsContas_PagarCPAG_USER_ID: TIntegerField;
    cdsContas_PagarCPAG_EMPR_ID: TIntegerField;
    cdsContas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContas_PagarBANCO: TStringField;
    cdsContas_PagarCOD_BANCO: TStringField;
    cdsContas_PagarCBCO_AGENCIA: TStringField;
    cdsContas_PagarCBCO_CONTA: TStringField;
    cdsContas_PagarCBCO_TIPO: TStringField;
    cdsContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContas_PagarCBCO_LIMITE: TFMTBCDField;
    cdsContas_PagarCPAG_VIA_BANCO: TIntegerField;
    cdsContas_PagarCPAG_CBCO_ID: TIntegerField;
    cdsContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField;
    dsContas_Pagar: TDataSource;
    qryPesq_Plano_Contas: TSQLQuery;
    dspPesq_Plano_Contas: TDataSetProvider;
    cdsPesq_Plano_Contas: TClientDataSet;
    cdsPesq_Plano_ContasPLCT_ID: TIntegerField;
    cdsPesq_Plano_ContasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesq_Plano_ContasPLCT_DESCRICAO: TStringField;
    dsPesq_Plano_Contas: TDataSource;
    qryPesq_Tipo_Doc: TSQLQuery;
    dspPesq_Tipo_Doc: TDataSetProvider;
    cdsPesq_Tipo_Doc: TClientDataSet;
    cdsPesq_Tipo_DocGENE_ID: TIntegerField;
    cdsPesq_Tipo_DocGENE_DESCR: TStringField;
    dsPesq_Tipo_Doc: TDataSource;
    qryPesq_Conta: TSQLQuery;
    dspPesq_Conta: TDataSetProvider;
    cdsPesq_Conta: TClientDataSet;
    cdsPesq_ContaCBCO_ID: TIntegerField;
    cdsPesq_ContaCOD_BANCO: TStringField;
    cdsPesq_ContaBANCO: TStringField;
    cdsPesq_ContaSALDO_ATUAL: TFMTBCDField;
    cdsPesq_ContaCBCO_LIMITE: TFMTBCDField;
    dsPesq_Conta: TDataSource;
    cdsPesq_ContaCBCO_DESCRICAO: TStringField;
    qryContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    qryPesq_Fornecedor: TSQLQuery;
    dspPesq_Fornecedor: TDataSetProvider;
    cdsPesq_Fornecedor: TClientDataSet;
    cdsPesq_FornecedorFORN_ID: TIntegerField;
    cdsPesq_FornecedorFORN_NOME_FANTASIA: TStringField;
    cdsPesq_FornecedorFORN_RAZAO_SOCIAL: TStringField;
    cdsPesq_FornecedorFORN_CNPJ_CPF: TStringField;
    dsPesq_Fornecedor: TDataSource;
    qryContas_PagarCPAG_DTA_EFETIVO: TDateField;
    cdsContas_PagarCPAG_DTA_EFETIVO: TDateField;
    cdsPesq_FornecedorFORN_TIPO: TStringField;
    cdsPesq_FornecedorFORN_CEP: TStringField;
    cdsPesq_FornecedorFORN_ENDERECO: TStringField;
    cdsPesq_FornecedorFORN_BAIRRO: TStringField;
    cdsPesq_FornecedorFORN_CONTATO: TStringField;
    cdsPesq_FornecedorFORN_TELEFONE: TStringField;
    cdsPesq_FornecedorFORN_FAX: TStringField;
    cdsPesq_FornecedorCIDADE: TStringField;
    cdsPesq_FornecedorUF: TStringField;
    qryContas_PagarCPAG_PREVISAO: TIntegerField;
    cdsContas_PagarCPAG_PREVISAO: TIntegerField;
    qryContas_PagarCPAG_CCRE_ID: TIntegerField;
    qryContas_PagarCPAG_CCRE_EMPR_ID: TIntegerField;
    qryContas_PagarCCRE_ATIVO: TStringField;
    qryContas_PagarCCRE_TIPO_CARTAO: TStringField;
    qryContas_PagarCCRE_NUMERO_CARTAO: TStringField;
    qryContas_PagarCCRE_VENCIMENTO: TStringField;
    qryContas_PagarCCRE_TITULAR: TStringField;
    qryContas_PagarCCRE_LIMITE_SAQUE: TFMTBCDField;
    qryContas_PagarCCRE_LIMITE_COMPRAS: TFMTBCDField;
    qryContas_PagarCCRE_DIA_VCTO_FATURA: TIntegerField;
    qryContas_PagarCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    qryContas_PagarCCRE_CBCO_ID: TIntegerField;
    qryContas_PagarCCRE_CBCO_EMPR_ID: TIntegerField;
    qryContas_PagarCCRE_IMAGE: TBlobField;
    cdsContas_PagarCPAG_CCRE_ID: TIntegerField;
    cdsContas_PagarCPAG_CCRE_EMPR_ID: TIntegerField;
    cdsContas_PagarCCRE_ATIVO: TStringField;
    cdsContas_PagarCCRE_TIPO_CARTAO: TStringField;
    cdsContas_PagarCCRE_NUMERO_CARTAO: TStringField;
    cdsContas_PagarCCRE_VENCIMENTO: TStringField;
    cdsContas_PagarCCRE_TITULAR: TStringField;
    cdsContas_PagarCCRE_LIMITE_SAQUE: TFMTBCDField;
    cdsContas_PagarCCRE_LIMITE_COMPRAS: TFMTBCDField;
    cdsContas_PagarCCRE_DIA_VCTO_FATURA: TIntegerField;
    cdsContas_PagarCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    cdsContas_PagarCCRE_CBCO_ID: TIntegerField;
    cdsContas_PagarCCRE_CBCO_EMPR_ID: TIntegerField;
    cdsContas_PagarCCRE_IMAGE: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_PagarReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_PagarNewRecord(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmLanc_Auto_Contas_Pagar: TdmLanc_Auto_Contas_Pagar;

implementation

{$R *.dfm}

procedure TdmLanc_Auto_Contas_Pagar.cdsContas_PagarNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CPAG_ID').AsString                     := funcLocal.ObterSequencia('CONTAS_PAGAR',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('CPAG_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_STATUS').AsString                 := 'F';
  DataSet.FieldByName('CPAG_DTA_EMISSAO').AsDateTime          := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CPAG_DTA_VCTO').AsDateTime             := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CPAG_VALOR_DOC').AsFloat               := 0;
  DataSet.FieldByName('CPAG_VALOR_JUROS').AsFloat             := 0;
  DataSet.FieldByName('CPAG_VALOR_MORA').AsFloat              := 0;
  DataSet.FieldByName('CPAG_VALOR_PAGO').AsFloat              := 0;
  DataSet.FieldByName('CPAG_PLCT_EMPR_ID').AsInteger          := 0;
  DataSet.FieldByName('CPAG_GENE_EMPR_ID_TIPO_DOC').AsInteger := 0;
  DataSet.FieldByName('CPAG_GENE_TGEN_ID_TIPO_DOC').AsInteger := 5;
  DataSet.FieldByName('CPAG_VIA_BANCO').AsInteger             := 0;
  DataSet.FieldByName('CPAG_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_DTA_PGTO').AsDateTime             := funcLocal.DataServidor();
  DataSet.FieldByName('CPAG_DTA_EFETIVO').AsDateTime          := funcLocal.DataServidor();
  DataSet.FieldByName('CPAG_PREVISAO').AsInteger              := 0;
  DataSet.FieldByName('CPAG_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor();
  DataSet.FieldByName('CPAG_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmLanc_Auto_Contas_Pagar.cdsContas_PagarReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmLanc_Auto_Contas_Pagar','cdsContas_PagarReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmLanc_Auto_Contas_Pagar.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

initialization
  if dmLanc_Auto_Contas_Pagar = nil then
    dmLanc_Auto_Contas_Pagar := TdmLanc_Auto_Contas_Pagar.Create(nil);
finalization
    FreeAndNil(dmLanc_Auto_Contas_Pagar);

end.
