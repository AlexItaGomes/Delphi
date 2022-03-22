unit ufConfDataBase;

interface

uses
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, Vcl.Buttons, Vcl.Graphics,
  Vcl.ExtCtrls, System.Classes, Funcoes, Data.SqlExpr, Vcl.Imaging.jpeg;

type
  TfConfDataBase = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    btnPesqOfic: TSpeedButton;
    Label1: TLabel;
    edtOficial: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    edtEspelho: TEdit;
    Label6: TLabel;
    edtAtualizacao: TEdit;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    Image1: TImage;
    procedure btnPesqOficClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    funLocal : TFuncoes;
    dbConexao : TSQLConnection;
    function Conectar(out strErro: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfDataBase: TfConfDataBase;

implementation

uses ufPrincipal, System.IniFiles, System.SysUtils;

{$R *.dfm}

procedure TfConfDataBase.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfConfDataBase.btnOkClick(Sender: TObject);
var
  iniTMP  : TIniFile;
  iniUP   : TIniFile;
  strErro : String;
begin
  if edtOficial.Text = '' then begin
    ShowMessage('Informe o caminho do banco de dados antes de continuar.');
    Exit;
  end;
  if edtEspelho.Text = '' then begin
    ShowMessage('Informe o caminho do banco de dados espelho antes de continuar.');
    Exit;
  end;
  if edtAtualizacao.Text = '' then begin
    ShowMessage('Informe o caminho do banco de dados de atualização antes de continuar.');
    Exit;
  end;
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    iniUP  := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUsUP.ini');
    iniTMP.WriteString('DBConfig','DataBase',edtOficial.Text);
    iniTMP.WriteString('DBConfig','DataBaseTemp',edtEspelho.Text);
    iniUP.WriteString('DBConfig','DataBase',edtAtualizacao.Text);
  finally
    FreeAndNil(iniTMP);
    FreeAndNil(iniUP);
  end;
  if Conectar(strErro) then begin
    ShowMessage('Banco de dados conectado com sucesso!!'+#13+#13+
                'Será necessário a reinicialização da aplicação.');
  end else begin
    ShowMessage('Não foi possível conectar ao banco de dados.');
  end;
  Application.Terminate;
end;

function TfConfDataBase.Conectar(out strErro: String): Boolean;
var
  AnOn     : TIniFile;
  lstParam : TStringList;
begin
  try
    AnOn      := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    lstParam  := TStringList.Create;
    dbConexao := TSQLConnection.Create(nil);
    try
      with dbConexao,AnOn do begin
        Params.Clear;
        ReadSectionValues('DBConfig',lstParam);
        Params.Assign(lstParam);
        strErro             := ReadString('DBConfig','DataBase','');
        ConnectionName      := Trim(ReadString('DBParam','ConnectionName','FBConnection'));
        DriverName          := Trim(ReadString('DBParam','Driver','Firebird'));
        GetDriverFunc       := Trim(ReadString('DBParam','GetDriverFunc','getSQLDriverINTERBASE'));
        KeepConnection      := (ReadString('DBParam','KeepConnection','True') = 'True');
        LibraryName         := Trim(ReadString('DBParam','LibraryName','dbxfb.dll'));
        LoadParamsOnConnect := (ReadString('DBParam','LoadParamsOnConnected','False') = 'True');
        LoginPrompt         := (ReadString('DBParam','LoginPrompt','False') = 'True');
        VendorLib           := Trim(ReadString('DBParam','VendorLib','fbclient.dll'));
        Connected           := (ReadString('DBParam','Connected','True') = 'true');
        dbConexao.Open;
        Result              := dbConexao.Connected;
      end;
    except
      Result  := false;
      Exit;
    end;
  finally
    FreeAndNil(AnOn);
    FreeAndNil(lstParam);
    FreeAndNil(dbConexao);
  end;
  try
    AnOn      := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUsUP.ini');
    lstParam  := TStringList.Create;
    dbConexao := TSQLConnection.Create(nil);
    try
      with dbConexao,AnOn do begin
        Params.Clear;
        ReadSectionValues('DBConfig',lstParam);
        Params.Assign(lstParam);
        strErro             := ReadString('DBConfig','DataBase','');
        ConnectionName      := Trim(ReadString('DBParam','ConnectionName','FBConnection'));
        DriverName          := Trim(ReadString('DBParam','Driver','Firebird'));
        GetDriverFunc       := Trim(ReadString('DBParam','GetDriverFunc','getSQLDriverINTERBASE'));
        KeepConnection      := (ReadString('DBParam','KeepConnection','True') = 'True');
        LibraryName         := Trim(ReadString('DBParam','LibraryName','dbxfb.dll'));
        LoadParamsOnConnect := (ReadString('DBParam','LoadParamsOnConnected','False') = 'True');
        LoginPrompt         := (ReadString('DBParam','LoginPrompt','False') = 'True');
        VendorLib           := Trim(ReadString('DBParam','VendorLib','fbclient.dll'));
        Connected           := (ReadString('DBParam','Connected','True') = 'true');
        dbConexao.Open;
        Result              := dbConexao.Connected;
      end;
    except
      Result  := false;
      Exit;
    end;
  finally
    FreeAndNil(AnOn);
    FreeAndNil(lstParam);
    FreeAndNil(dbConexao);
  end;
end;

procedure TfConfDataBase.btnPesqOficClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtOficial.Text := OpenDialog1.FileName;
end;

procedure TfConfDataBase.FormCreate(Sender: TObject);
begin
  funLocal := TFuncoes.Create(nil);
end;

procedure TfConfDataBase.FormShow(Sender: TObject);
var
  iniTMP : TIniFile;
  iniUP  : TIniFile;
begin
  try
    iniTMP := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUs.ini');
    iniUP  := TIniFile.Create(ExtractFilePath(Application.ExeName)+'AnOnImUsUP.ini');
    edtOficial.Text     := iniTMP.ReadString('DBConfig','DataBase','');
    edtEspelho.Text     := iniTMP.ReadString('DBConfig','DataBaseTemp','');
    edtAtualizacao.Text := iniUP.ReadString('DBConfig','DataBase','');
  finally
    FreeAndNil(iniTMP);
    FreeAndNil(iniUP);
  end;
  edtOficial.SetFocus;
end;

procedure TfConfDataBase.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtEspelho.Text := OpenDialog1.FileName;
end;

procedure TfConfDataBase.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtAtualizacao.Text := OpenDialog1.FileName;
end;

initialization
  fConfDataBase := TfConfDataBase.Create(nil);
finalization
  FreeAndNil(fConfDataBase);

end.
