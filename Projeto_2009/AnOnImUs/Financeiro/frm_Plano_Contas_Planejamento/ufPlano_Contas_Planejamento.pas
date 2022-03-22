unit ufPlano_Contas_Planejamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, uFrPesqIndividual, frxClass, frxDBSet, frxDesgn;

type
  TfPlano_Contas_Planejamento = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    cmbAno: TComboBox;
    frPesqPlanoContas: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenClientDataSet;
    function GeraFilter: String;
    procedure GerarPlanejamento(strAno: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlano_Contas_Planejamento: TfPlano_Contas_Planejamento;

implementation

uses udmPlano_Contas_Planejamento, ufCad_Plano_Contas_Planejamento, rxToolEdit,
  SQLExpr;

{$R *.dfm}

procedure TfPlano_Contas_Planejamento.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  cdsGeral.Filtered := false;
  frPesqPlanoContas.Limpar;
end;

procedure TfPlano_Contas_Planejamento.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  with cdsGeral do begin
    Filtered := false;
    Filter   := GeraFilter;
    Filtered := true;
  end;
end;

function TfPlano_Contas_Planejamento.GeraFilter : String;
var
  strTMP : String;
begin
  strTMP := 'PCPJ_ID > 0';
  if frPesqPlanoContas.TemRegistro then
    strTMP := strTMP + ' AND PCPJ_ID ' + frPesqPlanoContas.InGrid();
  if cmbAno.Text <> '' then
    strTMP := strTMP + ' AND PCPJ_ANO = ' + cmbAno.Text;
  Result := strTMP;
end;

procedure TfPlano_Contas_Planejamento.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27 : begin
      panelFiltros.Height := 155;
      btnFlat.Caption      := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqPlanoContas.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfPlano_Contas_Planejamento.btnNovoClick(Sender: TObject);
var
  Dia, Mes, Ano : Word;
begin
  if (Sender as TSpeedButton).Name <> 'btnImprimir' then begin
    fCad_Plano_Contas_Planejamento.strAno := cmbAno.Text;
    inherited;
  end else begin
    DecodeDate(funcBasico.DataServidor(),Ano,Mes,Dia);
    try
      if StrToInt(cmbAno.Text) >= Ano then begin
        if funcBasico.Alerta('Você confirma a geração automática do planejamento anual para os Planos de Contas lançados?',1,true) = 6 then begin
          GerarPlanejamento(cmbAno.Text);
          OpenClientDataSet();
          btnFiltrar.Click;
        end;
      end;
    except
    end;
  end;
end;

procedure TfPlano_Contas_Planejamento.GerarPlanejamento(strAno : String);
var
  qryCons : TSQLQuery;
  qryConsI : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    qryConsI := TSQLQuery.Create(nil);
    qryConsI.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT DISTINCT CPAG_PLCT_ID');
        sql.Add('  FROM CONTAS_PAGAR');
        sql.Add(' WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('   AND EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + strAno);
        sql.Add('   AND CPAG_STATUS                     IN (''A'',''F'')');
        SQL.Add('   AND COALESCE(CPAG_PREVISAO,0)        = 0');
        sql.Add(' ORDER BY CPAG_PLCT_ID');
        Open;
        if not IsEmpty then begin
          First;
          while not Eof do begin
            qryConsI.Close;
            qryConsI.sql.Clear;
            qryConsI.sql.Add('SELECT COUNT(*) AS QTDE');
            qryConsI.sql.Add('  FROM PLANO_CONTAS_PLANEJAMENTO');
            qryConsI.sql.Add(' WHERE PCPJ_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
            qryConsI.sql.Add('   AND PCPJ_PLCT_ID      = ' + qryCons.FieldByName('CPAG_PLCT_ID').AsString);
            qryConsI.sql.Add('   AND PCPJ_PLCT_EMPR_ID = 0');
            qryConsI.sql.Add('   AND PCPJ_ANO          = ' + strAno);
            qryConsI.Open;
            if qryConsI.FieldByName('QTDE').AsInteger = 0 then begin
              qryConsI.Close;
              qryConsI.SQL.Clear;
              qryConsI.SQL.Add('INSERT INTO PLANO_CONTAS_PLANEJAMENTO(');
              qryConsI.SQL.Add('                                       PCPJ_ID');
              qryConsI.SQL.Add('                                      ,PCPJ_EMPR_ID');
              qryConsI.SQL.Add('                                      ,PCPJ_PLCT_ID');
              qryConsI.SQL.Add('                                      ,PCPJ_PLCT_EMPR_ID');
              qryConsI.SQL.Add('                                      ,PCPJ_ANO');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_01');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_02');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_03');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_04');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_05');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_06');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_07');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_08');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_09');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_10');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_11');
              qryConsI.SQL.Add('                                      ,PCPJ_MES_12');
              qryConsI.SQL.Add('                                      ,PCPJ_CONCILIADO');
              qryConsI.SQL.Add('                                      ,PCPJ_OBS');
              qryConsI.SQL.Add('                                      ,PCPJ_TIPO_PLANO');
              qryConsI.SQL.Add('                                      ,PCPJ_DTA_CADASTRO');
              qryConsI.SQL.Add('                                      ,PCPJ_USER_ID');
              qryConsI.SQL.Add('                                      )');
              qryConsI.SQL.Add('VALUES (' +
                                        funcBasico.ObterSequencia('PLANO_CONTAS_PLANEJAMENTO',IntToStr(funcBasico.Empr_ID))  + ',' +
                                        IntToStr(funcBasico.Empr_ID)                                                         + ',' +
                                        qryCons.FieldByName('CPAG_PLCT_ID').AsString                                         + ',' +
                                        '0'                                                                                  + ',' +
                                        strAno                                                                               + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        '0'                                                                                  + ',' +
                                        QuotedStr('')                                                                        + ',' +
                                        '0'                                                                                  + ',' +
                                         QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor()))                   + ',' +
                                        IntToStr(funcBasico.User_ID)                                                         + ')');
              qryConsI.ExecSQL();
            end;
            Next;
          end;
        end;
      end;
    except
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    qryConsI.Close;
    FreeAndNil(qryConsI);
  end;
end;

procedure TfPlano_Contas_Planejamento.FormCreate(Sender: TObject);
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmPlano_Contas_Planejamento.cdsPlano_Conta_Planejamento;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Plano_Contas_Planejamento;
  with fCad_Plano_Contas_Planejamento do begin
    cdsLocal     := dmPlano_Contas_Planejamento.cdsPlano_Conta_Planejamento;
    funcLocal    := Self.funcBasico;
  end;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  with cdsGeral do begin
    Filtered := false;
    Filter   := 'PCPJ_ANO = ' + IntToStr(Ano);
    Filtered := true;
  end;
  for intI := 5 downto 1 do
    cmbAno.Items.Add(IntToStr(Ano - intI));
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 5;
  for intI := 1 to 5 do
    cmbAno.Items.Add(IntToStr(Ano + intI));
  panelFiltros.Height := 27;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfPlano_Contas_Planejamento.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('PCPJ_CONCILIADO') then begin
    if cdsGeral.FieldByName('PCPJ_CONCILIADO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sim            ');
    end;
    if cdsGeral.FieldByName('PCPJ_CONCILIADO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Não            ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if Column.Field = cdsGeral.FieldByName('PCPJ_TIPO_PLANO') then begin
    if cdsGeral.FieldByName('PCPJ_TIPO_PLANO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Fixo           ');
    end;
    if cdsGeral.FieldByName('PCPJ_TIPO_PLANO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Variável       ');
    end;
  end;
end;

procedure TfPlano_Contas_Planejamento.OpenClientDataSet;
begin
  with dmPlano_Contas_Planejamento do begin
    with cdsPlano_Conta_Planejamento do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfPlano_Contas_Planejamento);
finalization
  UnRegisterClass(TfPlano_Contas_Planejamento);

end.
