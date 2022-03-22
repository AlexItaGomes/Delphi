unit ufBandeiraCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfBandeiraCartao = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBandeiraCartao: TfBandeiraCartao;

implementation

uses udmBandeiraCartao, ufCadBandeiraCartao;

{$R *.dfm}

procedure TfBandeiraCartao.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmBandeiraCartao.cdsBandeiras;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCadBandeiraCartao;
  with fCadBandeiraCartao do begin
    cdsLocal     := dmBandeiraCartao.cdsBandeiras;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfBandeiraCartao.OpenClientDataSet();
begin
  with dmBandeiraCartao.cdsBandeiras do begin
    Close;
    Open;
  end;
end;

initialization
  RegisterClass(TfBandeiraCartao);
finalization
  UnRegisterClass(TfBandeiraCartao);

end.
