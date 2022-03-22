unit ufLanc_Auto_Contas_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfLanc_Auto_Contas_Pagar = class(TfBasico)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure OpenClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLanc_Auto_Contas_Pagar: TfLanc_Auto_Contas_Pagar;

implementation

uses udmLanc_Auto_Contas_Pagar, ufCad_Lanc_Auto_Contas_Pagar;

{$R *.dfm}

procedure TfLanc_Auto_Contas_Pagar.btnNovoClick(Sender: TObject);
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

procedure TfLanc_Auto_Contas_Pagar.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmLanc_Auto_Contas_Pagar.cdsContas_Pagar;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Lanc_Auto_Contas_Pagar;
  with fCad_Lanc_Auto_Contas_Pagar do begin
    cdsLocal     := dmLanc_Auto_Contas_Pagar.cdsContas_Pagar;
    funcLocal    := Self.funcBasico;
  end;
end;

procedure TfLanc_Auto_Contas_Pagar.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  btnNovo.Click;
end;

procedure TfLanc_Auto_Contas_Pagar.OpenClientDataSet;
begin
  with dmLanc_Auto_Contas_Pagar do begin
    with cdsContas_Pagar do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
    end;
  end;
end;

procedure TfLanc_Auto_Contas_Pagar.Timer1Timer(Sender: TObject);
begin
  btnFecharRotina.Click;
end;

initialization
  RegisterClass(TfLanc_Auto_Contas_Pagar);
finalization
  UnRegisterClass(TfLanc_Auto_Contas_Pagar);

end.
