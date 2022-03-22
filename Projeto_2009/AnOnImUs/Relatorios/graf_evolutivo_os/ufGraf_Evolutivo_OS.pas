unit ufGraf_Evolutivo_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  frxClass, frxDBSet, frxDesgn, Menus;

type
  TfGraf_Evolutivo_OS = class(TfBasico)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Evolutivo_OS: TfGraf_Evolutivo_OS;

implementation

{$R *.dfm}

procedure TfGraf_Evolutivo_OS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    Self.Close;
    key := #0
  end;
end;

end.
