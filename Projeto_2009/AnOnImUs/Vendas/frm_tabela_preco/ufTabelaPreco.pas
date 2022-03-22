unit ufTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Menus, frxClass, frxDBSet, frxDesgn;

type
  TfTabelaPreco = class(TfBasico)
    grdItens: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure grdItensTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTabelaPreco: TfTabelaPreco;

implementation

uses udmTabela_Preco, ufCadTabela_Preco, ufCadReplicaTabela;

{$R *.dfm}

procedure TfTabelaPreco.btnLocalizarClick(Sender: TObject);
begin
  try
    fCadReplicaTabela := TfCadReplicaTabela.Create(nil);
    fCadReplicaTabela.ShowModal;
  finally
    OpenClientDataSet(1);
    FreeAndNil(fCadReplicaTabela);
  end;
end;

procedure TfTabelaPreco.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmTabelaPreco.boolAlter := True;
  OpenClientDataSet(1);
end;

procedure TfTabelaPreco.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmTabelaPreco.cdsTabelaPreco;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCadTabelaPreco;
  with fCadTabelaPreco do begin
    cdsLocal        := dmTabelaPreco.cdsTabelaPreco;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag   := 461;
end;

procedure TfTabelaPreco.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfTabelaPreco.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('TPRC_ATIVO') then begin
    if cdsGeral.FieldByName('TPRC_ATIVO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Ativo          ');
    end;
    if cdsGeral.FieldByName('TPRC_ATIVO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Inativo        ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
end;

procedure TfTabelaPreco.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(grdItens.DataSource.DataSet.RecNo) then begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdItens.Canvas.Font.Color  := clBlack;
      grdItens.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdItens.Canvas.Brush.Color := clSilver;
      grdItens.Canvas.Font.Style  := [fsBold];
    end;
     grdItens.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfTabelaPreco.grdItensTitleClick(Column: TColumn);
begin
  inherited;
  try
    dmTabelaPreco.cdsItensTabelaPreco.IndexFieldNames := Column.Field.FieldName;
  except
  end;
end;

procedure TfTabelaPreco.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTabelaPreco do begin
    case intPos of
      1 : begin
        with cdsTabelaPreco do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsPesqProd do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfTabelaPreco);
finalization
  UnRegisterClass(TfTabelaPreco);

end.
