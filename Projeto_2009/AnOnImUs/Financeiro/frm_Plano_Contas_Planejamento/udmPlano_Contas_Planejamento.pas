unit udmPlano_Contas_Planejamento;

interface

uses
  SysUtils, Classes, Funcoes, SQLExpr, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmPlano_Contas_Planejamento = class(TDataModule)
    qryPlano_Conta_Planejamento: TSQLQuery;
    dspPlano_Conta_Planejamento: TDataSetProvider;
    cdsPlano_Conta_Planejamento: TClientDataSet;
    dsPlano_Conta_Planejamento: TDataSource;
    cdsPlano_Conta_PlanejamentoPCPJ_ID: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_EMPR_ID: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_PLCT_ID: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_PLCT_EMPR_ID: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_ANO: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_01: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_02: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_03: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_04: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_05: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_06: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_07: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_08: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_09: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_10: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_11: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_MES_12: TFMTBCDField;
    cdsPlano_Conta_PlanejamentoPCPJ_DTA_CADASTRO: TDateField;
    cdsPlano_Conta_PlanejamentoPCPJ_USER_ID: TIntegerField;
    cdsPlano_Conta_PlanejamentoPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPlano_Conta_PlanejamentoPLCT_DESCRICAO: TStringField;
    qryPesq_Plano_Contas: TSQLQuery;
    dspPesq_Plano_Contas: TDataSetProvider;
    cdsPesq_Plano_Contas: TClientDataSet;
    cdsPesq_Plano_ContasPLCT_ID: TIntegerField;
    cdsPesq_Plano_ContasPLCT_COD_SIMPLIFICADO: TStringField;
    cdsPesq_Plano_ContasPLCT_DESCRICAO: TStringField;
    cdsPesq_Plano_ContasPLCT_TIPO: TStringField;
    dsPesq_Plano_Contas: TDataSource;
    qryPlano_Conta_PlanejamentoPCPJ_ID: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_EMPR_ID: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_PLCT_ID: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_PLCT_EMPR_ID: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_ANO: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_01: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_02: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_03: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_04: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_05: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_06: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_07: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_08: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_09: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_10: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_11: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_MES_12: TFMTBCDField;
    qryPlano_Conta_PlanejamentoPCPJ_CONCILIADO: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_DTA_CADASTRO: TDateField;
    qryPlano_Conta_PlanejamentoPCPJ_USER_ID: TIntegerField;
    qryPlano_Conta_PlanejamentoPLCT_COD_SIMPLIFICADO: TStringField;
    qryPlano_Conta_PlanejamentoPLCT_DESCRICAO: TStringField;
    cdsPlano_Conta_PlanejamentoPCPJ_CONCILIADO: TIntegerField;
    qryPlano_Conta_PlanejamentoPCPJ_OBS: TBlobField;
    cdsPlano_Conta_PlanejamentoPCPJ_OBS: TBlobField;
    qryPlano_Conta_PlanejamentoPCPJ_TIPO_PLANO: TIntegerField;
    cdsPlano_Conta_PlanejamentoPCPJ_TIPO_PLANO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPlano_Conta_PlanejamentoReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsPlano_Conta_PlanejamentoNewRecord(DataSet: TDataSet);
    procedure cdsPlano_Conta_PlanejamentoBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmPlano_Contas_Planejamento: TdmPlano_Contas_Planejamento;

implementation

{$R *.dfm}

procedure TdmPlano_Contas_Planejamento.cdsPlano_Conta_PlanejamentoBeforeDelete(
  DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('PLANO_CONTAS_PLANEJAMENTO',cdsPlano_Conta_PlanejamentoPCPJ_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmPlano_Contas_Planejamento.cdsPlano_Conta_PlanejamentoNewRecord(
  DataSet: TDataSet);
var
  Dia,
  Mes,
  Ano  : Word;
begin
  DecodeDate(funcLocal.DataServidor(funcLocal.Conexao),Ano,Mes,Dia);
  DataSet.FieldByName('PCPJ_ID').AsString             := funcLocal.ObterSequencia('PLANO_CONTAS_PLANEJAMENTO',IntToStr(funcLocal.Empr_ID),false);
  DataSet.FieldByName('PCPJ_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('PCPJ_PLCT_EMPR_ID').AsInteger  := 0;
  DataSet.FieldByName('PCPJ_ANO').AsInteger           := Ano;
  DataSet.FieldByName('PCPJ_MES_01').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_02').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_03').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_04').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_05').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_06').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_07').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_08').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_09').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_10').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_11').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_MES_12').AsFloat          := 0;
  DataSet.FieldByName('PCPJ_CONCILIADO').AsInteger    := 0;
  DataSet.FieldByName('PCPJ_TIPO_PLANO').AsInteger    := 0;
  DataSet.FieldByName('PCPJ_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('PCPJ_USER_ID').AsInteger       := funcLocal.User_ID; 
end;

procedure TdmPlano_Contas_Planejamento.cdsPlano_Conta_PlanejamentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmPlano_Contas_Planejamento','cdsPlano_Conta_PlanejamentoReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmPlano_Contas_Planejamento.DataModuleCreate(Sender: TObject);
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
  if dmPlano_Contas_Planejamento = nil then
    dmPlano_Contas_Planejamento := TdmPlano_Contas_Planejamento.Create(nil);
finalization
  FreeAndNil(dmPlano_Contas_Planejamento);

end.
