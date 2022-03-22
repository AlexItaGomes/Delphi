unit ufCad_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  rxToolEdit, RXDBCtrl, Mask, SQLExpr, uFrPesqIndividual, ufrPesqDuplo,
  Vcl.Grids, Vcl.DBGrids;

type
  TfCad_Clientes = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    rdTipo: TDBRadioGroup;
    Label3: TLabel;
    edtRazao: TDBEdit;
    Label4: TLabel;
    edtFantasia: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    edtTelefone1: TDBEdit;
    Label9: TLabel;
    edtTelefone2: TDBEdit;
    Label10: TLabel;
    edtTelefone3: TDBEdit;
    Label11: TLabel;
    edtTelefone4: TDBEdit;
    Label12: TLabel;
    edtEndereco: TDBEdit;
    Label13: TLabel;
    edtBairro: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label5: TLabel;
    Label18: TLabel;
    edtCNPJ: TDBEdit;
    DBEdit17: TDBEdit;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Label27: TLabel;
    DBEdit3: TDBEdit;
    frPesqPraca: TfrPesqIndividual;
    DBRadioGroup2: TDBRadioGroup;
    frPesqDuplo: TfrPesqDuplo;
    Label15: TLabel;
    DBDateEdit2: TDBDateEdit;
    btnImportar: TSpeedButton;
    TabSheet2: TTabSheet;
    pageHistorico: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox3: TGroupBox;
    grAtendimento: TDBGrid;
    TabSheet6: TTabSheet;
    GroupBox2: TGroupBox;
    grFinanceiro: TDBGrid;
    GroupBox4: TGroupBox;
    grOrdemServico: TDBGrid;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    ckHepatite: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    ckDiabetes: TDBCheckBox;
    edtTipoHepatite: TDBEdit;
    edtTipoDiabetes: TDBEdit;
    GroupBox6: TGroupBox;
    DBCheckBox6: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    lbTempoAnestesia: TLabel;
    DBEdit2: TDBEdit;
    procedure rdTipoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCNPJEnter(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtFantasiaEnter(Sender: TObject);
    procedure frPesqPrimeirobtnInserirClick(Sender: TObject);
    procedure frPesqPracabtnPesquisarClick(Sender: TObject);
    procedure edtTelefone1Exit(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure grAtendimentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grFinanceiroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grOrdemServicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckHepatiteClick(Sender: TObject);
    procedure ckDiabetesClick(Sender: TObject);
  private
    procedure OpcoesRadio;
    function  ValidaDados: Boolean;
    function  JaExiste: Boolean;
    procedure SetaValoresFrames;
    function ValidaCodigoInformado(strCod: String): Boolean;
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Clientes: TfCad_Clientes;

implementation

uses udmClientes;

{$R *.dfm}

procedure TfCad_Clientes.btnOkClick(Sender: TObject);
begin
  if not ValidaDados then Exit;
  funcLocal.ReplicaCadastro(cdsLocal,'C');
  inherited;
  edtCNPJ.SetFocus;
  SetaValoresFrames;
end;

procedure TfCad_Clientes.ckDiabetesClick(Sender: TObject);
begin
  inherited;
  edtTipoDiabetes.Enabled := ckDiabetes.Checked;
  if not ckDiabetes.Checked then edtTipoHepatite.Clear;
end;

procedure TfCad_Clientes.ckHepatiteClick(Sender: TObject);
begin
  inherited;
  edtTipoHepatite.Enabled := ckHepatite.Checked;
  if not ckHepatite.Checked then edtTipoHepatite.Clear;
end;

procedure TfCad_Clientes.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (cdsLocal.State in [dsInsert]) then begin
    if ValidaCodigoInformado(cdsLocal.FieldByName('CLIE_ID').AsString) then begin
      DBEdit1.SetFocus;
      Abort;
    end;
  end;
end;

procedure TfCad_Clientes.grOrdemServicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = dmClientes.cdsOrdemServico.FieldByName('STATUS') then
  begin
    if dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger = 0 then
    begin
      grOrdemServico.Canvas.Brush.Color := $008CFF8C;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger = 1 then
    begin
      grOrdemServico.Canvas.Brush.Color := $006666FF;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger = 2 then
    begin
      grOrdemServico.Canvas.Brush.Color := $00FFC891;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger = 3 then
    begin
      grOrdemServico.Canvas.Brush.Color := clGray;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    if dmClientes.cdsOrdemServico.IsEmpty then
    begin
      grOrdemServico.Canvas.Brush.Color := clWhite;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
  if Column.Field = dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS') then
  begin
    if (dmClientes.cdsOrdemServico.FieldByName('ORDS_DTA_INSTALACAO')
      .AsDateTime = funcLocal.DataServidor(funcLocal.Conexao)) and
      (dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger in [0]) then
    begin
      grOrdemServico.Canvas.Brush.Color := clMoneyGreen;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
      grOrdemServico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Ag. p/ Hoje      ');
    end;
    if (dmClientes.cdsOrdemServico.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime <
      funcLocal.DataServidor(funcLocal.Conexao)) and
      (dmClientes.cdsOrdemServico.FieldByName('ORDS_STATUS').AsInteger in [0]) then
    begin
      grOrdemServico.Canvas.Brush.Color := clOlive;
      grOrdemServico.Canvas.Font.Style := [fsBold];
      grOrdemServico.DefaultDrawDataCell(Rect, Column.Field, State);
      grOrdemServico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,
        'Em Atraso        ');
    end;
  end;
end;

procedure TfCad_Clientes.grAtendimentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grAtendimento.DataSource.DataSet.RecNo) then begin
      grAtendimento.Canvas.Font.Color  := clBlack;
      grAtendimento.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grAtendimento.Canvas.Font.Color  := clBlack;
      grAtendimento.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grAtendimento.Canvas.Brush.Color := clSilver;
      grAtendimento.Canvas.Font.Style  := [fsBold];
    end;
     grAtendimento.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = dmClientes.cdsHistorico.FieldByName('ORIGEM') then begin
    if dmClientes.cdsHistorico.FieldByName('AGEN_STATUS').AsString = 'A' then begin
      grAtendimento.Canvas.Brush.Color := $00BFFFFE;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsHistorico.FieldByName('AGEN_STATUS').AsString = 'O' then begin
      grAtendimento.Canvas.Brush.Color := clYellow;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsHistorico.FieldByName('AGEN_STATUS').AsString = 'F' then begin
      grAtendimento.Canvas.Brush.Color := clGreen;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsHistorico.FieldByName('AGEN_STATUS').AsString = 'C' then begin
      grAtendimento.Canvas.Brush.Color := clMedGray;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsHistorico.FieldByName('AGEN_STATUS').AsString = 'B' then begin
      grAtendimento.Canvas.Brush.Color := clRed;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsHistorico.IsEmpty then begin
      grAtendimento.Canvas.Brush.Color := clWhite;
      grAtendimento.Canvas.Font.Style := [fsBold];
      grAtendimento.DefaultDrawDataCell(Rect,Column.Field,State);
      grAtendimento.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
end;

procedure TfCad_Clientes.grFinanceiroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grFinanceiro.DataSource.DataSet.RecNo) then begin
      grFinanceiro.Canvas.Font.Color  := clBlack;
      grFinanceiro.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grFinanceiro.Canvas.Font.Color  := clBlack;
      grFinanceiro.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grFinanceiro.Canvas.Brush.Color := clSilver;
      grFinanceiro.Canvas.Font.Style  := [fsBold];
    end;
     grFinanceiro.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = dmClientes.cdsFinanceiro.FieldByName('STATUS') then begin
    if dmClientes.cdsFinanceiro.FieldByName('CREC_STATUS').AsString = 'A' then begin
      grFinanceiro.Canvas.Brush.Color := $00ACFBB8;
      grFinanceiro.Canvas.Font.Style := [fsBold];
      grFinanceiro.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsFinanceiro.FieldByName('CREC_STATUS').AsString = 'F' then begin
      grFinanceiro.Canvas.Brush.Color := $00FFC184;
      grFinanceiro.Canvas.Font.Style := [fsBold];
      grFinanceiro.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if dmClientes.cdsFinanceiro.FieldByName('CREC_STATUS').AsString = 'C' then begin
      grFinanceiro.Canvas.Brush.Color := clYellow;
      grFinanceiro.Canvas.Font.Style := [fsBold];
      grFinanceiro.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if (dmClientes.cdsFinanceiro.FieldByName('CREC_DTA_VCTO').AsDateTime <= now) and
       (dmClientes.cdsFinanceiro.FieldByName('CREC_STATUS').AsString <> 'F')     and
       (dmClientes.cdsFinanceiro.FieldByName('CREC_STATUS').AsString <> 'C')     then begin
      grFinanceiro.Canvas.Brush.Color := $006262FF;
      grFinanceiro.Canvas.Font.Style := [fsBold];
      grFinanceiro.DefaultDrawDataCell(Rect,Column.Field,State);
      grFinanceiro.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Vencido        ');
    end;
    if dmClientes.cdsFinanceiro.IsEmpty then begin
      grFinanceiro.Canvas.Brush.Color := clWhite;
      grFinanceiro.Canvas.Font.Style := [fsBold];
      grFinanceiro.DefaultDrawDataCell(Rect,Column.Field,State);
      grFinanceiro.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
end;

procedure TfCad_Clientes.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := false;
end;

procedure TfCad_Clientes.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := true;
end;

procedure TfCad_Clientes.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
end;

function TfCad_Clientes.ValidaCodigoInformado(strCod : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(CLIE_ID)');
        sql.Add('FROM  CLIENTES');
        sql.Add('WHERE CLIE_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CLIE_ID       = ' + strCod);
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0);
        if Result then begin
          funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Código já utilizando!',0);
          Exit;
        end;
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'ValidaCodigoInformado',e.Message);
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;


end;

function TfCad_Clientes.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(CLIE_ID)');
        sql.Add('FROM  CLIENTES');
        sql.Add('WHERE CLIE_EMPR_ID  = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   CLIE_CNPJ_CPF = ' + QuotedStr(cdsLocal.FieldByName('CLIE_CNPJ_CPF').AsString));
        Open;
        Result := (qryCons.Fields[0].AsInteger > 0)
      end;
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfCad_Clientes.ValidaDados : Boolean;
var
  strFone : Array[0..3] of String;
begin
  Result := true; IsValidData;
  if (Trim(edtCNPJ.Text) = '.   .   -') or (Trim(edtCNPJ.Text) = '.   .   /    -') then begin
    funcLocal.Alerta('Informe o CPF/CNPJ do cliente antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtCNPJ.SetFocus;
    Result := false;
    Exit;
  end;
  if edtRazao.Text = '' then begin
    funcLocal.Alerta('Informe a razão social do clientes antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtRazao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtFantasia.Text = '' then begin
    funcLocal.Alerta('Informe o nome fantasia do cliente antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtFantasia.SetFocus;
    Result := false;
    Exit;
  end;
  if Trim(edtEndereco.Text) = '' then begin
    funcLocal.Alerta('Informe o endereço do cliente antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtEndereco.SetFocus;
    Result := false;
    Exit;
  end;
  if edtBairro.Text = '' then begin
    funcLocal.Alerta('Informe o bairro antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtBairro.SetFocus;
    Result := false;
    Exit;
  end;
  if not frPesqPraca.TemRegistro then begin
    funcLocal.Alerta('Informe a praça do cliente antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    frPesqPraca.SetFocus;
    Result := false;
    Exit;
  end;

  strFone[0] := cdsLocal.FieldByName('CLIE_TELEFONE1').AsString;
  strFone[1] := cdsLocal.FieldByName('CLIE_TELEFONE2').AsString;
  strFone[2] := cdsLocal.FieldByName('CLIE_TELEFONE3').AsString;
  strFone[3] := cdsLocal.FieldByName('CLIE_TELEFONE4').AsString;

  if (Length(strFone[0]) < 13) and
     (Length(strFone[1]) < 13) and
     (Length(strFone[2]) < 13) and
     (Length(strFone[3]) < 13) then begin
    funcLocal.Alerta('Informe pelo menos 1 (Um) número de telefone antes de continuar.',1);
    pageCadastro.Pages[0].Show;
    edtTelefone1.SetFocus;
    Result := false;
    Exit;
  end;
  if not(cdsLocal.FieldByName('CLIE_LIMITE_CREDITO').AsFloat > 0) then
    cdsLocal.FieldByName('CLIE_LIMITE_CREDITO').AsFloat := 0;

  if cdsLocal.State = dsInsert then begin
    if JaExiste then begin
      funcLocal.Alerta('Já consta um cliente cadastrado para o CNPJ/CPF informado.',1);
      pageCadastro.Pages[0].Show;
    end;
  end;
end;

procedure TfCad_Clientes.edtCNPJEnter(Sender: TObject);
begin
  inherited;
  OpcoesRadio;
end;

procedure TfCad_Clientes.edtCNPJExit(Sender: TObject);
begin
  inherited;
  if cdsLocal.State = dsInsert then begin
    if JaExiste then begin
      funcLocal.Alerta('Já consta um cliente cadastrado para o CNPJ/CPF informado.',1);
    end;
  end;
end;

procedure TfCad_Clientes.edtFantasiaEnter(Sender: TObject);
begin
  inherited;
  if (edtFantasia.Text = '') and (edtRazao.Text <> '') then
    cdsLocal.FieldByName('CLIE_FANTASIA').AsString := cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString;
end;

procedure TfCad_Clientes.edtTelefone1Exit(Sender: TObject);
begin
  inherited;
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
end;

procedure TfCad_Clientes.FormShow(Sender: TObject);
begin
  pageCadastro.Pages[2].Show;
  pageHistorico.Pages[0].Show;
  inherited;
  edtCNPJ.SetFocus;
  SetaValoresFrames;
  OpcoesRadio;
  btnImportar.Enabled := not (cdsLocal.State in [dsInsert]);
  DBEdit1.ReadOnly    := not (cdsLocal.State in [dsInsert]);
  OpenClientDataSet();
end;

procedure TfCad_Clientes.OpenClientDataSet();
begin
  with dmClientes do begin
    with cdsHistorico do begin
      Close;
      Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsFinanceiro do begin
      Close;
      Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
    with cdsOrdemServico do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

procedure TfCad_Clientes.frPesqPracabtnPesquisarClick(Sender: TObject);
begin
  inherited;
  frPesqPraca.btnPesquisarClick(Sender);
end;

procedure TfCad_Clientes.frPesqPrimeirobtnInserirClick(Sender: TObject);
begin
  inherited;
  frPesqDuplo.frPesqPrimeirobtnInserirClick(Sender);
end;

procedure TfCad_Clientes.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
      (Components[intI] as TfrPesqIndividual).funcLocal := Self.funcLocal;
      (Components[intI] as TfrPesqIndividual).ckPlanoContas.Checked := funcLocal.FiltrarPlanoContasPAI;
    end;
    if (Components[intI] is TfrPesqDuplo) then begin
      (Components[intI] as TfrPesqDuplo).Limpar;
      (Components[intI] as TfrPesqDuplo).funcLocal := Self.funcLocal;
    end;
  end;

  frPesqPraca.cdsLocal                  := Self.cdsLocal;
  frPesqPraca.cdsField1                 := 'CLIE_GENE_ID_PRACA';
  frPesqPraca.cdsField2                 := 'CIDADE';
  frPesqPraca.cdsField3                 := 'UF';
  frPesqDuplo.frPesqPrimeiro.cdsLocal   := Self.cdsLocal;
  frPesqDuplo.frPesqPrimeiro.cdsField1  := 'CLIE_GENE_ID_ROTA';
  frPesqDuplo.frPesqPrimeiro.cdsField2  := 'ROTA';
  frPesqDuplo.frPesqPrimeiro.cdsField3  := 'KM_FINAL';

  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqPraca.BuscarRegistro(cdsLocal.FieldByName('CLIE_GENE_ID_PRACA').AsString);
      frPesqDuplo.frPesqPrimeiro.BuscarRegistro(cdsLocal.FieldByName('CLIE_GENE_ID_ROTA').AsString);
      frPesqDuplo.frPesqSegundo.BuscarRegistro(frPesqDuplo.frPesqPrimeiro.edtOpcao1.Text);
    end;
  except
  end;
end;

procedure TfCad_Clientes.btnImportarClick(Sender: TObject);
var
  qryCons : TSQLQuery;
begin
  inherited;
  if (cdsLocal.State in [dsInsert]) then Exit;
  if funcLocal.Alerta('Confirma a importação do registro selecionado?',1,true) = 6 then begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT COUNT(*) AS QTDE');
        sql.Add('  FROM FORNECEDORES');
        sql.Add(' WHERE FORN_CNPJ_CPF = ' + QuotedStr(cdsLocal.FieldByName('CLIE_CNPJ_CPF').AsString));
        Open;
        if qryCons.Fields[0].AsInteger > 0 then begin
          if not (funcLocal.Alerta('Registro já existente para o CPF/CNPJ informado, deseja importa-lo assim mesmo?',1,true) = 6) then begin
            Exit;
          end;
        end;
        try
          Close;
          sql.Clear;
          sql.Add('INSERT INTO FORNECEDORES(');
          sql.Add('                        FORN_ID,');
          sql.Add('                        FORN_RAZAO_SOCIAL,');
          sql.Add('                        FORN_NOME_FANTASIA,');
          sql.Add('                        FORN_CNPJ_CPF,');
          sql.Add('                        FORN_IE,');
          sql.Add('                        FORN_CEP,');
          sql.Add('                        FORN_ENDERECO,');
          sql.Add('                        FORN_BAIRRO,');
          sql.Add('                        FORN_GENE_EMPR_ID_PRACA,');
          sql.Add('                        FORN_GENE_TGEN_ID_PRACA,');
          sql.Add('                        FORN_GENE_ID_PRACA,');
          sql.Add('                        FORN_TELEFONE,');
          sql.Add('                        FORN_FAX,');
          sql.Add('                        FORN_SITE,');
          sql.Add('                        FORN_EMAIL,');
          sql.Add('                        FORN_ATIVO,');
          sql.Add('                        FORN_TIPO,');
          sql.Add('                        FORN_OBS,');
          sql.Add('                        FORN_DTA_CADASTRO,');
          sql.Add('                        FORN_USER_ID)');
          sql.Add('                 SELECT '+funcLocal.ObterSequencia('FORNECEDORES','0')+',');
          sql.Add('                        CLIE_RAZAO_SOCIAL,');
          sql.Add('                        CLIE_FANTASIA,');
          sql.Add('                        CLIE_CNPJ_CPF,');
          sql.Add('                        CLIE_RG,');
          sql.Add('                        CLIE_CEP,');
          sql.Add('                        CLIE_ENDERECO,');
          sql.Add('                        CLIE_BAIRRO,');
          sql.Add('                        CLIE_GENE_EMPR_ID_PRACA,');
          sql.Add('                        CLIE_GENE_TGEN_ID_PRACA,');
          sql.Add('                        CLIE_GENE_ID_PRACA,');
          sql.Add('                        CLIE_TELEFONE1,');
          sql.Add('                        CLIE_TELEFONE2,');
          sql.Add('                        CLIE_SITE,');
          sql.Add('                        CLIE_EMAIL,');
          sql.Add('                        CLIE_ATIVO,');
          sql.Add('                        CLIE_TIPO,');
          sql.Add('                        CLIE_OBS,');
          sql.Add('                        CLIE_DTA_CADASTRO,');
          sql.Add('                        CLIE_USER_ID');
          sql.Add('                 FROM CLIENTES');
          sql.Add('                WHERE CLIE_ID      = ' + cdsLocal.FieldByName('CLIE_ID').AsString);
          sql.Add('                  AND CLIE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
          ExecSQL();
        except on e: exception do begin
          funcLocal.Alerta('Erro na importação!'+#13+#13+
                           E.Message ,0);
          Exit;
        end; end;
        funcLocal.Alerta('I N F O R M A Ç Ã O ! ! !'+#13+#13+
                         'Importação realizadas com sucesso!',1);
      end;
    finally
      FreeAndNil(qryCons);
    end;
  end;
end;

procedure TfCad_Clientes.OpcoesRadio;
begin
  case rdTipo.ItemIndex of
    0 : cdsLocal.FieldByName('CLIE_CNPJ_CPF').EditMask := '###.###.###-##';
    1 : cdsLocal.FieldByName('CLIE_CNPJ_CPF').EditMask := '##.###.###/####-##';
  end;
end;

procedure TfCad_Clientes.rdTipoClick(Sender: TObject);
begin
  inherited;
  OpcoesRadio;
end;

initialization
  if fCad_Clientes = nil then
    fCad_Clientes := TfCad_Clientes.Create(nil);
finalization
  FreeAndNil(fCad_Clientes);

end.
