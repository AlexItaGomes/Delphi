unit ufGraf_Resumo_Diario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  TeEngine, Series, TeeProcs, Chart, SQLExpr, Menus, frxClass, frxDBSet,
  frxDesgn, VclTee.TeeGDIPlus;

type
  TfGraf_Resumo_Diario = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    cmbMes: TComboBox;
    Chart2: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Resumo_Diario: TfGraf_Resumo_Diario;

implementation

{$R *.dfm}

procedure TfGraf_Resumo_Diario.btnFiltrarClick(Sender: TObject);
var
  arrayDiasCred,
  arrayDiasDeb  : array[1..31] of Real;
  intI : Integer;
  fltCred, fltDeb : Real;

{$REGION 'CarregaValores'}
  procedure CarregaValores;
  var
    qryCons : TSQLQuery;
  begin
    try
      fltCred := 0; fltDeb := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      EXTRACT(DAY FROM AC.ACRE_DTA_CADASTRO) DIA,');
          sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) VALOR');
          sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_RECEBER CR');
          sql.Add('ON (CR.CREC_ID            = AC.ACRE_CREC_ID');
          sql.Add('AND CR.CREC_EMPR_ID       = AC.ACRE_CREC_EMPR_ID)');
          sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = ' + IntToStr(cmbMes.ItemIndex));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
          sql.Add('GROUP BY');
          sql.Add('      1');
          Open;
          First;
          while not eof do begin
            arrayDiasCred[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
            fltCred := fltCred + qryCons.Fields[1].AsFloat;
            Next;
          end;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      EXTRACT(DAY FROM AC.ACPG_DTA_CADASTRO) DIA,');
          sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) VALOR');
          sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
          sql.Add('INNER JOIN CONTAS_PAGAR CP');
          sql.Add('ON (CP.CPAG_ID            = AC.ACPG_CPAG_ID');
          sql.Add('AND CP.CPAG_EMPR_ID       = AC.ACPG_CPAG_EMPR_ID)');
          sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
          sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = ' + IntToStr(cmbMes.ItemIndex));
          sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
          sql.Add('GROUP BY');
          sql.Add('      1');
          Open;
          First;
          while not eof do begin
            arrayDiasDeb[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
            fltDeb := fltDeb + qryCons.Fields[1].AsFloat;
            Next;
          end;
        end;
      except on e: exception do begin
        funcBasico.ReportaErro('TfGraf_Resumo_Diario','CarregaValores',e.Message);
        funcBasico.Alerta('Erro no processo de leitura das informações.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  if cmbMes.ItemIndex = 0 then begin
    funcBasico.Alerta('Informe o mês antes de continuar.',0);
    Exit;
  end;
  for intI := 1 to 31 do begin
    arrayDiasCred[intI] := 0;
    arrayDiasDeb[intI]  := 0;
  end;
  CarregaValores;
  with Chart2 do begin
    Series[0].Clear;
    Series[1].Clear;
    Series[0].Title := 'Crédito R$: ' + FormatFloat('###,###,##0.00',fltCred);
    Series[1].Title := 'Débito R$: ' + FormatFloat('###,###,##0.00',fltDeb);
    for intI := 1 to 31 do begin
      Series[0].Add(StrToFloat(FormatFloat('0.00',arrayDiasCred[intI])),IntToStr(intI),clBlue);
      Series[1].Add(StrToFloat(FormatFloat('0.00',arrayDiasDeb[intI])),IntToStr(intI),clRed);
    end;
  end;
end;

procedure TfGraf_Resumo_Diario.FormCreate(Sender: TObject);
var
  intI,
  intII : Integer;
begin
  inherited;
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TChart) then begin
      for intII := 0 to (Components[intI] as TChart).SeriesCount - 1 do
        (Components[intI] as TChart).Series[intII].Clear;
    end;
  end;
end;

procedure TfGraf_Resumo_Diario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

procedure TfGraf_Resumo_Diario.FormShow(Sender: TObject);
var
  Dia,Mes,Ano : Word;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  CarregaCombo;
  cmbMes.ItemIndex := Mes;
  btnFiltrar.Click;
end;

procedure TfGraf_Resumo_Diario.CarregaCombo;
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

procedure TfGraf_Resumo_Diario.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfGraf_Resumo_Diario.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;

end;

procedure TfGraf_Resumo_Diario.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;

end;

initialization
  RegisterClass(TfGraf_Resumo_Diario);
finalization
  UnRegisterClass(TfGraf_Resumo_Diario);

end.
