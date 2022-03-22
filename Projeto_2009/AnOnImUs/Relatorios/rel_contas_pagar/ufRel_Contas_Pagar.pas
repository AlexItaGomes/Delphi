unit ufRel_Contas_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Contas_Pagar = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    GroupBox7: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    GroupBox8: TGroupBox;
    edtDt_Pagto_Inicio: TDateEdit;
    edtDt_Pagto_Fim: TDateEdit;
    rdStatus: TRadioGroup;
    GroupBox9: TGroupBox;
    edtDt_Canc_Inicio: TDateEdit;
    edtDt_Canc_Fim: TDateEdit;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    frPesqContaPagar: TfrPesquisa;
    frPesqFornecedores: TfrPesquisa;
    frPesqPlanoContas: TfrPesquisa;
    frPesqTipoDoc: TfrPesquisa;
    GroupBox1: TGroupBox;
    edtDtEfetivaInicio: TDateEdit;
    edtDtEfetivaFim: TDateEdit;
    frPesqContaBancaria: TfrPesquisa;
    frRelatorioAnalitico: TfrxReport;
    dstRelatorioAcertos: TfrxDBDataset;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
    procedure SetaValoresFrames;
  public
    { Public declarations }
  end;

var
  fRel_Contas_Pagar: TfRel_Contas_Pagar;

implementation

uses udmRel_Contas_Pagar, ufRel_Contas_Pagar_Analitico,
  ufRel_Contas_Pagar_Sintetico;

{$R *.dfm}

procedure TfRel_Contas_Pagar.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Contas_Pagar.cdsRel_Contas_Pagar do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        case rdTipo_Impressao.ItemIndex of
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipo_Impressao.Items[rdTipo_Impressao.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Ordenação:';
                TfrxMemoView(FindComponent('lbFild03')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                Self.SendToBack;
                case rdOpcao_Impressao.ItemIndex of
                  0 : frRelatorio.ShowReport();
                  1 : frRelatorio.Print;
                end;
              end;
            finally
            end;
          end;
          1 : begin
            try
              with frRelatorioAnalitico do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Tipo:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdTipo_Impressao.Items[rdTipo_Impressao.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Status:';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Ordenação:';
                TfrxMemoView(FindComponent('lbFild03')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                Self.SendToBack;
                case rdOpcao_Impressao.ItemIndex of
                  0 : frRelatorioAnalitico.ShowReport();
                  1 : frRelatorioAnalitico.Print;
                end;
              end;
            finally
            end;
          end;
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',1);
    end;
  finally
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Contas_Pagar.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      CP.CPAG_ID,');
        Add('      CP.CPAG_EMPR_ID,');
        Add('      CP.CPAG_NR_DOC,');
        Add('      CP.CPAG_PROVENIENTE,');
        Add('      CP.CPAG_FORN_ID,');
        Add('      CP.CPAG_PLCT_ID,');
        Add('      CP.CPAG_PLCT_EMPR_ID,');
        Add('      CP.CPAG_DTA_EMISSAO,');
        Add('      CP.CPAG_DTA_VCTO,');
        Add('      CP.CPAG_DTA_PGTO,');
        Add('      CP.CPAG_VALOR_DOC,');
        Add('      CP.CPAG_VALOR_JUROS,');
        Add('      CP.CPAG_VALOR_MORA,');
        Add('      CP.CPAG_STATUS,');
        Add('      CP.CPAG_VALOR_PAGO,');
        Add('      CP.CPAG_GENE_EMPR_ID_TIPO_DOC,');
        Add('      CP.CPAG_GENE_TGEN_ID_TIPO_DOC,');
        Add('      CP.CPAG_GENE_ID_TIPO_DOC,');
        Add('      CP.CPAG_OBS,');
        Add('      CP.CPAG_USER_ID_CANC,');
        Add('      CP.CPAG_DTA_CANC,');
        Add('      CP.CPAG_MOTIVO_CANC,');
        Add('      CP.CPAG_DTA_CADASTRO,');
        Add('      CP.CPAG_USER_ID,');
        Add('      FN.FORN_NOME_FANTASIA,');
        Add('      PL.PLCT_COD_SIMPLIFICADO,');
        Add('      PL.PLCT_DESCRICAO,');
        Add('      PL.PLCT_TIPO,');
        Add('      CASE CP.CPAG_STATUS');
        Add('           WHEN ' + QuotedStr('A') + ' THEN ' + QuotedStr('Aberto'));
        Add('           WHEN ' + QuotedStr('F') + ' THEN ' + QuotedStr('Fechado'));
        Add('           WHEN ' + QuotedStr('C') + ' THEN ' + QuotedStr('Cancelado'));
        Add('      END AS STATUS,');
        Add('      TP.GENE_DESCR TIPO_DOC,');
        Add('      UC.USER_LOGIN USER_CANCEL,');
        Add('      EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO) AS ANO,');
        Add('      EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) AS MES,');
        Add('      CP.CPAG_DTA_EFETIVO');
        Add('FROM  CONTAS_PAGAR CP');
        Add('INNER JOIN FORNECEDORES FN');
        Add('ON (FN.FORN_ID = CP.CPAG_FORN_ID)');
        Add('INNER JOIN PLANO_CONTAS PL');
        Add('ON (PL.PLCT_ID      = CP.CPAG_PLCT_ID');
        Add('AND PL.PLCT_EMPR_ID = CP.CPAG_PLCT_EMPR_ID)');
        Add('INNER JOIN GENERICA TP');
        Add('ON (TP.GENE_EMPR_ID = CP.CPAG_GENE_EMPR_ID_TIPO_DOC');
        Add('AND TP.GENE_TGEN_ID = CP.CPAG_GENE_TGEN_ID_TIPO_DOC');
        Add('AND TP.GENE_ID      = CP.CPAG_GENE_ID_TIPO_DOC)');
        Add('LEFT OUTER JOIN USUARIO UC');
        Add('ON (UC.USER_ID = CP.CPAG_USER_ID_CANC)');
        Add('WHERE CP.CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqContaPagar.TemRegistros then
          Add('AND CP.CPAG_ID ' + frPesqContaPagar.InGrid());

        if frPesqFornecedores.TemRegistros then
          Add('AND CP.CPAG_FORN_ID ' + frPesqFornecedores.InGrid());

        if frPesqPlanoContas.TemRegistros then
          Add('AND CP.CPAG_PLCT_ID ' + frPesqPlanoContas.InGrid());

        if frPesqTipoDoc.TemRegistros then
          Add('AND CP.CPAG_GENE_ID_TIPO_DOC ' + frPesqTipoDoc.InGrid());

        if frPesqContaBancaria.TemRegistros then
          Add('AND CP.CPAG_CBCO_ID ' + frPesqContaBancaria.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND CP.CPAG_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND CP.CPAG_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        if edtDt_Emissao_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Inicio.Date)));
        if edtDt_Emissao_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Fim.Date)));
        if edtDt_Vcto_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Inicio.Date)));
        if edtDt_Vcto_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Fim.Date)));
        if edtDt_Pagto_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_PGTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Inicio.Date)));
        if edtDt_Pagto_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_PGTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Pagto_Fim.Date)));
        if edtDt_Canc_Inicio.Date > 0 then
          Add('AND CP.CPAG_DTA_CANC >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Inicio.Date)));
        if edtDt_Canc_Fim.Date > 0 then
          Add('AND CP.CPAG_DTA_CANC <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Canc_Fim.Date)));
        if edtDtEfetivaInicio.Date > 0 then
          Add('AND CP.CPAG_DTA_EFETIVO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaInicio.Date)));
        if edtDtEfetivaFim.Date > 0 then
          Add('AND CP.CPAG_DTA_EFETIVO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEfetivaFim.Date)));

        case rdStatus.ItemIndex of
          0 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('A'));
          1 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('F'));
          2 : Add('AND CP.CPAG_STATUS = ' + QuotedStr('C'));
        end;
        Add('ORDER BY ANO,MES,');
        case rdOrdena.ItemIndex of
          0  : Add('CP.CPAG_ID');
          1  : Add('CP.CPAG_NR_DOC');
          2  : Add('CP.CPAG_PROVENIENTE');
          3  : Add('FN.FORN_NOME_FANTASIA');
          4  : Add('PL.PLCT_DESCRICAO');
          5  : Add('CP.CPAG_DTA_CADASTRO');
          6  : Add('CP.CPAG_DTA_EMISSAO');
          7  : Add('CP.CPAG_DTA_VCTO');
          8  : Add('CP.CPAG_DTA_PGTO');
          9  : Add('CP.CPAG_DTA_CANC');
          10 : Add('STATUS');
          11 : Add('CP.CPAG_VALOR_DOC');
        end;
      end;
//      showmessage(sltTMP.Text);
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Contas_Pagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmRel_Contas_Pagar);
  FreeAndNil(fRel_Contas_Pagar_Sintetico);
  FreeAndNil(fRel_Contas_Pagar_Analitico);
end;

procedure TfRel_Contas_Pagar.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Contas_Pagar = nil then
    dmRel_Contas_Pagar := TdmRel_Contas_Pagar.Create(NIl);
  cdsGeral     := dmRel_Contas_Pagar.cdsRel_Contas_Pagar;
  inherited;
  dstRelatorio.DataSource := dmRel_Contas_Pagar.dsRel_Contas_Pagar;
  dstRelatorioAcertos.DataSource := dmRel_Contas_Pagar.dsAcertos;
end;

procedure TfRel_Contas_Pagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Contas_Pagar.FormShow(Sender: TObject);
begin
  inherited;
  edtDt_Vcto_Inicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Vcto_Fim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  SetaValoresFrames();
end;

procedure TfRel_Contas_Pagar.SetaValoresFrames();
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesquisa) then begin
      (Components[intI] as TfrPesquisa).Limpar;
      (Components[intI] as TfrPesquisa).funcLocal := Self.funcBasico;
      (Components[intI] as TfrPesquisa).ckPlanoContas.Checked := funcBasico.FiltrarPlanoContasPAI;
    end;
  end;
end;

procedure TfRel_Contas_Pagar.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Pagar.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Pagar.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Contas_Pagar.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Contas_Pagar);
finalization
  UnRegisterClass(TfRel_Contas_Pagar);

end.
