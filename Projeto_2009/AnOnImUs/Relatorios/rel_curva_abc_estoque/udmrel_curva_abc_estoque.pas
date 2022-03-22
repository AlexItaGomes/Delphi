unit udmrel_curva_abc_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico;

type
  TdmRel_Curva_ABC_Estoque = class(TdmBasico)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Curva_ABC_Estoque: TdmRel_Curva_ABC_Estoque;

implementation

{$R *.dfm}

initialization
  if dmRel_Curva_ABC_Estoque = nil then
    dmRel_Curva_ABC_Estoque := TdmRel_Curva_ABC_Estoque.Create(nil);
finalization
  FreeAndNil(dmRel_Curva_ABC_Estoque);
  

end.
