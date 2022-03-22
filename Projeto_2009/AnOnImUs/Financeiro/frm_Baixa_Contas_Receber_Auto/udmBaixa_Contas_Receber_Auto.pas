unit udmBaixa_Contas_Receber_Auto;

interface

uses
  SysUtils, Classes, Forms, Funcoes, SQLExpr, FMTBcd, DB, DBClient, Provider;

type
  TdmBaixa_Contas_Receber_Auto = class(TDataModule)
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
    cdsContas_ReceberVALOR_APAGAR: TFloatField;
    dsContas_Receber: TDataSource;
    cdsContas_ReceberSELECT: TIntegerField;
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
    qryContas_ReceberCREC_PREVISAO: TIntegerField;
    cdsContas_ReceberCREC_PREVISAO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_ReceberCalcFields(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
    function getSQL: String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmBaixa_Contas_Receber_Auto: TdmBaixa_Contas_Receber_Auto;

implementation

{$R *.dfm}

procedure TdmBaixa_Contas_Receber_Auto.cdsContas_ReceberCalcFields(
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

procedure TdmBaixa_Contas_Receber_Auto.DataModuleCreate(Sender: TObject);
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

function TdmBaixa_Contas_Receber_Auto.getSQL: String;
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
      Add('      CL.CLIE_RAZAO_SOCIAL,');
      Add('      PL.PLCT_COD_SIMPLIFICADO,');
      Add('      PL.PLCT_DESCRICAO,');
      Add('      TP.GENE_DESCR TIPO_DOC,');
      Add('      CASE CR.CREC_STATUS');
      Add('           WHEN ''A'' THEN ''Aberto''');
      Add('           WHEN ''F'' THEN ''Fechado''');
      Add('           WHEN ''C'' THEN ''Cancelado''');
      Add('      END AS STATUS,');
      Add('      CR.CREC_DTA_EFETIVO,');
      Add('      CR.CREC_PREVISAO');
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
      Add('WHERE CR.CREC_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
      Add('AND   CR.CREC_STATUS    = ''A''');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmBaixa_Contas_Receber_Auto = nil then
    dmBaixa_Contas_Receber_Auto := TdmBaixa_Contas_Receber_Auto.Create(nil);
finalization
  FreeAndNil(dmBaixa_Contas_Receber_Auto);

end.
