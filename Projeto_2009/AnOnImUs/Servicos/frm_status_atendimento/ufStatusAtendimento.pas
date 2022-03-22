unit ufStatusAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDesgn, frxDBSet, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfStatusAtendimento = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStatusAtendimento: TfStatusAtendimento;

implementation

uses udmStatusAtendimento, ufCadStatusAtendimento;

{$R *.dfm}

procedure TfStatusAtendimento.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmStatusAtendimento.cdsStatusAtendimento;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadStatusAtendimento;
  with fCadStatusAtendimento do begin
    cdsLocal     := dmStatusAtendimento.cdsStatusAtendimento;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfStatusAtendimento.OpenClientDataSet;
begin
  with dmStatusAtendimento do begin
    with cdsStatusAtendimento do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfStatusAtendimento);
finalization
  UnRegisterClass(TfStatusAtendimento);

end.
