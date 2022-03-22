unit ufCad_Lanc_Auto_Contas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls,
  rxCurrEdit, RXDBCtrl, rxToolEdit, Mask, SQLExpr;

type
  TfCad_Lanc_Auto_Contas_Receber = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnPesq_Clie: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    DBRadioGroup1: TDBRadioGroup;
    edtProveniente: TDBEdit;
    edtNr_Doc: TDBEdit;
    edtCod_Clie: TDBEdit;
    edtCliente: TDBEdit;
    edtDt_Emissao: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    edtDt_Vecto: TDBDateEdit;
    edtVlr_Doc: TRxDBCalcEdit;
    edtCod_Plano: TDBEdit;
    edtPlano: TDBEdit;
    edtCod_Simplif: TDBEdit;
    edtCod_Doc: TDBEdit;
    edtDocumento: TDBEdit;
    DBMemo1: TDBMemo;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    procedure edtCod_ClieKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_ClieExit(Sender: TObject);
    procedure btnPesq_ClieClick(Sender: TObject);
    procedure edtCod_PlanoExit(Sender: TObject);
    procedure btnPesq_PlanoClick(Sender: TObject);
    procedure edtCod_DocExit(Sender: TObject);
    procedure btnPesq_DocClick(Sender: TObject);
    procedure edtCod_BancoExit(Sender: TObject);
    procedure btnPesq_BancoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtVlr_DocExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdBancoClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
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
    procedure RegistraMovtoConta(strCREC_ID, strGene_ID: String;
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
  fCad_Lanc_Auto_Contas_Receber: TfCad_Lanc_Auto_Contas_Receber;

implementation

uses udmLanc_Auto_Contas_Receber, DB;

{$R *.dfm}

procedure TfCad_Lanc_Auto_Contas_Receber.btnOkClick(Sender: TObject);
var
  strCREC_ID,
  strGene_ID : String;
  floatValor : Real;
  boolBanco  : Boolean;
  strValor   : String;
begin
  strValor := funcLocal.TrataFloat(edtVlr_Pago.Text);
  if ValidaDados then begin
    if funcLocal.Alerta('Confirma a baixa automática do título informado?',1,true) = 6 then begin
      with cdsLocal do begin
        if not rdBanco.Checked then begin
          funcLocal.LancamentoLivroCaixa(FieldByName('CREC_PLCT_ID').AsString,
                                         '1',
                                         FieldByName('CREC_ID').AsString,
                                         FieldByName('CREC_EMPR_ID').AsString,
                                         '0',
                                         '0',
                                         '11',
                                         '2',
                                         (cdsLocal.FieldByName('CREC_VALOR_PAGO').AsFloat));
        end else begin
          funcLocal.RegistraMovBancario(edtCod_Banco.Text,StrToFloat( strValor ));
          funcLocal.RegistraMovConta(cdsLocal.FieldByName('CREC_CBCO_ID').AsString,'1002','2',FieldByName('CREC_ID').AsString,StrToFloat( strValor ));
          PanelBanco(false);
        end;
      end;
    end;
    strCREC_ID := cdsLocal.FieldByName('CREC_ID').AsString;
    strGene_ID := cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString;
    floatValor := cdsLocal.FieldByName('CREC_VALOR_PAGO').AsFloat;
    boolBanco  := (cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger = 1);
    funcLocal.BaixarContaReceberPrevisto(cdsLocal.FieldByName('CREC_DTA_VCTO').AsDateTime,
                                        (cdsLocal.FieldByName('CREC_VALOR_DOC').AsFloat*-1),
                                         cdsLocal.FieldByName('CREC_PLCT_ID').AsString,
                                         'CR');
    inherited;
    RegistraMovtoConta(strCREC_ID,strGene_Id,floatValor);
    cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger := funcLocal.Se(boolBanco,1,0);
    rdBancoClick(Sender);
    edtVlr_Doc.SetFocus;
    cdsLocal.FieldByName('CREC_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
  end else IsValidData;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.RegistraMovtoConta(strCREC_ID, strGene_ID : String; floatValor : Real);
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
        sql.Add('INSERT INTO CONTAS_RECEBER_ACERTOS');
        sql.Add('VALUES(' + funcLocal.ObterSequencia('CONTAS_RECEBER_ACERTOS',IntToStr(funcLocal.Empr_ID)) + ','
                          + IntToStr(funcLocal.Empr_ID)     + ','
                          + strCREC_ID                      + ','
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

procedure TfCad_Lanc_Auto_Contas_Receber.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label5Click(Sender);
  edtCod_Clie.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label14Click(Sender);
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.btnInsertBancoClick(Sender: TObject);
begin
  inherited;
  Label22Click(Sender);
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.Timer1Timer(Sender: TObject);
begin
  inherited;
  edtVlr_Doc.SetFocus;
  Timer1.Enabled := false;
end;

function TfCad_Lanc_Auto_Contas_Receber.ValidaDados : Boolean;
begin
  Result := true;
  if edtProveniente.Text = '' then begin
    funcLocal.Alerta('Informe a proveniência do documento antes de continuar.',1);
    edtProveniente.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Clie.Text = '' then begin
    funcLocal.Alerta('Informe o cliente antes de continuar.',1);
    edtCod_Clie.SetFocus;
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
    funcLocal.Alerta('A data de vencimento do título não pode ser inferior a data de emissão.',1);
    edtDt_Emissao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlr_Doc.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor do documento antes de continuar.',1);
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
  if rdBanco.Checked then begin
    if edtCod_Banco.Text = '' then begin
      funcLocal.Alerta('Informe a conta bancaria que será efetuado o recebimento antes de continuar.',1);
      try
        edtCod_Banco.SetFocus;
      except
      end;
      Result := false;
      Exit;
    end;
    if not funcLocal.ContaBancariaAtiva(cdsLocal.FieldByName('CREC_CBCO_ID').AsString) then begin
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
end;

function TfCad_Lanc_Auto_Contas_Receber.DocJaLancado : Boolean;
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
        sql.Add('FROM  CONTAS_RECEBER');
        sql.Add('WHERE CREC_ID     <> ' + cdsLocal.FieldByName('CREC_ID').AsString);
        sql.Add('AND   CREC_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CREC_NR_DOC  = ' + QuotedStr(cdsLocal.FieldByName('CREC_NR_DOC').AsString));
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


procedure TfCad_Lanc_Auto_Contas_Receber.btnPesq_BancoClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(3);
  strTMP := funcLocal.Busca_Registro(dmLanc_Auto_Contas_Receber.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    edtCod_Banco.Modified := true;
  end else begin
    cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.btnPesq_ClieClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Receber do begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Cliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString      := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Clie.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
    end;
  end;
  edtCod_Clie.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.btnPesq_DocClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Receber do begin
    OpenClientDataSet(4);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
      edtCod_Doc.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
    end;
  end;
  edtCod_Doc.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.btnPesq_PlanoClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmLanc_Auto_Contas_Receber do begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Plano.Modified := true;
    end else begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
  edtCod_Plano.SetFocus;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.edtCod_BancoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Banco.Modified then Exit;
  if edtCod_Banco.Text <> '' then begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(dmLanc_Auto_Contas_Receber.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','CBCO_ID = ' + edtCod_Banco.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    end else begin
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end else begin
    cdsLocal.FieldByName('CREC_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.edtCod_ClieExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Clie.Modified then Exit;
  with dmLanc_Auto_Contas_Receber do begin
    if edtCod_Clie.Text <> '' then begin
      OpenClientDataSet(1);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Cliente,'CLIE_FANTASIA','CLIE_ID;CLIE_FANTASIA','CLIE_ID = ' + edtCod_Clie.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_CLIE_ID').AsString      := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('CLIE_FANTASIA').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      end else begin
        cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
        cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_CLIE_ID').AsString       := '';
      cdsLocal.FieldByName('CLIE_FANTASIA').AsString  := '';
    end;
  end;
  edtCod_Clie.Repaint;
  edtCliente.Repaint;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.edtCod_ClieKeyPress(Sender: TObject;
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

procedure TfCad_Lanc_Auto_Contas_Receber.edtCod_DocExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Doc.Modified then Exit;
  with dmLanc_Auto_Contas_Receber do begin
    if edtCod_Doc.Text <> '' then begin
      OpenClientDataSet(4);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Tipo_Doc,'GENE_DESCR','GENE_ID;GENE_DESCR','GENE_ID = ' + edtCod_Doc.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP,2);
        if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
          cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger     := 1;
          rdBancoClick(Sender);
          if edtCod_Banco.CanFocus then
            edtCod_Banco.SetFocus;
        end;
        edtCod_Doc.Modified := false;
      end else begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
        cdsLocal.FieldByName('CREC_CCRE_ID').AsString          := '';
        cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString     := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString := '';
      cdsLocal.FieldByName('TIPO_DOC').AsString              := '';
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString          := '';
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString     := '';
    end;
    {try
      if funcLocal.VinculaCartaoCredito then begin
        strTMP := funcLocal.RetornaCartaoCredito(cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsInteger,edtVlr_Doc.Value,'C');
        LancaDadosCartao(strTMP);
      end;
    except
    end;}
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.edtCod_PlanoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Plano.Modified then Exit;
  with dmLanc_Auto_Contas_Receber do begin
    if edtCod_Plano.Text <> '' then begin
      OpenClientDataSet(2);
      strTMP := funcLocal.Busca_Registro(cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCod_Plano.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      end else begin
        cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
        cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
      end;
    end else begin
      cdsLocal.FieldByName('CREC_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.edtVlr_DocExit(Sender: TObject);
begin
  inherited;
  try
    cdsLocal.FieldByName('CREC_VALOR_PAGO').AsFloat := cdsLocal.FieldByName('CREC_VALOR_DOC').AsFloat;
  except
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.FormShow(Sender: TObject);
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
  if cdsLocal.State = dsInsert then
    cdsLocal.FieldByName('CREC_NR_DOC').AsString := FormatDateTime('ddmmyyyyhhmmss',Now);
  OcultaLabel(true);
  if (cdsLocal.FieldByName('CREC_CCRE_ID').AsString = '') or (not funcLocal.VinculaCartaoCredito) then begin
    OcultaLabel(false);
  end;
  if edtVlr_Doc.CanFocus then
    edtVlr_Doc.SetFocus
end;

procedure TfCad_Lanc_Auto_Contas_Receber.LancaDadosCartao(strTMP : String);

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
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString                := '';
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsString           := '';
      cdsLocal.FieldByName('CCRE_ATIVO').AsString                  := '';
      cdsLocal.FieldByName('CCRE_TIPO_CARTAO').AsString            := '';
      cdsLocal.FieldByName('CCRE_NUMERO_CARTAO').AsString          := '';
      cdsLocal.FieldByName('CCRE_TITULAR').AsString                := '';
      cdsLocal.FieldByName('CCRE_LIMITE_SAQUE').AsString           := '';
      cdsLocal.FieldByName('CCRE_LIMITE_COMPRAS').AsString         := '';
      cdsLocal.FieldByName('CCRE_DIA_VCTO_FATURA').AsString        := '';
      cdsLocal.FieldByName('CCRE_DIA_FECHAMENTO_FATURA').AsString  := '';
      cdsLocal.FieldByName('CCRE_VENCIMENTO').AsString             := '';
      cdsLocal.FieldByName('CREC_DTA_VCTO').AsString               := '';
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString                := '';
      cdsLocal.FieldByName('CREC_CBCO_EMPR_ID').AsString           := '';
    end;
    if Trim(strTMP) <> '' then begin
      cdsLocal.FieldByName('CREC_CCRE_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CREC_CCRE_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
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
      cdsLocal.FieldByName('CREC_DTA_VCTO').AsString               := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('CREC_CBCO_ID').AsString                := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CREC_CBCO_EMPR_ID').AsInteger          := funcLocal.Empr_ID;
      edtCod_Banco.Text                                            := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Banco.Modified                                        := true;
      edtCod_BancoExit(Self);
      RetornaImagem(funcLocal.Buscar_Coluna(strTMP,1));
      lb20.Caption                                                 := funcLocal.Buscar_Coluna(strTMP,10);
      OcultaLabel(true);
    end else begin
      if (StrToInt(edtCod_Doc.Text) in [4,5]) then begin
        cdsLocal.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString       := '';
        cdsLocal.FieldByName('TIPO_DOC').AsString                    := '';
        edtCod_Doc.SetFocus;
      end;
      cdsLocal.FieldByName('CREC_VIA_BANCO').AsInteger             := 0;
      rdBancoClick(Self);
    end;
  finally
  end;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.OcultaLabel(boolValue : Boolean);
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

procedure TfCad_Lanc_Auto_Contas_Receber.PanelBanco(boolTMP : Boolean);
begin
  edtCod_Banco.Enabled := boolTMP;
  btnPesq_Banco.Enabled := boolTMP;
  DBEdit3.Enabled := boolTMP;
  DBEdit4.Enabled := boolTMP;
  DBEdit8.Enabled := boolTMP;
end;

procedure TfCad_Lanc_Auto_Contas_Receber.Label14Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(167);
end;

procedure TfCad_Lanc_Auto_Contas_Receber.Label22Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(205);
end;

procedure TfCad_Lanc_Auto_Contas_Receber.Label5Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(152);
end;

procedure TfCad_Lanc_Auto_Contas_Receber.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmLanc_Auto_Contas_Receber do begin
    case intPos of
      1 : begin
        with cdsPesq_Cliente do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
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
          Open
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

procedure TfCad_Lanc_Auto_Contas_Receber.rdBancoClick(Sender: TObject);
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

initialization
  if fCad_Lanc_Auto_Contas_Receber = nil then
    fCad_Lanc_Auto_Contas_Receber := TfCad_Lanc_Auto_Contas_Receber.Create(nil);
finalization
  FreeAndNil(fCad_Lanc_Auto_Contas_Receber);

end.
