unit ufVendaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Menus, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls,
  Buttons, uFrPesqIndividual, Mask, rxToolEdit, DateUtils, frxClass, frxDBSet,
  frxDesgn;

type
  TfVendaOrcamento = class(TfBasico)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    frPesqCliente: TfrPesqIndividual;
    frPesqTabelaPreco: TfrPesqIndividual;
    frPesqPedido: TfrPesqIndividual;
    GroupBox6: TGroupBox;
    edtDtCadInicial: TDateEdit;
    edtDtCadFim: TDateEdit;
    GroupBox2: TGroupBox;
    edtDtEntregaInicial: TDateEdit;
    edtDtEntregaFinal: TDateEdit;
    GroupBox3: TGroupBox;
    edtDtPagtoInicial: TDateEdit;
    edtDtPagtoFinal: TDateEdit;
    rdTipo: TRadioGroup;
    rdStatus: TRadioGroup;
    procedure btnFlatClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure GeraFilter;
  public
  end;

var
  fVendaOrcamento: TfVendaOrcamento;

implementation

uses udmVendaOrcamento, ufCadVendaOrcamento;

{$R *.dfm}

procedure TfVendaOrcamento.btnFiltrarClick(Sender: TObject);
begin
  GeraFilter;
end;

procedure TfVendaOrcamento.GeraFilter;
var
  stlTMP : TStringList;
begin
  try
    stlTMP := TStringList.Create;
    with stlTMP do begin
      Clear;
      Add( dmVendaOrcamento.SQLPedido );
      if frPesqPedido.TemRegistro then begin
        Add('AND PV.PEDV_ID             ' + frPesqPedido.InGrid());
      end;
      if frPesqCliente.TemRegistro then begin
        Add('AND PV.PEDV_CLIE_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Add('AND PV.PEDV_CLIE_ID      ' + frPesqCliente.InGrid());
      end;
      if frPesqTabelaPreco.TemRegistro then begin
        Add('AND PV.PEDV_TPRC_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Add('AND PV.PEDV_TPRC_ID        ' + frPesqTabelaPreco.InGrid());
      end;
      if edtDtCadInicial.Date > 0 then
        Add('AND PV.PEDV_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadInicial.Date)));
      if edtDtCadFim.Date > 0 then
        Add('AND PV.PEDV_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtCadFim.Date)));
      if edtDtEntregaInicial.Date > 0 then
        Add('AND PV.PEDV_DTA_ENTREGA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEntregaInicial.Date)));
      if edtDtEntregaFinal.Date > 0 then
        Add('AND PV.PEDV_DTA_ENTREGA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtEntregaFinal.Date)));
      if edtDtPagtoInicial.Date > 0 then
        Add('AND PV.PEDV_DTA_PAGTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtPagtoInicial.Date)));
      if edtDtPagtoFinal.Date > 0 then
        Add('AND PV.PEDV_DTA_PAGTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDtPagtoFinal.Date)));
      case rdTipo.ItemIndex of
        0 : Add('AND PV.PEDV_TIPO_PEDIDO = ''OV''');
        1 : Add('AND PV.PEDV_TIPO_PEDIDO = ''PV''');
      end;
      if rdStatus.ItemIndex <> 3 then
        Add('AND PV.PEDV_STATUS = ' + IntToStr(rdStatus.ItemIndex));

      Add('ORDER BY PV.PEDV_ID DESC');
    end;
    with dmVendaOrcamento.cdsPedido do begin
      Close;
      CommandText := ( stlTMP.Text );
      Open;
    end;
  finally
    FreeAndNil(stlTMP);
  end;
end;

procedure TfVendaOrcamento.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfVendaOrcamento.btnLimparClick(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;
  rdTipo.ItemIndex   := 2;
  rdStatus.ItemIndex := 3;
  frPesqCliente.SetFocus;
  btnFiltrar.Click;
end;

procedure TfVendaOrcamento.btnNovoClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Name = 'btnNovo' then begin
    if (grdBasico.DataSource <> nil) then begin
      if (btnNovo.Enabled) then begin
        if formCadastro <> nil then begin
          try
            fCadVendaOrcamento.Status := dsInsert;
            fCadVendaOrcamento.ShowModal;
          except on e: exception do begin
            funcBasico.Alerta(e.Message,1);
            funcBasico.RollBack;
          end; end;
        end;
      end;
    end;
  end else if (Sender as TSpeedButton).Name = 'btnEditar' then begin
    if (grdBasico.DataSource <> nil) then begin
      if (btnEditar.Enabled) then begin
        if formCadastro <> nil then begin
          try
            fCadVendaOrcamento.Status := dsEdit;
            fCadVendaOrcamento.BuscaPedido(cdsGeral.FieldByName('PEDV_ID').AsString);
            fCadVendaOrcamento.ShowModal;
          except on e: exception do begin
            funcBasico.Alerta(e.Message,1);
            funcBasico.RollBack;
          end; end;
        end;
      end;
    end;
  end else begin
    {if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
      if (btnExcluir.Enabled) then begin
        if formCadastro <> nil then begin
          if funcBasico.Alerta('Confirma a exclusão do registro selecionado?',1,true) = 6 then begin
            try
              try
                funcBasico.StartCommit;
              except
              end;
              cdsGeral.Delete;
              cdsGeral.ApplyUpdates(-1);
              try
                funcBasico.Commit;
              except
              end;
            except on e: exception do begin
              funcBasico.RollBack;
              cdsGeral.CancelUpdates;
            end; end;
          end;
        end;
      end;
    end else funcBasico.Alerta('Não há registro a ser excluido.',1);}
  end;
end;

procedure TfVendaOrcamento.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmVendaOrcamento.cdsPedido;
  inherited;
  formCadastro := fCadVendaOrcamento;
  with fCadVendaOrcamento do begin
    cdsLocal                     := dmVendaOrcamento.cdsPedido;
    fCadVendaOrcamento.funcLocal := Self.funcBasico;
  end;
end;

procedure TfVendaOrcamento.FormShow(Sender: TObject);
begin
  inherited;
  btnFlat.Caption     := '<< Clique aqui para recolher';
  btnFlat.Glyph       := Image4.Picture.Bitmap;
end;

initialization
  RegisterClass(TfVendaOrcamento);
finalization
  UnRegisterClass(TfVendaOrcamento);

end.
