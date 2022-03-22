unit udmRel_Contas_Pagar;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Contas_Pagar = class(TDataModule)
    qryRel_Contas_Pagar: TSQLQuery;
    dspRel_Contas_Pagar: TDataSetProvider;
    cdsRel_Contas_Pagar: TClientDataSet;
    dsRel_Contas_Pagar: TDataSource;
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
    qryAcertos: TSQLQuery;
    dspAcertos: TDataSetProvider;
    cdsAcertos: TClientDataSet;
    dsAcertos: TDataSource;
    cdsAcertosACPG_ID: TIntegerField;
    cdsAcertosGENE_DESCR: TStringField;
    cdsAcertosACPG_VALOR_DOC: TFMTBCDField;
    cdsAcertosACPG_DTA_CADASTRO: TDateField;
    cdsRel_Contas_PagarANO: TSmallintField;
    cdsRel_Contas_PagarMES: TSmallintField;
    cdsRel_Contas_PagarCPAG_VALOR_DOC: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_JUROS: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_MORA: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_VALOR_PAGO: TFMTBCDField;
    cdsRel_Contas_PagarCPAG_DTA_EFETIVO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsRel_Contas_PagarDataChange(Sender: TObject; Field: TField);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Contas_Pagar: TdmRel_Contas_Pagar;

implementation

{$R *.dfm}

procedure TdmRel_Contas_Pagar.DataModuleCreate(Sender: TObject);
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

procedure TdmRel_Contas_Pagar.dsRel_Contas_PagarDataChange(Sender: TObject;
  Field: TField);
begin
  with dmRel_Contas_Pagar,cdsAcertos do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CPAG_ID').AsInteger := cdsRel_Contas_PagarCPAG_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

end.
