unit ufCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Vcl.Menus, Funcoes, Vcl.ExtCtrls, DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfCheques = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCheques: TfCheques;

implementation

uses udmCheques, ufCadCheques;

{$R *.dfm}

procedure TfCheques.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
end;

end.
