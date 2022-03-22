unit uGraf_Evolutivo_Plano_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons, uFrPesqIndividual, TeEngine, Series, SQLExpr,
  TeeProcs, Chart, TeeFunci, VclTee.TeeGDIPlus;

type
  TfGraf_Evolutivo_Plano_Contas = class(TfBasico)
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    frPesqPlanoContas: TfrPesqIndividual;
    Label2: TLabel;
    chtPlanejamento: TChart;
    BarSeries1: TBarSeries;
    AddTeeFunction1: TAddTeeFunction;
    BarSeries2: TBarSeries;
    Label3: TLabel;
    chAno: TChart;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    AddTeeFunction2: TAddTeeFunction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure frPesqPlanoContasedtCodigoExit(Sender: TObject);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Evolutivo_Plano_Contas: TfGraf_Evolutivo_Plano_Contas;

implementation

{$R *.dfm}

procedure TfGraf_Evolutivo_Plano_Contas.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Evolutivo_Plano_Contas.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  chtPlanejamento.Series[0].Clear;
  chAno.Series[0].Clear;
  frPesqPlanoContas.SetFocus;
end;

procedure TfGraf_Evolutivo_Plano_Contas.frPesqPlanoContasedtCodigoExit(
  Sender: TObject);
begin
  inherited;
  frPesqPlanoContas.edtCodigoExit(Sender);
  if frPesqPlanoContas.TemRegistro then
    btnFiltrar.Click;
end;

procedure TfGraf_Evolutivo_Plano_Contas.btnFiltrarClick(Sender: TObject);
var
  floatRealizado: array[1..12] of Real;
  intI      : Integer;
  fltTotal  : Real;
  sltValor  : TStringList;
  Mes       : Integer;

procedure CarregaAno(strAno : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO),');
        sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
        sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
        sql.Add('INNER JOIN CONTAS_PAGAR CP');
        sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
        sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
        sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) IN (' + Trim(strAno)+')');
        sql.Add('AND   CP.CPAG_PLCT_ID                         = ' + frPesqPlanoContas.InGrid());
        sql.Add('GROUP BY');
        sql.Add('      1');
        sql.Add('');
        sql.Add('UNION ALL');
        sql.Add('');
        sql.Add('SELECT');
        sql.Add('      EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO),');
        sql.Add('      (COALESCE(SUM(AC.ACRE_VALOR_DOC * -1),0)*-1)');
        sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
        sql.Add('INNER JOIN CONTAS_RECEBER CR');
        sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
        sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
        sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CR.CREC_STATUS                         <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) IN (' + Trim(strAno)+')');
        sql.Add('AND   CR.CREC_PLCT_ID                         = ' + frPesqPlanoContas.InGrid());
        sql.Add('GROUP BY');
        sql.Add('      1');
        Open;
        if not IsEmpty then begin
          First;
          sltValor.Add(Fields[1].AsString);
        end else begin
          sltValor.Add('0,00');
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'CarregaRealizado',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure CarregaRealizado;
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO),');
        sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
        sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
        sql.Add('INNER JOIN CONTAS_PAGAR CP');
        sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
        sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
        sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + Trim(cmbAno.Text));
        sql.Add('AND   CP.CPAG_PLCT_ID                         = ' + frPesqPlanoContas.InGrid());
        sql.Add('GROUP BY');
        sql.Add('      1');
        sql.Add('');
        sql.Add('UNION ALL');
        sql.Add('');
        sql.Add('SELECT');
        sql.Add('      EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO),');
        sql.Add('      (COALESCE(SUM(AC.ACRE_VALOR_DOC * -1),0)*-1)');
        sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
        sql.Add('INNER JOIN CONTAS_RECEBER CR');
        sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
        sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
        sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CR.CREC_STATUS                         <> ' + QuotedStr('C'));
        sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + Trim(cmbAno.Text));
        sql.Add('AND   CR.CREC_PLCT_ID                         = ' + frPesqPlanoContas.InGrid());
        sql.Add('GROUP BY');
        sql.Add('      1');
        Open;
        if not IsEmpty then begin
          First;
          while not Eof do begin
            floatRealizado[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'CarregaRealizado',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  try
    funcBasico.MSGAguarde();
    inherited;
    if not frPesqPlanoContas.TemRegistro then begin
      funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Informe um plano de contas antes de continuar!',0);
      Exit;
    end;
    try
      sltValor := TStringList.Create;
      for intI := 1 to 12 do
        floatRealizado[intI] := 0;
      CarregaRealizado;
      with chtPlanejamento do begin
        Series[0].Clear;
        Series[0].Add(floatRealizado[01] ,'Jan',clBlue);
        Series[0].Add(floatRealizado[02] ,'Fev',clBlue);
        Series[0].Add(floatRealizado[03] ,'Mar',clBlue);
        Series[0].Add(floatRealizado[04] ,'Abr',clBlue);
        Series[0].Add(floatRealizado[05] ,'Mai',clBlue);
        Series[0].Add(floatRealizado[06] ,'Jun',clBlue);
        Series[0].Add(floatRealizado[07] ,'Jul',clBlue);
        Series[0].Add(floatRealizado[08] ,'Ago',clBlue);
        Series[0].Add(floatRealizado[09] ,'Set',clBlue);
        Series[0].Add(floatRealizado[10] ,'Out',clBlue);
        Series[0].Add(floatRealizado[11] ,'Nov',clBlue);
        Series[0].Add(floatRealizado[12] ,'Dez',clBlue);
        Refresh;
        Repaint;
      end;
      fltTotal := 0;
      for intI := 1 to 12 do
        fltTotal := fltTotal + floatRealizado[intI]; Mes := funcBasico.Se(cmbAno.Text <> FormatDateTime('yyyy',funcBasico.DataServidor()),12,StrToInt(FormatDateTime('mm',funcBasico.DataServidor())));
      Label3.Caption := 'Total Ano R$ ' + FormatFloat('###,###,##0.00',fltTotal) + ' / Média Mês R$ ' + FormatFloat('###,###,##0.00',(fltTotal/Mes));
      for intI := (StrToInt(cmbAno.Text)-2) to StrToInt(cmbAno.Text) do
        CarregaAno(IntToStr(intI));

      with chAno do begin
        Series[0].Clear;
        Series[0].Add(StrToFloat(sltValor.Strings[0]), IntToStr(StrToInt(cmbAno.Text)-2) ,clGreen);
        Series[0].Add(StrToFloat(sltValor.Strings[1]), IntToStr(StrToInt(cmbAno.Text)-1) ,clGreen);
        Series[0].Add(StrToFloat(sltValor.Strings[2]), IntToStr(StrToInt(cmbAno.Text)) ,clGreen);
      end;
    finally
      FreeAndNil(sltValor);
    end;
  finally
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Evolutivo_Plano_Contas.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := 5 downto 1 do
    cmbAno.Items.Add(IntToStr(Ano - intI));
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 5;
  for intI := 1 to 5 do
    cmbAno.Items.Add(IntToStr(Ano + intI));
  cmbAno.SetFocus;
end;

initialization
  RegisterClass(TfGraf_Evolutivo_Plano_Contas);
finalization
  UnRegisterClass(TfGraf_Evolutivo_Plano_Contas);

end.
