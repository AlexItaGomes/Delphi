unit ufConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Menus, ImgList, frxClass, frxDBSet, frxDesgn;

type
  TfConfiguracao = class(TfBasico)
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfiguracao: TfConfiguracao;

implementation

uses udmConfiguracao, ufCad_Configuracao;

{$R *.dfm}

procedure TfConfiguracao.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmConfiguracao.cdsConfiguracao;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro         := fCad_Configuracao;
  with fCad_Configuracao do begin
    cdsLocal        := dmConfiguracao.cdsConfiguracao;
    funcLocal       := Self.funcBasico;
  end;
end;

procedure TfConfiguracao.OpenClientDataSet;
begin
  with dmConfiguracao do begin
    with cdsConfiguracao do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfConfiguracao);

finalization
  UnRegisterClass(TfConfiguracao);

end.
