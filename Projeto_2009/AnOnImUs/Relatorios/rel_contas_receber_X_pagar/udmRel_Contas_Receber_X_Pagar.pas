unit udmRel_Contas_Receber_X_Pagar;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Contas_Receber_X_Pagar = class(TDataModule)
    qryRel_Contas_Pagar: TSQLQuery;
    dspRel_Contas_Pagar: TDataSetProvider;
    cdsRel_Contas_Pagar: TClientDataSet;
    cdsRel_Contas_PagarCPAG_ID: TIntegerField;
    cdsRel_Contas_PagarCPAG_EMPR_ID: TIntegerField;
    cdsRel_Contas_PagarCPAG_NR_DOC: TStringField;
    cdsRel_Contas_PagarCPAG_PROVENIENTE: TStringField;
    cdsRel_Contas_PagarCPAG_FORN_ID: TIntegerField;
    cdsRel_Contas_PagarCPAG_PLCT_ID: TIntegerField;
    cdsRel_Contas_PagarCPAG_PLCT_EMPR_ID: TIntegerField;
    cdsRel_Contas_PagarCPAG_DTA_EMISSAO: TDateField;
    cdsRel_Contas_PagarCPAG_DTA_VCTO: TDateField;
    cdsRel_Contas_PagarCPAG_DTA_PGTO: TDateField;
    cdsRel_Contas_PagarCPAG_STATUS: TStringField;
    cdsRel_Contas_PagarCPAG_GENE_EMPR_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_PagarCPAG_GENE_TGEN_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_PagarCPAG_GENE_ID_TIPO_DOC: TIntegerField;
    cdsRel_Contas_PagarCPAG_OBS: TBlobField;
    cdsRel_Contas_PagarCPAG_USER_ID_CANC: TIntegerField;
    cdsRel_Contas_PagarCPAG_DTA_CANC: TDateField;
    cdsRel_Contas_PagarCPAG_MOTIVO_CANC: TStringField;
    cdsRel_Contas_PagarCPAG_DTA_CADASTRO: TDateField;
    cdsRel_Contas_PagarCPAG_USER_ID: TIntegerField;
    cdsRel_Contas_PagarFORN_NOME_FANTASIA: TStringField;
    cdsRel_Contas_PagarPLCT_COD_SIMPLIFICADO: TStringField;
    cdsRel_Contas_PagarPLCT_DESCRICAO: TStringField;
    cdsRel_Contas_PagarPLCT_TIPO: TStringField;
    cdsRel_Contas_PagarSTATUS: TStringField;
    cdsRel_Contas_PagarTIPO_DOC: TStringField;
    cdsRel_Contas_PagarUSER_CANCEL: TStringField;
    dsRel_Contas_Pagar: TDataSource;
    dspRel_Contas_Receber: TDataSetProvider;
    cdsRel_Contas_Receber: TClientDataSet;
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
    dsRel_Contas_Receber: TDataSource;
    qryRel_Contas_Receber: TSQLQuery;
    cdsRel_Contas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_DOC: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_JUROS: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_MORA: TFMTBCDField;
    cdsRel_Contas_ReceberCREC_VALOR_PAGO: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_DTA_EFETIVO: TDateField;
    cdsRel_Contas_ReceberCREC_DTA_EFETIVO: TDateField;
    cdsRel_Contas_PagarTIPO: TStringField;
    cdsRel_Contas_ReceberTIPO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
  end;

var
  dmRel_Contas_Receber_X_Pagar: TdmRel_Contas_Receber_X_Pagar;

implementation

uses ufRel_Contas_Receber_X_Pagar;

{$R *.dfm}

procedure TdmRel_Contas_Receber_X_Pagar.DataModuleCreate(Sender: TObject);
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

end.
