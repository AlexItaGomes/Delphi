unit ufBaixa_Contas_Receber_Parcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, uFrPesqIndividual, frxClass, frxDBSet,
  frxDesgn;

type
  TfBaixa_Contas_Receber_Parcial = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    GroupBox2: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqPlanoContas: TfrPesqIndividual;
    frPesqTipoDoc: TfrPesqIndividual;
    frPesqContaBancaria: TfrPesqIndividual;
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frPesqTipoDocedtCodigoExit(Sender: TObject);
    procedure frPesqTipoDocckOmitirClick(Sender: TObject);
  private
    function  GeraFilter: String;
    procedure OpenClientDataSet(intPos : Integer = 99);
    procedure SetaValoresFrames;
    procedure LancaDadosCartao(strTMP: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaixa_Contas_Receber_Parcial: TfBaixa_Contas_Receber_Parcial;

implementation

uses udmBaixa_Contas_Receber_Parcial, ufCad_Baixa_Contas_Receber_Parcial;

{$R *.dfm}

procedure TfBaixa_Contas_Receber_Parcial.BitBtn2Click(Sender: TObject);
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

procedure TfBaixa_Contas_Receber_Parcial.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(1);
end;

function TfBaixa_Contas_Receber_Parcial.GeraFilter : String;
var
  strFilter : String;
begin
  strFilter := dmBaixa_Contas_Receber_Parcial.InstrucaoSQL;
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
  strFilter := strFilter + ' ORDER BY CR.CREC_DTA_VCTO, CR.CREC_STATUS';
  Result := strFilter;
end;

procedure TfBaixa_Contas_Receber_Parcial.grdBasicoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('STATUS') then begin
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'A' then begin
      grdBasico.Canvas.Brush.Color := $00ACFBB8;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
//      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Aberto         ');
    end;
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'F' then begin
      grdBasico.Canvas.Brush.Color := $00FFC184;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
//      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Fechado        ');
    end;
    if cdsGeral.FieldByName('CREC_STATUS').AsString = 'C' then begin
      grdBasico.Canvas.Brush.Color := clYellow;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
//      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Cancelado      ');
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
  if Column.Field = cdsGeral.FieldByName('CREC_VALOR_DOC') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
end;

procedure TfBaixa_Contas_Receber_Parcial.btnFlatClick(Sender: TObject);
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
      btnFlat.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfBaixa_Contas_Receber_Parcial.btnNovoClick(Sender: TObject);

{$REGION 'OpenClientAcerto'}
  procedure OpenClientAcerto;
  begin
    with dmBaixa_Contas_Receber_Parcial.cdsAcertos do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Params.ParamByName('CREC_ID').AsInteger := cdsGeral.FieldByName('CREC_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
{$ENDREGION}

begin
  if cdsGeral.IsEmpty then Exit;
  if (Sender as TSpeedButton).Name = 'btnEditar' then begin
    if (grdBasico.DataSource <> nil) then begin
      if (btnEditar.Enabled) then begin
        if formCadastro <> nil then begin
          try
            OpenClientAcerto;
            dmBaixa_Contas_Receber_Parcial.cdsAcertos.Append;
            formCadastro.ShowModal;
          except on e: exception do begin
            funcBasico.Alerta(e.Message,1);
            funcBasico.RollBack;
          end; end;
        end;
      end;
    end;
  end;
  OpenClientDataSet;
end;

procedure TfBaixa_Contas_Receber_Parcial.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmBaixa_Contas_Receber_Parcial.cdsContas_Receber;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro   := fCad_Baixa_Contas_Receber_Parcial;
  with fCad_Baixa_Contas_Receber_Parcial do begin
    cdsLocal     := dmBaixa_Contas_Receber_Parcial.cdsContas_Receber;
    funcLocal    := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
//  edtDt_Vcto_Inicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Vcto_Fim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  btnFiltrar.Click;
end;

procedure TfBaixa_Contas_Receber_Parcial.FormShow(Sender: TObject);
begin
  inherited;
  SetaValoresFrames();
end;

procedure TfBaixa_Contas_Receber_Parcial.frPesqTipoDocckOmitirClick(
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

procedure TfBaixa_Contas_Receber_Parcial.frPesqTipoDocedtCodigoExit(
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
  end};
end;

procedure TfBaixa_Contas_Receber_Parcial.LancaDadosCartao(strTMP : String);
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

procedure TfBaixa_Contas_Receber_Parcial.SetaValoresFrames;
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

procedure TfBaixa_Contas_Receber_Parcial.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmBaixa_Contas_Receber_Parcial do begin
    case intPos of
      1 : begin
        with cdsContas_Receber do begin
          Close;
          CommandText := GeraFilter;
          Open;
        end;
      end else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfBaixa_Contas_Receber_Parcial);
finalization
  UnRegisterClass(TfBaixa_Contas_Receber_Parcial);

end.
