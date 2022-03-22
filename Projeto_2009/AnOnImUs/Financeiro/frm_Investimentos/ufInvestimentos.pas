unit ufInvestimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufBasico, frxClass, frxDBSet, Vcl.Menus,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfInvestimentos = class(TfBasico)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInvestimentos: TfInvestimentos;

implementation

{$R *.dfm}

end.
