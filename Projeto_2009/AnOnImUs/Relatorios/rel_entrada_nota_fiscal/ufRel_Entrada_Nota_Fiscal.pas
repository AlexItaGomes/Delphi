unit ufRel_Entrada_Nota_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, Menus, uFrPesquisa, frxClass, frxDBSet;

type
  TfRel_Entrada_Nota_Fiscal = class(TfBasico)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    GroupBox2: TGroupBox;
    edtDtEntInicio: TDateEdit;
    edtDtEntFim: TDateEdit;
    GroupBox3: TGroupBox;
    edtDtEmiInicio: TDateEdit;
    edtDtEmiFim: TDateEdit;
    rdStatus: TRadioGroup;
    rdOrdena: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    frPesqFornec: TfrPesquisa;
    frPesqNotaFiscal: TfrPesquisa;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function  GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Entrada_Nota_Fiscal: TfRel_Entrada_Nota_Fiscal;

implementation

uses udmRel_Entrada_Nota_Fiscal, ufRel_Entrada_Nota_Fiscal_Analitico,
  ufRel_Entrada_Nota_Fiscal_Sintetico;

{$R *.dfm}

procedure TfRel_Entrada_Nota_Fiscal.btnNovoClick(Sender: TObject);
begin
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Entrada_Nota_Fiscal do begin
      with cdsRelNotaFiscal do begin
        Close;
        CommandText := GeraSQL;
        Open;
        if not IsEmpty then begin
          case rdTipo_Impressao.ItemIndex of
            0 : begin
              try
                if fRel_Entrada_Nota_Fiscal_Sintetico = nil then
                  fRel_Entrada_Nota_Fiscal_Sintetico := TfRel_Entrada_Nota_Fiscal_Sintetico.Create(nil);
                  with fRel_Entrada_Nota_Fiscal_Sintetico do begin
                    lbTit01.Caption  := 'Status: ';
                    lbFild01.Caption := rdStatus.Items[rdStatus.ItemIndex];
                    lbTit02.Caption  := 'Ordenado: ';
                    lbFild02.Caption := rdOrdena.Items[rdOrdena.ItemIndex];
                    lbTit03.Enabled  := false;
                    lbFild03.Enabled := false;
                    case rdOpcao_Impressao.ItemIndex of
                      0 : qrepRelatorio.Preview;
                      1 : qrepRelatorio.Print;
                    end;
                  end;
              finally
                FreeAndNil(fRel_Entrada_Nota_Fiscal_Sintetico);
              end;
            end;
            1 : begin
              try
                if fRel_Entrada_Nota_Fiscal_Analitico = nil then
                  fRel_Entrada_Nota_Fiscal_Analitico := TfRel_Entrada_Nota_Fiscal_Analitico.Create(nil);
                  with fRel_Entrada_Nota_Fiscal_Analitico do begin
                    lbTit01.Caption  := 'Status: ';
                    lbFild01.Caption := rdStatus.Items[rdStatus.ItemIndex];
                    lbTit02.Caption  := 'Ordenado: ';
                    lbFild02.Caption := rdOrdena.Items[rdOrdena.ItemIndex];
                    lbTit03.Enabled  := false;
                    lbFild03.Enabled := false;
                    case rdOpcao_Impressao.ItemIndex of
                      0 : qrepRelatorio.Preview;
                      1 : qrepRelatorio.Print;
                    end;
                  end;
              finally
                FreeAndNil(fRel_Entrada_Nota_Fiscal_Analitico);
              end;
            end;
          end;
        end else funcLocal.Alerta('Não há registros a serem impressos.',1)
      end;
    end;
  finally
    funcBasico.MSGAguarde(false);
    funcBasico.MSGAguarde(false);
    btnImprimir.Enabled := true;
  end;
end;

procedure TfRel_Entrada_Nota_Fiscal.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
end;

procedure TfRel_Entrada_Nota_Fiscal.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

function TfRel_Entrada_Nota_Fiscal.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      NF.NFEN_ID,');
        Add('      NF.NFEN_EMPR_ID,');
        Add('      NF.NFEN_FORN_ID,');
        Add('      NF.NFEN_DTA_EMISSAO,');
        Add('      NF.NFEN_DTA_ENTRADA,');
        Add('      NF.NFEN_NR_NOTA,');
        Add('      NF.NFEN_NR_SERIE,');
        Add('      NF.NFEN_VLR_TOTAL_PROD,');
        Add('      NF.NFEN_VLR_TOTAL_NOTA,');
        Add('      CASE NF.NFEN_CONCILIADO');
        Add('           WHEN 0 THEN ' + QuotedStr('Aberto'));
        Add('           WHEN 1 THEN ' + QuotedStr('Conciliado'));
        Add('           WHEN 2 THEN ' + QuotedStr('Cancelado'));
        Add('      END AS NFEN_CONCILIADO,');
        Add('      NF.NFEN_DTA_CONCILIADO,');
        Add('      NF.NFEN_DTA_CANCELADO,');
        Add('      NF.NFEN_USER_ID_CANC,');
        Add('      NF.NFEN_MOTIVO_CANC,');
        Add('      NF.NFEN_DTA_CADASTRO,');
        Add('      NF.NFEN_USER_ID,');
        Add('      NF.NFEN_VLR_TOTAL_DESC,');
        Add('      FN.FORN_NOME_FANTASIA');
        Add('FROM  NOTA_FISCAL NF');
        Add('INNER JOIN FORNECEDORES FN');
        Add('ON (FN.FORN_ID          = NF.NFEN_FORN_ID)');
        Add('WHERE NF.NFEN_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        if frPesqFornec.TemRegistros then
          Add('AND  NF.NFEN_FORN_ID ' + frPesqFornec.InGrid());
        if frPesqNotaFiscal.TemRegistros then
          Add('AND NF.NFEN_ID ' + frPesqNotaFiscal.InGrid());
        if edtDtInicio.Date > 0 then begin
          Add('AND NF.NFEN_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
        end;
        if edtDtFim.Date > 0 then begin
          Add('AND NF.NFEN_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
        end;
        if edtDtEntInicio.Date > 0 then begin
          Add('AND NF.NFEN_DTA_ENTRADA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEntInicio.Date)));
        end;
        if edtDtEntFim.Date > 0 then begin
          Add('AND NF.NFEN_DTA_ENTRADA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEntFim.Date)));
        end;
        if edtDtEmiInicio.Date > 0 then begin
          Add('AND NF.NFEN_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEmiInicio.Date)));
        end;
        if edtDtEmiFim.Date > 0 then begin
          Add('AND NF.NFEN_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEmiFim.Date)));
        end;
        case rdStatus.ItemIndex of
          0 : Add('AND NF.NFEN_CONCILIADO = 0');
          1 : Add('AND NF.NFEN_CONCILIADO = 1');
          2 : Add('AND NF.NFEN_CONCILIADO = 2');
        end;
        case rdOrdena.ItemIndex of
          0  : Add('ORDER BY NF.NFEN_ID');
          1  : Add('ORDER BY NF.NFEN_NR_NOTA');
          2  : Add('ORDER BY NF.NFEN_NR_SERIE');
          3  : Add('ORDER BY NF.NFEN_DTA_EMISSAO');
          4  : Add('ORDER BY NF.NFEN_DTA_ENTRADA');
          5  : Add('ORDER BY NF.NFEN_DTA_CADASTRO');
          6  : Add('ORDER BY NF.NFEN_FORN_ID');
          7  : Add('ORDER BY FN.FORN_NOME_FANTASIA');
          8  : Add('ORDER BY NF.NFEN_VLR_TOTAL_PROD');
          9  : Add('ORDER BY NF.NFEN_VLR_TOTAL_PROD DESC');
          10 : Add('ORDER BY NF.NFEN_VLR_TORAL_DESC');
          11 : Add('ORDER BY NF.NFEN_VLR_TOTAL_DESC DESC');
          12 : Add('ORDER BY NF.NFEN_VLR_TOTAL_NOTA');
          13 : Add('ORDER BY NF.NFEN_VLR_TOTAL_NOTA DESC');
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

procedure TfRel_Entrada_Nota_Fiscal.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Entrada_Nota_Fiscal.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Entrada_Nota_Fiscal.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Entrada_Nota_Fiscal);
finalization
  UnRegisterClass(TfRel_Entrada_Nota_Fiscal);

end.
