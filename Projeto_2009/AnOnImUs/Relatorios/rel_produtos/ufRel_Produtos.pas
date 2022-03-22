unit ufRel_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, ComCtrls, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Produtos = class(TfBasico)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    rdTipo_Impressao: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdAtivo: TRadioGroup;
    rdOrdena: TRadioGroup;
    rdTipoEstoque: TRadioGroup;
    frPesqProduto: TfrPesquisa;
    frPesqFornec: TfrPesquisa;
    frPesqTipoProd: TfrPesquisa;
    frPesqGrupo: TfrPesquisa;
    frPesqMarca: TfrPesquisa;
    frPesqModelo: TfrPesquisa;
    frxRelatorioAnalitico: TfrxReport;
    dstRelatorioAnalitico: TfrxDBDataset;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqProdutobtnPesqClick(Sender: TObject);
  private
    function  GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Produtos: TfRel_Produtos;

implementation

uses udmRel_Produtos;

{$R *.dfm}

procedure TfRel_Produtos.btnNovoClick(Sender: TObject);
begin
  try
    inherited;
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Produtos.cdsRel_Produtos do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        case rdTipo_Impressao.ItemIndex of
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdAtivo.Items[rdAtivo.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Ordenado:';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Estoque:';
                TfrxMemoView(FindComponent('lbFild03')).Text   := rdTipoEstoque.Items[rdTipoEstoque.ItemIndex];
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
              with frxRelatorioAnalitico do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdAtivo.Items[rdAtivo.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Ordenado:';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Estoque:';
                TfrxMemoView(FindComponent('lbFild03')).Text   := rdTipoEstoque.Items[rdTipoEstoque.ItemIndex];
                case rdOpcao_Impressao.ItemIndex of
                  0 : frxRelatorioAnalitico.ShowReport();
                  1 : frxRelatorioAnalitico.Print;
                end;
              end;
            finally
            end;
          end;
        end;
      end else begin
        funcBasico.Alerta('Não há registros a serem impressos!',0);
      end;
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

function TfRel_Produtos.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      PR.PROD_ID,');
        Add('      PR.PROD_DESCRICAO,');
        Add('      UN.GENE_PAR1 AS PROD_UNIDADE,');
        Add('      CASE PR.PROD_ATIVO');
        Add('           WHEN 0 THEN ' + QuotedStr('Não'));
        Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
        Add('      END AS PROD_ATIVO,');
        Add('      PR.PROD_DTA_ULT_COMPRA,');
        Add('      PR.PROD_VLR_CUSTO,');
        Add('      PR.PROD_ESTQ_INICIAL,');
        Add('      PR.PROD_ESTQ_MINIMO,');
        Add('      PR.PROD_GARANTIA,');
        Add('      CASE PR.PROD_FLG_FRACIONADO');
        Add('           WHEN 0 THEN ' + QuotedStr('Não'));
        Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
        Add('      END AS PROD_FLG_FRACIONADO,');
        Add('      PR.PROD_DTA_CADASTRO,');
        Add('      FN.FORN_NOME_FANTASIA,');
        Add('      TP.GENE_DESCR TIPO_PROD,');
        Add('      GP.GENE_DESCR GRUPO_PROD,');
        Add('      MC.GENE_DESCR MARCA_PROD,');
        Add('      MD.GENE_DESCR MODELO_PROD,');
        Add('      AL.GENE_DESCR ALIQUOTA_ECF,');
        Add('      AL.GENE_PAR1  VLR_ALIQUOTA,');
        Add('      COALESCE(ET.ESTQ_EST_ATUAL,0) ESTQ_EST_ATUAL,');
        Add('      COALESCE(ET.ESTQ_EST_DISP,0) ESTQ_EST_DISP,');
        Add('      COALESCE((SELECT FIRST 1');
        Add('                      TPIT_VLR_GONDOLA');
        Add('                      FROM  TABELA_PRECO_ITENS PI');
        Add('               WHERE PI.TPIT_PROD_ID      = PR.PROD_ID');
        Add('               AND   PI.TPIT_PROD_EMPR_ID = PR.PROD_EMPR_ID),0) VLR_VENDA');
        Add('FROM  PRODUTOS PR');
        Add('INNER JOIN GENERICA UN');
        Add('ON (UN.GENE_EMPR_ID = PR.PROD_GENE_EMPR_ID_UNID');
        Add('AND UN.GENE_TGEN_ID = PR.PROD_GENE_TGEN_ID_UNID');
        Add('AND UN.GENE_ID = PR.PROD_GENE_ID_UNID)');
        Add('LEFT OUTER JOIN ESTOQUE ET');
        Add('ON (ET.ESTQ_PROD_ID      = PR.PROD_ID');
        Add('AND ET.ESTQ_PROD_EMPR_ID = PR.PROD_EMPR_ID)');
        Add('INNER JOIN FORNECEDORES FN');
        Add('ON (FN.FORN_ID          = PR.PROD_FORN_ID)');
        Add('INNER JOIN GENERICA TP');
        Add('ON (TP.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_TP_PROD');
        Add('AND TP.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_TP_PROD');
        Add('AND TP.GENE_ID          = PR.PROD_GENE_ID_TP_PROD)');
        Add('INNER JOIN GENERICA GP');
        Add('ON (GP.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_GRUPO');
        Add('AND GP.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_GRUPO');
        Add('AND GP.GENE_ID          = PR.PROD_GENE_ID_GRUPO)');
        Add('INNER JOIN GENERICA MC');
        Add('ON (MC.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_MARCA');
        Add('AND MC.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_MARCA');
        Add('AND MC.GENE_ID          = PR.PROD_GENE_ID_MARCA)');
        Add('INNER JOIN GENERICA MD');
        Add('ON (MD.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_MODELO');
        Add('AND MD.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_MODELO');
        Add('AND MD.GENE_ID          = PR.PROD_GENE_ID_MODELO)');
        Add('LEFT OUTER JOIN GENERICA AL');
        Add('ON (AL.GENE_EMPR_ID     = PR.PROD_GENE_EMPR_ID_ALQ_ECF');
        Add('AND AL.GENE_TGEN_ID     = PR.PROD_GENE_TGEN_ID_ALQ_ECF');
        Add('AND AL.GENE_ID          = PR.PROD_GENE_ID_ALQ_ECF)');
        Add('WHERE PR.PROD_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqProduto.TemRegistros then
          Add('AND PR.PROD_ID ' + frPesqProduto.InGrid());
        if frPesqFornec.TemRegistros then
          Add('AND PR.PROD_FORN_ID ' + frPesqFornec.InGrid());
        if frPesqTipoProd.TemRegistros then
          Add('AND PR.PROD_GENE_ID_TP_PROD ' + frPesqTipoProd.InGrid());
        if frPesqGrupo.TemRegistros then
          Add('AND PR.PROD_GENE_ID_GRUPO ' + frPesqGrupo.InGrid());
        if frPesqMarca.TemRegistros then
          Add('AND PR.PROD_GENE_ID_MARCA ' + frPesqMarca.InGrid());
        if frPesqModelo.TemRegistros then
          Add('AND PR.PROD_GENE_ID_MODELO ' + frPesqModelo.InGrid());
        if edtDtInicio.Date > 0 then begin
          Add('AND PR.PROD_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('m/dd/yyyy',edtDtInicio.Date)));
        end;
        if edtDtFim.Date > 0 then begin
          Add('AND PR.PROD_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('m/dd/yyyy',edtDtFim.Date)));
        end;
        case rdAtivo.ItemIndex of
          0 : Add('AND PR.PROD_ATIVO = 1');
          1 : Add('AND PR.PROD_ATIVO = 0');
        end;
        case rdTipoEstoque.ItemIndex of
          0 : Add('AND ET.ESTQ_EST_DISP < PR.PROD_ESTQ_MINIMO');
          1 : Add('AND ET.ESTQ_EST_DISP > PR.PROD_ESTQ_MINIMO');
          2 : Add('AND ET.ESTQ_EST_DISP = PR.PROD_ESTQ_MINIMO');
          3 : Add('AND ET.ESTQ_EST_DISP > 0');
          4 : Add('AND ET.ESTQ_EST_ATUAL > 0');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY PR.PROD_ID');
          1 : Add('ORDER BY PR.PROD_DESCRICAO');
          2 : Add('ORDER BY FN.FORN_NOME_FANTASIA');
          3 : Add('ORDER BY GRUPO_PROD');
          4 : Add('ORDER BY MARCA_PROD');
          5 : Add('ORDER BY MODELO_PROD');
        end;
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Produtos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
  dstRelatorio.DataSource := dmRel_Produtos.dsRel_Produtos;
  dstRelatorioAnalitico.DataSource := dmRel_Produtos.dsRelCompProdutos;
end;

procedure TfRel_Produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

procedure TfRel_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  PageControl1.Pages[0].Show;
  frPesqProduto.SetFocus;
end;

procedure TfRel_Produtos.frPesqProdutobtnPesqClick(Sender: TObject);
begin
  inherited;
  frPesqProduto.btnPesqClick(Sender);

end;

procedure TfRel_Produtos.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Produtos.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
// inherited;
end;

procedure TfRel_Produtos.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Produtos);
finalization
  UnRegisterClass(TfRel_Produtos);

end.
