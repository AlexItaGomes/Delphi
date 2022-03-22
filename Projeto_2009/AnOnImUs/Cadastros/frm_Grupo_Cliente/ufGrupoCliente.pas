unit ufGrupoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Menus, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls,
  Buttons, frxClass, frxDesgn, frxDBSet;

type
  TfGrupoCliente = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupoCliente: TfGrupoCliente;

implementation

uses udmGrupoCliente, ufCadGrupoCliente;

{$R *.dfm}

procedure TfGrupoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmGrupoCliente.cdsGrupoCliente;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadGrupoCliente;
  with fCadGrupoCliente do begin
    cdsLocal     := dmGrupoCliente.cdsGrupoCliente;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfGrupoCliente.OpenClientDataSet;
begin
  with dmGrupoCliente do begin
    with cdsGrupoCliente do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfGrupoCliente);
finalization
  UnRegisterClass(TfGrupoCliente);

end.
