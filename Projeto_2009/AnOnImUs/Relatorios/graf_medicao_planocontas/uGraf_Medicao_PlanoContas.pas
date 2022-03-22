unit uGraf_Medicao_PlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, SQLExpr, Menus, uFrPesqIndividual, frxClass,
  frxDBSet, frxDesgn, Datasnap.DBClient;

type
  TfGraf_Medicao_PlanoContas = class(TfBasico)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    rdMovimento: TRadioGroup;
    frPesqPlanoContas: TfrPesqIndividual;
    cdsLancamentos: TClientDataSet;
    cdsLancamentosDEZ_ANT: TFloatField;
    cdsLancamentosPLCT_COD_SIMPLIFICADO: TStringField;
    cdsLancamentosPLCT_DESCRICAO: TStringField;
    cdsLancamentos01: TStringField;
    cdsLancamentos02: TStringField;
    cdsLancamentos03: TStringField;
    cdsLancamentos04: TStringField;
    cdsLancamentos05: TStringField;
    cdsLancamentos06: TStringField;
    cdsLancamentos07: TStringField;
    cdsLancamentos08: TStringField;
    cdsLancamentos09: TStringField;
    cdsLancamentos10: TStringField;
    cdsLancamentos11: TStringField;
    cdsLancamentos12: TStringField;
    cdsLancamentosACUMULADO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdMovimentoClick(Sender: TObject);
    procedure frPesqPlanoContasedtCodigoKeyPress(Sender: TObject;
      var Key: Char);
    procedure frPesqPlanoContasedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqPlanoContasedtCodigoExit(Sender: TObject);
  private
    procedure CarregaCombo;
    procedure GeraDespesa;
    procedure GeraReceita;
    procedure AlimentarClient(qryConst: TSQLQuery);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Medicao_PlanoContas: TfGraf_Medicao_PlanoContas;

implementation

{$R *.dfm}

procedure TfGraf_Medicao_PlanoContas.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Medicao_PlanoContas.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
end;

procedure TfGraf_Medicao_PlanoContas.frPesqPlanoContasedtCodigoExit(
  Sender: TObject);
begin
  inherited;
  frPesqPlanoContas.edtCodigoExit(Sender);

end;

procedure TfGraf_Medicao_PlanoContas.frPesqPlanoContasedtCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  frPesqPlanoContas.edtCodigoKeyDown(Sender, Key, Shift);

end;

procedure TfGraf_Medicao_PlanoContas.frPesqPlanoContasedtCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  frPesqPlanoContas.edtCodigoKeyPress(Sender, Key);

end;

procedure TfGraf_Medicao_PlanoContas.btnFiltrarClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    try
      cdsLancamentos.CreateDataSet;
    except
    end;
    cdsLancamentos.EmptyDataSet;
    case rdMovimento.ItemIndex of
      0 : GeraReceita;
      1 : GeraDespesa;
    end;
    dsGrid.DataSet := cdsLancamentos;
    grdBasico.Refresh;
  finally
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Medicao_PlanoContas.GeraReceita;
var
  qryCons : TSQLQuery;
  sWhere  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    sWhere := '';
    if frPesqPlanoContas.TemRegistro then
      sWhere := '  AND CR.CREC_PLCT_ID ' + frPesqPlanoContas.InGrid;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT PLCT_COD_SIMPLIFICADO,');
        sql.Add('       PLCT_DESCRICAO,');
        sql.Add('       ANO,');
        sql.Add('       MES,');
        sql.Add('       VALOR');
        sql.Add('  FROM (');
        sql.Add('        SELECT');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  AS ANO,');
        sql.Add('               EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) AS MES,');
        sql.Add('               COALESCE(SUM(AC.ACRE_VALOR_DOC),0)       AS VALOR');
        sql.Add('          FROM CONTAS_RECEBER_ACERTOS AC');
        sql.Add('          JOIN CONTAS_RECEBER CR');
        sql.Add('            ON (AC.ACRE_CREC_ID                         = CR.CREC_ID');
        sql.Add('           AND AC.ACRE_CREC_EMPR_ID                     = CR.CREC_EMPR_ID)');
        sql.Add('          JOIN PLANO_CONTAS                             PLCT');
        sql.Add('            ON PLCT.PLCT_ID                             = CR.CREC_PLCT_ID');
        sql.Add('           AND PLCT.PLCT_EMPR_ID                        = CR.CREC_PLCT_EMPR_ID');
        sql.Add('         WHERE AC.ACRE_EMPR_ID                          = ' +IntToStr(funcBasico.Empr_ID));
        sql.Add('           AND CR.CREC_STATUS                          <> ''C''');
        sql.Add('           AND EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 12');
        sql.Add('           AND EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = '+IntToStr(StrToInt(cmbAno.Text)-1));
        sql.Add(sWhere);
        sql.Add('         GROUP BY');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO),');
        sql.Add('               EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO)');
        sql.Add('');
        sql.Add('         UNION');
        sql.Add('');
        sql.Add('         SELECT');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  AS ANO,');
        sql.Add('               EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) AS MES,');
        sql.Add('               COALESCE(SUM(AC.ACRE_VALOR_DOC),0)       AS VALOR');
        sql.Add('          FROM CONTAS_RECEBER_ACERTOS AC');
        sql.Add('          JOIN CONTAS_RECEBER CR');
        sql.Add('            ON (AC.ACRE_CREC_ID                         = CR.CREC_ID');
        sql.Add('           AND AC.ACRE_CREC_EMPR_ID                     = CR.CREC_EMPR_ID)');
        sql.Add('          JOIN PLANO_CONTAS                             PLCT');
        sql.Add('            ON PLCT.PLCT_ID                             = CR.CREC_PLCT_ID');
        sql.Add('           AND PLCT.PLCT_EMPR_ID                        = CR.CREC_PLCT_EMPR_ID');
        sql.Add('         WHERE AC.ACRE_EMPR_ID                          = '+IntToStr(funcBasico.Empr_ID));
        sql.Add('           AND CR.CREC_STATUS                          <> ''C''');
        sql.Add('           AND EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
        sql.Add(sWhere);
        sql.Add('         GROUP BY');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO),');
        sql.Add('               EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO)');
        sql.Add('       )');
        sql.Add(' ORDER BY');
        sql.Add('       PLCT_COD_SIMPLIFICADO,');
        sql.Add('       PLCT_DESCRICAO,');
        sql.Add('       ANO,');
        sql.Add('       MES');
        Open;
      end;
      AlimentarClient(qryCons);
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'Liquido',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfGraf_Medicao_PlanoContas.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Medicao_PlanoContas.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field = cdsLancamentos.FieldByName('PLCT_COD_SIMPLIFICADO')) or
     (Column.Field = cdsLancamentos.FieldByName('PLCT_DESCRICAO')) then begin
    grdBasico.Canvas.Font.Color := clBlue;
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
//  if (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) or
//     (Column.Field = cdsLancamentos.FieldByName('')) then begin
//    grdBasico.Canvas.Font.Color := clGreen;
//    if Column.Field.AsFloat > 0 then begin
//      case rdMovimento.ItemIndex of
//        1 : grdBasico.Canvas.Font.Color := clRed;
//      end;
//    end else if Column.Field.AsFloat < 0 then begin
//      case rdMovimento.ItemIndex of
//        0 : grdBasico.Canvas.Font.Color := clRed;
//      end;
//    end;
//    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
//  end;
end;

procedure TfGraf_Medicao_PlanoContas.rdMovimentoClick(Sender: TObject);
begin
  inherited;
  frPesqPlanoContas.rdMovimento.ItemIndex := rdMovimento.ItemIndex;
end;

procedure TfGraf_Medicao_PlanoContas.GeraDespesa;
var
  qryCons : TSQLQuery;
  sWhere  : String;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    sWhere := '';
    if frPesqPlanoContas.TemRegistro then
      sWhere := '  AND CP.CPAG_PLCT_ID ' + frPesqPlanoContas.InGrid;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT PLCT_COD_SIMPLIFICADO,');
        sql.Add('       PLCT_DESCRICAO,');
        sql.Add('       ANO,');
        sql.Add('       MES,');
        sql.Add('       VALOR');
        sql.Add('  FROM (');
        sql.Add('        SELECT PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) AS MES,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  AS ANO,');
        sql.Add('               (COALESCE(SUM(AC.ACPG_VALOR_DOC),0)*-1)  AS VALOR');
        sql.Add('          FROM CONTAS_PAGAR_ACERTOS                     AC');
        sql.Add('          JOIN CONTAS_PAGAR                             CP');
        sql.Add('            ON (AC.ACPG_CPAG_ID                         = CP.CPAG_ID');
        sql.Add('           AND AC.ACPG_CPAG_EMPR_ID                     = CP.CPAG_EMPR_ID)');
        sql.Add('          JOIN PLANO_CONTAS                             PLCT');
        sql.Add('            ON (PLCT.PLCT_ID                            = CP.CPAG_PLCT_ID');
        sql.Add('           AND PLCT.PLCT_EMPR_ID                        = CP.CPAG_PLCT_EMPR_ID)');
        sql.Add('         WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('           AND CP.CPAG_STATUS                          <> ''C''');
        sql.Add('           AND EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + IntToStr(StrToInt(cmbAno.Text)-1));
        sql.Add('           AND EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 12');
        sql.Add(sWhere);
        sql.Add('         GROUP BY');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO),');
        sql.Add('               EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO)');
        sql.Add('');
        sql.Add('        UNION');
        sql.Add('');
        sql.Add('        SELECT PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) AS MES,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  AS ANO,');
        sql.Add('               (COALESCE(SUM(AC.ACPG_VALOR_DOC),0)*-1)  AS VALOR');
        sql.Add('          FROM CONTAS_PAGAR_ACERTOS                     AC');
        sql.Add('          JOIN CONTAS_PAGAR                             CP');
        sql.Add('            ON (AC.ACPG_CPAG_ID                         = CP.CPAG_ID');
        sql.Add('           AND AC.ACPG_CPAG_EMPR_ID                     = CP.CPAG_EMPR_ID)');
        sql.Add('          JOIN PLANO_CONTAS                             PLCT');
        sql.Add('            ON (PLCT.PLCT_ID                            = CP.CPAG_PLCT_ID');
        sql.Add('           AND PLCT.PLCT_EMPR_ID                        = CP.CPAG_PLCT_EMPR_ID)');
        sql.Add('         WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('           AND CP.CPAG_STATUS                          <> ''C''');
        sql.Add('           AND EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
        sql.Add(sWhere);
        sql.Add('         GROUP BY');
        sql.Add('               PLCT.PLCT_COD_SIMPLIFICADO,');
        sql.Add('               PLCT.PLCT_DESCRICAO,');
        sql.Add('               EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO),');
        sql.Add('               EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO)');
        sql.Add('       )');
        sql.Add(' ORDER BY');
        sql.Add('       PLCT_COD_SIMPLIFICADO,');
        sql.Add('       PLCT_DESCRICAO,');
        sql.Add('       ANO,');
        sql.Add('       MES');
        Open;
      end;
      AlimentarClient(qryCons);
    except on e: exception do begin
      funcBasico.ReportaErro(Self.Caption,'Liquido',e.Message);
      funcBasico.Alerta('Erro no processo de criação do gráfico.',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfGraf_Medicao_PlanoContas.AlimentarClient(qryConst : TSQLQuery);
var
  AnoAnt      : Integer;
  VlrAnt      : Real;
  boolAnoAnt  : Boolean;
  strDesc     : String;
begin
  AnoAnt := StrToInt(cmbAno.Text)-1; VlrAnt    := 0;
  qryConst.First; boolAnoAnt := false; strDesc := '';
  while (not qryConst.Eof) do begin
    if (qryConst.FieldByName('ANO').AsInteger = AnoAnt) or (strDesc <>  Trim(qryConst.FieldByName('PLCT_COD_SIMPLIFICADO').AsString)) then begin
      if boolAnoAnt then
        cdsLancamentos.Cancel;
      strDesc                                      := Trim(qryConst.FieldByName('PLCT_COD_SIMPLIFICADO').AsString);
      boolAnoAnt                                   := true;
      if cdsLancamentos.State in [dsInsert,dsEdit] then cdsLancamentos.Post;
      cdsLancamentos.Append;
      if (qryConst.FieldByName('ANO').AsInteger = AnoAnt) then begin
        cdsLancamentosDEZ_ANT.AsFloat              := qryConst.FieldByName('VALOR').AsFloat;
        VlrAnt                                     := qryConst.FieldByName('VALOR').AsFloat;
      end else begin
        cdsLancamentosDEZ_ANT.AsFloat              := 0;
        VlrAnt                                     := 0;
      end;
      cdsLancamentosPLCT_COD_SIMPLIFICADO.AsString := Trim(qryConst.FieldByName('PLCT_COD_SIMPLIFICADO').AsString);
      cdsLancamentosPLCT_DESCRICAO.AsString        := Trim(qryConst.FieldByName('PLCT_DESCRICAO').AsString);
      cdsLancamentos01.AsString                    := '(0,00%) 0,00';
      cdsLancamentos02.AsString                    := '(0,00%) 0,00';
      cdsLancamentos03.AsString                    := '(0,00%) 0,00';
      cdsLancamentos04.AsString                    := '(0,00%) 0,00';
      cdsLancamentos05.AsString                    := '(0,00%) 0,00';
      cdsLancamentos06.AsString                    := '(0,00%) 0,00';
      cdsLancamentos07.AsString                    := '(0,00%) 0,00';
      cdsLancamentos08.AsString                    := '(0,00%) 0,00';
      cdsLancamentos09.AsString                    := '(0,00%) 0,00';
      cdsLancamentos10.AsString                    := '(0,00%) 0,00';
      cdsLancamentos11.AsString                    := '(0,00%) 0,00';
      cdsLancamentos12.AsString                    := '(0,00%) 0,00';
      cdsLancamentosACUMULADO.AsString             := '(0,00%) 0,00';
      if qryConst.FieldByName('ANO').AsInteger = AnoAnt then
        qryConst.Next;
      Continue;
    end;
    boolAnoAnt := false;
    case qryConst.FieldByName('MES').AsInteger of
      1 : cdsLancamentos01.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      2 : cdsLancamentos02.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      3 : cdsLancamentos03.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      4 : cdsLancamentos04.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      5 : cdsLancamentos05.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      6 : cdsLancamentos06.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      7 : cdsLancamentos07.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      8 : cdsLancamentos08.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      9 : cdsLancamentos09.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      10: cdsLancamentos10.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      11: cdsLancamentos11.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
      12: cdsLancamentos12.AsString := '(0,00%) '+FormatFloat('###,###,##0.00',qryConst.FieldByName('VALOR').AsFloat);
    end;
    qryConst.Next;
  end;
  if VlrAnt = 0 then Exit;
end;

procedure TfGraf_Medicao_PlanoContas.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := 5 downto 1 do begin
    cmbAno.Items.Add(IntToStr(Ano - intI));
  end;
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 5;
  for intI := 1 to 5 do begin
    cmbAno.Items.Add(IntToStr(Ano + intI));
  end;
  cmbAno.SetFocus;
end;

initialization
  RegisterClass(TfGraf_Medicao_PlanoContas);
finalization
  UnRegisterClass(TfGraf_Medicao_PlanoContas);

end.
