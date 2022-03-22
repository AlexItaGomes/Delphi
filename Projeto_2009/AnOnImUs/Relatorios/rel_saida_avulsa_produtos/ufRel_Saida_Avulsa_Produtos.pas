unit ufRel_Saida_Avulsa_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet;

type
  TfRel_Saida_Avulsa_Produtos = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdStatus: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqSaidaAvulsa: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure edtCodPracaKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Saida_Avulsa_Produtos: TfRel_Saida_Avulsa_Produtos;

implementation

uses udmRel_Saida_Avulsa_Produtos, ufRel_Saida_Avulsa_Produtos_Analitico;

{$R *.dfm}

procedure TfRel_Saida_Avulsa_Produtos.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Saida_Avulsa_Produtos.cdsRelSaidaAvulsa do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          if fRel_Saida_Avulsa_Prod_Analitico = nil then
            fRel_Saida_Avulsa_Prod_Analitico := TfRel_Saida_Avulsa_Prod_Analitico.Create(nil);
          with fRel_Saida_Avulsa_Prod_Analitico do begin
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
          FreeAndNil(fRel_Saida_Avulsa_Prod_Analitico);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',0);
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Saida_Avulsa_Produtos.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      SAAV_ID,');
        Add('      SAAV_EMPR_ID,');
        Add('      SAAV_NR_DOCUMENTO,');
        Add('      CASE SAAV_CONCILIADO');
        Add('           WHEN 0 THEN ' + QuotedStr('Aberto'));
        Add('           WHEN 1 THEN ' + QuotedStr('Conciliado'));
        Add('           WHEN 2 THEN ' + QuotedStr('Cancelado'));
        Add('      END AS SAAV_CONCILIADO,');
        Add('      SAAV_OBS,');
        Add('      SAAV_DTA_CADASTRO,');
        Add('      SAAV_USER_ID');
        Add('FROM  SAIDA_AVULSA');
        Add('WHERE SAAV_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqSaidaAvulsa.TemRegistros then
          Add('AND SAAV_ID ' + frPesqSaidaAvulsa.InGrid());
        if edtDtInicio.Date > 0 then begin
          Add('AND SAAV_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        end;
        if edtDtFim.Date > 0 then begin
          Add('AND SAAV_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        end;
        case rdStatus.ItemIndex of
          0 : Add('AND SAAV_CONCILIADO = 0');
          1 : Add('AND SAAV_CONCILIADO = 1');
          2 : Add('AND SAAV_CONCILIADO = 2');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY SAAV_ID');
          1 : Add('ORDER BY SAAV_NR_DOCUMENTO');
          2 : Add('ORDER BY SAAV_CONCILIADO');
          3 : Add('ORDER BY SAAV_DTA_CADASTRO');
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

procedure TfRel_Saida_Avulsa_Produtos.edtCodPracaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfRel_Saida_Avulsa_Produtos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
end;

procedure TfRel_Saida_Avulsa_Produtos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

procedure TfRel_Saida_Avulsa_Produtos.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Saida_Avulsa_Produtos.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Saida_Avulsa_Produtos.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Saida_Avulsa_Produtos);
finalization
  UnRegisterClass(TfRel_Saida_Avulsa_Produtos);

end.
