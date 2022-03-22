unit udmUsuarios;

interface

uses
  Funcoes, SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Forms;

type
  TdmUsuarios = class(TDataModule)
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dsUsuario: TDataSource;
    cdsUsuarioUSER_ID: TIntegerField;
    cdsUsuarioUSER_NOME_COMPLETO: TStringField;
    cdsUsuarioUSER_LOGIN: TStringField;
    cdsUsuarioUSER_SENHA: TStringField;
    cdsUsuarioUSER_ATIVO: TIntegerField;
    cdsUsuarioUSER_DTA_CADASTRO: TDateField;
    cdsUsuarioUSER_USER_ID: TIntegerField;
    qryUsuario: TSQLQuery;
    qryUsuarioUSER_ID: TIntegerField;
    qryUsuarioUSER_NOME_COMPLETO: TStringField;
    qryUsuarioUSER_LOGIN: TStringField;
    qryUsuarioUSER_SENHA: TStringField;
    qryUsuarioUSER_ATIVO: TIntegerField;
    qryUsuarioUSER_CEP: TStringField;
    qryUsuarioUSER_ENDERECO: TStringField;
    qryUsuarioUSER_BAIRRO: TStringField;
    qryUsuarioUSER_GENE_EMPR_ID_PRACA: TIntegerField;
    qryUsuarioUSER_GENE_TGEN_ID_PRACA: TIntegerField;
    qryUsuarioUSER_GENE_ID_PRACA: TIntegerField;
    qryUsuarioUSER_EMAIL: TStringField;
    qryUsuarioUSER_TELEFONE1: TStringField;
    qryUsuarioUSER_TELEFONE2: TStringField;
    qryUsuarioUSER_TELEFONE3: TStringField;
    qryUsuarioUSER_TELEFONE4: TStringField;
    qryUsuarioUSER_DTA_CADASTRO: TDateField;
    qryUsuarioUSER_USER_ID: TIntegerField;
    qryUsuarioGENE_DESCR: TStringField;
    qryUsuarioGENE_PAR1: TStringField;
    cdsUsuarioUSER_CEP: TStringField;
    cdsUsuarioUSER_ENDERECO: TStringField;
    cdsUsuarioUSER_BAIRRO: TStringField;
    cdsUsuarioUSER_GENE_EMPR_ID_PRACA: TIntegerField;
    cdsUsuarioUSER_GENE_TGEN_ID_PRACA: TIntegerField;
    cdsUsuarioUSER_GENE_ID_PRACA: TIntegerField;
    cdsUsuarioUSER_EMAIL: TStringField;
    cdsUsuarioUSER_TELEFONE1: TStringField;
    cdsUsuarioUSER_TELEFONE2: TStringField;
    cdsUsuarioUSER_TELEFONE3: TStringField;
    cdsUsuarioUSER_TELEFONE4: TStringField;
    cdsUsuarioGENE_DESCR: TStringField;
    cdsUsuarioGENE_PAR1: TStringField;
    qryPesq_Praca: TSQLQuery;
    dspPesq_Praca: TDataSetProvider;
    cdsPesq_Praca: TClientDataSet;
    cdsPesq_PracaGENE_ID: TIntegerField;
    cdsPesq_PracaGENE_DESCR: TStringField;
    cdsPesq_PracaGENE_PAR1: TStringField;
    qryUsuarioUSER_NIVEL_SENHA: TIntegerField;
    qryUsuarioUSER_USER_ID_SUPERVISOR: TIntegerField;
    qryUsuarioSUPERVISOR: TStringField;
    cdsUsuarioUSER_NIVEL_SENHA: TIntegerField;
    cdsUsuarioUSER_USER_ID_SUPERVISOR: TIntegerField;
    cdsUsuarioSUPERVISOR: TStringField;
    qryUsuarioUSER_VENDEDOR: TIntegerField;
    cdsUsuarioUSER_VENDEDOR: TIntegerField;
    dspProfissionais: TDataSetProvider;
    cdsProfissionais: TClientDataSet;
    dsProfissionais: TDataSource;
    qryProfissionais: TSQLQuery;
    qryProfissionaisUSPR_ID: TIntegerField;
    qryProfissionaisUSPR_USER_ID_USUARIO: TIntegerField;
    qryProfissionaisUSPR_USER_ID_PROFISSIONAL: TIntegerField;
    qryProfissionaisUSPR_DTA_CADASTRO: TDateField;
    qryProfissionaisUSPR_USER_ID: TIntegerField;
    cdsProfissionaisUSPR_ID: TIntegerField;
    cdsProfissionaisUSPR_USER_ID_USUARIO: TIntegerField;
    cdsProfissionaisUSPR_USER_ID_PROFISSIONAL: TIntegerField;
    cdsProfissionaisUSPR_DTA_CADASTRO: TDateField;
    cdsProfissionaisUSPR_USER_ID: TIntegerField;
    qryUsuarioUSER_LIMITAR_PROFISSIONAIS: TIntegerField;
    cdsUsuarioUSER_LIMITAR_PROFISSIONAIS: TIntegerField;
    procedure cdsUsuarioReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsUsuarioNewRecord(DataSet: TDataSet);
    procedure cdsUsuarioBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure dsUsuarioDataChange(Sender: TObject; Field: TField);
  private
    funcLocal : TFuncoes;
  public
    { Public declarations }
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{$R *.dfm}

procedure TdmUsuarios.cdsUsuarioBeforeDelete(DataSet: TDataSet);
var
  qryCons : TSQLQuery;
begin
  if funcLocal.DeletaRegistro('USUARIO',cdsUsuarioUSER_ID.AsString,'USUARIO_EMPR;USUARIO_M') then begin
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
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('DELETE FROM USUARIO_EMPR');
          sql.Add('WHERE USEP_USER_ID = ' + cdsUsuarioUSER_ID.AsString);
          sql.Add('AND   USEP_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit
          except
          end;
        end;
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcLocal.StartCommit;
          except
          end;
          sql.Add('DELETE FROM USUARIO_M');
          sql.Add('WHERE USRM_USER_ID = ' + cdsUsuarioUSER_ID.AsString);
          sql.Add('AND   USRM_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL;
          try
            funcLocal.Commit
          except
          end;
        end;
      except on e: exception do begin
        funcLocal.RollBack;
        funcLocal.ReportaErro(dmUsuarios.Name,'cdsUsuarioBeforeDelete',funcLocal.User_Login,e.Message);
        funcLocal.Alerta(e.Message,1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TdmUsuarios.cdsUsuarioNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('USER_ID').AsString                   := funcLocal.ObterSequencia('USUARIO',IntToStr(funcLocal.Empr_ID));
  DataSet.FieldByName('USER_ATIVO').AsInteger               := 1;
  DataSet.FieldByName('USER_GENE_EMPR_ID_PRACA').AsInteger  := 0;
  DataSet.FieldByName('USER_GENE_TGEN_ID_PRACA').AsInteger  := 501;
  DataSet.FieldByName('USER_NIVEL_SENHA').AsInteger         := 0;
  DataSet.FieldByName('USER_VENDEDOR').AsInteger            := 0;
  DataSet.FieldByName('USER_LIMITAR_PROFISSIONAIS').AsInteger := 0;
  DataSet.FieldByName('USER_DTA_CADASTRO').AsDateTime       := funcLocal.DataServidor(qryUsuario.SQLConnection);
  DataSet.FieldByName('USER_USER_ID').AsInteger             := funcLocal.User_ID;
end;

procedure TdmUsuarios.cdsUsuarioReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  funcLocal.Alerta(e.Message,1);
end;

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
var
  intI     : Integer;
  formPrinc : TForm;
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

procedure TdmUsuarios.dsUsuarioDataChange(Sender: TObject; Field: TField);
begin
  with cdsProfissionais do begin
    Close;
    Params.ParamByName('USER_ID').AsInteger := cdsUsuarioUSER_ID.AsInteger;
    Open;
  end;
end;

initialization
  if dmUsuarios = nil then
    dmUsuarios := TdmUsuarios.Create(nil);
finalization
  FreeAndNil(dmUsuarios);

end.
