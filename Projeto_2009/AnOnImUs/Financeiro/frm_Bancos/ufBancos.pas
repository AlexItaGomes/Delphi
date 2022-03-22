unit ufBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfBancos = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBancos: TfBancos;

implementation

uses udmBancos, ufCad_Bancos;

{$R *.dfm}

procedure TfBancos.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmBancos.cdsBancos;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Bancos;
  with fCad_Bancos do begin
    cdsLocal     := dmBancos.cdsBancos;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfBancos.OpenClientDataSet;
begin
  with dmBancos do begin
    with cdsBancos do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfBancos);
finalization
  UnRegisterClass(TfBancos);

end.
