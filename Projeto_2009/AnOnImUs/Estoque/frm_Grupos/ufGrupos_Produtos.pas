unit ufGrupos_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfGrupos_Produtos = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupos_Produtos: TfGrupos_Produtos;

implementation

uses udmGrupos, ufCad_Grupos_Produtos;

{$R *.dfm}

procedure TfGrupos_Produtos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmGrupos.cdsGrupos;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro     := fCad_Grupos_Produtos;
  with fCad_Grupos_Produtos do begin
    cdsLocal       := dmGrupos.cdsGrupos;
    funcLocal      := Self.funcBasico;
  end;
  btnImprimir.Tag  := 425;
end;

procedure TfGrupos_Produtos.OpenClientDataSet;
begin
  with dmGrupos do begin
    with cdsGrupos do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfGrupos_Produtos);
finalization
  UnRegisterClass(TfGrupos_Produtos);

end.
