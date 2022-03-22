unit ufUnidadeMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfUnidadeMedida = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUnidadeMedida: TfUnidadeMedida;

implementation

uses udmUnidadeMedida, ufCadUnidadeMedida;

{$R *.dfm}

procedure TfUnidadeMedida.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmUnidadeMedida.cdsUnidadeMedida;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadUnidadeMedida;
  with fCadUnidadeMedida do begin
    cdsLocal     := dmUnidadeMedida.cdsUnidadeMedida;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfUnidadeMedida.OpenClientDataSet();
begin
  with dmUnidadeMedida.cdsUnidadeMedida do begin
    Close;
    Open;
  end;
end;

initialization
  RegisterClass(TfUnidadeMedida);
finalization
  UnRegisterClass(TfUnidadeMedida);

end.
