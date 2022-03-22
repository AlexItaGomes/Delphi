unit ufHelp;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Graphics,
  Vcl.ExtCtrls, System.Classes, Funcoes, Vcl.Imaging.jpeg;

type
  TfHelp = class(TForm)
    lbTitulo: TLabel;
    mmMSG: TMemo;
    Bevel1: TBevel;
    btnOK: TSpeedButton;
    Image1: TImage;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    funcLocal : TFuncoes;
  public
    intPos : Integer;
  end;

var
  fHelp: TfHelp;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfHelp.btnOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfHelp.FormCreate(Sender: TObject);
begin
  funcLocal := TFuncoes.Create(nil);
end;

procedure TfHelp.FormShow(Sender: TObject);
begin
  case intPos of
    1 : begin
      lbTitulo.Caption  := 'Previsão de Lançamentos';
      mmMSG.Text        := 'Este gráfico demonstra para você os lançamentos futuros, previstos para o mês corrente ou para o próximo mês. '+
                           'O gráfico trás: Informações sobre quais os recebimentos/pagamentos do dia anterior o que realmente foi concretizado, '+
                           'como também, lançamentos do dia corrente é do próximo dia, além de trazer o totalizador do mês e a previsão do próximo mês.';
    end;
    2 : begin
      lbTitulo.Caption  := 'Projeção Financeira';
      mmMSG.Text        := 'Baseado no que já foi lançado e no que esta previsto, o sistema traça um gráfico de sua situação financeira para os próximos meses.';
    end;
    3 : begin
      lbTitulo.Caption  := 'Painel de Informações';
      mmMSG.Text        := 'Painel de informações sobre a sua situação financeira, as informações apresentadas são: Previsão de Crescimento para o ano, percentual sobre sua renda atingido, '+
                           'media de gastos por dia, saldo bancário, saldo em caixa, informação sobre um saldo bancário em negativo, informativo sobre contas a pagar e a receber em aberto pendente de baixa.';
    end;
  end;
end;

initialization
  fHelp := TfHelp.Create(nil);
finalization
  FreeAndNil(fHelp);

end.
