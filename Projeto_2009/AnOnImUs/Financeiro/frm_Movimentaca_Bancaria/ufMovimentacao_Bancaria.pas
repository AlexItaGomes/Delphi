unit ufMovimentacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn, uFrPesqIndividual, Mask, rxToolEdit;

type
  TfMovimentacao_Bancaria = class(TfBasico)
    gridMov: TDBGrid;
    Splitter1: TSplitter;
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    lbDtInstalacao: TGroupBox;
    edtDtAberturaInicio: TDateEdit;
    edtDtAberturaFim: TDateEdit;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    lbDtCad: TGroupBox;
    edtDtCadInicio: TDateEdit;
    edtDtCadFim: TDateEdit;
    frPesqBanco: TfrPesqIndividual;
    lbSaldo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridMovDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure gridMovDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFlatClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    function GeraFilter(): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMovimentacao_Bancaria: TfMovimentacao_Bancaria;

implementation

uses udmMovimentacao_Bancaria, ufCad_Movimentacao_Bancaria;

{$R *.dfm}

procedure TfMovimentacao_Bancaria.gridMovDblClick(Sender: TObject);
begin
  inherited;
  if not gridMov.DataSource.DataSet.IsEmpty then
    btnEditar.Click;
end;

procedure TfMovimentacao_Bancaria.gridMovDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(gridMov.DataSource.DataSet.RecNo) then begin
      gridMov.Canvas.Font.Color  := clBlack;
      gridMov.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      gridMov.Canvas.Font.Color  := clBlack;
      gridMov.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      gridMov.Canvas.Brush.Color := clSilver;
      gridMov.Canvas.Font.Style  := [fsBold];
    end;
     gridMov.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = dmMovimentacao_Bancaria.cdsMovimentacao_BancariaCBMV_VALOR_MOV then begin
    if dmMovimentacao_Bancaria.cdsMovimentacao_BancariaTIPO_MOV.AsString = 'D' then begin
      gridMov.Canvas.Font.Style := [fsBold];
      gridMov.Canvas.Font.Color := clRed;
      gridMov.DefaultDrawDataCell(Rect,Column.Field,State);
    end else begin
      gridMov.Canvas.Font.Style := [fsBold];
      gridMov.Canvas.Font.Color := clBlue;
      gridMov.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TfMovimentacao_Bancaria.btnFiltrarClick(Sender: TObject);
var
  fltTotal : Real;
begin
  fltTotal := 0;
  inherited;
  with dmMovimentacao_Bancaria do begin
    with cdsContas_Bancarias do begin
      Close;
      CommandText := GeraFilter();
      Open;
    end;
  end;
  try
    fltTotal:=0;
    cdsGeral.DisableControls;
    cdsGeral.First;
    while not cdsGeral.Eof do begin
      fltTotal := fltTotal + cdsGeral.FieldByName('CBCO_SALDO_ATUAL').AsFloat;
      cdsGeral.Next;
    end;
  finally
    lbSaldo.Caption := 'Saldo Total R$ ' + FormatFloat('###,###,##0.00',fltTotal);
    cdsGeral.EnableControls;
  end;
end;

procedure TfMovimentacao_Bancaria.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27: begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
    end;
    155: begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfMovimentacao_Bancaria.btnLimparClick(Sender: TObject);
var
  intI: Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
  end;
  cdsGeral.Filtered  := false;
end;

procedure TfMovimentacao_Bancaria.btnNovoClick(Sender: TObject);
var
  strName : String;
begin
  try
    strName := (Sender as TSpeedButton).Name;
    if strName = 'btnNovo' then begin
      if (gridMov.DataSource <> nil) then
        if (btnNovo.Enabled) then begin
          if formCadastro <> nil then begin
            try
              dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.Insert;
              formCadastro.ShowModal;
            except on e: exception do begin
              funcBasico.Alerta(e.Message,1);
              funcBasico.RollBack;
            end; end;
          end;
        end;
    end else if strName = 'btnEditar' then begin
      if (gridMov.DataSource <> nil) then
        if (btnEditar.Enabled) then begin
          if formCadastro <> nil then begin
            try
              dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.Edit;
              formCadastro.ShowModal;
            except on e: exception do begin
              funcBasico.Alerta(e.Message,1);
              funcBasico.RollBack;
            end; end;
          end;
        end;
    end else if strName = 'btnExcluir' then begin
      if (gridMov.DataSource <> nil) and (not dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.IsEmpty) then begin
        if (btnExcluir.Enabled) then begin
          if formCadastro <> nil then begin
            if funcBasico.Alerta('Confirma a exclusão do registro selecionado?',1,true) = 6 then begin
              try
                try
                  funcBasico.StartCommit;
                except
                end;
                dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.Delete;
                dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.ApplyUpdates(-1);
                try
                  funcBasico.Commit;
                except
                end;
              except on e: exception do begin
                funcBasico.RollBack;
                dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria.CancelUpdates;
              end; end;
            end;
          end;
        end;
      end else funcBasico.Alerta('Não há registro a ser excluido.',1);
    end else if strName = 'btnImprimir' then begin
        if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
          if (btnImprimir.Enabled) then begin
            funcBasico.ExecutaRotina((Sender as TSpeedButton).Tag);
          end;
        end else funcBasico.Alerta('Não há registros a serem impressos.',1);
      end;
  finally
    btnFiltrar.Click;
  end;
end;

procedure TfMovimentacao_Bancaria.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmMovimentacao_Bancaria.cdsContas_Bancarias;
  cdsGeral.Open;
  inherited;
  formCadastro   := fCad_Movimentacao_Bancaria;
  with fCad_Movimentacao_Bancaria do begin
    cdsLocal     := dmMovimentacao_Bancaria.cdsMovimentacao_Bancaria;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfMovimentacao_Bancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F5 then begin
    btnFiltrar.Click;
  end;
end;

procedure TfMovimentacao_Bancaria.FormShow(Sender: TObject);
begin
  inherited;
  panelFiltros.Height := 27;
  btnFiltrar.Click;
end;

procedure TfMovimentacao_Bancaria.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = dmMovimentacao_Bancaria.cdsContas_Bancarias.FieldByName('CBCO_ATIVO') then begin
    if dmMovimentacao_Bancaria.cdsContas_Bancarias.FieldByName('CBCO_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if dmMovimentacao_Bancaria.cdsContas_Bancarias.FieldByName('CBCO_ATIVO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Inativo        ');
    end;
    if dmMovimentacao_Bancaria.cdsContas_Bancarias.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if Column.Field = dmMovimentacao_Bancaria.cdsContas_Bancarias.FieldByName('CBCO_SALDO_ATUAL') then begin
    if cdsGeral.FieldByName('CBCO_SALDO_ATUAL').AsFloat <= 0 then begin
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.Canvas.Font.Color := clRed;
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end else begin
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.Canvas.Font.Color := clBlue;
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

function TfMovimentacao_Bancaria.GeraFilter() : String;
begin
  Result := dmMovimentacao_Bancaria.InstrucaoSQL;
  if frPesqBanco.TemRegistro then
    Result := Result + ('AND  CB.CBCO_GENE_ID_BCO = ' + frPesqBanco.InGrid());
  if edtDtCadInicio.Date > 0 then
    Result := Result + ('AND  CB.CBCO_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadInicio.Date)));
  if edtDtCadFim.Date > 0 then
    Result := Result + ('AND  CB.CBCO_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtCadFim.Date)));
  if edtDtAberturaInicio.Date > 0 then
    Result := Result + ('AND  CB.CBCO_DTA_ABERTURA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAberturaInicio.Date)));
  if edtDtAberturaFim.Date > 0 then
    Result := Result + ('AND  CB.CBCO_DTA_ABERTURA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtDtAberturaFim.Date)));
end;

initialization
  RegisterClass(TfMovimentacao_Bancaria);

finalization
  UnRegisterClass(TfMovimentacao_Bancaria);

end.
