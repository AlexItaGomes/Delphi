unit ufAgenda;

interface

uses
  Vcl.Forms, frxClass, frxDBSet, frxDesgn, Vcl.Menus, Funcoes, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls,
  Vcl.Buttons, System.Classes, System.Types, DataSnap.DBClient, Data.SqlExpr,
  System.IniFiles, UrlMon, Dialogs, ufBasico, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Variants, sysutils, Vcl.ImgList, dateutils;

type
  TfAgenda = class(TfBasico)
    Panel1: TPanel;
    cdsAgenda: TClientDataSet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Panel2: TPanel;
    mmFinalizar: TMenuItem;
    Agenda: TTimer;
    BloquearHorario1: TMenuItem;
    Label3: TLabel;
    Shape2: TShape;
    Label6: TLabel;
    Shape5: TShape;
    Panel3: TPanel;
    grDados: TGroupBox;
    lbDataAge: TLabel;
    lbHoraAge: TLabel;
    lbTabPreco: TLabel;
    lbTotal: TLabel;
    lbProfissional: TLabel;
    lbCliente: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbProcedimentos: TLabel;
    Label14: TLabel;
    Shape6: TShape;
    ConfirmarHorrio1: TMenuItem;
    ppCalendario: TPopupMenu;
    BloquearDia1: TMenuItem;
    BloquearDiapProfissional1: TMenuItem;
    Panel5: TPanel;
    imgLembrete: TImage;
    lblAniversario: TLabel;
    imgAniversario: TImage;
    lblLembrete: TLabel;
    N1: TMenuItem;
    ListaNegra1: TMenuItem;
    N2: TMenuItem;
    VisualizarAgendadaSemana1: TMenuItem;
    N3: TMenuItem;
    DesbloquearDia1: TMenuItem;
    DebloquearDiapProfissional1: TMenuItem;
    cdsLembretes: TClientDataSet;
    cdsLembretesCLIE_FANTASIA: TStringField;
    cdsLembretesCLIE_TELEFONE1: TStringField;
    cdsLembretesCLIE_TELEFONE2: TStringField;
    cdsLembretesCLIE_TELEFONE3: TStringField;
    cdsLembretesCLIE_TELEFONE4: TStringField;
    cdsLembretesPROD_DESCRICAO: TStringField;
    cdsLembretesPERIODO: TIntegerField;
    frxLembrete: TfrxDBDataset;
    frLembrete: TfrxReport;
    cdsLembretesCLIE_ID: TIntegerField;
    ImageList1: TImageList;
    lbdata: TLabel;
    Image1: TImage;
    imgObservacao: TImage;
    BalloonHint1: TBalloonHint;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Calendario: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Filtrarporestevalor1Click(Sender: TObject);
    procedure grdBasicoCellClick(Column: TColumn);
    procedure AgendaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BloquearHorario1Click(Sender: TObject);
    procedure BloquearDia1Click(Sender: TObject);
    procedure BloquearDiapProfissional1Click(Sender: TObject);
    procedure lblAniversarioClick(Sender: TObject);
    procedure DesbloquearDia1Click(Sender: TObject);
    procedure DebloquearDiapProfissional1Click(Sender: TObject);
    procedure VisualizarAgendadaSemana1Click(Sender: TObject);
    procedure lblLembreteClick(Sender: TObject);
    procedure grdBasicoEnter(Sender: TObject);
    procedure grdBasicoColEnter(Sender: TObject);
  private
    hrAlmocoI,
    hrAlmocoF,
    HrIni,
    HrFim,
    HrInt : String;
    sltHrAlmoco : TStringList;
    sltHorarios : TStringList;
    sltStatus   : TStringList;
    procedure CriarClientDataSet(sTipo : String = 'I');
    procedure OpenClientDataSet(sTipo : String = 'I');
    procedure MontaHorarios;
    procedure Filtro(strPosition : String = '1');
    function  DeletarReservas(strAGEN_ID: String): Boolean;
    function  ValidaDados(strP : String; strProf : String = ''): Boolean;
    procedure VerificaAniversarios;
    procedure VerificaLembretes;
    procedure BloquearDia(sOrig : String; sProf: String = '');
    procedure DesbloquearDia(sOrig : String; sProf : String = '');
    procedure GerarRelatorio;
    procedure DetalhesAgenda;
  public
  end;

var
  fAgenda: TfAgenda;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses udmAgenda, ufCadAgenda, Vcl.DBCtrls, Winapi.Messages, ufReagendar,
  ufBuscaAgenda, ufRelAgenda;

{$R *.dfm}

procedure TfAgenda.AgendaTimer(Sender: TObject);
begin
  inherited;
  try
    Agenda.Enabled := false;
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
  finally
    Agenda.Enabled := true;
  end;
end;

procedure TfAgenda.Filtro(strPosition : String = '1');
label
  Pular;
var
  strFilter : String;
begin
  if strPosition = '2' then goto Pular;
  try
    strFilter := 'AGEN_ID = %d AND AGEN_EMPR_ID = %d AND AGEN_DATA = ''%S'' AND USER_NOME_COMPLETO = ''%s''';
    strFilter := Format(strFilter,[cdsAgenda.FieldByName('AGEN_AGEN_ID').AsInteger,
                                   funcBasico.Empr_ID,
                                   DateToStr(Calendario.Date),
                                   UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption)]);

    dmAgenda.cdsAgenda.Filtered := false;
    dmAgenda.cdsAgenda.Filter   := strFilter;
    dmAgenda.cdsAgenda.Filtered := true;

    if not dmAgenda.cdsAgenda.IsEmpty then Exit;
  except
  end;

  Pular:

  strFilter := 'AGEN_EMPR_ID = %d AND AGEN_DATA = ''%S'' AND AGEN_HORA = ''%S'' AND USER_NOME_COMPLETO = ''%s''';
  strFilter := Format(strFilter,[funcBasico.Empr_ID,
                                 DateToStr(Calendario.Date),
                                 cdsAgenda.FieldByName('HORARIO').AsString,
                                 UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption)]);

  dmAgenda.cdsAgenda.Filtered := false;
  dmAgenda.cdsAgenda.Filter   := strFilter;
  dmAgenda.cdsAgenda.Filtered := true;
end;

function TfAgenda.ValidaDados(strP : String; strProf : String = '') : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  if (strP='P') and (strProf='') then Exit;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT COUNT(*) AS QTDE');
      sql.Add('  FROM AGENDA');
      case strP[1] of
        'D' : begin
          sql.Add(' WHERE AGEN_EMPR_ID = :EMPR_ID');
          sql.Add('   AND AGEN_DATA    = :DATA');
        end;
        'P' : begin
          sql.Add(' WHERE AGEN_USER_ID_ATENDENTE = :USUR');
          sql.Add('   AND AGEN_EMPR_ID           = :EMPR_ID');
          sql.Add('   AND AGEN_DATA              = :DATA');
          Params.ParamByName('USUR').AsString := strProf;
        end;
      end;
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Params.ParamByName('DATA').AsDateTime   := Calendario.Date;
      Open;
      Result := FieldByName('QTDE').AsInteger = 0;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
  if not Result then begin
    funcBasico.Alerta('Bloqueio não permitido, há agendamento(s) para o dia/profissional selecionado!',0);
  end;
end;

procedure TfAgenda.BloquearDia1Click(Sender: TObject);
begin
  inherited;
  if not ValidaDados('D') then Exit;
  BloquearDia('D');
end;

procedure TfAgenda.BloquearDiapProfissional1Click(Sender: TObject);
begin
  inherited;
  fReagendar.Modo := 'B';  //Modo de Bloqueio
  fReagendar.pageCadastro.Pages[0].Caption := '&1.Selecione Prof.';
  fReagendar.ShowModal;
  if fReagendar.ModalResult = mrCancel then Exit;
  if not ValidaDados('P',fReagendar.frPesqAtendente.InGrid()) then Exit;
  BloquearDia('P',fReagendar.frPesqAtendente.InGrid());
end;

procedure TfAgenda.BloquearDia(sOrig : String; sProf : String = '');
var
  strHr : String;
  intI,
  intH,
  intM    : Integer;
  qryCons : TSQLQuery;
begin
  try
    funcBasico.MSGAguarde();
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT DISTINCT AGEN_USER_ID_ATENDENTE');
      sql.Add('  FROM AGENDA');
      sql.Add(' WHERE AGEN_EMPR_ID                  = :EMPR_ID');
      sql.Add('   AND EXTRACT(MONTH FROM AGEN_DATA) = :MES');
      sql.Add('   AND EXTRACT(YEAR  FROM AGEN_DATA) = :ANO');
      if sOrig='P' then
        sql.Add('   AND AGEN_USER_ID_ATENDENTE        = :USER_ID');
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Params.ParamByName('MES').AsString      := FormatDateTime('mm',Calendario.Date);
      Params.ParamByName('ANO').AsString      := FormatDateTime('yyyy',Calendario.Date);
      if sOrig='P' then
        Params.ParamByName('USER_ID').AsString  := sProf;
      Open;
      if IsEmpty then Exit;
      First;
      while not Eof do begin
        sProf  := FieldByName('AGEN_USER_ID_ATENDENTE').AsString;
        strHr  := Copy(funcBasico.Hr_Inicio,1,5);
        intI   := StrToInt(Copy(funcBasico.Hr_Intervalo,4,2));
        while strHr <= Copy(funcBasico.Hr_Termino,1,5) do begin
          if (sltHrAlmoco.IndexOf(strHr)<0) then begin
            dmAgenda.cdsAgenda.Filtered := false;
            dmAgenda.cdsAgenda.Insert;
            fCadAgenda.IniciarForm();
            dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsString  := sProf;
            dmAgenda.cdsAgenda.FieldByName('AGEN_DATA').AsString               := DateToStr(Calendario.Date);
            dmAgenda.cdsAgenda.FieldByName('AGEN_HORA').AsString               := strHr;
            dmAgenda.cdsAgenda.FieldByName('AGEN_STATUS').AsString             := 'B';
            dmAgenda.cdsAgenda.FieldByName('AGEN_CLIENTE').AsString            := funcBasico.Se(sOrig='P',fReagendar.edtMotivo.Text,'HORÁRIO BLOQUEADO');
            dmAgenda.cdsAgenda.ApplyUpdates(-1);
          end;
          intH := StrToInt(Copy(strHr,1,2));
          intM := StrToInt(Copy(strHr,4,2));
          intM := intM + intI;
          if intM = 60 then begin
            inc(intH);
            intM := 0;
          end;
          strHr := FormatFloat('00',intH)+':'+FormatFloat('00',intM);
        end;
        Next;
      end;
    end;
  finally
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
    Agenda.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfAgenda.BloquearHorario1Click(Sender: TObject);
begin
  inherited;
  try
    funcBasico.MSGAguarde();
    Agenda.Enabled := false;
    Filtro();
    try if (sltHrAlmoco.IndexOf(cdsAgenda.FieldByName('HORARIO').AsString)>=0) then Exit; except end;
    try if (dmAgenda.cdsAgenda.FieldByName('AGEN_STATUS').AsString[1] in ['F','C','A','O','B']) then Exit; except end;
    if (dmAgenda.cdsAgenda.IsEmpty) and (funcBasico.BuscarAtendente(UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption))<>0) then begin
      dmAgenda.cdsAgenda.Filtered := false;
      dmAgenda.cdsAgenda.Insert;
      fCadAgenda.IniciarForm();
      dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger := funcBasico.BuscarAtendente(UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption));
      dmAgenda.cdsAgenda.FieldByName('AGEN_DATA').AsString               := DateToStr(Calendario.Date);
      dmAgenda.cdsAgenda.FieldByName('AGEN_HORA').AsString               := cdsAgenda.FieldByName('HORARIO').AsString;
      dmAgenda.cdsAgenda.FieldByName('AGEN_STATUS').AsString             := 'B';
      dmAgenda.cdsAgenda.FieldByName('AGEN_CLIENTE').AsString            := 'HORÁRIO BLOQUEADO';
      dmAgenda.cdsAgenda.ApplyUpdates(-1);
    end;
  finally
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
    Agenda.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfAgenda.btnNovoClick(Sender: TObject);
var
  strBtnNome: String;
begin
  try
    grDados.Visible := False;
    Agenda.Enabled := false;
    strBtnNome := (Sender as TSpeedButton).Name;

    Filtro(funcBasico.Se(strBtnNome = 'btnExcluir','2','1'));

    if strBtnNome = 'btnNovo' then begin
      dmAgenda.cdsAgenda.Filtered := false;
      dmAgenda.cdsAgenda.Insert;
      dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger := funcBasico.BuscarAtendente(UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption));
      dmAgenda.cdsAgenda.FieldByName('AGEN_DATA').AsString               := DateToStr(Calendario.Date);
      dmAgenda.cdsAgenda.FieldByName('AGEN_HORA').AsString               := cdsAgenda.FieldByName('HORARIO').AsString;
      formCadastro.ShowModal;
    end else if strBtnNome = 'btnEditar' then begin
      if not dmAgenda.cdsAgenda.IsEmpty then begin
        dmAgenda.cdsAgenda.Edit;
      end else begin
        dmAgenda.cdsAgenda.Filtered := false;
        dmAgenda.cdsAgenda.Insert;
        dmAgenda.cdsAgenda.FieldByName('AGEN_USER_ID_ATENDENTE').AsInteger := funcBasico.BuscarAtendente(UpperCase(grdBasico.Columns.Items[grdBasico.Columns.Grid.SelectedIndex].Title.Caption));
        dmAgenda.cdsAgenda.FieldByName('AGEN_DATA').AsString               := DateToStr(Calendario.Date);
        dmAgenda.cdsAgenda.FieldByName('AGEN_HORA').AsString               := cdsAgenda.FieldByName('HORARIO').AsString;
      end;
      formCadastro.ShowModal;
    end else if strBtnNome = 'btnLocalizar' then begin
      fBuscaAgenda.ShowModal;
//      if fBuscaAgenda.frPesqCliente.TemRegistro then begin
//        Calendario.Date := StrToDate(fBuscaAgenda.frPesqCliente.edtOpcao.Text);
//        CalendarioClick(Sender);
//      end;
    end else if strBtnNome = 'btnExcluir' then begin
      if not dmAgenda.cdsAgenda.IsEmpty then begin
        if funcBasico.Alerta('Confirma a exclusão do registro selecionado?',1,true) = 6 then begin
          try
            try
              funcBasico.StartCommit;
            except
            end;
            DeletarReservas(cdsGeral.FieldByName('AGEN_ID').AsString);
            cdsGeral.Delete;
            cdsGeral.ApplyUpdates(-1);
            try
              funcBasico.Commit;
            except
            end;
          except on e: exception do begin
            funcBasico.RollBack;
            cdsGeral.CancelUpdates;
          end; end;
        end;
      end;
    end;
  finally
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
    Agenda.Enabled := true;
  end;
end;

procedure TfAgenda.DebloquearDiapProfissional1Click(Sender: TObject);
begin
  fReagendar.Modo := 'B';  //Modo de Bloqueio
  fReagendar.pageCadastro.Pages[0].Caption := '&1.Selecione Prof.';
  fReagendar.EdtMotivo.Enabled := false;
  fReagendar.ShowModal;
  fReagendar.EdtMotivo.Enabled := true;
  if not fReagendar.frPesqAtendente.TemRegistro then Exit;
  DesbloquearDia('P',fReagendar.frPesqAtendente.InGrid());
end;

procedure TfAgenda.DesbloquearDia1Click(Sender: TObject);
begin
  DesbloquearDia('D');
end;

procedure TfAgenda.DesbloquearDia(sOrig : String; sProf : String = '');
var
  qryCons : TSQLQuery;
begin
  try
    funcBasico.MSGAguarde();
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM AGENDA');
      sql.Add(' WHERE AGEN_EMPR_ID           = :EMPR_ID');
      sql.Add('   AND AGEN_STATUS            = ''B''');
      sql.Add('   AND AGEN_DATA              = :DATA');
      if sOrig = 'P' then
        sql.Add('   AND AGEN_USER_ID_ATENDENTE = :USER_ID');

      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Params.ParamByName('DATA').AsDateTime   := Calendario.Date;
      if sOrig = 'P' then
        Params.ParamByName('USER_ID').AsString:= sProf;
      ExecSQL()
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
    Agenda.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfAgenda.DeletarReservas(strAGEN_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := false;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM AGENDA');
      sql.Add(' WHERE AGEN_AGEN_ID      = '+strAGEN_ID);
      sql.Add('   AND AGEN_AGEN_EMPR_ID = '+IntToStr(funcBasico.Empr_ID));
      ExecSQL();
      Result := true;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfAgenda.CalendarioClick(Sender: TObject);
var
  dtTMP : TDate;
begin
  try
    dtTMP := Calendario.Date;
    inherited;
    grDados.Visible := false;
    CriarClientDataSet();
  finally
    Calendario.Date := dtTMP;
  end;
end;

procedure TfAgenda.OpenClientDataSet(sTipo : String = 'I');
var
  dtDataI,
  dtDataF : TDate;
  intI    : Integer;
begin
  if sTipo = 'I' then begin
    dtDataI := Calendario.Date;
    dtDataF := Calendario.Date;
  end else begin
    dtDataI := funcBasico.RetornaInicioSemana(Calendario.Date);
    dtDataF := funcBasico.RetornaFimSemana(Calendario.Date);
  end;
  dmAgenda.cdsAgenda.Close;
  dmAgenda.cdsAgenda.DataRequest('SELECT                                                                           '+
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
                                 '       TPRC.TPRC_DESCRICAO,                                                      '+
                                 '       CLIE.CLIE_OBS                                                             '+
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
                                 ' WHERE AGEN.AGEN_EMPR_ID = :EMPR_ID                                              '+
                                 '   AND AGEN.AGEN_DATA    >= :DATAI                                               '+
                                 '   AND AGEN.AGEN_DATA    <= :DATAF                                               ');

  dmAgenda.cdsAgenda.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
  dmAgenda.cdsAgenda.Params.ParamByName('DATAI').AsDate      := dtDataI;
  dmAgenda.cdsAgenda.Params.ParamByName('DATAF').AsDate      := dtDataF;
  dmAgenda.cdsAgenda.Open;
  dmAgenda.cdsAgenda.First;
  sltHorarios.Clear; sltStatus.Clear;
  while not dmAgenda.cdsAgenda.Eof do begin
    if Self.cdsAgenda.Locate('HORARIO',dmAgenda.cdsAgendaAGEN_HORA.AsString,[]) then begin
      Self.cdsAgenda.Edit;
      if sTipo = 'S' then
        Self.cdsAgenda.FieldByName('DATA').AsString := dmAgenda.cdsAgendaAGEN_DATA.AsString;
      Self.cdsAgenda.FieldByName(funcBasico.RetiraEspaco(dmAgenda.cdsAgendaUSER_NOME_COMPLETO.AsString)).AsString :=
        Trim(funcBasico.Se(dmAgenda.cdsAgendaAGEN_AGEN_ID.AsInteger=-1,
             funcBasico.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcBasico.ClientePadrao,
                           dmAgenda.cdsAgendaAGEN_TELEFONE.AsString,
                           dmAgenda.cdsAgendaCLIE_TELEFONE1.AsString),'') + ' - '+

        funcBasico.TratarNome(funcBasico.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcBasico.ClientePadrao,
                                            dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                            dmAgenda.cdsAgendaCLIE_FANTASIA.AsString
                                           )
                             ));
      sltHorarios.Add(UpperCase(funcBasico.RetiraEspaco(dmAgenda.cdsAgendaUSER_NOME_COMPLETO.AsString)+';'+
                      dmAgenda.cdsAgendaAGEN_HORA.AsString{+';'+
                      funcBasico.RetiraEspaco(funcBasico.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcBasico.ClientePadrao,
                                              dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                              dmAgenda.cdsAgendaCLIE_FANTASIA.AsString
                                              ))}));
      sltStatus.Add(UpperCase(funcBasico.RetiraEspaco(dmAgenda.cdsAgendaUSER_NOME_COMPLETO.AsString+';'+
                    dmAgenda.cdsAgendaAGEN_HORA.AsString+';'+{
                    funcBasico.RetiraEspaco(funcBasico.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcBasico.ClientePadrao,
                                            dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                            dmAgenda.cdsAgendaCLIE_FANTASIA.AsString))+';'+}
                    dmAgenda.cdsAgendaAGEN_STATUS.AsString)));
      Self.cdsAgenda.FieldByName('AGEN_AGEN_ID').AsString := dmAgenda.cdsAgendaAGEN_AGEN_ID.AsString;

      Self.cdsAgenda.Post;
    end;
    dmAgenda.cdsAgenda.Next;
  end;
  lbdata.Caption := 'Agenda do Dia: '+FormatDateTime('dd/mm/yyyy',Calendario.Date)+'  ';
  dmAgenda.cdsAgenda.First;
  dmAgenda.cdsAgenda.Cancel;
  Self.cdsAgenda.First;
end;

procedure TfAgenda.CriarClientDataSet(sTipo : String = 'I');
var
  cdsFilder      : TField;
  qryCons        : TSQLQuery;
  BookMarkString : TBookMark;
begin
  try
    funcBasico.MSGAguarde();
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
      qryCons.SQLConnection := funcBasico.Conexao;
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT DISTINCT');
        sql.Add('       USER_NOME_COMPLETO');
        sql.Add('  FROM USUARIO');
        sql.Add('  JOIN AGENDA');
        sql.Add('    ON USER_ID                       = AGEN_USER_ID_ATENDENTE');
        sql.Add(' WHERE AGEN_EMPR_ID                  = '+IntToStr(funcBasico.Empr_ID));
        sql.Add('   AND EXTRACT(MONTH FROM AGEN_DATA) = '+FormatDateTime('MM',Calendario.Date));
        sql.Add('   AND EXTRACT(YEAR  FROM AGEN_DATA) = '+FormatDateTime('YYYY',Calendario.Date));
        sql.Add(' ORDER BY');
        sql.Add('       USER_NOME_COMPLETO');
        Open;
        First;
        while not Eof do begin
          cdsFilder               := TStringField.Create(Self);
          cdsFilder.FieldName     := funcBasico.RetiraEspaco(Fields[0].AsString);
          cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
          cdsFilder.Index         := cdsAgenda.FieldCount;
          cdsFilder.DataSet       := cdsAgenda;
          cdsFilder.DisplayLabel  := funcBasico.TratarNome(Fields[0].AsString);
          cdsFilder.DisplayWidth  := 30;
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

    cdsFilder := TStringField.Create(Self);
    cdsFilder.FieldName     := 'HORARIO1';
    cdsFilder.Name          := cdsAgenda.Name+cdsFilder.FieldName;
    cdsFilder.Index         := cdsAgenda.FieldCount;
    cdsFilder.DataSet       := cdsAgenda;
    cdsFilder.DisplayLabel  := 'Horário';
    cdsFilder.DisplayWidth  := 10;

    cdsAgenda.CreateDataSet;
    cdsAgenda.Open;

    MontaHorarios();
    OpenClientDataSet(sTipo);
    VerificaAniversarios();
    //VerificaLembretes();
  finally
    cdsAgenda.Bookmark := BookMarkString;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfAgenda.VerificaAniversarios();
begin
  imgAniversario.Visible := false;
  lblAniversario.Visible := false;
  with dmAgenda.cdsAniversario do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    Open;
    if not IsEmpty then begin
      imgAniversario.Visible := true;
      lblAniversario.Visible := true;
    end;
  end;
end;

procedure TfAgenda.VerificaLembretes();
var
  qryCons    : TSQLQuery;
  qryConsII  : TSQLQuery;
  intI       : Integer;
  strProd_ID,
  strPeriodo : String;
begin
  Exit;
  try
    imgLembrete.Visible     := false;
    lblLembrete.Visible     := false;
    qryCons                 := TSQLQuery.Create(nil);
    qryCons.SQLConnection   := funcBasico.Conexao;
    qryConsII               := TSQLQuery.Create(nil);
    qryConsII.SQLConnection := funcBasico.Conexao;
    cdsLembretes.EmptyDataSet;
    ///Listando todos os produtos que sejam serviço e que tenham período de retorno
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT DISTINCT');
      sql.Add('       PROD_ID,');
      sql.Add('       PROD_PERIODO_RETORNO');
      sql.Add('  FROM ORDEM_SERVICO_ITENS');
      sql.Add('  JOIN PRODUTOS');
      sql.Add('    ON PROD_ID                   = ODIT_TPIT_PROD_ID');
      sql.Add('   AND PROD_EMPR_ID              = ODIT_TPIT_PROD_EMPR_ID');
      sql.Add(' WHERE PROD_EMPR_ID              = :EMPR_ID');
      sql.Add('   AND PROD_GENE_EMPR_ID_TP_PROD = 0');
      sql.Add('   AND PROD_GENE_TGEN_ID_TP_PROD = 10');
      sql.Add('   AND PROD_GENE_ID_TP_PROD      = 2');
      sql.Add('   AND PROD_PERIODO_RETORNO      <> ''''');
      Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
      Open;
      if IsEmpty then Exit;
      First;
      while not Eof do begin

        strProd_ID := FieldByName('PROD_ID').AsString;
        strPeriodo := '';
        for intI := 1 to 100 do begin
          if funcBasico.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI) <> '' then begin
            if DayOfWeek(funcBasico.DataServidor())=2 then
              strPeriodo := strPeriodo + IntToStr(StrToInt(funcBasico.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI))-1)+',';
            strPeriodo := strPeriodo + funcBasico.Buscar_Coluna(FieldByName('PROD_PERIODO_RETORNO').AsString,intI)+',';
          end;
        end;
        strPeriodo := Copy(strPeriodo,1,Length(strPeriodo)-1);

        qryConsII.Close;
        qryConsII.sql.Clear;
        qryConsII.sql.Add('SELECT CLIE_ID,');
        qryConsII.sql.Add('       CLIE_FANTASIA,');
        qryConsII.sql.Add('       CLIE_TELEFONE1,');
        qryConsII.sql.Add('       CLIE_TELEFONE2,');
        qryConsII.sql.Add('       CLIE_TELEFONE3,');
        qryConsII.sql.Add('       CLIE_TELEFONE4,');
        qryConsII.sql.Add('       PROD_DESCRICAO,');
        qryConsII.sql.Add('       CAST((SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE) AS DATE)-CAST(AGEN_DATA AS DATE) AS PERIODO');
        qryConsII.sql.Add('  FROM AGENDA');
        qryConsII.sql.Add('  JOIN CLIENTES');
        qryConsII.sql.Add('    ON CLIE_ID           = AGEN_CLIE_ID');
        qryConsII.sql.Add('   AND CLIE_EMPR_ID      = AGEN_CLIE_EMPR_ID');
        qryConsII.sql.Add('  JOIN ORDEM_SERVICO_ITENS');
        qryConsII.sql.Add('    ON ODIT_ORDS_ID      = AGEN_ORDS_ID');
        qryConsII.sql.Add('   AND ODIT_ORDS_EMPR_ID = AGEN_ORDS_EMPR_ID');
        qryConsII.sql.Add('  JOIN PRODUTOS');
        qryConsII.sql.Add('    ON PROD_ID           = ODIT_TPIT_PROD_ID');
        qryConsII.sql.Add('   AND PROD_EMPR_ID      = ODIT_TPIT_PROD_EMPR_ID');
        qryConsII.sql.Add(' WHERE AGEN_ORDS_ID IN (SELECT ODIT_ORDS_ID');
        qryConsII.sql.Add('                          FROM ORDEM_SERVICO_ITENS');
        qryConsII.sql.Add('                         WHERE ODIT_EMPR_ID      = :EMPR_ID');
        qryConsII.sql.Add('                           AND ODIT_TPIT_PROD_ID = :PROD_ID)');
        qryConsII.sql.Add('   AND AGEN_EMPR_ID  = :EMPR_ID');
        qryConsII.sql.Add('   AND CAST((SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE) AS DATE)-CAST(AGEN_DATA AS DATE) IN ('+strPeriodo+')');
        qryConsII.sql.Add('   AND AGEN_CLIE_ID  <> (SELECT CSIS_CLIE_ID FROM CONF_SISTEMA WHERE CSIS_EMPR_ID = :EMPR_ID)');
        qryConsII.sql.Add(' GROUP BY');
        qryConsII.sql.Add('       CLIE_ID,');
        qryConsII.sql.Add('       CLIE_FANTASIA,');
        qryConsII.sql.Add('       CLIE_TELEFONE1,');
        qryConsII.sql.Add('       CLIE_TELEFONE2,');
        qryConsII.sql.Add('       CLIE_TELEFONE3,');
        qryConsII.sql.Add('       CLIE_TELEFONE4,');
        qryConsII.sql.Add('       PROD_DESCRICAO,');
        qryConsII.sql.Add('       AGEN_DATA');
        qryConsII.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
        qryConsII.Params.ParamByName('PROD_ID').AsString  := strProd_ID;
        qryConsII.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
        qryConsII.Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
        qryConsII.Open;
        if not qryConsII.IsEmpty then begin
          while not qryConsII.Eof do begin
            cdsLembretes.Append;
            cdsLembretesCLIE_ID.AsInteger       := qryConsII.FieldByName('CLIE_ID').AsInteger;
            cdsLembretesCLIE_FANTASIA.AsString  := qryConsII.FieldByName('CLIE_FANTASIA').AsString;
            cdsLembretesCLIE_TELEFONE1.AsString := qryConsII.FieldByName('CLIE_TELEFONE1').AsString;
            cdsLembretesCLIE_TELEFONE2.AsString := qryConsII.FieldByName('CLIE_TELEFONE2').AsString;
            cdsLembretesCLIE_TELEFONE3.AsString := qryConsII.FieldByName('CLIE_TELEFONE3').AsString;
            cdsLembretesCLIE_TELEFONE4.AsString := qryConsII.FieldByName('CLIE_TELEFONE4').AsString;
            cdsLembretesPROD_DESCRICAO.AsString := qryConsII.FieldByName('PROD_DESCRICAO').AsString;
            cdsLembretesPERIODO.AsInteger       := qryConsII.FieldByName('PERIODO').AsInteger;
            cdsLembretes.Post;
            qryConsII.Next;
          end;
        end;
        Next;
      end;
    end;
    if not cdsLembretes.IsEmpty then begin
      imgLembrete.Visible     := true;
      lblLembrete.Visible     := true;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
    qryConsII.Close;
    FreeAndNil(qryConsII);
  end;
end;

procedure TfAgenda.VisualizarAgendadaSemana1Click(Sender: TObject);
begin
  try
    Self.cdsAgenda.DisableControls;
    inherited;
//    CriarClientDataSet('S');
    GerarRelatorio();
  finally
    Self.cdsAgenda.EnableControls;
    CriarClientDataSet();
  end;
end;

procedure TfAgenda.GerarRelatorio();
begin
  fRelAgendaSemana.qrepRelatorio.Preview;
end;

procedure TfAgenda.MontaHorarios();
var
  strHr : String;
  intI,
  intH,
  intM   : Integer;
begin
  try
    cdsAgenda.DisableControls;
    strHr  := Copy(funcBasico.Hr_Inicio,1,5);
    intI   := StrToInt(Copy(funcBasico.Hr_Intervalo,4,2));

    cdsAgenda.Append;
    cdsAgenda.Fields[0].AsString := strHr;
    cdsAgenda.Fields[cdsAgenda.FieldCount-1].AsString := strHr;
    cdsAgenda.Post;

    while strHr <> Copy(funcBasico.Hr_Termino,1,5) do begin
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
      cdsAgenda.Fields[cdsAgenda.FieldCount-1].AsString := strHr;
      cdsAgenda.Post;
    end;
    strHr  := Copy(funcBasico.Hr_Almoco_Inicio,1,5); sltHrAlmoco.Clear;
    sltHrAlmoco.Add(strHr);
    while strHr <> Copy(funcBasico.Hr_Almoco_Fim,1,5) do begin
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

procedure TfAgenda.Filtrarporestevalor1Click(Sender: TObject);
var
  strFiltro : String;
begin
  try
    funcBasico.MSGAguarde();
    Agenda.Enabled := false;

    Filtro();
    strFiltro := 'AGEN_ID = %d AND AGEN_EMPR_ID = %d';
    strFiltro := Format(strFiltro,[dmAgenda.cdsAgenda.FieldByName('AGEN_ID').AsInteger,
                                   funcBasico.Empr_ID]);

    if dmAgenda.cdsAgenda.IsEmpty then Exit;

    case TMenuItem(Sender).Tag of
      1 : begin //Reagendar
        if (dmAgenda.cdsAgendaAGEN_STATUS.AsString[1] in ['F','C','B','L']) then Exit;
        fReagendar.ShowModal;

        if fReagendar.ModalResult = mrCancel then Exit;

        dmAgenda.cdsAgenda.Filtered := false;
        dmAgenda.cdsAgenda.Filter   := strFiltro;
        dmAgenda.cdsAgenda.Filtered := true;

        dmAgenda.cdsAgenda.Edit;
        fCadAgenda.IniciarForm();
        fCadAgenda.btnOK.Click;
      end;
      2 : begin //Confirmar
        if (dmAgenda.cdsAgendaAGEN_STATUS.AsString[1] in ['F','C','B','L']) then Exit;
        dmAgenda.cdsAgenda.Edit;
        fCadAgenda.IniciarForm();
        fCadAgenda.rdStatus.ItemIndex := 1;
        fCadAgenda.ModoGrafico := false;
        fCadAgenda.btnOK.Click;
      end;
      3 : begin //Finalizar
        if (dmAgenda.cdsAgendaAGEN_STATUS.AsString[1] in ['F','C','B','L']) then Exit;
        dmAgenda.cdsAgenda.Edit;
        fCadAgenda.IniciarForm();
        fCadAgenda.rdStatus.ItemIndex := 2;
        fCadAgenda.ModoGrafico := false;
        fCadAgenda.btnOK.Click;
      end;
      4 : begin //Cancelar
        if (dmAgenda.cdsAgendaAGEN_STATUS.AsString[1] in ['C','B','L']) then Exit;
        dmAgenda.cdsAgenda.Edit;
        fCadAgenda.IniciarForm();
        fCadAgenda.rdStatus.ItemIndex := 3;
        fCadAgenda.ModoGrafico := false;
        fCadAgenda.btnOK.Click;
      end;
      5 : begin
        if (dmAgenda.cdsAgendaAGEN_STATUS.AsString[1] in ['F','C','B','L']) then Exit;
        dmAgenda.cdsAgenda.Edit;
        fCadAgenda.IniciarForm();
        fCadAgenda.rdStatus.ItemIndex := 5;
        fCadAgenda.ModoGrafico := false;
        fCadAgenda.btnOK.Click;
      end;
    end;
  finally
    dmAgenda.cdsAgenda.Filtered := false;
    CriarClientDataSet();
    Agenda.Enabled := True;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(sltHrAlmoco);
  FreeAndNil(sltHorarios);
  FreeAndNil(sltStatus);
  inherited;
end;

procedure TfAgenda.FormCreate(Sender: TObject);
var
  Princ   : TForm;
begin
  Princ := Application.MainForm;
  if Princ <> nil then
    funcBasico := TFuncoes(Princ.FindComponent('funcPrincipal'));
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral := dmAgenda.cdsAgenda;
  formCadastro := fCadAgenda;
  with fCadAgenda do begin
    cdsLocal  := dmAgenda.cdsAgenda;
    funcLocal := Self.funcBasico;
  end;
  sltHrAlmoco   := TStringList.Create;
  sltHorarios := TStringList.Create;
  sltStatus   := TStringList.Create;
  Calendario.Date := funcBasico.DataServidor();
  dstRelatorio.DataSource := dmAgenda.dsAniversario;
  funcBasico.MSGAguarde();
end;

procedure TfAgenda.FormShow(Sender: TObject);
begin
  inherited;
  Agenda.Enabled := true;
  hrAlmocoI := Copy(funcBasico.Hr_Almoco_Inicio,1,5);
  hrAlmocoF := Copy(funcBasico.Hr_Almoco_Fim,1,5);
  VerificaLembretes();
  CriarClientDataSet();
  funcBasico.MSGAguarde(false);
end;

procedure TfAgenda.grdBasicoCellClick(Column: TColumn);
begin
  inherited;
  DetalhesAgenda();
end;

procedure TfAgenda.grdBasicoColEnter(Sender: TObject);
begin
  inherited;
  DetalhesAgenda();
end;

procedure TfAgenda.DetalhesAgenda();
var
  qryCons : TSQLQuery;
begin
  imgObservacao.Hint := '';
  imgObservacao.ShowHint := false;
  Filtro();
  grDados.Visible := false;
  imgObservacao.Visible    := false;
  imgObservacao.Repaint;
  if not dmAgenda.cdsAgenda.IsEmpty then begin
    with dmAgenda do begin
      lbDataAge.Caption      := cdsAgendaAGEN_DATA.AsString;
      lbHoraAge.Caption      := cdsAgendaAGEN_HORA.AsString;
      lbTabPreco.Caption     := funcBasico.TratarNome(cdsAgendaTPRC_DESCRICAO.AsString);
      lbProfissional.Caption := funcBasico.TratarNome(cdsAgendaUSER_NOME_COMPLETO.AsString);
      lbCliente.Caption      := funcBasico.TratarNome(funcBasico.Se(dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger=funcBasico.ClientePadrao,
                                                                    dmAgenda.cdsAgendaAGEN_CLIENTE.AsString,
                                                                    dmAgenda.cdsAgendaCLIE_FANTASIA.AsString
                                                                    ));
      if (dmAgenda.cdsAgendaCLIE_OBS.AsString <> '') or
         (dmAgenda.cdsAgendaAGEN_OBS.AsString <> '') then begin
        imgObservacao.Hint := Trim('|'+
                                   '[    CLIENTE: '+dmAgenda.cdsAgendaCLIE_DTA_CADASTRO.AsString+'   ] '+#13+#13+
                                   dmAgenda.cdsAgendaCLIE_OBS.AsString+#13+#13+
                                   '[              AGENDA              ] '+#13+#13+
                                   dmAgenda.cdsAgendaAGEN_OBS.AsString+'|0');
        imgObservacao.ShowHint := true;
      end;
      lbTotal.Caption        := FormatFloat('###,###,##0.00', dmAgenda.cdsAgendaAGEN_VLR_TOTAL.AsFloat);
      try
        qryCons := TSQLQuery.Create(nil);
        qryCons.SQLConnection := funcLocal.Conexao;
        with qryCons do begin
          Close;
          sql.Clear;
          sql.Add('SELECT DISTINCT COALESCE(PR.PROD_DESCRICAO,''NENHUM PROCEDIMENTO AINDA INFORMADO'') AS PRODUTO');
          sql.Add('  FROM ORDEM_SERVICO_ITENS  OI');
          sql.Add('  JOIN PRODUTOS             PR');
          sql.Add('    ON PR.PROD_ID           = OI.ODIT_TPIT_PROD_ID');
          sql.Add('   AND PR.PROD_EMPR_ID      = OI.ODIT_TPIT_PROD_EMPR_ID');
          sql.Add(' WHERE OI.ODIT_ORDS_ID      = (SELECT AGEN_ORDS_ID');
          sql.Add('                                 FROM AGENDA');
          sql.Add('                                WHERE AGEN_ID      = :AGEN_ID');
          sql.Add('                                  AND AGEN_EMPR_ID = :EMPR_ID)');
          sql.Add('   AND OI.ODIT_ORDS_EMPR_ID = :EMPR_ID');
          sql.Add('   AND OI.ODIT_EMPR_ID      = :EMPR_ID');
          Params.ParamByName('AGEN_ID').AsInteger := dmAgenda.cdsAgendaAGEN_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          First; lbProcedimentos.Caption := '';
          while not Eof do begin
            lbProcedimentos.Caption := lbProcedimentos.Caption + funcBasico.TratarNome(FieldByName('PRODUTO').AsString)+#13+#10;
            Next;
          end;
          Close;
          sql.Clear;
          sql.Add('SELECT ID                              ');
          sql.Add('  FROM (                               ');
          sql.Add('SELECT CLIE_ID          AS ID,         ');
          sql.Add('       CLIE_EMPR_ID     AS EMPR_ID,    ');
          sql.Add('       CLIE_OBS         AS OBS         ');
          sql.Add('  FROM CLIENTES                        ');
          sql.Add('                                       ');
          sql.Add(' UNION ALL                             ');
          sql.Add('                                       ');
          sql.Add('SELECT AGEN_CLIE_ID     AS ID,         ');
          sql.Add('       AGEN_EMPR_ID     AS EMPR_ID,    ');
          sql.Add('       AGEN_OBS         AS OBS         ');
          sql.Add('  FROM AGENDA                          ');
          sql.Add('       )                               ');
          sql.Add(' WHERE ID               = :CLIE_ID     ');
          sql.Add('   AND EMPR_ID          = :EMPR_ID     ');
          sql.Add('   AND CHAR_LENGTH(OBS) > 0            ');
          Params.ParamByName('CLIE_ID').AsInteger := dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
          Open;
          if (not IsEmpty ) and ((dmAgenda.cdsAgendaCLIE_OBS.AsString <> '') or
             (dmAgenda.cdsAgendaAGEN_OBS.AsString <> '')) then begin
            imgObservacao.Visible := true;
            imgObservacao.Tag     := dmAgenda.cdsAgendaAGEN_CLIE_ID.AsInteger;
          end;
        end;
      finally
        qryCons.Close;
        FreeAndNil(qryCons);
      end;
    end;
    grDados.Visible := true;
  end;
  try
    Agenda.Enabled := false;
  finally
    dmAgenda.cdsAgenda.Filtered := false;
    Agenda.Enabled := true;
  end;
end;

procedure TfAgenda.grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  StrTMP : String;
begin
  inherited;
  if ((sltHrAlmoco.IndexOf(cdsAgenda.FieldByName('HORARIO').AsString)>=0) and (Column.FieldName <> 'HORARIO')) and
     ((sltHrAlmoco.IndexOf(cdsAgenda.FieldByName('HORARIO1').AsString)>=0) and (Column.FieldName <> 'HORARIO1')) then begin
    grdBasico.Canvas.Brush.Color := clFuchsia;
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Hr. Almoço');
    Exit;
  end;
  StrTMP := UpperCase(funcBasico.RetiraEspaco(Column.Field.FieldName+';'+cdsAgenda.FieldByName('HORARIO').AsString));
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

procedure TfAgenda.grdBasicoEnter(Sender: TObject);
begin
  inherited;
  DetalhesAgenda();
end;

procedure TfAgenda.lblAniversarioClick(Sender: TObject);
begin
  inherited;
  with frRelatorio do begin
    TfrxMemoView(FindComponent('lbTit01')).Text    := '';
    TfrxMemoView(FindComponent('lbFild01')).Text   := '';
    TfrxMemoView(FindComponent('lbTit02')).Text    := '';
    TfrxMemoView(FindComponent('lbFild02')).Text   := '';
    TfrxMemoView(FindComponent('lbTit03')).Text    := '';
    TfrxMemoView(FindComponent('lbFild03')).Text   := '';
    frRelatorio.ShowReport();
  end;
end;

procedure TfAgenda.lblLembreteClick(Sender: TObject);
begin
  inherited;
  with frLembrete do begin
    TfrxMemoView(FindComponent('lbTit01')).Text    := '';
    TfrxMemoView(FindComponent('lbFild01')).Text   := '';
    TfrxMemoView(FindComponent('lbTit02')).Text    := '';
    TfrxMemoView(FindComponent('lbFild02')).Text   := '';
    TfrxMemoView(FindComponent('lbTit03')).Text    := '';
    TfrxMemoView(FindComponent('lbFild03')).Text   := '';
    frLembrete.ShowReport();
  end;
end;

initialization
  RegisterClass(TfAgenda);
finalization
  UnRegisterClass(TfAgenda);

end.
