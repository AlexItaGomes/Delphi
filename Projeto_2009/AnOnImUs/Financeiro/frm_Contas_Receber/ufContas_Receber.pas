unit ufContas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, SQLExpr, Menus, uFrPesqIndividual, frxClass,
  frxDBSet, frxDesgn, DBCtrls;

type
  TfContas_Receber = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    GroupBox2: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    GroupBox3: TGroupBox;
    edtDt_Pagto_Inicio: TDateEdit;
    edtDt_Pagto_Fim: TDateEdit;
    rdStatus: TRadioGroup;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    frPesqPlanoContas: TfrPesqIndividual;
    frPesqCliente: TfrPesqIndividual;
    frPesqTipoDoc: TfrPesqIndividual;
    frPesqContaBancaria: TfrPesqIndividual;
    GroupBox1: TGroupBox;
    edtDtEfetivaInicio: TDateEdit;
    edtDtEfetivaFim: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure frPesqTipoDocedtCodigoExit(Sender: TObject);
    procedure frPesqTipoDocckOmitirClick(Sender: TObject);
    procedure frPesqContaBancariabtnPesquisarClick(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos : Integer = 99);
    function  GeraFilter: String;
    procedure CancelaTítulo(strMotivo: String);
    procedure Carregadados;
    function  ConfCancelamento: Boolean;
    procedure SetaValoresFrames;
    procedure LancaDadosCartao(strTMP: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContas_Receber: TfContas_Receber;

implementation

uses udmContas_Receber, ufCad_Contas_Receber, ufConfirmacao;

{$R *.dfm}

procedure TfContas_Receber.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
  end;
  rdStatus.ItemIndex := 3;
  frPesqCliente.SetFocus;
  cdsGeral.Filtered := false;
  frPesqTipoDoc.edtCodigo.Modified := true;
  frPesqTipoDocedtCodigoExit(Sender);
end;

procedure TfContas_Receber.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(1);
end;

function TfContas_Receber.GeraFilter : String;
var
  strFilter : String;
begin
  strFilter := dmContas_Receber.InstrucaoSQL;
  if frPesqCliente.TemRegistro then
    strFilter := strFilter + ' AND CREC_CLIE_ID ' + frPesqCliente.InGrid();
  if frPesqPlanoContas.TemRegistro then
    strFilter := strFilter + ' AND CREC_PLCT_ID ' + frPesqPlanoContas.InGrid();
  if frPesqTipoDoc.TemRegistro then
    strFilter := strFilter + ' AND CREC_GENE_ID_TIPO_DOC ' + frPesqTipoDoc.InGrid();
  if frPesqContaBancaria.TemRegistro then
    strFilter := strFilter + ' AND CREC_CBCO_ID ' + frPesqContaBancaria.InGrid();
  if edtDt_Emissao_Inicio.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Inicio.Date));
  if edtDt_Emissao_Fim.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Fim.Date));
  if edtDt_Vcto_Inicio.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Inicio.Date));
  if edtDt_Vcto_Fim.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Fim.Date));
  if edtDt_Pagto_Inicio.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_PGTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Inicio.Date));
  if edtDt_Pagto_Fim.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_PGTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Fim.Date));
  if edtDtEfetivaInicio.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_EFETIVO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaInicio.Date));
  if edtDtEfetivaFim.Date > 0 then
    strFilter := strFilter + ' AND CREC_DTA_EFETIVO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaFim.Date));

  case rdStatus.ItemIndex of
    0 : strFilter := strFilter + ' AND CREC_STATUS   = ' + QuotedStr('A');
    1 : strFilter := strFilter + ' AND CREC_STATUS   = ' + QuotedStr('F');
    2 : strFilter := strFilter + ' AND CREC_STATUS   = ' + QuotedStr('C');
    4 : strFilter := strFilter + ' AND CREC_STATUS   = ''A'' AND CREC_PREVISAO = 1';
  end;
  strFilter := strFilter + ' ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS';
  Result := strFilter;
end;

procedure TfContas_Receber.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('STATUS') then begin
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'A' then begin
      grdBasico.Canvas.Brush.Color := $00ACFBB8;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'F' then begin
      grdBasico.Canvas.Brush.Color := $00FFC184;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'C' then begin
      grdBasico.Canvas.Brush.Color := clYellow;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if (cdsGeral.FieldByName('CREC_DTA_VCTO').AsDateTime <= now) and
       (cdsGeral.FieldByName('CREC_STATUS').AsString <> 'F')     and
       (cdsGeral.FieldByName('CREC_STATUS').AsString <> 'C')     then begin
      grdBasico.Canvas.Brush.Color := $006262FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Vencido        ');
    end;
    if Trim(cdsGeral.FieldByName('STATUS').AsString) = 'Previsão' then begin
      grdBasico.Canvas.Brush.Color := clPurple;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if Column.Field = cdsGeral.FieldByName('CREC_VALOR_DOC') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
end;

procedure TfContas_Receber.Label2Click(Sender: TObject);
begin
  inherited;
  funcBasico.ExecutaRotina(152);
end;

procedure TfContas_Receber.Label3Click(Sender: TObject);
begin
  inherited;
  funcBasico.ExecutaRotina(167);
end;

procedure TfContas_Receber.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27 : begin
      panelFiltros.Height := 155;
      btnFlat.Caption      := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqCliente.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfContas_Receber.btnNovoClick(Sender: TObject);

{$REGION 'GeraAcerto'}
  procedure GeraAcerto(strPLCT_ID, strGene_ID, strCREC_ID : String; floatValor : Real);
  var
    qryCons : TSQLQuery;
  begin
    try
      FormatSettings.DecimalSeparator := '.';
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          try
            funcBasico.StartCommit;
          except
          end;
          sql.Add('INSERT INTO CONTAS_RECEBER_ACERTOS');
          sql.Add('VALUES(' + funcBasico.ObterSequencia('CONTAS_RECEBER_ACERTOS',IntToStr(funcBasico.Empr_ID)) + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + strCREC_ID                            + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + '0'                                   + ','
                            + '5'                                   + ','
                            + strGene_ID                            + ','
                            + FormatFloat('0.00',(floatValor * -1)) + ','
                            + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))) + ','
                            + IntToStr(funcBasico.User_ID) + ')');
//          ShowMessage(qryCons.Text);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcBasico.RollBack;
        funcBasico.ReportaErro(Caption,'GeraAcerto',funcBasico.User_Login,e.Message);
        funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
      FormatSettings.DecimalSeparator := ',';
    end;
  end;
{$ENDREGION}

var
  strTMP : String;
  intID  : Integer;
begin
  intID := cdsGeral.FieldByName('CREC_ID').AsInteger;
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then
    inherited
  else begin
    if (cdsGeral.FieldByName('CREC_STATUS').AsString <> 'C') then begin
      if ConfCancelamento then begin
        while strTMP = '' do begin
          strTMP := InputBox('Cancelamento do título selecionado','Motivo do cancelamento','');
          if strTMP <> '' then begin
            GeraAcerto(cdsGeral.FieldByName('CREC_PLCT_ID').AsString,
                       cdsGeral.FieldByName('CREC_GENE_ID_TIPO_DOC').AsString,
                       cdsGeral.FieldByName('CREC_ID').AsString,
                       cdsGeral.FieldByName('CREC_VALOR_PAGO').AsFloat);
            CancelaTítulo(strTMP);
          end else if funcBasico.Alerta('Informe o motivo do cancelamento antes de continuar.'+#13+#13+
                                        'Deseja continuar?',1,true) = 7 then
            strTMP := '-1';
        end;
      end;
    end;
  end;
  OpenClientDataSet;
  cdsGeral.Locate('CREC_ID',intID,[]);
end;

procedure TfContas_Receber.CancelaTítulo(strMotivo : String);
begin
  with cdsGeral do begin
    if (FieldByName('CREC_VALOR_PAGO').AsFloat > 0) and (FieldByName('CREC_VIA_BANCO').AsInteger = 0) then begin
      funcBasico.LancamentoLivroCaixa('147',
                                      '3',
                                      FieldByName('CREC_ID').AsString,
                                      FieldByName('CREC_EMPR_ID').AsString,
                                      '0',
                                      '0',
                                      '11',
                                      '2',
                                      (FieldByName('CREC_VALOR_PAGO').AsFloat * -1));
    end else if (FieldByName('CREC_VALOR_PAGO').AsFloat > 0) then begin
      funcBasico.RegistraMovBancario(FieldByName('CREC_CBCO_ID').AsString,(FieldByName('CREC_VALOR_PAGO').AsFloat * -1));
      funcBasico.RegistraMovConta(FieldByName('CREC_CBCO_ID').AsString,'1004','2',FieldByName('CREC_ID').AsString,(FieldByName('CREC_VALOR_PAGO').AsFloat * -1));
    end;
    Edit;
    if FieldByName('CREC_STATUS').AsString = 'A' then begin
      FieldByName('CREC_STATUS').AsString    := 'C';
      if cdsGeral.FieldByName('CREC_PREVISAO').AsInteger = 0 then begin
        funcBasico.BaixarContaReceberPrevisto(cdsGeral.FieldByName('CREC_DTA_VCTO').AsDateTime,
                                              cdsGeral.FieldByName('CREC_VALOR_DOC').AsFloat,
                                              cdsGeral.FieldByName('CREC_PLCT_ID').AsString,
                                              'CR');
      end;
      FieldByName('CREC_PREVISAO').AsInteger := 0;
    end else begin
      FieldByName('CREC_STATUS').AsString    := 'A';
      FieldByName('CREC_VALOR_PAGO').AsFloat := 0;
    end;
    FieldByName('CREC_MOTIVO_CANC').AsString   := strMotivo;
    FieldByName('CREC_DTA_CANC').AsDateTime    := funcBasico.DataServidor(funcBasico.Conexao);
    FieldByName('CREC_USER_ID_CANC').AsInteger := funcBasico.User_ID;
    ApplyUpdates(-1);
  end;
end;

function TfContas_Receber.ConfCancelamento : Boolean;
begin
  try
    Result := true;
    Carregadados;
    if fConfirmacao = nil then
      fConfirmacao := TfConfirmacao.Create(nil);
    with fConfirmacao do begin
      lbMsg.Caption         := 'Confirma o cancelamento do título selecionado?';
      lbProveniente.Caption := fCad_Contas_Receber.ContaReceber.strProv;
      lbFornecedor.Caption  := fCad_Contas_Receber.ContaReceber.strCod_Clie + ' - ' + fCad_Contas_Receber.ContaReceber.strCliente;
      lbPlano.Caption       := funcBasico.Buscar_Coluna(fCad_Contas_Receber.ContaReceber.strPlano,1) + ' - ' + funcBasico.Buscar_Coluna(fCad_Contas_Receber.ContaReceber.strPlano,2);
      lbTipo_doc.Caption    := fCad_Contas_Receber.ContaReceber.strCod_Doc  + ' - ' + fCad_Contas_Receber.ContaReceber.strDoc;
      lbVlr.Caption         := 'R$ ' + FormatFloat('0.00',fCad_Contas_Receber.ContaReceber.floatVlr);
      ShowModal;
      Result := boolConfirm;
    end;
  finally
    FreeAndNil(fConfirmacao);
  end;
end;

procedure TfContas_Receber.Carregadados;
begin
  with cdsGeral do begin
    fCad_Contas_Receber.ContaReceber.strNr_Doc   := FieldByName('CREC_NR_DOC').AsString;
    fCad_Contas_Receber.ContaReceber.strProv     := FieldByName('CREC_PROVENIENTE').AsString;
    fCad_Contas_Receber.ContaReceber.strCod_Clie := FieldByName('CREC_CLIE_ID').AsString;
    fCad_Contas_Receber.ContaReceber.strCliente  := FieldByName('CLIE_RAZAO_SOCIAL').AsString;
    fCad_Contas_Receber.ContaReceber.strCod_Plct := FieldByName('CREC_PLCT_ID').AsString;
    fCad_Contas_Receber.ContaReceber.strPlano    := FieldByName('PLCT_COD_SIMPLIFICADO').AsString + ';' + FieldByName('PLCT_DESCRICAO').AsString;
    fCad_Contas_Receber.ContaReceber.strCod_Doc  := FieldByName('CREC_GENE_ID_TIPO_DOC').AsString;
    fCad_Contas_Receber.ContaReceber.strDoc      := FieldByName('TIPO_DOC').AsString;
    fCad_Contas_Receber.ContaReceber.strObs      := FieldByName('CREC_OBS').AsString;
    fCad_Contas_Receber.ContaReceber.dtEmissao   := FieldByName('CREC_DTA_EMISSAO').AsDateTime;
    fCad_Contas_Receber.ContaReceber.dtVecto     := FieldByName('CREC_DTA_VCTO').AsDateTime;
    fCad_Contas_Receber.ContaReceber.floatVlr    := FieldByName('CREC_VALOR_DOC').AsFloat;
    fCad_Contas_Receber.ContaReceber.floatJuro   := FieldByName('CREC_VALOR_JUROS').AsFloat;
    fCad_Contas_Receber.ContaReceber.floatMora   := FieldByName('CREC_VALOR_MORA').AsFloat;
  end;
end;

procedure TfContas_Receber.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmContas_Receber.cdsContas_Receber;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro   := fCad_Contas_Receber;
  with fCad_Contas_Receber do begin
    cdsLocal     := dmContas_Receber.cdsContas_Receber;
    funcLocal    := Self.funcBasico;
  end;
  btnImprimir.Tag := 239;
  panelFiltros.Height := 27;
  edtDt_Vcto_Fim.Date := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  SetaValoresFrames;
  btnFiltrar.Click;
end;

procedure TfContas_Receber.frPesqContaBancariabtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frPesqContaBancaria.btnPesquisarClick(Sender);

end;

procedure TfContas_Receber.frPesqTipoDocckOmitirClick(Sender: TObject);
begin
  inherited;
  if funcBasico.VinculaCartaoCredito then begin
   case frPesqTipoDoc.ckOmitir.Checked of
     true : frPesqContaBancaria.Habilita := true;
     false: frPesqContaBancaria.Habilita := false;
   end;
  end;
end;

procedure TfContas_Receber.frPesqTipoDocedtCodigoExit(Sender: TObject);
var
  strTMP : String;
begin
  inherited;
  if Trim(frPesqTipoDoc.edtCodigo.Text) = '' then begin
    frPesqContaBancaria.Habilita := true;
    frPesqContaBancaria.Limpar;
    Exit;
  end;
  if (StrToInt(frPesqTipoDoc.edtCodigo.Text) in [4,5]) then begin
    if not frPesqTipoDoc.edtCodigo.Modified then Exit;
    if (funcBasico.VinculaCartaoCredito) then begin
      if (not frPesqTipoDoc.TemRegistro) or (StrToInt(frPesqTipoDoc.edtCodigo.Text) in [4,5]) then begin
        frPesqContaBancaria.Habilita := true;
        frPesqContaBancaria.Limpar;
      end else if (not frPesqContaBancaria.Habilita) then begin
        frPesqContaBancaria.Habilita := true;
        frPesqContaBancaria.Limpar;
      end;
    end;
    frPesqTipoDoc.edtCodigoExit(Sender);
    if not frPesqTipoDoc.TemRegistro then Exit;
    frPesqTipoDoc.edtCodigo.Modified := false;
    {try
      if funcBasico.VinculaCartaoCredito then begin
        strTMP := funcBasico.RetornaCartaoCredito(StrToInt(frPesqTipoDoc.edtCodigo.Text),0,'C');
        LancaDadosCartao(strTMP);
      end;
    except
    end;}
  end;
end;

procedure TfContas_Receber.LancaDadosCartao(strTMP : String);
begin
  if Trim(strTMP) <> '' then begin
    CCRE_ID := funcBasico.Buscar_Coluna(strTMP,1);
    frPesqContaBancaria.BuscarRegistro(funcBasico.Buscar_Coluna(strTMP,3));
    frPesqContaBancaria.Habilita := false;
  end else begin
    frPesqTipoDoc.Limpar;
    frPesqContaBancaria.Limpar;
  end;
end;

procedure TfContas_Receber.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
      (Components[intI] as TfrPesqIndividual).funcLocal := Self.funcBasico;
      (Components[intI] as TfrPesqIndividual).ckPlanoContas.Checked := funcBasico.FiltrarPlanoContasPAI;
    end;
  end;
end;

procedure TfContas_Receber.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmContas_Receber do begin
    case intPos of
      1 : begin
        with cdsContas_Receber do begin
          Close;
          CommandText := GeraFilter;
          Open;
        end;
      end;
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfContas_Receber);
finalization
  UnRegisterClass(TfContas_Receber);

end.
