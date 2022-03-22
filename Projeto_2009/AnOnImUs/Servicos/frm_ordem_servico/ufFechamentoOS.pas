unit ufFechamentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, Grids,
  DBGrids, Mask, rxToolEdit, rxCurrEdit, RXDBCtrl;

type
  TfFechamentoOS = class(TfCadastro)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtCodDoc: TDBEdit;
    Label3: TLabel;
    edtTipo: TDBEdit;
    btnPesqDoc: TSpeedButton;
    edtVlrDoc: TRxDBCalcEdit;
    Label4: TLabel;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    Label6: TLabel;
    edtBanco: TDBEdit;
    Label7: TLabel;
    edtNrDoc: TDBEdit;
    Label8: TLabel;
    edtNrAgencia: TDBEdit;
    Label9: TLabel;
    edtNrConta: TDBEdit;
    Label10: TLabel;
    edtTitula: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtCodBanco: TDBEdit;
    btnPesqBco: TSpeedButton;
    edtDt_Vecto: TDBDateEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnPesqDocClick(Sender: TObject);
    procedure edtCodDocKeyPress(Sender: TObject; var Key: Char);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure btnPesqBcoClick(Sender: TObject);
    procedure edtCodDocExit(Sender: TObject);
    procedure edtCodBancoExit(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnRetClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCodBancoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDocumentos: Boolean;
    procedure HabilitaCampos(intDoc: Integer);
    procedure DesabilitaCampos;
    function ValidaDados: Boolean;
    procedure SomaPedido;
    { Private declarations }
  public
    boolOK, boolCancel: Boolean;
  end;

var
  fFechamentoOS: TfFechamentoOS;

implementation

uses udmOrdemServico;

{$R *.dfm}

procedure TfFechamentoOS.btnAdicClick(Sender: TObject);
begin
  if ValidaDocumentos then
  begin
    with dmOrdemServico do
    begin
      cdsAcertos_OS.Append;
      SomaPedido;
      edtCodDoc.SetFocus;
      DesabilitaCampos;
    end;
  end;
end;

function TfFechamentoOS.ValidaDocumentos: Boolean;
begin
  Result := true;
  if edtCodDoc.Text = '' then
  begin
    funcLocal.Alerta('Informe o documento antes de continuar.', 0);
    edtCodDoc.SetFocus;
    Result := false;
    Exit;
  end;
  if edtVlrDoc.Value <= 0 then
  begin
    funcLocal.Alerta('Informe o valor do documento antes de continuar.', 0);
    edtVlrDoc.SetFocus;
    Result := false;
    Exit;
  end;
  case StrToInt(edtCodDoc.Text) of
    2, 3:
      begin
        try
          if edtCodBanco.Text = '' then
          begin
            funcLocal.Alerta('Informe o banco antes de continuar.', 0);
            edtCodBanco.SetFocus;
            Result := false;
            Exit;
          end;
          if edtDt_Vecto.Date <= 0 then
          begin
            funcLocal.Alerta
              ('Informe a data de vencimento do título antes de continuar.', 0);
            edtDt_Vecto.SetFocus;
            Result := false;
            Exit;
          end;
          if edtCodDoc.Text = '3' then
          begin
            if edtDt_Vecto.Date <= funcLocal.DataServidor
              (funcLocal.Conexao) then
            begin
              funcLocal.Alerta('Data inválida para o tipo de documento', 0);
              edtDt_Vecto.SetFocus;
              Result := false;
              Exit;
            end;
          end;
          if edtNrDoc.Text = '' then
          begin
            funcLocal.Alerta
              ('Informe o número do documento antes de continuar.', 0);
            edtNrDoc.SetFocus;
            Result := false;
            Exit;
          end;
          if edtNrAgencia.Text = '' then
          begin
            funcLocal.Alerta('Informe a agência antes de continuar.', 0);
            edtNrAgencia.SetFocus;
            Result := false;
            Exit;
          end;
          if edtNrConta.Text = '' then
          begin
            funcLocal.Alerta
              ('Informe o número da conta antes de continuar.', 0);
            edtNrConta.SetFocus;
            Result := false;
            Exit;
          end;
          if edtTitula.Text = '' then
          begin
            funcLocal.Alerta
              ('Informe o títular do documento antes de continuar.', 0);
            edtTitula.SetFocus;
            Result := false;
            Exit;
          end;
        except
          Result := false;
        end;
      end;
    4, 5, 6:
      begin
        try
          if edtDt_Vecto.Date <= funcLocal.DataServidor(funcLocal.Conexao) then
          begin
            funcLocal.Alerta('Data inválida para o tipo de documento', 0);
            edtDt_Vecto.SetFocus;
            Result := false;
            Exit;
          end;
        except
          Result := false;
        end;
      end;
  end;
end;

procedure TfFechamentoOS.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfFechamentoOS.btnOkClick(Sender: TObject);
Var
  fltTotal: Real;
begin
  try
    funcLocal.MSGAguarde();
    fltTotal := 0;
    if ValidaDados then
    begin
      with dmOrdemServico, cdsAcertos_OS do
      begin
        ApplyUpdates(-1);
        First;
        while not eof do
        begin
          fltTotal := fltTotal + cdsAcertos_OSODAC_VLR_DOC.AsFloat;
          Next;
        end;
        cdsOrdemServico.Edit;
        cdsOrdemServicoORDS_VLR_PAGO.AsFloat := fltTotal;
        cdsOrdemServico.ApplyUpdates(-1);
      end;
      Self.Close;
    end;
  finally
    funcLocal.MSGAguarde(false);
  end;
end;

function TfFechamentoOS.ValidaDados: Boolean;
var
  fltTotal: Real;
begin
  Result := true;
  with dmOrdemServico do
  begin
    cdsAcertos_OS.Cancel;
    if (cdsAcertos_OS.IsEmpty) and
      (dmOrdemServico.cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat > 0) then
    begin
      funcLocal.Alerta
        ('Ordem de Serviço sem pagamentos informados, verifique as formas de pagamento antes de continuar.',
        0);
      edtCodDoc.SetFocus;
      Result := false;
      Exit;
    end
    else if (dmOrdemServico.cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat = 0) then
    begin
      Exit;
    end;
    fltTotal := 0;
    cdsAcertos_OS.First;
    while not cdsAcertos_OS.eof do
    begin
      fltTotal := fltTotal + cdsAcertos_OSODAC_VLR_DOC.AsFloat;
      cdsAcertos_OS.Next;
    end;
    if (fltTotal > (cdsOrdemServicoVALOR_PAGAR.AsFloat +
      cdsOrdemServicoORDS_VLR_PAGO.AsFloat)) then
    begin
      funcLocal.Alerta('I M P O R T A N T E ! ! !' + #13 + #13 +
        'A soma dos títulos não podem ser superior ao valor da Ordem de Serviço,'
        + #13 + 'verifique os lançamentos efetuados antes de continuar.' + #13 +
        #13 + 'Vlr. Total O.S........: ' + FormatFloat('###,###,##0.00',
        cdsOrdemServicoVALOR_PAGAR.AsFloat) + #13 + 'Total Lançado:.....: ' +
        FormatFloat('###,###,##0.00', fltTotal), 1);
      edtCodDoc.SetFocus;
      Result := false;
      Exit;
    end;
    if (fltTotal < cdsOrdemServicoVALOR_PAGAR.AsFloat) then
    begin
      if funcLocal.Alerta('I M P O R T A N T E ! ! !' + #13 + #13 +
        'A soma dos valores lançados diverge do valor da O.S.' + #13 +
        'Verique os lançamentos efetuados antes de continuar.' + #13 + #13 +
        'Vlr. Total O.S........: ' + FormatFloat('###,###,##0.00',
        cdsOrdemServicoVALOR_PAGAR.AsFloat) + #13 + 'Total Lançado:.....: ' +
        FormatFloat('###,###,##0.00', fltTotal) + #13 + #13 +
        'Se não, você poderá efetuar os lançamentos posteriormente, gostaria de salvar os valores lançados? '
        + #13 + #13 +
        'Se você optar por [ SIM ] o sistema salvará os lançamentos ' +
        'efetuados mas não movimentará o seu financeiro é a O.S. ' +
        'manterá o seu Status como [ Realizado ].', 1, true) = 6 then
      begin
        cdsOrdemServico.Edit;
        cdsOrdemServico.FieldByName('ORDS_VLR_PAGO').AsFloat := fltTotal;
        cdsOrdemServico.ApplyUpdates(-1);
        boolOK := false;
      end
      else
      begin
        edtCodDoc.SetFocus;
        cdsAcertos_OS.Append;
        Result := false;
        Exit;
      end;
    end;
  end;
end;

procedure TfFechamentoOS.btnPesqBcoClick(Sender: TObject);
var
  strTMP: String;
begin
  try
    HabilitaCampos(StrToInt(edtCodDoc.Text));
  except
  end;
  with dmOrdemServico do
  begin
    OpenClientDataSet(3);
    strTMP := funcLocal.Busca_Registro(cdsPesqBanco, '',
      'GENE_ID;GENE_DESCR;GENE_PAR1', '');
    cdsAcertos_OS.Edit;
    if strTMP <> '' then
    begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_BCO').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 1);
      cdsAcertos_OS.FieldByName('BANCO').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 2);
      cdsAcertos_OS.FieldByName('COD_BANCO').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 3);
      edtCodBanco.Modified := true;
    end
    else
    begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_BCO').AsString := '';
      cdsAcertos_OS.FieldByName('BANCO').AsString := '';
      cdsAcertos_OS.FieldByName('COD_BANCO').AsString := '';
    end;
  end;
  edtCodBanco.SetFocus;
end;

procedure TfFechamentoOS.btnPesqDocClick(Sender: TObject);
var
  strTMP: String;
begin
  with dmOrdemServico do
  begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsTipoDoc, '',
      'GENE_ID;GENE_DESCR', '');
    cdsAcertos_OS.Edit;
    if strTMP <> '' then
    begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_TIPO_DOC').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 1);
      cdsAcertos_OS.FieldByName('TIPO_DOC').AsString :=
        funcLocal.Buscar_Coluna(strTMP, 2);
      edtCodDoc.Modified := true;
    end
    else
    begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_TIPO_DOC').AsString := '';
      cdsAcertos_OS.FieldByName('TIPO_DOC').AsString := '';
    end;
  end;
  edtCodDoc.SetFocus;
end;

procedure TfFechamentoOS.btnRetClick(Sender: TObject);
begin
  dmOrdemServico.cdsAcertos_OS.Cancel;
  with dmOrdemServico do
  begin
    if not cdsAcertos_OS.IsEmpty then
    begin
      cdsAcertos_OS.Delete;
      cdsAcertos_OS.Append;
      edtCodDoc.SetFocus;
      DesabilitaCampos;
    end;
  end;
end;

procedure TfFechamentoOS.edtCodBancoEnter(Sender: TObject);
begin
  inherited;
  try
    HabilitaCampos(StrToInt(edtCodDoc.Text));
  except
  end;
end;

procedure TfFechamentoOS.edtCodBancoExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodBanco.Modified then
    Exit;
  with dmOrdemServico do
  begin
    cdsAcertos_OS.Edit;
    OpenClientDataSet(3);
    if edtCodBanco.Text <> '' then
    begin
      strTMP := funcLocal.Busca_Registro(cdsPesqBanco, '',
        'GENE_ID;GENE_DESCR;GENE_PAR1', 'GENE_ID = ' + edtCodBanco.Text);
      if strTMP <> '' then
      begin
        cdsAcertos_OS.FieldByName('ODAC_GENE_ID_BCO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 1);
        cdsAcertos_OS.FieldByName('BANCO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 2);
        cdsAcertos_OS.FieldByName('COD_BANCO').AsString :=
          funcLocal.Buscar_Coluna(strTMP, 3);
      end
      else
      begin
        cdsAcertos_OS.FieldByName('ODAC_GENE_ID_BCO').AsString := '';
        cdsAcertos_OS.FieldByName('BANCO').AsString := '';
        cdsAcertos_OS.FieldByName('COD_BANCO').AsString := '';
      end;
    end
    else
    begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_BCO').AsString := '';
      cdsAcertos_OS.FieldByName('BANCO').AsString := '';
      cdsAcertos_OS.FieldByName('COD_BANCO').AsString := '';
    end;
  end;
end;

procedure TfFechamentoOS.edtCodDocExit(Sender: TObject);
var
  strTMP: String;
begin
  if not edtCodDoc.Modified then
    Exit;
  with dmOrdemServico do begin
    OpenClientDataSet(1);
    cdsAcertos_OS.Edit;
    if edtCodDoc.Text <> '' then begin
      strTMP := funcLocal.Busca_Registro(dmOrdemServico.cdsTipoDoc, '', 'GENE_ID;GENE_DESCR', 'GENE_ID = ' + edtCodDoc.Text);
      if strTMP <> '' then begin
        cdsAcertos_OS.FieldByName('ODAC_GENE_ID_TIPO_DOC').AsString := funcLocal.Buscar_Coluna(strTMP, 1);
        cdsAcertos_OS.FieldByName('TIPO_DOC').AsString              := funcLocal.Buscar_Coluna(strTMP, 2);
        try
          HabilitaCampos(StrToInt(edtCodDoc.Text));
        except
        end;
      end else begin
        cdsAcertos_OS.FieldByName('ODAC_GENE_ID_TIPO_DOC').AsString := '';
        cdsAcertos_OS.FieldByName('TIPO_DOC').AsString := '';
        DesabilitaCampos;
      end;
    end else begin
      cdsAcertos_OS.FieldByName('ODAC_GENE_ID_TIPO_DOC').AsString := '';
      cdsAcertos_OS.FieldByName('TIPO_DOC').AsString := '';
      DesabilitaCampos;
    end;
  end;
end;

procedure TfFechamentoOS.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  dmOrdemServico.cdsAcertos_OS.Cancel;
  try
    HabilitaCampos(StrToInt(edtCodDoc.Text));
  except
  end;
end;

procedure TfFechamentoOS.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  dmOrdemServico.cdsAcertos_OS.Cancel;
  try
    HabilitaCampos(StrToInt(edtCodDoc.Text));
  except
  end;
end;

procedure TfFechamentoOS.DesabilitaCampos;
begin
  edtCodBanco.Enabled := false;
  btnPesqBco.Enabled := false;
  edtCodigo.Enabled := false;
  edtBanco.Enabled := false;
  edtDt_Vecto.Enabled := false;
  edtNrDoc.Enabled := false;
  edtNrAgencia.Enabled := false;
  edtNrConta.Enabled := false;
  edtTitula.Enabled := false;
end;

procedure TfFechamentoOS.HabilitaCampos(intDoc: Integer);
begin
  try
    case intDoc of
      1:
        DesabilitaCampos;
      2:
        begin
          edtCodBanco.Enabled := true;
          btnPesqBco.Enabled := true;
          edtCodigo.Enabled := true;
          edtBanco.Enabled := true;
          edtDt_Vecto.Enabled := false;
          edtNrDoc.Enabled := true;
          edtNrAgencia.Enabled := true;
          edtNrConta.Enabled := true;
          edtTitula.Enabled := true;
        end;
      3:
        begin
          HabilitaCampos(2);
          edtDt_Vecto.Enabled := true;
        end;
      4, 5, 6, 7:
        begin
          DesabilitaCampos;
          edtDt_Vecto.Enabled := true;
        end;
    else
      begin
        DesabilitaCampos;
      end;
    end;
  except
  end;
end;

procedure TfFechamentoOS.edtCodDocKeyPress(Sender: TObject; var Key: Char);
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

procedure TfFechamentoOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // if (ActiveControl <> btnOk) and (ActiveControl <> btnCancelar) then begin
  // btnCancelar.Click;
  // boolOK     := false;
  // boolCancel := true;
  // end else if ActiveControl = btnCancelar then begin
  // boolOK := False;
  // end;
end;

procedure TfFechamentoOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // inherited;
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
  if Key = #27 then
  begin
    boolOK := false;
    Self.Close;
  end;
end;

procedure TfFechamentoOS.FormShow(Sender: TObject);
begin
  inherited;
  OpenClientDataSet(2);
  DesabilitaCampos;
  SomaPedido;
  boolOK := true;
  dmOrdemServico.cdsAcertos_OS.Edit;
  if dmOrdemServico.cdsOrdemServicoVALOR_PAGAR.AsFloat > 0 then
    dmOrdemServico.cdsAcertos_OSODAC_VLR_DOC.AsFloat :=
      dmOrdemServico.cdsOrdemServicoVALOR_PAGAR.AsFloat;
  edtCodDoc.SetFocus;
end;

procedure TfFechamentoOS.SomaPedido;
begin
  try
    with dmOrdemServico do
    begin
      cdsOrdemServico.Edit;
      cdsOrdemServicoVALOR_PAGAR.AsFloat :=
        (cdsOrdemServicoORDS_VLR_TOTAL_OS.AsFloat -
        (cdsOrdemServicoORDS_VLR_PAGO.AsFloat +
        cdsOrdemServicoORDS_VLR_DESCONTO.AsFloat));
    end;
  except
  end;
end;

procedure TfFechamentoOS.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label5Click(Sender);
  edtCodBanco.SetFocus;
end;

procedure TfFechamentoOS.Label5Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(204);
end;

procedure TfFechamentoOS.Label5MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfFechamentoOS.Label5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfFechamentoOS.OpenClientDataSet(intPos: Integer = 99);
begin
  if dmOrdemServico = nil then
    dmOrdemServico := TdmOrdemServico.Create(nil);
  with dmOrdemServico do
  begin
    case intPos of
      1:
        begin
          with cdsTipoDoc do
          begin
            Close;
            Open;
          end;
        end;
      2:
        begin
          cdsAcertos_OS.Close;
          cdsAcertos_OS.Params.ParamByName('EMPR_ID').AsInteger :=
            funcLocal.Empr_ID;
          cdsAcertos_OS.Params.ParamByName('ORDS_ID').AsInteger :=
            cdsOrdemServicoORDS_ID.AsInteger;
          cdsAcertos_OS.Params.ParamByName('EMPR_ID').AsInteger :=
            funcLocal.Empr_ID;
          cdsAcertos_OS.Open;
        end;
      3:
        begin
          with cdsPesqBanco do
          begin
            Close;
            Open;
          end;
        end
    else
      begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
      end;
    end;
  end;
end;

end.
