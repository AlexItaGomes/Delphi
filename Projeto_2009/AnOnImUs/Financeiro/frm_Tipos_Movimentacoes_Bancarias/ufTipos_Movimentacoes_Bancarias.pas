unit ufTipos_Movimentacoes_Bancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfTipos_Movimentacoes_Bancarias = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTipos_Movimentacoes_Bancarias: TfTipos_Movimentacoes_Bancarias;

implementation

uses udmTipo_Movimentacoes_Bancarias, ufCad_Tipos_Movimentacoes_Bancarias;

{$R *.dfm}

procedure TfTipos_Movimentacoes_Bancarias.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral := dmTipos_Movimentacoes_Bancarias.cdsTipos_Movimentacoes;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro := fCad_Tipos_Movimentacoes_Bancarias;
  with fCad_Tipos_Movimentacoes_Bancarias do begin
    cdsLocal   := dmTipos_Movimentacoes_Bancarias.cdsTipos_Movimentacoes;
    funcLocal  := Self.funcBasico;
  end;
end;

procedure TfTipos_Movimentacoes_Bancarias.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfTipos_Movimentacoes_Bancarias.OpenClientDataSet;
begin
  with dmTipos_Movimentacoes_Bancarias do begin
    with cdsTipos_Movimentacoes do begin
      Close;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfTipos_Movimentacoes_Bancarias);
finalization
  UnRegisterClass(TfTipos_Movimentacoes_Bancarias);

end.
