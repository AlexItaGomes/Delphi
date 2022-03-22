unit ufRel_ABC_Financas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfRel_ABC_Financas = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    rdTipo: TRadioGroup;
    rdVisualizacao: TRadioGroup;
    rdReceita: TRadioGroup;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure OpenClientDataSet;
    function GeraSQL(intTipo : Integer) : String;
    function GeraSQLPre(intTipo: Integer): String;
    function GeraRecSQL(intTipo : Integer) : String;
    function GeraRecSQLPre(intTipo: Integer): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_ABC_Financas: TfRel_ABC_Financas;

implementation

uses udmRel_ABC_Financas, ufRel_ABC_Financas_Sintetico,
  ufRel_ABC_Receitas_Sintetico;

{$R *.dfm}

procedure TfRel_ABC_Financas.btnNovoClick(Sender: TObject);
begin
  if funcBasico.EmpresasBloqueada() then Exit;
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    case rdReceita.ItemIndex of
      0 : begin
        with dmRel_Abc_Financas.cdsRel_ABC_Receitas do begin
          Close;
          case rdVisualizacao.ItemIndex of
            0 : CommandText := GeraRecSQLPre(rdTipo.ItemIndex);
            1 : CommandText := GeraRecSQL(rdTipo.ItemIndex);
          end;
          Open;
          if not IsEmpty then begin
            try
              if fRel_ABC_Receitas_Sintetico = nil then
                fRel_ABC_Receitas_Sintetico := TfRel_ABC_Receitas_Sintetico.Create(nil);
              with fRel_ABC_Receitas_Sintetico do begin
                lbTit01.Caption  := 'Tipo: ';
                lbFild01.Caption := rdVisualizacao.Items[rdVisualizacao.ItemIndex];
                lbTit02.Caption  := 'Lista por: ';
                lbFild02.Caption := rdTipo.Items[rdTipo.ItemIndex];
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
                dtDataI := edtDtInicio.Date;
                dtDataF := edtDtFim.Date;
                case rdTipo.ItemIndex of
                  0 : begin
                    lbID.Caption        := 'Cód. Simplif.';
                    lbDescricao.Caption := 'Plano de Contas';
                  end;
                  1 : begin
                    lbID.Caption        := 'Cód. Fornec.';
                    lbDescricao.Caption := 'Fornecedor';
                  end;
                end;
                intVisual := rdVisualizacao.ItemIndex;
                case rdOpcao_Impressao.ItemIndex of
                  0 : fRel_ABC_Receitas_Sintetico.qrepRelatorio.Preview;
                  1 : fRel_ABC_Receitas_Sintetico.qrepRelatorio.Print;
                end;
              end;
            finally
              FreeAndNil(fRel_ABC_Receitas_Sintetico);
            end;
          end else funcBasico.Alerta('Não há registros a serem impressos.',1);
        end;
      end;
      1 : begin
        with dmRel_Abc_Financas.cdsRel_ABC_Financas do begin
          Close;
          case rdVisualizacao.ItemIndex of
            0 : CommandText := GeraSQLPre(rdTipo.ItemIndex);
            1 : CommandText := GeraSQL(rdTipo.ItemIndex);
          end;
          Open;
          if not IsEmpty then begin
            try
              if fRel_ABC_Financas_Sintetico = nil then
                fRel_ABC_Financas_Sintetico := TfRel_ABC_Financas_Sintetico.Create(nil);
              with fRel_ABC_Financas_Sintetico do begin
                lbTit01.Caption  := 'Tipo: ';
                lbFild01.Caption := rdVisualizacao.Items[rdVisualizacao.ItemIndex];
                lbTit02.Caption  := 'Lista por: ';
                lbFild02.Caption := rdTipo.Items[rdTipo.ItemIndex];
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
                dtDataI := edtDtInicio.Date;
                dtDataF := edtDtFim.Date;
                case rdTipo.ItemIndex of
                  0 : begin
                    lbID.Caption        := 'Cód. Simplif.';
                    lbDescricao.Caption := 'Plano de Contas';
                  end;
                  1 : begin
                    lbID.Caption        := 'Cód. Fornec.';
                    lbDescricao.Caption := 'Fornecedor';
                  end;
                end;
                intVisual := rdVisualizacao.ItemIndex;
                case rdOpcao_Impressao.ItemIndex of
                  0 : fRel_ABC_Financas_Sintetico.qrepRelatorio.Preview;
                  1 : fRel_ABC_Financas_Sintetico.qrepRelatorio.Print;
                end;
              end;
            finally
              FreeAndNil(fRel_ABC_Financas_Sintetico);
            end;
          end else funcBasico.Alerta('Não há registros a serem impressos.',1);
        end;
      end;
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_ABC_Financas.GeraSQLPre(intTipo : Integer) : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      case intTipo of
        0 : begin
          Add('SELECT');
          Add('      PL.PLCT_COD_SIMPLIFICADO,');
          Add('      PL.PLCT_DESCRICAO,');
        end;
        1 : begin
          Add('SELECT');
          Add('      CAST(FN.FORN_ID AS VARCHAR(4)) AS PLCT_COD_SIMPLIFICADO,');
          Add('      FN.FORN_NOME_FANTASIA AS PLCT_DESCRICAO,');
        end;
      end;
      Add('      SUM(CP.CPAG_VALOR_DOC * -1) AS VALOR');
      Add('FROM  CONTAS_PAGAR CP');
      Add('INNER JOIN FORNECEDORES FN');
      Add('ON (FN.FORN_ID           = CP.CPAG_FORN_ID)');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID           = CP.CPAG_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID      = CP.CPAG_EMPR_ID)');
      Add('WHERE CP.CPAG_EMPR_ID       = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   CP.CPAG_DTA_VCTO     >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      Add('AND   CP.CPAG_DTA_VCTO     <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      Add('AND   CP.CPAG_STATUS       <> ' + QuotedStr('C'));
      Add('GROUP BY');
      Add('      PLCT_COD_SIMPLIFICADO,');
      Add('      PLCT_DESCRICAO');
      Add('ORDER BY');
      Add('      VALOR');
    end;
//    ShowMessage(sltTMP.Text);
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_ABC_Financas.GeraRecSQL(intTipo: Integer): String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      case intTipo of
        0 : begin
          Add('SELECT');
          Add('      PL.PLCT_COD_SIMPLIFICADO,');
          Add('      PL.PLCT_DESCRICAO,');
        end;
        1 : begin
          Add('SELECT');
          Add('      CAST(CL.CLIE_ID AS VARCHAR(6)) AS PLCT_COD_SIMPLIFICADO,');
          Add('      CL.CLIE_RAZAO_SOCIAL           AS PLCT_DESCRICAO,');
        end;
      end;
      Add('      SUM(AC.ACRE_VALOR_DOC) AS VALOR');
      Add('FROM  CONTAS_RECEBER CR');
      Add('INNER JOIN CLIENTES CL');
      Add('ON (CL.CLIE_ID           = CR.CREC_CLIE_ID');
      ADD('AND CL.CLIE_EMPR_ID      = CR.CREC_CLIE_EMPR_ID)');
      Add('INNER JOIN CONTAS_RECEBER_ACERTOS AC');
      Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
      Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID           = CR.CREC_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID      = CR.CREC_EMPR_ID)');
      Add('WHERE CR.CREC_EMPR_ID       = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   AC.ACRE_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      Add('AND   AC.ACRE_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      Add('AND   CR.CREC_STATUS       <> ' + QuotedStr('C'));
      Add('GROUP BY');
      Add('      PLCT_COD_SIMPLIFICADO,');
      Add('      PLCT_DESCRICAO');
      Add('ORDER BY');
      Add('      VALOR DESC');
    end;
//    ShowMessage(sltTMP.Text);
//    sltTMP.SaveToFile('C:\tmp\SQL.txt');
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_ABC_Financas.GeraRecSQLPre(intTipo: Integer): String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      case intTipo of
        0 : begin
          Add('SELECT');
          Add('      PL.PLCT_COD_SIMPLIFICADO,');
          Add('      PL.PLCT_DESCRICAO,');
        end;
        1 : begin
          Add('SELECT');
          Add('      CAST(CL.CLIE_ID AS VARCHAR(4)) AS PLCT_COD_SIMPLIFICADO,');
          Add('      CL.CLIE_RAZAO_SOCIAL           AS PLCT_DESCRICAO,');
        end;
      end;
      Add('      SUM(CR.CREC_VALOR_DOC) AS VALOR');
      Add('FROM  CONTAS_RECEBER CR');
      Add('INNER JOIN CLIENTES CL');
      Add('ON (CL.CLIE_ID           = CR.CREC_CLIE_ID');
      Add('AND CL.CLIE_EMPR_ID      = CR.CREC_CLIE_EMPR_ID)');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID           = CR.CREC_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID      = CR.CREC_PLCT_EMPR_ID)');
      Add('WHERE CR.CREC_EMPR_ID       = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   CR.CREC_DTA_VCTO     >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      Add('AND   CR.CREC_DTA_VCTO     <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      Add('AND   CR.CREC_STATUS       <> ' + QuotedStr('C'));
      Add('GROUP BY');
      Add('      PLCT_COD_SIMPLIFICADO,');
      Add('      PLCT_DESCRICAO');
      Add('ORDER BY');
      Add('      VALOR DESC');
    end;
//    ShowMessage(sltTMP.Text);
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

function TfRel_ABC_Financas.GeraSQL(intTipo : Integer) : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      case intTipo of
        0 : begin
          Add('SELECT');
          Add('      PL.PLCT_COD_SIMPLIFICADO,');
          Add('      PL.PLCT_DESCRICAO,');
        end;
        1 : begin
          Add('SELECT');
          Add('      CAST(FN.FORN_ID AS VARCHAR(4)) AS PLCT_COD_SIMPLIFICADO,');
          Add('      FN.FORN_NOME_FANTASIA AS PLCT_DESCRICAO,');
        end;
      end;
      Add('      SUM(AC.ACPG_VALOR_DOC * -1) AS VALOR');
      Add('FROM  CONTAS_PAGAR CP');
      Add('INNER JOIN FORNECEDORES FN');
      Add('ON (FN.FORN_ID           = CP.CPAG_FORN_ID)');
      Add('INNER JOIN CONTAS_PAGAR_ACERTOS AC');
      Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
      Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
      Add('INNER JOIN PLANO_CONTAS PL');
      Add('ON (PL.PLCT_ID           = CP.CPAG_PLCT_ID');
      Add('AND PL.PLCT_EMPR_ID      = CP.CPAG_EMPR_ID)');
      Add('WHERE CP.CPAG_EMPR_ID       = ' + IntToStr(funcBasico.Empr_ID));
      Add('AND   AC.ACPG_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtInicio.Date)));
      Add('AND   AC.ACPG_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtFim.Date)));
      Add('AND   CP.CPAG_STATUS       <> ' + QuotedStr('C'));
      Add('GROUP BY');
      Add('      PLCT_COD_SIMPLIFICADO,');
      Add('      PLCT_DESCRICAO');
      Add('ORDER BY');
      Add('      VALOR DESC');
    end;
    Result := sltTMP.Text;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_ABC_Financas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmRel_Abc_Financas);
  FreeAndNil(fRel_ABC_Financas_Sintetico);
end;

procedure TfRel_ABC_Financas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Abc_Financas = nil then
    dmRel_Abc_Financas := TdmRel_Abc_Financas.Create(NIl);
  inherited;
  OpenClientDataSet;
  edtDtInicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDtFim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
end;

procedure TfRel_ABC_Financas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_ABC_Financas.FormShow(Sender: TObject);
begin
  inherited;
  edtDtInicio.SetFocus;
end;

procedure TfRel_ABC_Financas.OpenClientDataSet;
begin

end;

procedure TfRel_ABC_Financas.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_ABC_Financas.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_ABC_Financas.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_ABC_Financas.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_ABC_Financas);
finalization
  UnRegisterClass(TfRel_ABC_Financas);

end.
