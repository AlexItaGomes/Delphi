unit ufModelosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfModelosProdutos = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fModelosProdutos: TfModelosProdutos;

implementation

uses udmModelos, ufCad_ModelosProdutos;

{$R *.dfm}

procedure TfModelosProdutos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmModelos.cdsModelos;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro     := fCad_ModelosProdutos;
  with fCad_ModelosProdutos do begin
    cdsLocal       := dmModelos.cdsModelos;
    funcLocal      := Self.funcBasico;
  end;
end;

procedure TfModelosProdutos.OpenClientDataSet;
begin
  with dmModelos do begin
    with cdsModelos do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfModelosProdutos);
finalization
  UnRegisterClass(TfModelosProdutos);
end.
