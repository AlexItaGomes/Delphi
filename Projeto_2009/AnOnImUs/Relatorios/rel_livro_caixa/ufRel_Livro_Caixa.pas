 unit ufRel_Livro_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, SQLExpr, DateUtils, Menus, frxClass, frxDesgn, frxDBSet,
  uFrPesquisa;

type
  TfRel_Livro_Caixa = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtDt_Inicial: TDateEdit;
    edtDt_Final: TDateEdit;
    rdOpcao_Impressao: TRadioGroup;
    frPesqClientes: TfrPesquisa;
    frPesqFornecedores: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Livro_Caixa: TfRel_Livro_Caixa;

implementation

uses udmLivro_Caixa;

{$R *.dfm}

procedure TfRel_Livro_Caixa.btnNovoClick(Sender: TObject);

{$REGION 'ValidaDados'}
  function ValidaDados : Boolean;
  begin
    Result := true;
    if (edtDt_Inicial.Date <= 0) or (edtDt_Final.Date <= 0) then begin
      funcBasico.Alerta('Informe um período válido antes de continuar.',1);
      edtDt_Inicial.SetFocus;
      Result := false;
      Exit;
    end;
    if edtDt_Inicial.Date > edtDt_Final.Date then begin
      funcBasico.Alerta('Informe um período válido antes de continuar.',1);
      edtDt_Inicial.SetFocus;
      Result := false;
      Exit;
    end;
  end;
{$ENDREGION}

begin
  if funcBasico.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    try
      funcBasico.MSGAguarde();
      btnImprimir.Enabled := false;
      with dmLivro_Caixa.cdsRel_Livro_Caixa do begin
        Close;
        CommandText := GeraSQL;
        Open;
        if not IsEmpty then begin
          try
            with frRelatorio do begin
              TfrxMemoView(FindComponent('lbTit01')).Text    := '';
              TfrxMemoView(FindComponent('lbFild01')).Text   := '';
              TfrxMemoView(FindComponent('lbTit02')).Text    := '';
              TfrxMemoView(FindComponent('lbFild02')).Text   := '';
              TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período:';
              TfrxMemoView(FindComponent('lbFild03')).Text   := '';
              if (edtDt_Inicial.Date > 0) then
                TfrxMemoView(FindComponent('lbFild03')).Text := edtDt_Inicial.Text;
              if (edtDt_Final.Date > 0) then
                TfrxMemoView(FindComponent('lbFild03')).Text := edtDt_Inicial.Text + ' à ' + edtDt_Final.Text;
              if (edtDt_Final.Date <= 0) and (edtDt_Final.Date <= 0) then begin
                TfrxMemoView(FindComponent('lbFild03')).Visible  := false;
                TfrxMemoView(FindComponent('lbTit03')).Visible   := false;
              end;
              case rdOpcao_Impressao.ItemIndex of
                0 : frRelatorio.ShowReport();
                1 : frRelatorio.Print;
              end;
            end;
          finally
          end;
        end else funcBasico.Alerta('Não há registros a serem impressos.',1)
      end;
    finally
      btnImprimir.Enabled := true;
      funcBasico.MSGAguarde(false);
    end;
  end;
end;

procedure TfRel_Livro_Caixa.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmLivro_Caixa = nil then
    dmLivro_Caixa := TdmLivro_Caixa.Create(NIl);
  cdsGeral     := dmLivro_Caixa.cdsRel_Livro_Caixa;
  inherited;
  edtDt_Inicial.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Final.Date   := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  dstRelatorio.DataSource := dmLivro_Caixa.dsRel_Livro_Caixa;
end;

procedure TfRel_Livro_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Livro_Caixa.FormShow(Sender: TObject);
begin
  inherited;
  edtDt_Inicial.SetFocus;
end;

function TfRel_Livro_Caixa.GeraSQL : String;
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
        sql.Add('      LCAX_ID,');
        sql.Add('      LCAX_EMPR_ID,');
        sql.Add('      PROVENIENTE,');
        sql.Add('      LCAX_DTA_LANCAMENTO,');
        sql.Add('      PLCT_COD_SIMPLIFICADO,');
        sql.Add('      PLCT_DESCRICAO,');
        sql.Add('      SALDO_ANT,');
        sql.Add('      LCAX_VLR_LANCAMENTO,');
        sql.Add('      LCAX_VLR_SALDO,');
        sql.Add('      PLCT_TIPO,');
        SQL.Add('      ID,');
        SQL.Add('      CLIENTE_FORNECEDOR');
        sql.Add('FROM');
        sql.Add('      (SELECT');
        sql.Add('            LC.LCAX_ID,');
        sql.Add('            LC.LCAX_EMPR_ID,');
        sql.Add('            CR.CREC_PROVENIENTE AS PROVENIENTE,');
        sql.Add('            LC.LCAX_DTA_LANCAMENTO,');
        sql.Add('            PL.PLCT_COD_SIMPLIFICADO,');
        sql.Add('            PL.PLCT_DESCRICAO,');
        sql.Add('            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALDO_ANT,');
        sql.Add('            LC.LCAX_VLR_LANCAMENTO,');
        sql.Add('            LC.LCAX_VLR_SALDO,');
        sql.Add('            PL.PLCT_TIPO,');
        sql.Add('            CL.CLIE_ID                                     AS ID,');
        sql.Add('            CL.CLIE_RAZAO_SOCIAL                           AS CLIENTE_FORNECEDOR');
        sql.Add('      FROM  LIVRO_CAIXA LC');
        sql.Add('      INNER JOIN PLANO_CONTAS PL');
        sql.Add('      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID');
        sql.Add('      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)');
        sql.Add('      INNER JOIN CONTAS_RECEBER CR');
        sql.Add('      ON (CR.CREC_ID      = LC.LCAX_CAMPO1_TAB_MOV');
        sql.Add('      AND CR.CREC_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)');
        sql.Add('      INNER JOIN CLIENTES CL');
        sql.Add('      ON (CL.CLIE_ID      = CR.CREC_CLIE_ID');
        sql.Add('      AND CL.CLIE_EMPR_ID = CR.CREC_CLIE_EMPR_ID)');
        sql.Add('      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0');
        sql.Add('      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11');
        sql.Add('      AND   LC.LCAX_GENE_ID_TP_ORIG      = 2');
        if frPesqClientes.TemRegistros then begin
          sql.Add('      AND   CL.CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add('      AND   CL.CLIE_ID ' + frPesqClientes.InGrid());
        end;
        sql.Add('');
        sql.Add('      UNION');
        sql.Add('');
        sql.Add('      SELECT');
        sql.Add('            LC.LCAX_ID,');
        sql.Add('            LC.LCAX_EMPR_ID,');
        sql.Add('            CP.CPAG_PROVENIENTE AS PROVENIENTE,');
        sql.Add('            LC.LCAX_DTA_LANCAMENTO,');
        sql.Add('            PL.PLCT_COD_SIMPLIFICADO,');
        sql.Add('            PL.PLCT_DESCRICAO,');
        sql.Add('            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALDO_ANT,');
        sql.Add('            LC.LCAX_VLR_LANCAMENTO,');
        sql.Add('            LC.LCAX_VLR_SALDO,');
        sql.Add('            PL.PLCT_TIPO,');
        sql.Add('            FN.FORN_ID                                   AS ID,');
        sql.Add('            FN.FORN_RAZAO_SOCIAL                         AS CLIENTE_FORNECEDOR');
        sql.Add('      FROM  LIVRO_CAIXA LC');
        sql.Add('      INNER JOIN PLANO_CONTAS PL');
        sql.Add('      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID');
        sql.Add('      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)');
        sql.Add('      INNER JOIN CONTAS_PAGAR CP');
        sql.Add('      ON (CP.CPAG_ID      = LC.LCAX_CAMPO1_TAB_MOV');
        sql.Add('      AND CP.CPAG_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)');
        sql.Add('      INNER JOIN FORNECEDORES FN');
        sql.Add('      ON (FN.FORN_ID      = CP.CPAG_FORN_ID)');
        sql.Add('      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0');
        sql.Add('      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11');
        sql.Add('      AND   LC.LCAX_GENE_ID_TP_ORIG      = 3');
        if frPesqFornecedores.TemRegistros then begin
          sql.Add('      AND   FN.FORN_ID ' + frPesqFornecedores.InGrid());
        end;
        sql.Add('');
        sql.Add('      UNION');
        sql.Add('');
        sql.Add('      SELECT');
        sql.Add('            LC.LCAX_ID,');
        sql.Add('            LC.LCAX_EMPR_ID,');
        sql.Add('            TP.GENE_DESCR AS PROVENIENTE,');
        sql.Add('            LC.LCAX_DTA_LANCAMENTO,');
        sql.Add('            ' + QuotedStr('') + ' AS PLCT_COD_SIMPLIFICADO,');
        sql.Add('            ' + QuotedStr('MOVIMENTACAO BANCARIA') + ',');
        sql.Add('            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALDO_ANT,');
        sql.Add('            LC.LCAX_VLR_LANCAMENTO,');
        sql.Add('            LC.LCAX_VLR_SALDO,');
        sql.Add('            CASE');
        sql.Add('                WHEN LC.LCAX_VLR_LANCAMENTO > 0 THEN ''C''');
        sql.Add('                ELSE ''D''');
        sql.Add('            END AS GENE_PAR1,');
        sql.Add('            CB.CBCO_ID                                   AS ID,');
        sql.Add('            CB.CBCO_DESCRICAO                            AS CLIENTE_FORNECEDOR');
        sql.Add('      FROM  LIVRO_CAIXA LC');
        sql.Add('      INNER JOIN CONTAS_BANCARIAS_MOV CM');
        sql.Add('      ON (CM.CBMV_ID      = LC.LCAX_CAMPO1_TAB_MOV');
        sql.Add('      AND CM.CBMV_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)');
        sql.Add('      INNER JOIN CONTAS_BANCARIAS CB');
        sql.Add('      ON (CB.CBCO_ID      = CM.CBMV_CBCO_ID');
        sql.Add('      AND CB.CBCO_EMPR_ID = CM.CBMV_CBCO_EMPR_ID)');
        sql.Add('      INNER JOIN GENERICA TP');
        sql.Add('      ON (TP.GENE_EMPR_ID = CM.CBMV_GENE_EMPR_ID_TIPO_MOV');
        sql.Add('      AND TP.GENE_TGEN_ID = CM.CBMV_GENE_TGEN_ID_TIPO_MOV');
        sql.Add('      AND TP.GENE_ID      = CM.CBMV_GENE_ID_TIPO_MOV)');
        sql.Add('      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0');
        sql.Add('      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11');
        sql.Add('      AND   LC.LCAX_GENE_ID_TP_ORIG      = 6');
        SQL.Add('');
        SQL.Add('      UNION');
        SQL.Add('');
        SQL.Add('      SELECT');
        SQL.Add('            LC.LCAX_ID,');
        SQL.Add('            LC.LCAX_EMPR_ID,');
        SQL.Add('            ' + QuotedStr('ACERTO ORDEM DE SERVIÇO') + 'AS PROVENIENTE,');
        SQL.Add('            LC.LCAX_DTA_LANCAMENTO,');
        SQL.Add('            PL.PLCT_COD_SIMPLIFICADO,');
        SQL.Add('            PL.PLCT_DESCRICAO,');
        SQL.Add('            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALDO_ANT,');
        SQL.Add('            LC.LCAX_VLR_LANCAMENTO,');
        SQL.Add('            LC.LCAX_VLR_SALDO,');
        SQL.Add('            PL.PLCT_TIPO,');
        SQL.Add('            CL.CLIE_ID                                   AS ID,');
        SQL.Add('            CL.CLIE_RAZAO_SOCIAL                         AS CLIENTE_FORNECEDOR');
        SQL.Add('      FROM  LIVRO_CAIXA LC');
        SQL.Add('      INNER JOIN PLANO_CONTAS PL');
        SQL.Add('      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID');
        SQL.Add('      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)');
        SQL.Add('      INNER JOIN ORDEM_SERVICO_ACERTOS AC');
        SQL.Add('      ON (AC.ODAC_ID      = LC.LCAX_CAMPO1_TAB_MOV');
        SQL.Add('      AND AC.ODAC_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)');
        SQL.Add('      INNER JOIN ORDEM_SERVICO OS');
        SQL.Add('      ON (OS.ORDS_ID      = AC.ODAC_ORDS_ID');
        SQL.Add('      AND OS.ORDS_EMPR_ID = AC.ODAC_ORDS_EMPR_ID)');
        SQL.Add('      INNER JOIN CLIENTES CL');
        SQL.Add('      ON (CL.CLIE_ID      = OS.ORDS_CLIE_ID');
        SQL.Add('      AND CL.CLIE_EMPR_ID = OS.ORDS_CLIE_EMPR_ID)');
        SQL.Add('      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0');
        SQL.Add('      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11');
        SQL.Add('      AND   LC.LCAX_GENE_ID_TP_ORIG      = 7');
        if frPesqClientes.TemRegistros then begin
          sql.Add('      AND   CL.CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add('      AND   CL.CLIE_ID ' + frPesqClientes.InGrid());
        end;
        SQL.Add('');
        SQL.Add('UNION');
        SQL.Add('');
        SQL.Add('      SELECT');
        SQL.Add('            LC.LCAX_ID,');
        SQL.Add('            LC.LCAX_EMPR_ID,');
        SQL.Add('            ''ACERTO AGENDA'' AS PROVENIENTE,');
        SQL.Add('            LC.LCAX_DTA_LANCAMENTO,');
        SQL.Add('            PL.PLCT_COD_SIMPLIFICADO,');
        SQL.Add('            PL.PLCT_DESCRICAO,');
        SQL.Add('            (LC.LCAX_VLR_SALDO - LC.LCAX_VLR_LANCAMENTO) AS SALDO_ANT,');
        SQL.Add('            LC.LCAX_VLR_LANCAMENTO,');
        SQL.Add('            LC.LCAX_VLR_SALDO,');
        SQL.Add('            PL.PLCT_TIPO,');
        SQL.Add('            CL.CLIE_ID                                   AS ID,');
        SQL.Add('            CL.CLIE_RAZAO_SOCIAL                         AS CLIENTE_FORNECEDOR');
        SQL.Add('      FROM  LIVRO_CAIXA LC');
        SQL.Add('      INNER JOIN PLANO_CONTAS PL');
        SQL.Add('      ON (PL.PLCT_ID      = LC.LCAX_PLCT_ID');
        SQL.Add('      AND PL.PLCT_EMPR_ID = LC.LCAX_PLCT_EMPR_ID)');
        SQL.Add('      INNER JOIN AGENDA   AG');
        SQL.Add('      ON (AG.AGEN_ID      = LC.LCAX_CAMPO1_TAB_MOV');
        SQL.Add('      AND AG.AGEN_EMPR_ID = LC.LCAX_CAMPO2_TAB_MOV)');
        SQL.Add('      INNER JOIN CLIENTES CL');
        SQL.Add('      ON (CL.CLIE_ID      = AG.AGEN_CLIE_ID');
        SQL.Add('      AND CL.CLIE_EMPR_ID = AG.AGEN_CLIE_EMPR_ID)');
        SQL.Add('      WHERE LC.LCAX_GENE_EMPR_ID_TP_ORIG = 0');
        SQL.Add('      AND   LC.LCAX_GENE_TGEN_ID_TP_ORIG = 11');
        SQL.Add('      AND   LC.LCAX_GENE_ID_TP_ORIG      = 8');
        if frPesqClientes.TemRegistros then begin
          sql.Add('      AND   CL.CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          sql.Add('      AND   CL.CLIE_ID ' + frPesqClientes.InGrid());
        end;

        sql.Add('      )');
        sql.Add('WHERE LCAX_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if edtDt_Inicial.Date > 0 then
          sql.Add('AND LCAX_DTA_LANCAMENTO >=' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Inicial.Date)));
        if edtDt_Final.Date > 0 then
          sql.Add('AND LCAX_DTA_LANCAMENTO <=' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Final.Date)));
        SQL.Add('ORDER BY');
        SQL.Add('      LCAX_DTA_LANCAMENTO,');
        SQL.Add('      LCAX_ID');
        Result := qryCons.Text;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de geração do relatório.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;


procedure TfRel_Livro_Caixa.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Livro_Caixa.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Livro_Caixa.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfRel_Livro_Caixa.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Livro_Caixa);
finalization
  UnRegisterClass(TfRel_Livro_Caixa);

end.
