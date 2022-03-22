unit ufBuscaAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, uFrPesqIndividual;

type
  TfBuscaAgenda = class(TfCadastro)
    frPesqCliente: TfrPesqIndividual;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frPesqClientebtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscaAgenda: TfBuscaAgenda;

implementation

{$R *.dfm}

procedure TfBuscaAgenda.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfBuscaAgenda.btnOKClick(Sender: TObject);
begin
//  inherited;
//  if not frPesqCliente.TemRegistro then begin
//    funcLocal.Alerta('Necessário selecionar um horário antes de continuar!',0);
//    Exit;
//  end;
  Self.Close;
end;

procedure TfBuscaAgenda.FormShow(Sender: TObject);
begin
  inherited;
  frPesqCliente.Limpar;
  frPesqCliente.SetFocus;
end;

procedure TfBuscaAgenda.frPesqClientebtnPesquisarClick(Sender: TObject);
begin
  inherited;
  frPesqCliente.btnPesquisarClick(Sender);
end;

initialization
  fBuscaAgenda := TfBuscaAgenda.Create(nil);
finalization
  FreeAndNil(fBuscaAgenda);

end.
