unit ufRotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Menus, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls,
  Buttons, frxClass, frxDBSet, frxDesgn;

type
  TfRotas = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRotas: TfRotas;

implementation

uses udmRotas, ufCadRotas;

{$R *.dfm}

procedure TfRotas.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmRotas.cdsRotas;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadRota;
  with fCadRota do begin
    cdsLocal     := dmRotas.cdsRotas;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfRotas.OpenClientDataSet;
begin
  with dmRotas do begin
    with cdsRotas do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfRotas);
finalization
  UnRegisterClass(TfRotas);

end.
