unit ufControle_Obras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  DBCtrls, Mask, rxToolEdit, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfControle_Obras = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    lblMsg: TLabel;
    btnPesqFornec: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    edtCodFornec: TEdit;
    edtFornecedor: TEdit;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edtDtPrevInicio: TDateEdit;
    edtDtPrevFim: TDateEdit;
    GroupBox2: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdStatus: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnPesqFornecClick(Sender: TObject);
    procedure edtCodFornecKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodFornecExit(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos : Integer = 99);
    function GeraFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fControle_Obras: TfControle_Obras;

implementation

uses udmControle_Obras, ufCadObras;

{$R *.dfm}

procedure TfControle_Obras.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  inherited;
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  rdStatus.ItemIndex := 5;
  edtCodFornec.SetFocus;
  cdsGeral.Filtered := false;
end;

procedure TfControle_Obras.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  with cdsGeral do begin
    Filtered := false;
    Filter   := GeraFilter;
    Filtered := true;
  end;
end;

function TfControle_Obras.GeraFilter : String;
begin
  Result := 'OBRA_ID > 0';
  if edtCodFornec.Text <> '' then
    Result := Result + ' AND OBRA_ID = ' + edtCodFornec.Text;
  if edtDtPrevInicio.Date > 0 then
    Result := Result + ' AND OBRA_DTA_PREV_INICIO_OBRA >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtPrevInicio.Date));
  if edtDtPrevFim.Date > 0 then
    Result := Result + ' AND OBRA_DTA_PREV_INICIO_OBRA <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtPrevFim.Date));
  if edtDtInicio.Date > 0 then
    Result := Result + ' AND OBRA_DTA_INICIO_OBRA >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtInicio.Date));
  if edtDtFim.Date > 0 then
    Result := Result + ' AND OBRA_DTA_INICIO_OBRA <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtFim.Date));
  case rdStatus.ItemIndex of
    0..4 : Result := Result + ' AND OBRA_STATUS = ' + IntToStr(rdStatus.ItemIndex)
  end;
end;

procedure TfControle_Obras.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      lblMsg.Caption      := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      edtCodFornec.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      lblMsg.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfControle_Obras.btnPesqFornecClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(2);
  strTMP := funcBasico.Busca_Registro(dmControle_Obras.cdsPesqObra,'','OBRA_ID;OBRA_DESCRICAO','');
  if strTMP <> '' then begin
    edtCodFornec.Text  := funcBasico.Buscar_Coluna(strTMP,1);
    edtFornecedor.Text := funcBasico.Buscar_Coluna(strTMP,2);
    edtCodFornec.Modified := true;
  end else begin
    edtCodFornec.Clear;
    edtFornecedor.Clear;
  end;
  edtCodFornec.SetFocus;
end;

procedure TfControle_Obras.edtCodFornecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodFornec.Modified then Exit;
  OpenClientDataSet(2);
  if edtCodFornec.Text <> '' then begin
    strTMP := funcBasico.Busca_Registro(dmControle_Obras.cdsPesqObra,'','OBRA_ID;OBRA_DESCRICAO','OBRA_ID = ' + edtCodFornec.Text);
    if strTMP <> '' then begin
      edtCodFornec.Text  := funcBasico.Buscar_Coluna(strTMP,1);
      edtFornecedor.Text := funcBasico.Buscar_Coluna(strTMP,2);
    end else begin
      edtCodFornec.Clear;
      edtFornecedor.Clear;
    end;
  end else begin
    edtCodFornec.Clear;
    edtFornecedor.Clear;
  end;
end;

procedure TfControle_Obras.edtCodFornecKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key,['0'..'9',#8]) then Key := #0;
end;

procedure TfControle_Obras.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmControle_Obras.cdsControle_Obras;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadObras;
  with fCadObras do begin
    cdsLocal     := dmControle_Obras.cdsControle_Obras;
    funcLocal    := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
  btnImprimir.Tag     := 0;
end;

procedure TfControle_Obras.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('OBRA_STATUS') then begin
    case cdsGeral.FieldByName('OBRA_STATUS').AsInteger of
      0 : begin ///Aguardando
        grdBasico.Canvas.Brush.Color := clGray;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Aguardando     ');
      end;
      1 : begin ///Em Construção
        grdBasico.Canvas.Brush.Color := clGreen;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Em Construção  ');
      end;
      2 : begin ///Paralisada
        grdBasico.Canvas.Brush.Color := $0000A8A8;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Paralisada     ');
      end;
      3 : begin ///Finalizada
        grdBasico.Canvas.Brush.Color := $000080FF;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Finalizada     ');
      end;
      4 : begin ///Cancelada
        grdBasico.Canvas.Brush.Color := clRed;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Cancelado      ');
      end;
      else begin ///Sem Registro
        grdBasico.Canvas.Brush.Color := clWhite;
        grdBasico.Canvas.Font.Style := [fsBold];
        grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
        grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Registro   ');
      end;
    end;
  end;
end;

procedure TfControle_Obras.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmControle_Obras do begin
    case intPos of
      1 : begin
        with cdsControle_Obras do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsPesqObra do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfControle_Obras);

finalization
  UnRegisterClass(TfControle_Obras);

end.
