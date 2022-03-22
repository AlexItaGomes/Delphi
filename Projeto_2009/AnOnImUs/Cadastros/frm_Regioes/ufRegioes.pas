unit ufRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Menus, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls,
  Buttons, frxClass, frxDBSet, frxDesgn;

type
  TfRegioes = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRegioes: TfRegioes;

implementation

uses udmRegioes, ufCadRegioes;

{$R *.dfm}

procedure TfRegioes.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmRegioes.cdsRegioes;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadRegioes;
  with fCadRegioes do begin
    cdsLocal     := dmRegioes.cdsRegioes;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfRegioes.OpenClientDataSet;
begin
  with dmRegioes do begin
    with cdsRegioes do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfRegioes);
finalization
  UnRegisterClass(TfRegioes);

end.
