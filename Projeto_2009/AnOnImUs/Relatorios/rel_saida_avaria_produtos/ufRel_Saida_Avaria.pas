unit ufRel_Saida_Avaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa;

type
  TfRel_Saida_Avaria = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdStatus: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    frPesqSaidaAvaria: TfrPesquisa;
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
  fRel_Saida_Avaria: TfRel_Saida_Avaria;

implementation

uses udmRel_Saida_Avaria, ufRel_Saida_Avaria_Analitico;

{$R *.dfm}

procedure TfRel_Saida_Avaria.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Saida_Avaria.cdsRelSaidaAvaria do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          if fRel_Saida_Avaria_Analitica = nil then
            fRel_Saida_Avaria_Analitica := TfRel_Saida_Avaria_Analitica.Create(nil);
          with fRel_Saida_Avaria_Analitica do begin
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
          FreeAndNil(fRel_Saida_Avaria_Analitica);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',0);
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

procedure TfRel_Saida_Avaria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

function TfRel_Saida_Avaria.GeraSQL: String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      SIAV_ID,');
        Add('      SIAV_EMPR_ID,');
        Add('      SIAV_NR_DOCUMENTO,');
        Add('      CASE SIAV_CONCILIADO');
        Add('           WHEN 0 THEN ' + QuotedStr('Aberto'));
        Add('           WHEN 1 THEN ' + QuotedStr('Conciliado'));
        Add('           WHEN 2 THEN ' + QuotedStr('Cancelado'));
        Add('      END AS SIAV_CONCILIADO,');
        Add('      SIAV_VLR_TOTAL,');
        Add('      SIAV_OBS,');
        Add('      SIAV_DTA_CADASTRO,');
        Add('      SIAV_USER_ID');
        Add('FROM  SAIDA_AVARIA');
        Add('WHERE SIAV_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqSaidaAvaria.TemRegistros then
          Add('AND SIAV_ID ' + frPesqSaidaAvaria.InGrid());
        if edtDtInicio.Date > 0 then begin
          Add('AND SIAV_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        end;
        if edtDtFim.Date > 0 then begin
          Add('AND SIAV_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        end;
        case rdStatus.ItemIndex of
          0 : Add('AND SIAV_CONCILIADO = 0');
          1 : Add('AND SIAV_CONCILIADO = 1');
          2 : Add('AND SIAV_CONCILIADO = 2');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY SIAV_ID');
          1 : Add('ORDER BY SIAV_NR_DOCUMENTO');
          2 : Add('ORDER BY SIAV_CONCILIADO');
          3 : Add('ORDER BY SIAV_DTA_CADASTRO');
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

procedure TfRel_Saida_Avaria.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Saida_Avaria.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Saida_Avaria.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Saida_Avaria);
finalization
  UnRegisterClass(TfRel_Saida_Avaria);

end.
