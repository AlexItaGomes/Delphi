unit ufLanc_Auto_Contas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfLanc_Auto_Contas_Receber = class(TfBasico)
    Panel1: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLanc_Auto_Contas_Receber: TfLanc_Auto_Contas_Receber;

implementation

uses udmLanc_Auto_Contas_Receber, ufCad_Lanc_Auto_Contas_Receber;

{$R *.dfm}

procedure TfLanc_Auto_Contas_Receber.btnNovoClick(Sender: TObject);
begin
  try
    {if not funcBasico.Privado then begin
      funcBasico.Alerta('I M P O R T A N T E ! ! !'+#13+#13+
                        'Opção não disponível a usuários FREE.',0);
      Exit;
    end;}
    inherited;
  finally
    Timer1.Enabled := true;
  end;
end;

procedure TfLanc_Auto_Contas_Receber.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmLanc_Auto_Contas_Receber.cdsContas_Receber;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Lanc_Auto_Contas_Receber;
  with fCad_Lanc_Auto_Contas_Receber do begin
    cdsLocal     := dmLanc_Auto_Contas_Receber.cdsContas_Receber;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfLanc_Auto_Contas_Receber.OpenClientDataSet;
begin
  with dmLanc_Auto_Contas_Receber do begin
    with cdsContas_Receber do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

procedure TfLanc_Auto_Contas_Receber.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  btnNovo.Click;
end;

procedure TfLanc_Auto_Contas_Receber.Timer1Timer(Sender: TObject);
begin
  btnFecharRotina.Click;
end;

initialization
  RegisterClass(TfLanc_Auto_Contas_Receber);
finalization
  UnRegisterClass(TfLanc_Auto_Contas_Receber);

end.
