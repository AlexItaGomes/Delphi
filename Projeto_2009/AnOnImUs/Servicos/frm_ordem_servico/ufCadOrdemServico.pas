unit ufCadOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  Mask, DBCtrls, SQLExpr, RxToolEdit, RxCurrEdit, RxDBCtrl;

type
  TfCadOrdemServico = class(TfCadastro)
    btnNovaOS: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnAlteraOS: TBitBtn;
    edtCodClie: TEdit;
    edtCliente: TEdit;
    btnPesqClie: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    grdOS: TDBGrid;
    btnImprimir: TBitBtn;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    btnInsertCliente: TSpeedButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lbGrupoEquip: TGroupBox;
    grdEquip: TDBGrid;
    lbGrupoPecasServicos: TGroupBox;
    grdProdutos: TDBGrid;
    rdStatus: TRadioGroup;
    Panel2: TPanel;
    Label18: TLabel;
    EdtTotalReceb: TRxCalcEdit;
    Label19: TLabel;
    EdtTotalDesc: TRxCalcEdit;
    EdtTotalOS: TRxCalcEdit;
    Label20: TLabel;
    EdtTotalPago: TRxCalcEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtQtde: TRxCalcEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodClieKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodClieExit(Sender: TObject);
    procedure btnPesqClieClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure grdOSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdEquipDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovaOSClick(Sender: TObject);
    procedure grdOSDblClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnInsertClienteClick(Sender: TObject);
    procedure grdOSTitleClick(Column: TColumn);
    procedure grdEquipTitleClick(Column: TColumn);
    procedure grdProdutosTitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure rdStatusClick(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    procedure CloseClientDataSets;
    function TemProdutoVenda(strORDS_ID, strCLIE_ID: String): boolean;
    procedure CarregaInformacoesOS;
    { Private declarations }
  public
    intClie_ID: Integer;
  end;

var
  fCadOrdemServico: TfCadOrdemServico;

implementation

uses udmOrdemServico, ufCadNovaOrdemServico, ufImprimirOS, ufRequisicaoMaterial;

{$R *.dfm}

procedure TfCadOrdemServico.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if edtCodClie.Text <> '' then begin
    if not dmOrdemServico.cdsListaOS.IsEmpty then begin
      if TemProdutoVenda(dmOrdemServico.cdsListaOSORDS_ID.AsString,dmOrdemServico.cdsClientesCLIE_ID.AsString) then begin
        try
          if fRequisicaoMaterial = nil then
            fRequisicaoMaterial := TfRequisicaoMaterial.Create(nil);
          with dmOrdemServico,cdsListaPecasRequisicao do begin
            Close;
            Params.ParamByName('ORDS_ID').AsInteger := dmOrdemServico.cdsListaOSORDS_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := dmOrdemServico.cdsClientesCLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
            if IsEmpty then Exit;            
          end;
          fRequisicaoMaterial.qrepRelatorio.Preview;
        finally
          FreeAndNil(fRequisicaoMaterial);
        end;
      end;
    end;
  end;
end;

function TfCadOrdemServico.TemProdutoVenda(strORDS_ID,
  strCLIE_ID: String): boolean;
var
  qryCons: TSQLQuery;
begin
  try
    Result := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  ORDEM_SERVICO_ITENS');
        sql.Add('WHERE ODIT_EMPR_ID           = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODIT_ORDS_ID           = ' + strORDS_ID);
        sql.Add('AND   ODIT_ORDS_EMPR_ID      = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODIT_ORDS_CLIE_ID      = ' + strCLIE_ID);
        sql.Add('AND   ODIT_ORDS_CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   ODIT_TPIT_PROD_ID NOT IN (2)');
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except
      on e: exception do
      begin
        funcLocal.ReportaErro('TfCadNovaOrdemServico', 'TemProdutoVenda',e.Message);
        funcLocal.Alerta('Erro no processo de validação dos itens da O.S.' + '[' + e.Message + ']', 1);
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadOrdemServico.BitBtn2Click(Sender: TObject);
begin
  try

  finally

  end;
end;

procedure TfCadOrdemServico.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadOrdemServico.btnNovaOSClick(Sender: TObject);
begin
  try
    btnNovaOS.SetFocus;
    if edtCodClie.Text <> '' then begin
      try
        OpenClientDataSet(3);
        { Inserindo um novo registro }
        if (Sender as TBitBtn).Name = 'btnNovaOS' then
        begin
          try
            if fCadNovaOrdemServico = nil then
              fCadNovaOrdemServico := TfCadNovaOrdemServico.Create(nil);
            fCadNovaOrdemServico.cdsLocal := Self.cdsLocal;
            fCadNovaOrdemServico.funcLocal := Self.funcLocal;
            dmOrdemServico.cdsOrdemServico.Append;
            fCadNovaOrdemServico.ShowModal;
          finally
            FreeAndNil(fCadNovaOrdemServico);
          end;
          { Editando uma ordem de serviço }
        end
        else if ((Sender as TBitBtn).Name = 'btnAlteraOS') and
          (not dmOrdemServico.cdsListaOS.IsEmpty) then
        begin
          try
            if fCadNovaOrdemServico = nil then
              fCadNovaOrdemServico := TfCadNovaOrdemServico.Create(nil);
            fCadNovaOrdemServico.cdsLocal := Self.cdsLocal;
            fCadNovaOrdemServico.funcLocal := Self.funcLocal;
            dmOrdemServico.cdsOrdemServico.Filtered := false;
            dmOrdemServico.cdsOrdemServico.Locate('ORDS_ID;ORDS_EMPR_ID;ORDS_STATUS',VarArrayOf([dmOrdemServico.cdsListaOSORDS_ID.AsInteger,funcLocal.Empr_ID,dmOrdemServico.cdsListaOSORDS_STATUS.AsInteger]), []);
            dmOrdemServico.cdsOrdemServico.Edit;
            fCadNovaOrdemServico.ShowModal;
          finally
            FreeAndNil(fCadNovaOrdemServico);
          end;
          { Imprimindo uma ordem de serviço }
        end
        else if (Sender as TBitBtn).Name = 'btnImprimir' then
        begin
          try
            if fImprimirOS = nil then
              fImprimirOS := TfImprimirOS.Create(nil);
            fImprimirOS.funcLocal := Self.funcLocal;
            fImprimirOS.strORDS_ID := dmOrdemServico.cdsListaOSORDS_ID.AsString;
            fImprimirOS.qrepRelatorio.Preview;
          finally
            FreeAndNil(fImprimirOS);
          end;
        end;
      finally
        OpenClientDataSet;
      end;
    end
    else
    begin
      funcLocal.Alerta('Informe um cliente antes de continuar.', 1);
      edtCodClie.SetFocus;
    end;
    Self.BringToFront;
    grdOS.Refresh;
    edtCodClie.SetFocus;
    edtCodClie.Modified := true;
    edtCodClieExit(Sender);
  except on e: exception do
    showmessage(e.message)
  end;
end;

procedure TfCadOrdemServico.btnPesqClieClick(Sender: TObject);
var
  strTMP: String;
begin
  OpenClientDataSet(1);
  strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsPesqClie, '','CLIE_ID;CLIE_RAZAO_SOCIAL', '');
  if strTMP <> '' then begin
    edtCodClie.Text := funcLocal.Buscar_Coluna(strTMP, 1);
    edtCliente.Text := funcLocal.Buscar_Coluna(strTMP, 2);
    intClie_ID := StrToInt(edtCodClie.Text);
    OpenClientDataSet(2);
    edtCodClie.Modified := true;
  end
  else
  begin
    edtCodClie.Clear;
    edtCliente.Clear;
    CloseClientDataSets;
  end;
  edtCodClie.SetFocus;
end;

procedure TfCadOrdemServico.grdEquipDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdEquip.DataSource.DataSet.RecNo) then
    begin
      grdEquip.Canvas.Font.Color := clBlack;
      grdEquip.Canvas.Brush.Color := $00FFDFDF;
    end
    else
    begin
      grdEquip.Canvas.Font.Color := clBlack;
      grdEquip.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in State then
    begin
      grdEquip.Canvas.Brush.Color := clSilver;
      grdEquip.Canvas.Font.Style := [fsBold];
    end;
    grdEquip.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadOrdemServico.grdEquipTitleClick(Column: TColumn);
begin
  inherited;
  try
    dmOrdemServico.cdsListaEquip.IndexFieldNames := Column.Field.FieldName;
  except
  end;
end;

procedure TfCadOrdemServico.grdOSDblClick(Sender: TObject);
begin
  try
    inherited;
    btnAlteraOS.Click;
  except
  end;
end;

procedure TfCadOrdemServico.grdOSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdOS.DataSource.DataSet.RecNo) then
    begin
      grdOS.Canvas.Font.Color := clBlack;
      grdOS.Canvas.Brush.Color := $00FFDFDF;
    end
    else
    begin
      grdOS.Canvas.Font.Color := clBlack;
      grdOS.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in State then
    begin
      grdOS.Canvas.Brush.Color := clSilver;
      grdOS.Canvas.Font.Style := [fsBold];
    end;
    grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  with dmOrdemServico do
  begin
    if Column.Field = cdsListaOS.FieldByName('ORDS_STATUS') then
    begin
      if cdsListaOS.FieldByName('ORDS_STATUS').AsInteger = 0 then
      begin
        grdOS.Canvas.Brush.Color := $008CFF8C;
        grdOS.Canvas.Font.Style  := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'Agendado         ');
      end;
      if cdsListaOS.FieldByName('ORDS_STATUS').AsInteger = 1 then
      begin
        grdOS.Canvas.Brush.Color := $006666FF;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'O.S. Real.       ');
      end;
      if cdsListaOS.FieldByName('ORDS_STATUS').AsInteger = 2 then
      begin
        grdOS.Canvas.Brush.Color := $00FFC891;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'O.S. Pago        ');
      end;
      if cdsListaOS.FieldByName('ORDS_STATUS').AsInteger = 3 then
      begin
        grdOS.Canvas.Brush.Color := clGray;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'O.S. Cancel.     ');
      end;
      if cdsListaOS.IsEmpty then
      begin
        grdOS.Canvas.Brush.Color := clWhite;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'Sem Reg.         ');
      end;
    end;
    if Column.Field = cdsListaOS.FieldByName('ORDS_STATUS') then
    begin
      if (cdsListaOS.FieldByName('ORDS_DTA_INSTALACAO')
        .AsDateTime = funcLocal.DataServidor(funcLocal.Conexao)) and
        (cdsListaOS.FieldByName('ORDS_STATUS').AsInteger in [0]) then
      begin
        grdOS.Canvas.Brush.Color := clMoneyGreen;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'Ag. p/ Hoje      ');
      end;
      if (cdsListaOS.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime <
        funcLocal.DataServidor(funcLocal.Conexao)) and
        (cdsListaOS.FieldByName('ORDS_STATUS').AsInteger in [0]) then
      begin
        grdOS.Canvas.Brush.Color := clOlive;
        grdOS.Canvas.Font.Style := [fsBold];
        grdOS.DefaultDrawDataCell(Rect, Column.Field, State);
        grdOS.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
          'Em Atraso        ');
      end;
    end;
    if Column.Field = cdsListaOS.FieldByName('ORDS_VLR_TOTAL_OS') then begin
      grdOS.Canvas.Font.Style := [fsBold];
      grdOS.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if Column.Field = cdsListaOS.FieldByName('TOTALPECAS') then begin
      grdOS.Canvas.Font.Style := [fsBold];
      grdOS.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if Column.Field = cdsListaOS.FieldByName('ORDS_VLR_DESCONTO') then begin
      grdOS.Canvas.Font.Style := [fsBold];
      grdOS.Canvas.Font.Color := clRed;
      grdOS.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if Column.Field = cdsListaOS.FieldByName('ORDS_VLR_PAGO') then begin
      grdOS.Canvas.Font.Style := [fsBold];
      grdOS.Canvas.Font.Color := clGreen;
      grdOS.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if Column.Field = cdsListaOS.FieldByName('VALOR_PAGAR') then begin
    grdOS.Canvas.Font.Style := [fsBold];
    grdOS.Canvas.Font.Color := clBlue;
    grdOS.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  end;
end;

procedure TfCadOrdemServico.grdOSTitleClick(Column: TColumn);
begin
  inherited;
  try
    dmOrdemServico.cdsListaOS.IndexFieldNames := Column.Field.FieldName;
  except
  end;
end;

procedure TfCadOrdemServico.grdProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdProdutos.DataSource.DataSet.RecNo) then
    begin
      grdProdutos.Canvas.Font.Color := clBlack;
      grdProdutos.Canvas.Brush.Color := $00FFDFDF;
    end
    else
    begin
      grdProdutos.Canvas.Font.Color := clBlack;
      grdProdutos.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in State then
    begin
      grdProdutos.Canvas.Brush.Color := clSilver;
      grdProdutos.Canvas.Font.Style := [fsBold];
    end;
    grdProdutos.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadOrdemServico.grdProdutosTitleClick(Column: TColumn);
begin
  inherited;
  try
    dmOrdemServico.cdsListaPecas.IndexFieldNames := Column.Field.FieldName;
  except
  end;
end;

procedure TfCadOrdemServico.edtCodClieExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodClie.Modified then
    Exit;
  try
    if edtCodClie.Text <> '' then
    begin
      OpenClientDataSet(1);
      strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsPesqClie, '',
        'CLIE_ID;CLIE_RAZAO_SOCIAL', 'CLIE_ID = ' + edtCodClie.Text);
      if strTMP <> '' then
      begin
        edtCodClie.Text := funcLocal.Buscar_Coluna(strTMP, 1);
        edtCliente.Text := funcLocal.Buscar_Coluna(strTMP, 2);
        intClie_ID := StrToInt(edtCodClie.Text);
        OpenClientDataSet(2);
      end
      else
      begin
        edtCodClie.Clear;
        edtCliente.Clear;
        CloseClientDataSets
      end;
    end
    else
    begin
      edtCodClie.Clear;
      edtCliente.Clear;
      CloseClientDataSets;
    end;
  finally
    rdStatusClick(Self);
  end;
end;

procedure TfCadOrdemServico.edtCodClieKeyPress(Sender: TObject; var Key: Char);
var
  btnTMP : TSpeedButton;
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(TDBEdit(Sender).Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnTMP := TSpeedButton(Self.FindComponent( funcLocal.Buscar_Coluna(TDBEdit(Sender).ImeName,1) ));
        btnTMP.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCadOrdemServico.CarregaInformacoesOS;
begin
  try
    lbGrupoEquip.Caption         := funcLocal.Grupo_Equipamento;
    lbGrupoPecasServicos.Caption := funcLocal.Grupo_Pecas_Servicos;
  except
  end;
end;

procedure TfCadOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.Pages[0].Show;
  CloseClientDataSets;
  edtCodClie.Clear;
  edtCliente.Clear;
  if intClie_ID > 0 then begin
    edtCodClie.Text     := IntToStr(intClie_ID);
    edtCodClie.Modified := true;
    edtCodClieExit(Sender);
  end;
  edtCodClie.SetFocus;
  CarregaInformacoesOS;
  rdStatus.ItemIndex := 4;
  rdStatusClick(Self);
end;

procedure TfCadOrdemServico.CloseClientDataSets;
begin
  with dmOrdemServico do
  begin
    cdsPesqClie.Close;
    cdsClientes.Close;
    cdsListaOS.Close;
    cdsListaEquip.Close;
    cdsListaPecas.Close;
  end;
end;

procedure TfCadOrdemServico.OpenClientDataSet(intPos: Integer = 99);
begin
  with dmOrdemServico do
  begin
    case intPos of
      1:
        begin
          with cdsPesqClie do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      2:
        begin
          with cdsClientes do
          begin
            Close;
            Params.ParamByName('CLIE_ID').AsInteger := intClie_ID;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
          with cdsListaOS do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
          with cdsListaEquip do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Open;
          end;
        end;
      3:
        begin
          with cdsOrdemServico do
          begin
            Close;
            CommandText := funcLocal.InstrucaoSQLOS + ' AND  OS.ORDS_CLIE_ID = '+ cdsClientesCLIE_ID.AsString;
            Open;
          end;
        end;
      4:
        begin
          with cdsListaOS do
          begin
            Close;
            Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
            Params.ParamByName('CLIE_ID').AsInteger := cdsClientesCLIE_ID.AsInteger;
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

procedure TfCadOrdemServico.rdStatusClick(Sender: TObject);
var
  TotalOS,
  TotalDesc,
  TotalPago,
  TotalPagar,
  Qtde : Real;
begin
  inherited;
  with dmOrdemServico.cdsListaOS do begin
    Filtered := false;
    case rdStatus.ItemIndex of
      0: Filter := 'ORDS_STATUS = 0';
      1: Filter := 'ORDS_STATUS = 1';
      2: Filter := 'ORDS_STATUS = 2';
      3: Filter := 'ORDS_STATUS = 3';
      4: Filter := 'ORDS_STATUS = 0 OR ORDS_STATUS = 1';
      else Filter := '';
    end;
    Filtered := true;
  end;
  TotalOS    := 0; TotalDesc  := 0; Qtde := 0;
  TotalPago  := 0; TotalPagar := 0;
  try
    with dmOrdemServico.cdsListaOS do begin
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

procedure TfCadOrdemServico.btnInsertClienteClick(Sender: TObject);
begin
  inherited;
  Label1Click(Sender);
  edtCodClie.SetFocus;
end;

procedure TfCadOrdemServico.Label1Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(152);
end;

procedure TfCadOrdemServico.Label1MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCadOrdemServico.Label1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

initialization

if fCadOrdemServico = nil then
  fCadOrdemServico := TfCadOrdemServico.Create(nil);

finalization

FreeAndNil(fCadOrdemServico);

end.
