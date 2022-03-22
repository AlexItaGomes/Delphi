unit udmBaixa_Contas_Receber_Parcial;

interface

uses
  SysUtils, Classes, Funcoes, Forms, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmBaixa_Contas_Receber_Parcial = class(TDataModule)
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
    dsContas_Receber: TDataSource;
    qryPesq_Tipo_Doc: TSQLQuery;
    dspPesq_Tipo_Doc: TDataSetProvider;
    cdsPesq_Tipo_Doc: TClientDataSet;
    cdsPesq_Tipo_DocGENE_ID: TIntegerField;
    cdsPesq_Tipo_DocGENE_DESCR: TStringField;
    dsPesq_Tipo_Doc: TDataSource;
    qryAcertos: TSQLQuery;
    dspAcertos: TDataSetProvider;
    cdsAcertos: TClientDataSet;
    dsAcertos: TDataSource;
    qryAcertosACRE_ID: TIntegerField;
    qryAcertosACRE_EMPR_ID: TIntegerField;
    qryAcertosACRE_CREC_ID: TIntegerField;
    qryAcertosACRE_CREC_EMPR_ID: TIntegerField;
    qryAcertosACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField;
    qryAcertosACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField;
    qryAcertosACRE_GENE_ID_TIPO_PGTO: TIntegerField;
    qryAcertosACRE_VALOR_DOC: TFMTBCDField;
    qryAcertosACRE_DTA_CADASTRO: TDateField;
    qryAcertosACRE_USER_ID: TIntegerField;
    qryAcertosTIPO_DOC: TStringField;
    cdsAcertosACRE_ID: TIntegerField;
    cdsAcertosACRE_EMPR_ID: TIntegerField;
    cdsAcertosACRE_CREC_ID: TIntegerField;
    cdsAcertosACRE_CREC_EMPR_ID: TIntegerField;
    cdsAcertosACRE_GENE_EMPR_ID_TIPO_PGTO: TIntegerField;
    cdsAcertosACRE_GENE_TGEN_ID_TIPO_PGTO: TIntegerField;
    cdsAcertosACRE_GENE_ID_TIPO_PGTO: TIntegerField;
    cdsAcertosACRE_VALOR_DOC: TFMTBCDField;
    cdsAcertosACRE_DTA_CADASTRO: TDateField;
    cdsAcertosACRE_USER_ID: TIntegerField;
    cdsAcertosTIPO_DOC: TStringField;
    cdsContas_ReceberVALOR_APAGAR: TFloatField;
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
    qryContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    qryContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    cdsContas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    qryContas_ReceberCREC_DTA_EFETIVO: TDateField;
    cdsContas_ReceberCREC_DTA_EFETIVO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAcertosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAcertosNewRecord(DataSet: TDataSet);
    procedure cdsContas_ReceberCalcFields(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
    function getSQL: String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmBaixa_Contas_Receber_Parcial: TdmBaixa_Contas_Receber_Parcial;

implementation

{$R *.dfm}

procedure TdmBaixa_Contas_Receber_Parcial.cdsAcertosNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ACRE_ID').AsString                       := funcLocal.ObterSequencia('CONTAS_RECEBER_ACERTOS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('ACRE_EMPR_ID').AsInteger                 := funcLocal.Empr_ID;
  DataSet.FieldByName('ACRE_CREC_ID').AsInteger                 := cdsContas_ReceberCREC_ID.AsInteger;
  DataSet.FieldByName('ACRE_CREC_EMPR_ID').AsInteger            := funcLocal.Empr_ID;
  DataSet.FieldByName('ACRE_GENE_EMPR_ID_TIPO_PGTO').AsInteger  := 0;
  DataSet.FieldByName('ACRE_GENE_TGEN_ID_TIPO_PGTO').AsInteger  := 5;
  DataSet.FieldByName('ACRE_VALOR_DOC').AsFloat                 := cdsContas_ReceberVALOR_APAGAR.AsFloat;
  DataSet.FieldByName('ACRE_DTA_CADASTRO').AsDateTime           := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('ACRE_USER_ID').AsInteger                 := funcLocal.User_ID;
end;

procedure TdmBaixa_Contas_Receber_Parcial.cdsAcertosReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmBaixa_Contas_Receber_Parcial','cdsAcertosReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmBaixa_Contas_Receber_Parcial.cdsContas_ReceberCalcFields(
  DataSet: TDataSet);
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

procedure TdmBaixa_Contas_Receber_Parcial.DataModuleCreate(Sender: TObject);
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

function TdmBaixa_Contas_Receber_Parcial.getSQL: String;
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
      Add('      COALESCE(CR.CREC_VIA_BANCO,0) AS CREC_VIA_BANCO,');
      Add('      COALESCE(CR.CREC_CBCO_ID,0) AS CREC_CBCO_ID,');
      Add('      CR.CREC_CBCO_EMPR_ID,');
      Add('      CL.CLIE_RAZAO_SOCIAL,');
      Add('      PL.PLCT_COD_SIMPLIFICADO,');
      Add('      PL.PLCT_DESCRICAO,');
      Add('      TP.GENE_DESCR TIPO_DOC,');
      Add('      CASE CR.CREC_STATUS');
      Add('           WHEN ''A'' THEN ''Aberto''');
      Add('           WHEN ''F'' THEN ''Fechado''');
      Add('           WHEN ''C'' THEN ''Cancelado''');
      Add('      END AS STATUS,');
      Add('      BC.GENE_DESCR BANCO,');
      Add('      BC.GENE_PAR1 COD_BANCO,');
      Add('      CB.CBCO_AGENCIA,');
      Add('      CB.CBCO_CONTA,');
      Add('      CB.CBCO_TIPO,');
      if funcLocal.TemPermissao('319') then begin
        Add('      CB.CBCO_SALDO_ATUAL,');
        Add('      CB.CBCO_LIMITE,');
      end else begin
        Add('      0.0 AS CBCO_SALDO_ATUAL,');
        Add('      0.0 AS CBCO_LIMITE,');
      end;
      Add('      CR.CREC_DTA_EFETIVO');
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
      Add('WHERE CR.CREC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
      Add('AND   CR.CREC_STATUS    = ''A''');
      Add('AND   CR.CREC_PREVISAO  = 0');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmBaixa_Contas_Receber_Parcial = nil then
    dmBaixa_Contas_Receber_Parcial := TdmBaixa_Contas_Receber_Parcial.Create(nil);
finalization
  FreeAndNil(dmBaixa_Contas_Receber_Parcial);

end.
