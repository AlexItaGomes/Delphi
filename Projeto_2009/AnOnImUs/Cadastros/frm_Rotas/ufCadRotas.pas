unit ufCadRotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, Buttons, ExtCtrls, ComCtrls, rxCurrEdit, RXDBCtrl,
  DBCtrls, StdCtrls, Mask, rxToolEdit, uFrPesqIndividual;

type
  TfCadRota = class(TfCadastro)
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtkm: TRxDBCalcEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    Label5: TLabel;
    frPesqRegiao: TfrPesqIndividual;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure SetaValoresFrames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadRota: TfCadRota;

implementation

uses udmRotas, DB;

{$R *.dfm}

procedure TfCadRota.btnOKClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    SetaValoresFrames;
    edtDescricao.SetFocus;
  end;
end;

function TfCadRota.ValidaDados : Boolean;
begin
  Result := true;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe o nome da rota antes de continuar.',0);
    edtDescricao.SetFocus;
    Result := false;
    Exit;
  end;
  if not frPesqRegiao.TemRegistro then begin
    funcLocal.Alerta('É necessário informar a região antes de continuar.',0);
    frPesqRegiao.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadRota.FormShow(Sender: TObject);
begin
  inherited;
  SetaValoresFrames;
  edtDescricao.SetFocus;
end;

procedure TfCadRota.SetaValoresFrames;
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;

  frPesqRegiao.cdsLocal          := Self.cdsLocal;

  frPesqRegiao.cdsField1         := 'GENE_GENE_ID_PROD';
  frPesqRegiao.cdsField2         := 'REGIAO';
  frPesqRegiao.cdsField3         := 'AREA_TOTAL';

  try
    if not (cdsLocal.State = dsInsert) then begin
      frPesqRegiao.BuscarRegistro(cdsLocal.FieldByName('GENE_GENE_ID_PROD').AsString);
    end;
  except
  end;
end;

initialization
  if fCadRota = nil then
    fCadRota := TfCadRota.Create(nil);
finalization
  FreeAndNil(fCadRota);


end.
