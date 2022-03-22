unit ufTeleAtendimentoOs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDesgn, frxDBSet, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons, uFrPesqIndividual, Mask, rxToolEdit, DateUtils,
  rxCurrEdit, ufrPesqDuplo;

type
  TfTeleAtendimentoOS = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    lbDtCad: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqAtendente: TfrPesqIndividual;
    Timer2: TTimer;
    frPesqDuplo: TfrPesqDuplo;
    frPesqTipoServico: TfrPesqIndividual;
    frPesqEquipamento: TfrPesqIndividual;
    frPesqTecnicoOS: TfrPesqIndividual;
    GroupBox1: TGroupBox;
    edtDtAgendInicio: TDateEdit;
    edtDtAgendFim: TDateEdit;
    frPesqTipoAgendamento: TfrPesqIndividual;
    procedure FormCreate(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure frPesqAtendentebtnPesquisarClick(Sender: TObject);
  private
    function GeraFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTeleAtendimentoOS: TfTeleAtendimentoOS;

implementation

uses udmTeleAtendimentoOS, ufCadTeleAtendimentoOs;

{$R *.dfm}

procedure TfTeleAtendimentoOS.btnFiltrarClick(Sender: TObject);
begin
  GeraFilter;
end;

function TfTeleAtendimentoOS.GeraFilter : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add(funcBasico.InstrucaoSQLCliente);
      Add('AND CL.CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID) );

      if frPesqCliente.TemRegistro then
        Add('AND CL.CLIE_ID ' + frPesqCliente.InGrid());

      //Add('AND (CL.CLIE_USER_ID_ATENDENTE IS NULL');
      //Add('OR   CL.CLIE_USER_ID_ATENDENTE IN (SELECT USER_ID FROM USUARIO WHERE USER_ATIVO = 1)');

      if frPesqAtendente.TemRegistro then
        Add('AND CL.CLIE_USER_ID_ATENDENTE ' + frPesqAtendente.InGrid());

      //Add(')');
      //Add('AND (CL.CLIE_DTA_ATENDIMENTO IS NULL');

      if edtDtCadInicio.Date > 0 then
        Add('AND CL.CLIE_DTA_ATENDIMENTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicio.Date)));

      if edtDtCadFim.Date > 0 then
        Add('AND CL.CLIE_DTA_ATENDIMENTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date)));

      //Add(')');
      if frPesqDuplo.frPesqPrimeiro.TemRegistro then
        Add('AND CL.CLIE_GENE_ID_ROTA ' + frPesqDuplo.frPesqPrimeiro.InGrid());

      if frPesqTipoServico.TemRegistro then begin
        Add('AND CL.CLIE_ID IN (SELECT DISTINCT');
        Add('                       CL.CLIE_ID');
        Add('                  FROM CLIENTES           CL');
        Add('                 INNER JOIN ORDEM_SERVICO OS');
        Add('                    ON (OS.ORDS_CLIE_ID     = CL.CLIE_ID');
        Add('                   AND OS.ORDS_CLIE_EMPR_ID = CL.CLIE_EMPR_ID)');
        Add('                 INNER JOIN ORDEM_SERVICO_ITENS OI');
        Add('                    ON (OI.ODIT_ORDS_ID     = OS.ORDS_ID');
        Add('                   AND OI.ODIT_ORDS_EMPR_ID = OS.ORDS_EMPR_ID)');
        Add('                 WHERE OI.ODIT_TPIT_PROD_ID      ' + frPesqTipoServico.InGrid());
        Add('                   AND OI.ODIT_TPIT_PROD_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Add('                 ORDER BY CL.CLIE_ID)');
      end;
      if frPesqEquipamento.TemRegistro then begin
        Add('AND CL.CLIE_ID IN (SELECT DISTINCT');
        Add('                       CL.CLIE_ID');
        Add('                         FROM CLIENTES           CL');
        Add('                        INNER JOIN ORDEM_SERVICO OS');
        Add('                           ON (OS.ORDS_CLIE_ID     = CL.CLIE_ID');
        Add('                          AND OS.ORDS_CLIE_EMPR_ID = CL.CLIE_EMPR_ID)');
        Add('                        WHERE OS.ORDS_PROD_ID_EQUIP      ' + frPesqEquipamento.InGrid());
        Add('                          AND OS.ORDS_PROD_EMPR_ID_EQUIP = ' + IntToStr(funcBasico.Empr_ID));
        Add('                        ORDER BY CL.CLIE_ID)');

      end;
      if frPesqTecnicoOS.TemRegistro then begin
        Add('AND CL.CLIE_ID IN (SELECT ORDS_CLIE_ID');
        Add('                     FROM ORDEM_SERVICO');
        Add('                    WHERE ORDS_EMPR_ID     = ' + IntToStr(funcBasico.Empr_ID));
        Add('                      AND ORDS_USER_ID_TEC ' + frPesqTecnicoOS.InGrid());
        Add('                )');
      end;
      if (edtDtAgendInicio.Date > 0) or (edtDtAgendFim.Date > 0) then begin
        Add('AND CL.CLIE_ID IN (SELECT ORDS_CLIE_ID');
        Add('                     FROM ORDEM_SERVICO');
        Add('                    WHERE ORDS_EMPR_ID         = ' + IntToStr(funcBasico.Empr_ID));
        Add('                      AND ORDS_DTA_INSTALACAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtAgendInicio.Date)));
        Add('                      AND ORDS_DTA_INSTALACAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtAgendFim.Date)));
        Add('                   )');
      end;

      if frPesqTipoAgendamento.TemRegistro then begin
        Add('AND CL.CLIE_ID IN (SELECT ORDS_CLIE_ID');
        Add('                     FROM ORDEM_SERVICO');
        Add('                    WHERE ORDS_EMPR_ID          = ' + IntToStr(funcBasico.Empr_ID));
        Add('                      AND ORDS_GENE_ID_TP_AGEND ' + frPesqTipoAgendamento.InGrid());
        Add('                   )');
      end;

      Add('ORDER BY CL.CLIE_FANTASIA');

      //ShowMessage(sltTMP.Text);

      with dmTeleAtendimentoOS.cdsClientes do begin
        Close;
        CommandText := ( sltTMP.Text );
        Open;
      end;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfTeleAtendimentoOS.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  dtTMP : TDate;
  dtHoje: TDate;
  tmTMP : TTime;
  tmHoje: TTime;
begin
  inherited;
  dtHoje := TDate(Date);
  tmHoje := TTime(Now);
  dtTMP := TDate(cdsGeral.FieldByName('CLIE_DTA_ATENDIMENTO').AsDateTime);
  tmTMP := TTime(cdsGeral.FieldByName('CLIE_HORA_ATEND').AsDateTime);
  if (dtTMP > dtHoje) or (StrToInt(FormatDateTime('YYYY',dtTMP)) < 1900) then Exit;
  if (dtTMP < dtHoje) then begin
    grdBasico.Canvas.Font.Color := clRed;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if (dtTMP = dtHoje) then begin
    grdBasico.Canvas.Font.Color := clGreen;
    if (FormatDateTime('hh:mm:ss',tmTMP) <= FormatDateTime('hh:mm:ss',tmHoje)) then begin
      grdBasico.Canvas.Font.Color := clRed;
    end;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
end;

procedure TfTeleAtendimentoOS.Timer2Timer(Sender: TObject);
begin
  inherited;
  btnFiltrar.Click;
end;

procedure TfTeleAtendimentoOS.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 195;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
    end;
    195 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfTeleAtendimentoOS.btnLimparClick(Sender: TObject);
var
  intI : Integer;
  intII : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then begin
      if (Components[intI] as TfrPesqIndividual).Name = 'frPesqAtendente' then begin
        if not funcBasico.SepararTeleAtendimento then begin
          (Components[intI] as TfrPesqIndividual).Limpar;
        end;
      end else begin
        (Components[intI] as TfrPesqIndividual).Limpar;
      end;
    end;
    if (Components[intI] is TfrPesqDuplo) then begin
      for intII := 0 to (Components[intI] as TfrPesqDuplo).ComponentCount -1 do begin
        if ((Components[intI] as TfrPesqDuplo).Components[intII] is TfrPesqIndividual) then
          ((Components[intI] as TfrPesqDuplo).Components[intII] as TfrPesqIndividual).Limpar;
      end;
    end;
  end;
  cdsGeral.Filtered := false;
  frPesqCliente.SetFocus;
  btnFiltrar.Click;
end;

procedure TfTeleAtendimentoOS.btnNovoClick(Sender: TObject);
begin
  try
    Timer2.Enabled := false;
    inherited;
  finally
    btnFiltrar.Click;
    Timer2.Enabled := true;
  end;
end;

procedure TfTeleAtendimentoOS.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral          := dmTeleAtendimentoOS.cdsClientes;
  Inherited;
  formCadastro      := fCadTeleAtendimentoOS;
  with fCadTeleAtendimentoOS do begin
    cdsLocal        := dmTeleAtendimentoOS.cdsClientes;
    funcLocal       := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
  edtDtCadFim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  if funcBasico.SepararTeleAtendimento then begin
    frPesqAtendente.BuscarRegistro(IntToStr(funcBasico.User_ID));
    frPesqAtendente.Enabled := false;
  end else begin
    frPesqAtendente.Enabled := true;
  end;
  btnFiltrar.Click;
end;

procedure TfTeleAtendimentoOS.frPesqAtendentebtnPesquisarClick(Sender: TObject);
begin
  inherited;
  frPesqAtendente.btnPesquisarClick(Sender);

end;

initialization
  RegisterClass(TfTeleAtendimentoOS);
finalization
  UnRegisterClass(TfTeleAtendimentoOS);

end.
