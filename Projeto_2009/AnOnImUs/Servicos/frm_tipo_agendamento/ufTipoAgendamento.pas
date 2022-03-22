unit ufTipoAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfTipoAgendamento = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTipoAgendamento: TfTipoAgendamento;

implementation

uses uDmTipoAgendamento, ufCadTipoAgendamento;

{$R *.dfm}

procedure TfTipoAgendamento.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmTipoAgendamento.cdsTipoAgendamento;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadTipoAgendamento;
  with fCadTipoAgendamento do begin
    cdsLocal     := dmTipoAgendamento.cdsTipoAgendamento;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfTipoAgendamento.OpenClientDataSet();
begin
  with dmTipoAgendamento.cdsTipoAgendamento do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    Open;
  end;
end;

initialization
  RegisterClass(TfTipoAgendamento);

finalization
  UnRegisterClass(TfTipoAgendamento);

end.
