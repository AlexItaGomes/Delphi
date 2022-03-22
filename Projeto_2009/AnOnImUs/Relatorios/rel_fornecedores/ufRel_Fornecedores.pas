unit ufRel_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Fornecedores = class(TfBasico)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdAtivo: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    rdOrdena: TRadioGroup;
    frPesqFornecedores: TfrPesquisa;
    frPesqPraca: TfrPesquisa;
    frxRelatorioAnalitico: TfrxReport;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Fornecedores: TfRel_Fornecedores;

implementation

uses udmRel_Fornecedores;

{$R *.dfm}

procedure TfRel_Fornecedores.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Fornecedores.cdsRel_Fornecedores do begin
      close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        case rdTipo_Impressao.ItemIndex of
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativo: ';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdAtivo.Items[rdAtivo.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Ordenado: ';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período: ';
                TfrxMemoView(FindComponent('lbFild03')).Text   := '';
                if (edtDtInicio.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := TfrxMemoView(FindComponent('lbFild03')).Text + edtDtInicio.Text;
                if (edtDtFim.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := TfrxMemoView(FindComponent('lbFild03')).Text + ' à ' + edtDtFim.Text;
                if (edtDtInicio.Date <= 0) and (edtDtFim.Date <= 0) then begin
                  TfrxMemoView(FindComponent('lbTit03')).Visible  := false;
                  TfrxMemoView(FindComponent('lbFild03')).Visible := false;
                end;
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
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativo: ';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdAtivo.Items[rdAtivo.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := 'Ordenado: ';
                TfrxMemoView(FindComponent('lbFild02')).Text   := rdOrdena.Items[rdOrdena.ItemIndex];
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período: ';
                TfrxMemoView(FindComponent('lbFild03')).Text   := '';
                if (edtDtInicio.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := TfrxMemoView(FindComponent('lbFild03')).Text + edtDtInicio.Text;
                if (edtDtFim.Date > 0) then
                  TfrxMemoView(FindComponent('lbFild03')).Text := TfrxMemoView(FindComponent('lbFild03')).Text + ' à ' + edtDtFim.Text;
                if (edtDtInicio.Date <= 0) and (edtDtFim.Date <= 0) then begin
                  TfrxMemoView(FindComponent('lbTit03')).Visible  := false;
                  TfrxMemoView(FindComponent('lbFild03')).Visible := false;
                end;
                case rdOpcao_Impressao.ItemIndex of
                  0 : frxRelatorioAnalitico.ShowReport();
                  1 : frxRelatorioAnalitico.Print;
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

function TfRel_Fornecedores.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    try
      sltTMP := TStringList.Create;
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      FN.FORN_ID,');
        Add('      FN.FORN_RAZAO_SOCIAL,');
        Add('      FN.FORN_NOME_FANTASIA,');
        Add('      FN.FORN_CNPJ_CPF,');
        Add('      FN.FORN_IE,');
        Add('      FN.FORN_CEP,');
        Add('      FN.FORN_ENDERECO,');
        Add('      FN.FORN_BAIRRO,');
        Add('      FN.FORN_GENE_EMPR_ID_PRACA,');
        Add('      FN.FORN_GENE_TGEN_ID_PRACA,');
        Add('      FN.FORN_GENE_ID_PRACA,');
        Add('      FN.FORN_CONTATO,');
        Add('      FN.FORN_TELEFONE,');
        Add('      FN.FORN_FAX,');
        Add('      FN.FORN_SITE,');
        Add('      FN.FORN_EMAIL,');
        Add('      FN.FORN_ATIVO,');
        Add('      FN.FORN_TIPO,');
        Add('      FN.FORN_DTA_CADASTRO,');
        Add('      FN.FORN_USER_ID,');
        Add('      CASE FN.FORN_ATIVO');
        Add('           WHEN 0 THEN ' + QuotedStr('Não'));
        Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
        Add('      END AS ATIVO,');
        Add('      PR.GENE_DESCR CIDADE,');
        Add('      PR.GENE_PAR1 UF');
        Add('FROM  FORNECEDORES FN');
        Add('INNER JOIN GENERICA PR');
        Add('ON (PR.GENE_EMPR_ID = FN.FORN_GENE_EMPR_ID_PRACA');
        Add('AND PR.GENE_TGEN_ID = FN.FORN_GENE_TGEN_ID_PRACA');
        Add('AND PR.GENE_ID      = FN.FORN_GENE_ID_PRACA)');
        Add('WHERE FN.FORN_ID > 0');

        if frPesqFornecedores.TemRegistros() then
          Add('AND FN.FORN_ID ' + frPesqFornecedores.InGrid());

        if frPesqPraca.TemRegistros() then
          Add('AND FN.FORN_GENE_ID_PRACA ' + frPesqPraca.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND FN.FORN_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND FN.FORN_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        case rdAtivo.ItemIndex of
          0 : Add('AND FN.FORN_ATIVO = 1');
          1 : Add('AND FN.FORN_ATIVO = 0');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY FN.FORN_ID');
          1 : Add('ORDER BY FN.FORN_RAZAO_SOCIAL');
          2 : Add('ORDER BY FN.FORN_NOME_FANTASIA');
          3 : Add('ORDER BY FN.FORN_TIPO');
          4 : Add('ORDER BY CIDADE');
          5 : Add('ORDER BY FN.FORN_DTA_CADASTRO');
        end;
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Fornecedores.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Fornecedores = nil then
    dmRel_Fornecedores := TdmRel_Fornecedores.Create(NIl);
  cdsGeral     := dmRel_Fornecedores.cdsRel_Fornecedores;
  inherited;
  dstRelatorio.DataSource := dmRel_Fornecedores.dsRel_Fornecedores;
end;

procedure TfRel_Fornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Fornecedores.FormShow(Sender: TObject);
begin
  inherited;
  btnImprimir.Enabled := funcBasico.GetLicenca(1) or
                         funcBasico.GetLicenca(2) or
                         funcBasico.GetLicenca(3) or
                         funcBasico.GetLicenca(4) or
                         funcBasico.GetLicenca(5);
end;

procedure TfRel_Fornecedores.Timer1Timer(Sender: TObject);
begin
//  inherited;

end;

procedure TfRel_Fornecedores.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Fornecedores.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Fornecedores.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Fornecedores);
finalization
  UnRegisterClass(TfRel_Fornecedores);

end.
