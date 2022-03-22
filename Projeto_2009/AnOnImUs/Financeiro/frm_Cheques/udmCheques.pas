unit udmCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, udmBasico;

type
  TdmCheques = class(TdmBasico)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCheques: TdmCheques;

implementation

{$R *.dfm}

initialization
  dmCheques := TdmCheques.Create(nil);

finalization
  FreeAndNil(dmCheques);

end.
