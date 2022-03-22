unit ufCadTipoAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCadTipoAgendamento = class(TfCadastro)
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadTipoAgendamento: TfCadTipoAgendamento;

implementation

uses uDmTipoAgendamento;

{$R *.dfm}

procedure TfCadTipoAgendamento.btnOKClick(Sender: TObject);
begin
  if not ValidaDados then Exit;
  inherited;
end;

function TfCadTipoAgendamento.ValidaDados(): Boolean;
begin
  Result := true;
  if Trim(edtDescricao.Text) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Nescessário informar uma descrição antes de continuar!',0);
    Result := false;
    edtDescricao.SetFocus;
    Exit;
  end;
end;

procedure TfCadTipoAgendamento.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

initialization
  fCadTipoAgendamento := TfCadTipoAgendamento.Create(nil);

finalization
  FreeAndNil(fCadTipoAgendamento);

end.
