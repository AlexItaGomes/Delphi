unit ufBaixaAutomatica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, RxToolEdit, RxCurrEdit, ComObj;

type
  TfBaixaAutomatica = class(TfCadastro)
    GroupBox1: TGroupBox;
    edtCaminho: TEdit;
    btnPesquisar: TSpeedButton;
    OpenDialog: TOpenDialog;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    cdsRegistros: TClientDataSet;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    cdsRegistrosTipo: TStringField;
    cdsRegistrosDataLacto: TDateField;
    cdsRegistrosvlrBruto: TFloatField;
    cdsRegistrosvlrLiquido: TFloatField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaixaAutomatica: TfBaixaAutomatica;

implementation

{$R *.dfm}

procedure TfBaixaAutomatica.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfBaixaAutomatica.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
    edtCaminho.Text := OpenDialog.FileName;
end;

procedure TfBaixaAutomatica.SpeedButton1Click(Sender: TObject);
var
  planilha, sheet: OleVariant;
  linha, coluna: Integer;
begin
  if Trim(edtCaminho.Text) = '' then begin
    funcLocal.Alerta('Necessário informar um arquivo para leitura antes de continuar!');
  end;
  if not FileExists(Trim(edtCaminho.Text)) then begin
    funcLocal.Alerta('Arquivo informado não encontrado!');
  end;
  try
    cdsRegistros.EmptyDataSet;

    planilha:= CreateOleObject('Excel.Application');
    planilha.WorkBooks.Open(Trim(edtCaminho.Text));

    sheet:= planilha.WorkSheets[1];

    linha := 0;
    coluna:= 1;

    showMessage(sheet.cells[linha, coluna]);


  finally
    planilha.WorkBooks.Close;
  end;
end;

initialization
  if fBaixaAutomatica = nil then
    fBaixaAutomatica := TfBaixaAutomatica.Create(nil);
finalization
  FreeAndNil(fBaixaAutomatica);

end.
