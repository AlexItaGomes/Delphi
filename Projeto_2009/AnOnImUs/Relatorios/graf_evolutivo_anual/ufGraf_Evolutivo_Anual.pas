unit ufGraf_Evolutivo_Anual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  TeEngine, TeeFunci, Series, TeeProcs, Chart, SQLExpr, Menus, frxClass,
  frxDBSet, frxDesgn, VclTee.TeeGDIPlus;

type
  TfGraf_Evolutivo_Anual = class(TfBasico)
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    Panel1: TPanel;
    Chart1: TChart;
    TeeFunction1: TAddTeeFunction;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
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
  fGraf_Evolutivo_Anual: TfGraf_Evolutivo_Anual;

implementation

{$R *.dfm}

procedure TfGraf_Evolutivo_Anual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Evolutivo_Anual.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnFiltrar.Click;
end;

procedure TfGraf_Evolutivo_Anual.btnFiltrarClick(Sender: TObject);

function Liquido(strMes, strAno : String) : Real;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := 0;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(SUM(VALOR),0)');
        sql.Add('FROM');
        sql.Add('    (SELECT');
        sql.Add('           COALESCE(SUM(AC.ACRE_VALOR_DOC),0) AS VALOR');
        sql.Add('     FROM  CONTAS_RECEBER_ACERTOS AC');
        sql.Add('     INNER JOIN CONTAS_RECEBER CR');
        sql.Add('     ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
        sql.Add('     AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
        sql.Add('     WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('     AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
        sql.Add('     AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = ' + strMes);
        sql.Add('     AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + strAno);
        sql.Add('');
        sql.Add('     UNION');
        sql.Add('');
        sql.Add('     SELECT');
        sql.Add('           COALESCE(SUM(AC.ACPG_VALOR_DOC),0) AS VALOR');
        sql.Add('     FROM  CONTAS_PAGAR_ACERTOS AC');
        sql.Add('     INNER JOIN CONTAS_PAGAR CP');
        sql.Add('     ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
        sql.Add('     AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
        sql.Add('     WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('     AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
        sql.Add('     AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = ' + strMes);
        sql.Add('     AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + strAno);
        sql.Add('     )');
        Open;
      end;
      Result := qryCons.Fields[0].AsFloat;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'Liquido',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  try
    funcBasico.MSGAguarde();
    btnFiltrar.Enabled := false;
    with Chart1 do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[2].Clear;
      Series[0].Title := cmbAno.Text;
      Series[1].Title := IntToStr(StrToInt(cmbAno.Text)-1);
      Series[2].Title := IntToStr(StrToInt(cmbAno.Text)-2);
      Series[0].Add(Liquido('1', IntToStr(StrToInt(cmbAno.Text)-2)),'Jan',clGreen);
      Series[0].Add(Liquido('2', IntToStr(StrToInt(cmbAno.Text)-2)),'Fev',clGreen);
      Series[0].Add(Liquido('3', IntToStr(StrToInt(cmbAno.Text)-2)),'Mar',clGreen);
      Series[0].Add(Liquido('4', IntToStr(StrToInt(cmbAno.Text)-2)),'Abr',clGreen);
      Series[0].Add(Liquido('5', IntToStr(StrToInt(cmbAno.Text)-2)),'Mai',clGreen);
      Series[0].Add(Liquido('6', IntToStr(StrToInt(cmbAno.Text)-2)),'Jun',clGreen);
      Series[0].Add(Liquido('7', IntToStr(StrToInt(cmbAno.Text)-2)),'Jul',clGreen);
      Series[0].Add(Liquido('8', IntToStr(StrToInt(cmbAno.Text)-2)),'Ago',clGreen);
      Series[0].Add(Liquido('9', IntToStr(StrToInt(cmbAno.Text)-2)),'Set',clGreen);
      Series[0].Add(Liquido('10',IntToStr(StrToInt(cmbAno.Text)-2)),'Out',clGreen);
      Series[0].Add(Liquido('11',IntToStr(StrToInt(cmbAno.Text)-2)),'Nov',clGreen);
      Series[0].Add(Liquido('12',IntToStr(StrToInt(cmbAno.Text)-2)),'Dez',clGreen);
      Series[1].Add(Liquido('1', IntToStr(StrToInt(cmbAno.Text)-1)),'Jan',clYellow);
      Series[1].Add(Liquido('2', IntToStr(StrToInt(cmbAno.Text)-1)),'Fev',clYellow);
      Series[1].Add(Liquido('3', IntToStr(StrToInt(cmbAno.Text)-1)),'Mar',clYellow);
      Series[1].Add(Liquido('4', IntToStr(StrToInt(cmbAno.Text)-1)),'Abr',clYellow);
      Series[1].Add(Liquido('5', IntToStr(StrToInt(cmbAno.Text)-1)),'Mai',clYellow);
      Series[1].Add(Liquido('6', IntToStr(StrToInt(cmbAno.Text)-1)),'Jun',clYellow);
      Series[1].Add(Liquido('7', IntToStr(StrToInt(cmbAno.Text)-1)),'Jul',clYellow);
      Series[1].Add(Liquido('8', IntToStr(StrToInt(cmbAno.Text)-1)),'Ago',clYellow);
      Series[1].Add(Liquido('9', IntToStr(StrToInt(cmbAno.Text)-1)),'Set',clYellow);
      Series[1].Add(Liquido('10',IntToStr(StrToInt(cmbAno.Text)-1)),'Out',clYellow);
      Series[1].Add(Liquido('11',IntToStr(StrToInt(cmbAno.Text)-1)),'Nov',clYellow);
      Series[1].Add(Liquido('12',IntToStr(StrToInt(cmbAno.Text)-1)),'Dez',clYellow);
      Series[2].Add(Liquido('1', cmbAno.Text),'Jan',clBlue);
      Series[2].Add(Liquido('2', cmbAno.Text),'Fev',clBlue);
      Series[2].Add(Liquido('3', cmbAno.Text),'Mar',clBlue);
      Series[2].Add(Liquido('4', cmbAno.Text),'Abr',clBlue);
      Series[2].Add(Liquido('5', cmbAno.Text),'Mai',clBlue);
      Series[2].Add(Liquido('6', cmbAno.Text),'Jun',clBlue);
      Series[2].Add(Liquido('7', cmbAno.Text),'Jul',clBlue);
      Series[2].Add(Liquido('8', cmbAno.Text),'Ago',clBlue);
      Series[2].Add(Liquido('9', cmbAno.Text),'Set',clBlue);
      Series[2].Add(Liquido('10',cmbAno.Text),'Out',clBlue);
      Series[2].Add(Liquido('11',cmbAno.Text),'Nov',clBlue);
      Series[2].Add(Liquido('12',cmbAno.Text),'Dez',clBlue);
    end;
  finally
    btnFiltrar.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Evolutivo_Anual.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := 5 downto 1 do
    cmbAno.Items.Add(IntToStr(Ano - intI));
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 5;
  for intI := 1 to 5 do
    cmbAno.Items.Add(IntToStr(Ano + intI));
  cmbAno.SetFocus;
end;

procedure TfGraf_Evolutivo_Anual.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Evolutivo_Anual.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfGraf_Evolutivo_Anual.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfGraf_Evolutivo_Anual.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfGraf_Evolutivo_Anual);
finalization
  UnRegisterClass(TfGraf_Evolutivo_Anual);

end.
