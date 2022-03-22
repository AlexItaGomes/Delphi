unit ufCadVendaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, uFrPesqIndividual,
  rxToolEdit, RXDBCtrl, Mask, DBCtrls, rxCurrEdit, Grids, DBGrids, DB;

type
  TfCadVendaOrcamento = class(TfCadastro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDtCadastro: TDateEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    frPesqIndividual1: TfrPesqIndividual;
    frPesqIndividual2: TfrPesqIndividual;
    frPesqIndividual3: TfrPesqIndividual;
    ckEntregaFutura: TCheckBox;
    edtDtEntFutura: TDateEdit;
    procedure FormShow(Sender: TObject);
    procedure ckEntregaFuturaClick(Sender: TObject);
  private
    FStatus : TDataSetState;
  public
    procedure BuscaPedido(strPEDV_ID : String);
    property Status : TDataSetState read FStatus write FStatus;
  end;

var
  fCadVendaOrcamento: TfCadVendaOrcamento;

implementation

uses udmVendaOrcamento, SqlExpr;

{$R *.dfm}

{ TfCadVendaOrcamento }

procedure TfCadVendaOrcamento.BuscaPedido(strPEDV_ID: String);
begin

end;

procedure TfCadVendaOrcamento.ckEntregaFuturaClick(Sender: TObject);
begin
  inherited;
  case ckEntregaFutura.Checked of
    True  : edtDtEntFutura.Enabled := true;
    False : begin
      edtDtEntFutura.Date    := 0;
      edtDtEntFutura.Enabled := false;
    end;
  end;
end;

procedure TfCadVendaOrcamento.FormShow(Sender: TObject);
begin
  inherited;
  case Status of
    dsInsert: begin

    end;
    dsEdit  : begin
    end;
  end;
end;

initialization
  if fCadVendaOrcamento = nil then
    fCadVendaOrcamento := TfCadVendaOrcamento.Create(nil);

finalization
  FreeAndNil(fCadVendaOrcamento);

end.
