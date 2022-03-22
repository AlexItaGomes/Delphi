unit ufCad_Plano_Contas_Planejamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit, SQLExpr,
  RXDBCtrl, Mask, DBCtrls, rxCurrEdit, DB;

type
  TfCad_Plano_Contas_Planejamento = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    cmbAno: TDBComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnPesq: TSpeedButton;
    edtCodPlano: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet1: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    lbAtual09: TLabel;
    Label38: TLabel;
    lbProx09: TLabel;
    Label23: TLabel;
    lbAnt09: TLabel;
    Label27: TLabel;
    lbAtual01: TLabel;
    Label29: TLabel;
    lbProx01: TLabel;
    Label33: TLabel;
    lbAnt01: TLabel;
    Label37: TLabel;
    lbAtual02: TLabel;
    Label39: TLabel;
    lbProx02: TLabel;
    Label43: TLabel;
    lbAnt02: TLabel;
    Label46: TLabel;
    lbAtual03: TLabel;
    Label47: TLabel;
    lbProx03: TLabel;
    Label49: TLabel;
    lbAnt03: TLabel;
    Label51: TLabel;
    lbAtual04: TLabel;
    Label52: TLabel;
    lbProx04: TLabel;
    Label54: TLabel;
    lbAnt04: TLabel;
    Label56: TLabel;
    lbAtual05: TLabel;
    Label57: TLabel;
    lbProx05: TLabel;
    Label59: TLabel;
    lbAnt05: TLabel;
    Label61: TLabel;
    lbAtual06: TLabel;
    Label62: TLabel;
    lbProx06: TLabel;
    Label64: TLabel;
    lbAnt06: TLabel;
    Label66: TLabel;
    lbAtual07: TLabel;
    Label67: TLabel;
    lbProx07: TLabel;
    Label69: TLabel;
    lbAnt07: TLabel;
    Label71: TLabel;
    lbAtual08: TLabel;
    Label72: TLabel;
    lbProx08: TLabel;
    Label74: TLabel;
    lbAnt08: TLabel;
    Label76: TLabel;
    lbAtual10: TLabel;
    Label77: TLabel;
    lbProx10: TLabel;
    Label79: TLabel;
    lbAnt10: TLabel;
    Label81: TLabel;
    lbAtual11: TLabel;
    Label82: TLabel;
    lbProx11: TLabel;
    Label84: TLabel;
    lbAnt11: TLabel;
    Label86: TLabel;
    lbAtual12: TLabel;
    Label87: TLabel;
    lbProx12: TLabel;
    Label89: TLabel;
    lbAnt12: TLabel;
    Label91: TLabel;
    GroupBox14: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox15: TGroupBox;
    edtVlrJan: TRxDBCalcEdit;
    GroupBox16: TGroupBox;
    edtVlrFev: TRxDBCalcEdit;
    GroupBox17: TGroupBox;
    edtVlrMar: TRxDBCalcEdit;
    GroupBox18: TGroupBox;
    edtVlrAbr: TRxDBCalcEdit;
    GroupBox22: TGroupBox;
    edtVlrMai: TRxDBCalcEdit;
    GroupBox21: TGroupBox;
    edtVlrJun: TRxDBCalcEdit;
    GroupBox20: TGroupBox;
    edtVlrJul: TRxDBCalcEdit;
    GroupBox19: TGroupBox;
    edtVlrAgo: TRxDBCalcEdit;
    GroupBox23: TGroupBox;
    edtVlrSet: TRxDBCalcEdit;
    GroupBox24: TGroupBox;
    edtVlrOut: TRxDBCalcEdit;
    GroupBox25: TGroupBox;
    edtVlrNov: TRxDBCalcEdit;
    GroupBox26: TGroupBox;
    edtVlrDez: TRxDBCalcEdit;
    SpeedButton1: TSpeedButton;
    btnAplic1: TSpeedButton;
    btnAplic2: TSpeedButton;
    btnAplic3: TSpeedButton;
    btnAplic4: TSpeedButton;
    btnAplic8: TSpeedButton;
    btnAplic7: TSpeedButton;
    btnAplic6: TSpeedButton;
    btnAplic5: TSpeedButton;
    btnAplic9: TSpeedButton;
    btnAplic10: TSpeedButton;
    btnAplic11: TSpeedButton;
    btnAplic12: TSpeedButton;
    procedure edtCodPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodPlanoExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtVlrJanExit(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnAplic1Click(Sender: TObject);
    procedure btnAplic2Click(Sender: TObject);
    procedure btnAplic3Click(Sender: TObject);
    procedure btnAplic4Click(Sender: TObject);
    procedure btnAplic5Click(Sender: TObject);
    procedure btnAplic6Click(Sender: TObject);
    procedure btnAplic7Click(Sender: TObject);
    procedure btnAplic8Click(Sender: TObject);
    procedure btnAplic9Click(Sender: TObject);
    procedure btnAplic10Click(Sender: TObject);
    procedure btnAplic11Click(Sender: TObject);
    procedure btnAplic12Click(Sender: TObject);
  private
    function  ValidaDados: Boolean;
    procedure CarregaCombo;
    procedure ValorComprometido(strPLCT_ID, strAno: String);
    procedure ClearLabel;
    procedure OpenClientDataSet;
    procedure DesabilitaMesesAnteriores;
  public
    strAno : String;
  end;

var
  fCad_Plano_Contas_Planejamento: TfCad_Plano_Contas_Planejamento;

implementation

uses udmPlano_Contas_Planejamento;

{$R *.dfm}

procedure TfCad_Plano_Contas_Planejamento.btnAplic2Click(Sender: TObject);
begin
  inherited;
  edtVlrFev.Value := StrToFloatDef( lbAtual02.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic3Click(Sender: TObject);
begin
  inherited;
  edtVlrMar.Value := StrToFloatDef( lbAtual03.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic4Click(Sender: TObject);
begin
  inherited;
  edtVlrAbr.Value := StrToFloatDef( lbAtual04.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic5Click(Sender: TObject);
begin
  inherited;
  edtVlrMai.Value := StrToFloatDef( lbAtual05.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic6Click(Sender: TObject);
begin
  inherited;
  edtVlrJun.Value := StrToFloatDef( lbAtual06.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic7Click(Sender: TObject);
begin
  inherited;
  edtVlrJul.Value := StrToFloatDef( lbAtual07.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic8Click(Sender: TObject);
begin
  inherited;
  edtVlrAgo.Value := StrToFloatDef( lbAtual08.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic9Click(Sender: TObject);
begin
  inherited;
  edtVlrSet.Value := StrToFloatDef( lbAtual09.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnOkClick(Sender: TObject);
var
  Ano : String;
begin
  if funcLocal.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    if cdsLocal.State = dsInsert then
      Ano := cmbAno.Text;
    if cdsLocal.FieldByName('PCPJ_CONCILIADO').AsInteger = 0 then
      if funcLocal.Alerta('Plano de contas ainda não conciliado, deseja realizar o fechamento e conciliamento deste plano?',1,true) = 6 then
        cdsLocal.FieldByName('PCPJ_CONCILIADO').AsInteger := 1;
    inherited;
    try
      edtCodPlano.SetFocus;
    except
    end;
    if (Ano <> '') and (cdsLocal.State = dsInsert) then 
      cdsLocal.FieldByName('PCPJ_ANO').AsString := Ano;
    ClearLabel;
  end else IsValidData;
end;

function TfCad_Plano_Contas_Planejamento.ValidaDados : Boolean;

{$REGION 'JaExiste'}
  function JaExiste(intAno : Integer) : Boolean;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := true;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
          sql.Add('WHERE PCPJ_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   PCPJ_PLCT_ID = ' + cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString);
          sql.Add('AND   PCPJ_ANO     = ' + IntToStr(intAno));
          sql.Add('AND   PCPJ_ID     <> ' + cdsLocal.FieldByName('PCPJ_ID').AsString);
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger > 0)
      except on e: exception do begin
        funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
        funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'JaExistePrevisao'}
  function JaExistePrevisao(intAno : Integer) : Boolean;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := true;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COUNT(*)');
          sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
          sql.Add('WHERE PCPJ_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   PCPJ_PLCT_ID = 155');
          sql.Add('AND   PCPJ_ANO     = ' + IntToStr(intAno));
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger > 0)
      except on e: exception do begin
        funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
        funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
  Dia,Mes,Ano : Word;
begin
  Result := true;
  DecodeDate(funcLocal.DataServidor(funcLocal.Conexao),Ano,Mes,Dia);
  if cmbAno.Text = '' then begin
    funcLocal.Alerta('Informe o ano antes de continuar.',1);
    try
      cmbAno.SetFocus;
    except
    end;
    Result := false;
    Exit;
  end;
  if StrToInt(cmbAno.Text) < Ano then begin
    funcLocal.Alerta('O ano não pode ser inferior ao ano atual.',1);
    try
      cmbAno.SetFocus;
    except
    end;
    Result := false;
    Exit;
  end;
  if edtCodPlano.Text = '' then begin
    funcLocal.Alerta('Informe o plano de contas antes de continuar.',1);
    try
      edtCodPlano.SetFocus;
    except
    end;
    Result := false;
    Exit;
  end;
  if (edtVlrJan.Value < 0) or (edtVlrFev.Value < 0) or (edtVlrMar.Value < 0) or
     (edtVlrAbr.Value < 0) or (edtVlrMai.Value < 0) or (edtVlrJun.Value < 0) or
     (edtVlrJul.Value < 0) or (edtVlrAgo.Value < 0) or (edtVlrSet.Value < 0) or
     (edtVlrOut.Value < 0) or (edtVlrNov.Value < 0) or (edtVlrDez.Value < 0) then begin
    funcLocal.Alerta('O valor de lançamento não pode ser negativo.',1);
    try
      edtVlrJan.SetFocus;
    except
    end;
    Result := false;
    Exit;
  end;
  if edtCodPlano.Text <> '155' then begin
    if not JaExistePrevisao(StrToInt(cmbAno.Text)) then begin
      funcLocal.Alerta('Você ainda não realizou a previsão de receita para o ano de ('+cmbAno.Text+'),'+#13+
                       'faça a previsão de receita antes de continuar.',1);
      try
        edtCodPlano.SetFocus;
      except
      end;
      Result := false;
      Exit;
    end;
  end;
  if JaExiste(StrToInt(cmbAno.Text)) then begin
    funcLocal.Alerta('Já consta um planejamento para o plano de contas informado.',1);
    try
      edtCodPlano.SetFocus;
    except
    end;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet;
  strTMP := funcLocal.Busca_Registro(dmPlano_Contas_Planejamento.cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    edtCodPlano.Modified := true;
  end else begin
    cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString          := '';
    cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
    cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
  end;
  try
    edtCodPlano.SetFocus;
  except
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.edtCodPlanoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodPlano.Modified  then Exit;
  if edtCodPlano.Text <> '' then begin
    OpenClientDataSet;
    strTMP := funcLocal.Busca_Registro(dmPlano_Contas_Planejamento.cdsPesq_Plano_Contas,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCodPlano.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString          := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      ValorComprometido(cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString,cmbAno.Text);
      try
        edtVlrJan.SetFocus;
      except
      end;
    end else begin
      cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString          := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
    end;
  end else begin
    cdsLocal.FieldByName('PCPJ_PLCT_ID').AsString          := '';
    cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString := '';
    cdsLocal.FieldByName('PLCT_DESCRICAO').AsString        := '';
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.edtCodPlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCodPlano.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesq.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.edtVlrJanExit(Sender: TObject);
begin
  inherited;
  if (edtVlrJan.Value > 0) and (cdsLocal.State = dsInsert) and
     (edtVlrFev.Value = 0) and (edtVlrMar.Value = 0)       and
     (edtVlrAbr.Value = 0) and (edtVlrMai.Value = 0)       and
     (edtVlrJun.Value = 0) and (edtVlrJul.Value = 0)       and
     (edtVlrAgo.Value = 0) and (edtVlrSet.Value = 0)       and
     (edtVlrOut.Value = 0) and (edtVlrNov.Value = 0)       and
     (edtVlrDez.Value = 0) then begin
    edtVlrFev.Value := edtVlrJan.Value;
    edtVlrMar.Value := edtVlrJan.Value;
    edtVlrAbr.Value := edtVlrJan.Value;
    edtVlrMai.Value := edtVlrJan.Value;
    edtVlrJun.Value := edtVlrJan.Value;
    edtVlrJul.Value := edtVlrJan.Value;
    edtVlrAgo.Value := edtVlrJan.Value;
    edtVlrSet.Value := edtVlrJan.Value;
    edtVlrOut.Value := edtVlrJan.Value;
    edtVlrNov.Value := edtVlrJan.Value;
    edtVlrDez.Value := edtVlrJan.Value;
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  try
    cmbAno.SetFocus;
    cmbAno.ItemIndex := cmbAno.Items.IndexOf(strAno);
    if (cdsLocal.State in [dsInsert]) then
      cdsLocal.FieldByName('PCPJ_ANO').AsString := strAno;
  except
  end;
  if cdsLocal.FieldByName('PCPJ_CONCILIADO').AsInteger = 1 then begin
    pageCadastro.Pages[0].Enabled    := false
  end else begin
    pageCadastro.Pages[0].Enabled := true;
  end;
  if edtCodPlano.Text <> '' then begin
    ValorComprometido(edtCodPlano.Text,cmbAno.Text);
  end else begin
    ClearLabel;
  end;
  DesabilitaMesesAnteriores();
end;

procedure TfCad_Plano_Contas_Planejamento.DesabilitaMesesAnteriores();
var
  Dia, Mes, Ano : Word;
begin
  edtVlrJan.Enabled := false;
  edtVlrFev.Enabled := false;
  edtVlrMar.Enabled := false;
  edtVlrAbr.Enabled := false;
  edtVlrMai.Enabled := false;
  edtVlrJun.Enabled := false;
  edtVlrJul.Enabled := false;
  edtVlrAgo.Enabled := false;
  edtVlrSet.Enabled := false;
  edtVlrOut.Enabled := false;
  edtVlrNov.Enabled := false;
  edtVlrDez.Enabled := false;
  DecodeDate(funcLocal.DataServidor(),Ano,Mes,Dia);
  try
    if StrToInt(cmbAno.Text) = Ano then begin
      edtVlrJan.Enabled := (Mes <= 01);
      edtVlrFev.Enabled := (Mes <= 02);
      edtVlrMar.Enabled := (Mes <= 03);
      edtVlrAbr.Enabled := (Mes <= 04);
      edtVlrMai.Enabled := (Mes <= 05);
      edtVlrJun.Enabled := (Mes <= 06);
      edtVlrJul.Enabled := (Mes <= 07);
      edtVlrAgo.Enabled := (Mes <= 08);
      edtVlrSet.Enabled := (Mes <= 09);
      edtVlrOut.Enabled := (Mes <= 10);
      edtVlrNov.Enabled := (Mes <= 11);
      edtVlrDez.Enabled := (Mes <= 12);
    end else if StrToInt(cmbAno.Text) > Ano then begin
      edtVlrJan.Enabled := true;
      edtVlrFev.Enabled := true;
      edtVlrMar.Enabled := true;
      edtVlrAbr.Enabled := true;
      edtVlrMai.Enabled := true;
      edtVlrJun.Enabled := true;
      edtVlrJul.Enabled := true;
      edtVlrAgo.Enabled := true;
      edtVlrSet.Enabled := true;
      edtVlrOut.Enabled := true;
      edtVlrNov.Enabled := true;
      edtVlrDez.Enabled := true;
    end;
  except
  end;
  btnAplic1.Enabled  := edtVlrJan.Enabled;
  btnAplic2.Enabled  := edtVlrFev.Enabled;
  btnAplic3.Enabled  := edtVlrMar.Enabled;
  btnAplic4.Enabled  := edtVlrAbr.Enabled;
  btnAplic5.Enabled  := edtVlrMai.Enabled;
  btnAplic6.Enabled  := edtVlrJun.Enabled;
  btnAplic7.Enabled  := edtVlrJul.Enabled;
  btnAplic8.Enabled  := edtVlrAgo.Enabled;
  btnAplic9.Enabled  := edtVlrSet.Enabled;
  btnAplic10.Enabled := edtVlrOut.Enabled;
  btnAplic11.Enabled := edtVlrNov.Enabled;
  btnAplic12.Enabled := edtVlrDez.Enabled;
end;

procedure TfCad_Plano_Contas_Planejamento.ClearLabel;
begin
  lbAnt01.Caption   := FormatFloat('0.00',0);
  lbAnt02.Caption   := FormatFloat('0.00',0);
  lbAnt03.Caption   := FormatFloat('0.00',0);
  lbAnt04.Caption   := FormatFloat('0.00',0);
  lbAnt05.Caption   := FormatFloat('0.00',0);
  lbAnt06.Caption   := FormatFloat('0.00',0);
  lbAnt07.Caption   := FormatFloat('0.00',0);
  lbAnt08.Caption   := FormatFloat('0.00',0);
  lbAnt09.Caption   := FormatFloat('0.00',0);
  lbAnt10.Caption   := FormatFloat('0.00',0);
  lbAnt11.Caption   := FormatFloat('0.00',0);
  lbAnt12.Caption   := FormatFloat('0.00',0);
  lbAtual01.Caption := FormatFloat('0.00',0);
  lbAtual02.Caption := FormatFloat('0.00',0);
  lbAtual03.Caption := FormatFloat('0.00',0);
  lbAtual04.Caption := FormatFloat('0.00',0);
  lbAtual05.Caption := FormatFloat('0.00',0);
  lbAtual06.Caption := FormatFloat('0.00',0);
  lbAtual07.Caption := FormatFloat('0.00',0);
  lbAtual08.Caption := FormatFloat('0.00',0);
  lbAtual09.Caption := FormatFloat('0.00',0);
  lbAtual10.Caption := FormatFloat('0.00',0);
  lbAtual11.Caption := FormatFloat('0.00',0);
  lbAtual12.Caption := FormatFloat('0.00',0);
  lbProx01.Caption  := FormatFloat('0.00',0);
  lbProx02.Caption  := FormatFloat('0.00',0);
  lbProx03.Caption  := FormatFloat('0.00',0);
  lbProx04.Caption  := FormatFloat('0.00',0);
  lbProx05.Caption  := FormatFloat('0.00',0);
  lbProx06.Caption  := FormatFloat('0.00',0);
  lbProx07.Caption  := FormatFloat('0.00',0);
  lbProx08.Caption  := FormatFloat('0.00',0);
  lbProx09.Caption  := FormatFloat('0.00',0);
  lbProx10.Caption  := FormatFloat('0.00',0);
  lbProx11.Caption  := FormatFloat('0.00',0);
  lbProx12.Caption  := FormatFloat('0.00',0);
end;

procedure TfCad_Plano_Contas_Planejamento.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  inherited;
  DecodeDate(funcLocal.DataServidor(funcLocal.Conexao),Ano,Mes,Dia);
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 0;
  for intI := 1 to 10 do begin
    cmbAno.Items.Add(IntToStr(Ano + intI));
  end;
  try
    cmbAno.SetFocus;
  except
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.ValorComprometido(strPLCT_ID, strAno : String);
var
  qryCons    : TSQLQuery;
  fltAnterior,
  fltValores,
  fltProximo : Array[1..12] of Real;
  intI       : Integer;
begin
  try
    funcLocal.MSGAguarde();
    for intI := 1 to 12 do begin
      fltAnterior[intI] := 0;
      fltValores[intI]  := 0;
      fltProximo[intI]  := 0;
    end;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      if strPLCT_ID <> '' then begin      
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR,');
          sql.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO) AS MES');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + IntToStr(StrToInt(strAno)-1));
          sql.Add('AND   CPAG_PLCT_ID                     = ' + strPLCT_ID);
          sql.Add('AND   COALESCE(CPAG_PREVISAO,0)        = 0');
          sql.Add('GROUP BY 2');
          Open;
          if not IsEmpty then begin
            First;
            for intI := 1 to 12 do begin
              try
                if intI = qryCons.Fields[1].AsInteger then begin
                  fltAnterior[intI] := (qryCons.Fields[0].AsFloat);
                  Next;
                end;
              except
                fltAnterior[intI] := 0;
                Next;
              end;
            end;
          end;
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR,');
          sql.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO) AS MES');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + strAno);
          sql.Add('AND   CPAG_PLCT_ID                     = ' + strPLCT_ID);
          sql.Add('AND   COALESCE(CPAG_PREVISAO,0)        = 0');
          sql.Add('GROUP BY 2');
          Open;
          if not IsEmpty then begin
            First;
            for intI := 1 to 12 do begin
              try
                if intI = qryCons.Fields[1].AsInteger then begin
                  fltValores[intI] := (qryCons.Fields[0].AsFloat);
                  Next;
                end;
              except
                fltValores[intI] := 0;
                Next;
              end;
            end;
          end;
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0) VALOR,');
          sql.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO) AS MES');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcLocal.Empr_ID));
          sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + IntToStr(StrToInt(strAno)+1));
          sql.Add('AND   CPAG_PLCT_ID                     = ' + strPLCT_ID);
          sql.Add('AND   COALESCE(CPAG_PREVISAO,0)        = 0');
          sql.Add('GROUP BY 2');
          Open;
          if not IsEmpty then begin
            First;
            for intI := 1 to 12 do begin
              try
                if intI = qryCons.Fields[1].AsInteger then begin
                  fltProximo[intI] := (qryCons.Fields[0].AsFloat);
                  Next;
                end;
              except
                fltProximo[intI] := 0;
                Next;
              end;
            end;
          end;
        end;
      end;
      lbAnt01.Caption   := FormatFloat('0.00',fltAnterior[1]);
      lbAnt02.Caption   := FormatFloat('0.00',fltAnterior[2]);
      lbAnt03.Caption   := FormatFloat('0.00',fltAnterior[3]);
      lbAnt04.Caption   := FormatFloat('0.00',fltAnterior[4]);
      lbAnt05.Caption   := FormatFloat('0.00',fltAnterior[5]);
      lbAnt06.Caption   := FormatFloat('0.00',fltAnterior[6]);
      lbAnt07.Caption   := FormatFloat('0.00',fltAnterior[7]);
      lbAnt08.Caption   := FormatFloat('0.00',fltAnterior[8]);
      lbAnt09.Caption   := FormatFloat('0.00',fltAnterior[9]);
      lbAnt10.Caption   := FormatFloat('0.00',fltAnterior[10]);
      lbAnt11.Caption   := FormatFloat('0.00',fltAnterior[11]);
      lbAnt12.Caption   := FormatFloat('0.00',fltAnterior[12]);
      lbAtual01.Caption := FormatFloat('0.00',fltValores[1]);
      lbAtual02.Caption := FormatFloat('0.00',fltValores[2]);
      lbAtual03.Caption := FormatFloat('0.00',fltValores[3]);
      lbAtual04.Caption := FormatFloat('0.00',fltValores[4]);
      lbAtual05.Caption := FormatFloat('0.00',fltValores[5]);
      lbAtual06.Caption := FormatFloat('0.00',fltValores[6]);
      lbAtual07.Caption := FormatFloat('0.00',fltValores[7]);
      lbAtual08.Caption := FormatFloat('0.00',fltValores[8]);
      lbAtual09.Caption := FormatFloat('0.00',fltValores[9]);
      lbAtual10.Caption := FormatFloat('0.00',fltValores[10]);
      lbAtual11.Caption := FormatFloat('0.00',fltValores[11]);
      lbAtual12.Caption := FormatFloat('0.00',fltValores[12]);
      lbProx01.Caption  := FormatFloat('0.00',fltProximo[1]);
      lbProx02.Caption  := FormatFloat('0.00',fltProximo[2]);
      lbProx03.Caption  := FormatFloat('0.00',fltProximo[3]);
      lbProx04.Caption  := FormatFloat('0.00',fltProximo[4]);
      lbProx05.Caption  := FormatFloat('0.00',fltProximo[5]);
      lbProx06.Caption  := FormatFloat('0.00',fltProximo[6]);
      lbProx07.Caption  := FormatFloat('0.00',fltProximo[7]);
      lbProx08.Caption  := FormatFloat('0.00',fltProximo[8]);
      lbProx09.Caption  := FormatFloat('0.00',fltProximo[9]);
      lbProx10.Caption  := FormatFloat('0.00',fltProximo[10]);
      lbProx11.Caption  := FormatFloat('0.00',fltProximo[11]);
      lbProx12.Caption  := FormatFloat('0.00',fltProximo[12]);
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'ValorComprometido',e.Message);
      funcLocal.Alerta('Erro no processo de verificação dos valores.',1)
    end; end;
  finally
    funcLocal.MSGAguarde(false);
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TfCad_Plano_Contas_Planejamento.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

procedure TfCad_Plano_Contas_Planejamento.Label4Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(167);
  with dmPlano_Contas_Planejamento.cdsPesq_Plano_Contas do begin
    Close;
    Open;
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.Label4MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCad_Plano_Contas_Planejamento.Label4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCad_Plano_Contas_Planejamento.OpenClientDataSet;
begin
  with dmPlano_Contas_Planejamento.cdsPesq_Plano_Contas do begin
    Close;
    Open;
  end;
end;

procedure TfCad_Plano_Contas_Planejamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label4Click(Sender);
  edtCodPlano.SetFocus;
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic10Click(Sender: TObject);
begin
  inherited;
  edtVlrOut.Value := StrToFloatDef( lbAtual10.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic11Click(Sender: TObject);
begin
  inherited;
  edtVlrNov.Value := StrToFloatDef( lbAtual11.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic12Click(Sender: TObject);
begin
  inherited;
  edtVlrDez.Value := StrToFloatDef( lbAtual12.Caption ,0);
end;

procedure TfCad_Plano_Contas_Planejamento.btnAplic1Click(Sender: TObject);
begin
  inherited;
  edtVlrJan.Value := StrToFloatDef( lbAtual01.Caption ,0);
end;

initialization
  if fCad_Plano_Contas_Planejamento = nil then
    fCad_Plano_Contas_Planejamento := TfCad_Plano_Contas_Planejamento.Create(nil);
finalization
  FreeAndNil(fCad_Plano_Contas_Planejamento);
end.
