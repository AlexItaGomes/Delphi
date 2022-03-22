unit ufTransf_Servicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesqIndividual, frxClass, frxDBSet, frxDesgn;

type
  TfTransf_Servicos = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    lbDtInstalacao: TGroupBox;
    edtDtInstalInicio: TDateEdit;
    edtDtInstalFim: TDateEdit;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    lbDtCad: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqTecDestino: TfrPesqIndividual;
    frPesqTecOrigem: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function GeraFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTransf_Servicos: TfTransf_Servicos;

implementation

uses udmTransf_Servicos, ufCad_Transf_Servico;

{$R *.dfm}

procedure TfTransf_Servicos.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  frPesqCliente.SetFocus;
  cdsGeral.Filtered := false;
end;

procedure TfTransf_Servicos.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  with cdsGeral do begin
    Filtered := false;
    Filter   := GeraFilter;
    Filtered := true;
  end;
end;

function TfTransf_Servicos.GeraFilter : String;
var
  strTMP : String;
begin
  try
    Result := '';
    strTMP := 'OSTF_ID > 0';
    if frPesqCliente.TemRegistro  then
      strTMP := strTMP + ' AND OSTF_ORDS_CLIE_ID ' + frPesqCliente.InGrid();
    if frPesqTecOrigem.TemRegistro then
      strTMP := strTMP + ' AND OSTF_USER_ID_TEC_ORIG ' + frPesqTecOrigem.InGrid();
    if frPesqTecDestino.TemRegistro then
      strTMP := strTMP + ' AND OSTF_USER_ID_TEC_DEST ' + frPesqTecDestino.InGrid();
    if edtDtCadInicio.Date > 0 then
      strTMP := strTMP + ' AND OSTF_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicio.Date));
    if edtDtCadFim.Date > 0 then
      strTMP := strTMP + ' AND OSTF_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date));
    if edtDtInstalInicio.Date > 0 then
      strTMP := strTMP + ' AND ORDS_DTA_INSTALACAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInstalInicio.Date));
    if edtDtInstalFim.Date > 0 then
      strTMP := strTMP + ' AND ORDS_DTA_INSTALACAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInstalFim.Date));
    Result   := strTMP;
  finally
  end;
end;

procedure TfTransf_Servicos.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
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

procedure TfTransf_Servicos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmTranf_Servicos.cdsTransf;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_Transf_Servicos;
  with fCad_Transf_Servicos do begin
    cdsLocal        := dmTranf_Servicos.cdsTransf;
    funcLocal       := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
  btnImprimir.Tag     := 0;
end;

procedure TfTransf_Servicos.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled     := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                         funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                         funcBasico.GetLicenca(5);
  btnEditar.Enabled   := btnNovo.Enabled;
end;

procedure TfTransf_Servicos.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTranf_Servicos do begin
    case intPos of
      1 : begin
        with cdsTransf do begin
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

initialization
  RegisterClass(TfTransf_Servicos);
finalization
  UnRegisterClass(TfTransf_Servicos);

end.
