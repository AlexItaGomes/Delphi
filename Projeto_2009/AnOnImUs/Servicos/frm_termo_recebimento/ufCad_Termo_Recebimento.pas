unit ufCad_Termo_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, Grids, DBGrids;

type
  TfCad_Termo_Recebimento = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    edtItem: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    procedure btnOkClick(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet(intPos: Integer = 99);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Termo_Recebimento: TfCad_Termo_Recebimento;

implementation

uses udmTermo_Recebimento;

{$R *.dfm}

procedure TfCad_Termo_Recebimento.btnAdicClick(Sender: TObject);
begin
  inherited;
  if edtItem.Text <> '' then begin
    with dmTermo_Recebimento,cdsItensTermosRecebimento do begin
      Post;
      Append;
      edtItem.SetFocus;
    end;
  end;
end;

procedure TfCad_Termo_Recebimento.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    dmTermo_Recebimento.cdsItensTermosRecebimento.ApplyUpdates(-1);
    OpenClientDataSet(1);
    edtDescricao.SetFocus;
  end;
end;

procedure TfCad_Termo_Recebimento.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTermo_Recebimento do begin
    case intPos of
      1 : begin
        with cdsItensTermosRecebimento do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger      := funcLocal.Empr_ID;
          Params.ParamByName('GENE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('GENE_ID').AsInteger      := cdsTermosRecebimentoGENE_ID.AsInteger;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

procedure TfCad_Termo_Recebimento.btnRetClick(Sender: TObject);
begin
  inherited;
  if not dmTermo_Recebimento.cdsItensTermosRecebimento.IsEmpty then begin
    dmTermo_Recebimento.cdsItensTermosRecebimento.Delete;
    dmTermo_Recebimento.cdsItensTermosRecebimento.Append;
    edtItem.SetFocus;
  end;
end;

procedure TfCad_Termo_Recebimento.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  dmTermo_Recebimento.cdsItensTermosRecebimento.Cancel;
end;

procedure TfCad_Termo_Recebimento.FormShow(Sender: TObject);
begin
  OpenClientDataSet(1);
  inherited;
  dmTermo_Recebimento.cdsItensTermosRecebimento.Append;
  edtDescricao.SetFocus;
end;

function TfCad_Termo_Recebimento.ValidaDados : Boolean;
begin
  Result := true;
  dmTermo_Recebimento.cdsItensTermosRecebimento.Cancel;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe um título para o agrupamento do checklist antes de continuar.',0);
    Result := false;
    edtDescricao.SetFocus;
    Exit;
  end;
  if dmTermo_Recebimento.cdsItensTermosRecebimento.IsEmpty then begin
    funcLocal.Alerta('Agrupamento sem itens lançados, verifique o lançamento dos itens antes de continuar.',0);
    Result := false;
    edtItem.SetFocus;
    Exit;
  end;
end;

initialization
  if fCad_Termo_Recebimento = nil then
    fCad_Termo_Recebimento := TfCad_Termo_Recebimento.Create(nil);
finalization
  FreeAndNil(fCad_Termo_Recebimento);

end.
