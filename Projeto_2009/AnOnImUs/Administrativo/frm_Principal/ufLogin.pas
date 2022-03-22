unit ufLogin;

interface

uses
  Vcl.Forms, Vcl.XPMan, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.Classes, Funcoes, Data.SqlExpr, Vcl.Imaging.jpeg;

type
  TfLogin = class(TForm)
    Label2: TLabel;
    btnSenha: TSpeedButton;
    btnCancelar: TSpeedButton;
    XPManifest1: TXPManifest;
    btnOK: TSpeedButton;
    Image1: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    cmbEmpresas: TComboBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbEmpresasEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Label6Click(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edtLoginExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure btnSenhaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cmbEmpresasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    funcLocal : TFuncoes;
    procedure RegistraLoginUsuario(strUser_ID, strEmpr_ID: String);
  public
  end;

var
  fLogin: TfLogin;

implementation

uses ufPrincipal, System.SysUtils, Winapi.UrlMon, Winapi.Messages,
  System.IniFiles, Vcl.Graphics, Winapi.Windows;

{$R *.dfm}

procedure TfLogin.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfLogin.btnOKClick(Sender: TObject);
var
  qryCons : TSQLQuery;
begin
  try
    fPrincipal.funcPrincipal.MSGAguarde();
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := fPrincipal.funcPrincipal.Conexao;
    try
      if (edtLogin.Text <> '') and (edtSenha.Text <> '') and (cmbEmpresas.Text <> '') then begin
        //Validando o Login e Senha do Usuario
        with qryCons do begin
          Close;
          sql.Clear;
          SQL.Add('SELECT');
          SQL.Add('      USER_ID,');
          SQL.Add('      USER_LOGIN,');
          SQL.Add('      USER_SENHA,');
          SQL.Add('      USER_ATIVO,'); //Se o usuario esta ativo ou nao.
          SQL.Add('      USER_DTA_CADASTRO,'); //Data Cadastro
          SQL.Add('      USER_NOME_COMPLETO'); //Nome completo do Usuario do Sistema
          SQL.Add('FROM  USUARIO');
          SQL.Add('WHERE USER_LOGIN = '+ QuotedStr(Trim(edtLogin.Text)));
          SQL.Add('AND   USER_SENHA = '+ QuotedStr(funcLocal.Criptografar(Trim(edtSenha.Text))));
          Open;
          if not IsEmpty then begin
            while not Eof do begin
              if (Trim(qryCons.Fields[1].AsString)  = Trim(edtLogin.Text)) and
                 (Trim(qryCons.Fields[2].AsString)  = Trim(funcLocal.Criptografar(edtSenha.Text))) and
                 (qryCons.Fields[3].AsInteger = 1) then begin
                fPrincipal.funcPrincipal.User_ID    := qryCons.Fields[0].AsInteger;
                fPrincipal.funcPrincipal.Empr_ID    := Integer(cmbEmpresas.Items.Objects[cmbEmpresas.ItemIndex]);
                fPrincipal.funcPrincipal.CarregaDadosEmpresa();
                fPrincipal.funcPrincipal.User_Login := qryCons.Fields[1].AsString;
                RegistraLoginUsuario(IntToStr(fPrincipal.funcPrincipal.User_ID), IntToStr(fPrincipal.funcPrincipal.Empr_ID));
                Self.Close;
              end;
              Next;
            end;
          end else fPrincipal.funcPrincipal.Alerta('Usuário e senha inválido.',1);
        end;
      end else fPrincipal.funcPrincipal.Alerta('Informe todos os dados de conexão antes de prosseguir.',0);
    except on e: exception do begin
      fPrincipal.funcPrincipal.ReportaErro(Caption,(Sender as TComponent).Name,e.Message);
      fPrincipal.funcPrincipal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    fPrincipal.funcPrincipal.MSGAguarde(false);
  end;
end;

procedure TfLogin.btnSenhaClick(Sender: TObject);
var
  strLink : String;
  strTMP  : PWideChar;
begin
  try
    strLink := 'http://www.arsistemaseconsultoria.com.br/'+Self.Name+'.php' + fPrincipal.funcPrincipal.Se(fPrincipal.funcPrincipal.Privado,'?ID=1','');
    strTMP  := StringToOleStr(strLink);
    HlinkNavigateString(nil,strTMP);
  except on e: exception do begin
    fPrincipal.funcPrincipal.ReportaErro(Caption,'btnHelpClick',e.Message);
    fPrincipal.funcPrincipal.Alerta('Erro ao tentar executar o navegador padrão.'+#13+'['+e.Message+']',1)
  end; end;
end;

procedure TfLogin.RegistraLoginUsuario(strUser_ID, strEmpr_ID : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := fPrincipal.funcPrincipal.Conexao;
    try
      with qryCons do begin
        Close;
        SQL.Clear;
        try
          fPrincipal.funcPrincipal.StartCommit;
        except
        end;
        SQL.Add('INSERT INTO LOGIN VALUES(' + fPrincipal.funcPrincipal.ObterSequencia('LOGIN',IntToStr(fPrincipal.funcPrincipal.Empr_ID)) + ','
                                                 + strEmpr_ID + ','
                                                 + QuotedStr(FormatDateTime('mm/dd/yyyy',fPrincipal.funcPrincipal.DataServidor(fPrincipal.funcPrincipal.Conexao,true))) + ','
                                                 + strUser_ID + ')');
        ExecSQL;
        try
          fPrincipal.funcPrincipal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      fPrincipal.funcPrincipal.RollBack;
      fPrincipal.funcPrincipal.ReportaErro(Caption,'procedure RegistraLoginUsuario',e.Message);
      fPrincipal.funcPrincipal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfLogin.SpeedButton1Click(Sender: TObject);
begin
  edtLogin.SetFocus;
end;

procedure TfLogin.btnHelpClick(Sender: TObject);
begin
  HlinkNavigateString(nil,'http://www.arsistemaseconsultoria.com.br/ajuda.html');
end;

procedure TfLogin.cmbEmpresasEnter(Sender: TObject);
var
  qryCons : TSQLQuery;
  User_ID : Integer;
begin
  try
    cmbEmpresas.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := fPrincipal.funcPrincipal.Conexao;
    try
      if (edtLogin.Text <> '') and (edtSenha.Text <> '') then begin
        //Localizando usuario
        with qryCons do begin
          Close;
          sql.Clear;
          SQL.Add('SELECT');
          SQL.Add('      USER_ID');
          SQL.Add('FROM  USUARIO');
          SQL.Add('WHERE USER_LOGIN = ' + QuotedStr(Trim(edtLogin.Text)));
          SQL.Add('AND   USER_SENHA = ' + QuotedStr(funcLocal.Criptografar(Trim(edtSenha.Text))));
          Open;
        end;
        if not qryCons.IsEmpty then begin
          User_ID := qryCons.Fields[0].AsInteger;
          //Disponibilizando visualizacao das empresas permitidas
          with qryCons do begin
            Close;
            sql.Clear;
            sql.Add('SELECT');
            sql.Add('      E.EMPR_ID,');
            sql.Add('      E.EMPR_NOME_FANTASIA');
            sql.Add('FROM  EMPRESAS E');
            sql.Add('INNER JOIN USUARIO_EMPR U');
            sql.Add('ON (E.EMPR_ID = U.USEP_EMPR_ID)');
            sql.Add('WHERE E.EMPR_ATIVO   = 1');
            sql.Add('AND   U.USEP_USER_ID = '+ IntToStr(User_ID));
            Open;
            First;
          end;
          if not qryCons.IsEmpty then begin
            while not qryCons.Eof do begin
              cmbEmpresas.Items.AddObject(qryCons.Fields[0].AsString + ' - ' + qryCons.Fields[1].AsString,TObject(qryCons.Fields[0].AsInteger));
              qryCons.Next;
            end;
          end;
        end;
      end;
    except on e: exception do begin
      fPrincipal.funcPrincipal.ReportaErro(Caption,'cmbEmpresasEnter',e.Message);
      fPrincipal.funcPrincipal.Alerta(e.Message,1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
  cmbEmpresas.ItemIndex := 0;
end;

procedure TfLogin.cmbEmpresasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then begin
    if (edtLogin.Text <> '') and (edtSenha.Text <> '') and (cmbEmpresas.Text <> '') then
      btnOK.Click;
  end;
end;

procedure TfLogin.edtLoginExit(Sender: TObject);
begin
  if edtLogin.Modified then
    cmbEmpresasEnter(Sender);
end;

procedure TfLogin.edtSenhaExit(Sender: TObject);
begin
  if edtSenha.Modified then
    cmbEmpresasEnter(Sender);
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  funcLocal := TFuncoes.Create(nil);
end;

procedure TfLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then key := #0;
  if key = #13 then begin
    Perform(WM_NEXTDLGCTL,0,0);
    key := #0;
  end;
end;

procedure TfLogin.FormShow(Sender: TObject);
var
  iniTMP : TIniFile;
begin
  Brush.Style := bsClear;
  Label2.Caption  := fPrincipal.Versao;
  if FindWindow('TAppBuilder', nil) > 0 then begin
    edtLogin.Text := 'ANONIMUS';
    edtSenha.Text := Trim('ANONIMUS');
    cmbEmpresasEnter(Self);
    cmbEmpresas.ItemIndex := 0;
  end;
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    if iniTMP.ReadBool('DBConfig','PrimaryExec',true) then begin
      edtLogin.Text := 'ADMIN';
      edtSenha.Text := 'ADMIN';
      cmbEmpresasEnter(Sender);
      iniTMP.WriteBool('DBConfig','PrimaryExec',false);
    end;
  finally
    FreeAndNil(iniTMP);
  end;
  fPrincipal.funcPrincipal.MSGAguardeErro(false);
  edtLogin.SetFocus;
end;

procedure TfLogin.Label6Click(Sender: TObject);
begin
  HlinkNavigateString(nil,'http://www.arsistemaseconsultoria.com.br');
end;

end.
