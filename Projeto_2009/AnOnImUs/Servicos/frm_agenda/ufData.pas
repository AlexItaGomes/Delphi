unit ufData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, RxToolEdit, SQLExpr, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Datasnap.DBClient, uFrPesqIndividual;

type
  TfData = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    cdsAgenda: TClientDataSet;
    GroupBox1: TGroupBox;
    grdBasico: TDBGrid;
    dsGrid: TDataSource;
    frPesqAtendente: TfrPesqIndividual;
    edtData: TDateEdit;
    edtHorario: TMaskEdit;
    lbDomingo: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDataChange(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
  private
    FAtendente  : Integer;
    sltHrAlmoco : TStringList;
    sltHorarios : TStringList;
    sltStatus   : TStringList;
    function  DataHoraLivre: Boolean;
    procedure CriarClientDataSet(sTipo : String = 'I');
    procedure MontaHorarios;
    procedure OpenClientDataSet(sTipo : String = 'I');
    { Private declarations }
  public
    property  Atendente : Integer      read FAtendente   write FAtendente;
  end;

var
  fData: TfData;

implementation

{$R *.dfm}

uses udmAgenda;

procedure TfData.btnCancelarClick(Sender: TObject);
begin
  edtData.Date := 0;
  Self.Close;
end;

procedure TfData.btnOKClick(Sender: TObject);
var
  strAtendente,
  strHr        : String;
begin
  strAtendente := IntToStr( funcLocal.BuscarAtendente(UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption)) );
  strHr        := cdsAgenda.FieldByName('HORARIO').AsString;

  if strAtendente<>'0' then begin
    frPesqAtendente.BuscarRegistro(strAtendente);
    edtHorario.Text := strHr;
  end;
  if (edtData.Date<=0) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Informe uma data válida antes de continuar!',0);
    Exit;
  end;
  if (Length(Trim(edtHorario.Text))<>5) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Necessário informar um horário válido',0);
    Exit;
  end;
  if DayOfWeek(edtData.Date)=1 then begin
    if funcLocal.Alerta('C O N F I R M A Ç Ã O ! ! !'+#13+#13+'A Data selecionada dará em um Domingo!'+#13+#13+'Deseja seleciona-la assim mesmo?',1,true)<>6 then
      Exit;
  end;
  if not frPesqAtendente.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Informe um profissional antes de continuar!',0);
    Exit;
  end;
  if not DataHoraLivre() then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Data/Horário não disponível, selecione outra Data/Hora antes de continuar!',0);
    Exit;
  end;

  Self.Close;
end;

function TfData.DataHoraLivre() : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*) AS QTDE');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_EMPR_ID           = :EMPR_ID');
      sql.Add('   AND AGEN_DATA              = :DATA');
      sql.Add('   AND AGEN_HORA              = :HORA');
      sql.Add('   AND AGEN_USER_ID_ATENDENTE = :USER_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Params.ParamByName('DATA').AsDate       := edtData.Date;
      Params.ParamByName('HORA').AsString     := edtHorario.Text;
      Params.ParamByName('USER_ID').AsString  := frPesqAtendente.InGrid();
      Open;
      Result := Fields[0].AsInteger = 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfData.edtDataChange(Sender: TObject);
begin
  inherited;
  CriarClientDataSet();
  lbDomingo.Visible := false;
  if DayOfWeek(edtData.Date)=1 then begin
    lbDomingo.Visible := true;
  end;
end;

procedure TfData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(sltHrAlmoco);
  FreeAndNil(sltHorarios);
  FreeAndNil(sltStatus);
  inherited;
end;

procedure TfData.FormCreate(Sender: TObject);
begin
  inherited;
  sltHrAlmoco := TStringList.Create;
  sltHorarios := TStringList.Create;
  sltStatus   := TStringList.Create;
end;

procedure TfData.FormShow(Sender: TObject);
begin
  inherited;
  frPesqAtendente.BuscarRegistro(IntToStr(Atendente));
end;

procedure TfData.CriarClientDataSet(sTipo : String = 'I');
var
  cdsFilder      : TField;
  qryCons        : TSQLQuery;
  BookMarkString : TBookMark;
begin
  try
    funcLocal.MSGAguarde();
    BookMarkString := cdsAgenda.GetBookmark;
    cdsAgenda.Close;
    cdsAgenda.Fields.Clear;
    cdsAgenda.FieldDefs.Clear;

    cdsFilder := TStringField.Create(Self);
    cdsFilder.FieldName     := 'HORARIO';
    cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
    cdsFilder.Index         := cdsAgenda.FieldCount;
    cdsFilder.DataSet       := cdsAgenda;
    cdsFilder.DisplayLabel  := 'Horário';
    cdsFilder.DisplayWidth  := 10;

    if sTipo = 'S' then begin
      cdsFilder               := TStringField.Create(Self);
      cdsFilder.FieldName     := 'DATA';
      cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
      cdsFilder.Index         := cdsAgenda.FieldCount;
      cdsFilder.DataSet       := cdsAgenda;
      cdsFilder.DisplayLabel  := 'Data';
      cdsFilder.DisplayWidth  := 10;
    end;

    try
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcLocal.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT DISTINCT');
        sql.Add('       USER_NOME_COMPLETO');
        sql.Add('  FROM USUARIO');
        sql.Add('  JOIN AGENDA');
        sql.Add('    ON USER_ID                       = AGEN_USER_ID_ATENDENTE');
        sql.Add(' WHERE AGEN_EMPR_ID                  = '+IntToStr(funcLocal.Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM AGEN_DATA) = '+FormatDateTime('MM',edtData.Date));
        sql.Add('   AND EXTRACT(YEAR  FROM AGEN_DATA) = '+FormatDateTime('YYYY',edtData.Date));
        sql.Add(' ORDER BY');
        sql.Add('       USER_NOME_COMPLETO');
        Open;
        First;
        while not Eof do begin
          cdsFilder               := TStringField.Create(Self);
          cdsFilder.FieldName     := funcLocal.RetiraEspaco(Fields[0].AsString);
          cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
          cdsFilder.Index         := cdsAgenda.FieldCount;
          cdsFilder.DataSet       := cdsAgenda;
          cdsFilder.DisplayLabel  := funcLocal.TratarNome(Fields[0].AsString);
          cdsFilder.DisplayWidth  := 37;
          cdsFilder.Size          := 250;
          Next;
        end;
      end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;

    cdsFilder := TStringField.Create(Self);
    cdsFilder.FieldName     := 'AGEN_AGEN_ID';
    cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
    cdsFilder.Index         := cdsAgenda.FieldCount;
    cdsFilder.DataSet       := cdsAgenda;
    cdsFilder.DisplayLabel  := 'Agenda';
    cdsFilder.DisplayWidth  := 10;
    cdsFilder.Visible       := false;

    cdsAgenda.CreateDataSet;
    cdsAgenda.Open;

    MontaHorarios();
    OpenClientDataSet(sTipo);
  finally
    cdsAgenda.Bookmark := BookMarkString;
    funcLocal.MSGAguarde(false);
  end;
end;

procedure TfData.OpenClientDataSet(sTipo : String = 'I');
var
  dtDataI,
  dtDataF : TDateTime;
  intI    : Integer;
  qryCons : TSQLQuery;
begin
  if sTipo = 'I' then begin
    dtDataI := edtData.Date;
    dtDataF := edtData.Date;
  end else begin
    dtDataI := funcLocal.RetornaInicioSemana(edtData.Date);
    dtDataF := funcLocal.RetornaFimSemana(edtData.Date);
  end;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    qryCons.Close;
    qryCons.SQL.Clear;
    qryCons.sql.Add('SELECT                                                                           '+
                    '       AGEN.AGEN_ID,                                                             '+
                    '       AGEN.AGEN_EMPR_ID,                                                        '+
                    '       AGEN.AGEN_CLIE_ID,                                                        '+
                    '       AGEN.AGEN_CLIE_EMPR_ID,                                                   '+
                    '       AGEN.AGEN_USER_ID_ATENDENTE,                                              '+
                    '       AGEN.AGEN_TPRC_ID,                                                        '+
                    '       AGEN.AGEN_TPRC_EMPR_ID,                                                   '+
                    '       AGEN.AGEN_HORA,                                                           '+
                    '       AGEN.AGEN_DATA,                                                           '+
                    '       AGEN.AGEN_OBS,                                                            '+
                    '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN AGEN.AGEN_STATUS       '+
                    '            ELSE ''Z''                                                           '+
                    '       END                                  AS AGEN_STATUS,                      '+
                    '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN AGEN.AGEN_CLIENTE      '+
                    '            ELSE ''Hr. Reserv. Proced.''                                         '+
                    '       END                                  AS AGEN_CLIENTE,                     '+
                    '       COALESCE(CASE CLIE.CLIE_TELEFONE1                                         '+
                    '                     WHEN ''(00)00000-0000'' THEN NULL                           '+
                    '                     ELSE CLIE.CLIE_TELEFONE1                                    '+
                    '                END,AGEN.AGEN_TELEFONE) AS AGEN_TELEFONE,                        '+
                    '       AGEN.AGEN_CLIE_ID_INDICACAO,                                              '+
                    '       AGEN.AGEN_CLIE_EMPR_ID_INDICACAO,                                         '+
                    '       AGEN.AGEN_FOTO_ANT,                                                       '+
                    '       AGEN.AGEN_FOTO_DEP,                                                       '+
                    '       AGEN.AGEN_VLR_TOTAL,                                                      '+
                    '       AGEN.AGEN_VLR_DESCONTO,                                                   '+
                    '       AGEN.AGEN_VLR_PAGO,                                                       '+
                    '       COALESCE(AGEN.AGEN_ORDS_ID,-1) AS AGEN_ORDS_ID,                           '+
                    '       AGEN.AGEN_ORDS_EMPR_ID,                                                   '+
                    '       AGEN.AGEN_EXT_HORARIO,                                                    '+
                    '       COALESCE(AGEN.AGEN_AGEN_ID,-1) AS AGEN_AGEN_ID,                           '+
                    '       AGEN.AGEN_AGEN_EMPR_ID,                                                   '+
                    '       AGEN.AGEN_BLOQUEAR_HORARIO,                                               '+
                    '       AGEN.AGEN_BAIXA_ESTOQUE,                                                  '+
                    '       AGEN.AGEN_FECHOU_FINANCEIRO,                                              '+
                    '       AGEN.AGEN_PIGMENTO_COR,                                                   '+
                    '       AGEN.AGEN_PIGMENTO_MARCA,                                                 '+
                    '       AGEN.AGEN_PIGMENTO_LOTE,                                                  '+
                    '       AGEN.AGEN_DTA_CADASTRO,                                                   '+
                    '       AGEN.AGEN_USER_ID,                                                        '+
                    '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN CLIE.CLIE_RAZAO_SOCIAL '+
                    '            ELSE ''Hr. Reserv. Proced.''                                         '+
                    '       END                    AS CLIE_RAZAO_SOCIAL,                              '+
                    '       CASE WHEN COALESCE(AGEN.AGEN_AGEN_ID,-1) = -1 THEN CLIE.CLIE_FANTASIA     '+
                    '            ELSE ''Hr. Reserv. Proced.''                                         '+
                    '       END                    AS CLIE_FANTASIA,                                  '+
                    '       CLIE.CLIE_CEP,                                                            '+
                    '       CLIE.CLIE_ENDERECO,                                                       '+
                    '       CLIE.CLIE_BAIRRO,                                                         '+
                    '       CLIE.CLIE_TELEFONE1,                                                      '+
                    '       CLIN.CLIE_RAZAO_SOCIAL AS RAZAO_INDICACAO,                                '+
                    '       CLIN.CLIE_FANTASIA     AS FANTASIA_INDICACAO,                             '+
                    '       USUA.USER_NOME_COMPLETO,                                                  '+
                    '       TPRC.TPRC_DESCRICAO                                                       '+
                    '  FROM AGENDA            AGEN                                                    '+
                    '  JOIN CLIENTES          CLIE                                                    '+
                    '    ON CLIE.CLIE_ID      = AGEN.AGEN_CLIE_ID                                     '+
                    '   AND CLIE.CLIE_EMPR_ID = AGEN.AGEN_CLIE_EMPR_ID                                '+
                    '  LEFT JOIN CLIENTES          CLIN                                               '+
                    '    ON CLIN.CLIE_ID      = AGEN.AGEN_CLIE_ID_INDICACAO                           '+
                    '   AND CLIN.CLIE_EMPR_ID = AGEN.AGEN_CLIE_EMPR_ID_INDICACAO                      '+
                    '  JOIN USUARIO           USUA                                                    '+
                    '    ON USUA.USER_ID      = AGEN.AGEN_USER_ID_ATENDENTE                           '+
                    '  JOIN TABELA_PRECO      TPRC                                                    '+
                    '    ON TPRC.TPRC_ID      = AGEN.AGEN_TPRC_ID                                     '+
                    '   AND TPRC.TPRC_EMPR_ID = AGEN.AGEN_TPRC_EMPR_ID                                '+
                    ' WHERE AGEN.AGEN_EMPR_ID = '+IntToStr(funcLocal.Empr_ID)                          +
                    '   AND AGEN.AGEN_DATA   >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataI))      +
                    '   AND AGEN.AGEN_DATA   <= '+QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataF))      );
    qryCons.Open;
    qryCons.First;
    sltHorarios.Clear; sltStatus.Clear;
    while not qryCons.Eof do begin
      if Self.cdsAgenda.Locate('HORARIO',qryCons.FieldByName('AGEN_HORA').AsString,[]) then begin
        Self.cdsAgenda.Edit;
        if sTipo = 'S' then
          Self.cdsAgenda.FieldByName('DATA').AsString := qryCons.FieldByName('AGEN_DATA').AsString;
        Self.cdsAgenda.FieldByName(funcLocal.RetiraEspaco(qryCons.FieldByName('USER_NOME_COMPLETO').AsString)).AsString :=
          Trim(funcLocal.Se(qryCons.FieldByName('AGEN_AGEN_ID').AsInteger=-1,
               funcLocal.Se(qryCons.FieldByName('AGEN_CLIE_ID').AsInteger=funcLocal.ClientePadrao,
                            qryCons.FieldByName('AGEN_TELEFONE').AsString,
                            qryCons.FieldByName('CLIE_TELEFONE1').AsString),'') + ' - '+

          funcLocal.TratarNome(funcLocal.Se(qryCons.FieldByName('AGEN_CLIE_ID').AsInteger=funcLocal.ClientePadrao,
                                            qryCons.FieldByName('AGEN_CLIENTE').AsString,
                                            qryCons.FieldByName('CLIE_FANTASIA').AsString
                                             )
                               ));
        sltHorarios.Add(UpperCase(funcLocal.RetiraEspaco(qryCons.FieldByName('USER_NOME_COMPLETO').AsString)+';'+
                        qryCons.FieldByName('AGEN_HORA').AsString{+';'+
                        funcLocal.RetiraEspaco(funcLocal.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcLocal.ClientePadrao,
                                                dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                                dmAgenda.cdsAgendaCLIE_FANTASIA.AsString
                                                ))}));
        sltStatus.Add(UpperCase(funcLocal.RetiraEspaco(qryCons.FieldByName('USER_NOME_COMPLETO').AsString+';'+
                      qryCons.FieldByName('AGEN_HORA').AsString+';'+{
                      funcLocal.RetiraEspaco(funcLocal.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcLocal.ClientePadrao,
                                              dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                              dmAgenda.cdsAgendaCLIE_FANTASIA.AsString))+';'+}
                      qryCons.FieldByName('AGEN_STATUS').AsString)));
        Self.cdsAgenda.FieldByName('AGEN_AGEN_ID').AsString := qryCons.FieldByName('AGEN_AGEN_ID').AsString;
        Self.cdsAgenda.Post;
      end;
      qryCons.Next;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfData.MontaHorarios();
var
  strHr : String;
  intI,
  intH,
  intM   : Integer;
begin
  try
    cdsAgenda.DisableControls;
    strHr  := Copy(funcLocal.Hr_Inicio,1,5);
    intI   := StrToInt(Copy(funcLocal.Hr_Intervalo,4,2));

    cdsAgenda.Append;
    cdsAgenda.Fields[0].AsString := strHr;
    cdsAgenda.Post;

    while strHr <> Copy(funcLocal.Hr_Termino,1,5) do begin
      intH := StrToInt(Copy(strHr,1,2));
      intM := StrToInt(Copy(strHr,4,2));
      intM := intM + intI;

      if intM = 60 then begin
        inc(intH);
        intM := 0;
      end;

      strHr := FormatFloat('00',intH)+':'+FormatFloat('00',intM);

      cdsAgenda.Append;
      cdsAgenda.Fields[0].AsString := strHr;
      cdsAgenda.Post;
    end;
    strHr  := Copy(funcLocal.Hr_Almoco_Inicio,1,5); sltHrAlmoco.Clear;
    sltHrAlmoco.Add(strHr);
    while strHr <> Copy(funcLocal.Hr_Almoco_Fim,1,5) do begin
      intH := StrToInt(Copy(strHr,1,2));
      intM := StrToInt(Copy(strHr,4,2));
      intM := intM + intI;

      if intM = 60 then begin
        inc(intH);
        intM := 0;
      end;

      strHr := FormatFloat('00',intH)+':'+FormatFloat('00',intM);
      sltHrAlmoco.Add(strHr);
    end;
  finally
    cdsAgenda.First;
    cdsAgenda.EnableControls;
  end;
end;

procedure TfData.grdBasicoDblClick(Sender: TObject);
begin
  inherited;
  btnOK.Click;
end;

procedure TfData.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  StrTMP : String;
begin
  try
    If odd(grdBasico.DataSource.DataSet.RecNo) then begin
      grdBasico.Canvas.Font.Color  := clBlack;
      grdBasico.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      grdBasico.Canvas.Font.Color  := clBlack;
      grdBasico.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      grdBasico.Canvas.Brush.Color := clSilver;
      grdBasico.Canvas.Font.Style  := [fsBold];
    end;
     grdBasico.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if (sltHrAlmoco.IndexOf(cdsAgenda.FieldByName('HORARIO').AsString)>=0) and (Column.FieldName <> 'HORARIO') then begin
    grdBasico.Canvas.Brush.Color := clFuchsia;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Hr. Almoço');
    Exit;
  end;
  StrTMP := UpperCase(funcLocal.RetiraEspaco(Column.Field.FieldName+';'+cdsAgenda.FieldByName('HORARIO').AsString));
  try
    //Tecnico;Horario;Status
    if sltHorarios.IndexOf(StrTMP) >= 0 then begin
      if sltStatus.IndexOf(StrTMP+';'+'A') >= 0 then begin grdBasico.Canvas.Brush.Color := $00BFFFFE; Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'O') >= 0 then begin grdBasico.Canvas.Brush.Color := clYellow;  Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'F') >= 0 then begin grdBasico.Canvas.Brush.Color := clGreen;   Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'C') >= 0 then begin grdBasico.Canvas.Brush.Color := clSilver;  Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'B') >= 0 then begin grdBasico.Canvas.Brush.Color := clRed;     Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'Z') >= 0 then begin grdBasico.Canvas.Brush.Color := $00FFDFFF; Exit; end;
      if sltStatus.IndexOf(StrTMP+';'+'L') >= 0 then begin
        grdBasico.Canvas.Brush.Color := clBlack;
        grdBasico.Canvas.Font.Color := clWhite;
        Exit;
      end;
    end;
  finally
    grdBasico.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
