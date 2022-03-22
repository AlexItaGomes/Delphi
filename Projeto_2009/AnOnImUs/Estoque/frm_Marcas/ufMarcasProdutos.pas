unit ufMarcasProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfMarcasProdutos = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMarcasProdutos: TfMarcasProdutos;

implementation

uses udmMarcas, ufCad_MarcasProdutos;

{$R *.dfm}


procedure TfMarcasProdutos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmMarcas.cdsMarcas;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro     := fCad_MarcasProdutos;
  with fCad_MarcasProdutos do begin
    cdsLocal       := dmMarcas.cdsMarcas;
    funcLocal      := Self.funcBasico;
  end;
  btnImprimir.Tag  := 426;
end;

procedure TfMarcasProdutos.OpenClientDataSet;
begin
  with dmDataModule do begin
    with cdsGeral do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfMarcasProdutos);
finalization
  UnRegisterClass(TfMarcasProdutos);

end.
