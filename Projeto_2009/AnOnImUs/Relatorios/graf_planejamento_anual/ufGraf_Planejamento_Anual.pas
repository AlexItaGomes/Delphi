unit ufGraf_Planejamento_Anual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  TeEngine, Series, TeeProcs, Chart, SQLExpr, TeeFunci, Menus, frxClass,
  frxDBSet, frxDesgn, VclTee.TeeGDIPlus;

type
  TfGraf_Planejamento_Anual = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    Chart1: TChart;
    TeeFunction1: TAddTeeFunction;
    Series1: TBarSeries;
    Series2: TBarSeries;
    rdTipo: TRadioGroup;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure cmbAnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Planejamento_Anual: TfGraf_Planejamento_Anual;
  floatPlanejado : array[1..12] of Real;
  floatRealizado : array[1..12] of Real;

implementation

{$R *.dfm}


procedure TfGraf_Planejamento_Anual.btnFiltrarClick(Sender: TObject);

procedure CarregaPlanejado;
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
        sql.Add('      COALESCE(SUM(PCPJ_MES_01),0) JAN,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_02),0) FEV,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_03),0) MAR,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_04),0) ABR,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_05),0) MAI,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_06),0) JUN,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_07),0) JUL,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_08),0) AGO,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_09),0) SET_,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_10),0) OUT,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_11),0) NOV,');
        sql.Add('      COALESCE(SUM(PCPJ_MES_12),0) DEZ');
        sql.Add('FROM  PLANO_CONTAS_PLANEJAMENTO');
        sql.Add('WHERE PCPJ_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   PCPJ_PLCT_ID     <> 155');
        sql.Add('AND   PCPJ_PLCT_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   PCPJ_ANO          = ' + cmbAno.Text);
        Open;
        floatPlanejado[1]  := qryCons.Fields[0].AsFloat;
        floatPlanejado[2]  := qryCons.Fields[1].AsFloat;
        floatPlanejado[3]  := qryCons.Fields[2].AsFloat;
        floatPlanejado[4]  := qryCons.Fields[3].AsFloat;
        floatPlanejado[5]  := qryCons.Fields[4].AsFloat;
        floatPlanejado[6]  := qryCons.Fields[5].AsFloat;
        floatPlanejado[7]  := qryCons.Fields[6].AsFloat;
        floatPlanejado[8]  := qryCons.Fields[7].AsFloat;
        floatPlanejado[9]  := qryCons.Fields[8].AsFloat;
        floatPlanejado[10] := qryCons.Fields[9].AsFloat;
        floatPlanejado[11] := qryCons.Fields[10].AsFloat;
        floatPlanejado[12] := qryCons.Fields[11].AsFloat;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'CarregaPlanejado',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1)
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
        case rdTipo.ItemIndex of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO),');
            sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
            sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_PAGAR CP');
            sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
            sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
            sql.Add('WHERE AC.ACPG_EMPR_ID                         = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CP.CPAG_STATUS                         <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) = ' + cmbAno.Text);
            sql.Add('GROUP BY');
            sql.Add('      1');
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO),');
            sql.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_PAGAR');
            sql.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + cmbAno.Text);
            sql.Add('GROUP BY');
            sql.Add('      1');
          end;
        end;
        Open;
        First;
        while not Eof do begin
          floatRealizado[qryCons.Fields[0].AsInteger] := qryCons.Fields[1].AsFloat;
          Next;
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

var
  intI : Integer;
begin
  try
    btnFiltrar.Enabled := false;
    funcBasico.MSGAguarde();

    for intI := 1 to 12 do begin
      floatPlanejado[intI] := 0;
      floatRealizado[intI] := 0;
    end;

    CarregaPlanejado;
    CarregaRealizado;

    with Chart1 do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatPlanejado[1]  ,'Jan',clBlue);
      Series[1].Add(floatRealizado[1]  ,'Jan',clRed);
      Series[0].Add(floatPlanejado[2]  ,'Fev',clBlue);
      Series[1].Add(floatRealizado[2]  ,'Fev',clRed);
      Series[0].Add(floatPlanejado[3]  ,'Mar',clBlue);
      Series[1].Add(floatRealizado[3]  ,'Mar',clRed);
      Series[0].Add(floatPlanejado[4]  ,'Abr',clBlue);
      Series[1].Add(floatRealizado[4]  ,'Abr',clRed);
      Series[0].Add(floatPlanejado[5]  ,'Mai',clBlue);
      Series[1].Add(floatRealizado[5]  ,'Mai',clRed);
      Series[0].Add(floatPlanejado[6]  ,'Jun',clBlue);
      Series[1].Add(floatRealizado[6]  ,'Jun',clRed);
      Series[0].Add(floatPlanejado[7]  ,'Jul',clBlue);
      Series[1].Add(floatRealizado[7]  ,'Jul',clRed);
      Series[0].Add(floatPlanejado[8]  ,'Ago',clBlue);
      Series[1].Add(floatRealizado[8]  ,'Ago',clRed);
      Series[0].Add(floatPlanejado[9]  ,'Set',clBlue);
      Series[1].Add(floatRealizado[9]  ,'Set',clRed);
      Series[0].Add(floatPlanejado[10] ,'Out',clBlue);
      Series[1].Add(floatRealizado[10] ,'Out',clRed);
      Series[0].Add(floatPlanejado[11] ,'Nov',clBlue);
      Series[1].Add(floatRealizado[11] ,'Nov',clRed);
      Series[0].Add(floatPlanejado[12] ,'Dez',clBlue);
      Series[1].Add(floatRealizado[12] ,'Dez',clRed);
    end;
  finally
    btnFiltrar.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Planejamento_Anual.CarregaCombo;
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

procedure TfGraf_Planejamento_Anual.cmbAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Planejamento_Anual.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Planejamento_Anual.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnFiltrar.Click;
end;

procedure TfGraf_Planejamento_Anual.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Planejamento_Anual.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfGraf_Planejamento_Anual.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfGraf_Planejamento_Anual.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfGraf_Planejamento_Anual);
finalization
  UnRegisterClass(TfGraf_Planejamento_Anual);

end.
