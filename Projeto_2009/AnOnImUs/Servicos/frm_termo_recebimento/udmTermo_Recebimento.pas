unit udmTermo_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmTermo_Recebimento = class(TdmBasico)
    qryTermosRecebimento: TSQLQuery;
    dspTermosRecebimento: TDataSetProvider;
    cdsTermosRecebimento: TClientDataSet;
    dsTermosRecebimento: TDataSource;
    qryItensTermosRecebimento: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateField1: TDateField;
    IntegerField10: TIntegerField;
    dspItensTermosRecebimento: TDataSetProvider;
    cdsItensTermosRecebimento: TClientDataSet;
    IntegerField11: TIntegerField;
    StringField6: TStringField;
    DateField2: TDateField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField7: TStringField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    dsItensTermosRecebimento: TDataSource;
    qryTermosRecebimentoGENE_EMPR_ID: TIntegerField;
    qryTermosRecebimentoGENE_TGEN_ID: TIntegerField;
    qryTermosRecebimentoGENE_ID: TIntegerField;
    qryTermosRecebimentoGENE_DESCR: TStringField;
    qryTermosRecebimentoGENE_COMENTARIO: TStringField;
    qryTermosRecebimentoGENE_NUMBER1: TIntegerField;
    qryTermosRecebimentoGENE_NUMBER2: TIntegerField;
    qryTermosRecebimentoGENE_NUMBER3: TIntegerField;
    qryTermosRecebimentoGENE_PAR1: TStringField;
    qryTermosRecebimentoGENE_PAR2: TStringField;
    qryTermosRecebimentoGENE_PAR3: TStringField;
    qryTermosRecebimentoGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryTermosRecebimentoGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryTermosRecebimentoGENE_GENE_ID_PROD: TIntegerField;
    qryTermosRecebimentoGENE_DTA_CADASTRO: TDateField;
    qryTermosRecebimentoGENE_USER_ID: TIntegerField;
    cdsTermosRecebimentoGENE_EMPR_ID: TIntegerField;
    cdsTermosRecebimentoGENE_TGEN_ID: TIntegerField;
    cdsTermosRecebimentoGENE_ID: TIntegerField;
    cdsTermosRecebimentoGENE_DESCR: TStringField;
    cdsTermosRecebimentoGENE_COMENTARIO: TStringField;
    cdsTermosRecebimentoGENE_NUMBER1: TIntegerField;
    cdsTermosRecebimentoGENE_NUMBER2: TIntegerField;
    cdsTermosRecebimentoGENE_NUMBER3: TIntegerField;
    cdsTermosRecebimentoGENE_PAR1: TStringField;
    cdsTermosRecebimentoGENE_PAR2: TStringField;
    cdsTermosRecebimentoGENE_PAR3: TStringField;
    cdsTermosRecebimentoGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsTermosRecebimentoGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsTermosRecebimentoGENE_GENE_ID_PROD: TIntegerField;
    cdsTermosRecebimentoGENE_DTA_CADASTRO: TDateField;
    cdsTermosRecebimentoGENE_USER_ID: TIntegerField;
    procedure cdsTermosRecebimentoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsTermosRecebimentoNewRecord(DataSet: TDataSet);
    procedure cdsItensTermosRecebimentoNewRecord(DataSet: TDataSet);
    procedure cdsItensTermosRecebimentoReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsTermosRecebimentoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTermo_Recebimento: TdmTermo_Recebimento;

implementation

{$R *.dfm}

procedure TdmTermo_Recebimento.cdsItensTermosRecebimentoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger           := 511;
  DataSet.FieldByName('GENE_ID').AsString                 := funcLocal.ObterSequencia('511',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger           := funcLocal.User_ID;
  DataSet.FieldByName('GENE_GENE_EMPR_ID_PROP').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_GENE_TGEN_ID_PROP').AsInteger := 509;
  DataSet.FieldByName('GENE_GENE_ID_PROD').AsInteger      := cdsTermosRecebimentoGENE_ID.AsInteger;
end;

procedure TdmTermo_Recebimento.cdsItensTermosRecebimentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmTermo_Recebimento','cdsItensTermosRecebimentoReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
end;

procedure TdmTermo_Recebimento.cdsTermosRecebimentoBeforeDelete(
  DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  inherited;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('DELETE FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_GENE_EMPR_ID_PROP = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_GENE_TGEN_ID_PROP = 509');
        sql.Add('AND   GENE_GENE_ID_PROD      = ' + cdsTermosRecebimentoGENE_ID.AsString);
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro('TdmTermo_Recebimento','cdsTermosRecebimentoBeforeDelete',e.Message);
      funcLocal.Alerta('Erro ao realizar a exclusão do registro selecionado.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TdmTermo_Recebimento.cdsTermosRecebimentoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 509;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequencia('509',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

procedure TdmTermo_Recebimento.cdsTermosRecebimentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  funcLocal.ReportaErro('TdmTermo_Recebimento','cdsTermos_RecebimentoReconcileError',e.Message);
  funcLocal.Alerta('Erro ao tentar salvar o registro.'+#13+'['+e.Message+']',1);
end;

initialization
  if dmTermo_Recebimento = nil then
    dmTermo_Recebimento := TdmTermo_Recebimento.Create(nil);
finalization
  FreeAndNil(dmTermo_Recebimento);

end.
