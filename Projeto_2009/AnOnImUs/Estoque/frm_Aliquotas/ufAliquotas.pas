unit ufAliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfAliquotas = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAliquotas: TfAliquotas;

implementation

uses udmAliquotas, ufCad_Aliquotas;

{$R *.dfm}


procedure TfAliquotas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmAliquotas.cdsAliquotas;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro     := fCad_Aliquotas;
  with fCad_Aliquotas do begin
    cdsLocal       := dmAliquotas.cdsAliquotas;
    funcLocal      := Self.funcBasico;
  end;
  btnImprimir.Tag     := 0;
end;

procedure TfAliquotas.OpenClientDataSet;
begin
  with dmAliquotas do begin
    with cdsAliquotas do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfAliquotas);
finalization
  UnRegisterClass(TfAliquotas);

end.
