unit ufCadBandeiraCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCadBandeiraCartao = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    edtDescricao: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadBandeiraCartao: TfCadBandeiraCartao;

implementation

uses udmBandeiraCartao;

{$R *.dfm}

procedure TfCadBandeiraCartao.btnOKClick(Sender: TObject);
begin
  if not ValidaDados() then Exit;
  inherited;
  edtDescricao.SetFocus;
end;

function TfCadBandeiraCartao.ValidaDados() : Boolean;
begin
  Result := true;
  if Trim(edtDescricao.Text) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário atribuição de uma descrição antes de continuar!',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
end;


procedure TfCadBandeiraCartao.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

initialization
  fCadBandeiraCartao := TfCadBandeiraCartao.Create(nil);
finalization
  FreeAndNil(fCadBandeiraCartao);

end.
