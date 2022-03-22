unit ufCadTipoAgendamentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, uFrPesqIndividual;

type
  TfCadTipoAgendamentoOS = class(TfCadastro)
    frPesquisa: TfrPesqIndividual;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadTipoAgendamentoOS: TfCadTipoAgendamentoOS;

implementation

{$R *.dfm}

procedure TfCadTipoAgendamentoOS.btnCancelarClick(Sender: TObject);
begin
  //inherited;
  Self.Close();
end;

procedure TfCadTipoAgendamentoOS.btnOKClick(Sender: TObject);
begin
  if not frPesquisa.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Você tem que selecionar um registro antes de continuar!',0);
    Exit;
  end;
  Self.Close;
end;

procedure TfCadTipoAgendamentoOS.FormCreate(Sender: TObject);
begin
  //inherited;
end;

procedure TfCadTipoAgendamentoOS.FormShow(Sender: TObject);
begin
  frPesquisa.SetFocus;
end;

initialization
  if fCadTipoAgendamentoOS = nil then
    fCadTipoAgendamentoOS := TfCadTipoAgendamentoOS.Create(nil);

finalization
  FreeAndNil(fCadTipoAgendamentoOS);

end.
