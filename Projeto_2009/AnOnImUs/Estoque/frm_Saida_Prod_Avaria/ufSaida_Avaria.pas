unit ufSaida_Avaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  SQLExpr, Menus;

type
  TfSaida_Avaria = class(TfBasico)
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure OpenClientDataSet(intPos: Integer = 99);
    function EstornaRegistro(strSIAV_ID: String; intPos: Integer = 1): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSaida_Avaria: TfSaida_Avaria;

implementation

uses udmSaida_Avaria, ufCad_Saida_Avaria;

{$R *.dfm}

procedure TfSaida_Avaria.btnNovoClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then begin
    inherited;
  end else begin
    if cdsGeral.FieldByName('SIAV_CONCILIADO').AsInteger <> 2 then begin
      if funcBasico.Alerta('A T E N � � O ! ! !'+#13+#13+
                           'Deseja realizar o cancelamento do registro selecionado?'+#13+#13+
                           'Obs.: O(s) produto(s) informado(s) ter�(�o) seu estoque estornado tamb�m.',1,true) = 6 then begin
        if not EstornaRegistro(cdsGeral.FieldByName('SIAV_ID').AsString,cdsGeral.FieldByName('SIAV_CONCILIADO').AsInteger) then begin
          funcBasico.Alerta('N�o foi poss�vel conclu�r o processo de cancelamento do '+
                            'registro informado.',1);
        end;
      end;
    end else begin
      funcBasico.Alerta('Registro j� cancelado!',1);
    end;
  end;
  OpenClientDataSet(1);
end;

{*******************************************************************************
Data:       30/03/2010
Autor:      Alex Itamar Gomes
Descri��o:  Metodo para a realiza��o do cancelamento e estorno dos produtos lan-
            �ados na saida por avaria de produtos.

Parametros:
  strENAV_ID  = ID do registro principal
  intPos      = Posi��o em que se encontra o registro
              1 - Conciliado, retorna para a posi��o   = 0 - N�o Conciliado
              0 - N�o Conciliado, passa para a posi��o = 2 - Cancelado
              2 - N�o h� movimenta��o.
*******************************************************************************}
function TfSaida_Avaria.EstornaRegistro(strSIAV_ID : String; intPos : Integer = 1) : Boolean;

{$REGION 'CancelaRegistro'}
  procedure CancelaRegistro(strSIAV_ID : String; intPos : Integer);
  var
    qryCons : TSQLQuery;
  begin
    if strSIAV_ID = '' then begin
      Result := false;
      Exit;
    end;
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
          sql.Add('UPDATE SAIDA_AVARIA');
          case intPos of
            0 : sql.Add('SET    SIAV_CONCILIADO = 2');
            1 : sql.Add('SET    SIAV_CONCILIADO = 0');
          end;
          sql.Add('WHERE  SIAV_ID         = ' + strSIAV_ID);
          sql.Add('AND    SIAV_EMPR_ID    = ' + IntToStr(funcBasico.Empr_ID));
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
{$ENDREGION}

begin
  try
    funcBasico.MSGAguarde();
    try
      Result := true;
      case intPos of
        0 : begin
          CancelaRegistro(strSIAV_ID,intPos);
        end;
        1 : begin
          with dmSaida_Avaria do begin
            with cdsItensSaidaAvaria do begin
              Close;
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Params.ParamByName('SIAV_ID').AsInteger := StrToInt(strSIAV_ID);
              Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
              Open;
              First;
              while not Eof do begin
                funcLocal.MovimentaEstoque(cdsItensSaidaAvariaSIIT_PROD_ID.AsString,cdsItensSaidaAvariaSIIT_QTDE.AsFloat,1,'3');
                Next;
              end;
              EnableControls;
            end;
          end;
          CancelaRegistro(strSIAV_ID,intPos);
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

procedure TfSaida_Avaria.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmSaida_Avaria.cdsSaidaAvaria;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_Saida_Avaria;
  with fCad_Saida_Avaria do begin
    cdsLocal        := dmSaida_Avaria.cdsSaidaAvaria;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag   := 431;
end;

procedure TfSaida_Avaria.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('SIAV_CONCILIADO') then begin
    if cdsGeral.FieldByName('SIAV_CONCILIADO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'N�o Conciliado   ');
    end;
    if cdsGeral.FieldByName('SIAV_CONCILIADO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Conciliado       ');
    end;
    if cdsGeral.FieldByName('SIAV_CONCILIADO').AsInteger = 2 then begin
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

procedure TfSaida_Avaria.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmSaida_Avaria do begin
    case intPos of
      1 : begin
        with cdsSaidaAvaria do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfSaida_Avaria);
finalization
  UnRegisterClass(TfSaida_Avaria);

end.
