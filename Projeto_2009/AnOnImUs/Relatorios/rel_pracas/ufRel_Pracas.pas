unit ufRel_Pracas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Pracas = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqPracas: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure edtCodPracaKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function GeraSQL: String;
  public
    { Public declarations }
  end;

var
  fRel_Pracas: TfRel_Pracas;

implementation

uses udmRelPracas;

{$R *.dfm}

procedure TfRel_Pracas.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRelPracas.cdsRelPracas do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          with frRelatorio do begin
            TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ordenado: ';
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

function TfRel_Pracas.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      CD.GENE_ID,');
      Add('      CD.GENE_DESCR,');
      Add('      CD.GENE_PAR1,');
      Add('      CD.GENE_PAR2');
      Add('FROM  GENERICA CD');
      Add('WHERE GENE_EMPR_ID = 0');
      Add('AND   GENE_TGEN_ID = 501');

      if frPesqPracas.TemRegistros then
        Add('AND GENE_ID ' + frPesqPracas.InGrid());

      if edtDtInicio.Date > 0 then begin
        Add('AND GENE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      end;
      if edtDtFim.Date > 0 then begin
        Add('AND GENE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      end;
      case rdOrdena.ItemIndex of
        0 : Add('ORDER BY CD.GENE_ID');
        1 : Add('ORDER BY CD.GENE_DESCR');
        2 : Add('ORDER BY CD.GENE_PAR1')
      end;
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Pracas.edtCodPracaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
  inherited;
end;

procedure TfRel_Pracas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
  dstRelatorio.DataSource := dmRelPracas.dsRelPracas;
end;

procedure TfRel_Pracas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0;
  end;
end;

procedure TfRel_Pracas.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
end;

procedure TfRel_Pracas.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Pracas.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Pracas.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Pracas);
finalization
  UnRegisterClass(TfRel_Pracas);

end.
