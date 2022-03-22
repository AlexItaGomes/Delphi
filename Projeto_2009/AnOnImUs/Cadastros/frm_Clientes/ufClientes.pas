unit ufClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, Mask, rxToolEdit, uFrPesqIndividual, frxClass, frxDesgn, frxDBSet,
  ufrPesqDuplo;

type
  TfClientes = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    rdAtivo: TRadioGroup;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    GroupBox6: TGroupBox;
    edtDtCadInicial: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqPraca: TfrPesqIndividual;
    rdTipo: TRadioGroup;
    frPesqDuplo: TfrPesqDuplo;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFlatClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure frPesqPracabtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GeraFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClientes: TfClientes;

implementation

uses udmClientes, ufCad_Clientes;

{$R *.dfm}

procedure TfClientes.btnLimparClick(Sender: TObject);
var
  intI : Integer;
  intII : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
    if (Components[intI] is TfrPesqDuplo) then begin
      for intII := 0 to (Components[intI] as TfrPesqDuplo).ComponentCount -1 do begin
        if ((Components[intI] as TfrPesqDuplo).Components[intII] is TfrPesqIndividual) then
          ((Components[intI] as TfrPesqDuplo).Components[intII] as TfrPesqIndividual).Limpar;
      end;
    end;
  end;
  rdAtivo.ItemIndex := 2;
  rdTipo.ItemIndex  := 2;
  cdsGeral.Filtered := false;
end;

procedure TfClientes.btnFiltrarClick(Sender: TObject);
begin
  GeraFilter;
end;

function TfClientes.GeraFilter : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add(funcBasico.InstrucaoSQLCliente);
      if frPesqCliente.TemRegistro then
        Add('AND CLIE_ID ' + frPesqCliente.InGrid());
      if frPesqPraca.TemRegistro then
        Add('AND CLIE_GENE_ID_PRACA ' + frPesqPraca.InGrid());
      if frPesqDuplo.frPesqPrimeiro.TemRegistro then
        Add('AND CLIE_GENE_ID_ROTA ' + frPesqDuplo.frPesqPrimeiro.InGrid());
      if edtDtCadInicial.Date > 0 then
        Add('AND CLIE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicial.Date)));
      if edtDtCadFim.Date > 0 then
        Add('AND CLIE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date)));
      case rdAtivo.ItemIndex of
        0 : Add('AND CLIE_ATIVO = 1');
        1 : Add('AND CLIE_ATIVO = 0');
      end;
      case rdTipo.ItemIndex of
        0 : Add('AND CLIE_TIPO = ' + QuotedStr('F'));
        1 : Add('AND CLIE_TIPO = ' + QuotedStr('J'));
      end;
      Add('ORDER BY CL.CLIE_FANTASIA');

      with dmClientes.cdsClientes do begin
        Close;
        CommandText := ( sltTMP.Text );
        Open;
      end;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfClientes.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfClientes.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral        := dmClientes.cdsClientes;
  inherited;
  formCadastro   := fCad_Clientes;
  with fCad_Clientes do begin
    cdsLocal                := dmClientes.cdsClientes;
    fCad_Clientes.funcLocal := Self.funcBasico;
  end;
  btnImprimir.Tag    := 234;
  panelFiltros.Height := 27 ;
end;

procedure TfClientes.FormShow(Sender: TObject);
begin
  inherited;
  if not funcBasico.OcultaClientes then btnFiltrar.Click;
end;

procedure TfClientes.frPesqPracabtnInserirClick(Sender: TObject);
begin
  inherited;
  frPesqPraca.btnInserirClick(Sender);
end;

procedure TfClientes.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('CLIE_ATIVO') then begin
    if cdsGeral.FieldByName('CLIE_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('CLIE_ATIVO').AsInteger = 0 then begin
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

procedure TfClientes.Label2Click(Sender: TObject);
begin
  inherited;
  funcBasico.ExecutaRotina(153);
end;

procedure TfClientes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Label2Click(Sender);
end;

initialization
  RegisterClass(TfClientes);
finalization
  UnRegisterClass(TfClientes);

end.
