unit ufGraf_Forma_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  TeEngine, TeeFunci, Series, TeeProcs, Chart, SQLExpr, Menus, frxClass,
  frxDBSet, frxDesgn, VclTee.TeeGDIPlus;

type
  TfGraf_Forma_Pagamento = class(TfBasico)
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    rdTipo: TRadioGroup;
    Panel1: TPanel;
    ChartRecebimentos: TChart;
    Series1: TBarSeries;
    TeeFunction1: TAddTeeFunction;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    ChartPagamentos: TChart;
    BarSeries1: TBarSeries;
    AddTeeFunction1: TAddTeeFunction;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    BarSeries5: TBarSeries;
    BarSeries6: TBarSeries;
    BarSeries7: TBarSeries;
    BarSeries8: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Forma_Pagamento: TfGraf_Forma_Pagamento;
  floatRecebimentos : array[1..8] of Real;
  floatPagamentos   : array[1..8] of Real;

implementation

{$R *.dfm}

procedure TfGraf_Forma_Pagamento.FormCreate(Sender: TObject);
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

procedure TfGraf_Forma_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Forma_Pagamento.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnFiltrar.Click;
end;

procedure TfGraf_Forma_Pagamento.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Forma_Pagamento.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfGraf_Forma_Pagamento.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfGraf_Forma_Pagamento.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Forma_Pagamento.btnFiltrarClick(Sender: TObject);

procedure CarregueRecebimentos;
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
        case rdTipo.ItemIndex of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      AC.ACRE_GENE_ID_TIPO_PGTO,');
            sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_RECEBER CR');
            sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
            sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
            sql.Add('WHERE AC.ACRE_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CR.CREC_STATUS                         <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      CREC_GENE_ID_TIPO_DOC,');
            sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_RECEBER');
            sql.Add('WHERE CREC_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CREC_STATUS                     <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM CREC_DTA_VCTO) = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
        end;
        Open;
        First;
        while not Eof do begin
          floatRecebimentos[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'CarregueRecebimentos',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure CarreguePagamentos;
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
        case rdTipo.ItemIndex of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      AC.ACPG_GENE_ID_TIPO_PGTO,');
            sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
            sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_PAGAR CP');
            sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
            sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
            sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      CPAG_GENE_ID_TIPO_DOC,');
            sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_PAGAR');
            sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
        end;
        Open;
        First;
        while not Eof do begin
          floatPagamentos[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'CarregueRecebimentos',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

var
  intI, intII : Integer;
begin
  try
    funcBasico.MSGAguarde();
    btnFiltrar.Enabled := false;
    for intI := 0 to ComponentCount - 1 do begin
      if (Components[intI] is TChart) then begin
        for intII := 0 to (Components[intI] as TChart).SeriesCount - 1 do
          (Components[intI] as TChart).Series[intII].Clear;
      end;
    end;
    for intI := 1 to 8 do begin
      floatRecebimentos[intI] := 0;
      floatPagamentos[intI]   := 0;
    end;
    CarregueRecebimentos;
    CarreguePagamentos;
    with ChartRecebimentos do begin
      Series[0].Add(floatRecebimentos[1],'DH',clGreen);
      Series[1].Add(floatRecebimentos[2],'CH',clBlue);
      Series[2].Add(floatRecebimentos[3],'CP',clRed);
      Series[3].Add(floatRecebimentos[4],'CD',clTeal);
      Series[4].Add(floatRecebimentos[5],'CC',clOlive);
      Series[5].Add(floatRecebimentos[6],'CT',clYellow);
      Series[6].Add(floatRecebimentos[7],'BL',clWhite);
      Series[7].Add(floatRecebimentos[8],'DP',clFuchsia);
    end;
    with ChartPagamentos do begin
      Series[0].Add(floatPagamentos[1],'DH',clGreen);
      Series[1].Add(floatPagamentos[2],'CH',clBlue);
      Series[2].Add(floatPagamentos[3],'CP',clRed);
      Series[3].Add(floatPagamentos[4],'CD',clTeal);
      Series[4].Add(floatPagamentos[5],'CC',clOlive);
      Series[5].Add(floatPagamentos[6],'CT',clYellow);
      Series[6].Add(floatPagamentos[7],'BL',clWhite);
      Series[7].Add(floatPagamentos[8],'DP',clFuchsia);
    end;
  finally
    funcBasico.MSGAguarde(false);
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfGraf_Forma_Pagamento.CarregaCombo;
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
  RegisterClass(TfGraf_Forma_Pagamento);
finalization
  UnRegisterClass(TfGraf_Forma_Pagamento);

end.
