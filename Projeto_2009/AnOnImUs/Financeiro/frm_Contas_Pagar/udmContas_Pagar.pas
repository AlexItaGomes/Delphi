unit udmContas_Pagar;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmContas_Pagar = class(TDataModule)
    qryContas_Pagar: TSQLQuery;
    dspContas_Pagar: TDataSetProvider;
    cdsContas_Pagar: TClientDataSet;
    dsContas_Pagar: TDataSource;
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
    cdsContas_PagarCPAG_ID: TIntegerField;
    cdsContas_PagarCPAG_EMPR_ID: TIntegerField;
    cdsContas_PagarCPAG_NR_DOC: TStringField;
    cdsContas_PagarCPAG_PROVENIENTE: TStringField;
    cdsContas_PagarCPAG_FORN_ID: TIntegerField;
    cdsContas_PagarCPAG_PLCT_ID: TIntegerField;
    cdsContas_PagarCPAG_PLCT_EMPR_ID: TIntegerField;
    cdsContas_PagarCPAG_DTA_EMISSAO: TDateField;
    cdsContas_PagarCPAG_DTA_VCTO: TDateField;
    cdsContas_PagarCPAG_DTA_PGTO: TDateField;
    cdsContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    cdsContas_PagarCPAG_STATUS: TStringField;
    cdsContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsContas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField;
    cdsContas_PagarCPAG_OBS: TBlobField;
    cdsContas_PagarCPAG_USER_ID_CANC: TIntegerField;
    cdsContas_PagarCPAG_DTA_CANC: TDateField;
    cdsContas_PagarCPAG_MOTIVO_CANC: TStringField;
    cdsContas_PagarCPAG_DTA_CADASTRO: TDateField;
    cdsContas_PagarCPAG_USER_ID: TIntegerField;
    cdsContas_PagarFORN_NOME_FANTASIA: TStringField;
    cdsContas_PagarPLCT_DESCRICAO: TStringField;
    cdsContas_PagarTIPO_DOC: TStringField;
    qryPesq_Fornecedor: TSQLQuery;
    dspPesq_Fornecedor: TDataSetProvider;
    cdsPesq_Fornecedor: TClientDataSet;
    dsPesq_Fornecedor: TDataSource;
    cdsPesq_FornecedorFORN_ID: TIntegerField;
    cdsPesq_FornecedorFORN_NOME_FANTASIA: TStringField;
    cdsPesq_FornecedorFORN_RAZAO_SOCIAL: TStringField;
    cdsPesq_FornecedorFORN_CNPJ_CPF: TStringField;
    qryPesq_Plano_Contas: TSQLQuery;
    dspPesq_Plano_Contas: TDataSetProvider;
    cdsPesq_Plano_Contas: TClientDataSet;
    dsPesq_Plano_Contas: TDataSource;
    cdsPesq_Plano_ContasPLCT_ID: TIntegerField;
    cdsPesq_Plano_ContasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesq_Plano_ContasPLCT_DESCRICAO: TStringField;
    qryPesq_Tipo_Doc: TSQLQuery;
    dspPesq_Tipo_Doc: TDataSetProvider;
    cdsPesq_Tipo_Doc: TClientDataSet;
    dsPesq_Tipo_Doc: TDataSource;
    cdsPesq_Tipo_DocGENE_ID: TIntegerField;
    cdsPesq_Tipo_DocGENE_DESCR: TStringField;
    qryContas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    qryContas_PagarSTATUS: TStringField;
    cdsContas_PagarSTATUS: TStringField;
    qryContas_PagarBANCO: TStringField;
    qryContas_PagarCOD_BANCO: TStringField;
    qryContas_PagarCBCO_AGENCIA: TStringField;
    qryContas_PagarCBCO_CONTA: TStringField;
    qryContas_PagarCBCO_TIPO: TStringField;
    qryContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField;
    qryContas_PagarCBCO_LIMITE: TFMTBCDField;
    cdsContas_PagarBANCO: TStringField;
    cdsContas_PagarCOD_BANCO: TStringField;
    cdsContas_PagarCBCO_AGENCIA: TStringField;
    cdsContas_PagarCBCO_CONTA: TStringField;
    cdsContas_PagarCBCO_TIPO: TStringField;
    cdsContas_PagarCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContas_PagarCBCO_LIMITE: TFMTBCDField;
    qryPesq_Conta: TSQLQuery;
    dspPesq_Conta: TDataSetProvider;
    cdsPesq_Conta: TClientDataSet;
    cdsPesq_ContaCBCO_ID: TIntegerField;
    cdsPesq_ContaCOD_BANCO: TStringField;
    cdsPesq_ContaBANCO: TStringField;
    cdsPesq_ContaSALDO_ATUAL: TFMTBCDField;
    cdsPesq_ContaCBCO_LIMITE: TFMTBCDField;
    dsPesq_Conta: TDataSource;
    qryContas_PagarCPAG_VIA_BANCO: TIntegerField;
    qryContas_PagarCPAG_CBCO_ID: TIntegerField;
    qryContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField;
    cdsContas_PagarCPAG_VIA_BANCO: TIntegerField;
    cdsContas_PagarCPAG_CBCO_ID: TIntegerField;
    cdsContas_PagarCPAG_CBCO_EMPR_ID: TIntegerField;
    cdsContas_PagarVALOR_PAGAR: TFloatField;
    cdsPesq_ContaCBCO_DESCRICAO: TStringField;
    qryContas_Pagar_Mov: TSQLQuery;
    dspContas_Pagar_Mov: TDataSetProvider;
    cdsContas_Pagar_Mov: TClientDataSet;
    dsContas_Pagar_Mov: TDataSource;
    cdsContas_Pagar_MovACPG_ID: TIntegerField;
    cdsContas_Pagar_MovACPG_EMPR_ID: TIntegerField;
    cdsContas_Pagar_MovACPG_CPAG_ID: TIntegerField;
    cdsContas_Pagar_MovACPG_CPAG_EMPR_ID: TIntegerField;
    cdsContas_Pagar_MovACPG_GENE_EMPR_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Pagar_MovACPG_GENE_TGEN_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Pagar_MovACPG_GENE_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Pagar_MovACPG_VALOR_DOC: TFMTBCDField;
    cdsContas_Pagar_MovACPG_DTA_CADASTRO: TDateField;
    cdsContas_Pagar_MovACPG_USER_ID: TIntegerField;
    cdsContas_Pagar_MovGENE_DESCR: TStringField;
    cdsContas_Pagar_MovUSER_LOGIN: TStringField;
    cdsContasPagarParcela: TClientDataSet;
    dsContasPagarParcela: TDataSource;
    cdsContasPagarParcelaSTATUS: TStringField;
    cdsContasPagarParcelaCPAG_STATUS: TStringField;
    cdsContasPagarParcelaCPAG_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_NR_DOC: TStringField;
    cdsContasPagarParcelaCPAG_PROVENIENTE: TStringField;
    cdsContasPagarParcelaFORN_NOME_FANTASIA: TStringField;
    cdsContasPagarParcelaPLCT_DESCRICAO: TStringField;
    cdsContasPagarParcelaCPAG_DTA_EMISSAO: TDateField;
    cdsContasPagarParcelaCPAG_DTA_VCTO: TDateField;
    cdsContasPagarParcelaCPAG_VALOR_PAGO: TFMTBCDField;
    cdsContasPagarParcelaVALOR_PAGAR: TFloatField;
    cdsContasPagarParcelaTIPO_DOC: TStringField;
    cdsContasPagarParcelaCPAG_DTA_PGTO: TDateField;
    cdsContasPagarParcelaCPAG_FORN_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_PLCT_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_PLCT_EMPR_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsContasPagarParcelaCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsContasPagarParcelaCPAG_GENE_ID_TIPO_DOC: TIntegerField;
    cdsContasPagarParcelaCPAG_OBS: TBlobField;
    cdsContasPagarParcelaCPAG_USER_ID_CANC: TIntegerField;
    cdsContasPagarParcelaCPAG_DTA_CANC: TDateField;
    cdsContasPagarParcelaCPAG_MOTIVO_CANC: TStringField;
    cdsContasPagarParcelaCPAG_DTA_CADASTRO: TDateField;
    cdsContasPagarParcelaCPAG_USER_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_EMPR_ID: TIntegerField;
    cdsContasPagarParcelaPLCT_COD_SIMPLIFICADO: TStringField;
    cdsContasPagarParcelaBANCO: TStringField;
    cdsContasPagarParcelaCOD_BANCO: TStringField;
    cdsContasPagarParcelaCBCO_AGENCIA: TStringField;
    cdsContasPagarParcelaCBCO_CONTA: TStringField;
    cdsContasPagarParcelaCBCO_TIPO: TStringField;
    cdsContasPagarParcelaCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContasPagarParcelaCBCO_LIMITE: TFMTBCDField;
    cdsContasPagarParcelaCPAG_VIA_BANCO: TIntegerField;
    cdsContasPagarParcelaCPAG_CBCO_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_CBCO_EMPR_ID: TIntegerField;
    qryContasPagarParcela: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    DateField3: TDateField;
    StringField3: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    BlobField1: TBlobField;
    IntegerField9: TIntegerField;
    DateField4: TDateField;
    StringField4: TStringField;
    DateField5: TDateField;
    IntegerField10: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    dspContasPagarParcela: TDataSetProvider;
    qryContasPagarParcelaCPAG_VALOR_DOC: TFMTBCDField;
    qryContasPagarParcelaCPAG_VALOR_JUROS: TFMTBCDField;
    qryContasPagarParcelaCPAG_VALOR_MORA: TFMTBCDField;
    qryContasPagarParcelaCPAG_VALOR_PAGO: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsContasPagarParcelaCPAG_VALOR_DOC: TFMTBCDField;
    cdsContasPagarParcelaCPAG_VALOR_JUROS: TFMTBCDField;
    cdsContasPagarParcelaCPAG_VALOR_MORA: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
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
    qryContasPagarParcelaCPAG_PREVISAO: TIntegerField;
    cdsContasPagarParcelaCPAG_PREVISAO: TIntegerField;
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
    qryContasPagarParcelaCPAG_CCRE_ID: TIntegerField;
    qryContasPagarParcelaCPAG_CCRE_EMPR_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_CCRE_ID: TIntegerField;
    cdsContasPagarParcelaCPAG_CCRE_EMPR_ID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_PagarBeforeDelete(DataSet: TDataSet);
    procedure cdsContas_PagarReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_PagarNewRecord(DataSet: TDataSet);
    procedure cdsContas_PagarCalcFields(DataSet: TDataSet);
    procedure cdsContasPagarParcelaBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    funcLocal : TFuncoes;
    function getSQL : String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmContas_Pagar: TdmContas_Pagar;

implementation

{$R *.dfm}

procedure TdmContas_Pagar.cdsContasPagarParcelaBeforeApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  cdsContasPagarParcela.First;
  while not cdsContasPagarParcela.Eof do begin
    if cdsContasPagarParcela.FieldByName('CPAG_PREVISAO').AsInteger = 0 then
      funcLocal.BaixarContaReceberPrevisto(cdsContasPagarParcela.FieldByName('CPAG_DTA_VCTO').AsDateTime,
                                          (cdsContasPagarParcela.FieldByName('CPAG_VALOR_DOC').AsFloat*-1),
                                           cdsContasPagarParcela.FieldByName('CPAG_PLCT_ID').AsString);
    cdsContasPagarParcela.Next;
  end;
end;

procedure TdmContas_Pagar.cdsContas_PagarBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CONTAS_PAGAR',cdsContas_PagarCPAG_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmContas_Pagar.cdsContas_PagarCalcFields(DataSet: TDataSet);
var
  morames,dias,valor,valorjuros,valormora : Real;
  dataAtual, dataVencto    : TDateTime;
  diasaux,diasint,jurosmes : Integer;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    dataAtual  := funcLocal.DataServidor(funcLocal.Conexao,false);
    dataVencto := cdsContas_PagarCPAG_DTA_VCTO.AsDateTime;
    dias    := dataAtual - dataVencto;
    diasint := StrToInt(FloatToStr(dias));
    if diasint > 0 then begin
      valor := (cdsContas_PagarCPAG_VALOR_DOC.AsFloat - cdsContas_PagarCPAG_VALOR_PAGO.AsFloat);
      jurosmes := diasint div 30;
      if jurosmes = 0 then
        jurosmes := 1;
      diasaux := diasint - jurosmes;
      if (jurosmes > 1) and ((diasaux mod 30) > 0) then
        jurosmes := jurosmes + 1;
      morames := (cdsContas_PagarCPAG_VALOR_MORA.AsFloat / 30) * diasint;
      valorjuros := (valor * ((jurosmes) * (cdsContas_PagarCPAG_VALOR_JUROS.AsFloat / 100)));
      valormora  := (valor * (morames / 100));
      valor      := StrToFloat(FormatFloat('0.00',valor));
      valormora  := StrToFloat(FormatFloat('0.00',valormora));
      valorjuros := StrToFloat(FormatFloat('0.00',valorjuros));
      cdsContas_PagarVALOR_PAGAR.Value := (valor + valormora + valorjuros);
    end else begin
      cdsContas_PagarVALOR_PAGAR.Value := (cdsContas_PagarCPAG_VALOR_DOC.AsFloat -
                                            cdsContas_PagarCPAG_VALOR_PAGO.AsFloat);
    end;
    FormatSettings.DecimalSeparator := ',';
  except
  end;
end;

procedure TdmContas_Pagar.cdsContas_PagarNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CPAG_ID').AsString                     := funcLocal.ObterSequencia('CONTAS_PAGAR',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('CPAG_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_STATUS').AsString                 := 'A';
  DataSet.FieldByName('CPAG_DTA_EMISSAO').AsDateTime          := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CPAG_VALOR_DOC').AsFloat               := 0;
  DataSet.FieldByName('CPAG_VALOR_JUROS').AsFloat             := 0;
  DataSet.FieldByName('CPAG_VALOR_MORA').AsFloat              := 0;
  DataSet.FieldByName('CPAG_VALOR_PAGO').AsFloat              := 0;
  DataSet.FieldByName('CPAG_PLCT_EMPR_ID').AsInteger          := 0;
  DataSet.FieldByName('CPAG_GENE_EMPR_ID_TIPO_DOC').AsInteger := 0;
  DataSet.FieldByName('CPAG_GENE_TGEN_ID_TIPO_DOC').AsInteger := 5;
  DataSet.FieldByName('CPAG_VIA_BANCO').AsInteger             := 0;
  DataSet.FieldByName('CPAG_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_PREVISAO').AsInteger              := 0;
  DataSet.FieldByName('CPAG_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CPAG_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CPAG_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmContas_Pagar.cdsContas_PagarReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmContas_Pagar','cdsContas_PagarReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmContas_Pagar.DataModuleCreate(Sender: TObject);
var
  formPrinc : TForm;
  intI      : Integer;
begin
  formPrinc  := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  for intI  := 0 to Self.ComponentCount - 1 do begin
    if (Components[intI] is TSQLQuery) then begin
      (Components[intI] as TSQLQuery).SQLConnection := funcLocal.Conexao;
    end;
    if (Components[intI] is TClientDataSet) then begin
      (Components[intI] as TClientDataSet).PacketRecords := 50;
    end;
  end;
end;

function TdmContas_Pagar.getSQL: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CP.CPAG_ID,');
      Add('      CP.CPAG_EMPR_ID,');
      Add('      CP.CPAG_NR_DOC,');
      Add('      CP.CPAG_PROVENIENTE,');
      Add('      CP.CPAG_FORN_ID,');
      Add('      CP.CPAG_PLCT_ID,');
      Add('      CP.CPAG_PLCT_EMPR_ID,');
      Add('      CP.CPAG_DTA_EMISSAO,');
      Add('      CP.CPAG_DTA_VCTO,');
      Add('      CP.CPAG_DTA_PGTO,');
      Add('      COALESCE(CP.CPAG_VALOR_DOC,0) CPAG_VALOR_DOC,');
      Add('      COALESCE(CP.CPAG_VALOR_JUROS,0) CPAG_VALOR_JUROS,');
      Add('      COALESCE(CP.CPAG_VALOR_MORA,0) CPAG_VALOR_MORA,');
      Add('      CP.CPAG_STATUS,');
      Add('      COALESCE(CP.CPAG_VALOR_PAGO,0) CPAG_VALOR_PAGO,');
      Add('      CP.CPAG_GENE_EMPR_ID_TIPO_DOC,');
      Add('      CP.CPAG_GENE_TGEN_ID_TIPO_DOC,');
      Add('      CP.CPAG_GENE_ID_TIPO_DOC,');
      Add('      CP.CPAG_OBS,');
      Add('      CP.CPAG_USER_ID_CANC,');
      Add('      CP.CPAG_DTA_CANC,');
      Add('      CP.CPAG_MOTIVO_CANC,');
      Add('      CP.CPAG_DTA_CADASTRO,');
      Add('      CP.CPAG_USER_ID,');
      Add('      CP.CPAG_VIA_BANCO,');
      Add('      CP.CPAG_CBCO_ID,');
      Add('      CP.CPAG_CBCO_EMPR_ID,');
      Add('      FN.FORN_NOME_FANTASIA,');
      Add('      PC.PLCT_COD_SIMPLIFICADO,');
      Add('      PC.PLCT_DESCRICAO,');
      Add('      TP.GENE_DESCR TIPO_DOC,');
      Add('      CASE CP.CPAG_PREVISAO');
      Add('           WHEN 1 THEN ''Previsão''');
      Add('           ELSE CASE CP.CPAG_STATUS');
      Add('                     WHEN ''A'' THEN ''Aberto''');
      Add('                     WHEN ''F'' THEN ''Fechado''');
      Add('                     WHEN ''C'' THEN ''Cancelado''');
      Add('                 END');
      Add('      END AS STATUS,');
      Add('      BC.GENE_DESCR BANCO,');
      Add('      BC.GENE_PAR1 COD_BANCO,');
      Add('      CB.CBCO_AGENCIA,');
      Add('      CB.CBCO_CONTA,');
      Add('      CB.CBCO_TIPO,');
      Add('      CB.CBCO_SALDO_ATUAL,');
      Add('      CB.CBCO_LIMITE,');
      Add('      CP.CPAG_DTA_EFETIVO,');
      Add('      CP.CPAG_PREVISAO,');
      Add('      CP.CPAG_CCRE_ID,');
      Add('      CP.CPAG_CCRE_EMPR_ID,');
      Add('      CASE CCRE.CCRE_ATIVO');
      Add('           WHEN 1 THEN ''Sim''');
      Add('           ELSE ''Não''');
      Add('      END  AS CCRE_ATIVO,');
      Add('      CASE CCRE.CCRE_TIPO_CARTAO');
      Add('           WHEN ''C'' THEN ''Crédito''');
      Add('           WHEN ''D'' THEN ''Débito''');
      Add('           WHEN ''A'' THEN ''Crédito/Débito''');
      Add('      END  AS CCRE_TIPO_CARTAO,');
      Add('      CCRE.CCRE_NUMERO_CARTAO,');
      Add('      CCRE.CCRE_VENCIMENTO,');
      Add('      CCRE.CCRE_TITULAR,');
      Add('      CCRE.CCRE_LIMITE_SAQUE,');
      Add('      CCRE.CCRE_LIMITE_COMPRAS,');
      Add('      CCRE.CCRE_DIA_VCTO_FATURA,');
      Add('      CCRE.CCRE_DIA_FECHAMENTO_FATURA,');
      Add('      CCRE.CCRE_CBCO_ID,');
      Add('      CCRE.CCRE_CBCO_EMPR_ID,');
      Add('      CCRE.CCRE_IMAGE');
      Add('FROM  CONTAS_PAGAR CP');
      Add('INNER JOIN FORNECEDORES FN');
      Add('ON (FN.FORN_ID = CP.CPAG_FORN_ID)');
      Add('INNER JOIN PLANO_CONTAS PC');
      Add('ON (PC.PLCT_ID      = CP.CPAG_PLCT_ID');
      Add('AND PC.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)');
      Add('INNER JOIN GENERICA TP');
      Add('ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC');
      Add('AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC');
      Add('AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)');
      Add('LEFT OUTER JOIN CONTAS_BANCARIAS CB');
      Add('ON (CB.CBCO_ID      = CP.CPAG_CBCO_ID');
      Add('AND CB.CBCO_EMPR_ID = CP.CPAG_CBCO_EMPR_ID)');
      Add('LEFT OUTER JOIN GENERICA BC');
      Add('ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
      Add('AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
      Add('AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
      Add('LEFT OUTER JOIN CARTAO_CREDITO CCRE');
      Add('ON (CCRE.CCRE_ID      = CP.CPAG_CCRE_ID');
      Add('AND CCRE.CCRE_EMPR_ID = CP.CPAG_CCRE_EMPR_ID)');
      Add('WHERE CP.CPAG_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmContas_Pagar = nil then
    dmContas_Pagar := TdmContas_Pagar.Create(nil);
finalization
  FreeAndNil(dmContas_Pagar);

end.
