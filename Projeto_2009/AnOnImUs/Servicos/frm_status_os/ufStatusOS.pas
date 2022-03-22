unit ufStatusOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfStatusOS = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStatusOS: TfStatusOS;

implementation

uses udmStatusOS, ufCadStatusOS;

{$R *.dfm}

procedure TfStatusOS.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmStatusOS.cdsStatusOS;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadStatusOS;
  with fCadStatusOS do begin
    cdsLocal     := dmStatusOS.cdsStatusOS;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfStatusOS.OpenClientDataSet;
begin
  with dmStatusOS do begin
    with cdsStatusOS do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
RegisterClass(TfStatusOS);
finalization
UnRegisterClass(TfStatusOS);

end.
