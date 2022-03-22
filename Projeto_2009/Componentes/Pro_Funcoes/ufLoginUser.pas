unit ufLoginUser;

interface

uses
  Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Controls, Vcl.Buttons,
  Vcl.Graphics, System.Classes, Funcoes, Vcl.Imaging.jpeg;

type
  TfLoginUser = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    funcLocal : TFuncoes;
  public
    strUsuario,
    strSenha : String;
  end;

var
  fLoginUser: TfLoginUser;

implementation

uses ufLocaliza, Winapi.Messages;

{$R *.dfm}

procedure TfLoginUser.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfLoginUser.btnOKClick(Sender: TObject);
begin
  if edtUsuario.Text = '' then begin
    funcLocal.Alerta('Informe o usuário antes de continuar.',1);
    edtUsuario.SetFocus;
    Exit;
  end;
  if edtSenha.Text = '' then begin
    funcLocal.Alerta('Informe a senha antes de continuar.',1);
    edtSenha.SetFocus;
    Exit;
  end;
  strUsuario := edtUsuario.Text;
  strSenha   := edtSenha.Text;
  Self.Close;
end;

procedure TfLoginUser.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
  lab       : TLabel;
begin
  formPrinc := Application.MainForm;
  funcLocal := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
  lab       := TLabel(formPrinc.FindChildControl('Label3'));
end;

procedure TfLoginUser.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Perform(WM_NEXTDLGCTL,0,0);
  if key = #27 then Self.Close;   
end;

procedure TfLoginUser.FormShow(Sender: TObject);
begin
  edtUsuario.Clear;
  edtSenha.Clear;
  edtUsuario.SetFocus;
  strUsuario := '';
  strSenha   := '';
end;

end.
