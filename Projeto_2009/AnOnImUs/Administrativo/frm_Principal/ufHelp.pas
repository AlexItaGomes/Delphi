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
      lbTitulo.Caption  := 'Previs�o de Lan�amentos';
      mmMSG.Text        := 'Este gr�fico demonstra para voc� os lan�amentos futuros, previstos para o m�s corrente ou para o pr�ximo m�s. '+
                           'O gr�fico tr�s: Informa��es sobre quais os recebimentos/pagamentos do dia anterior o que realmente foi concretizado, '+
                           'como tamb�m, lan�amentos do dia corrente � do pr�ximo dia, al�m de trazer o totalizador do m�s e a previs�o do pr�ximo m�s.';
    end;
    2 : begin
      lbTitulo.Caption  := 'Proje��o Financeira';
      mmMSG.Text        := 'Baseado no que j� foi lan�ado e no que esta previsto, o sistema tra�a um gr�fico de sua situa��o financeira para os pr�ximos meses.';
    end;
    3 : begin
      lbTitulo.Caption  := 'Painel de Informa��es';
      mmMSG.Text        := 'Painel de informa��es sobre a sua situa��o financeira, as informa��es apresentadas s�o: Previs�o de Crescimento para o ano, percentual sobre sua renda atingido, '+
                           'media de gastos por dia, saldo banc�rio, saldo em caixa, informa��o sobre um saldo banc�rio em negativo, informativo sobre contas a pagar e a receber em aberto pendente de baixa.';
    end;
  end;
end;

initialization
  fHelp := TfHelp.Create(nil);
finalization
  FreeAndNil(fHelp);

end.
