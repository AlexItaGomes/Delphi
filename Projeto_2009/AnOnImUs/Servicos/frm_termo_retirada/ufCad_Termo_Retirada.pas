unit ufCad_Termo_Retirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  rxToolEdit, RXDBCtrl, Mask, DBCtrls;

type
  TfCad_Termo_Retirada = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    GroupBox1: TGroupBox;
    edtItem: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet(intPos: Integer = 99);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Termo_Retirada: TfCad_Termo_Retirada;

implementation

uses udmTermo_Retirada;

{$R *.dfm}

procedure TfCad_Termo_Retirada.btnAdicClick(Sender: TObject);
begin
  inherited;
  if edtItem.Text <> '' then begin
    with dmTermo_Retirada,cdsItensTermosRetirada do begin
      Post;
      Append;
      edtItem.SetFocus;
    end;
  end;
end;

procedure TfCad_Termo_Retirada.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    dmTermo_Retirada.cdsItensTermosRetirada.ApplyUpdates(-1);
    OpenClientDataSet(1);
    edtDescricao.SetFocus;
  end;
end;

function TfCad_Termo_Retirada.ValidaDados : Boolean;
begin
  Result := true;
  dmTermo_Retirada.cdsItensTermosRetirada.Cancel;
  if edtDescricao.Text = '' then begin
    funcLocal.Alerta('Informe um título para o agrupamento do checklist antes de continuar.',0);
    Result := false;
    edtDescricao.SetFocus;
    Exit;
  end;
  if dmTermo_Retirada.cdsItensTermosRetirada.IsEmpty then begin
    funcLocal.Alerta('Agrupamento sem itens lançados, verifique o lançamento dos itens antes de continuar.',0);
    Result := false;
    edtItem.SetFocus;
    Exit;
  end;
end;

procedure TfCad_Termo_Retirada.btnRetClick(Sender: TObject);
begin
  inherited;
  if not dmTermo_Retirada.cdsItensTermosRetirada.IsEmpty then begin
    dmTermo_Retirada.cdsItensTermosRetirada.Delete;
    dmTermo_Retirada.cdsItensTermosRetirada.Append;
    edtItem.SetFocus;
  end;
end;

procedure TfCad_Termo_Retirada.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  dmTermo_Retirada.cdsItensTermosRetirada.Cancel;
end;

procedure TfCad_Termo_Retirada.FormShow(Sender: TObject);
begin
  OpenClientDataSet(1);
  inherited;
  dmTermo_Retirada.cdsItensTermosRetirada.Append;
  edtDescricao.SetFocus;
end;

procedure TfCad_Termo_Retirada.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTermo_Retirada do begin
    case intPos of
      1 : begin
        with cdsItensTermosRetirada do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger      := funcLocal.Empr_ID;
          Params.ParamByName('GENE_EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('GENE_ID').AsInteger      := cdsTermosRetiradaGENE_ID.AsInteger;
          Open;
        end;
      end
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

initialization
  if fCad_Termo_Retirada = nil then
    fCad_Termo_Retirada := TfCad_Termo_Retirada.Create(nil);
finalization
  FreeAndNil(fCad_Termo_Retirada);

end.
