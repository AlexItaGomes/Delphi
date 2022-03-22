
unit ufTermo_Retirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus;

type
  TfTermo_Retirada = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTermo_Retirada: TfTermo_Retirada;

implementation

uses udmTermo_Retirada, ufCad_Termo_Retirada;

{$R *.dfm}

procedure TfTermo_Retirada.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmTermo_Retirada.cdsTermosRetirada;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_Termo_Retirada;
  with fCad_Termo_Retirada do begin
    cdsLocal        := dmTermo_Retirada.cdsTermosRetirada;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag   := 0;
end;

procedure TfTermo_Retirada.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled     := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                         funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                         funcBasico.GetLicenca(5);
  btnEditar.Enabled   := btnNovo.Enabled;
end;

procedure TfTermo_Retirada.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTermo_Retirada do begin
    case intPos of
      1 : begin
        with cdsTermosRetirada do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfTermo_Retirada);
finalization
  UnRegisterClass(TfTermo_Retirada);

end.
