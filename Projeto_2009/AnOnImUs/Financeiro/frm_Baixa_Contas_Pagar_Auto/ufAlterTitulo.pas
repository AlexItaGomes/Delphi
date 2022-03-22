unit ufAlterTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, uFrPesqIndividual;

type
  TfCadAlterTitulo = class(TfCadastro)
    frPesquisa: TfrPesqIndividual;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadAlterTitulo: TfCadAlterTitulo;

implementation

{$R *.dfm}

procedure TfCadAlterTitulo.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCadAlterTitulo.btnOKClick(Sender: TObject);
begin
  if not frPesquisa.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Você tem que selecionar um registro antes de continuar!',0);
    Exit;
  end;
  Self.Close;
end;

procedure TfCadAlterTitulo.FormCreate(Sender: TObject);
begin
  //inherited;
end;

procedure TfCadAlterTitulo.FormShow(Sender: TObject);
begin
  frPesquisa.SetFocus;
end;

end.
