unit ufRel_Marcas_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Marcas_Produtos = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqMarca: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Marcas_Produtos: TfRel_Marcas_Produtos;

implementation

uses udmRel_Marcas_Produtos;

{$R *.dfm}

procedure TfRel_Marcas_Produtos.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Marcas_Produtos.cdsRelMarcas do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          with frRelatorio do begin
            TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ordenado:';
            TfrxMemoView(FindComponent('lbFild01')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
            TfrxMemoView(FindComponent('lbTit02')).Text    := '';
            TfrxMemoView(FindComponent('lbFild02')).Text   := '';
            TfrxMemoView(FindComponent('lbTit03')).Text    := '';
            TfrxMemoView(FindComponent('lbFild03')).Text   := '';
            case rdOpcao_Impressao.ItemIndex of
              0 : frRelatorio.ShowReport();
              1 : frRelatorio.Print;
            end;
          end;
        finally
        end;
      end else begin
        funcBasico.Alerta('Não há registros a serem impressos.',0);
      end;
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

procedure TfRel_Marcas_Produtos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
end;


procedure TfRel_Marcas_Produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

function TfRel_Marcas_Produtos.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CD.GENE_ID,');
      Add('      CD.GENE_DESCR');
      Add('FROM  GENERICA CD');
      Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   GENE_TGEN_ID = 504');
      if frPesqMarca.TemRegistros then
        Add('AND GENE_ID ' + frPesqMarca.InGrid());
      if edtDtInicio.Date > 0 then begin
        Add('AND GENE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      end;
      if edtDtFim.Date > 0 then begin
        Add('AND GENE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      end;
      case rdOrdena.ItemIndex of
        0 : Add('ORDER BY CD.GENE_ID');
        1 : Add('ORDER BY CD.GENE_DESCR');
      end;
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Marcas_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  frPesqMarca.SetFocus;
end;

procedure TfRel_Marcas_Produtos.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Marcas_Produtos.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Marcas_Produtos.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Marcas_Produtos);
finalization
  UnRegisterClass(TfRel_Marcas_Produtos);

end.
