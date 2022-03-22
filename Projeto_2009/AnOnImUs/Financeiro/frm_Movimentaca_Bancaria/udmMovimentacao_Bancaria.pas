unit udmMovimentacao_Bancaria;

interface

uses
  SysUtils, Classes, SQLExpr, Funcoes, Forms, FMTBcd, DB, DBClient, Provider;

type
  TdmMovimentacao_Bancaria = class(TDataModule)
    qryMovimentacao_Bancaria: TSQLQuery;
    dspMovimentacao_Bancaria: TDataSetProvider;
    cdsMovimentacao_Bancaria: TClientDataSet;
    dsMovimentacao_Bancaria: TDataSource;
    qryContas_Bancarias: TSQLQuery;
    qryContas_BancariasCBCO_ATIVO: TIntegerField;
    qryContas_BancariasCBCO_ID: TIntegerField;
    qryContas_BancariasCBCO_GENE_ID_BCO: TIntegerField;
    qryContas_BancariasBANCO_DESCR: TStringField;
    qryContas_BancariasCOD_BANCO: TStringField;
    qryContas_BancariasCBCO_AGENCIA: TStringField;
    qryContas_BancariasCBCO_CONTA: TStringField;
    qryContas_BancariasCBCO_TIPO: TStringField;
    qryContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField;
    qryContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField;
    qryContas_BancariasCBCO_GERENTE: TStringField;
    qryContas_BancariasCBCO_DTA_CADASTRO: TDateField;
    qryContas_BancariasCBCO_EMPR_ID: TIntegerField;
    qryContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField;
    qryContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField;
    qryContas_BancariasCBCO_USER_ID: TIntegerField;
    dspContas_Bancarias: TDataSetProvider;
    cdsContas_Bancarias: TClientDataSet;
    cdsContas_BancariasCBCO_ATIVO: TIntegerField;
    cdsContas_BancariasCBCO_ID: TIntegerField;
    cdsContas_BancariasCBCO_GENE_ID_BCO: TIntegerField;
    cdsContas_BancariasBANCO_DESCR: TStringField;
    cdsContas_BancariasCOD_BANCO: TStringField;
    cdsContas_BancariasCBCO_AGENCIA: TStringField;
    cdsContas_BancariasCBCO_CONTA: TStringField;
    cdsContas_BancariasCBCO_TIPO: TStringField;
    cdsContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField;
    cdsContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsContas_BancariasCBCO_GERENTE: TStringField;
    cdsContas_BancariasCBCO_DTA_CADASTRO: TDateField;
    cdsContas_BancariasCBCO_EMPR_ID: TIntegerField;
    cdsContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField;
    cdsContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField;
    cdsContas_BancariasCBCO_USER_ID: TIntegerField;
    dsContas_Bancarias: TDataSource;
    qryPesq_Conta: TSQLQuery;
    dspPesq_Conta: TDataSetProvider;
    cdsPesq_Conta: TClientDataSet;
    dsPesq_Conta: TDataSource;
    cdsPesq_ContaCBCO_ID: TIntegerField;
    cdsPesq_ContaBANCO: TStringField;
    cdsPesq_ContaCOD_BANCO: TStringField;
    cdsPesq_ContaSALDO_ATUAL: TFMTBCDField;
    qryMovimentacao_BancariaCBMV_ID: TIntegerField;
    qryMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField;
    qryMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField;
    qryMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField;
    qryMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField;
    qryMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField;
    qryMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField;
    qryMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField;
    qryMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField;
    qryMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField;
    qryMovimentacao_BancariaCBMV_USER_ID: TIntegerField;
    qryMovimentacao_BancariaMOVIMENTACAO: TStringField;
    qryMovimentacao_BancariaTIPO_MOV: TStringField;
    qryMovimentacao_BancariaBANCO: TStringField;
    qryMovimentacao_BancariaCOD_BANCO: TStringField;
    cdsMovimentacao_BancariaCBMV_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_EMPR_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CBCO_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CBCO_EMPR_ID: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_ID_TIPO_MOV: TIntegerField;
    cdsMovimentacao_BancariaCBMV_VALOR_MOV: TFMTBCDField;
    cdsMovimentacao_BancariaCBMV_SALDO_DISP: TFMTBCDField;
    cdsMovimentacao_BancariaCBMV_DTA_CADASTRO: TDateField;
    cdsMovimentacao_BancariaCBMV_USER_ID: TIntegerField;
    cdsMovimentacao_BancariaMOVIMENTACAO: TStringField;
    cdsMovimentacao_BancariaTIPO_MOV: TStringField;
    cdsMovimentacao_BancariaBANCO: TStringField;
    cdsMovimentacao_BancariaCOD_BANCO: TStringField;
    qryMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField;
    cdsMovimentacao_BancariaCBCO_SALDO_ATUAL: TFMTBCDField;
    qryMovimentacao_BancariaDEDUTIVEL: TStringField;
    cdsMovimentacao_BancariaDEDUTIVEL: TStringField;
    qryMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField;
    cdsMovimentacao_BancariaCBCO_LIMITE: TFMTBCDField;
    cdsPesq_ContaCBCO_LIMITE: TFMTBCDField;
    cdsPesq_ContaCBCO_DESCRICAO: TStringField;
    qryContas_BancariasCBCO_DESCRICAO: TStringField;
    cdsContas_BancariasCBCO_DESCRICAO: TStringField;
    qryMovimentacao_BancariaCBMV_GENE_EMPR_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_GENE_TGEN_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_GENE_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_CAMPO1_EMPR_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_CAMPO2_TGEN_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_CAMPO3_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_EMPR_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_TGEN_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_GENE_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CAMPO1_EMPR_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CAMPO2_TGEN_ID_ORIG: TIntegerField;
    cdsMovimentacao_BancariaCBMV_CAMPO3_ID_ORIG: TIntegerField;
    qryMovimentacao_BancariaCBMV_NR_DOCUMENTO: TStringField;
    cdsMovimentacao_BancariaCBMV_NR_DOCUMENTO: TStringField;
    qryPesqTipoMov: TSQLQuery;
    dspPesqTipoMov: TDataSetProvider;
    cdsPesqTipoMov: TClientDataSet;
    cdsPesqTipoMovGENE_ID: TIntegerField;
    cdsPesqTipoMovGENE_DESCR: TStringField;
    cdsPesqTipoMovGENE_PAR1: TStringField;
    cdsPesqTipoMovGENE_PAR2: TStringField;
    qryContas_BancariasCBCO_DTA_ABERTURA: TDateField;
    cdsContas_BancariasCBCO_DTA_ABERTURA: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsMovimentacao_BancariaReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure dsContas_BancariasDataChange(Sender: TObject; Field: TField);
    procedure cdsMovimentacao_BancariaNewRecord(DataSet: TDataSet);
    procedure cdsMovimentacao_BancariaBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
    function getSQL: String;
  public
    property InstrucaoSQL : String read getSQL;
  end;

var
  dmMovimentacao_Bancaria: TdmMovimentacao_Bancaria;

implementation

{$R *.dfm}

procedure TdmMovimentacao_Bancaria.cdsMovimentacao_BancariaBeforeDelete(
  DataSet: TDataSet);
begin
  if funcLocal.DeletaRegistro('CONTAS_BANCARIAS_MOV',cdsMovimentacao_BancariaCBMV_ID.AsString,'') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end;
end;

procedure TdmMovimentacao_Bancaria.cdsMovimentacao_BancariaNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('CBMV_ID').AsString                     := funcLocal.ObterSequencia('CONTAS_BANCARIAS_MOV',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('CBMV_EMPR_ID').AsInteger               := funcLocal.Empr_ID;
  DataSet.FieldByName('CBMV_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
  DataSet.FieldByName('CBMV_GENE_EMPR_ID_TIPO_MOV').AsInteger := 0;
  DataSet.FieldByName('CBMV_GENE_TGEN_ID_TIPO_MOV').AsInteger := 506;
  DataSet.FieldByName('CBMV_VALOR_MOV').AsFloat               := 0;
  DataSet.FieldByName('CBMV_GENE_EMPR_ID_ORIG').AsInteger     := 0;
  DataSet.FieldByName('CBMV_GENE_TGEN_ID_ORIG').AsInteger     := 13;
  DataSet.FieldByName('CBMV_GENE_ID_ORIG').AsInteger          := 3;
  DataSet.FieldByName('CBMV_CAMPO1_EMPR_ID_ORIG').AsInteger   := funcLocal.Empr_ID;
  DataSet.FieldByName('CBMV_CAMPO3_ID_ORIG').AsInteger        := cdsContas_BancariasCBCO_ID.AsInteger;
  DataSet.FieldByName('CBMV_DTA_CADASTRO').AsDateTime         := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CBMV_USER_ID').AsInteger               := funcLocal.User_ID;
end;

procedure TdmMovimentacao_Bancaria.cdsMovimentacao_BancariaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmMovimentacao_Bancaria','cdsMovimentacao_BancariaReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmMovimentacao_Bancaria.DataModuleCreate(Sender: TObject);
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

procedure TdmMovimentacao_Bancaria.dsContas_BancariasDataChange(Sender: TObject;
  Field: TField);
begin
  with cdsMovimentacao_Bancaria do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Params.ParamByName('CBCO_ID').AsInteger := cdsContas_BancariasCBCO_ID.AsInteger;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

function TdmMovimentacao_Bancaria.getSQL: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CB.CBCO_ID,');
      Add('      CB.CBCO_EMPR_ID,');
      Add('      CB.CBCO_DESCRICAO,');
      Add('      CB.CBCO_GENE_EMPR_ID_BCO,');
      Add('      CB.CBCO_GENE_TGEN_ID_BCO,');
      Add('      CB.CBCO_GENE_ID_BCO,');
      Add('      CB.CBCO_AGENCIA,');
      Add('      CB.CBCO_CONTA,');
      Add('      CB.CBCO_TIPO,');
      Add('      CB.CBCO_GERENTE,');
      Add('      CB.CBCO_VALOR_INICIAL,');
      Add('      CB.CBCO_SALDO_ATUAL,');
      Add('      CB.CBCO_ATIVO,');
      Add('      CB.CBCO_DTA_ABERTURA,');
      Add('      CB.CBCO_DTA_CADASTRO,');
      Add('      CB.CBCO_USER_ID,');
      Add('      BC.GENE_DESCR BANCO_DESCR,');
      Add('      BC.GENE_PAR1  COD_BANCO');
      Add('FROM  CONTAS_BANCARIAS CB');
      Add('INNER JOIN GENERICA BC');
      Add('ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
      Add('AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
      Add('AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
      Add('WHERE CB.CBCO_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
      Add('AND   CB.CBCO_ATIVO    = 1');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

initialization
  if dmMovimentacao_Bancaria = nil then
    dmMovimentacao_Bancaria := TdmMovimentacao_Bancaria.Create(nil);
finalization
  FreeAndNil(dmMovimentacao_Bancaria);

end.
