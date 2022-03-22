unit ufCadVisualizaNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls;

type
  TfCadVisualizaNF = class(TfCadastro)
    GroupBox3: TGroupBox;
    DBImage1: TDBImage;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadVisualizaNF: TfCadVisualizaNF;

implementation

uses udmPatrimonio;

{$R *.dfm}

procedure TfCadVisualizaNF.btnOKClick(Sender: TObject);
begin
//  inherited;
  Self.Close;
end;

initialization
  fCadVisualizaNF := TfCadVisualizaNF.Create(nil);
finalization
  FreeAndNil(fCadVisualizaNF);

end.
