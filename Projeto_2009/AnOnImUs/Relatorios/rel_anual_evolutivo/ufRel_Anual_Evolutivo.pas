unit ufRel_Anual_Evolutivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Anual_Evolutivo = class(TfBasico)
    Panel1: TPanel;
    rdTipo_Impressao: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure OpenClientDataSet;
    function GeraReceber: String;
    function GeraPagar: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Anual_Evolutivo: TfRel_Anual_Evolutivo;

implementation

uses udmRel_Anual_Evolutivo, ufRel_Anual_Evolutivo_Analitico;

{$R *.dfm}

procedure TfRel_Anual_Evolutivo.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Anual_Evolutivo do begin
      with cdsContas_Receber do begin
        Close;
        CommandText := GeraReceber;
        Open;
      end;
      with cdsContas_Pagar do begin
        Close;
        CommandText := GeraPagar;
        Open;
      end;
      if (not cdsContas_Receber.IsEmpty) and (not cdsContas_Pagar.IsEmpty) then begin
        try
          if fRel_Anual_Evolutivo_Analitico = nil then
            fRel_Anual_Evolutivo_Analitico := TfRel_Anual_Evolutivo_Analitico.Create(nil);
          case rdOpcao_Impressao.ItemIndex of
            0 : fRel_Anual_Evolutivo_Analitico.qrepRelatorio.Preview;
            1 : fRel_Anual_Evolutivo_Analitico.qrepRelatorio.Print;
          end;
        finally
          FreeAndNil(fRel_Anual_Evolutivo_Analitico);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos',1);
    end;
  finally
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Anual_Evolutivo.GeraPagar : String;
var
  sltTMP : TStringList;
  intI   : Integer;
  strTMP : String;
begin
  try
    strTMP := '';
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO,');
        Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0) AS VALOR');
        Add('FROM  CONTAS_PAGAR_ACERTOS AC');
        Add('INNER JOIN CONTAS_PAGAR CP');
        Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
        Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
        Add('INNER JOIN PLANO_CONTAS PL');
        Add('ON (PL.PLCT_ID           = CP.CPAG_PLCT_ID');
        Add('AND PL.PLCT_EMPR_ID      = CP.CPAG_PLCT_EMPR_ID)');
        Add('WHERE CP.CPAG_EMPR_ID    = ' + IntToStr(funcBasico.Empr_ID));
        Add('AND   CP.CPAG_STATUS    <> ' + QuotedStr('C'));
        for intI := StrToInt(cmbAno.Text) downto (StrToInt(cmbAno.Text) - 4) do
          strTMP := strTMP + IntToStr(intI) + ',';
        strTMP   := Copy(strTMP,1,length(strTMP)-1);
        Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO) IN ('+strTMP+')');
        Add('GROUP BY');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO');
        Add('ORDER BY');
        Add('      PL.PLCT_COD_SIMPLIFICADO');
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraPagar',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_Anual_Evolutivo.GeraReceber : String;
var
  sltTMP : TStringList;
  intI   : Integer;
  strTMP : String;
begin
  try
    strTMP := '';
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO,');
        Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0) AS VALOR');
        Add('FROM  CONTAS_RECEBER_ACERTOS AC');
        Add('INNER JOIN CONTAS_RECEBER CR');
        Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
        Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
        Add('INNER JOIN PLANO_CONTAS PL');
        Add('ON (PL.PLCT_ID           = CR.CREC_PLCT_ID');
        Add('AND PL.PLCT_EMPR_ID      = CR.CREC_PLCT_EMPR_ID)');
        Add('WHERE CR.CREC_EMPR_ID    = ' + IntToStr(funcBasico.Empr_ID));
        Add('AND   CR.CREC_STATUS    <> ' + QuotedStr('C'));
        for intI := StrToInt(cmbAno.Text) downto (StrToInt(cmbAno.Text) - 4) do
          strTMP := strTMP + IntToStr(intI) + ',';
        strTMP   := Copy(strTMP,1,length(strTMP)-1);
        Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO) IN ('+strTMP+')');
        Add('GROUP BY');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO');
        Add('ORDER BY');
        Add('      PL.PLCT_COD_SIMPLIFICADO');
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraReceber',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Anual_Evolutivo.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Anual_Evolutivo = nil then
    dmRel_Anual_Evolutivo := TdmRel_Anual_Evolutivo.Create(NIl);
  inherited;
  OpenClientDataSet;
end;

procedure TfRel_Anual_Evolutivo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Anual_Evolutivo.OpenClientDataSet;
begin

end;

procedure TfRel_Anual_Evolutivo.FormShow(Sender: TObject);
var
  Dia,Mes,Ano : Word;
  intI        : Integer;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := (Ano - 4) to Ano do
    cmbAno.Items.Add(IntToStr(intI));
  cmbAno.ItemIndex := 4;
  cmbAno.SetFocus;
end;

procedure TfRel_Anual_Evolutivo.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Anual_Evolutivo.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Anual_Evolutivo.grdBasicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
end;

procedure TfRel_Anual_Evolutivo.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfRel_Anual_Evolutivo.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Anual_Evolutivo);

finalization
  UnRegisterClass(TfRel_Anual_Evolutivo);

end.
