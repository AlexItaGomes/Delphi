unit ufRel_Curva_ABC_Ordem_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TfRel_Curva_ABC_Ordem_Servico = class(TfBasico)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Curva_ABC_Ordem_Servico: TfRel_Curva_ABC_Ordem_Servico;

implementation

{$R *.dfm}

procedure TfRel_Curva_ABC_Ordem_Servico.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

end.
