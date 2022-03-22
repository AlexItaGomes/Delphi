unit ufContas_Bancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn, Mask, rxToolEdit, uFrPesqIndividual;

type
  TfContas_Bancarias = class(TfBasico)
    gridMov: TDBGrid;
    Splitter1: TSplitter;
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    lbDtInstalacao: TGroupBox;
    edtDtAberturaInicio: TDateEdit;
    edtDtAberturaFim: TDateEdit;
    rdStatus: TRadioGroup;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    lbDtCad: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqBanco: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridMovDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    procedure OpenClientDataSet;
    function GeraFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContas_Bancarias: TfContas_Bancarias;

implementation

uses udmContas_Bancarias, ufCad_Contas_Bancarias;

{$R *.dfm}

procedure TfContas_Bancarias.gridMovDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(gridMov.DataSource.DataSet.RecNo) then begin
      gridMov.Canvas.Font.Color  := clBlack;
      gridMov.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      gridMov.Canvas.Font.Color  := clBlack;
      gridMov.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      gridMov.Canvas.Brush.Color := clSilver;
      gridMov.Canvas.Font.Style  := [fsBold];
    end;
     gridMov.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = dmContas_Bancarias.cdsContas_Bancarias_MovCBMV_VALOR_MOV then begin
    if dmContas_Bancarias.cdsContas_Bancarias_MovGENE_PAR1.AsString = 'D' then begin
      gridMov.Canvas.Font.Style := [fsBold];
      gridMov.Canvas.Font.Color := clRed;
      gridMov.DefaultDrawDataCell(Rect,Column.Field,State);
    end else begin
      gridMov.Canvas.Font.Style := [fsBold];
      gridMov.Canvas.Font.Color := clBlue;
      gridMov.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TfContas_Bancarias.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  GeraFilter;
end;

function TfContas_Bancarias.GeraFilter: String;
var
  sltTMP: TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do
    begin
      Clear;
      Add('SELECT');
      Add('      CB.CBCO_ID,');
      Add('      CB.CBCO_EMPR_ID,');
      Add('      CB.CBCO_DESCRICAO,');
      Add('      CB.CBCO_GENE_EMPR_ID_BCO,');
      Add('      CB.CBCO_GENE_TGEN_ID_BCO,');
      Add('      CB.CBCO_GENE_ID_BCO,');
      Add('      CB.CBCO_AGENCIA,');
      Add('      CB.CBCO_CONTA,');
      Add('      CB.CBCO_TIPO,');
      Add('      CB.CBCO_GERENTE,');
      Add('      CB.CBCO_VALOR_INICIAL,');
      Add('      CB.CBCO_SALDO_ATUAL,');
      Add('      CB.CBCO_ATIVO,');
      Add('      COALESCE(CB.CBCO_CONSIDERAR_SALDOS,1) AS CBCO_CONSIDERAR_SALDOS,');
      Add('      CB.CBCO_DTA_CADASTRO,');
      Add('      CB.CBCO_USER_ID,');
      Add('      CB.CBCO_LIMITE,');
      Add('      CB.CBCO_DIA_LIMITE,');
      Add('      CB.CBCO_DTA_ABERTURA,');
      Add('      CB.CBCO_PARTICIPA_METAS,');
      Add('      CB.CBCO_MULTI_EMPRESA,');
      Add('      BC.GENE_DESCR BANCO_DESCR,');
      Add('      BC.GENE_PAR1  COD_BANCO');
      Add('FROM  CONTAS_BANCARIAS CB');
      Add('INNER JOIN GENERICA BC');
      Add('ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
      Add('AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
      Add('AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
      Add('WHERE CB.CBCO_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

      if frPesqBanco.TemRegistro then
        Add('AND  CB.CBCO_GENE_ID_BCO = ' + frPesqBanco.InGrid());

      if edtDtCadInicio.Date > 0 then
        Add('AND  CB.CBCO_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadInicio.Date)));
      if edtDtCadFim.Date > 0 then
        Add('AND  CB.CBCO_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadFim.Date)));

      if edtDtAberturaInicio.Date > 0 then
        Add('AND  CB.CBCO_DTA_ABERTURA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAberturaInicio.Date)));
      if edtDtAberturaFim.Date > 0 then
        Add('AND  CB.CBCO_DTA_ABERTURA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAberturaFim.Date)));

      case rdStatus.ItemIndex of
        0: Add('AND CB.CBCO_ATIVO = 1');
        1: Add('AND CB.CBCO_ATIVO = 0');
      end;
    end;
    with dmContas_Bancarias.cdsContas_Bancarias do begin
      Close;
      CommandText := (sltTMP.Text);
      Open;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;


procedure TfContas_Bancarias.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27: begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
    end;
    155: begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfContas_Bancarias.btnLimparClick(Sender: TObject);
var
  intI: Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
  end;
  rdStatus.ItemIndex := 0;
  cdsGeral.Filtered  := false;
end;

procedure TfContas_Bancarias.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmContas_Bancarias.cdsContas_Bancarias;
  //cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Contas_Bancarias;
  with fCad_Contas_Bancarias do begin
    cdsLocal     := dmContas_Bancarias.cdsContas_Bancarias;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfContas_Bancarias.FormShow(Sender: TObject);
begin
  inherited;
  panelFiltros.Height := 27;
  btnFiltrar.Click;
end;

procedure TfContas_Bancarias.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('CBCO_ATIVO') then begin
    if cdsGeral.FieldByName('CBCO_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('CBCO_ATIVO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Inativo        ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if Column.Field = cdsGeral.FieldByName('CBCO_SALDO_ATUAL') then begin
    if cdsGeral.FieldByName('CBCO_SALDO_ATUAL').AsFloat <= 0 then begin
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.Canvas.Font.Color := clRed;
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end else begin
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.Canvas.Font.Color := clBlue;
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TfContas_Bancarias.OpenClientDataSet;
begin
  with dmContas_Bancarias do begin
    with cdsPesq_Bancos do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfContas_Bancarias);
finalization
  UnRegisterClass(TfContas_Bancarias);

end.
