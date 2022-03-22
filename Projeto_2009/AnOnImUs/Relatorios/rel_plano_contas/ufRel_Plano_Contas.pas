unit ufRel_Plano_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit,DateUtils, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfRel_Plano_Contas = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtDtInicio: TDateEdit;
    edtDtFim: TDateEdit;
    rdTipo: TRadioGroup;
    rdAtivo: TRadioGroup;
    rdOpcao_Impressao: TRadioGroup;
    rdTipo_Impressao: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure OpenClientDataSet;
    function GeraSQL: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRel_Plano_Contas: TfRel_Plano_Contas;

implementation

uses udmRel_Plano_Contas, ufRel_Plano_Contas_Sintetico;

{$R *.dfm}

procedure TfRel_Plano_Contas.btnNovoClick(Sender: TObject);
begin
  if ((edtDtInicio.Date <= 0) or (edtDtFim.Date <= 0)) or
     (edtDtInicio.Date > edtDtFim.Date) then begin
    funcBasico.Alerta('Informe um período corretamente antes de continuar.',1);
    Exit;
  end;
  try
    funcBasico.MSGAguarde();
    btnImprimir.Enabled := false;
    with dmRel_Plano_Contas.cdsListaPlano do begin
      Close;
      CommandText := GeraSQL;
      Open;
      if not IsEmpty then begin
        try
          if fRel_Plano_Contas_Sintetico = nil then
            fRel_Plano_Contas_Sintetico := TfRel_Plano_Contas_Sintetico.Create(nil);
          with fRel_Plano_Contas_Sintetico do begin
            dtInicio := edtDtInicio.Date;
            dtFim    := edtDtFim.Date;
            intAtivo := rdAtivo.ItemIndex;
            intTipo  := rdTipo.ItemIndex;
            lbTit01.Caption  := 'Ativo:    ';
            lbFild01.Caption := rdAtivo.Items[rdAtivo.ItemIndex];
            lbTit02.Caption  := 'Tipo: ';
            lbFild02.Caption := rdTipo.Items[rdTipo.ItemIndex];
            lbTit03.Caption  := 'Período:  ';
            lbFild03.Caption := '';
            if (edtDtInicio.Date > 0) then
              lbFild03.Caption := lbFild03.Caption + edtDtInicio.Text;
            if (edtDtFim.Date > 0) then
              lbFild03.Caption := lbFild03.Caption + ' à ' + edtDtFim.Text;
            if (edtDtInicio.Date <= 0) and (edtDtFim.Date <= 0) then begin
              lbTit03.Enabled  := false;
              lbFild03.Enabled := false;
            end;
          end;
          case rdOpcao_Impressao.ItemIndex of
            0 : fRel_Plano_Contas_Sintetico.qrepRelatorio.Preview;
            1 : fRel_Plano_Contas_Sintetico.qrepRelatorio.Print;
          end;
        finally
          FreeAndNil(fRel_Plano_Contas_Sintetico);
        end;
      end else funcBasico.Alerta('Não há registros a serem impressos.',1);
    end;
  finally
    btnImprimir.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

function TfRel_Plano_Contas.GeraSQL : String;
var
  sltTMP : TStringList;
begin
  try
    sltTMP := TStringList.Create;
    try
      with sltTMP do begin
        Clear;
        Add('SELECT');
        Add('      PLCT_ID,');
        Add('      PLCT_COD_SIMPLIFICADO,');
        Add('      PLCT_DESCRICAO,');
        Add('      PLCT_TIPO');
        Add('FROM  PLANO_CONTAS');
        Add('WHERE PLCT_EMPR_ID = 0');
        case rdAtivo.ItemIndex of
          0 : Add('AND   PLCT_ATIVO   = 1');
          1 : Add('AND   PLCT_ATIVO   = 0');
        end;
        case rdTipo.ItemIndex of
          0 : Add('AND PLCT_TIPO = ' + QuotedStr('C'));
          1 : Add('AND PLCT_TIPO = ' + QuotedStr('D'));
        end;
        Add('AND   PLCT_PLCT_ID IS NULL');
        Add('AND   PLCT_SISTEMA = 0');
        Add('ORDER BY');
        Add('      PLCT_COD_SIMPLIFICADO');
      end;
//      showmessage(slttmp.text);
      Result := sltTMP.Text;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'GeraSQL',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do relatório.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    FreeAndNil(sltTMP);
  end;
end;

procedure TfRel_Plano_Contas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmRel_Plano_Contas);
  FreeAndNil(fRel_Plano_Contas_Sintetico);
end;

procedure TfRel_Plano_Contas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  if dmRel_Plano_Contas = nil then
    dmRel_Plano_Contas := TdmRel_Plano_Contas.Create(NIl);
  inherited;
  OpenClientDataSet;
  edtDtInicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDtFim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
end;

procedure TfRel_Plano_Contas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfRel_Plano_Contas.FormShow(Sender: TObject);
begin
  inherited;
  edtDtInicio.SetFocus;
end;

procedure TfRel_Plano_Contas.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfRel_Plano_Contas.OpenClientDataSet;
begin

end;

procedure TfRel_Plano_Contas.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfRel_Plano_Contas);
finalization
  UnRegisterClass(TfRel_Plano_Contas);

end.
