unit ufFiltros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfFiltros = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFiltros: TfFiltros;

implementation

uses udmFiltros, ufCadFiltros;

{$R *.dfm}

procedure TfFiltros.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmFiltros.cdsFiltros;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro     := fCadFiltros;
  with fCadFiltros do begin
    cdsLocal       := dmFiltros.cdsFiltros;
    funcLocal      := Self.funcBasico;
  end;
end;

procedure TfFiltros.OpenClientDataSet;
begin
  with dmFiltros do begin
    with cdsFiltros do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfFiltros);
finalization
  UnRegisterClass(TfFiltros);

end.
