unit udmBaixa_Contas_Pagar_Auto;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Forms, Funcoes;

type
  TdmBaixa_Contas_Pagar_Auto = class(TDataModule)
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
    dspContas_Pagar: TDataSetProvider;
    cdsContas_Pagar: TClientDataSet;
    cdsContas_PagarSTATUS: TStringField;
    cdsContas_PagarCPAG_STATUS: TStringField;
    cdsContas_PagarCPAG_ID: TIntegerField;
    cdsContas_PagarCPAG_PROVENIENTE: TStringField;
    cdsContas_PagarCPAG_DTA_EMISSAO: TDateField;
    cdsContas_PagarCPAG_DTA_VCTO: TDateField;
    cdsContas_PagarVALOR_APAGAR: TFloatField;
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
    dsContas_Pagar: TDataSource;
    cdsContas_PagarSELECT: TIntegerField;
    qryContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    qryContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    cdsContas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    qryContas_PagarCPAG_DTA_EFETIVO: TDateField;
    cdsContas_PagarCPAG_DTA_EFETIVO: TDateField;
    qryContas_PagarCPAG_PREVISAO: TIntegerField;
    cdsContas_PagarCPAG_PREVISAO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_PagarCalcFields(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
    function getSQL : String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmBaixa_Contas_Pagar_Auto: TdmBaixa_Contas_Pagar_Auto;

implementation

{$R *.dfm}

procedure TdmBaixa_Contas_Pagar_Auto.cdsContas_PagarCalcFields(
  DataSet: TDataSet);
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
      cdsContas_PagarVALOR_APAGAR.Value := (valor + valormora + valorjuros);
    end else begin
      cdsContas_PagarVALOR_APAGAR.Value := (cdsContas_PagarCPAG_VALOR_DOC.AsFloat -
                                            cdsContas_PagarCPAG_VALOR_PAGO.AsFloat);
    end;
    FormatSettings.DecimalSeparator := ',';
  except
  end;
end;

procedure TdmBaixa_Contas_Pagar_Auto.DataModuleCreate(Sender: TObject);
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

function TdmBaixa_Contas_Pagar_Auto.getSQL: String;
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
      Add('      FN.FORN_NOME_FANTASIA,');
      Add('      PC.PLCT_COD_SIMPLIFICADO,');
      Add('      PC.PLCT_DESCRICAO,');
      Add('      TP.GENE_DESCR TIPO_DOC,');
      Add('      CASE CP.CPAG_STATUS');
      Add('           WHEN ''A'' THEN ''Aberto''');
      Add('           WHEN ''F'' THEN ''Fechado''');
      Add('           WHEN ''C'' THEN ''Cancelado''');
      Add('      END AS STATUS,');
      Add('      CP.CPAG_DTA_EFETIVO,');
      Add('      CP.CPAG_PREVISAO');
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
      Add('WHERE CP.CPAG_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
      Add('AND   CP.CPAG_STATUS   = ''A''');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmBaixa_Contas_Pagar_Auto = nil then
    dmBaixa_Contas_Pagar_Auto := TdmBaixa_Contas_Pagar_Auto.Create(nil);
finalization
  FreeAndNil(dmBaixa_Contas_Pagar_Auto);

end.
