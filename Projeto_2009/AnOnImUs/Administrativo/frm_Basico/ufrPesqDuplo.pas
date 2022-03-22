unit ufrPesqDuplo;

interface

uses
  Vcl.Forms, System.Classes, Vcl.Controls, uFrPesqIndividual, Funcoes;

type
  TfrPesqDuplo = class(TFrame)
    frPesqPrimeiro: TfrPesqIndividual;
    frPesqSegundo: TfrPesqIndividual;
    procedure frPesqPrimeirobtnPesquisarClick(Sender: TObject);
    procedure frPesqPrimeiroedtCodigoExit(Sender: TObject);
    procedure frPesqSegundobtnInserirClick(Sender: TObject);
    procedure frPesqSegundobtnPesquisarClick(Sender: TObject);
    procedure frPesqPrimeirobtnInserirClick(Sender: TObject);
    procedure frPesqPrimeiroedtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frPesqPrimeiroedtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    function getFuncLocal: TFuncoes;
    procedure setFuncLocal(const Value: TFuncoes);

  public
    FfuncLocal : TFuncoes;
    procedure Limpar;
    property  funcLocal : TFuncoes  read getFuncLocal write setFuncLocal;
  end;

implementation

{$R *.dfm}

procedure TfrPesqDuplo.frPesqPrimeirobtnInserirClick(Sender: TObject);
begin
  frPesqPrimeiro.btnInserirClick(Sender);
end;

procedure TfrPesqDuplo.frPesqPrimeirobtnPesquisarClick(Sender: TObject);
begin
  frPesqPrimeiro.btnPesquisarClick(Sender);
  frPesqSegundo.BuscarRegistro(frPesqPrimeiro.edtOpcao1.Text);
end;

procedure TfrPesqDuplo.frPesqPrimeiroedtCodigoExit(Sender: TObject);
begin
  frPesqPrimeiro.edtCodigoExit(Sender);
  frPesqSegundo.BuscarRegistro(frPesqPrimeiro.edtOpcao1.Text);
end;

procedure TfrPesqDuplo.frPesqPrimeiroedtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  frPesqPrimeiro.edtCodigoKeyDown(Sender, Key, Shift);
end;

procedure TfrPesqDuplo.frPesqPrimeiroedtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  frPesqPrimeiro.edtCodigoKeyPress(Sender, Key);
end;

procedure TfrPesqDuplo.frPesqSegundobtnInserirClick(Sender: TObject);
begin
  frPesqSegundo.btnInserirClick(Sender);
end;

procedure TfrPesqDuplo.frPesqSegundobtnPesquisarClick(Sender: TObject);
begin
  frPesqSegundo.btnPesquisarClick(Sender);
end;

function TfrPesqDuplo.getFuncLocal: TFuncoes;
begin
  Result := FfuncLocal;
end;

procedure TfrPesqDuplo.Limpar;
begin
  frPesqPrimeiro.Limpar;
  frPesqSegundo.Limpar;
end;

procedure TfrPesqDuplo.setFuncLocal(const Value: TFuncoes);
begin
  FfuncLocal := Value;
  frPesqPrimeiro.funcLocal := Value;
  frPesqSegundo.funcLocal  := Value;
  frPesqPrimeiro.ckPlanoContas.Checked := Value.FiltrarPlanoContasPAI;
  frPesqSegundo.ckPlanoContas.Checked  := Value.FiltrarPlanoContasPAI;
end;

end.
