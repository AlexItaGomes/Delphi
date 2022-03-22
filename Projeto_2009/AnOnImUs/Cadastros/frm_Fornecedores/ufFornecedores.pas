 unit ufFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, ExtCtrls, Funcoes, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, uFrPesqIndividual, Mask, rxToolEdit, frxClass, frxDBSet, frxDesgn;

type
  TfFornecedores = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    rdAtivo: TRadioGroup;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox6: TGroupBox;
    edtDtCadInicial: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqFornec: TfrPesqIndividual;
    rdTipo: TRadioGroup;
    frPesqPraca: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure OpenClientDataSet;
    function GerarFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFornecedores: TfFornecedores;

implementation

uses udmFornecedores, ufCad_Fornecedores;

{$R *.dfm}

procedure TfFornecedores.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  rdTipo.ItemIndex  := 2;
  rdAtivo.ItemIndex := 2;
  cdsGeral.Filtered := false;
  frPesqFornec.Limpar;
  frPesqPraca.Limpar;
  frPesqFornec.SetFocus;
end;

procedure TfFornecedores.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  with cdsGeral do begin
    Filtered := false;
    Filter   := GerarFilter;
    Filtered := true;
  end;
end;

function TfFornecedores.GerarFilter : String;
var
  strFilter : String;
begin
  strFilter := 'FORN_ID > 0';
  if frPesqFornec.TemRegistro then
    strFilter := strFilter + ' AND FORN_ID ' + frPesqFornec.InGrid();
  if frPesqPraca.TemRegistro then
    strFilter := strFilter + ' AND FORN_GENE_ID_PRACA ' + frPesqPraca.InGrid();
  if edtDtCadInicial.Date > 0 then
    strFilter := strFilter + ' AND FORN_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtCadInicial.Date));
  if edtDtCadFim.Date > 0 then
    strFilter := strFilter + ' AND FORN_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtCadFim.Date));
  case rdTipo.ItemIndex of
    0 : strFilter := strFilter + ' AND FORN_TIPO = ' + QuotedStr('F');
    1 : strFilter := strFilter + ' AND FORN_TIPO = ' + QuotedStr('J');
  end;
  case rdAtivo.ItemIndex of
    0 : strFilter := strFilter + ' AND FORN_ATIVO = 1';
    1 : strFilter := strFilter + ' AND FORN_ATIVO = 0';
  end;
  Result := strFilter;
end;

procedure TfFornecedores.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqFornec.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfFornecedores.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmFornecedores.cdsFornecedores;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro    := fCad_Fornecedores;
  with fCad_Fornecedores do begin
    cdsLocal      := dmFornecedores.cdsFornecedores;
    funcLocal     := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
end;

procedure TfFornecedores.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfFornecedores.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('FORN_ATIVO') then begin
    if cdsGeral.FieldByName('FORN_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('FORN_ATIVO').AsInteger = 0 then begin
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

procedure TfFornecedores.OpenClientDataSet;
begin
  with dmFornecedores do begin
    with cdsFornecedores do begin
      Close;
      Open;
    end;
    with cdsPesq_Praca do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfFornecedores);
finalization
  UnRegisterClass(TfFornecedores);

end.
