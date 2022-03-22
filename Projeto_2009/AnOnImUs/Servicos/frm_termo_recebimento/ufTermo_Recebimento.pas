unit ufTermo_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus;

type
  TfTermo_Recebimento = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTermo_Recebimento: TfTermo_Recebimento;

implementation

uses udmTermo_Recebimento, ufCad_Termo_Recebimento;

{$R *.dfm}

procedure TfTermo_Recebimento.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmTermo_Recebimento.cdsTermosRecebimento;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_Termo_Recebimento;
  with fCad_Termo_Recebimento do begin
    cdsLocal        := dmTermo_Recebimento.cdsTermosRecebimento;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag   := 0;
end;

procedure TfTermo_Recebimento.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled     := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                         funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                         funcBasico.GetLicenca(5);
  btnEditar.Enabled   := btnNovo.Enabled;
end;

procedure TfTermo_Recebimento.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTermo_Recebimento do begin
    case intPos of
      1 : begin
        with cdsTermosRecebimento do begin
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
  RegisterClass(TfTermo_Recebimento);
finalization
  UnRegisterClass(TfTermo_Recebimento);

end.
