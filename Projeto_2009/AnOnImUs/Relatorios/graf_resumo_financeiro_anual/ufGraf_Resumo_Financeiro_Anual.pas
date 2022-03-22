unit ufGraf_Resumo_Financeiro_Anual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  SQLExpr, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfGraf_Resumo_Financeiro_Anual = class(TfBasico)
    Panel1: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Image18: TImage;
    lbTotCred: TLabel;
    lbTotDeb: TLabel;
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    rdTipo: TRadioGroup;
    Panel3: TPanel;
    Label115: TLabel;
    Image19: TImage;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Image20: TImage;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Image21: TImage;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    lbTitTot1: TLabel;
    lbTitTot2: TLabel;
    lbTitTot3: TLabel;
    lbTitTot4: TLabel;
    lbTitTot5: TLabel;
    lbTitTot6: TLabel;
    lbTitTot7: TLabel;
    lbTitTot8: TLabel;
    lbTitTot9: TLabel;
    lbTitTot10: TLabel;
    lbTitTot11: TLabel;
    lbTitTot12: TLabel;
    lbCrec1: TLabel;
    lbDeb1: TLabel;
    lbTotCred1: TLabel;
    lbPercCrec1: TLabel;
    lbPercDeb1: TLabel;
    lbCrec2: TLabel;
    lbPercCrec2: TLabel;
    lbPercDeb2: TLabel;
    lbDeb2: TLabel;
    lbTotCred2: TLabel;
    lbCrec3: TLabel;
    lbDeb3: TLabel;
    lbTotCred3: TLabel;
    lbPercCrec3: TLabel;
    lbPercDeb3: TLabel;
    lbTotCred4: TLabel;
    lbDeb4: TLabel;
    lbPercDeb4: TLabel;
    lbPercCrec4: TLabel;
    lbCrec4: TLabel;
    lbCrec5: TLabel;
    lbPercCrec5: TLabel;
    lbPercDeb5: TLabel;
    lbDeb5: TLabel;
    lbTotCred5: TLabel;
    lbTotCred6: TLabel;
    lbPercDeb6: TLabel;
    lbDeb6: TLabel;
    lbCrec6: TLabel;
    lbPercCrec6: TLabel;
    lbTotCred7: TLabel;
    lbPercDeb7: TLabel;
    lbDeb7: TLabel;
    lbCrec7: TLabel;
    lbPercCrec7: TLabel;
    lbCrec8: TLabel;
    lbPercCrec8: TLabel;
    lbDeb8: TLabel;
    lbPercDeb8: TLabel;
    lbTotCred8: TLabel;
    lbCrec9: TLabel;
    lbPercCrec9: TLabel;
    lbDeb9: TLabel;
    lbPercDeb9: TLabel;
    lbTotCred9: TLabel;
    lbTotCred10: TLabel;
    lbDeb10: TLabel;
    lbPercDeb10: TLabel;
    lbPercCrec10: TLabel;
    lbCrec10: TLabel;
    lbCrec11: TLabel;
    lbPercCrec11: TLabel;
    lbDeb11: TLabel;
    lbPercDeb11: TLabel;
    lbTotCred11: TLabel;
    lbTotCred12: TLabel;
    lbDeb12: TLabel;
    lbPercDeb12: TLabel;
    lbCrec12: TLabel;
    lbPercCrec12: TLabel;
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    floatCrec : array[1..12] of Real;
    floatDeb  : array[1..12] of Real;
    procedure CarregaCombo;
    procedure Receitas;
    procedure Despesas;
    procedure ApresentaValor;
  public
    { Public declarations }
  end;

var
  fGraf_Resumo_Financeiro_Anual: TfGraf_Resumo_Financeiro_Anual;

implementation

{$R *.dfm}

procedure TfGraf_Resumo_Financeiro_Anual.FormCreate(Sender: TObject);
var
  formPrinc : TForm;
begin
  formPrinc  := Application.MainForm;
  funcBasico := TFuncoes(formPrinc.FindComponent('funcPrincipal'));
//  inherited;
end;

procedure TfGraf_Resumo_Financeiro_Anual.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Resumo_Financeiro_Anual.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnFiltrar.Click;
end;

procedure TfGraf_Resumo_Financeiro_Anual.btnFiltrarClick(Sender: TObject);
var
  intI : Integer;
begin
  try
    funcBasico.MSGAguarde();
    btnFiltrar.Enabled := true;

    ////Limpando os vetores
    for intI := 1 to 12 do begin
      floatCrec[intI] := 0;
      floatDeb[intI]  := 0;
    end;

    ////Receitas dos meses
    Receitas;

    ////Depesas dos meses
    Despesas;

    ////Apresentando valores
    ApresentaValor;

  finally
    btnFiltrar.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Resumo_Financeiro_Anual.ApresentaValor;
var
  intI : Integer;
  floatPercCred,
  floatPercDeb,
  floatTotCred,
  floatTotDeb    : Real;
  lbTMP          : TLabel;
begin
  floatTotCred := 0;
  floatTotDeb  := 0;
  for intI := 1 to 12 do begin
    floatTotCred := floatTotCred + floatCrec[intI];
    floatTotDeb  := floatTotDeb  + floatDeb[intI];
  end;

  floatPercCred := (floatTotCred / 100);
  floatPercDeb  := (floatTotDeb  / 100);

  for intI := 1 to 12 do begin
    lbTMP := TLabel(Self.FindComponent('lbCrec'+IntToStr(intI)));
    lbTMP.Caption := FormatFloat('###,###,##0.00',floatCrec[intI]);

    lbTMP := TLabel(Self.FindComponent('lbDeb'+IntToStr(intI)));
    lbTMP.Caption := FormatFloat('###,###,##0.00',floatDeb[intI]);

    lbTMP := TLabel(Self.FindComponent('lbTotCred'+IntToStr(intI)));
    lbTMP.Caption := FormatFloat('###,###,##0.00',(floatCrec[intI] - floatDeb[intI]));

    if ((floatCrec[intI] - floatDeb[intI]) < 0) then begin
      lbTMP.Font.Color := clRed;
      lbTMP := TLabel(Self.FindComponent('lbTitTot'+IntToStr(intI)));
      lbTMP.Font.Color := clRed;
    end;

    lbTMP := TLabel(Self.FindComponent('lbPercCrec'+IntToStr(intI)));
    try
      lbTMP.Caption := FormatFloat('0.00',(floatCrec[intI] / floatPercCred));
    except
      lbTMP.Caption := FormatFloat('0.00',0);
    end;

    lbTMP := TLabel(Self.FindComponent('lbPercDeb'+IntToStr(intI)));
    try
      lbTMP.Caption := FormatFloat('0.00',(floatDeb[intI] / floatPercDeb));
    except
      lbTMP.Caption := FormatFloat('0.00',0);
    end;

  end;
  lbTotCred.Caption := FormatFloat('###,###,##0.00',floatTotCred);
  lbTotDeb.Caption  := FormatFloat('###,###,##0.00',floatTotDeb);
end;

procedure TfGraf_Resumo_Financeiro_Anual.CarregaCombo;
var
  Dia,
  Mes,
  Ano  : Word;
  intI : Integer;
begin
  inherited;
  DecodeDate(funcBasico.DataServidor(funcBasico.Conexao),Ano,Mes,Dia);
  for intI := 5 downto 1 do
    cmbAno.Items.Add(IntToStr(Ano - intI));
  cmbAno.Items.Add(IntToStr(Ano));
  cmbAno.ItemIndex := 5;
  for intI := 1 to 5 do
    cmbAno.Items.Add(IntToStr(Ano + intI));
  cmbAno.SetFocus;
end;

procedure TfGraf_Resumo_Financeiro_Anual.Despesas;
var
  qryCons : TSQLQuery;
  intI    : Integer;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        case rdTipo.ItemIndex of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) AS MES,');
            sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
            sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_PAGAR CP');
            sql.Add('ON (AC.ACPG_CPAG_ID      = CP.CPAG_ID');
            sql.Add('AND AC.ACPG_CPAG_EMPR_ID = CP.CPAG_EMPR_ID)');
            sql.Add('WHERE CP.CPAG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
          1 : begin
            SQL.Add('SELECT');
            SQL.Add('      EXTRACT(MONTH FROM CPAG_DTA_VCTO) AS MES,');
            SQL.Add('      COALESCE(SUM(CPAG_VALOR_DOC),0)');
            SQL.Add('FROM  CONTAS_PAGAR');
            SQL.Add('WHERE CPAG_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
            SQL.Add('AND   CPAG_STATUS                     <> ' + QuotedStr('C'));
            SQL.Add('AND   EXTRACT(YEAR FROM CPAG_DTA_VCTO) = ' + cmbAno.Text);
            SQL.Add('GROUP BY');
            SQL.Add('      1');
          end;
        end;
        Open;
        First;
        while not eof do begin
          for intI := 1 to 12 do begin
            if intI = qryCons.Fields[0].AsInteger then
              floatDeb[intI] := qryCons.Fields[1].AsFloat;
          end;
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'Totalizadores',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do gráfico.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfGraf_Resumo_Financeiro_Anual.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Resumo_Financeiro_Anual.grdBasicoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  inherited;
end;

procedure TfGraf_Resumo_Financeiro_Anual.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfGraf_Resumo_Financeiro_Anual.Receitas;
var
  qryCons : TSQLQuery;
  intI    : Integer;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        case rdTipo.ItemIndex of
          0 : begin
            sql.Add('SELECT');
            sql.Add('      EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) AS MES,');
            sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
            sql.Add('INNER JOIN CONTAS_RECEBER CR');
            sql.Add('ON (AC.ACRE_CREC_ID      = CR.CREC_ID');
            sql.Add('AND AC.ACRE_CREC_EMPR_ID = CR.CREC_EMPR_ID)');
            sql.Add('WHERE CR.CREC_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            sql.Add('GROUP BY 1');
          end;
          1 : begin
            sql.Add('SELECT');
            sql.Add('      EXTRACT(MONTH FROM CREC_DTA_VCTO) AS MES,');
            sql.Add('      COALESCE(SUM(CREC_VALOR_DOC),0)');
            sql.Add('FROM  CONTAS_RECEBER');
            sql.Add('WHERE CREC_EMPR_ID                     = ' + IntToStr(funcBasico.Empr_ID));
            sql.Add('AND   CREC_STATUS                     <> ' + QuotedStr('C'));
            sql.Add('AND   EXTRACT(YEAR FROM CREC_DTA_VCTO) = ' + cmbAno.Text);
            sql.Add('GROUP BY');
            sql.Add('      1');
          end;
        end;
        Open;
        First;
        while not eof do begin
          for intI := 1 to 12 do begin
            if intI = qryCons.Fields[0].AsInteger then
              floatCrec[intI] := qryCons.Fields[1].AsFloat;
          end;
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'Totalizadores',e.Message);
      funcBasico.Alerta('Erro no processo de montagem do gráfico.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;


procedure TfGraf_Resumo_Financeiro_Anual.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfGraf_Resumo_Financeiro_Anual);

finalization
  UnRegisterClass(TfGraf_Resumo_Financeiro_Anual);

end.
