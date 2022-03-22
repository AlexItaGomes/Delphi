unit udmTermo_Retirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmTermo_Retirada = class(TdmBasico)
    qryTermosRetirada: TSQLQuery;
    qryTermosRetiradaGENE_EMPR_ID: TIntegerField;
    qryTermosRetiradaGENE_TGEN_ID: TIntegerField;
    qryTermosRetiradaGENE_ID: TIntegerField;
    qryTermosRetiradaGENE_DESCR: TStringField;
    qryTermosRetiradaGENE_COMENTARIO: TStringField;
    qryTermosRetiradaGENE_NUMBER1: TIntegerField;
    qryTermosRetiradaGENE_NUMBER2: TIntegerField;
    qryTermosRetiradaGENE_NUMBER3: TIntegerField;
    qryTermosRetiradaGENE_GENE_EMPR_ID_PROP: TIntegerField;
    qryTermosRetiradaGENE_GENE_TGEN_ID_PROP: TIntegerField;
    qryTermosRetiradaGENE_GENE_ID_PROD: TIntegerField;
    qryTermosRetiradaGENE_DTA_CADASTRO: TDateField;
    qryTermosRetiradaGENE_USER_ID: TIntegerField;
    dspTermosRetirada: TDataSetProvider;
    cdsTermosRetirada: TClientDataSet;
    cdsTermosRetiradaGENE_ID: TIntegerField;
    cdsTermosRetiradaGENE_DESCR: TStringField;
    cdsTermosRetiradaGENE_DTA_CADASTRO: TDateField;
    cdsTermosRetiradaGENE_EMPR_ID: TIntegerField;
    cdsTermosRetiradaGENE_TGEN_ID: TIntegerField;
    cdsTermosRetiradaGENE_COMENTARIO: TStringField;
    cdsTermosRetiradaGENE_NUMBER1: TIntegerField;
    cdsTermosRetiradaGENE_NUMBER2: TIntegerField;
    cdsTermosRetiradaGENE_NUMBER3: TIntegerField;
    cdsTermosRetiradaGENE_GENE_EMPR_ID_PROP: TIntegerField;
    cdsTermosRetiradaGENE_GENE_TGEN_ID_PROP: TIntegerField;
    cdsTermosRetiradaGENE_GENE_ID_PROD: TIntegerField;
    cdsTermosRetiradaGENE_USER_ID: TIntegerField;
    dsTermosRetirada: TDataSource;
    qryItensTermosRetirada: TSQLQuery;
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
    dspItensTermosRetirada: TDataSetProvider;
    cdsItensTermosRetirada: TClientDataSet;
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
    dsItensTermosRetirada: TDataSource;
    qryTermosRetiradaGENE_PAR1: TStringField;
    qryTermosRetiradaGENE_PAR2: TStringField;
    qryTermosRetiradaGENE_PAR3: TStringField;
    cdsTermosRetiradaGENE_PAR1: TStringField;
    cdsTermosRetiradaGENE_PAR2: TStringField;
    cdsTermosRetiradaGENE_PAR3: TStringField;
    procedure cdsItensTermosRetiradaNewRecord(DataSet: TDataSet);
    procedure cdsTermosRetiradaNewRecord(DataSet: TDataSet);
    procedure cdsTermosRetiradaBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTermo_Retirada: TdmTermo_Retirada;

implementation

{$R *.dfm}

procedure TdmTermo_Retirada.cdsItensTermosRetiradaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger           := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger           := 512;
  DataSet.FieldByName('GENE_ID').AsString                 := funcLocal.ObterSequencia('512',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime     := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger           := funcLocal.User_ID;
  DataSet.FieldByName('GENE_GENE_EMPR_ID_PROP').AsInteger := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_GENE_TGEN_ID_PROP').AsInteger := 510;
  DataSet.FieldByName('GENE_GENE_ID_PROD').AsInteger      := cdsTermosRetiradaGENE_ID.AsInteger;
end;

procedure TdmTermo_Retirada.cdsTermosRetiradaBeforeDelete(DataSet: TDataSet);
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
        sql.Add('AND   GENE_GENE_TGEN_ID_PROP = 510');
        sql.Add('AND   GENE_GENE_ID_PROD      = ' + cdsTermosRetiradaGENE_ID.AsString);
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

procedure TdmTermo_Retirada.cdsTermosRetiradaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GENE_EMPR_ID').AsInteger       := funcLocal.Empr_ID;
  DataSet.FieldByName('GENE_TGEN_ID').AsInteger       := 510;
  DataSet.FieldByName('GENE_ID').AsString             := funcLocal.ObterSequencia('510',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('GENE_DTA_CADASTRO').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  DataSet.FieldByName('GENE_USER_ID').AsInteger       := funcLocal.User_ID;
end;

initialization
  if dmTermo_Retirada = nil then
    dmTermo_Retirada := TdmTermo_Retirada.Create(nil);
finalization
  FreeAndNil(dmTermo_Retirada);

end.
