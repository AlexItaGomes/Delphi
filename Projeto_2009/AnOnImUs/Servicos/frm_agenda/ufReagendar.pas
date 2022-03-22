unit ufReagendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Funcoes, SQLExpr,
  RxToolEdit, RxDBCtrl, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, uFrPesqIndividual;

type
  TfReagendar = class(TForm)
    pageCadastro: TPageControl;
    tabCadastro: TTabSheet;
    Panel1: TPanel;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    frPesqAtendente: TfrPesqIndividual;
    pntitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    edtDtAgenda: TDBDateEdit;
    edtHorario: TDBEdit;
    edtDtaAgenda: TDBDateEdit;
    lblMotivo: TLabel;
    EdtMotivo: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    funcBasico : TFuncoes;
    FModo: String;
    function ValidaDados: Boolean;
    function JaExisteAgenda: Boolean;
    procedure PreencheFrame;
    procedure TratandoFrames;
    procedure TratarOrdemServico(intCod: Integer);
    procedure getModo(const Value: String);
    function setModo: String;
    { Private declarations }
  public
    property Modo    : String   read setModo   write getModo;
  end;

var
  fReagendar: TfReagendar;

implementation

{$R *.dfm}

uses udmAgenda, ufCadAgenda;

procedure TfReagendar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Self.Close();
end;

procedure TfReagendar.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;
  try
    if Modo <> '' then Exit;
    TratandoFrames;
    TratarOrdemServico(dmAgenda.cdsAgendaAGEN_ID.AsInteger);
    dmAgenda.cdsAgenda.ApplyUpdates(-1);
  finally
    ModalResult := mrOk;
  end;
end;

procedure TfReagendar.TratarOrdemServico(intCod : Integer);
var
  S : String;
  qryCons    : TSQLQuery;
  qryConsI   : TSQLQuery;
  intORDS_ID : Integer;
begin
  S := 'SELECT * FROM AGENDA WHERE AGEN_ID = :AGEN_ID AND AGEN_EMPR_ID = :EMPR_ID';
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    qryConsI := TSQLQuery.Create(nil);
    qryConsI.SQLConnection := funcBasico.Conexao;
    qryCons.Close;
    qryCons.sql.Clear;
    qryCons.sql.Add(S);
    qryCons.Params.ParamByName('AGEN_ID').AsInteger := intCod;
    qryCons.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    qryCons.Open;

    S := 'UPDATE OR INSERT INTO ORDEM_SERVICO(ORDS_ID,                      '+
         '                                    ORDS_EMPR_ID,                 '+
         '                                    ORDS_CLIE_ID,                 '+
         '                                    ORDS_CLIE_EMPR_ID,            '+
         '                                    ORDS_TPRC_ID,                 '+
         '                                    ORDS_TPRC_EMPR_ID,            '+
         '                                    ORDS_DTA_INSTALACAO,          '+
         '                                    ORDS_GENE_EMPR_ID_TIPO_OS,    '+
         '                                    ORDS_GENE_TGEN_ID_TIPO_OS,    '+
         '                                    ORDS_GENE_ID_TIPO_OS,         '+
         '                                    ORDS_STATUS,                  '+
         '                                    ORDS_USER_ID_TEC,             '+
         '                                    ORDS_VLR_TOTAL_OS,            '+
         '                                    ORDS_VLR_DESCONTO,            '+
         '                                    ORDS_VLR_PAGO,                '+
         '                                    ORDS_BAIXADO_ESTOQUE,         '+
         '                                    ORDS_DTA_CADASTRO,            '+
         '                                    ORDS_USER_ID)                 '+
         '                             VALUES(:ORDS_ID,                     '+
         '                                    :ORDS_EMPR_ID,                '+
         '                                    :ORDS_CLIE_ID,                '+
         '                                    :ORDS_CLIE_EMPR_ID,           '+
         '                                    :ORDS_TPRC_ID,                '+
         '                                    :ORDS_TPRC_EMPR_ID,           '+
         '                                    :ORDS_DTA_INSTALACAO,         '+
         '                                    :ORDS_GENE_EMPR_ID_TIPO_OS,   '+
         '                                    :ORDS_GENE_TGEN_ID_TIPO_OS,   '+
         '                                    :ORDS_GENE_ID_TIPO_OS,        '+
         '                                    :ORDS_STATUS,                 '+
         '                                    :ORDS_USER_ID_TEC,            '+
         '                                    :ORDS_VLR_TOTAL_OS,           '+
         '                                    :ORDS_VLR_DESCONTO,           '+
         '                                    :ORDS_VLR_PAGO,               '+
         '                                    :ORDS_BAIXADO_ESTOQUE,        '+
         '                                    :ORDS_DTA_CADASTRO,           '+
         '                                    :ORDS_USER_ID)                ';
    qryConsI.Close;
    qryConsI.sql.Clear;
    qryConsI.sql.Add(S);

    intORDS_ID := funcBasico.Se(qryCons.FieldByName('AGEN_ORDS_ID').IsNull,funcBasico.ObterSequencia('ORDEM_SERVICO', IntToStr(funcBasico.Empr_ID)),qryCons.FieldByName('AGEN_ORDS_ID').AsInteger);

    qryConsI.Params.ParamByName('ORDS_ID').AsInteger                   := intORDS_ID;
    qryConsI.Params.ParamByName('ORDS_EMPR_ID').AsInteger              := funcBasico.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_CLIE_ID').AsInteger              := qryCons.FieldByName('AGEN_CLIE_ID').AsInteger;
    qryConsI.Params.ParamByName('ORDS_CLIE_EMPR_ID').AsInteger         := funcBasico.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_TPRC_ID').AsInteger              := qryCons.FieldByName('AGEN_TPRC_ID').AsInteger;
    qryConsI.Params.ParamByName('ORDS_TPRC_EMPR_ID').AsInteger         := funcBasico.Empr_ID;
    qryConsI.Params.ParamByName('ORDS_DTA_INSTALACAO').AsDateTime      := qryCons.FieldByName('AGEN_DATA').AsDateTime;
    qryConsI.Params.ParamByName('ORDS_GENE_EMPR_ID_TIPO_OS').AsInteger := 0;
    qryConsI.Params.ParamByName('ORDS_GENE_TGEN_ID_TIPO_OS').AsInteger := 12;
    qryConsI.Params.ParamByName('ORDS_GENE_ID_TIPO_OS').AsInteger      := 1;
    qryConsI.Params.ParamByName('ORDS_STATUS').AsInteger               := funcBasico.Se((qryCons.FieldByName('AGEN_STATUS').AsString[1] in ['A','O']),0,
                                                                          funcBasico.Se(qryCons.FieldByName('AGEN_STATUS').AsString='F',2,3));
    qryConsI.Params.ParamByName('ORDS_USER_ID_TEC').AsInteger          := qryCons.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger;
    qryConsI.Params.ParamByName('ORDS_VLR_TOTAL_OS').AsInteger         := 0;
    qryConsI.Params.ParamByName('ORDS_VLR_DESCONTO').AsInteger         := 0;
    qryConsI.Params.ParamByName('ORDS_VLR_PAGO').AsInteger             := 0;
    qryConsI.Params.ParamByName('ORDS_BAIXADO_ESTOQUE').AsInteger      := 0;
    qryConsI.Params.ParamByName('ORDS_DTA_CADASTRO').AsDateTime        := qryCons.FieldByName('AGEN_DTA_CADASTRO').AsDateTime;
    qryConsI.Params.ParamByName('ORDS_USER_ID').AsInteger              := qryCons.FieldByName('AGEN_USER_ID').AsInteger;
    qryConsI.ExecSQL();

    qryConsI.SQL.Clear;
    qryConsI.SQL.Add('UPDATE AGENDA');
    qryConsI.SQL.Add('   SET AGEN_ORDS_ID      = :ORDS_ID');
    qryConsI.SQL.Add('      ,AGEN_ORDS_EMPR_ID = :EMPR_ID');
    qryConsI.SQL.Add(' WHERE AGEN_ID           = :AGEN_ID');
    qryConsI.SQL.Add('   AND AGEN_EMPR_ID      = :EMPR_ID');
    qryConsI.Params.ParamByName('ORDS_ID').AsInteger := intORDS_ID;
    qryConsI.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    qryConsI.Params.ParamByName('AGEN_ID').AsInteger := intCod;
    qryConsI.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    qryConsI.ExecSQL();
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    qryConsI.Close;
    FreeAndNil(qryConsI);
  end;
end;

procedure TfReagendar.TratandoFrames;
begin
  dmAgenda.cdsAgenda.Edit;
  dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsString := frPesqAtendente.InGrid();
end;


procedure TfReagendar.FormCreate(Sender: TObject);
var
  Princ   : TForm;
begin
  Princ := Application.MainForm;
  if Princ <> nil then
    funcBasico := TFuncoes(Princ.FindComponent('funcPrincipal'));
end;

procedure TfReagendar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
  if Key = #27 then begin
    btnCancelar.Click;
    Key := #0;
  end;
end;

procedure TfReagendar.FormShow(Sender: TObject);
begin
  PreencheFrame();
  if edtDtaAgenda.CanFocus then
    edtDtaAgenda.SetFocus;
  frPesqAtendente.Top := 50;
  lblMotivo.Visible   := false;
  EdtMotivo.Visible   := false;
  if Modo<>'' then begin
    pntitulo.Visible    := false;
    frPesqAtendente.Top := 5;
    lblMotivo.Visible   := true;
    EdtMotivo.Visible   := true;
  end;
end;

procedure TfReagendar.getModo(const Value: String);
begin
  FModo := Value;
end;

procedure TfReagendar.PreencheFrame();
begin
  frPesqAtendente.BuscarRegistro(dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsString);
end;

function TfReagendar.setModo: String;
begin
  Result := FModo;
end;

function TfReagendar.ValidaDados() : Boolean;
begin
  Result := false;
  if not frPesqAtendente.TemRegistro then begin
    funcBasico.Alerta('Necessário informar o profissional antes de continuar!',0);
    Exit;
  end;
  if Modo <> '' then begin
    if (Trim(EdtMotivo.Text)='') and (EdtMotivo.Enabled) then begin
      funcBasico.Alerta('Informe o Motivo do bloqueio antes de continuar!',0);
      Exit;
    end;
  end;
  if Modo = '' then begin
    if funcBasico.DataServidor()>edtDtaAgenda.Date then begin
      funcBasico.Alerta('Data inválida!',0);
      edtDtAgenda.SetFocus;
      Exit;
    end;
    if JaExisteAgenda() then begin
      funcBasico.Alerta('Já consta um agendamento para o Dia/Horário/Profissional selecionado!',0);
      Exit;
    end;
  end;
  Result := true;
end;

function TfReagendar.JaExisteAgenda() : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*)');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_ID                      <> :AGEN_ID');
      sql.Add('   AND AGEN_EMPR_ID                  = :EMPR_ID');
      sql.Add('   AND AGEN_DATA                     = :DATA');
      sql.Add('   AND AGEN_HORA                     = :HORARIO');
      sql.Add('   AND AGEN_USER_ID_ATENDENTE        = :USER_ID');
      sql.Add('   AND COALESCE(AGEN_AGEN_ID,0)     <> :AGEN_ID');
      sql.Add('   AND COALESCE(AGEN_AGEN_EMPR_ID,0) = :EMPR_ID');
      Params.ParamByName('AGEN_ID').AsInteger := dmAgenda.cdsAgenda.FieldByName('AGEN_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Params.ParamByName('DATA').AsDateTime   := dmAgenda.cdsAgenda.FieldByName('AGEN_DATA').AsDateTime;
      Params.ParamByName('HORARIO').AsString  := edtHorario.Text;
      Params.ParamByName('USER_ID').AsString  := frPesqAtendente.InGrid();
      Params.ParamByName('AGEN_ID').AsInteger := dmAgenda.cdsAgenda.FieldByName('AGEN_ID').AsInteger;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
      Result := qryCons.Fields[0].AsInteger > 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;


initialization
  fReagendar := TfReagendar.Create(nil);
finalization
  FreeAndNil(fReagendar);

end.
