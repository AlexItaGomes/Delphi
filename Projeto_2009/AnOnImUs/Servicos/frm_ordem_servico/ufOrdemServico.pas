unit ufOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, DateUtils, Menus, uFrPesqIndividual, frxClass, frxDesgn,
  frxDBSet, ufrPesqDuplo, frxExportPDF, RxCurrEdit;

type
  TfOrdemServico = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    lbDtInstalacao: TGroupBox;
    edtDtInstalInicio: TDateEdit;
    edtDtInstalFim: TDateEdit;
    lbDtEntrega: TGroupBox;
    edtDtEntregInicio: TDateEdit;
    edtDtEntregFim: TDateEdit;
    rdStatus: TRadioGroup;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    lbDtCad: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqCliente: TfrPesqIndividual;
    frPesqEquipamento: TfrPesqIndividual;
    frPesqTecnico: TfrPesqIndividual;
    frPesqDuplo: TfrPesqDuplo;
    tmTele: TTimer;
    frPesqTipoAgendamento: TfrPesqIndividual;
    N1: TMenuItem;
    AlterarAtendentedaOS1: TMenuItem;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EdtTotalReceb: TRxCalcEdit;
    EdtTotalDesc: TRxCalcEdit;
    EdtTotalOS: TRxCalcEdit;
    EdtTotalPago: TRxCalcEdit;
    edtQtde: TRxCalcEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmTeleTimer(Sender: TObject);
    procedure AlterarAtendentedaOS1Click(Sender: TObject);
  private
    strClie_ID: String;
    procedure OpenClientDataSet(intPos: Integer = 99);
    function GeraFilter: String;
    procedure CarregarInformacoesOS;
  public
    { Public declarations }
  end;

var
  fOrdemServico: TfOrdemServico;

implementation

uses udmOrdemServico, ufCadOrdemServico, ufAlteraOS;

{$R *.dfm}

procedure TfOrdemServico.btnLimparClick(Sender: TObject);
var
  intI: Integer;
  intII : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
    if (Components[intI] is TfrPesqDuplo) then begin
      for intII := 0 to (Components[intI] as TfrPesqDuplo).ComponentCount -1 do begin
        if ((Components[intI] as TfrPesqDuplo).Components[intII] is TfrPesqIndividual) then
          ((Components[intI] as TfrPesqDuplo).Components[intII] as TfrPesqIndividual).Limpar;
      end;
    end;
  end;
  rdStatus.ItemIndex := 4;
  cdsGeral.Filtered  := false;
  frPesqCliente.SetFocus;
  dmOrdemServico.cdsOrdemServico.Close;
end;

procedure TfOrdemServico.AlterarAtendentedaOS1Click(Sender: TObject);
begin
  inherited;
  if cdsGeral.IsEmpty then begin
    funcBasico.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+'Selecione um registro antes de continuar!',0);
    Exit;
  end;
  if funcBasico.TemPermissao('567') then begin
    funcBasico.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+'Você não possui permissão a está função!',0);
    Exit;
  end;
  fAlteraOS.funcLocal := Self.funcBasico;
  fAlteraOS.OS := cdsGeral.FieldByName('ORDS_ID').AsInteger;
  fAlteraOS.ShowModal;
end;

procedure TfOrdemServico.btnFiltrarClick(Sender: TObject);
var
  TotalOS,
  TotalDesc,
  TotalPago,
  TotalPagar,
  Qtde : Real;
begin
  GeraFilter;
  TotalOS    := 0; TotalDesc  := 0; Qtde := 0;
  TotalPago  := 0; TotalPagar := 0;
  try
    with dmOrdemServico.cdsOrdemServico do begin
      First;
      DisableControls;
      while not Eof do begin
        TotalOS   := TotalOS    + FieldByName('ORDS_VLR_TOTAL_OS').AsFloat;
        TotalDesc := TotalDesc  + FieldByName('ORDS_VLR_DESCONTO').AsFloat;
        TotalPago := TotalPago  + FieldByName('ORDS_VLR_PAGO').AsFloat;
        TotalPagar:= TotalPagar + (FieldByName('ORDS_VLR_TOTAL_OS').AsFloat-FieldByName('ORDS_VLR_DESCONTO').AsFloat)-FieldByName('ORDS_VLR_PAGO').AsFloat;
        Qtde      := Qtde       + FieldByName('TOTALPECAS').AsFloat;
        Next;
      end;
      EdtTotalOS.Value    := TotalOS;
      EdtTotalReceb.Value := TotalPagar;
      EdtTotalDesc.Value  := TotalDesc;
      EdtTotalPago.Value  := TotalPago;
      edtQtde.Value       := Qtde;
      EnableControls;
    end;
  except
  end;
end;

function TfOrdemServico.GeraFilter: String;
var
  sltTMP: TStringList;
begin
  try
    sltTMP := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add(funcBasico.InstrucaoSQLOS);

      if frPesqCliente.TemRegistro then
        Add('AND  OS.ORDS_CLIE_ID ' + frPesqCliente.InGrid());
      if frPesqDuplo.frPesqPrimeiro.TemRegistro then
        Add('AND CL.CLIE_GENE_ID_ROTA ' + frPesqDuplo.frPesqPrimeiro.InGrid());
      if frPesqEquipamento.TemRegistro then
        Add('AND  OS.ORDS_PROD_ID_EQUIP ' + frPesqEquipamento.InGrid());
      if frPesqTecnico.TemRegistro then
        Add('AND  OS.ORDS_USER_ID_TEC ' + frPesqTecnico.InGrid());
      if frPesqTipoAgendamento.TemRegistro then
        Add('AND  OS.ORDS_GENE_ID_TP_AGEND ' + frPesqTipoAgendamento.InGrid());

      if edtDtCadInicio.Date > 0 then
        Add('AND  OS.ORDS_DTA_CADASTRO >= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadInicio.Date)));
      if edtDtCadFim.Date > 0 then
        Add('AND  OS.ORDS_DTA_CADASTRO <= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadFim.Date)));

      if edtDtInstalInicio.Date > 0 then
        Add('AND  OS.ORDS_DTA_INSTALACAO >= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtInstalInicio.Date)));
      if edtDtInstalFim.Date > 0 then
        Add('AND  OS.ORDS_DTA_INSTALACAO <= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtInstalFim.Date)));

      if edtDtEntregInicio.Date > 0 then
        Add('AND  OS.ORDS_DTA_ENTREGA >= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtEntregInicio.Date)));
      if edtDtEntregFim.Date > 0 then
        Add('AND  OS.ORDS_DTA_ENTREGA <= ' +
          QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtEntregFim.Date)));

      case rdStatus.ItemIndex of
        0: Add('AND OS.ORDS_STATUS IN (0)');
        1: Add('AND OS.ORDS_STATUS IN (1)');
        2: Add('AND OS.ORDS_STATUS IN (2)');
        3: Add('AND OS.ORDS_STATUS IN (3)');
        4: Add('AND OS.ORDS_STATUS IN (0,1)');
      end;

      Add('ORDER BY');
      Add('      OS.ORDS_STATUS, OS.ORDS_HORARIO, OS.ORDS_ID DESC');
    end;
    with dmOrdemServico.cdsOrdemServico do begin
      Close;
      CommandText := (sltTMP.Text);
      Open;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfOrdemServico.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27: begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqCliente.SetFocus;
    end;
    155: begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfOrdemServico.btnNovoClick(Sender: TObject);
var
  strBtnNome: String;
begin
  try
    strBtnNome := (Sender as TSpeedButton).Name;
    if strBtnNome = 'btnNovo' then begin
      if (grdBasico.DataSource <> nil) then begin
        if (btnNovo.Enabled) then begin
          if formCadastro <> nil then begin
            try
              fCadOrdemServico.intClie_ID := 0;
              if funcBasico.AbreOS then
                fCadOrdemServico.intClie_ID := funcBasico.CodCliente;
              formCadastro.ShowModal;
            except on e: exception do begin
                funcBasico.Alerta(e.Message, 1);
                funcBasico.RollBack;
              end;
            end;
          end;
        end;
      end;
    end else if strBtnNome = 'btnEditar' then begin
      if (grdBasico.DataSource <> nil) then begin
        if (btnEditar.Enabled) then begin
          if formCadastro <> nil then begin
            try
              try
                fCadOrdemServico.intClie_ID := cdsGeral.FieldByName('ORDS_CLIE_ID').AsInteger;
                if funcBasico.AbreOS then
                  fCadOrdemServico.intClie_ID := funcBasico.CodCliente;
              except
              end;
              formCadastro.ShowModal;
            except on e: exception do begin
                funcBasico.Alerta(e.Message, 1);
                funcBasico.RollBack;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    btnFiltrar.Click;
  end;
end;

procedure TfOrdemServico.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmOrdemServico do
  begin
    case intPos of
      1:
        begin
          // with cdsOrdemServico do begin
          // Close;
          // CommandText := GeraSQLOS;
          // Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          // Open;
          // end;
        end;
      2:
        begin
          with cdsPesqClie do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      3:
        begin
          with cdsPesqEquipamento do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      4:
        begin
          with cdsPesqTecnico do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end
    else
      begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
      end;
    end;
  end;
end;

procedure TfOrdemServico.tmTeleTimer(Sender: TObject);
begin
  inherited;
  tmTele.Enabled := false;
  btnEditar.Click;
end;

procedure TfOrdemServico.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral := dmOrdemServico.cdsOrdemServico;
  cdsGeral.Open;
  Inherited;
  CarregarInformacoesOS;
  formCadastro := fCadOrdemServico;
  with fCadOrdemServico do
  begin
    cdsLocal := dmOrdemServico.cdsOrdemServico;
    funcLocal := Self.funcBasico;
  end;
  panelFiltros.Height := 27;
  btnImprimir.Tag := 0;
  edtDtInstalFim.Date := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
end;

procedure TfOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  btnFlat.Caption     := '<< Clique aqui para recolher';
  btnFlat.Glyph       := Image4.Picture.Bitmap;
  panelFiltros.Height := 155;
  frPesqCliente.SetFocus;
  btnLimpar.Click;
  if funcBasico.AbreOS then begin
    frPesqCliente.BuscarRegistro(IntToStr(funcBasico.CodCliente));
    btnFiltrar.Click;
    tmTele.Enabled := true;
  end;
  if funcBasico.TrabTipoAgendamento then begin
    frPesqTipoAgendamento.Visible := true;
  end;
  btnFiltrar.Click;
end;

procedure TfOrdemServico.CarregarInformacoesOS;
var
  formPrinc: TForm;
begin
  formPrinc               := Application.MainForm;
  funcBasico              := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  funcBasico.CarregaInfoOrdemServico;
  lbDtInstalacao.Caption  := funcBasico.Dt_Instalacao;
  lbDtEntrega.Caption     := funcBasico.Dt_Entrega;
  lbDtCad.Caption         := funcBasico.Dt_Cadastro;
end;

procedure TfOrdemServico.grdBasicoDblClick(Sender: TObject);
begin
  strClie_ID := cdsGeral.FieldByName('ORDS_CLIE_ID').AsString;
  btnEditar.Click;
  strClie_ID := '';
end;

procedure TfOrdemServico.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('ORDS_STATUS') then
  begin
    if cdsGeral.FieldByName('ORDS_STATUS').AsInteger = 0 then
    begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Agendado         ');
    end;
    if cdsGeral.FieldByName('ORDS_STATUS').AsInteger = 1 then
    begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'O.S. Real.       ');
    end;
    if cdsGeral.FieldByName('ORDS_STATUS').AsInteger = 2 then
    begin
      grdBasico.Canvas.Brush.Color := $00FFC891;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'O.S. Pago        ');
    end;
    if cdsGeral.FieldByName('ORDS_STATUS').AsInteger = 3 then
    begin
      grdBasico.Canvas.Brush.Color := clGray;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'O.S. Cancel.     ');
    end;
    if cdsGeral.IsEmpty then
    begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Sem Reg.         ');
    end;
  end;
  if Column.Field = cdsGeral.FieldByName('ORDS_STATUS') then
  begin
    if (cdsGeral.FieldByName('ORDS_DTA_INSTALACAO')
      .AsDateTime = funcBasico.DataServidor(funcBasico.Conexao)) and
      (cdsGeral.FieldByName('ORDS_STATUS').AsInteger in [0]) then
    begin
      grdBasico.Canvas.Brush.Color := clMoneyGreen;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Ag. p/ Hoje      ');
    end;
    if (cdsGeral.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime <
      funcBasico.DataServidor(funcBasico.Conexao)) and
      (cdsGeral.FieldByName('ORDS_STATUS').AsInteger in [0]) then
    begin
      grdBasico.Canvas.Brush.Color := clOlive;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Em Atraso        ');
    end;
  end;
  if Column.Field = cdsGeral.FieldByName('ORDS_VLR_TOTAL_OS') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('TOTALPECAS') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('ORDS_VLR_DESCONTO') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.Canvas.Font.Color := clRed;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('ORDS_VLR_PAGO') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.Canvas.Font.Color := clGreen;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('VALOR_PAGAR') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.Canvas.Font.Color := clBlue;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
end;

initialization
RegisterClass(TfOrdemServico);

finalization
UnRegisterClass(TfOrdemServico);

end.
