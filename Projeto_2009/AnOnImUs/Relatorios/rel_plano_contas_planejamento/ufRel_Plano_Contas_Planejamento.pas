unit ufRel_Plano_Contas_Planejamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, rxCurrEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Plano_Contas_Planejamento = class(TfBasico)
    Panel1: TPanel;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    rdConciliado: TRadioGroup;
    rdOrdena: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    cmbAnoI: TComboBox;
    cmbAnoF: TComboBox;
    frPesqPlanoContas: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    function GeraSQL: String;
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Plano_Contas_Planejamento: TfRel_Plano_Contas_Planejamento;

implementation

uses udmRel_Plano_Contas_Planejamento,
  ufRel_Plano_Contas_Planejamento_Sintetico;

{$R *.dfm}

procedure TfRel_Plano_Contas_Planejamento.btnNovoClick(Sender: TObject);
begin
  if funcBasico.EmpresasBloqueada() then Exit;
  if StrToInt(cmbAnoF.Text) < StrToInt(cmbAnoI.Text) then begin
    funcBasico.Alerta('Período informado inválido.',1);
    cmbAnoI.SetFocus;
    Exit;
  end;
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Plano_Contas_Planejamento.cdsRel_Planejamento_Anual do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          if fRel_Planejamento_Anual_Sintetico = nil then
            fRel_Planejamento_Anual_Sintetico := TfRel_Planejamento_Anual_Sintetico.Create(nil);
          with fRel_Planejamento_Anual_Sintetico do begin
            lbTit01.Caption  := 'Ano: ';
            lbFild01.Caption := cmbAnoI.Text + ' à ' + cmbAnoF.Text;
            lbTit02.Caption  := 'Ordenado: ';
            lbFild02.Caption := rdOrdena.Items[rdOrdena.ItemIndex];
            lbTit03.Caption  := 'Conciliados: ';
            lbFild03.Caption := rdConciliado.Items[rdConciliado.ItemIndex];
            intAnoI          := StrToInt(cmbAnoI.Text);
            intAnoF          := StrToInt(cmbAnoF.Text);
            boolVisual       := CheckBox1.Checked;
          end;
          case rdOpcao_Impressao.ItemIndex of
            0 : fRel_Planejamento_Anual_Sintetico.qrepRelatorio.Preview;
            1 : fRel_Planejamento_Anual_Sintetico.qrepRelatorio.Print;
          end;
        finally
          FreeAndNil(fRel_Plano_Contas_Planejamento);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',1);
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_Plano_Contas_Planejamento.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add('SELECT');
      Add('      PJ.PCPJ_ID,');
      Add('      PJ.PCPJ_EMPR_ID,');
      Add('      PJ.PCPJ_PLCT_ID,');
      Add('      PJ.PCPJ_PLCT_EMPR_ID,');
      Add('      PJ.PCPJ_ANO,');
      Add('      PJ.PCPJ_MES_01,');
      Add('      PJ.PCPJ_MES_02,');
      Add('      PJ.PCPJ_MES_03,');
      Add('      PJ.PCPJ_MES_04,');
      Add('      PJ.PCPJ_MES_05,');
      Add('      PJ.PCPJ_MES_06,');
      Add('      PJ.PCPJ_MES_07,');
      Add('      PJ.PCPJ_MES_08,');
      Add('      PJ.PCPJ_MES_09,');
      Add('      PJ.PCPJ_MES_10,');
      Add('      PJ.PCPJ_MES_11,');
      Add('      PJ.PCPJ_MES_12,');
      Add('      PJ.PCPJ_DTA_CADASTRO,');
      Add('      PJ.PCPJ_USER_ID,');
      Add('      PJ.PCPJ_CONCILIADO,');
      Add('      CASE PJ.PCPJ_CONCILIADO');
      Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
      Add('           WHEN 0 THEN ' + QuotedStr('Não'));
      Add('      END AS CONCILIADO,');
      Add('      PL.PLCT_COD_SIMPLIFICADO,');
      Add('      PL.PLCT_DESCRICAO');
      Add('FROM  PLANO_CONTAS_PLANEJAMENTO PJ');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID      = PJ.PCPJ_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID = PJ.PCPJ_PLCT_EMPR_ID)');
      Add('WHERE PJ.PCPJ_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   PJ.PCPJ_PLCT_ID <> 155');
      if StrToInt(cmbAnoI.Text) > 0 then
        Add('AND PJ.PCPJ_ANO >= ' + cmbAnoI.Text);
      if StrToInt(cmbAnoF.Text) > 0 then
        Add('AND PJ.PCPJ_ANO <= ' + cmbAnoF.Text);

      if frPesqPlanoContas.TemRegistros then
        Add('AND PJ.PCPJ_PLCT_ID ' + frPesqPlanoContas.InGrid());

      case rdConciliado.ItemIndex of
        0 : Add('AND PJ.PCPJ_CONCILIADO = 1');
        1 : Add('AND PJ.PCPJ_CONCILIADO = 0');
      end;
      Add('ORDER BY PJ.PCPJ_ANO,');
      case rdOrdena.ItemIndex of
        0 : Add('PL.PLCT_COD_SIMPLIFICADO');
        1 : Add('PL.PLCT_DESCRICAO');
        2 : Add('PJ.PCPJ_CONCILIADO');
      end;
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Plano_Contas_Planejamento.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Plano_Contas_Planejamento = nil then
    dmRel_Plano_Contas_Planejamento := TdmRel_Plano_Contas_Planejamento.Create(NIl);
  cdsGeral     := dmRel_Plano_Contas_Planejamento.cdsRel_Planejamento_Anual;
  inherited;
end;

procedure TfRel_Plano_Contas_Planejamento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Plano_Contas_Planejamento.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnImprimir.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
end;

procedure TfRel_Plano_Contas_Planejamento.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := 5 downto 1 do begin
    cmbAnoI.Items.Add(IntToStr(Ano - intI));
    cmbAnoF.Items.Add(IntToStr(Ano - intI));
  end;
  cmbAnoI.Items.Add(IntToStr(Ano));
  cmbAnoF.Items.Add(IntToStr(Ano));
  cmbAnoI.ItemIndex := 5;
  cmbAnoF.ItemIndex := 5;
  for intI := 1 to 5 do begin
    cmbAnoI.Items.Add(IntToStr(Ano + intI));
    cmbAnoF.Items.Add(IntToStr(Ano + intI));
  end;
end;

procedure TfRel_Plano_Contas_Planejamento.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas_Planejamento.grdBasicoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas_Planejamento.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas_Planejamento.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Plano_Contas_Planejamento);
finalization
  UnRegisterClass(TfRel_Plano_Contas_Planejamento);

end.
