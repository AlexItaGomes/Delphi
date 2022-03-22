unit ufAlteraTituloR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, uFrPesqIndividual;

type
  TfAlteraTit = class(TfCadastro)
    frPesquisa: TfrPesqIndividual;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlteraTit: TfAlteraTit;

implementation

{$R *.dfm}

procedure TfAlteraTit.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfAlteraTit.btnOKClick(Sender: TObject);
begin
  if not frPesquisa.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Você tem que selecionar um registro antes de continuar!',0);
    Exit;
  end;
  Self.Close;
end;

procedure TfAlteraTit.FormCreate(Sender: TObject);
begin
//  inherited;
end;

procedure TfAlteraTit.FormShow(Sender: TObject);
begin
  frPesquisa.SetFocus;
end;

end.
