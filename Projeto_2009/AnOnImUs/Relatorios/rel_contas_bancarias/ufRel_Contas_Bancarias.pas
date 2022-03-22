unit ufRel_Contas_Bancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Contas_Bancarias = class(TfBasico)
    Panel1: TPanel;
    rdTipo_Impressao: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    GroupBox7: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdStatus: TRadioGroup;
    frPesqContaBancaria: TfrPesquisa;
    frPesqMovimentacao: TfrPesquisa;
    dstRelatorioAnalitico: TfrxDBDataset;
    frRelatorioMov: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure frPesqMovimentacaobtnPesqClick(Sender: TObject);
  private
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Contas_Bancarias: TfRel_Contas_Bancarias;

implementation

uses udmRel_Contas_Bancarias, ufRel_Contas_Bancarias_Analitico;

{$R *.dfm}

procedure TfRel_Contas_Bancarias.btnNovoClick(Sender: TObject);
begin
  if funcBasico.EmpresasBloqueada() then Exit;
  if (edtDtInicio.Date <= 0) or (edtDtFim.Date <= 0) then begin
    funcBasico.Alerta('Informe um período para pesquisa antes de continuar.',1);
    edtDtInicio.SetFocus;
    Exit;
  end;
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Contas_Bancarias.cdsContas_Bancarias do begin
      dmRel_Contas_Bancarias.DtInicio := edtDtInicio.Date;
      dmRel_Contas_Bancarias.DtFim    := edtDtFim.Date;
      dmRel_Contas_Bancarias.InGrid   := '';
      if frPesqMovimentacao.TemRegistros then
      dmRel_Contas_Bancarias.InGrid   := frPesqMovimentacao.InGrid();
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        case rdTipo_Impressao.ItemIndex of
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := '';
                TfrxMemoView(FindComponent('lbFild02')).Text   := '';
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período:';
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
              with frRelatorioMov do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos:';
                TfrxMemoView(FindComponent('lbFild01')).Text   := rdStatus.Items[rdStatus.ItemIndex];
                TfrxMemoView(FindComponent('lbTit02')).Text    := '';
                TfrxMemoView(FindComponent('lbFild02')).Text   := '';
                TfrxMemoView(FindComponent('lbTit03')).Text    := 'Período:';
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
                  0 : frRelatorioMov.ShowReport();
                  1 : frRelatorioMov.Print;
                end;
              end;
              {if fRel_Contas_Bancarias_Analitico = nil then
                fRel_Contas_Bancarias_Analitico := TfRel_Contas_Bancarias_Analitico.Create(nil);
              with fRel_Contas_Bancarias_Analitico do begin
                lbTit01.Caption  := '';
                lbFild01.Caption := '';
                lbTit02.Caption  := 'Status:   ';
                lbFild02.Caption := rdStatus.Items[rdStatus.ItemIndex];
                lbTit03.Caption  := 'Período:  ';
                lbFild03.Caption := '';
                if (edtDtInicio.Date > 0) then
                  lbFild03.Caption := lbFild03.Caption + edtDtInicio.Text;
                if (edtDtFim.Date > 0) then
                  lbFild03.Caption := lbFild03.Caption + ' à ' + edtDtFim.Text;
                if (edtDtInicio.Date <= 0) and (edtDtFim.Date <= 0) then begin
                  lbTit03.Enabled  := false;
                  lbFild03.Enabled := false;
                end;
                dtInicio   := edtDtInicio.Date;
                dtFim      := edtDtFim.Date;
                strGene_ID := funcLocal.Se(frPesqMovimentacao.TemRegistros,frPesqMovimentacao.InGrid,'');
                case rdOpcao_Impressao.ItemIndex of
                  0 : qrepRelatorio.Preview;
                  1 : qrepRelatorio.Print;
                end;
              end;}
            finally
            end;
          end;
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',1);
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_Contas_Bancarias.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      CB.CBCO_ID,');
        Add('      CB.CBCO_EMPR_ID,');
        Add('      CB.CBCO_DESCRICAO,');
        Add('      CB.CBCO_GENE_EMPR_ID_BCO,');
        Add('      CB.CBCO_GENE_TGEN_ID_BCO,');
        Add('      CB.CBCO_GENE_ID_BCO,');
        Add('      CB.CBCO_AGENCIA,');
        Add('      CB.CBCO_CONTA,');
        Add('      CB.CBCO_TIPO,');
        Add('      CASE CB.CBCO_TIPO');
        Add('           WHEN ' + QuotedStr('C') + ' THEN ' + QuotedStr('C. Corrente'));
        Add('           WHEN ' + QuotedStr('P') + ' THEN ' + QuotedStr('C. Poupança'));
        Add('      END AS TIPO,');
        Add('      CB.CBCO_GERENTE,');
        Add('      CB.CBCO_VALOR_INICIAL,');
        Add('      CB.CBCO_SALDO_ATUAL,');
        Add('      CB.CBCO_ATIVO,');
        Add('      CASE CB.CBCO_ATIVO');
        Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
        Add('           WHEN 0 THEN ' + QuotedStr('Não'));
        Add('      END AS ATIVO,');
        Add('      CB.CBCO_DTA_CADASTRO,');
        Add('      CB.CBCO_USER_ID,');
        Add('      CB.CBCO_LIMITE,');
        Add('      CB.CBCO_DIA_LIMITE,');
        Add('      BC.GENE_DESCR BANCO,');
        Add('      BC.GENE_PAR1  COD_BANCO');
        Add('FROM  CONTAS_BANCARIAS CB');
        Add('INNER JOIN GENERICA BC');
        Add('ON (BC.GENE_EMPR_ID = CB.CBCO_GENE_EMPR_ID_BCO');
        Add('AND BC.GENE_TGEN_ID = CB.CBCO_GENE_TGEN_ID_BCO');
        Add('AND BC.GENE_ID      = CB.CBCO_GENE_ID_BCO)');
        Add('WHERE CB.CBCO_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqContaBancaria.TemRegistros then
          Add('AND CB.CBCO_ID ' + frPesqContaBancaria.InGrid());

        case rdStatus.ItemIndex of
          0 : Add('AND CB.CBCO_ATIVO = 1');
          1 : Add('AND CB.CBCO_ATIVO = 0');
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

procedure TfRel_Contas_Bancarias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmRel_Contas_Bancarias);
  FreeAndNil(fRel_Contas_Bancarias_Analitico);
end;

procedure TfRel_Contas_Bancarias.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Contas_Bancarias = nil then
    dmRel_Contas_Bancarias := TdmRel_Contas_Bancarias.Create(NIl);
  inherited;
  edtDtInicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDtFim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
end;

procedure TfRel_Contas_Bancarias.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Contas_Bancarias.frPesqMovimentacaobtnPesqClick(
  Sender: TObject);
begin
  inherited;
  frPesqMovimentacao.btnPesqClick(Sender);

end;

procedure TfRel_Contas_Bancarias.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Bancarias.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Contas_Bancarias.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Contas_Bancarias.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Contas_Bancarias);
finalization
  UnRegisterClass(TfRel_Contas_Bancarias);

end.
