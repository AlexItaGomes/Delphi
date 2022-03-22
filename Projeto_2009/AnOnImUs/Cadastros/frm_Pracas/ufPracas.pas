unit ufPracas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfPracas = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPracas: TfPracas;

implementation

uses udmPracas, ufCad_Pracas;

{$R *.dfm}

procedure TfPracas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmPracas.cdsPracas;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Pracas;
  with fCad_Pracas do begin
    cdsLocal     := dmPracas.cdsPracas;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfPracas.OpenClientDataSet;
begin
  with dmPracas do begin
    with cdsPracas do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfPracas);
finalization
  UnRegisterClass(TfPracas);

end.
