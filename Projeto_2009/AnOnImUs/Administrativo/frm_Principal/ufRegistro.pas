unit ufRegistro;

interface

uses
  Vcl.Forms, Vcl.Mask, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Graphics,
  Vcl.ExtCtrls, System.Classes, Funcoes, Vcl.Imaging.jpeg;

type
  TTipoSystem = (sysFinanc, sysEstoque, sysOS, sysConstruction, sysFrota, sysDelivery);

type
  TfRegistro = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    edtNome: TEdit;
    edtEmpresa: TEdit;
    edtemail: TEdit;
    edtSobreNome: TEdit;
    edtCidade: TEdit;
    cmbUF: TComboBox;
    edtTelefone: TMaskEdit;
    GroupBox2: TGroupBox;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtConfirma: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnAvancar: TSpeedButton;
    Label16: TLabel;
    Image1: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTelefoneKeyPress(Sender: TObject; var Key: Char);
  private
    function ValidaDados: Boolean;
    procedure AlteraUsuario(strUsuario, strSenha: String);
    { Private declarations }
  public
    funcLocal : TFuncoes;
    TipoSystem    : TTipoSystem;
    intStatus  : Integer;
  end;

var
  fRegistro: TfRegistro;

implementation

uses
  ufPrincipal, IdMessage, IdSMTP, System.IniFiles, System.SysUtils,
  Data.SqlExpr, PidUtils;

{$R *.dfm}

procedure TfRegistro.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
  fPrincipal.boolRegister := true;
end;

procedure TfRegistro.btnAvancarClick(Sender: TObject);
var
  idMsg      : TIdMessage;
  STMP       : TIdSMTP;
  iniTMP     : TIniFile;
  strHD      : String;
  strModulo  : String;
begin
  if ValidaDados then begin
    AlteraUsuario(edtUsuario.Text,edtSenha.Text);
    funcLocal.MSGAguarde();
    strHD := Trim(GetIDESerialNumber(0));
    if FileExists(ExtractFilePath(ParamStr(0))+'versionF.bpl') then begin
      strModulo := 'Controle Finaceiro';
    end else if FileExists(ExtractFilePath(ParamStr(0))+'versionE.bpl') then begin
      strModulo := 'Controle de Estoque';
    end else if FileExists(ExtractFilePath(ParamStr(0))+'versionO.bpl') then begin
      strModulo := 'Ordem de Serviço';
    end else if FileExists(ExtractFilePath(ParamStr(0))+'versionC.bpl') then begin
      strModulo := 'Construção Cívil';
    end else if FileExists(ExtractFilePath(ParamStr(0))+'versionT.bpl') then begin
      strModulo := 'Controle de Frota';
    end else if FileExists(ExtractFilePath(ParamStr(0))+'versionD.bpl') then begin
      strModulo := 'FastFood/Delivery';
    end;
    try
      iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
      iniTMP.WriteString('Client','Razao Social',edtNome.Text + ' ' + edtSobreNome.Text);
      iniTMP.WriteString('Client','Empresa',edtEmpresa.Text);
      iniTMP.WriteString('Client','Cidade',edtCidade.Text);
      iniTMP.WriteString('Client','UF',cmbUF.Text);
      iniTMP.WriteString('Client','email',edtemail.Text);
      iniTMP.WriteString('Client','Telefone',edtTelefone.Text);
      if strHD = '' then begin
       strHD := Trim(GetIDESerialNumber(0));
      end;
      iniTMP.WriteString('Client','ID',strHD);
    finally
      FreeAndNil(iniTMP);
    end;
    fPrincipal.boolRegister := true;
    idMsg   := TIdMessage.Create(nil);
    STMP    := TIdSMTP.Create(nil);
    try
      with idMsg do begin
        From.Name                 := edtEmpresa.Text;
        Recipients.EMailAddresses := 'registro@anonimus.info';
        Subject                   := 'Registro de Copia';
        Body.Add('Registro de Cópia do Sistema AnOnImUs.Info');
        Body.Add('');
        Body.Add('Versão:    ' + fPrincipal.Versao);
        body.Add('Modulo:    ' + strModulo);
        Body.Add('Nome:      ' + edtNome.Text);
        Body.Add('Sobrenome: ' + edtSobreNome.Text);
        Body.Add('Empresa:   ' + edtEmpresa.Text);
        Body.Add('Cidade:    ' + edtCidade.Text + ' - ' + cmbUF.Text);
        Body.Add('e-mail:    ' + edtemail.Text);
        Body.Add('Telefone:  ' + edtTelefone.Text);
        Body.Add('Mac:       ' + funcLocal.MacAddress);
        Body.Add('Data:      ' + FormatDateTime('dd-mm-yyyy',funcLocal.DataServidor(funcLocal.Conexao)));
        if strHD = '' then begin
          strHD := Trim(GetIDESerialNumber(0));
        end;
        Body.Add('ID:        ' + strHD);
      end;
      with STMP do begin
        Host     := 'mail.anonimus.info';
        Port     := 587;
        Username := 'registro@anonimus.info';
        Password := 'estoldq9';
        Connect;
        Try
          try
            fPrincipal.boolRegister := true;
            try
              Send(idMsg);
            except
              Self.Close;
            end;
          finally
            Self.Close;
          end;
        except
          try
            fPrincipal.boolRegister := true;
            Disconnect;
            Host   := 'mail.anonimus.info';
            Connect;
            try
              fPrincipal.boolRegister := true;
              try
                Send(idMsg);
              except
                Self.Close;
              end;
            except
              fPrincipal.boolRegister := true;
            end;
            Disconnect;
          finally
            Self.Close;
          end;
        end;
        Disconnect;
      end;
    except
      Self.Close;
    end;
  end;
end;

procedure TfRegistro.AlteraUsuario(strUsuario, strSenha : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcLocal.StartCommit;
        except
        end;
        sql.Add('UPDATE USUARIO');
        sql.Add('SET    USER_LOGIN = ' + QuotedStr(Trim(strUsuario)));
        sql.Add('      ,USER_SENHA = ' + QuotedStr(funcLocal.Criptografar(Trim(strSenha))));
        sql.Add('WHERE  USER_ID = 0');
        ExecSQL();
        try
          funcLocal.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcLocal.RollBack;
      funcLocal.Alerta('Erro no processo de alteração de acesso do usuário.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfRegistro.edtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

function TfRegistro.ValidaDados : Boolean;

function QtdeNumeros(strFone : String) : Boolean;
var
  intI : Integer;
begin
  Result := true;
  Exit;
  for intI := 1 to Length(strFone) do begin
    case intI of
      2,3,5,6,7,10,11,12 : begin
        try
          StrToInt(strFone[intI]);
        except
          Result := false;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure MensagemRegistro;
begin
  funcLocal.Alerta('Por favor! registre-se de forma que possamos identificar quem é você,'+#13+
                   'assim poderemos aperfeiçoar nossos sistemas afim de melhor atendê-lo.'+#13+#13+
                   'Preencha todas as informações corretamente antes de continuar!',0);
end;

function ValidaCaracteres(strNome : String) : Boolean;
var
  sltTMP : TStringList;
  intI   : Integer;
begin
  try
    strNome := UpperCase(Trim(strNome));
    Result  := true;
    sltTMP  := TStringList.Create;
    with sltTMP do begin
      Clear;
      Add(UpperCase('aaaaaaaaaa'));               Add(UpperCase('DASDR'));                                   Add(UpperCase('jjkjjkkjkhj'));
      Add(UpperCase('aaaaaaaaaaaaaaaaa'));        Add(UpperCase('RWRWRW'));                                  Add(UpperCase('kjjjjhkjk'));
      Add(UpperCase('aaaaaaaaaaaaaaa'));          Add(UpperCase('WRW CFSFS'));                               Add(UpperCase('kjjkjk'));
      Add(UpperCase('aaa@aa.aa'));                Add(UpperCase('dada@dna.com'));                            Add(UpperCase('hjjkjkjk@hotmail.com'));
      Add(UpperCase('(11)1111-1111'));            Add(UpperCase('gvvb'));                                    Add(UpperCase('0000000000000000000000000000000000'));
      Add(UpperCase('(22)2222-2222'));            Add(UpperCase('vbvjljnbknkn'));                            Add(UpperCase('jkkllçç'));
      Add(UpperCase('(33)3333-3333'));            Add(UpperCase('bvbvb'));                                   Add(UpperCase('aasa'));
      Add(UpperCase('(44)4444-4444'));            Add(UpperCase('vbvbv'));                                   Add(UpperCase('qqqq'));
      Add(UpperCase('(55)5555-5555'));            Add(UpperCase('vbbvvvb@sfgdgdf'));                         Add(UpperCase('ASDF'));
      Add(UpperCase('(66)6666-6666'));            Add(UpperCase('hasgdfghasfdg'));                           Add(UpperCase('ASDF adfasdf asdf'));
      Add(UpperCase('(77)7777-7777'));            Add(UpperCase('sadgsafdgsfd'));                            Add(UpperCase('ASDFadfasdfasdf'));
      Add(UpperCase('(88)8888-8888'));            Add(UpperCase('hsdgsagdhsgdhj'));                          Add(UpperCase('ADSFASFADS ADF ASDF'));
      Add(UpperCase('(99)9999-9999'));            Add(UpperCase('sagdhasgdhsgd'));                           Add(UpperCase('asdf@asdf.asdf.asdf'));
      Add(UpperCase('(00)0000-0000'));            Add(UpperCase('sdgshagdh@ksdksahdjksh.com.br'));           Add(UpperCase('wkpofmwkemd'));
      Add(UpperCase('dsfg'));                     Add(UpperCase('jhhdk'));                                   Add(UpperCase('lpdsmckdm'));
      Add(UpperCase('dsfgsd'));                   Add(UpperCase('dlslkjd'));                                 Add(UpperCase('dcsw,d,'));
      Add(UpperCase('dfgdsf'));                   Add(UpperCase('sdjshdj'));                                 Add(UpperCase('dhdhdh'));
      Add(UpperCase('asdasdsa'));                 Add(UpperCase('bkbkj'));                                   Add(UpperCase('dhdhdh@ig.com.br'));
      Add(UpperCase('sdads@dsfsdf.com'));         Add(UpperCase('FMMM'));                                    Add(UpperCase('dgyfwhu@hotmail.com'));
      Add(UpperCase('eereee'));                   Add(UpperCase('FMMMDIAS'));                                Add(UpperCase('esdsfsdfdsfsdf'));
      Add(UpperCase('eeeer'));                    Add(UpperCase('kkkkk'));                                   Add(UpperCase('fdfsf'));
      Add(UpperCase('sdsdc'));                    Add(UpperCase('ffffffffffff'));                            Add(UpperCase(''));
      Add(UpperCase('aaaaaaaaaaaaaaaa '));        Add(UpperCase('ffffffffffffffffffffff'));                  Add(UpperCase(''));
      Add(UpperCase('aaaaa'));                    Add(UpperCase('fffffffffffffffffffffffffffffffffffffff')); Add(UpperCase(''));
      Add(UpperCase('aaaaaaa'));                  Add(UpperCase('dddddddddddddddd'));                        Add(UpperCase(''));
      Add(UpperCase('aaaaaa'));                   Add(UpperCase('aaaaaaaaaaaaaaa'));                         Add(UpperCase(''));
      Add(UpperCase('aaaaaaaaaaa'));              Add(UpperCase('JNJFKLÃ'));                                 Add(UpperCase(''));
      Add(UpperCase('a@a.com'));                  Add(UpperCase('KLÇJ~IOJH'));                               Add(UpperCase(''));
      Add(UpperCase('blabla'));                   Add(UpperCase('IOJH~JIO]~P'));                             Add(UpperCase(''));
      Add(UpperCase('LÇKJ~POJ~POJH'));            Add(UpperCase('teste'));                                   Add(UpperCase(''));
      Add(UpperCase('hljkhkl@kjhçiouh.com.br'));  Add(UpperCase('hkjhkhjkjhkjkj'));                          Add(UpperCase(''));
    end;
    for intI := 0 to sltTMP.Count - 1 do begin
      Result := (Pos(strNome,sltTMP.Strings[intI]) = 0);
      if not Result then Exit;
    end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

begin
  Result := true;
  if (edtNome.Text = '') or (Length(edtNome.Text) <= 3) or (not ValidaCaracteres(UpperCase(edtNome.Text))) then begin
    MensagemRegistro;
    edtNome.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtSobreNome.Text = '') or (Length(edtSobreNome.Text) <= 3) or (not ValidaCaracteres(UpperCase(edtSobreNome.Text))) then begin
    MensagemRegistro;
    edtSobreNome.SetFocus;
    Result := false;
    Exit;
  end;
  if edtEmpresa.Text = '' then begin
    edtEmpresa.Text := edtNome.Text + ' ' + edtSobreNome.Text
  end;
  if (edtCidade.Text = '') or (Length(edtCidade.Text) <= 4) or (not ValidaCaracteres(UpperCase(edtCidade.Text))) then begin
    MensagemRegistro;
    edtCidade.SetFocus;
    Result := false;
    Exit;
  end;
  if cmbUF.Text = '' then begin
    MensagemRegistro;
    cmbUF.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtemail.Text = '') or (Length(edtemail.Text) <= 5) or (Pos('@',edtemail.Text) <= 0) or (not ValidaCaracteres(UpperCase(edtemail.Text))) then begin
    MensagemRegistro;
    edtemail.SetFocus;
    Result := false;
    Exit;
  end;
  if not QtdeNumeros(edtTelefone.Text) or (not ValidaCaracteres(UpperCase(edtTelefone.Text))) then begin
    MensagemRegistro;
    edtUsuario.SetFocus;
    Result := false;
    Exit;
  end;
  if edtUsuario.Text = '' then begin
    MensagemRegistro;
    edtUsuario.SetFocus;
    Result := false;
    Exit;
  end;
  if edtSenha.Text = '' then begin
    MensagemRegistro;
    edtSenha.SetFocus;
    Result := false;
    Exit;
  end;
  if edtConfirma.Text = '' then begin
    MensagemRegistro;
    edtConfirma.SetFocus;
    Result := false;
    Exit;
  end;
  if Trim(edtSenha.Text) <> Trim(edtConfirma.Text) then begin
    MensagemRegistro;
    edtSenha.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not ValidaDados then begin
    Abort;
  end else begin
    fPrincipal.boolRegister := true;
  end;
end;

procedure TfRegistro.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
  intStatus := 0;
end;

end.
