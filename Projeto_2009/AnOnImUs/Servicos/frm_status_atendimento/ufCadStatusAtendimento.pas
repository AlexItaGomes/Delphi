unit ufCadStatusAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxCurrEdit,
  RXDBCtrl, rxToolEdit, Mask, DBCtrls;

type
  TfCadStatusAtendimento = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    edtDescricao: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    edtDias: TRxDBCalcEdit;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadStatusAtendimento: TfCadStatusAtendimento;

implementation

uses udmStatusAtendimento;

{$R *.dfm}

procedure TfCadStatusAtendimento.btnOKClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtDescricao.SetFocus;
  end;
end;

procedure TfCadStatusAtendimento.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfCadStatusAtendimento.ValidaDados : Boolean;
begin
  Result := true;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe uma descrição antes de continuar!',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if edtDias.Value <= 0 then begin
    funcLocal.Alerta('Informe a quantidade de dias até o próximo antendimento, antes de continuar!',0);
    edtDias.SetFocus;
    Result := false;
    Exit;
  end;
end;

initialization
  if fCadStatusAtendimento = nil then
    fCadStatusAtendimento := TfCadStatusAtendimento.Create(nil);

finalization
  FreeAndNil(fCadStatusAtendimento);

end.
