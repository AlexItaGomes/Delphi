unit ufRel_Entrada_Avulsa_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa;

type
  TfRel_Entrada_Avulsa_Produtos = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdStatus: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqEntradaAvulsa: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
  public
    { Public declarations }
  end;

var
  fRel_Entrada_Avulsa_Produtos: TfRel_Entrada_Avulsa_Produtos;

implementation

uses dmRel_Entrada_Avulsa_Produtos, ufRel_Entrada_Avulsa_Produtos_Analitico;

{$R *.dfm}

procedure TfRel_Entrada_Avulsa_Produtos.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Entr_Avulsa_Produtos.cdsRelEntradaAvulsa do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          if fRel_Entr_Avulsa_Produtos_Analitico = nil then
            fRel_Entr_Avulsa_Produtos_Analitico := TfRel_Entr_Avulsa_Produtos_Analitico.Create(nil);
          with fRel_Entr_Avulsa_Produtos_Analitico do begin
            lbTit01.Caption    := 'Status: ';
            lbFild01.Caption   := rdStatus.Items[rdStatus.ItemIndex];
            lbTit02.Caption    := 'Ordenado: ';
            lbFild02.Caption   := rdOrdena.Items[rdOrdena.ItemIndex];
            if (edtDtInicio.Date > 0) or (edtDtFim.Date > 0) then begin
              lbTit03.Caption  := 'Período: ';
              lbFild03.Caption := edtDtInicio.Text + ' à ' + edtDtFim.Text;
            end;
            case rdOpcao_Impressao.ItemIndex of
              0 : qrepRelatorio.Preview;
              1 : qrepRelatorio.Print;
            end;
          end;
        finally
          FreeAndNil(fRel_Entr_Avulsa_Produtos_Analitico);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',0);
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

procedure TfRel_Entrada_Avulsa_Produtos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

function TfRel_Entrada_Avulsa_Produtos.GeraSQL: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      ENAV_ID,');
        Add('      ENAV_EMPR_ID,');
        Add('      ENAV_NR_DOCUMENTO,');
        Add('      CASE ENAV_CONCILIADO');
        Add('           WHEN 0 THEN ' + QuotedStr('Aberto'));
        Add('           WHEN 1 THEN ' + QuotedStr('Conciliado'));
        Add('           WHEN 2 THEN ' + QuotedStr('Cancelado'));
        Add('      END AS ENAV_CONCILIADO,');
        Add('      ENAV_OBS,');
        Add('      ENAV_DTA_CADASTRO,');
        Add('      ENAV_USER_ID');
        Add('FROM  ENTRADA_AVULSA');
        Add('WHERE ENAV_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqEntradaAvulsa.TemRegistros then
          Add('AND ENAV_ID ' + frPesqEntradaAvulsa.InGrid());
        if edtDtInicio.Date > 0 then begin
          Add('AND ENAV_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        end;
        if edtDtFim.Date > 0 then begin
          Add('AND ENAV_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        end;
        case rdStatus.ItemIndex of
          0 : Add('AND ENAV_CONCILIADO = 0');
          1 : Add('AND ENAV_CONCILIADO = 1');
          2 : Add('AND ENAV_CONCILIADO = 2');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY ENAV_ID');
          1 : Add('ORDER BY ENAV_NR_DOCUMENTO');
          2 : Add('ORDER BY ENAV_CONCILIADO');
          3 : Add('ORDER BY ENAV_DTA_CADASTRO');
        end;
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Entrada_Avulsa_Produtos.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Entrada_Avulsa_Produtos.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Entrada_Avulsa_Produtos.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Entrada_Avulsa_Produtos);
finalization
  UnRegisterClass(TfRel_Entrada_Avulsa_Produtos);

end.
