unit ufRel_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Clientes = class(TfBasico)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    rdAtivo: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    rdOrdena: TRadioGroup;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    frPesqClientes: TfrPesquisa;
    frPesqPraca: TfrPesquisa;
    frPesqRotas: TfrPesquisa;
    frRelatorioAnalitico: TfrxReport;
    procedure btnNovoClick(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Clientes: TfRel_Clientes;

implementation

uses udmRel_Clientes;

{$R *.dfm}

procedure TfRel_Clientes.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Clientes.cdsRel_Clientes do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        case rdTipo_Impressao.ItemIndex of
          0 : begin
            try
              with frRelatorio do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos: ';
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
              with frRelatorioAnalitico do begin
                TfrxMemoView(FindComponent('lbTit01')).Text    := 'Ativos: ';
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
                  0 : frRelatorioAnalitico.ShowReport();
                  1 : frRelatorioAnalitico.Print;
                end;
              end;
            finally
            end;
          end;
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos!',1);
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_Clientes.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    try
      sltTMP := TStringList.Create;
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      CL.CLIE_ID,');
        Add('      CL.CLIE_EMPR_ID,');
        Add('      CL.CLIE_RAZAO_SOCIAL,');
        Add('      CL.CLIE_FANTASIA,');
        Add('      CL.CLIE_CEP,');
        Add('      CL.CLIE_ENDERECO,');
        Add('      CL.CLIE_BAIRRO,');
        Add('      CL.CLIE_GENE_EMPR_ID_PRACA,');
        Add('      CL.CLIE_GENE_TGEN_ID_PRACA,');
        Add('      CL.CLIE_GENE_ID_PRACA,');
        Add('      CL.CLIE_RG,');
        Add('      CL.CLIE_TIPO,');
        Add('      CL.CLIE_CNPJ_CPF,');
        Add('      CL.CLIE_SITE,');
        Add('      CL.CLIE_EMAIL,');
        Add('      CL.CLIE_ATIVO,');
        Add('      CL.CLIE_TELEFONE1,');
        Add('      CL.CLIE_TELEFONE2,');
        Add('      CL.CLIE_TELEFONE3,');
        Add('      CL.CLIE_TELEFONE4,');
        Add('      CL.CLIE_DTA_CADASTRO,');
        Add('      CL.CLIE_USER_ID,');
        Add('      CASE CL.CLIE_ATIVO');
        Add('           WHEN 0 THEN ' + QuotedStr('Não'));
        Add('           WHEN 1 THEN ' + QuotedStr('Sim'));
        Add('      END AS ATIVO,');
        Add('      PR.GENE_DESCR,');
        Add('      PR.GENE_PAR1');
        Add('FROM  CLIENTES CL');
        Add('INNER JOIN GENERICA PR');
        Add('ON (PR.GENE_EMPR_ID = CL.CLIE_GENE_EMPR_ID_PRACA');
        Add('AND PR.GENE_TGEN_ID = CL.CLIE_GENE_TGEN_ID_PRACA');
        Add('AND PR.GENE_ID      = CL.CLIE_GENE_ID_PRACA)');
        Add('WHERE CL.CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));

        if frPesqClientes.TemRegistros then
          Add('AND CL.CLIE_ID ' + frPesqClientes.InGrid());

        if frPesqPraca.TemRegistros then
          Add('AND CL.CLIE_GENE_ID_PRACA ' + frPesqPraca.InGrid());

        if frPesqRotas.TemRegistros then
          Add('AND CL.CLIE_GENE_ID_ROTA ' + frPesqRotas.InGrid());

        if edtDtInicio.Date > 0 then
          Add('AND CL.CLIE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        if edtDtFim.Date > 0 then
          Add('AND CL.CLIE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        case rdAtivo.ItemIndex of
          0 : Add('AND CL.CLIE_ATIVO = 1');
          1 : Add('AND CL.CLIE_ATIVO = 0');
        end;
        case rdOrdena.ItemIndex of
          0 : Add('ORDER BY CL.CLIE_ID');
          1 : Add('ORDER BY CL.CLIE_RAZAO_SOCIAL');
          2 : Add('ORDER BY CL.CLIE_FANTASIA');
          3 : Add('ORDER BY CL.CLIE_TIPO');
          4 : Add('ORDER BY PR.GENE_DESCR');
          5 : Add('ORDER BY CL.CLIE_DTA_CADASTRO');
        end;
      end;
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Clientes.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
  dstRelatorio.DataSource := dmRel_Clientes.dsRel_Clientes;
end;

procedure TfRel_Clientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Clientes.Timer1Timer(Sender: TObject);
begin
//  inherited;

end;

procedure TfRel_Clientes.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Clientes.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Clientes.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Clientes);
finalization

  UnRegisterClass(TfRel_Clientes);

end.
