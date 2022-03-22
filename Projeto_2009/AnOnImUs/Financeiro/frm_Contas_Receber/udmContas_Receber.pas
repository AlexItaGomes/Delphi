unit udmContas_Receber;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmContas_Receber = class(TDataModule)
    qryContas_Receber: TSQLQuery;
    dspContas_Receber: TDataSetProvider;
    cdsContas_Receber: TClientDataSet;
    dsContas_Receber: TDataSource;
    qryContas_ReceberCREC_ID: TIntegerField;
    qryContas_ReceberCREC_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_NR_DOC: TStringField;
    qryContas_ReceberCREC_PROVENIENTE: TStringField;
    qryContas_ReceberCREC_CLIE_ID: TIntegerField;
    qryContas_ReceberCREC_CLIE_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_PLCT_ID: TIntegerField;
    qryContas_ReceberCREC_PLCT_EMPR_ID: TIntegerField;
    qryContas_ReceberCREC_DTA_EMISSAO: TDateField;
    qryContas_ReceberCREC_DTA_VCTO: TDateField;
    qryContas_ReceberCREC_DTA_PGTO: TDateField;
    qryContas_ReceberCREC_STATUS: TStringField;
    qryContas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField;
    qryContas_ReceberCREC_OBS: TBlobField;
    qryContas_ReceberCREC_USER_ID_CANC: TIntegerField;
    qryContas_ReceberCREC_DTA_CANC: TDateField;
    qryContas_ReceberCREC_MOTIVO_CANC: TStringField;
    qryContas_ReceberCREC_DTA_CADASTRO: TDateField;
    qryContas_ReceberCREC_USER_ID: TIntegerField;
    qryContas_ReceberCLIE_RAZAO_SOCIAL: TStringField;
    qryContas_ReceberPLCT_COD_SIMPLIFICADO: TStringField;
    qryContas_ReceberPLCT_DESCRICAO: TStringField;
    qryContas_ReceberTIPO_DOC: TStringField;
    qryContas_ReceberSTATUS: TStringField;
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
    dspPesq_Cliente: TDataSetProvider;
    cdsPesq_Cliente: TClientDataSet;
    dsPesq_Cliente: TDataSource;
    qryPesq_Cliente: TSQLQuery;
    cdsPesq_ClienteCLIE_ID: TIntegerField;
    cdsPesq_ClienteCLIE_RAZAO_SOCIAL: TStringField;
    cdsPesq_ClienteCLIE_CNPJ_CPF: TStringField;
    cdsPesq_ClienteCLIE_TIPO: TStringField;
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
    qryPesq_Conta: TSQLQuery;
    dspPesq_Conta: TDataSetProvider;
    cdsPesq_Conta: TClientDataSet;
    cdsPesq_ContaCBCO_ID: TIntegerField;
    cdsPesq_ContaCOD_BANCO: TStringField;
    cdsPesq_ContaBANCO: TStringField;
    cdsPesq_ContaSALDO_ATUAL: TFMTBCDField;
    cdsPesq_ContaCBCO_LIMITE: TFMTBCDField;
    dsPesq_Conta: TDataSource;
    cdsContas_ReceberVALOR_APAGAR: TFloatField;
    cdsPesq_ContaCBCO_DESCRICAO: TStringField;
    qryContas_Receber_Mov: TSQLQuery;
    dspContas_Receber_Mov: TDataSetProvider;
    cdsContas_Receber_Mov: TClientDataSet;
    dsContas_Receber_Mov: TDataSource;
    cdsContas_Receber_MovACRE_ID: TIntegerField;
    cdsContas_Receber_MovACRE_EMPR_ID: TIntegerField;
    cdsContas_Receber_MovACRE_CREC_ID: TIntegerField;
    cdsContas_Receber_MovACRE_CREC_EMPR_ID: TIntegerField;
    cdsContas_Receber_MovACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Receber_MovACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Receber_MovACRE_GENE_ID_TIPO_PGTO: TIntegerField;
    cdsContas_Receber_MovACRE_VALOR_DOC: TFMTBCDField;
    cdsContas_Receber_MovACRE_DTA_CADASTRO: TDateField;
    cdsContas_Receber_MovACRE_USER_ID: TIntegerField;
    cdsContas_Receber_MovGENE_DESCR: TStringField;
    cdsContas_Receber_MovUSER_LOGIN: TStringField;
    qryParcelamento: TSQLQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    DateField3: TDateField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    BlobField1: TBlobField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    DateField4: TDateField;
    StringField8: TStringField;
    DateField5: TDateField;
    IntegerField11: TIntegerField;
    StringField9: TStringField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    dspParcelamento: TDataSetProvider;
    cdsParcelamento: TClientDataSet;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField15: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateField6: TDateField;
    DateField7: TDateField;
    FloatField3: TFloatField;
    StringField21: TStringField;
    DateField8: TDateField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    BlobField2: TBlobField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    DateField9: TDateField;
    StringField22: TStringField;
    DateField10: TDateField;
    IntegerField25: TIntegerField;
    StringField23: TStringField;
    IntegerField26: TIntegerField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    FMTBCDField7: TFMTBCDField;
    FMTBCDField8: TFMTBCDField;
    dsParcelamento: TDataSource;
    qryParcelamentoCREC_VALOR_DOC: TFMTBCDField;
    qryParcelamentoCREC_VALOR_JUROS: TFMTBCDField;
    qryParcelamentoCREC_VALOR_MORA: TFMTBCDField;
    qryParcelamentoCREC_VALOR_PAGO: TFMTBCDField;
    cdsParcelamentoCREC_VALOR_DOC: TFMTBCDField;
    cdsParcelamentoCREC_VALOR_JUROS: TFMTBCDField;
    cdsParcelamentoCREC_VALOR_MORA: TFMTBCDField;
    cdsParcelamentoCREC_VALOR_PAGO: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
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
    qryContas_ReceberCREC_DTA_EFETIVO: TDateField;
    cdsContas_ReceberCREC_DTA_EFETIVO: TDateField;
    qryContas_ReceberCLIE_FANTASIA: TStringField;
    cdsContas_ReceberCLIE_FANTASIA: TStringField;
    qryContas_ReceberCREC_PREVISAO: TIntegerField;
    cdsContas_ReceberCREC_PREVISAO: TIntegerField;
    qryParcelamentoCREC_PREVISAO: TIntegerField;
    cdsParcelamentoCREC_PREVISAO: TIntegerField;
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
    qryParcelamentoCREC_CCRE_EMPR_ID: TIntegerField;
    qryParcelamentoCREC_CCRE_ID: TIntegerField;
    cdsParcelamentoCREC_CCRE_EMPR_ID: TIntegerField;
    cdsParcelamentoCREC_CCRE_ID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_ReceberBeforeDelete(DataSet: TDataSet);
    procedure cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_ReceberNewRecord(DataSet: TDataSet);
    procedure cdsContas_ReceberCalcFields(DataSet: TDataSet);
    procedure cdsParcelamentoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    funcLocal : TFuncoes;
    function getSQL: String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmContas_Receber: TdmContas_Receber;

implementation

{$R *.dfm}

procedure TdmContas_Receber.cdsContas_ReceberBeforeDelete(DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CONTAS_RECEBER',cdsContas_ReceberCREC_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmContas_Receber.cdsContas_ReceberCalcFields(DataSet: TDataSet);
var
  morames,dias,valor,valorjuros,valormora : Real;
  dataAtual, dataVencto    : TDateTime;
  diasaux,diasint,jurosmes : Integer;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    dataAtual  := funcLocal.DataServidor(funcLocal.Conexao,false);
    dataVencto := cdsContas_ReceberCREC_DTA_VCTO.AsDateTime;
    dias    := dataAtual - dataVencto;
    diasint := StrToInt(FloatToStr(dias));
    if diasint > 0 then begin
      valor := (cdsContas_ReceberCREC_VALOR_DOC.AsFloat - cdsContas_ReceberCREC_VALOR_PAGO.AsFloat);
      jurosmes := diasint div 30;
      if jurosmes = 0 then
        jurosmes := 1;
      diasaux := diasint - jurosmes;
      if (jurosmes > 1) and ((diasaux mod 30) > 0) then
        jurosmes := jurosmes + 1;
      morames := (cdsContas_ReceberCREC_VALOR_MORA.AsFloat / 30) * diasint;
      valorjuros := (valor * ((jurosmes) * (cdsContas_ReceberCREC_VALOR_JUROS.AsFloat / 100)));
      valormora  := (valor * (morames / 100));
      valor      := StrToFloat(FormatFloat('0.00',valor));
      valormora  := StrToFloat(FormatFloat('0.00',valormora));
      valorjuros := StrToFloat(FormatFloat('0.00',valorjuros));
      cdsContas_ReceberVALOR_APAGAR.Value := (valor + valormora + valorjuros);
    end else begin
      cdsContas_ReceberVALOR_APAGAR.Value := (cdsContas_ReceberCREC_VALOR_DOC.AsFloat -
                                              cdsContas_ReceberCREC_VALOR_PAGO.AsFloat);
    end;
    FormatSettings.DecimalSeparator := ',';
  except
  end;
end;

procedure TdmContas_Receber.cdsContas_ReceberNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CREC_ID').AsString                     := funcLocal.ObterSequencia('CONTAS_RECEBER',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('CREC_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_STATUS').AsString                 := 'A';
  DataSet.FieldByName('CREC_DTA_EMISSAO').AsDateTime          := funcLocal.DataServidor(funcLocal.Conexao);
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
  DataSet.FieldByName('CREC_PREVISAO').AsInteger              := 0;
  DataSet.FieldByName('CREC_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CREC_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CREC_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmContas_Receber.cdsContas_ReceberReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmContas_Receber','cdsContas_ReceberReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmContas_Receber.cdsParcelamentoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  cdsParcelamento.First;
  while not cdsParcelamento.Eof do begin
    if cdsParcelamento.FieldByName('CREC_PREVISAO').AsInteger = 0 then
      funcLocal.BaixarContaReceberPrevisto(cdsParcelamento.FieldByName('CREC_DTA_VCTO').AsDateTime,
                                          (cdsParcelamento.FieldByName('CREC_VALOR_DOC').AsFloat*-1),
                                           cdsParcelamento.FieldByName('CREC_PLCT_ID').AsString,
                                           'CR');
    cdsParcelamento.Next;
  end;
end;

procedure TdmContas_Receber.DataModuleCreate(Sender: TObject);
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

function TdmContas_Receber.getSQL: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CR.CREC_ID,');
      Add('      CR.CREC_EMPR_ID,');
      Add('      CR.CREC_NR_DOC,');
      Add('      CR.CREC_PROVENIENTE,');
      Add('      CR.CREC_CLIE_ID,');
      Add('      CR.CREC_CLIE_EMPR_ID,');
      Add('      CR.CREC_PLCT_ID,');
      Add('      CR.CREC_PLCT_EMPR_ID,');
      Add('      CR.CREC_DTA_EMISSAO,');
      Add('      CR.CREC_DTA_VCTO,');
      Add('      CR.CREC_DTA_PGTO,');
      Add('      CR.CREC_VALOR_DOC,');
      Add('      CR.CREC_VALOR_JUROS,');
      Add('      CR.CREC_VALOR_MORA,');
      Add('      CR.CREC_STATUS,');
      Add('      CR.CREC_VALOR_PAGO,');
      Add('      CR.CREC_GENE_EMPR_ID_TIPO_DOC,');
      Add('      CR.CREC_GENE_TGEN_ID_TIPO_DOC,');
      Add('      CR.CREC_GENE_ID_TIPO_DOC,');
      Add('      CR.CREC_OBS,');
      Add('      CR.CREC_USER_ID_CANC,');
      Add('      CR.CREC_DTA_CANC,');
      Add('      CR.CREC_MOTIVO_CANC,');
      Add('      CR.CREC_DTA_CADASTRO,');
      Add('      CR.CREC_USER_ID,');
      Add('      CR.CREC_VIA_BANCO,');
      Add('      CR.CREC_CBCO_ID,');
      Add('      CR.CREC_CBCO_EMPR_ID,');
      Add('      CL.CLIE_RAZAO_SOCIAL,');
      Add('      CL.CLIE_FANTASIA,');
      Add('      PL.PLCT_COD_SIMPLIFICADO,');
      Add('      PL.PLCT_DESCRICAO,');
      Add('      TP.GENE_DESCR TIPO_DOC,');
      Add('      CASE CR.CREC_PREVISAO');
      Add('           WHEN 1 THEN ''Previsão''');
      Add('           ELSE CASE CR.CREC_STATUS');
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
      Add('      CR.CREC_DTA_EFETIVO,');
      Add('      CR.CREC_PREVISAO,');
      Add('      CR.CREC_CCRE_ID,');
      Add('      CR.CREC_CCRE_EMPR_ID,');
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
      Add('FROM  CONTAS_RECEBER CR');
      Add('INNER JOIN CLIENTES CL');
      Add('ON (CL.CLIE_ID      = CR.CREC_CLIE_ID');
      Add('AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID      = CR.CREC_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID = CR.CREC_PLCT_EMPR_ID)');
      Add('INNER JOIN GENERICA TP');
      Add('ON (TP.GENE_EMPR_ID = CR.CREC_GENE_EMPR_ID_TIPO_DOC');
      Add('AND TP.GENE_TGEN_ID = CR.CREC_GENE_TGEN_ID_TIPO_DOC');
      Add('AND TP.GENE_ID      = CR.CREC_GENE_ID_TIPO_DOC)');
      Add('LEFT OUTER JOIN CONTAS_BANCARIAS CB');
      Add('ON (CB.CBCO_ID      = CR.CREC_CBCO_ID');
      Add('AND CB.CBCO_EMPR_ID = CR.CREC_CBCO_EMPR_ID)');
      Add('LEFT OUTER JOIN GENERICA BC');
      Add('ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
      Add('AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
      Add('AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
      Add('LEFT OUTER JOIN CARTAO_CREDITO CCRE');
      Add('ON (CCRE.CCRE_ID      = CR.CREC_CCRE_ID');
      Add('AND CCRE.CCRE_EMPR_ID = CR.CREC_CCRE_EMPR_ID)');
      Add('WHERE CR.CREC_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmContas_Receber = nil then
    dmContas_Receber := TdmContas_Receber.Create(nil);
finalization
  FreeAndNil(dmContas_Receber);

end.
