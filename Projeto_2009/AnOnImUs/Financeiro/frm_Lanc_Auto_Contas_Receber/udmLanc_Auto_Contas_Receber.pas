unit udmLanc_Auto_Contas_Receber;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmLanc_Auto_Contas_Receber = class(TDataModule)
    qryContas_Receber: TSQLQuery;
    qryContas_ReceberSTATUS: TStringField;
    qryContas_ReceberCREC_STATUS: TStringField;
    qryContas_ReceberCREC_ID: TIntegerField;
    qryContas_ReceberCREC_PROVENIENTE: TStringField;
    qryContas_ReceberCREC_DTA_EMISSAO: TDateField;
    qryContas_ReceberCREC_DTA_VCTO: TDateField;
    qryContas_ReceberCREC_DTA_PGTO: TDateField;
    qryContas_ReceberPLCT_DESCRICAO: TStringField;
    qryContas_ReceberCREC_CLIE_ID: TIntegerField;
    qryContas_ReceberCLIE_RAZAO_SOCIAL: TStringField;
    qryContas_ReceberCREC_NR_DOC: TStringField;
    qryContas_ReceberTIPO_DOC: TStringField;
    qryContas_ReceberCREC_PLCT_ID: TIntegerField;
    qryContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_OBS: TBlobField;
    qryContas_ReceberCREC_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_CLIE_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_USER_ID_CANC: TIntegerField;
    qryContas_ReceberCREC_DTA_CANC: TDateField;
    qryContas_ReceberCREC_MOTIVO_CANC: TStringField;
    qryContas_ReceberCREC_DTA_CADASTRO: TDateField;
    qryContas_ReceberCREC_USER_ID: TIntegerField;
    qryContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField;
    qryContas_ReceberCREC_VIA_BANCO: TIntegerField;
    qryContas_ReceberCREC_CBCO_ID: TIntegerField;
    qryContas_ReceberCREC_CBCO_EMPR_ID: TIntegerField;
    qryContas_ReceberBANCO: TStringField;
    qryContas_ReceberCOD_BANCO: TStringField;
    qryContas_ReceberCBCO_AGENCIA: TStringField;
    qryContas_ReceberCBCO_CONTA: TStringField;
    qryContas_ReceberCBCO_TIPO: TStringField;
    qryContas_ReceberCBCO_SALDO_ATUAL: TFMTBCDField;
    qryContas_ReceberCBCO_LIMITE: TFMTBCDField;
    dspContas_Receber: TDataSetProvider;
    cdsContas_Receber: TClientDataSet;
    cdsContas_ReceberSTATUS: TStringField;
    cdsContas_ReceberCREC_STATUS: TStringField;
    cdsContas_ReceberCREC_ID: TIntegerField;
    cdsContas_ReceberCREC_PROVENIENTE: TStringField;
    cdsContas_ReceberCREC_DTA_EMISSAO: TDateField;
    cdsContas_ReceberCREC_DTA_VCTO: TDateField;
    cdsContas_ReceberCREC_DTA_PGTO: TDateField;
    cdsContas_ReceberPLCT_DESCRICAO: TStringField;
    cdsContas_ReceberCREC_CLIE_ID: TIntegerField;
    cdsContas_ReceberCLIE_RAZAO_SOCIAL: TStringField;
    cdsContas_ReceberCREC_NR_DOC: TStringField;
    cdsContas_ReceberTIPO_DOC: TStringField;
    cdsContas_ReceberCREC_PLCT_ID: TIntegerField;
    cdsContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField;
    cdsContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField;
    cdsContas_ReceberCREC_OBS: TBlobField;
    cdsContas_ReceberCREC_EMPR_ID: TIntegerField;
    cdsContas_ReceberCREC_CLIE_EMPR_ID: TIntegerField;
    cdsContas_ReceberCREC_USER_ID_CANC: TIntegerField;
    cdsContas_ReceberCREC_DTA_CANC: TDateField;
    cdsContas_ReceberCREC_MOTIVO_CANC: TStringField;
    cdsContas_ReceberCREC_DTA_CADASTRO: TDateField;
    cdsContas_ReceberCREC_USER_ID: TIntegerField;
    cdsContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContas_ReceberCREC_VIA_BANCO: TIntegerField;
    cdsContas_ReceberCREC_CBCO_ID: TIntegerField;
    cdsContas_ReceberCREC_CBCO_EMPR_ID: TIntegerField;
    cdsContas_ReceberBANCO: TStringField;
    cdsContas_ReceberCOD_BANCO: TStringField;
    cdsContas_ReceberCBCO_AGENCIA: TStringField;
    cdsContas_ReceberCBCO_CONTA: TStringField;
    cdsContas_ReceberCBCO_TIPO: TStringField;
    cdsContas_ReceberCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContas_ReceberCBCO_LIMITE: TFMTBCDField;
    dsContas_Receber: TDataSource;
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
    qryContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    dspPesq_Cliente: TDataSetProvider;
    cdsPesq_Cliente: TClientDataSet;
    cdsPesq_ClienteCLIE_ID: TIntegerField;
    cdsPesq_ClienteCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesq_ClienteCLIE_CNPJ_CPF: TStringField;
    cdsPesq_ClienteCLIE_TIPO: TStringField;
    cdsPesq_ClienteCLIE_FANTASIA: TStringField;
    cdsPesq_ClienteCLIE_CEP: TStringField;
    cdsPesq_ClienteCLIE_ENDERECO: TStringField;
    cdsPesq_ClienteCLIE_BAIRRO: TStringField;
    cdsPesq_ClienteCLIE_TELEFONE1: TStringField;
    cdsPesq_ClienteCLIE_TELEFONE2: TStringField;
    cdsPesq_ClienteCLIE_TELEFONE3: TStringField;
    cdsPesq_ClienteCLIE_TELEFONE4: TStringField;
    cdsPesq_ClienteGENE_DESCR: TStringField;
    cdsPesq_ClienteGENE_PAR1: TStringField;
    dsPesq_Cliente: TDataSource;
    qryPesq_Cliente: TSQLQuery;
    qryContas_ReceberCREC_DTA_EFETIVO: TDateField;
    cdsContas_ReceberCREC_DTA_EFETIVO: TDateField;
    qryContas_ReceberCLIE_FANTASIA: TStringField;
    cdsContas_ReceberCLIE_FANTASIA: TStringField;
    qryContas_ReceberCREC_PREVISAO: TIntegerField;
    cdsContas_ReceberCREC_PREVISAO: TIntegerField;
    qryContas_ReceberCREC_CCRE_ID: TIntegerField;
    qryContas_ReceberCREC_CCRE_EMPR_ID: TIntegerField;
    qryContas_ReceberCCRE_ATIVO: TStringField;
    qryContas_ReceberCCRE_TIPO_CARTAO: TStringField;
    qryContas_ReceberCCRE_NUMERO_CARTAO: TStringField;
    qryContas_ReceberCCRE_VENCIMENTO: TStringField;
    qryContas_ReceberCCRE_TITULAR: TStringField;
    qryContas_ReceberCCRE_LIMITE_SAQUE: TFMTBCDField;
    qryContas_ReceberCCRE_LIMITE_COMPRAS: TFMTBCDField;
    qryContas_ReceberCCRE_DIA_VCTO_FATURA: TIntegerField;
    qryContas_ReceberCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    qryContas_ReceberCCRE_CBCO_ID: TIntegerField;
    qryContas_ReceberCCRE_CBCO_EMPR_ID: TIntegerField;
    qryContas_ReceberCCRE_IMAGE: TBlobField;
    cdsContas_ReceberCREC_CCRE_ID: TIntegerField;
    cdsContas_ReceberCREC_CCRE_EMPR_ID: TIntegerField;
    cdsContas_ReceberCCRE_ATIVO: TStringField;
    cdsContas_ReceberCCRE_TIPO_CARTAO: TStringField;
    cdsContas_ReceberCCRE_NUMERO_CARTAO: TStringField;
    cdsContas_ReceberCCRE_VENCIMENTO: TStringField;
    cdsContas_ReceberCCRE_TITULAR: TStringField;
    cdsContas_ReceberCCRE_LIMITE_SAQUE: TFMTBCDField;
    cdsContas_ReceberCCRE_LIMITE_COMPRAS: TFMTBCDField;
    cdsContas_ReceberCCRE_DIA_VCTO_FATURA: TIntegerField;
    cdsContas_ReceberCCRE_DIA_FECHAMENTO_FATURA: TIntegerField;
    cdsContas_ReceberCCRE_CBCO_ID: TIntegerField;
    cdsContas_ReceberCCRE_CBCO_EMPR_ID: TIntegerField;
    cdsContas_ReceberCCRE_IMAGE: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_ReceberNewRecord(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmLanc_Auto_Contas_Receber: TdmLanc_Auto_Contas_Receber;

implementation

{$R *.dfm}

procedure TdmLanc_Auto_Contas_Receber.cdsContas_ReceberNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('CREC_ID').AsString                     := funcLocal.ObterSequencia('CONTAS_RECEBER',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('CREC_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_STATUS').AsString                 := 'F';
  DataSet.FieldByName('CREC_DTA_EMISSAO').AsDateTime          := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_DTA_VCTO').AsDateTime             := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_VALOR_DOC').AsFloat               := 0;
  DataSet.FieldByName('CREC_VALOR_PAGO').AsFloat              := 0;
  DataSet.FieldByName('CREC_VALOR_JUROS').AsFloat             := 0;
  DataSet.FieldByName('CREC_VALOR_MORA').AsFloat              := 0;
  DataSet.FieldByName('CREC_PLCT_EMPR_ID').AsInteger          := 0;
  DataSet.FieldByName('CREC_CLIE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_GENE_EMPR_ID_TIPO_DOC').AsInteger := 0;
  DataSet.FieldByName('CREC_GENE_TGEN_ID_TIPO_DOC').AsInteger := 5;
  DataSet.FieldByName('CREC_VIA_BANCO').AsInteger             := 0;
  DataSet.FieldByName('CREC_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_DTA_EFETIVO').AsDateTime          := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_DTA_PGTO').AsDateTime             := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_PREVISAO').AsInteger              := 0;
  DataSet.FieldByName('CREC_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmLanc_Auto_Contas_Receber.cdsContas_ReceberReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmLanc_Auto_Contas_Receber','cdsContas_ReceberReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmLanc_Auto_Contas_Receber.DataModuleCreate(Sender: TObject);
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
  if dmLanc_Auto_Contas_Receber = nil then
    dmLanc_Auto_Contas_Receber := TdmLanc_Auto_Contas_Receber.Create(nil);
finalization
  FreeAndNil(dmLanc_Auto_Contas_Receber);

end.
