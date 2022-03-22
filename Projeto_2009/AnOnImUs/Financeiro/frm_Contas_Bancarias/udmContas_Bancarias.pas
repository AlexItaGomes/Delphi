unit udmContas_Bancarias;

interface

uses
  SysUtils, Classes, Forms, SQLExpr, Funcoes, FMTBcd, DB, DBClient, Provider;

type
  TdmContas_Bancarias = class(TDataModule)
    qryContas_Bancarias: TSQLQuery;
    dspContas_Bancarias: TDataSetProvider;
    cdsContas_Bancarias: TClientDataSet;
    dsContas_Bancarias: TDataSource;
    qryContas_BancariasCBCO_ID: TIntegerField;
    qryContas_BancariasCBCO_EMPR_ID: TIntegerField;
    qryContas_BancariasCBCO_GENE_EMPR_ID_BCO: TIntegerField;
    qryContas_BancariasCBCO_GENE_TGEN_ID_BCO: TIntegerField;
    qryContas_BancariasCBCO_GENE_ID_BCO: TIntegerField;
    qryContas_BancariasCBCO_AGENCIA: TStringField;
    qryContas_BancariasCBCO_CONTA: TStringField;
    qryContas_BancariasCBCO_TIPO: TStringField;
    qryContas_BancariasCBCO_GERENTE: TStringField;
    qryContas_BancariasCBCO_VALOR_INICIAL: TFMTBCDField;
    qryContas_BancariasCBCO_SALDO_ATUAL: TFMTBCDField;
    qryContas_BancariasCBCO_DTA_CADASTRO: TDateField;
    qryContas_BancariasCBCO_USER_ID: TIntegerField;
    qryContas_BancariasBANCO_DESCR: TStringField;
    qryContas_BancariasCOD_BANCO: TStringField;
    qryContas_BancariasCBCO_ATIVO: TIntegerField;
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
    dspPesq_Bancos: TDataSetProvider;
    cdsPesq_Bancos: TClientDataSet;
    dsPesq_Bancos: TDataSource;
    cdsPesq_BancosGENE_ID: TIntegerField;
    cdsPesq_BancosGENE_DESCR: TStringField;
    cdsPesq_BancosGENE_PAR1: TStringField;
    qryContas_Bancarias_Mov: TSQLQuery;
    dspContas_Bancarias_Mov: TDataSetProvider;
    cdsContas_Bancarias_Mov: TClientDataSet;
    dsContas_Bancarias_Mov: TDataSource;
    cdsContas_Bancarias_MovCBMV_ID: TIntegerField;
    cdsContas_Bancarias_MovCBMV_EMPR_ID: TIntegerField;
    cdsContas_Bancarias_MovCBMV_CBCO_ID: TIntegerField;
    cdsContas_Bancarias_MovCBMV_CBCO_EMPR_ID: TIntegerField;
    cdsContas_Bancarias_MovCBMV_GENE_EMPR_ID_TIPO_MOV: TIntegerField;
    cdsContas_Bancarias_MovCBMV_GENE_TGEN_ID_TIPO_MOV: TIntegerField;
    cdsContas_Bancarias_MovCBMV_GENE_ID_TIPO_MOV: TIntegerField;
    cdsContas_Bancarias_MovCBMV_VALOR_MOV: TFMTBCDField;
    cdsContas_Bancarias_MovCBMV_SALDO_DISP: TFMTBCDField;
    cdsContas_Bancarias_MovCBMV_DTA_CADASTRO: TDateField;
    cdsContas_Bancarias_MovCBMV_USER_ID: TIntegerField;
    cdsContas_Bancarias_MovGENE_DESCR: TStringField;
    cdsContas_Bancarias_MovGENE_PAR1: TStringField;
    qryContas_BancariasCBCO_LIMITE: TFMTBCDField;
    cdsContas_BancariasCBCO_LIMITE: TFMTBCDField;
    qryContas_BancariasCBCO_DESCRICAO: TStringField;
    cdsContas_BancariasCBCO_DESCRICAO: TStringField;
    qryContas_BancariasCBCO_DIA_LIMITE: TIntegerField;
    cdsContas_BancariasCBCO_DIA_LIMITE: TIntegerField;
    qryPesq_Bancos: TSQLQuery;
    qryContas_BancariasCBCO_DTA_ABERTURA: TDateField;
    cdsContas_BancariasCBCO_DTA_ABERTURA: TDateField;
    qryContas_BancariasCBCO_CONSIDERAR_SALDOS: TIntegerField;
    cdsContas_BancariasCBCO_CONSIDERAR_SALDOS: TIntegerField;
    qryContas_BancariasCBCO_PARTICIPA_METAS: TIntegerField;
    cdsContas_BancariasCBCO_PARTICIPA_METAS: TIntegerField;
    qryContas_BancariasCBCO_MULTI_EMPRESA: TIntegerField;
    cdsContas_BancariasCBCO_MULTI_EMPRESA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContas_BancariasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_BancariasNewRecord(DataSet: TDataSet);
    procedure dsContas_BancariasDataChange(Sender: TObject; Field: TField);
    procedure cdsContas_BancariasBeforeDelete(DataSet: TDataSet);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmContas_Bancarias: TdmContas_Bancarias;

implementation

{$R *.dfm}

procedure TdmContas_Bancarias.cdsContas_BancariasBeforeDelete(
  DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  if funcLocal.DeletaRegistro('CONTAS_BANCARIAS',cdsContas_BancariasCBCO_ID.AsString,'CONTAS_BANCARIAS_MOV') then begin
    funcLocal.Alerta('O registro selecionado está vinculado a outros registros do sistema, por tanto o mesmo não poderá ser excluído!',1);
    Abort;
  end else begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('DELETE FROM CONTAS_BANCARIAS_MOV');
          sql.Add('WHERE  CBMV_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND    CBMV_CBCO_ID      = ' + cdsContas_BancariasCBCO_ID.AsString);
          sql.Add('AND    CBMV_CBCO_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          try
            funcLocal.StartCommit;
          except
          end;
          ExecSQL;
          try
            funcLocal.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro('TdmContas_Bancarias','cdsContas_BancariasBeforeCancel',funcLocal.User_Login,e.Message);
        funcLocal.Alerta('Erro na exclusão do registro selecionado.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmContas_Bancarias.cdsContas_BancariasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CBCO_ID').AsString                 := funcLocal.ObterSequencia('CONTAS_BANCARIAS',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('CBCO_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('CBCO_ATIVO').AsInteger             := 1;
  DataSet.FieldByName('CBCO_TIPO').AsString               := 'C';
  DataSet.FieldByName('CBCO_VALOR_INICIAL').AsFloat       := 0;
  DataSet.FieldByName('CBCO_SALDO_ATUAL').AsFloat         := 0;
  DataSet.FieldByName('CBCO_LIMITE').AsFloat              := 0;
  DataSet.FieldByName('CBCO_GENE_EMPR_ID_BCO').AsInteger  := 0;
  DataSet.FieldByName('CBCO_GENE_TGEN_ID_BCO').AsInteger  := 505;
  DataSet.FieldByName('CBCO_DIA_LIMITE').AsInteger        := 1;
  DataSet.FieldByName('CBCO_CONSIDERAR_SALDOS').AsInteger := 1;
  DataSet.FieldByName('CBCO_PARTICIPA_METAS').AsInteger   := 1;
  DataSet.FieldByName('CBCO_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('CBCO_USER_ID').AsInteger           := funcLocal.User_ID;
end;

procedure TdmContas_Bancarias.cdsContas_BancariasReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  funcLocal.ReportaErro('TdmContas_Bancarias','cdsContas_BancariasReconcileError',funcLocal.User_Login,e.Message);
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmContas_Bancarias.DataModuleCreate(Sender: TObject);
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

procedure TdmContas_Bancarias.dsContas_BancariasDataChange(Sender: TObject;
  Field: TField);
begin
  try
    with cdsContas_Bancarias_Mov do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('CBCO_ID').AsInteger := cdsContas_BancariasCBCO_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  except
  end;
end;

initialization
  if dmContas_Bancarias = nil then
    dmContas_Bancarias := TdmContas_Bancarias.Create(nil);
finalization
  FreeAndNil(dmContas_Bancarias);

end.
