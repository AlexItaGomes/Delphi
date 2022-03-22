unit untUpdateSystem;

interface

uses
  Funcoes, SQLExpr, Vcl.Forms, ufPrincipal, SysUtils;

const
  intVersao = 2102;

var
  funcUpdate   : TFuncoes;
  qryCons      : TSQLQuery;
  intOldVersao : Integer;

{Inicialização}
procedure IniciaComponente; //Inicia o Pro_Funcoes
procedure UpdateSystem; //Esse atualiza todo o sistema;
procedure UpdateTables;
procedure InsertRowns;
procedure PreparaQuery;
function  UltimaVersao : Boolean;
procedure UpdateVersion;
{End Inicialização}

{Atualização de Tabelas}
procedure UpdateCLIENTES;
procedure UpdateCONF_ORDEM_SERVICO;
procedure UpdateCONF_SISTEMA;
procedure UpdateCONTAS_BANCARIAS;
procedure UpdateCONTAS_BANCARIAS_MOV;
procedure UpdateCONTAS_PAGAR;
procedure UpdateCONTAS_PAGAR_ACERTOS;
procedure UpdateCONTAS_RECEBER;
procedure UpdateCONTAS_RECEBER_ACERTOS;
procedure UpdateEMPRESAS;
procedure UpdateENTRADA_AVULSA;
procedure UpdateENTRADA_AVULSA_ITENS;
procedure UpdateESTOQUE;
procedure UpdateESTOQUE_MOV;
procedure UpdateFORNECEDORES;
procedure UpdateGENERICA;
procedure UpdateHISTORICO_ATENDIMENTO;
procedure UpdateLIVRO_CAIXA;
procedure UpdateLOGIN;
procedure UpdateMENU;
procedure UpdateNOTA_FISCAL;
procedure UpdateNOTA_FISCAL_ACERTOS;
procedure UpdateNOTA_FISCAL_ITENS;
procedure UpdateORDEM_SERVICO;
procedure UpdateORDEM_SERVICO_ACERTOS;
procedure UpdateORDEM_SERVICO_ITENS;
procedure UpdateORDEM_SERVICO_TRANSF;
procedure UpdateORDEM_SERVICO_TRANSF_ITENS;
procedure UpdatePEDIDO_VENDA;
procedure UpdatePEDIDO_VENDA_ACERTOS;
procedure UpdatePEDIDO_VENDA_ITENS;
procedure UpdatePLANO_CONTAS;
procedure UpdatePLANO_CONTAS_PLANEJAMENTO;
procedure UpdatePRODUTOS;
procedure UpdatePRODUTOS_BAR;
procedure UpdatePRODUTOS_CODIGO_FORNEC;
procedure UpdatePRODUTOS_COMP;
procedure UpdateSAIDA_AVARIA;
procedure UpdateSAIDA_AVARIA_ITENS;
procedure UpdateSAIDA_AVULSA;
procedure UpdateSAIDA_AVULSA_ITENS;
procedure UpdateTABELA_PRECO;
procedure UpdateTABELA_PRECO_ITENS;
procedure UpdateTGENER;
procedure UpdateTRANSF_ESTOQUE;
procedure UpdateTRANSF_ESTOQUE_ITENS;
procedure UpdateUSUARIO;
procedure UpdateUSUARIO_EMPR;
procedure UpdateUSUARIO_M;
{End Atualização de Tabelas}

{Domains}
procedure UpdateDomains;
{End Domains}

{Inserção de Registros}
{End Inserção de Registros}


implementation

procedure IniciaComponente;
var
  formPrinc : TForm;
begin
  formPrinc := Application.MainForm;
  if formPrinc <> nil then begin
    funcUpdate := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  end;
end;

{Este cara e o responsável por executar todas as rotinas de atualização}
procedure UpdateSystem;
begin
  try
    IniciaComponente;
    if not UltimaVersao then begin
      funcUpdate.MSGUpdate();
      UpdateDomains;
      UpdateTables;
      InsertRowns;
      UpdateVersion;
    end;
  finally
    funcUpdate.MSGUpdate('',false);
  end;
end;

procedure UpdateVersion;
begin
  PreparaQuery;
  with qryCons do begin
    try
      SQL.Add('UPDATE CONF_SISTEMA');
      SQL.Add('   SET CSIS_VERSION_SYSTEM = ' + IntToStr(intVersao));
      SQL.Add(' WHERE 1 = 1');
      ExecSQL();
    except
    end;
  end;
end;

function UltimaVersao : Boolean;
begin
  Result := true;
  PreparaQuery;
  with qryCons do begin
    try
      SQL.Add('SELECT MIN(COALESCE(CSIS_VERSION_SYSTEM,0)) AS VERSAO FROM CONF_SISTEMA');
      Open;
      if not IsEmpty then begin
        intOldVersao := FieldByName('VERSAO').AsInteger;
        Result := (intOldVersao >= intVersao);
        Exit;
      end else begin
        Result := false;
        Exit;
      end;
    except
      Result := false;
      Exit;
    end;
  end;
end;

procedure PreparaQuery;
begin
  if qryCons = nil then begin
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcUpdate.Conexao;
  end;
  qryCons.Close;
  qryCons.SQL.Clear;
end;

procedure UpdateTables;
begin
  UpdateCLIENTES;
  UpdateCONF_ORDEM_SERVICO;
  UpdateCONF_SISTEMA;
  UpdateCONTAS_BANCARIAS;
  UpdateCONTAS_BANCARIAS_MOV;
  UpdateCONTAS_PAGAR;
  UpdateCONTAS_PAGAR_ACERTOS;
  UpdateCONTAS_RECEBER;
  UpdateCONTAS_RECEBER_ACERTOS;
  UpdateEMPRESAS;
  UpdateENTRADA_AVULSA;
  UpdateENTRADA_AVULSA_ITENS;
  UpdateESTOQUE;
  UpdateESTOQUE_MOV;
  UpdateFORNECEDORES;
  UpdateGENERICA;
  UpdateHISTORICO_ATENDIMENTO;
  UpdateLIVRO_CAIXA;
  UpdateLOGIN;
  UpdateMENU;
  UpdateNOTA_FISCAL;
  UpdateNOTA_FISCAL_ACERTOS;
  UpdateNOTA_FISCAL_ITENS;
  UpdateORDEM_SERVICO;
  UpdateORDEM_SERVICO_ACERTOS;
  UpdateORDEM_SERVICO_ITENS;
  UpdateORDEM_SERVICO_TRANSF;
  UpdateORDEM_SERVICO_TRANSF_ITENS;
  UpdatePEDIDO_VENDA;
  UpdatePEDIDO_VENDA_ACERTOS;
  UpdatePEDIDO_VENDA_ITENS;
  UpdatePLANO_CONTAS;
  UpdatePLANO_CONTAS_PLANEJAMENTO;
  UpdatePRODUTOS;
  UpdatePRODUTOS_BAR;
  UpdatePRODUTOS_CODIGO_FORNEC;
  UpdatePRODUTOS_COMP;
  UpdateSAIDA_AVARIA;
  UpdateSAIDA_AVARIA_ITENS;
  UpdateSAIDA_AVULSA;
  UpdateSAIDA_AVULSA_ITENS;
  UpdateTABELA_PRECO;
  UpdateTABELA_PRECO_ITENS;
  UpdateTGENER;
  UpdateTRANSF_ESTOQUE;
  UpdateTRANSF_ESTOQUE_ITENS;
  UpdateUSUARIO;
  UpdateUSUARIO_EMPR;
  UpdateUSUARIO_M;
end;

procedure InsertRowns;
begin
  with qryCons do begin
    if intOldVersao < 2102 then begin
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (14, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (15, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (16, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (17, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (18, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (19, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (20, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (21, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (22, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (23, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (24, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (25, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (26, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (27, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (28, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (29, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (30, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (512, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (513, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (514, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (515, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (516, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (517, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (518, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (519, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (520, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (521, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (522, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (523, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (524, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (525, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (526, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (527, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (528, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (529, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('INSERT INTO TGENER (TGEN_ID, TGEN_COMENTARIO, TGEN_TIPO, TGEN_DESCR, TGEN_ROTULO_ID, TGEN_ROTULO_DESCR, TGEN_ROTULO_NUMBER1, TGEN_ROTULO_NUMBER2, TGEN_ROTULO_NUMBER3, TGEN_ROTULO_PAR1, TGEN_ROTULO_PAR2, TGEN_ROTULO_PAR3, TGEN_DTA_CADASTRO, TGEN_USER_ID)');
        sql.Add('VALUES (530, ''Não informado'', 0,''Não informado'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''2012-08-09'', 0)');
        ExecSQL();
      except
      end;
    end;
    case intOldVersao of
      0 : begin

      end;
    end;
  end;
end;

procedure UpdateCLIENTES;
begin
  with qryCons do begin
    if intOldVersao < 2102 then begin
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES DROP CONSTRAINT FK_CLIENTES6');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('DROP INDEX IDX_CLIENTES9');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES DROP CLIE_GENE_EMPR_ID_GRUPO');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES DROP CLIE_GENE_TGEN_ID_GRUPO');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES DROP CLIE_GENE_ID_GRUPO');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ADD CONSTRAINT FK_CLIENTES3 FOREIGN KEY (CLIE_USER_ID_ATENDENTE) REFERENCES USUARIO (USER_ID)');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_ID POSITION 1');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_EMPR_ID POSITION 2');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_RAZAO_SOCIAL POSITION 3');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_FANTASIA POSITION 4');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_CEP POSITION 5');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_ENDERECO POSITION 6');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_BAIRRO POSITION 7');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_EMPR_ID_PRACA POSITION 8');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_TGEN_ID_PRACA POSITION 9');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_ID_PRACA POSITION 10');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_EMPR_ID_ROTA POSITION 11');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_TGEN_ID_ROTA POSITION 12');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_GENE_ID_ROTA POSITION 13');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_RG POSITION 14');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TIPO POSITION 15');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_CNPJ_CPF POSITION 16');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_USER_ID_VENDEDOR POSITION 17');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_SITE POSITION 18');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_EMAIL POSITION 19');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_ATIVO POSITION 20');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TELEFONE1 POSITION 21');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TELEFONE2 POSITION 22');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TELEFONE3 POSITION 23');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TELEFONE4 POSITION 24');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_OBS POSITION 25');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_LIMITE_CREDITO POSITION 26');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_ACEITA_ULT_LIMITE_CRED POSITION 27');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TIPO_VENDA POSITION 28');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_TIPO_CLIENTE POSITION 29');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_REFERENCIA POSITION 30');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_DTA_ATENDIMENTO POSITION 31');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_USER_ID_ATENDENTE POSITION 32');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_BLOQUEAR_ATENDIMENTO POSITION 33');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_DTA_CADASTRO POSITION 34');
        ExecSQL();
      except
      end;
      try
        PreparaQuery;
        sql.Add('ALTER TABLE CLIENTES ALTER COLUMN CLIE_USER_ID POSITION 3');
        ExecSQL();
      except
      end;
    end;
    case intOldVersao of
      0 : begin

      end;
    end;
  end;
end;

procedure UpdateCONF_ORDEM_SERVICO;
begin

end;

procedure UpdateCONF_SISTEMA;
begin

end;

procedure UpdateCONTAS_BANCARIAS;
begin

end;

procedure UpdateCONTAS_BANCARIAS_MOV;
begin

end;

procedure UpdateCONTAS_PAGAR;
begin

end;

procedure UpdateCONTAS_PAGAR_ACERTOS;
begin

end;

procedure UpdateCONTAS_RECEBER;
begin

end;

procedure UpdateCONTAS_RECEBER_ACERTOS;
begin

end;

procedure UpdateEMPRESAS;
begin

end;

procedure UpdateENTRADA_AVULSA;
begin

end;

procedure UpdateENTRADA_AVULSA_ITENS;
begin

end;

procedure UpdateESTOQUE;
begin

end;

procedure UpdateESTOQUE_MOV;
begin

end;

procedure UpdateFORNECEDORES;
begin

end;

procedure UpdateGENERICA;
begin

end;

procedure UpdateHISTORICO_ATENDIMENTO;
begin

end;

procedure UpdateLIVRO_CAIXA;
begin

end;

procedure UpdateLOGIN;
begin

end;

procedure UpdateMENU;
begin

end;

procedure UpdateNOTA_FISCAL;
begin

end;

procedure UpdateNOTA_FISCAL_ACERTOS;
begin

end;

procedure UpdateNOTA_FISCAL_ITENS;
begin

end;

procedure UpdateORDEM_SERVICO;
begin

end;

procedure UpdateORDEM_SERVICO_ACERTOS;
begin

end;

procedure UpdateORDEM_SERVICO_ITENS;
begin

end;

procedure UpdateORDEM_SERVICO_TRANSF;
begin

end;

procedure UpdateORDEM_SERVICO_TRANSF_ITENS;
begin

end;

procedure UpdatePEDIDO_VENDA;
begin

end;

procedure UpdatePEDIDO_VENDA_ACERTOS;
begin

end;

procedure UpdatePEDIDO_VENDA_ITENS;
begin

end;

procedure UpdatePLANO_CONTAS;
begin

end;

procedure UpdatePLANO_CONTAS_PLANEJAMENTO;
begin

end;

procedure UpdatePRODUTOS;
begin

end;

procedure UpdatePRODUTOS_BAR;
begin

end;

procedure UpdatePRODUTOS_CODIGO_FORNEC;
begin

end;

procedure UpdatePRODUTOS_COMP;
begin

end;

procedure UpdateSAIDA_AVARIA;
begin

end;

procedure UpdateSAIDA_AVARIA_ITENS;
begin

end;

procedure UpdateSAIDA_AVULSA;
begin

end;

procedure UpdateSAIDA_AVULSA_ITENS;
begin

end;

procedure UpdateTABELA_PRECO;
begin

end;

procedure UpdateTABELA_PRECO_ITENS;
begin

end;

procedure UpdateTGENER;
begin

end;

procedure UpdateTRANSF_ESTOQUE;
begin

end;

procedure UpdateTRANSF_ESTOQUE_ITENS;
begin

end;

procedure UpdateUSUARIO;
begin

end;

procedure UpdateUSUARIO_EMPR;
begin

end;

procedure UpdateUSUARIO_M;
begin

end;

procedure UpdateDomains;
begin
  with qryCons do begin
    if intOldVersao < 2102 then begin
      try
        PreparaQuery;
        sql.Add('ALTER DOMAIN D_UNIDADE TYPE CHAR(3)');
        ExecSQL();
      except
      end;
    end;
    case intOldVersao of
      0 : begin

      end;
    end;
  end;
end;

end.
