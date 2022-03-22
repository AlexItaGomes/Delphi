unit ufBaixa_Contas_Receber_Auto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, ImgList, SQLExpr, rxCurrEdit, DateUtils, Menus,
  uFrPesqIndividual, frxClass, frxDBSet, frxDesgn, frxExportPDF;

type
  TfBaixa_Contas_Receber_Auto = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    GroupBox2: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    edtTotal: TRxCalcEdit;
    Label9: TLabel;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    ImageList2: TImageList;
    N1: TMenuItem;
    Alterardatadevencimentodosttulosselecionados2: TMenuItem;
    AlterarValordosTtulos2: TMenuItem;
    frPesqCliente: TfrPesqIndividual;
    frPesqPlanoContas: TfrPesqIndividual;
    frPesqTipoDoc: TfrPesqIndividual;
    frPesqContaBancaria: TfrPesqIndividual;
    ckMarca: TCheckBox;
    ckPrevisoes: TCheckBox;
    N2: TMenuItem;
    DD1: TMenuItem;
    SpeedButton1: TSpeedButton;
    lbTotal: TLabel;
    mmAlterPlano: TMenuItem;
    mmAlterFornecedor: TMenuItem;
    mmAlterContaBancaria: TMenuItem;
    procedure btnFlatClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoCellClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure AlterarValordosTtulos1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Alterardatadevencimentodosttulosselecionados2Click(
      Sender: TObject);
    procedure AlterarValordosTtulos2Click(Sender: TObject);
    procedure frPesqClientebtnPesquisarClick(Sender: TObject);
    procedure ckMarcaClick(Sender: TObject);
    procedure DD1Click(Sender: TObject);
    procedure frPesqTipoDocedtCodigoExit(Sender: TObject);
    procedure frPesqTipoDocckOmitirClick(Sender: TObject);
    procedure mmAlterPlanoClick(Sender: TObject);
    procedure frPesqPlanoContasbtnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    floatValor  : Real;
    sltMarcados : TStringList;
    function GeraFilter: String;
    procedure OpenClientDataSet(intPos : Integer = 99);
    procedure BaixaTitulos(strCPAG_ID: String);
    procedure SetaValoresFrames;
    procedure BaixaTitulosPrevisao(strCREC_ID: String);
    procedure LancaDadosCartao(strTMP: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaixa_Contas_Receber_Auto: TfBaixa_Contas_Receber_Auto;

implementation

uses udmBaixa_Contas_Receber_Auto, ufAlteraTituloR, ufBaixaAutomatica;

{$R *.dfm}

procedure TfBaixa_Contas_Receber_Auto.btnExcluirClick(Sender: TObject);
begin
  inherited;
  fBaixaAutomatica.ShowModal;
end;

procedure TfBaixa_Contas_Receber_Auto.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  sltMarcados.Clear;
  ckMarca.Checked := false;
  floatValor      := 0;
  edtTotal.Value  := floatValor;
  OpenClientDataSet(1);
end;

function TfBaixa_Contas_Receber_Auto.GeraFilter : String;
var
  strFilter : String;
begin
  strFilter := dmBaixa_Contas_Receber_Auto.InstrucaoSQL;
  if not ckPrevisoes.Checked then
    strFilter := strFilter + ' AND COALESCE(CREC_PREVISAO,0) = 0';
  if frPesqCliente.TemRegistro then
    strFilter := strFilter + ' AND CREC_CLIE_ID ' + frPesqCliente.InGrid();
  if frPesqPlanoContas.TemRegistro  then
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
  strFilter := strFilter + ' ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS';
  Result := strFilter;
end;

procedure TfBaixa_Contas_Receber_Auto.grdBasicoCellClick(Column: TColumn);
begin
  inherited;
  if Column.Field = grdBasico.DataSource.DataSet.FieldByName('SELECT') then begin
    if cdsGeral.FieldByName('CREC_ID').AsString <> '' then begin
      if sltMarcados.IndexOf(cdsGeral.FieldByName('CREC_ID').AsString) < 0 then begin
        sltMarcados.Add(cdsGeral.FieldByName('CREC_ID').AsString);
        floatValor := floatValor + cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
      end else begin
        floatValor := floatValor - cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
        try
          sltMarcados.Delete(sltMarcados.IndexOf(cdsGeral.FieldByName('CREC_ID').AsString));
        except
        end;
      end;
    end;
  end;
  edtTotal.Value := floatValor;
  grdBasico.Refresh;
end;

procedure TfBaixa_Contas_Receber_Auto.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfBaixa_Contas_Receber_Auto.grdBasicoDrawColumnCell(Sender: TObject;
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
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Vencimento     ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if cdsGeral.FieldByName('CREC_PREVISAO').AsInteger = 1 then begin
    grdBasico.Canvas.Brush.Color := clPurple;
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('CREC_VALOR_DOC') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = grdBasico.DataSource.DataSet.FieldByName('SELECT') then begin
    grdBasico.Canvas.FillRect(Rect);
   ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
   if sltMarcados.IndexOf(cdsGeral.FieldByName('CREC_ID').AsString) >= 0 then
     ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
   else ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.grdBasicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 32 then
    grdBasicoCellClick(grdBasico.Columns[0]);
end;

procedure TfBaixa_Contas_Receber_Auto.Label2Click(Sender: TObject);
begin
  inherited;
  funcBasico.ExecutaRotina(152);
end;

procedure TfBaixa_Contas_Receber_Auto.Label3Click(Sender: TObject);
begin
  inherited;
  funcBasico.ExecutaRotina(167);
end;

procedure TfBaixa_Contas_Receber_Auto.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27 : begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqCliente.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.BaixaTitulosPrevisao(strCREC_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
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
        sql.Add('UPDATE CONTAS_RECEBER');
        sql.Add('SET    CREC_PREVISAO             = 0');
        sql.Add('WHERE  CREC_ID                   = ' + strCREC_ID);
        sql.Add('AND    CREC_EMPR_ID              = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND    COALESCE(CREC_PREVISAO,0) = 1');
        ExecSQL;
        try
          funcBasico.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'BaixaTitulos',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.btnNovoClick(Sender: TObject);
var
  intI : Integer;
begin
  if sltMarcados.Count > 0 then begin
    if funcBasico.Alerta('Confirma a baixa do(s) título(s) selecionado(s)?',1,true) = 6 then begin
      try
        funcBasico.MSGAguarde();
        try
          for intI := 0 to sltMarcados.Count -1 do begin
            BaixaTitulosPrevisao(sltMarcados.Strings[intI]);
            BaixaTitulos(sltMarcados.Strings[intI]);
          end;
        except
        end;
      finally
        funcBasico.MSGAguarde(false);
        FreeAndNil(sltMarcados);
        sltMarcados := TStringList.Create;
        OpenClientDataSet;
        try
          btnFiltrar.Click;
        except
        end;
      end;
    end;
  end else funcBasico.Alerta('Não há títulos selecionados para baixa.',1);
end;

procedure TfBaixa_Contas_Receber_Auto.ckMarcaClick(Sender: TObject);
begin
  inherited;
  try
    if cdsGeral.IsEmpty then ckMarca.Checked := false;
    cdsGeral.DisableControls;
    cdsGeral.First;
    while not cdsGeral.Eof do begin
      if (Sender as TCheckBox).Checked then begin
        if sltMarcados.IndexOf(cdsGeral.FieldByName('CREC_ID').AsString) < 0 then begin
          sltMarcados.Add(cdsGeral.FieldByName('CREC_ID').AsString);
          floatValor := floatValor + cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
        end;
      end else begin
        try
          sltMarcados.Delete(sltMarcados.IndexOf(cdsGeral.FieldByName('CREC_ID').AsString));
        except
        end;
        floatValor := 0;
      end;
      cdsGeral.Next;
    end;
  finally
    cdsGeral.EnableControls;
    edtTotal.Value := floatValor;
    grdBasico.Refresh;
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.DD1Click(Sender: TObject);
var
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  boolCancel := false;
  try
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar o tipo do(s) título(s) selecionado(s),'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if funcBasico.AtualizarPrevisaoTitulos(strID,'R') then begin
            boolCancel := true;
            OpenClientDataSet;
            btnFiltrar.Click;
            Exit;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else Exit;
  except
  end;
  if boolCancel then Exit;  
end;

procedure TfBaixa_Contas_Receber_Auto.Alterardatadevencimentodosttulosselecionados2Click(
  Sender: TObject);
var
  strTMP     : String;
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  try
    boolCancel := false;
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar a data de vencimento dos títulos selecionados,'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if InputQuery('Alterar data de vencimento em X dias','Informe a quantidade de dias que deseja alterar:'+#13+'(Ex.: -5, +5)',strTMP) then begin
            try
              StrToInt(strTMP);
              if funcBasico.AtualizaDtaVectoTitulos(strID,strTMP,'R') then begin
                boolCancel := true;
                OpenClientDataSet;
                btnFiltrar.Click;
                Exit;
              end;
            except
              funcBasico.Alerta('Valor informado inválido!',0);
            end;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else begin
      funcBasico.Alerta('Selecione um título antes de continuar.',0);
      Exit;
    end;
  except
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.mmAlterPlanoClick(
  Sender: TObject);
var
  strID  : String;
  intI   : Integer;
  chrTMP : Char;
begin
  if sltMarcados.Count > 0 then begin
    try
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      fAlteraTit := TfAlteraTit.Create(nil);
      with fAlteraTit do begin
        frPesquisa.edtOpcao.Enabled   := true;
        frPesquisa.edtOpcao1.Enabled  := true;
        frPesquisa.edtOpcao.Visible   := true;
        frPesquisa.edtOpcao1.Visible  := true;
        frPesquisa.Label3.Enabled     := true;
        frPesquisa.Label4.Enabled     := true;
        frPesquisa.Label3.Visible     := true;
        frPesquisa.Label4.Visible     := true;
        if TMenuItem(Sender as TObject).Name = 'mmAlterPlano' then begin
          frPesquisa.rdOpcoes.ItemIndex := 6;
          frPesquisa.Label3.Caption     := 'Cód. Simpl.';
          frPesquisa.Label4.Caption     := 'Tipo';
          frPesquisa.edtDescricao.Width := 290;
        end else if TMenuItem(Sender as TObject).Name = 'mmAlterFornecedor' then begin
          frPesquisa.rdOpcoes.ItemIndex := 0;
          frPesquisa.edtOpcao.Enabled   := false;
          frPesquisa.edtOpcao1.Enabled  := false;
          frPesquisa.edtOpcao.Visible   := false;
          frPesquisa.edtOpcao1.Visible  := false;
          frPesquisa.Label3.Enabled     := false;
          frPesquisa.Label4.Enabled     := false;
          frPesquisa.Label3.Visible     := false;
          frPesquisa.Label4.Visible     := false;
          frPesquisa.edtDescricao.Width := 448;
        end else if TMenuItem(Sender as TObject).Name = 'mmAlterContaBancaria' then begin
          frPesquisa.rdOpcoes.ItemIndex := 8;
          frPesquisa.Label3.Caption     := 'Saldo Atual';
          frPesquisa.Label4.Caption     := 'Limite';
          frPesquisa.edtDescricao.Width := 290;
        end;
        ShowModal;
        if frPesquisa.TemRegistro() then begin
          chrTMP := Copy(String(TMenuItem(Sender as TObject).Name),8,1)[1];
          funcBasico.AlteraTitulos(strID,frPesquisa.InGrid,Char(chrTMP),'R');
        end;
      end;
    finally
      FreeAndNil(fAlteraTit);
      OpenClientDataSet;
      btnFiltrar.Click;
    end;
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.AlterarValordosTtulos1Click(
  Sender: TObject);
var
  strTMP     : String;
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  try
    boolCancel := false;
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar o valor dos títulos selecionados,'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if InputQuery('Alterar valor dos títulos selecionados','Informe o novo valor dos títulos:'+#13+'(Ex.: 150,00)',strTMP) then begin
            try
              StrToFloat(strTMP);
              if funcBasico.AtualizaValorTitulos(strID,strTMP,'R') then begin
                boolCancel := true;
                OpenClientDataSet;
                btnFiltrar.Click;
                Exit;
              end;
            except
              funcBasico.Alerta('Valor informado inválido!',0);
            end;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else Exit;
  except
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.AlterarValordosTtulos2Click(
  Sender: TObject);
var
  strTMP     : String;
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  try
    boolCancel := false;
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar o valor dos títulos selecionados,'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if InputQuery('Alterar valor dos títulos selecionados','Informe o novo valor dos títulos:'+#13+'(Ex.: 150,00)',strTMP) then begin
            try
              StrToFloat(strTMP);
              if funcBasico.AtualizaValorTitulos(strID,strTMP,'R') then begin
                boolCancel := true;
                OpenClientDataSet;
                btnFiltrar.Click;
                Exit;
              end;
            except
              funcBasico.Alerta('Valor informado inválido!',0);
            end;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else Exit;
  except
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.BaixaTitulos(strCPAG_ID : String);

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
                            + FormatFloat('0.00',(floatValor)) + ','
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
  qryConsI,
  qryCons  : TSQLQuery;
begin
  try
    qryCons  := TSQLQuery.Create(nil);
    qryConsI := TSQLQuery.Create(nil);
    qryCons.SQLConnection  := funcBasico.Conexao;
    qryConsI.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(CREC_VALOR_DOC - CREC_VALOR_PAGO,0) VALOR,');
        sql.Add('      CREC_PLCT_ID,');
        sql.Add('      CREC_GENE_ID_TIPO_DOC,');
        SQL.Add('      COALESCE(CREC_VIA_BANCO,0) AS CREC_VIA_BANCO,');
        sql.Add('      COALESCE(CREC_CBCO_ID,0)   AS CREC_CBCO_ID');
        sql.Add('FROM  CONTAS_RECEBER');
        sql.Add('WHERE CREC_ID      = ' + strCPAG_ID);
        sql.Add('AND   CREC_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Open;
        if (qryCons.FieldByName('CREC_VIA_BANCO').AsInteger = 1) and (qryCons.FieldByName('CREC_CBCO_ID').AsInteger <> 0) then begin
          if not funcBasico.ContaBancariaAtiva(qryCons.FieldByName('CREC_CBCO_ID').AsString) then begin
            funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                              'Conta bancária informada no título encontra-se inativa, verifique sua(s) conta(s) bancária(s) antes de continuar!',1);
            Exit;
          end;
        end;
        if (qryCons.FieldByName('CREC_VIA_BANCO').AsInteger = 1) and (qryCons.FieldByName('CREC_CBCO_ID').AsInteger = 0) then begin
          funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                            'Um dos títulos selecionados informa que sua baixa e via banco, mas não há um banco vinculado a este título!',0);
          Exit;
        end;
        GeraAcerto(Fields[1].AsString,Fields[2].AsString,strCPAG_ID,Fields[0].AsFloat);
        if Fields[3].AsInteger = 0 then begin
          funcBasico.LancamentoLivroCaixa(qryCons.Fields[1].AsString,
                                          '1',
                                          strCPAG_ID,
                                          IntToStr(funcBasico.Empr_ID),
                                          '0',
                                          '0',
                                          '11',
                                          '2',
                                          (qryCons.Fields[0].AsFloat));
        end else begin
          funcBasico.RegistraMovBancario(Fields[4].AsString,Fields[0].AsFloat);
          funcBasico.RegistraMovConta(Fields[4].AsString,'1002','2',strCPAG_ID,Fields[0].AsFloat);
        end;
        with qryConsI do begin
          Close;
          sql.Clear;
          try
            funcBasico.StartCommit;
          except
          end;
          sql.Add('UPDATE CONTAS_RECEBER');
          sql.Add('SET    CREC_VALOR_PAGO  = CREC_VALOR_DOC');
          sql.Add('      ,CREC_STATUS      = ' + QuotedStr('F'));
          sql.Add('      ,CREC_DTA_PGTO    = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor())));
          sql.Add('      ,CREC_DTA_EFETIVO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor())));
          sql.Add('WHERE CREC_ID           = ' + strCPAG_ID);
          sql.Add('AND   CREC_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'BaixaTitulos',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.BitBtn2Click(Sender: TObject);
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
  frPesqCliente.SetFocus;
  cdsGeral.Filtered := false;
  frPesqTipoDoc.edtCodigo.Modified := true;
  frPesqTipoDocedtCodigoExit(Sender);
end;

procedure TfBaixa_Contas_Receber_Auto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(sltMarcados);
end;

procedure TfBaixa_Contas_Receber_Auto.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmBaixa_Contas_Receber_Auto.cdsContas_Receber;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  sltMarcados := TStringList.Create;
  panelFiltros.Height    := 27;
//  edtDt_Vcto_Inicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Vcto_Fim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  sltMarcados.Clear;
  SetaValoresFrames();
  btnFiltrar.Click;
end;

procedure TfBaixa_Contas_Receber_Auto.SetaValoresFrames;
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

procedure TfBaixa_Contas_Receber_Auto.frPesqClientebtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frPesqCliente.btnPesquisarClick(Sender);

end;

procedure TfBaixa_Contas_Receber_Auto.frPesqPlanoContasbtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frPesqPlanoContas.btnPesquisarClick(Sender);

end;

procedure TfBaixa_Contas_Receber_Auto.frPesqTipoDocckOmitirClick(
  Sender: TObject);
begin
  inherited;
  if funcBasico.VinculaCartaoCredito then begin
   case frPesqTipoDoc.ckOmitir.Checked of
     true : frPesqContaBancaria.Habilita := true;
     false: frPesqContaBancaria.Habilita := false;
   end;
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.frPesqTipoDocedtCodigoExit(
  Sender: TObject);
var
  strTMP : String;
begin
  inherited;
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

procedure TfBaixa_Contas_Receber_Auto.LancaDadosCartao(strTMP : String);
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

procedure TfBaixa_Contas_Receber_Auto.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmBaixa_Contas_Receber_Auto do begin
    case intPos of
      1 : begin
        with cdsContas_Receber do begin
          Close;
          CommandText := GeraFilter;
          Open;
        end;
        try
          cdsContas_Receber.DisableControls;
          cdsContas_Receber.First;
          while not cdsContas_Receber.Eof do begin
            floatValor := floatValor + cdsContas_ReceberVALOR_APAGAR.AsFloat;
            cdsContas_Receber.Next;
          end;
          lbTotal.Caption := 'Total em Títulos R$ ' + FormatFloat('###,###,##0.00',floatValor);
          floatValor:=0;
        finally
          cdsContas_Receber.EnableControls;
        end;
      end else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

procedure TfBaixa_Contas_Receber_Auto.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfBaixa_Contas_Receber_Auto);
finalization
  UnRegisterClass(TfBaixa_Contas_Receber_Auto);

end.
