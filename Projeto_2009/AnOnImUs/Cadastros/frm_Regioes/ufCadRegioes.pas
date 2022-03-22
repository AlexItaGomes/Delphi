unit ufCadRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, Buttons, ExtCtrls, ComCtrls, rxToolEdit, RXDBCtrl,
  StdCtrls, Mask, DBCtrls;

type
  TfCadRegioes = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    edtKM: TDBEdit;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure edtKMKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadRegioes: TfCadRegioes;

implementation

uses udmRegioes;

{$R *.dfm}

procedure TfCadRegioes.btnOKClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtDescricao.SetFocus;
  end else IsValidData;
end;

function TfCadRegioes.ValidaDados : Boolean;
begin
  Result := true;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição para a região antes de continuar.',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtKM.Text = '' then begin
    funcLocal.Alerta('Informe a KM total da região antes de continuar.',0);
    edtKM.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadRegioes.edtKMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCadRegioes.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

initialization
  if fCadRegioes = nil then
    fCadRegioes := TfCadRegioes.Create(nil);
finalization
  FreeAndNil(fCadRegioes);

end.
