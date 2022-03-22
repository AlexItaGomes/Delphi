unit ufCad_Movimentacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxCurrEdit, DB,
  RXDBCtrl, rxToolEdit, Mask, DBCtrls, SQLExpr, uFrPesqIndividual;

type
  TMovimenta = Class
    strCBMV_ID,
    strCod_Banco,
    strCod_Mov,
    strTipo_Mov,
    strDedutivel   : String;
    floatVlr_Mov   : Real;
  end;

type
  TfCad_Movimentacao_Bancaria = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    edtVlr_Mov: TRxDBCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCod_Banco: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    btnPesq_Banco: TSpeedButton;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    edtTipoMov: TDBEdit;
    Label10: TLabel;
    edtCod_Tipo: TDBEdit;
    btnPesq_Tipo: TSpeedButton;
    Label11: TLabel;
    edtDedutivel: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    edtNrDocumento: TDBEdit;
    rdTransferencia: TRadioGroup;
    pnlTransf: TPanel;
    frPesqBancoTransf: TfrPesqIndividual;
    frPesqTipoMovTransf: TfrPesqIndividual;
    procedure edtCod_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_TipoExit(Sender: TObject);
    procedure btnPesq_TipoClick(Sender: TObject);
    procedure edtCod_BancoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesq_BancoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtVlr_MovExit(Sender: TObject);
    procedure rdTransferenciaClick(Sender: TObject);
    procedure frPesqBancoTransfedtCodigoKeyPress(Sender: TObject;
      var Key: Char);
  private
    procedure OpenClientDataSet;
    function  ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Movimentacao_Bancaria: TfCad_Movimentacao_Bancaria;

implementation

uses udmMovimentacao_Bancaria;

{$R *.dfm}

procedure TfCad_Movimentacao_Bancaria.btnOkClick(Sender: TObject);

{$REGION 'RegistraMov'}
  procedure RegistraMov(Movimento : TMovimenta);
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
          sql.Add('UPDATE CONTAS_BANCARIAS');
          if Movimento.strTipo_Mov = 'D' then
            sql.Add('SET    CBCO_SALDO_ATUAL = CBCO_SALDO_ATUAL + (' + FormatFloat('0.00',Movimento.floatVlr_Mov * -1)+')')
          else sql.Add('SET    CBCO_SALDO_ATUAL = CBCO_SALDO_ATUAL + (' + FormatFloat('0.00',Movimento.floatVlr_Mov)+')');
          sql.Add('WHERE  CBCO_ID          = ' + Movimento.strCod_Banco);
          sql.Add('AND    CBCO_EMPR_ID     = ' + IntToStr(funcLocal.Empr_ID));
//          sql.Add('UPDATE CONTAS_BANCARIAS');
//          if Movimento.strTipo_Mov = 'D' then
//            sql.Add('SET    CBCO_SALDO_ATUAL = CBCO_SALDO_ATUAL - ' + FormatFloat('0.00',Movimento.floatVlr_Mov))
//          else sql.Add('SET CBCO_SALDO_ATUAL = CBCO_SALDO_ATUAL + ' + FormatFloat('0.00', Movimento.floatVlr_Mov));
//          sql.Add('WHERE  CBCO_ID          = ' + Movimento.strCod_Banco);
//          sql.Add('AND    CBCO_EMPR_ID     = ' + IntToStr(funcLocal.Empr_ID));
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
        funcLocal.ReportaErro(Caption,'RegistraMov',funcLocal.User_Login,e.Message);
        funcLocal.Alerta('Erro ao registrar a movimentação.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
      FormatSettings.DecimalSeparator := ',';
    end;
  end;
{$ENDREGION}

var
  boolInsert : Boolean;
  strTipo,
  strID      : String;
  Mov        : TMovimenta;
  floatValor : Real;
begin
  boolInsert := false;
  Mov        := nil;
  if ValidaDados then begin
    edtVlr_MovExit(Sender);
    if cdsLocal.State = dsInsert then begin
      boolInsert       := true;
      Mov              := TMovimenta.Create;
      strID            := cdsLocal.FieldByName('CBMV_ID').AsString;
      Mov.strCod_Banco := cdsLocal.FieldByName('CBMV_CBCO_ID').AsString;
      Mov.strCod_Mov   := cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString;
      Mov.strTipo_Mov  := cdsLocal.FieldByName('TIPO_MOV').AsString;
      Mov.floatVlr_Mov := cdsLocal.FieldByName('CBMV_VALOR_MOV').AsFloat;
      Mov.strDedutivel := cdsLocal.FieldByName('DEDUTIVEL').AsString;
      if cdsLocal.FieldByName('TIPO_MOV').AsString = 'C' then
        cdsLocal.FieldByName('CBMV_SALDO_DISP').AsFloat    := cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat + cdsLocal.FieldByName('CBMV_VALOR_MOV').AsFloat
      else cdsLocal.FieldByName('CBMV_SALDO_DISP').AsFloat := cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat - cdsLocal.FieldByName('CBMV_VALOR_MOV').AsFloat;
    end;
    inherited;
    if boolInsert then begin
      RegistraMov(Mov);
      if Mov.strDedutivel  = 'S' then begin
        if Mov.strTipo_Mov = 'D' then begin
          strTipo    := '2';
          floatValor := (Mov.floatVlr_Mov);
        end else begin
          strTipo    := '1';
          floatValor := (Mov.floatVlr_Mov * -1);
        end;
        funcLocal.LancamentoLivroCaixa('153',
                                       strTipo,
                                       strID,
                                       IntToStr(funcLocal.Empr_ID),
                                       '0',
                                       '0',
                                       '11',
                                       '6',
                                       floatValor);
      end;
      if rdTransferencia.ItemIndex = 0 then begin
        funcLocal.RegistraMovBancario(frPesqBancoTransf.InGrid,(Mov.floatVlr_Mov * funcLocal.Se(frPesqTipoMovTransf.edtOpcao1.Text = 'C',1,-1)));
        funcLocal.RegistraMovConta(frPesqBancoTransf.InGrid,frPesqTipoMovTransf.InGrid,'3',frPesqBancoTransf.InGrid,(Mov.floatVlr_Mov * funcLocal.Se(frPesqTipoMovTransf.edtOpcao1.Text = 'C',1,-1)));
      end;
    end;
    Self.Close;
  end else IsValidData;
end;

function TfCad_Movimentacao_Bancaria.ValidaDados : Boolean;
begin
  Result := true;
  if edtCod_Banco.Text = '' then begin
    funcLocal.Alerta('Informe o banco antes de continuar.',1);
    edtCod_Banco.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCod_Tipo.Text = '' then begin
    funcLocal.Alerta('Informe o tipo de movimentação antes de continuar.',1);
    edtCod_Tipo.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlr_Mov.Value <= 0 then begin
    funcLocal.Alerta('Informe o valor da movimentação antes de continuar.',1);
    edtVlr_Mov.SetFocus;
    Result := false;
    Exit;
  end;
  if cdsLocal.State = dsInsert then begin
    if (cdsLocal.FieldByName('TIPO_MOV').AsString = 'D') and (cdsLocal.FieldByName('DEDUTIVEL').AsString = 'S') then begin
      if not funcLocal.TemSaldoEmConta(cdsLocal.FieldByName('CBMV_CBCO_ID').AsString,cdsLocal.FieldByName('CBMV_VALOR_MOV').AsFloat) then begin
        funcLocal.Alerta('Usuário sem saldo em banco sufiente para esta movimentação.',1);
        edtCod_Banco.SetFocus;
        Result := false;
        Exit;
      end;
    end else if (cdsLocal.FieldByName('TIPO_MOV').AsString = 'C') and (cdsLocal.FieldByName('DEDUTIVEL').AsString = 'S') then begin
      if not funcLocal.TemSaldoLivroCaixa(cdsLocal.FieldByName('CBMV_VALOR_MOV').AsFloat) then begin
        funcLocal.Alerta('Usuário sem saldo em caixa suficiente para esta movimentação.',1);
        edtCod_Banco.SetFocus;
        Result := false;
        Exit;
      end;
    end;
    if rdTransferencia.ItemIndex = 0 then begin
      if not frPesqBancoTransf.TemRegistro then begin
        funcLocal.Alerta('Informe o banco de destino antes de continuar.',1);
        frPesqBancoTransf.SetFocus;
        Result := false;
        Exit;
      end;
      if not frPesqTipoMovTransf.TemRegistro then begin
        funcLocal.Alerta('Informe o tipo de movimento para o banco de destino antes de continuar.',1);
        frPesqTipoMovTransf.SetFocus;
        Result := false;
        Exit;
      end;
      if frPesqBancoTransf.edtCodigo.Text = edtCod_Banco.Text then begin
        funcLocal.Alerta('Você não pode fazer movimentações de transferencia para o mesmo banco.',1);
        frPesqBancoTransf.SetFocus;
        Result := false;
        Exit;
      end;
      if Trim(edtTipoMov.Text) = (frPesqTipoMovTransf.edtOpcao1.Text) then begin
        funcLocal.Alerta('Você não pode realizar uma movimentação entre contas com o mesmo tipo de Movimentação '+#13+#13+
                         edtTipoMov.Text + ' ('+funcLocal.Se(edtTipoMov.Text = 'C','Crédito','Débito')+')',0);
        Result := false;
        Exit;
      end;
      if (Trim(edtDedutivel.Text) = 'S') or (frPesqTipoMovTransf.edtOpcao.Text = 'S') then begin
        funcLocal.Alerta('Movimentação entre contas bancárias não podem ser do tipo dedutivel!',0);
        Result := false;
        Exit;
      end;
    end;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.btnPesq_BancoClick(Sender: TObject);
var
  strTMP : String;
begin
  strTMP := funcLocal.Busca_Registro(dmMovimentacao_Bancaria.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('CBMV_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
    cdsLocal.FieldByName('CBMV_SALDO_DISP').AsFloat   := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    edtCod_Banco.Modified := true;
  end else begin
    cdsLocal.FieldByName('CBMV_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
  end;
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Movimentacao_Bancaria.btnPesq_TipoClick(Sender: TObject);
var
  strTMP : String;
begin
  strTMP := funcLocal.Busca_Registro(dmMovimentacao_Bancaria.cdsPesqTipoMov,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1;GENE_PAR2','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('MOVIMENTACAO').AsString          := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('TIPO_MOV').AsString              := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('DEDUTIVEL').AsString             := funcLocal.Buscar_Coluna(strTMP,4);
    edtCod_Tipo.Modified := true;
  end else begin
    cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString := '';
    cdsLocal.FieldByName('MOVIMENTACAO').AsString          := '';
    cdsLocal.FieldByName('TIPO_MOV').AsString              := '';
    cdsLocal.FieldByName('DEDUTIVEL').AsString             := '';
  end;
  edtCod_Tipo.SetFocus;
end;

procedure TfCad_Movimentacao_Bancaria.edtCod_BancoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Banco.Modified then Exit;
  if edtCod_Banco.Text <> '' then begin
    strTMP := funcLocal.Busca_Registro(dmMovimentacao_Bancaria.cdsPesq_Conta,'BANCO','CBCO_ID;BANCO;COD_BANCO;SALDO_ATUAL;CBCO_LIMITE','CBCO_ID = ' + edtCod_Banco.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CBMV_CBCO_ID').AsString     := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('BANCO').AsString            := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('COD_BANCO').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
      cdsLocal.FieldByName('CBMV_SALDO_DISP').AsFloat   := StrToFloat(funcLocal.Buscar_Coluna(strTMP,4));
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := StrToFloat(funcLocal.Buscar_Coluna(strTMP,5));
    end else begin
      cdsLocal.FieldByName('CBMV_CBCO_ID').AsString     := '';
      cdsLocal.FieldByName('BANCO').AsString            := '';
      cdsLocal.FieldByName('COD_BANCO').AsString        := '';
      cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
      cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
    end;
  end else begin
    cdsLocal.FieldByName('CBMV_CBCO_ID').AsString     := '';
    cdsLocal.FieldByName('BANCO').AsString            := '';
    cdsLocal.FieldByName('COD_BANCO').AsString        := '';
    cdsLocal.FieldByName('CBCO_SALDO_ATUAL').AsFloat  := 0;
    cdsLocal.FieldByName('CBCO_LIMITE').AsFloat       := 0;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.edtCod_BancoKeyPress(Sender: TObject;
  var Key: Char);
var
  btnTMP : TSpeedButton;
begin
//  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(TDBEdit(Sender).Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnTMP := TSpeedButton(Self.FindComponent( funcLocal.Buscar_Coluna(TDBEdit(Sender).ImeName,1) ));
        btnTMP.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.edtCod_TipoExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Tipo.Modified then Exit;
  if edtCod_Tipo.Text <> '' then begin
    strTMP := funcLocal.Busca_Registro(dmMovimentacao_Bancaria.cdsPesqTipoMov,'GENE_DESCR','GENE_ID;GENE_DESCR;GENE_PAR1;GENE_PAR2','GENE_ID = ' + edtCod_Tipo.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('MOVIMENTACAO').AsString          := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('TIPO_MOV').AsString              := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('DEDUTIVEL').AsString             := funcLocal.Buscar_Coluna(strTMP,4);
    end else begin
      cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString := '';
      cdsLocal.FieldByName('MOVIMENTACAO').AsString          := '';
      cdsLocal.FieldByName('TIPO_MOV').AsString              := '';
      cdsLocal.FieldByName('DEDUTIVEL').AsString             := '';
    end;
  end else begin
    cdsLocal.FieldByName('CBMV_GENE_ID_TIPO_MOV').AsString := '';
    cdsLocal.FieldByName('MOVIMENTACAO').AsString          := '';
    cdsLocal.FieldByName('TIPO_MOV').AsString              := '';
    cdsLocal.FieldByName('DEDUTIVEL').AsString             := '';
  end;
end;

procedure TfCad_Movimentacao_Bancaria.edtVlr_MovExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfCad_Movimentacao_Bancaria.OpenClientDataSet;
begin
  with dmMovimentacao_Bancaria do begin
    with cdsPesq_Conta do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsPesqTipoMov do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.rdTransferenciaClick(Sender: TObject);
begin
  inherited;
  case rdTransferencia.ItemIndex of
    0 : begin
      pnlTransf.Enabled := true;
      pnlTransf.Visible := true;
    end;
    1 : begin
      pnlTransf.Enabled := false;
      pnlTransf.Visible := false;
    end;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label8Click(Sender);
  edtCod_Tipo.SetFocus;
end;

procedure TfCad_Movimentacao_Bancaria.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Label4Click(Sender);
  edtCod_Banco.SetFocus;
end;

procedure TfCad_Movimentacao_Bancaria.FormShow(Sender: TObject);
begin
  inherited;
  if cdsLocal.State = dsInsert then
    pageCadastro.Pages[0].Enabled    := true
  else pageCadastro.Pages[0].Enabled := false;
  OpenClientDataSet;
  frPesqBancoTransf.Limpar;
  frPesqTipoMovTransf.Limpar;
  rdTransferencia.ItemIndex := 1;
  rdTransferenciaClick(Sender);
  try
    edtNrDocumento.SetFocus;
  except
  end;
end;

procedure TfCad_Movimentacao_Bancaria.frPesqBancoTransfedtCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  frPesqBancoTransf.edtCodigoKeyPress(Sender, Key);

end;

procedure TfCad_Movimentacao_Bancaria.Label4Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(204);
  with dmMovimentacao_Bancaria.cdsPesq_Conta do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
    Open;
  end;
end;

procedure TfCad_Movimentacao_Bancaria.Label8Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(206);
  with dmMovimentacao_Bancaria.cdsPesqTipoMov do begin
    Close;
    Open;
  end;
end;

initialization
  if fCad_Movimentacao_Bancaria = nil then
    fCad_Movimentacao_Bancaria := TfCad_Movimentacao_Bancaria.Create(nil);
finalization
  FreeAndNil(fCad_Movimentacao_Bancaria);

end.
