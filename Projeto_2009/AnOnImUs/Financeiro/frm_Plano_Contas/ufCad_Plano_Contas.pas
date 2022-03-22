unit ufCad_Plano_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit, SQLExpr,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCad_Plano_Contas = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    edtCod_Simp: TDBEdit;
    Label4: TLabel;
    edtPlano: TDBEdit;
    rdTipo: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtCod_Hier: TDBEdit;
    Label6: TLabel;
    edtCodSimplif: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    btnPesq: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCod_HierKeyPress(Sender: TObject; var Key: Char);
    procedure edtCod_HierExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function JaExiste: Boolean;
    function RetornaPontos(strTMP: String): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Plano_Contas: TfCad_Plano_Contas;

implementation

uses udmPlano_Contas, DB;

{$R *.dfm}

procedure TfCad_Plano_Contas.btnOkClick(Sender: TObject);

{$REGION 'UpdatePlanoContas'}
  procedure UpdatePlanoContas(intPLCT_ID : Integer);
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          sql.Clear;
          sql.Add('UPDATE PLANO_CONTAS SET PLCT_ATIVO = 0 WHERE PLCT_ID = ' + IntToStr(intPLCT_ID));
          ExecSQL();
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

{$ENDREGION}

{$REGION 'DesativarPlanoContas'}
  procedure DesativarPlanoContas(intPLCT_ID : Integer);
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      try
        with qryCons do begin
          UpdatePlanoContas(intPLCT_ID);
          SQL.Clear;
          sql.Add('SELECT PLCT_ID FROM PLANO_CONTAS WHERE PLCT_PLCT_ID = ' + IntToStr(intPLCT_ID));
          Open;
          First;
          while not Eof do begin
            DesativarPlanoContas(FieldByName('PLCT_ID').AsInteger);
            Next;
          end;
        end;
      except
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

begin
  if ValidaDados then begin
    //if (cdsLocal.FieldByName('PLCT_ATIVO').AsInteger = 0) then
      //DesativarPlanoContas(cdsLocal.FieldByName('PLCT_ID').AsInteger);
    inherited;
    edtCod_Simp.SetFocus;
  end else IsValidData;
end;

function TfCad_Plano_Contas.ValidaDados : Boolean;
begin
  Result := true;
  if edtCod_Simp.Text = '' then begin
    funcLocal.Alerta('Informe o código simplificado para o plano de contas antes de continuar.',1);
    edtCod_Simp.SetFocus;
    Result := false;
    Exit;
  end;
  if edtPlano.Text = '' then begin
    funcLocal.Alerta('Informe a descrição do plano de contas antes de continuar.',1);
    edtPlano.SetFocus;
    Result := false;
    Exit;
  end;
  if (Pos('.',edtCod_Simp.Text) > 0) and (edtCodSimplif.Text = '') then begin
    funcLocal.Alerta('Informe a hierarquia do plano de contas informado antes de continuar.',0);
    edtCod_Hier.SetFocus;
    Result := false;
    Exit;
  end;
  if Length(edtCod_Simp.Text) > 1 then begin
    if (Copy(edtCod_Simp.Text,1,1) <> Copy(edtCodSimplif.Text,1,1)) then begin
      funcLocal.Alerta('Há sequencia hierarquica para o plano de contas informado não bate com a hierarquia do plano de contas informado.',1);
      edtCod_Simp.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if Length(edtCod_Simp.Text) > 1 then begin
    if RetornaPontos(edtCodSimplif.Text) >= RetornaPontos(edtCod_Simp.Text) then begin
      funcLocal.Alerta('Há sequencia hierarquica para o plano de contas informado não bate com a hierarquia do plano de contas informado.',1);
      edtCod_Simp.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if JaExiste then begin
    funcLocal.Alerta('Já consta cadastrado um plano de contas cadastrado com os dados lançados.',1);
    edtCod_Simp.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCad_Plano_Contas.RetornaPontos(strTMP : String) : Integer;
var
  intI: Integer;
begin
  Result := 0;
  if Length(strTMP) = 0 then Exit;
  for intI := 0 to Length(strTMP) do begin
    if strTMP[intI] = '.' then begin
      inc(Result);
    end;
  end;
end;

function TfCad_Plano_Contas.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result := false;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  PLANO_CONTAS');
        sql.Add('WHERE PLCT_ID              <> ' + cdsLocal.FieldByName('PLCT_ID').AsString);
        sql.Add('AND   PLCT_EMPR_ID          = 0');
        sql.Add('AND   PLCT_COD_SIMPLIFICADO = ' + QuotedStr(cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO').AsString));
        sql.Add('AND   PLCT_DESCRICAO        = ' + QuotedStr(cdsLocal.FieldByName('PLCT_DESCRICAO').AsString));
        sql.Add('AND   PLCT_TIPO             = ' + QuotedStr(cdsLocal.FieldByName('PLCT_TIPO').AsString));
        if cdsLocal.FieldByName('PLCT_PLCT_ID').AsString <> '' then begin
          sql.Add('AND   PLCT_PLCT_ID          = ' + cdsLocal.FieldByName('PLCT_PLCT_ID').AsString);
          sql.Add('AND   PLCT_PLCT_EMPR_ID     = 0');
        end;
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0);
    except on e: exception do begin
      funcLocal.ReportaErro(Caption,'JaExiste',funcLocal.User_Login,e.Message);
      funcLocal.Alerta('Erro no processo de validação do plano de contas.'+#13+'['+E.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCad_Plano_Contas.btnPesqClick(Sender: TObject);
var
  strTMP : String;
begin
  with dmPlano_Contas do begin
    with cdsPesq_Plano do begin
      Close;
      Params.ParamByName('TIPO').AsString := cdsPlano_ContasPLCT_TIPO.AsString;
      Open;
    end;
    strTMP := funcLocal.Busca_Registro(cdsPesq_Plano,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','');
    if strTMP <> '' then begin
      cdsLocal.FieldByName('PLCT_PLCT_ID').AsString             := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO_1').AsString  := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('PLCT_DESCRICAO_1').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
      edtCod_Hier.Modified := true;
    end else begin
      cdsLocal.FieldByName('PLCT_PLCT_ID').AsString             := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO_1').AsString  := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO_1').AsString         := '';
    end;
  end;
  edtCod_Hier.SetFocus;
end;

procedure TfCad_Plano_Contas.edtCod_HierExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCod_Hier.Modified then Exit;
  with dmPlano_Contas do begin
    with cdsPesq_Plano do begin
      Close;
      Params.ParamByName('TIPO').AsString := cdsPlano_ContasPLCT_TIPO.AsString;
      Open;
    end;
    if (edtCod_Simp.Text <> '') and (edtCod_Hier.Text <> '') then begin
      strTMP := funcLocal.Busca_Registro(cdsPesq_Plano,'PLCT_DESCRICAO','PLCT_ID;PLCT_COD_SIMPLIFICADO;PLCT_DESCRICAO','PLCT_ID = ' + edtCod_Hier.Text);
      if strTMP <> '' then begin
        cdsLocal.FieldByName('PLCT_PLCT_ID').AsString             := funcLocal.Buscar_Coluna(strTMP,1);
        cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO_1').AsString  := funcLocal.Buscar_Coluna(strTMP,2);
        cdsLocal.FieldByName('PLCT_DESCRICAO_1').AsString         := funcLocal.Buscar_Coluna(strTMP,3);
      end else begin
        cdsLocal.FieldByName('PLCT_PLCT_ID').AsString             := '';
        cdsLocal.FieldByName('PLCT_COD_SIMPL IFICADO_1').AsString  := '';
        cdsLocal.FieldByName('PLCT_DESCRICAO_1').AsString         := '';
      end;
    end else begin
      cdsLocal.FieldByName('PLCT_PLCT_ID').AsString             := '';
      cdsLocal.FieldByName('PLCT_COD_SIMPLIFICADO_1').AsString  := '';
      cdsLocal.FieldByName('PLCT_DESCRICAO_1').AsString         := '';
    end;
  end;
end;

procedure TfCad_Plano_Contas.edtCod_HierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then begin
    try
      if Trim(edtCod_Hier.Text) = '' then begin
        if Key = #27 then Exit;
        funcLocal.VlrPesq := Key;
        Key := #0;
        btnPesq.Click;
      end else Key := #0;
    except
    end;
  end;
end;

procedure TfCad_Plano_Contas.FormShow(Sender: TObject);
begin
  inherited;
  edtCod_Simp.SetFocus;
end;

initialization
  if fCad_Plano_Contas = nil then
    fCad_Plano_Contas := TfCad_Plano_Contas.Create(nil);
finalization
  FreeAndNil(fCad_Plano_Contas);

end.
