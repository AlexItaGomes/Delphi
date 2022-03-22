unit udmRel_Contas_Receber;

interface

uses
  SysUtils, Classes, SQLExpr, Forms, Funcoes, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Contas_Receber = class(TDataModule)
    dspRel_Contas_Receber: TDataSetProvider;
    cdsRel_Contas_Receber: TClientDataSet;
    dsRel_Contas_Receber: TDataSource;
    qryRel_Contas_Receber: TSQLQuery;
    cdsRel_Contas_ReceberCREC_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_EMPR_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_NR_DOC: TStringField;
    cdsRel_Contas_ReceberCREC_PROVENIENTE: TStringField;
    cdsRel_Contas_ReceberCREC_CLIE_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_CLIE_EMPR_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_PLCT_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_PLCT_EMPR_ID: TIntegerField;
    cdsRel_Contas_ReceberCREC_DTA_EMISSAO: TDateField;
    cdsRel_Contas_ReceberCREC_DTA_VCTO: TDateField;
    cdsRel_Contas_ReceberCREC_DTA_PGTO: TDateField;
    cdsRel_Contas_ReceberCREC_STATUS: TStringField;
    cdsRel_Contas_ReceberCREC_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_ReceberCREC_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_ReceberCREC_GENE_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_ReceberCREC_OBS: TBlobField;
    cdsRel_Contas_ReceberCREC_USER_ID_CANC: TIntegerField;
    cdsRel_Contas_ReceberCREC_DTA_CANC: TDateField;
    cdsRel_Contas_ReceberCREC_MOTIVO_CANC: TStringField;
    cdsRel_Contas_ReceberCREC_DTA_CADASTRO: TDateField;
    cdsRel_Contas_ReceberCREC_USER_ID: TIntegerField;
    cdsRel_Contas_ReceberCLIE_FANTASIA: TStringField;
    cdsRel_Contas_ReceberPLCT_COD_SIMPLIFICADO: TStringField;
    cdsRel_Contas_ReceberPLCT_DESCRICAO: TStringField;
    cdsRel_Contas_ReceberSTATUS: TStringField;
    cdsRel_Contas_ReceberTIPO_DOC: TStringField;
    cdsRel_Contas_ReceberUSER_CANC: TStringField;
    qryAcertos: TSQLQuery;
    dspAcertos: TDataSetProvider;
    cdsAcertos: TClientDataSet;
    dsAcertos: TDataSource;
    cdsAcertosACRE_ID: TIntegerField;
    cdsAcertosGENE_DESCR: TStringField;
    cdsAcertosACRE_VALOR_DOC: TFMTBCDField;
    cdsAcertosACRE_DTA_CADASTRO: TDateField;
    cdsRel_Contas_ReceberANO: TSmallintField;
    cdsRel_Contas_ReceberMES: TSmallintField;
    cdsRel_Contas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_DTA_EFETIVO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsRel_Contas_ReceberDataChange(Sender: TObject; Field: TField);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Contas_Receber: TdmRel_Contas_Receber;

implementation

{$R *.dfm}

procedure TdmRel_Contas_Receber.DataModuleCreate(Sender: TObject);
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

procedure TdmRel_Contas_Receber.dsRel_Contas_ReceberDataChange(Sender: TObject;
  Field: TField);
begin
  with dmRel_Contas_Receber,cdsAcertos do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CREC_ID').AsInteger := cdsRel_Contas_ReceberCREC_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

end.
