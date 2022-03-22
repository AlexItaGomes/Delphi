unit ufCadObras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, rxCurrEdit, Grids, DBGrids, SQLExpr;

type
  TfCadObras = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TDBEdit;
    Label4: TLabel;
    edtEndereco: TDBEdit;
    Label5: TLabel;
    edtBairro: TDBEdit;
    Label6: TLabel;
    edtCodPraca: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    edtAreaTotal: TRxDBCalcEdit;
    edtAreaConst: TRxDBCalcEdit;
    edtVlrInvest: TRxDBCalcEdit;
    edtDtPrevInicio: TDBDateEdit;
    edtDtPrevFim: TDBDateEdit;
    edtDtInicio: TDBDateEdit;
    edtDtFim: TDBDateEdit;
    rdStatus: TDBRadioGroup;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnPesq_Praca: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label17: TLabel;
    edtEngenheiro: TDBEdit;
    btnNovaEtapa: TBitBtn;
    btnEditarEtapa: TBitBtn;
    DBEdit2: TDBEdit;
    procedure Label6Click(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodPracaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodPracaExit(Sender: TObject);
    procedure btnPesq_PracaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovaEtapaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function JaExiste: Boolean;
    procedure OpenClientDataSet;
    procedure SomaEtapas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadObras: TfCadObras;

implementation

uses udmControle_Obras, ufCadEtapasObras;

{$R *.dfm}

procedure TfCadObras.btnNovaEtapaClick(Sender: TObject);
begin
  if ValidaDados then begin
    fCadEtapasObras.funcLocal := Self.funcLocal;
    fCadEtapasObras.cdsLocal  := dmControle_Obras.cdsEtapas_Obras;
    if (Sender as TBitBtn).Name = 'btnNovaEtapa' then begin
      fCadEtapasObras.cdsLocal.Append;
      fCadEtapasObras.ShowModal;
    end else if (Sender as TBitBtn).Name = 'btnEditarEtapa' then begin
      fCadEtapasObras.cdsLocal.Edit;
      fCadEtapasObras.ShowModal;
    end else Exit;
    SomaEtapas;
  end;
end;

procedure TfCadObras.SomaEtapas;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(OBET_VLR_PREVISAO),0)');
        sql.Add('FROM  OBRAS_ETAPAS');
        sql.Add('WHERE OBET_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBET_OBRA_ID      = ' + cdsLocal.FieldByName('OBRA_ID').AsString);
        sql.Add('AND   OBET_OBRA_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        Open;
      end;
      dmControle_Obras.cdsControle_Obras.Edit;
      dmControle_Obras.cdsControle_ObrasOBRA_VLR_TOTAL.AsFloat := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcLocal.ReportaErro('TfCadObras','SomaEtapas',e.Message);
      funcLocal.Alerta('Erro no processo de calculo das etapas da obra.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadObras.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    case rdStatus.ItemIndex of
      0 : begin
        cdsLocal.FieldByName('OBRA_DTA_INICIO_OBRA').AsString := '';
        cdsLocal.FieldByName('OBRA_DTA_FIM_OBRA').AsString    := '';
      end;
      1,2 : begin
        cdsLocal.FieldByName('OBRA_DTA_INICIO_OBRA').AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
        cdsLocal.FieldByName('OBRA_DTA_FIM_OBRA').AsString      := '';
      end;
      3 : begin
        cdsLocal.FieldByName('OBRA_DTA_FIM_OBRA').AsDateTime    := funcLocal.DataServidor(funcLocal.Conexao);
      end;
    end;
    inherited;
    dmControle_Obras.cdsEtapas_Obras.ApplyUpdates(-1);
  end;
  try
    edtDescricao.SetFocus;
  except;
  end;
  OpenClientDataSet;
end;

function TfCadObras.ValidaDados : Boolean;
begin
  Result := true;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição para sua obra antes de continuar.',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtEngenheiro.Text = '' then begin
    funcLocal.Alerta('Informe o nome do engenheiro responsável antes de continuar.',0);
    edtEngenheiro.SetFocus;
    Result := false;
    Exit;
  end;
  if edtEndereco.Text = '' then begin
    funcLocal.Alerta('Informe o endereço da obra antes de continuar.',0);
    edtEndereco.SetFocus;
    Result := false;
    Exit;
  end;
  if edtBairro.Text = '' then begin
    funcLocal.Alerta('Informe o bairro da obra antes de continuar.',0);
    edtBairro.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodPraca.Text = '' then begin
    funcLocal.Alerta('Informe a cidade antes de continuar.',0);
    edtCodPraca.SetFocus;
    Result := false;
    Exit;
  end;
  if edtAreaTotal.Value <= 0 then begin
    funcLocal.Alerta('Informe a área total do terreno antes de continuar.',0);
    edtAreaTotal.SetFocus;
    Result := false;
    Exit;
  end;
  if edtAreaConst.Value <= 0 then begin
    funcLocal.Alerta('Informe a área total a ser construida antes de continuar.',0);
    edtAreaConst.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtAreaConst.Value > edtAreaTotal.Value) then begin
    funcLocal.Alerta('A área total construida não pode ser maior que a área total do terreno.',0);
    edtAreaTotal.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlrInvest.Value <= 0 then begin
    funcLocal.Alerta('Informe a valor inicial de investimento na obra antes de continuar.',0);
    edtVlrInvest.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtPrevInicio.Date = 0 then begin
    funcLocal.Alerta('Informe a data prevista de inicio das obras antes de continuar.',0);
    edtDtPrevInicio.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDtPrevFim.Date = 0 then begin
    funcLocal.Alerta('Informe a data prevista de termino das obras antes de continuar.',0);
    edtDtPrevFim.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtDtPrevFim.Date < edtDtPrevInicio.Date) then begin
    funcLocal.Alerta('A data de previsão final da obra não pode ser inferior a data de previsão inicial.',0);
    edtDtPrevInicio.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta no sistema um registro com os mesmos parametros.',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCadObras.JaExiste : Boolean;
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
        sql.Add('FROM  OBRAS');
        sql.Add('WHERE OBRA_ID       <> ' + cdsLocal.FieldByName('OBRA_ID').AsString);
        sql.Add('AND   OBRA_EMPR_ID   = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   OBRA_DESCRICAO = ' + QuotedStr(cdsLocal.FieldByName('OBRA_DESCRICAO').AsString));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0);
    except on e: exception do begin
      funcLocal.ReportaErro('TfCadObras','JaExiste',e.Message);
      funcLocal.Alerta('Erro no processo de validação das informações do registro.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadObras.btnPesq_PracaClick(Sender: TObject);
var
  strTMP : String;
begin
  dmControle_Obras.cdsPesq_Praca.Open;
  strTMP := funcLocal.Busca_Registro(dmControle_Obras.cdsPesq_Praca,'','GENE_ID;GENE_DESCR;GENE_PAR1','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('OBRA_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('CIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('UF').AsString                 := funcLocal.Buscar_Coluna(strTMP,3);
    edtCodPraca.Modified := true;
  end else begin
    cdsLocal.FieldByName('OBRA_GENE_ID_PRACA').AsString := '';
    cdsLocal.FieldByName('CIDADE').AsString             := '';
    cdsLocal.FieldByName('UF').AsString                 := '';
  end;
  edtCodPraca.SetFocus;
end;

procedure TfCadObras.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnEditarEtapa.Click;
end;

procedure TfCadObras.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    if odd(DBGrid1.DataSource.DataSet.RecNo) then begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      DBGrid1.Canvas.Brush.Color := clSilver;
      DBGrid1.Canvas.Font.Style  := [fsBold];
    end;
     DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = dmControle_Obras.cdsEtapas_Obras.FieldByName('OBET_STATUS') then begin
    case dmControle_Obras.cdsEtapas_Obras.FieldByName('OBET_STATUS').AsInteger of
      0 : begin ///Aguardando
        DBGrid1.Canvas.Brush.Color := clGray;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Aguardando     ');
      end;
      1 : begin ///Em Construção
        DBGrid1.Canvas.Brush.Color := clGreen;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Em Construção  ');
      end;
      2 : begin ///Paralisada
        DBGrid1.Canvas.Brush.Color := $0000A8A8;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Paralisada     ');
      end;
      3 : begin ///Finalizada
        DBGrid1.Canvas.Brush.Color := $000080FF;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Finalizada     ');
      end;
      4 : begin ///Cancelada
        DBGrid1.Canvas.Brush.Color := clRed;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Cancelado      ');
      end;
      else begin ///Sem Registro
        DBGrid1.Canvas.Brush.Color := clWhite;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
        DBGrid1.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Registro   ');
      end;
    end;
  end;
end;

procedure TfCadObras.edtCodPracaExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodPraca.Modified then Exit;
  if edtCodPraca.Text <> '' then begin
    dmControle_Obras.cdsPesq_Praca.Open;
    strTMP := funcLocal.Busca_Registro(dmControle_Obras.cdsPesq_Praca,'','GENE_ID;GENE_DESCR;GENE_PAR1','GENE_ID = ' + edtCodPraca.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('OBRA_GENE_ID_PRACA').AsString := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('CIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('UF').AsString                 := funcLocal.Buscar_Coluna(strTMP,3);
    end else begin
      cdsLocal.FieldByName('OBRA_GENE_ID_PRACA').AsString := '';
      cdsLocal.FieldByName('CIDADE').AsString             := '';
      cdsLocal.FieldByName('UF').AsString                 := '';
    end;
  end else begin
    cdsLocal.FieldByName('OBRA_GENE_ID_PRACA').AsString := '';
    cdsLocal.FieldByName('CIDADE').AsString             := '';
    cdsLocal.FieldByName('UF').AsString                 := '';
  end;
end;

procedure TfCadObras.edtCodPracaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key,['0'..'9',#8]) then key := #0;
end;

procedure TfCadObras.FormShow(Sender: TObject);
begin
  inherited;
  try
    edtDescricao.SetFocus;
  except;
  end;
  OpenClientDataSet;
end;

procedure TfCadObras.OpenClientDataSet;
begin
  with dmControle_Obras do begin
    with cdsEtapas_Obras do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('OBRA_ID').AsInteger := cdsControle_ObrasOBRA_ID.AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsPesq_Praca do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfCadObras.Label6Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(153);
end;

procedure TfCadObras.Label6MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadObras.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCadObras.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label6Click(Sender);
end;

initialization
  if fCadObras = nil then
    fCadObras := TfCadObras.Create(nil);

finalization
  FreeAndNil(fCadObras);


end.
