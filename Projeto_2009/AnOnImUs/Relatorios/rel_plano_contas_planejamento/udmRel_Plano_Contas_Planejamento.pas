unit udmRel_Plano_Contas_Planejamento;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmRel_Plano_Contas_Planejamento = class(TDataModule)
    qryRel_Planejamento_Anual: TSQLQuery;
    dspRel_Planejamento_Anual: TDataSetProvider;
    cdsRel_Planejamento_Anual: TClientDataSet;
    dsRel_Planejamento_Anual: TDataSource;
    cdsRel_Planejamento_AnualPCPJ_ID: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_EMPR_ID: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_PLCT_ID: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_PLCT_EMPR_ID: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_ANO: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_MES_01: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_02: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_03: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_04: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_05: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_06: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_07: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_08: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_09: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_10: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_11: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_MES_12: TFMTBCDField;
    cdsRel_Planejamento_AnualPCPJ_DTA_CADASTRO: TDateField;
    cdsRel_Planejamento_AnualPCPJ_USER_ID: TIntegerField;
    cdsRel_Planejamento_AnualPCPJ_CONCILIADO: TIntegerField;
    cdsRel_Planejamento_AnualCONCILIADO: TStringField;
    cdsRel_Planejamento_AnualPLCT_COD_SIMPLIFICADO: TStringField;
    cdsRel_Planejamento_AnualPLCT_DESCRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmRel_Plano_Contas_Planejamento: TdmRel_Plano_Contas_Planejamento;

implementation

{$R *.dfm}

procedure TdmRel_Plano_Contas_Planejamento.DataModuleCreate(Sender: TObject);
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
