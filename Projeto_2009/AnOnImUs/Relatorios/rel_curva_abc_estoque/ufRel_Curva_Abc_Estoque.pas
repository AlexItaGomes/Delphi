unit ufRel_Curva_Abc_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus;

type
  TfRel_Curva_Abc_Estoque = class(TfBasico)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Curva_Abc_Estoque: TfRel_Curva_Abc_Estoque;

implementation

{$R *.dfm}

procedure TfRel_Curva_Abc_Estoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

initialization
  RegisterClass(TfRel_Curva_Abc_Estoque);
finalization
  UnRegisterClass(TfRel_Curva_Abc_Estoque);

end.
