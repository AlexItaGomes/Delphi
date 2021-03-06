unit ufRel_Grupos_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Grupos_Produtos = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqGrupo: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Grupos_Produtos: TfRel_Grupos_Produtos;

implementation

uses udmRel_Grupos_Produtos;

{$R *.dfm}

procedure TfRel_Grupos_Produtos.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Grupos_Produtos.cdsRelGrupos do begin
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
        funcBasico.Alerta('N?o h? registros a serem impressos.',0);
      end;
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Grupos_Produtos.GeraSQL : String;
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
      Add('AND   GENE_TGEN_ID = 503');
      if frPesqGrupo.TemRegistros then
        Add('AND GENE_ID ' + frPesqGrupo.InGrid());
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

procedure TfRel_Grupos_Produtos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
end;

procedure TfRel_Grupos_Produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

procedure TfRel_Grupos_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  frPesqGrupo.SetFocus;
end;

procedure TfRel_Grupos_Produtos.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Grupos_Produtos.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Grupos_Produtos.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Grupos_Produtos);
finalization
  UnRegisterClass(TfRel_Grupos_Produtos);

end.

