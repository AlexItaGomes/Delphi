unit ufCadCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, ufCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Controls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfCadCheques = class(TfCadastro)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadCheques: TfCadCheques;

implementation

{$R *.dfm}

initialization
  fCadCheques := TfCadCheques.Create(nil);

finalization
  FreeAndNil(fCadCheques);

end.
