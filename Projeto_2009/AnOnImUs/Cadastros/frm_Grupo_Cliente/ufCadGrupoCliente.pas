unit ufCadGrupoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, Buttons, ExtCtrls, ComCtrls, rxToolEdit, RXDBCtrl,
  StdCtrls, Mask, DBCtrls;

type
  TfCadGrupoCliente = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadGrupoCliente: TfCadGrupoCliente;

implementation

uses udmGrupoCliente;

{$R *.dfm}

procedure TfCadGrupoCliente.btnOKClick(Sender: TObject);
begin
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descricao para o grupo de clientes antes de continuar.',0);
    edtDescricao.SetFocus;
    Exit;
  end;
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfCadGrupoCliente.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

initialization
  if fCadGrupoCliente = nil then
    fCadGrupoCliente := TfCadGrupoCliente.Create(nil);
finalization
  FreeAndNil(fCadGrupoCliente);

end.
