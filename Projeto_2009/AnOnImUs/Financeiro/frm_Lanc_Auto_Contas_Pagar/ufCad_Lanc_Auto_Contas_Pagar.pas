unit ufCad_Lanc_Auto_Contas_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls,
  rxCurrEdit, RXDBCtrl, rxToolEdit, Mask, DBClient, DB, SQLExpr;

type
  TfCad_Lanc_Auto_Contas_Pagar = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnPesq_Forn: TSpeedButton;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnPesq_Plano: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnPesq_Doc: TSpeedButton;
    Label19: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtNr_Doc: TDBEdit;
    edtProveniente: TDBEdit;
    edtCod_Fornec: TDBEdit;
    edtFornecedor: TDBEdit;
    edtDt_Emissao: TDBDateEdit;
    edtDt_Vecto: TDBDateEdit;
    edtVlr_Doc: TRxDBCalcEdit;
    edtCod_Plano: TDBEdit;
    edtPlano: TDBEdit;
    edtCod_Simplif: TDBEdit;
    edtCod_Doc: TDBEdit;
    edtDocumento: TDBEdit;
    DBMemo1: TDBMemo;
    rdStatus: TDBRadioGroup;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    edtVlrPlanejado: TRxCalcEdit;
    edtVlrComprometido: TRxCalcEdit;
    DBDateEdit5: TDBDateEdit;
    Panel2: TPanel;
    lb21: TLabel;
    lb1: TLabel;
    lb4: TDBText;
    lb7: TLabel;
    lb9: TDBText;
    lb11: TLabel;
    lb13: TDBText;
    lb2: TLabel;
    lb5: TDBText;
    lb15: TLabel;
    lb17: TDBText;
    lb23: TLabel;
    lb6: TDBText;
    lb8: TLabel;
    lb10: TDBText;
    lb18: TDBText;
    lb16: TLabel;
    lb14: TDBText;
    lb12: TLabel;
    lb19: TLabel;
    lb20: TLabel;
    lb22: TDBImage;
    edtVlr_Pago: TDBEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    btnPesq_Banco: TSpeedButton;
    Label26: TLabel;
    btnInsertBanco: TSpeedButton;
    edtCod_Banco: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    rdBanco: TDBCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure rdBancoClick(Sender: TObject);
    procedure edtCod_FornecExit(Sender: TObject);
    procedure btnPesq_FornClick(Sender: TObject);
    procedure edtCod_FornecKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_PlanoExit(Sender: TObject);
    procedure btnPesq_PlanoClick(Sender: TObject);
    procedure edtCod_DocExit(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure edtCod_BancoExit(Sender: TObject);
    procedure btnPesq_BancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtVlr_DocExit(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnInsertBancoClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function TemLimitenoPlano(strCod_ID: String; floatValor: Real;
      out BoolConciliado: Boolean; out fltValor : Real; out fltSoma : Real): Boolean;
    procedure RegistraMovtoConta(strCPAG_ID, strGene_ID: String;
      floatValor: Real);
    procedure PanelBanco(boolTMP: Boolean);
    procedure OpenClientDataSet(intPos : Integer = 99);
    function DocJaLancado: Boolean;
    procedure LancaDadosCartao(strTMP: String);
    procedure OcultaLabel(boolValue: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Lanc_Auto_Contas_Pagar: TfCad_Lanc_Auto_Contas_Pagar;
  strPlano_ID : String;

implementation

uses udmLanc_Auto_Contas_Pagar, DBGrids;

{$R *.dfm}

procedure TfCad_Lanc_Auto_Contas_Pagar.btnOkClick(Sender: TObject);
var
  strCPAG_ID,
  strGene_ID : String;
  floatValor : Real;
  boolBanco  : Boolean;
  strValor   : String;
begin
  strValor := funcLocal.TrataFloat(edtVlr_Pago.Text);
  if ValidaDados then begin
    if funcLocal.Alerta('Confirma a baixa automática do título informado?',1,true) = 6 then begin
      with cdsLocal do begin
        if (not rdBanco.Checked) then begin
          funcLocal.LancamentoLivroCaixa(FieldByName('CPAG_PLCT_ID').AsString,
                                         '2',
                                         FieldByName('CPAG_ID').AsString,
                                         FieldByName('CPAG_EMPR_ID').AsString,
                                         '0',
                                         '0',
                                         '11',
                                         '3',
                                         (FieldByName('CPAG_VALOR_PAGO').AsFloat * -1));
        end else begin
          funcLocal.RegistraMovBancario(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,(StrToFloat(funcLocal.TrataFloat(strValor)) * -1));
          funcLocal.RegistraMovConta(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,'1001','1',FieldByName('CPAG_ID').AsString,(StrToFloat(funcLocal.TrataFloat(strValor)) * -1));
          PanelBanco(false);
        end;
      end;
      strCPAG_ID := cdsLocal.FieldByName('CPAG_ID').AsString;
      strGene_ID := cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString;
      floatValor := (cdsLocal.FieldByName('CPAG_VALOR_PAGO').AsFloat * -1);
      boolBanco  := (cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger = 1);
      funcLocal.BaixarContaReceberPrevisto(cdsLocal.FieldByName('CPAG_DTA_VCTO').AsDateTime,
                                          (cdsLocal.FieldByName('CPAG_VALOR_DOC').AsFloat*-1),
                                           cdsLocal.FieldByName('CPAG_PLCT_ID').AsString);
      inherited;
      RegistraMovtoConta(strCPAG_ID,strGene_Id,floatValor);
      cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger := funcLocal.Se(boolBanco,1,0);
      rdBancoClick(Sender);
      cdsLocal.FieldByName('CPAG_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
      edtVlr_Doc.SetFocus;
    end;
  end else IsValidData;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.RegistraMovtoConta(strCPAG_ID, strGene_ID : String; floatValor : Real);
var
  qryCons : TSQLQuery;
begin
  try
    FormatSettings.DecimalSeparator := '.';
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
        sql.Add('INSERT INTO CONTAS_PAGAR_ACERTOS');
        sql.Add('VALUES(' + funcLocal.ObterSequencia('CONTAS_PAGAR_ACERTOS',IntToStr(funcLocal.Empr_ID)) + ','
                          + IntToStr(funcLocal.Empr_ID)     + ','
                          + strCPAG_ID                      + ','
                          + IntToStr(funcLocal.Empr_ID)     + ','
                          + '0'                             + ','
                          + '5'                             + ','
                          + strGene_ID                      + ','
                          + FormatFloat('0.00',floatValor)  + ','
                          + QuotedStr(FormatDateTime('mm/dd/yyyy',funcLocal.DataServidor(funcLocal.Conexao))) + ','
                          + IntToStr(funcLocal.User_ID)     + ')');
        ExecSQL;
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.ReportaErro(Caption,'RegistraMovConta',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro no processo de lançamento da conta.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label8Click(Sender);
  edtCod_Fornec.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label14Click(Sender);
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.btnInsertBancoClick(Sender: TObject);
begin
  inherited;
  Label22Click(Sender);
  edtCod_Banco.SetFocus;
end;

function TfCad_Lanc_Auto_Contas_Pagar.ValidaDados : Boolean;
var
  boolConciliado : Boolean;
  fltValor,
  fltSoma   : Real;
  strValor  : String;
begin
  Result := true; strValor := funcLocal.TrataFloat(edtVlr_Pago.Text);
  if edtProveniente.Text = '' then begin
    funcLocal.Alerta('Informe a proveniência do título antes de continuar.',1);
    edtProveniente.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Fornec.Text = '' then begin
    funcLocal.Alerta('Informe o fornecedor antes de continuar.',1);
    edtCod_Fornec.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Emissao.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de emissão do título antes de continuar.',1);
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Vecto.Date <= 0 then begin
    funcLocal.Alerta('Informe a data de vencimento do título antes de continuar.',1);
    edtDt_Vecto.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDt_Vecto.Date < edtDt_Emissao.Date then begin
    funcLocal.Alerta('A data de vencimento do título não pode ser menor que sua data de emissão.',1);
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlr_Doc.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor do título antes de continuar.',1);
    edtVlr_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Plano.Text = '' then begin
    funcLocal.Alerta('Informe o plano de contas antes de continuar.',1);
    edtCod_Plano.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Doc.Text = '' then begin
    funcLocal.Alerta('Informe o tipo do documento antes de continuar.',1);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Doc.Text = '5' then begin
    funcLocal.Alerta('Está rotina não permite o lançamento de títulos em [CARTÃO DE CRÉDITO].',1);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if rdBanco.Checked then begin
    if edtCod_Banco.Text = '' then begin
      funcLocal.Alerta('Informe a conta bancaria que será efetuado o pagamento antes de continuar.',1);
      try
        edtCod_Banco.SetFocus;
      except
      end;
      Result := false;
      Exit;
    end;
    if not funcLocal.ContaBancariaAtiva(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                        'Conta bancária informada no título encontra-se inativa, verifique sua(s) conta(s) bancária(s) antes de continuar!',1);

      try
        edtCod_Banco.SetFocus;
      except
      end;
      Result := false;
      Exit;
    end;
  end;
  if (StrToInt(edtCod_Doc.Text) in [4,5]) and (not rdBanco.Checked) then begin
    funcLocal.Alerta('Movimentações em cartão necessitam estar vinculados a uma conta bancária!',0);
    edtCod_Doc.SetFocus;
    Result := false;
    Exit;
  end;
  if DocJaLancado then begin
    if funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                        'Já consta no sistema um título '+
                        'com o mesmo número de documento, se você continuar estará '+
                        'provavelmente duplicando o título.'+#13+#13+
                        'Deseja continuar?',1,true) = 7 then begin
      edtNr_Doc.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if (cdsLocal.State = dsInsert) then begin
    if not TemLimitenoPlano(edtCod_Plano.Text,StrToFloat(funcLocal.TrataFloat( strValor )), boolConciliado,fltValor,fltSoma) then begin
      if boolConciliado then begin
        funcLocal.Alerta('Limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado já foi atingido.'+#13+#13+
                         'Valor Planejado R$ ' + FormatFloat('###,###,##0.00',fltValor)+#13+
                         'Valor lançado    R$ ' + FormatFloat('###,###,##0.00',fltSoma)+#13+#13+
                         'Verifique o seu replanejamento para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado antes de continuar.',1);
        edtCod_Plano.SetFocus;
        Result := false;
        Exit;
      end else begin
        if funcLocal.Alerta('Limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado já foi atingido.'+#13+#13+
                            'Valor Planejado R$ ' + FormatFloat('###,###,##0.00',fltValor)+#13+
                            'Valor lançado    R$ ' + FormatFloat('###,###,##0.00',fltSoma)+#13+#13+
                            'Se continuar o seu limite de crédito para o plano de contas [ '+edtCod_Simplif.Text + ' - ' +edtPlano.Text+' ] no mês informado será ultrapassado.'+#13+#13+'Deseja continuar?',1,true) = 7 then begin
          edtCod_Plano.SetFocus;
          Result := false;
          Exit;
        end;
      end;
    end;
  end;
  if (rdBanco.Checked) then begin
    if not funcLocal.TemSaldoEmConta(cdsLocal.FieldByName('CPAG_CBCO_ID').AsString,StrToFloat(funcLocal.TrataFloat(strValor ))) then begin
      funcLocal.Alerta('Não consta saldo bancário suficiente para esta movimentação.',1);
      edtVlr_Doc.SetFocus;
      Result := false;
      Exit;
    end;
  end else if not funcLocal.TemSaldoLivroCaixa(StrToFloat(funcLocal.TrataFloat(strValor))) then begin
    funcLocal.Alerta('Não consta saldo em caixa suficiente para esta movimentação.',1);
    edtVlr_Doc.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Lanc_Auto_Contas_Pagar.DocJaLancado : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_ID     <> ' + cdsLocal.FieldByName('CPAG_ID').AsString);
        sql.Add('AND   CPAG_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CPAG_NR_DOC  = ' + QuotedStr(cdsLocal.FieldByName('CPAG_NR_DOC').AsString));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then begin
          Result := true;
          Exit;
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.btnPesq_BancoClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(3);
  strTMP := funcLocal.Busca_Registro(dmLanc_Auto_Contas_Pagar.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    edtCod_Banco.Modified := true;
  end else begin
    cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Pagar do begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.btnPesq_FornClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Pagar do begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Fornecedor,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Fornec.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    end;
  end;
  edtCod_Fornec.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.btnPesq_PlanoClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Pagar do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Plano.Modified := true;
    end else begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtCod_BancoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Banco.Modified then Exit;
  if edtCod_Banco.Text <> '' then begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(dmLanc_Auto_Contas_Pagar.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','CBCO_ID = ' + edtCod_Banco.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    end else begin
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end else begin
    cdsLocal.FieldByName('CPAG_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmLanc_Auto_Contas_Pagar do begin
    if edtCod_Doc.Text <> '' then begin
      OpenClientDataSet(4);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
        if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
          cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger     := 1;
          rdBancoClick(Sender);
          try
            edtCod_Banco.SetFocus;
          except
          end;
        end;
        edtCod_Doc.Modified := false;
      end else begin
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
        cdsLocal.FieldByName('CPAG_CCRE_ID').AsString          := '';
        cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString     := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString          := '';
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString     := '';
    end;
    try
      if funcLocal.VinculaCartaoCredito then begin
        strTMP := funcLocal.RetornaCartaoCredito(cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsInteger,edtVlr_Doc.Value,'D');
        LancaDadosCartao(strTMP);
      end;
    except
    end;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtCod_FornecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Fornec.Modified then Exit;
  with dmLanc_Auto_Contas_Pagar do begin
    if edtCod_Fornec.Text <> '' then begin
      OpenClientDataSet(1);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Fornecedor,'FORN_NOME_FANTASIA','FORN_ID;FORN_NOME_FANTASIA','FORN_ID = ' + edtCod_Fornec.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
        cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_FORN_ID').AsString       := '';
      cdsLocal.FieldByName('FORN_NOME_FANTASIA').AsString := '';
    end;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtCod_FornecKeyPress(Sender: TObject;
  var Key: Char);
var
  btnTMP : TSpeedButton;
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    if Trim(TDBEdit(Sender).Text) = '' then begin
      if Key = #27 then Exit;
      funcLocal.VlrPesq := Key;
      Key := #0;
      btnTMP := TSpeedButton(Self.FindComponent(funcLocal.Buscar_Coluna(TDBEdit(Sender).ImeName,1)));
      btnTMP.Click;
    end else Key := #0;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtCod_PlanoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Plano.Modified then Exit;
  with dmLanc_Auto_Contas_Pagar do begin
    if edtCod_Plano.Text <> '' then begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCod_Plano.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
        funcLocal.ValorPlanejado(cdsLocal.FieldByName('CPAG_PLCT_ID').AsString,edtVlrPlanejado,edtVlrComprometido,edtDt_Vecto.Date);
      end else begin
        cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
      end;
    end else begin
      cdsLocal.FieldByName('CPAG_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.edtVlr_DocExit(Sender: TObject);
begin
  inherited;
  try
    cdsLocal.FieldByName('CPAG_VALOR_PAGO').AsFloat := cdsLocal.FieldByName('CPAG_VALOR_DOC').AsFloat;
  except
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.FormShow(Sender: TObject);
begin
  inherited;
  case rdBanco.Checked of
    true : panelBanco(true);
    false : begin
      edtCod_Banco.Clear;
      edtCod_Banco.Modified := true;
      edtCod_BancoExit(Sender);
      panelBanco(false);
    end;
  end;
  Timer1.Enabled := true;
  OpenClientDataSet(4);
  if cdsLocal.State = dsInsert then
    cdsLocal.FieldByName('CPAG_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
  OcultaLabel(true);
  if (cdsLocal.FieldByName('CPAG_CCRE_ID').AsString = '') or (not funcLocal.VinculaCartaoCredito) then begin
    OcultaLabel(false);
  end;
  if edtVlr_Doc.CanFocus then
    edtVlr_Doc.SetFocus
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.OcultaLabel(boolValue : Boolean);
var
  intI   : Integer;
  objTMP : TObject;
begin
  for intI := 1 to 23 do begin
    objTMP := TObject(FindComponent('lb'+IntToStr(intI)));
    if (objTMP is TLabel) then
      TLabel(objTMP).Visible := boolValue;
    if (objTMP is TDBText) then
      TDBText(objTMP).Visible := boolValue;
    if (objTMP is TDBImage) then
      TDBImage(objTMP).Visible := boolValue;
  end;
  edtCod_Banco.Enabled   := not boolValue;
  btnPesq_Banco.Enabled  := not boolValue;
  btnInsertBanco.Enabled := not boolValue;
  rdBanco.Enabled        := not boolValue;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.LancaDadosCartao(strTMP : String);

function RetornaImagem(strCCRE_ID : String) : TStream;
var
  qryCons : TSQLQuery;
begin
  Result := nil;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT CCRE_IMAGE FROM CARTAO_CREDITO WHERE CCRE_ID = ' + strCCRE_ID);
      Open;
      cdsLocal.FieldByName('CCRE_IMAGE').Value := qryCons.FieldByName('CCRE_IMAGE').Value;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

var
  strSaque,
  strCompras : String;
begin
  try
    OcultaLabel(false);
    if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString                := '';
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsString           := '';
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := '';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := '';
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := '';
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := '';
      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsString           := '';
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsString         := '';
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := '';
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := '';
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := '';
      cdsLocal.FieldByName('CPAG_DTA_VCTO').AsString               := '';
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString                := '';
      cdsLocal.FieldByName('CPAG_CBCO_EMPR_ID').AsString           := '';
    end;
    if Trim(strTMP) <> '' then begin
      cdsLocal.FieldByName('CPAG_CCRE_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CPAG_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := 'Sim';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := funcLocal.Buscar_Coluna(strTMP,9);
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := funcLocal.Buscar_Coluna(strTMP,11);
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := funcLocal.Buscar_Coluna(strTMP,12);

      strSaque   := StringReplace(funcLocal.Buscar_Coluna(strTMP,4),'.','',[rfReplaceAll]);
      strCompras := StringReplace(funcLocal.Buscar_Coluna(strTMP,5),'.','',[rfReplaceAll]);

      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsFloat            := StrToFloat(strSaque);
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsFloat          := StrToFloat(strCompras);
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := funcLocal.Buscar_Coluna(strTMP,6);
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := funcLocal.Buscar_Coluna(strTMP,7);
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('CPAG_DTA_VCTO').AsString               := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('CPAG_CBCO_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CPAG_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
      edtCod_Banco.Text                                            := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Banco.Modified                                        := true;
      edtCod_BancoExit(Self);
      RetornaImagem(funcLocal.Buscar_Coluna(strTMP,1));
      lb20.Caption                                                 := funcLocal.Buscar_Coluna(strTMP,10);
      OcultaLabel(true);
    end else begin
      if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
        cdsLocal.FieldByName('CPAG_GENE_ID_TIPO_DOC').AsString       := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString                    := '';
        edtCod_Doc.SetFocus;
      end;
      cdsLocal.FieldByName('CPAG_VIA_BANCO').AsInteger             := 0;
      rdBancoClick(Self);
    end;
  finally
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.PanelBanco(boolTMP : Boolean);
begin
  edtCod_Banco.Enabled := boolTMP;
  btnPesq_Banco.Enabled := boolTMP;
  DBEdit3.Enabled := boolTMP;
  DBEdit4.Enabled := boolTMP;
  DBEdit8.Enabled := boolTMP;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.Label14Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(167);
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.Label22Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(205);
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.Label8Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(144);
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmLanc_Auto_Contas_Pagar do begin
    case intPos of
      1 : begin
        with cdsPesq_Fornecedor do begin
          Close;
          Open;
        end;
      end;
      2 : begin
        with cdsPesq_Plano_Contas do begin
          Close;
          Open;
        end;
      end;
      3 : begin
        with cdsPesq_Conta do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      4 : begin
        with cdsPesq_Tipo_Doc do begin
          Close;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
      end;
    end;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.rdBancoClick(Sender: TObject);
begin
  inherited;
  try
    case rdBanco.Checked of
      true : panelBanco(true);
      false : begin
        edtCod_Banco.Clear;
        edtCod_Banco.Modified := true;
        edtCod_BancoExit(Sender);
        panelBanco(false);
      end;
    end;
  except
  end;
end;

function TfCad_Lanc_Auto_Contas_Pagar.TemLimitenoPlano(strCod_ID : String; floatValor : Real;
  out BoolConciliado : Boolean; out fltValor : Real; out fltSoma : Real) : Boolean;
var
  qryCons       : TSQLQuery;
  Dia, Mes, Ano : Word;
begin
  try
    Result  := true;
    DecodeDate(funcLocal.DataServidor(funcLocal.Conexao),Ano,Mes,Dia);
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      SUM(CPAG_VALOR_DOC)');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_EMPR_ID                      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CPAG_STATUS                      <> ' + QuotedStr('C'));
        sql.Add('AND   CPAG_PLCT_ID                      = ' + strCod_ID);
        sql.Add('AND   CPAG_PLCT_EMPR_ID                 = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   EXTRACT(MONTH FROM CPAG_DTA_VCTO) = ' + IntToStr(Mes));
        sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO)  = ' + IntToStr(Ano));
//        ShowMessage(qryCons.Text);
        Open;
        floatValor := floatValor + qryCons.Fields[0].AsFloat;
        fltSoma    := floatValor;
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PCPJ_ANO,');
        sql.Add('      PCPJ_MES_01,');
        sql.Add('      PCPJ_MES_02,');
        sql.Add('      PCPJ_MES_03,');
        sql.Add('      PCPJ_MES_04,');
        sql.Add('      PCPJ_MES_05,');
        sql.Add('      PCPJ_MES_06,');
        sql.Add('      PCPJ_MES_07,');
        sql.Add('      PCPJ_MES_08,');
        sql.Add('      PCPJ_MES_09,');
        sql.Add('      PCPJ_MES_10,');
        sql.Add('      PCPJ_MES_11,');
        sql.Add('      PCPJ_MES_12,');
        sql.Add('      PCPJ_CONCILIADO');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID       = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   PCPJ_ANO           = ' + IntToStr(Ano));
        sql.Add('AND   PCPJ_PLCT_ID       = ' + strCod_ID);
        sql.Add('AND   PCPJ_PLCT_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
//        ShowMessage(qryCons.Text);
        Open;
        if not IsEmpty then begin
          boolConciliado := (qryCons.Fields[13].AsInteger = 1);
          fltValor       := qryCons.Fields[Mes].AsFloat;
          Result         := (qryCons.Fields[Mes].AsFloat >= floatValor);
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'TemLimitenoPlano',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro ao verificar limite de crédito para o plano informado.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Pagar.Timer1Timer(Sender: TObject);
begin
  inherited;
  if edtVlr_Doc.CanFocus then
    edtVlr_Doc.SetFocus;
  Timer1.Enabled := false;
end;

initialization
  if fCad_Lanc_Auto_Contas_Pagar = nil then
    fCad_Lanc_Auto_Contas_Pagar := TfCad_Lanc_Auto_Contas_Pagar.Create(nil);
finalization
  FreeAndNil(fCad_Lanc_Auto_Contas_Pagar);

end.
