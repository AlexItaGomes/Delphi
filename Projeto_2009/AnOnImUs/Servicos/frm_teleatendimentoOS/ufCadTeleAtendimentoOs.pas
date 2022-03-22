unit ufCadTeleAtendimentoOs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, uFrPesqIndividual, SQLExpr, Grids, DBGrids;

type
  TfCadTeleAtendimentoOS = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    edtDtAtendimento: TDBDateEdit;
    ckAtendimento: TCheckBox;
    TabSheet2: TTabSheet;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    DBGrid1: TDBGrid;
    frPesqStatusAtendimento: TfrPesqIndividual;
    edtDtProxAtendimento: TDBDateEdit;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    mmHistorico: TDBMemo;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    DBMemo1: TDBMemo;
    tmHora: TDateTimePicker;
    Label24: TLabel;
    DBEdit2: TDBEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frPesqStatusAtendimentoedtCodigoExit(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    function ValidaDados: Boolean;
    procedure OpenClientDataSet(intPos : Integer = 99);
    procedure SetaValoresFrames;
    procedure AtualizaCliente(strClie_ID: String; boolCheck: Boolean;
      dtProxAtend: TDateTime; hrProxAtend : TTime; boolCompleto : Boolean = true);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadTeleAtendimentoOS: TfCadTeleAtendimentoOS;

implementation

uses udmTeleAtendimentoOS, DB;

{$R *.dfm}

procedure TfCadTeleAtendimentoOS.BitBtn1Click(Sender: TObject);
begin
  try
    inherited;
    funcLocal.AbreOS     := true;
    funcLocal.CodEquip   := dmTeleAtendimentoOS.cdsListaEquipamentosPROD_ID.AsInteger;
    funcLocal.CodCliente := dmTeleAtendimentoOS.cdsClientesCLIE_ID.AsInteger;
    funcLocal.ExecutaRotina(445);
  finally
    OpenClientDataSet(3);
  end;
end;

procedure TfCadTeleAtendimentoOS.btnOKClick(Sender: TObject);
var
  boolCheck   : Boolean;
  dtProxAtend : TDateTime;
  hrProxAtend : TTime;
  strClie_ID  : String;
begin
  if funcLocal.EmpresasBloqueada() then Exit;
  if ValidaDados then begin
    boolCheck   := ckAtendimento.Checked;
    dtProxAtend := edtDtProxAtendimento.Date;
    hrProxAtend := tmHora.Time;
    strClie_ID  := cdsLocal.FieldByName('CLIE_ID').AsString;
    inherited;
    dmTeleAtendimentoOS.cdsHistorico.ApplyUpdates(-1);
    AtualizaCliente(strClie_ID,boolCheck,dtProxAtend,hrProxAtend);
    Self.Close;
  end;
end;

procedure TfCadTeleAtendimentoOS.DBEdit2Exit(Sender: TObject);
begin
  cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString := funcLocal.TrataTelefone( cdsLocal.FieldByName( (Sender as TDBEdit).DataField ).AsString );
end;

procedure TfCadTeleAtendimentoOS.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(DBGrid2.DataSource.DataSet.RecNo) then begin
      DBGrid2.Canvas.Font.Color  := clBlack;
      DBGrid2.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      DBGrid2.Canvas.Font.Color  := clBlack;
      DBGrid2.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      DBGrid2.Canvas.Brush.Color := clSilver;
      DBGrid2.Canvas.Font.Style  := [fsBold];
    end;
     DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
end;

procedure TfCadTeleAtendimentoOS.AtualizaCliente(strClie_ID : String;
                                                 boolCheck  : Boolean;
                                                 dtProxAtend : TDateTime;
                                                 hrProxAtend : TTime;
                                                 boolCompleto : Boolean = true);
begin
  with funcLocal do begin
    try
      qryConsSQL := TSQLQuery.Create(nil);
      qryConsSQL.SQLConnection := funcLocal.Conexao;
      with qryConsSQL do begin
        Close;
        sql.Clear;
        sql.Add('UPDATE CLIENTES');
        sql.Add('   SET CLIE_USER_ID_ATENDENTE    = :USER_ID');
        if boolCompleto then begin
          sql.Add('      ,CLIE_DTA_ATENDIMENTO      = :DT_ATENDENTE');
          sql.Add('      ,CLIE_HORA_ATEND           = :HORA_ATEND');
          sql.Add('      ,CLIE_BLOQUEAR_ATENDIMENTO = :BLOQUEAR');
        end;
        sql.Add(' WHERE CLIE_ID 					        = :CLIE_ID');
        sql.Add('   AND CLIE_EMPR_ID 			        = :EMPR_ID');
        Params.ParamByName('USER_ID').AsInteger       := funcLocal.User_ID;
        if boolCompleto then begin
          Params.ParamByName('BLOQUEAR').AsInteger      := funcLocal.Se(boolCheck,1,0);
          Params.ParamByName('DT_ATENDENTE').AsDateTime := dtProxAtend;
          Params.ParamByName('HORA_ATEND').AsTime       := HrProxAtend;
        end;
        Params.ParamByName('CLIE_ID').AsString        := strClie_ID;
        Params.ParamByName('EMPR_ID').AsInteger       := funcLocal.Empr_ID;
        ExecSQL();
      end;
    finally
      Close;
      FreeAndNil(qryConsSQL);
    end;
  end;
end;

function TfCadTeleAtendimentoOS.ValidaDados : Boolean;
begin
  Result := True;
  if not ckAtendimento.Checked then begin
    if (edtDtProxAtendimento.Date = 0) or (edtDtProxAtendimento.Date < funcLocal.DataServidor(funcLocal.Conexao)) then begin
      funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Informe a data do próximo antendimento antes de continuar!',0);
      pageCadastro.Pages[1].Show;
      edtDtProxAtendimento.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  if not frPesqStatusAtendimento.TemRegistro then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Informe o status para o atendimento antes de continuar!',0);
    pageCadastro.Pages[1].Show;
    frPesqStatusAtendimento.SetFocus;
    Result := false;
    Exit;
  end;
  if (TimeToStr(tmHora.Time) < '07:00:00') or (TimeToStr(tmHora.Time) > '18:00:00') then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Horário divergênte do horário de atendimento, verifique a hora informada antes de continuar!',0);
    tmHora.SetFocus;
    Result := false;
    Exit;
  end;
  if (edtDtProxAtendimento.Date = funcLocal.DataServidor(funcLocal.Conexao)) and (FormatDateTime('hh:mm:ss',tmHora.Time) < FormatDateTime('hh:mm:ss',Now)) then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Horário divergênte do horário atual, verifique a hora informada antes de continuar!',0);
    tmHora.SetFocus;
    Result := false;
    Exit;
  end;
  if Trim(mmHistorico.Text) = '' then begin
    funcLocal.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+'Atendimento sem histórico lançado, necessário um histórico antes de continuar!',0);
    pageCadastro.Pages[0].Show;
    mmHistorico.SetFocus;
    Result := false;
    Exit;
  end;
end;

procedure TfCadTeleAtendimentoOS.FormShow(Sender: TObject);
begin
  inherited;
  ckAtendimento.Checked := (cdsLocal.FieldByName('CLIE_BLOQUEAR_ATENDIMENTO').AsInteger = 1);
  if dmTeleAtendimentoOS.cdsClientesCLIE_DTA_ATENDIMENTO.AsDateTime = 0 then begin
    dmTeleAtendimentoOS.cdsClientesCLIE_DTA_ATENDIMENTO.AsDateTime := funcLocal.DataServidor(funcLocal.Conexao);
  end;
  OpenClientDataSet();
  SetaValoresFrames;
  if funcLocal.SepararTeleAtendimento then begin
    AtualizaCliente(cdsLocal.FieldByName('CLIE_ID').AsString,
                    ckAtendimento.Checked,
                    edtDtProxAtendimento.Date,
                    tmHora.Time,
                    False);
  end;
end;

procedure TfCadTeleAtendimentoOS.SetaValoresFrames;
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
    end;
  end;
  frPesqStatusAtendimento.cdsLocal  := dmTeleAtendimentoOS.cdsHistorico;
  frPesqStatusAtendimento.cdsField1 := 'HTAT_GENE_ID_STATUS';
  frPesqStatusAtendimento.cdsField2 := 'GENE_DESCR';
  frPesqStatusAtendimento.cdsField3 := 'GENE_NUMBER1';
end;

procedure TfCadTeleAtendimentoOS.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTeleAtendimentoOS do begin
    case intPos of
      1 : begin
        with cdsListaAtendimento do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsHistorico do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Append;
        end;
      end;
      3 : begin
        with cdsListaEquipamentos do begin
          Close;
          Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('CLIE_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      99: begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
      end;
    end;
  end;
end;

procedure TfCadTeleAtendimentoOS.frPesqStatusAtendimentoedtCodigoExit(
  Sender: TObject);
begin
  inherited;
  frPesqStatusAtendimento.edtCodigoExit(Sender);
  if (frPesqStatusAtendimento.edtOpcao.Text <> '') and (edtDtProxAtendimento.Date = 0) then begin
    edtDtProxAtendimento.Date := edtDtAtendimento.Date + StrToInt(frPesqStatusAtendimento.edtOpcao.Text);
  end;
end;

initialization
  if fCadTeleAtendimentoOS = nil then
    fCadTeleAtendimentoOS := TfCadTeleAtendimentoOS.Create(nil);
finalization
  FreeAndNil(fCadTeleAtendimentoOS);

end.
