unit ufProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesqIndividual, frxClass, frxDBSet, frxDesgn;

type
  TfProdutos = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    rdStatus: TRadioGroup;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    frPesqTipo: TfrPesqIndividual;
    frPesqGrupo: TfrPesqIndividual;
    frPesqFornec: TfrPesqIndividual;
    frPesqMarca: TfrPesqIndividual;
    frPesqModelo: TfrPesqIndividual;
    GroupBox1: TGroupBox;
    edtDtCadInicial: TDateEdit;
    edtDtCadFim: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos : Integer);
    function GeraFiltro: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProdutos: TfProdutos;

implementation

uses udmProdutos, ufCad_Produtos;

{$R *.dfm}

procedure TfProdutos.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  rdStatus.ItemIndex := 2;
  frPesqFornec.SetFocus;
  cdsGeral.Filtered := false;
  frPesqTipo.Limpar;
  frPesqGrupo.Limpar;
  frPesqFornec.Limpar;
  frPesqMarca.Limpar;
  frPesqModelo.Limpar;
end;

procedure TfProdutos.btnFiltrarClick(Sender: TObject);
begin
  with dmProdutos.cdsProdutos do begin
    Filtered := false;
    Filter   := GeraFiltro;
    Filtered := true;
  end;
end;

function TfProdutos.GeraFiltro : String;
var
  strTMP : String;
begin
  strTMP := 'PROD_ID > 0';
  if frPesqFornec.TemRegistro then
    strTMP := strTMP + ' AND PROD_FORN_ID ' + frPesqFornec.InGrid();
  if frPesqTipo.TemRegistro then
    strTMP := strTMP + ' AND PROD_GENE_ID_TP_PROD ' + frPesqTipo.InGrid();
  if frPesqGrupo.TemRegistro then
    strTMP := strTMP + ' AND PROD_GENE_ID_GRUPO ' + frPesqGrupo.InGrid();
  if frPesqMarca.TemRegistro then
    strTMP := strTMP + ' AND PROD_GENE_ID_MARCA ' + frPesqMarca.InGrid();
  if frPesqModelo.TemRegistro then
    strTMP := strTMP + ' AND PROD_GENE_ID_MODELO ' + frPesqModelo.InGrid();
  if edtDtCadInicial.Date > 0 then
    strTMP := strTMP + ' AND PROD_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicial.Date));
  if edtDtCadFim.Date > 0 then
    strTMP := strTMP + ' AND PROD_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date));
  case rdStatus.ItemIndex of
    0 : strTMP := strTMP + ' AND PROD_ATIVO = 1';
    1 : strTMP := strTMP + ' AND PROD_ATIVO = 0';
  end;
  Result := strTMP;
end;

procedure TfProdutos.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      btnFlat.Caption      := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqFornec.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfProdutos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmProdutos.cdsProdutos;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_Produtos;
  with fCad_Produtos do begin
    cdsLocal        := dmProdutos.cdsProdutos;
    funcLocal       := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
  btnImprimir.Tag     := 424;
end;

procedure TfProdutos.FormShow(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmProdutos.cdsProdutos;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro     := fCad_Produtos;
  with fCad_Produtos do begin
    cdsLocal       := dmProdutos.cdsProdutos;
    funcLocal      := Self.funcBasico;
  end;
  btnNovo.Enabled  := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                      funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                      funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfProdutos.OpenClientDataSet(intPos : Integer);
begin
  with dmProdutos do begin
    case intPos of
      1 : begin
        with cdsProdutos do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

procedure TfProdutos.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('PROD_ATIVO') then begin
    if cdsGeral.FieldByName('PROD_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('PROD_ATIVO').AsInteger = 0 then begin
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
end;

initialization
  RegisterClass(TfProdutos);
finalization
  UnRegisterClass(TfProdutos);

end.
