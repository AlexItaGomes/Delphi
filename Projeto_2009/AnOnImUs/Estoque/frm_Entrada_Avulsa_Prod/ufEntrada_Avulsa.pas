unit ufEntrada_Avulsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  SQLExpr, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfEntradaAvulsa = class(TfBasico)
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenClientDataSet(intTipo : Integer = 99);
    function EstornaRegistro(strEnav_ID: String; intPos: Integer = 1) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEntradaAvulsa: TfEntradaAvulsa;

implementation

uses udmEntrada_Avulsa, ufCad_Entrada_Avulsa;

{$R *.dfm}

procedure TfEntradaAvulsa.btnNovoClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then begin
    inherited;
  end else begin
    if cdsGeral.FieldByName('ENAV_CONCILIADO').AsInteger <> 2 then begin
      if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                           'Deseja realizar o cancelamento do registro selecionado?'+#13+#13+
                           'Obs.: O(s) produto(s) informado(s) terá(ão) seu estoque estornado também.',1,true) = 6 then begin
        if not EstornaRegistro(cdsGeral.FieldByName('ENAV_ID').AsString,cdsGeral.FieldByName('ENAV_CONCILIADO').AsInteger) then begin
          funcBasico.Alerta('Não foi possível concluir o processo de cancelamento do '+
                            'registro informado, você não possui estoque suficiente '+
                            'para o estorno de todos os produtos informado.',1);
        end;
      end;
    end else begin
      funcBasico.Alerta('Registro já cancelado!',1);
    end;
  end;
  OpenClientDataSet(1);
end;

{*******************************************************************************
Data:       23/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para a realização do cancelamento e estorno dos produtos lan-
            çados na entrada avulsa de produtos.

Parametros:
  strENAV_ID  = ID do registro principal
  intPos      = Posição em que se encontra o registro
              1 - Conciliado, retorna para a posição   = 0 - Não Conciliado
              0 - Não Conciliado, passa para a posição = 2 - Cancelado
              2 - Não há movimentação.
*******************************************************************************}
function TfEntradaAvulsa.EstornaRegistro(strEnav_ID : String; intPos : Integer = 1) : Boolean;

procedure CancelaRegistro(strENAV_ID : String; intPos : Integer);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        try
          funcBasico.StartCommit;
        except
        end;
        sql.Add('UPDATE ENTRADA_AVULSA');
        case intPos of
          0 : sql.Add('SET    ENAV_CONCILIADO = 2');
          1 : sql.Add('SET    ENAV_CONCILIADO = 0');
        end;
        sql.Add('WHERE  ENAV_ID         = ' + strENAV_ID);
        sql.Add('AND    ENAV_EMPR_ID    = ' + IntToStr(funcBasico.Empr_ID));
        ExecSQL;
        try
          funcBasico.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'CancelaRegistro',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  Result := true;
  try
    funcBasico.MSGAguarde();
    try
      case intPos of
        0 : begin
          CancelaRegistro(strEnav_ID,intPos);
        end;
        1 : begin
          with dmEntradaAvulsa do begin
            with cdsItensEntradaAvulsa do begin
              Close;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('ENAV_ID').AsString  := strEnav_ID;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Open;
              First;
              DisableControls;
              while not Eof do begin
                if not funcLocal.ProdutoTemEstoque(cdsItensEntradaAvulsaENIT_PROD_ID.AsString,cdsItensEntradaAvulsaENIT_QTDE.AsFloat,3) then begin
                  Result := false;
                  Exit;
                end;
                Next;
              end;
              First;
              while not Eof do begin
                funcLocal.MovimentaEstoque(cdsItensEntradaAvulsaENIT_PROD_ID.AsString,(cdsItensEntradaAvulsaENIT_QTDE.AsFloat * -1));
                Next;
              end;
              EnableControls;
            end;
          end;
          CancelaRegistro(strEnav_ID,intPos);
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'EstornaRegistro',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfEntradaAvulsa.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmEntradaAvulsa.cdsEntradaAvulsa;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_EntradaAvulsa;
  with fCad_EntradaAvulsa do begin
    cdsLocal        := dmEntradaAvulsa.cdsEntradaAvulsa;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag   := 429;
end;

procedure TfEntradaAvulsa.OpenClientDataSet(intTipo : Integer = 99);
begin
  with dmEntradaAvulsa do begin
    case intTipo of
      1 : begin
        with cdsEntradaAvulsa do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

procedure TfEntradaAvulsa.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('ENAV_CONCILIADO') then begin
    if cdsGeral.FieldByName('ENAV_CONCILIADO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Não Conciliado   ');
    end;
    if cdsGeral.FieldByName('ENAV_CONCILIADO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Conciliado       ');
    end;
    if cdsGeral.FieldByName('ENAV_CONCILIADO').AsInteger = 2 then begin
      grdBasico.Canvas.Brush.Color := clGray;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Cancelado        ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.         ');
    end;
  end;
end;

initialization
  RegisterClass(TfEntradaAvulsa);
finalization
  UnRegisterClass(TfEntradaAvulsa);

end.
