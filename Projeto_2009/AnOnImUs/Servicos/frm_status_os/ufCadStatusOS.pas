unit ufCadStatusOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls;

type
  TfCadStatusOS = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
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
  fCadStatusOS: TfCadStatusOS;

implementation

uses udmStatusOS;

{$R *.dfm}

procedure TfCadStatusOS.btnOKClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtDescricao.SetFocus;
  end;
end;

procedure TfCadStatusOS.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfCadStatusOS.ValidaDados : Boolean;
begin
  Result := true;
  if Trim(edtDescricao.Text) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário atribuição de uma descrição antes de continuar!',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
end;

initialization
  if fCadStatusOS = nil then
    fCadStatusOS := TfCadStatusOS.Create(nil);
finalization
  FreeAndNil(fCadStatusOS);

end.
