unit ufLicenca;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.Buttons, Vcl.Graphics,
  Vcl.ExtCtrls, System.Classes, Funcoes, System.SysUtils, Vcl.Mask,
  Data.SqlExpr,Messages, Vcl.Imaging.jpeg;

type
  TfLicenca = class(TForm)
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblCodigo: TLabel;
    lblEndereco: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    edtChave: TEdit;
    Image1: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtChave1KeyPress(Sender: TObject; var Key: Char);
  private
    function CNPJCorresponde(strCNPJ: String): Boolean;
    function AtualizaLicenca(strKey, strCNPJ : String) : Boolean;
    procedure BuscaEmpresa;
    function ChaveJaExiste(strKey, strCNPJ: String): Boolean;
  public
    funcLocal : TFuncoes;
  end;

var
  fLicenca: TfLicenca;

implementation

uses
  Vcl.Dialogs, ufPrincipal;

{$R *.dfm}

procedure TfLicenca.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

function TfLicenca.CNPJCorresponde(strCNPJ : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*)');
      sql.Add('  FROM EMPRESAS');
      sql.Add(' WHERE EMPR_CNPJ = '+QuotedStr(strCNPJ));
      Open;
    end;
    Result := qryCons.Fields[0].AsInteger > 0;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfLicenca.edtChave1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Length((Sender as TEdit).Text) = ((Sender as TEdit).Tag-1))) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfLicenca.FormCreate(Sender: TObject);
begin
  funcLocal := TFuncoes(fPrincipal.funcPrincipal);
end;

procedure TfLicenca.FormShow(Sender: TObject);
begin
  BuscaEmpresa();
end;

procedure TfLicenca.BuscaEmpresa();
begin
  lblCodigo.Caption   := IntToStr(funcLocal.Empr_ID)+' - '+Trim(funcLocal.Empr_Razao + ' - ' + funcLocal.Empr_CNPJ);
  lblEndereco.Caption := funcLocal.Empr_Endereco+', '+funcLocal.Empr_Bairro+' - '+funcLocal.Empr_Cidade+' - '+funcLocal.Empr_UF;
end;

procedure TfLicenca.btnOkClick(Sender: TObject);

  procedure DesbloqueiaEmpresa(Value : String);
  var
    qryCons : TSQLQuery;
  begin
    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add(Format('UPDATE CONF_SISTEMA SET CSIS_BSYS = ''%S'' WHERE CSIS_EMPR_ID = %S',[Value,IntToStr(funcLocal.Empr_ID)]));
        ExecSQL()
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;

var
  strKey  : String;
  Chave   : Array[1..22] of String;
  strCNPJ,
  strData : String;
  intI    : Integer;
begin

  //EE11E-A53282A188-E7A-8267E-AE8

  strKey := Trim(edtChave.Text);
  strKey := StringReplace(strKey,'-','',[rfReplaceAll]);
  DesbloqueiaEmpresa('S');
  if Length(strKey) <> 26 then begin
    funcLocal.Alerta('A T E N Ç ÃO ! ! !'+#13+#13+'Informe uma chave válida antes de continuar!',0);
    Exit;
  end;
  strCNPJ := StringReplace(StringReplace(funcLocal.Buscar_Coluna( funcLocal.Criptografar2(strKey) ,1),'-','',[rfReplaceAll]),'.','',[rfReplaceAll]);
  Chave[01] := Copy(strCNPJ,1,1); Chave[02] := Copy(strCNPJ,5,1);Chave[03] := Copy(strCNPJ,2,1); Chave[04] := Copy(strCNPJ,8,1);
  Chave[05] := Copy(strCNPJ,9,1); Chave[06] := Copy(strCNPJ,6,1);Chave[07] := Copy(strCNPJ,3,1); Chave[08] := Copy(strCNPJ,11,1);
  Chave[09] := Copy(strCNPJ,4,1); Chave[10] := Copy(strCNPJ,7,1);Chave[11] := Copy(strCNPJ,18,1);Chave[12] := Copy(strCNPJ,16,1);
  Chave[13] := Copy(strCNPJ,17,1);Chave[14] := Copy(strCNPJ,15,1);Chave[15] := Copy(strCNPJ,14,1);Chave[16] := Copy(strCNPJ,12,1);
  Chave[17] := Copy(strCNPJ,21,1);Chave[18] := Copy(strCNPJ,22,1);Chave[19] := Copy(strCNPJ,19,1);Chave[20] := Copy(strCNPJ,20,1);
  Chave[21] := Copy(strCNPJ,13,1);Chave[22] := Copy(strCNPJ,10,1);
  strCNPJ := ''; for intI := 1 to 22 do strCNPJ := strCNPJ + Chave[intI];
  strData := Copy(strCNPJ,15,2)+'/'+Copy(strCNPJ,17,2)+'/'+Copy(strCNPJ,19,4);
  strCNPJ := Copy(strCNPJ,1,2)+'.'+Copy(strCNPJ,3,3)+'.'+Copy(strCNPJ,6,3)+'/'+Copy(strCNPJ,9,4)+'-'+Copy(strCNPJ,13,2);
  try
    if not CNPJCorresponde(strCNPJ) then begin
      funcLocal.Alerta('A T E N Ç ÃO ! ! !'+#13+#13+'Chave inválida!',0);
      Exit;
    end;
    if StrToDate(strData) < funcLocal.DataServidor() then begin
      funcLocal.Alerta('A T E N Ç ÃO ! ! !'+#13+#13+'Chave inválida!',0);
      Exit;
    end;
    if ChaveJaExiste(strKey,strCNPJ) then begin
      funcLocal.Alerta('A T E N Ç ÃO ! ! !'+#13+#13+'Chave já utilizada, inválidada!',0);
      Exit;
    end;
  except
    funcLocal.Alerta('A T E N Ç ÃO ! ! !'+#13+#13+'Chave inválida!',0);
    Exit;
  end;
  if AtualizaLicenca(strKey,strCNPJ) then begin
    DesbloqueiaEmpresa('N');
    Self.Close;
  end;
end;

function TfLicenca.ChaveJaExiste(strKey, strCNPJ : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result  := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      SQL.Add('SELECT COUNT(*)');
      SQL.Add('  FROM CHAVES');
      SQL.Add(' WHERE CHVS_KEY     = '+QuotedStr(strKey));
      SQL.Add('   AND CHVS_EMPR_ID = (SELECT EMPR_ID FROM EMPRESAS WHERE EMPR_CNPJ = '+QuotedStr(strCNPJ)+')');
      Open;
      Result := Fields[0].AsInteger > 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfLicenca.AtualizaLicenca(strKey, strCNPJ : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result  := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;

      SQL.Add('INSERT INTO CHAVES(CHVS_ID,CHVS_KEY,CHVS_EMPR_ID) VALUES((SELECT COALESCE(MAX(CHVS_ID),0)+1 FROM CHAVES),'+QuotedStr(strKey)+',(SELECT EMPR_ID FROM EMPRESAS WHERE EMPR_CNPJ = '+QuotedStr(strCNPJ)+'))');
      try
        ExecSQL();
      except on e: exception do

      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

end.
