unit ufGraf_Contas_Receber_Pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  TeEngine, TeeFunci, Series, TeeProcs, Chart, SQLExpr, Menus, frxClass,
  frxDBSet, frxDesgn, VclTee.TeeGDIPlus;

type
  TfGraf_Contas_Receber_Pagar = class(TfBasico)
    GroupBox1: TGroupBox;
    cmbAno: TComboBox;
    btnFiltrar: TBitBtn;
    rdTipo: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    chartJaneiro: TChart;
    Series2: TBarSeries;
    chartFevereiro: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    chartMarco: TChart;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    chartAbril: TChart;
    BarSeries5: TBarSeries;
    BarSeries6: TBarSeries;
    chartMaio: TChart;
    BarSeries7: TBarSeries;
    BarSeries8: TBarSeries;
    chartJunho: TChart;
    BarSeries9: TBarSeries;
    BarSeries10: TBarSeries;
    chartJulho: TChart;
    BarSeries11: TBarSeries;
    BarSeries12: TBarSeries;
    chartAgosto: TChart;
    BarSeries13: TBarSeries;
    BarSeries14: TBarSeries;
    chartSetembro: TChart;
    BarSeries15: TBarSeries;
    BarSeries16: TBarSeries;
    chartOutubro: TChart;
    BarSeries17: TBarSeries;
    BarSeries18: TBarSeries;
    chartNovembro: TChart;
    BarSeries19: TBarSeries;
    BarSeries20: TBarSeries;
    chartDezembro: TChart;
    BarSeries21: TBarSeries;
    BarSeries22: TBarSeries;
    Series1: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure cmbAnoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure CarregaCombo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGraf_Contas_Receber_Pagar: TfGraf_Contas_Receber_Pagar;

implementation

{$R *.dfm}

procedure TfGraf_Contas_Receber_Pagar.cmbAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Contas_Receber_Pagar.FormCreate(Sender: TObject);
var
  intI : Integer;
begin
  inherited;
  try
    for intI := 0 to ComponentCount - 1 do begin
      if (Components[intI] is TChart) then begin
        (Components[intI] as TChart).Series[0].Clear;
        (Components[intI] as TChart).Series[1].Clear;
      end;      
    end;
  except
  end;
end;

procedure TfGraf_Contas_Receber_Pagar.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #27 then begin
    key := #0;
    Self.Close;
  end;
end;

procedure TfGraf_Contas_Receber_Pagar.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo;
  btnFiltrar.Click;
end;

procedure TfGraf_Contas_Receber_Pagar.grdBasicoDblClick(Sender: TObject);
begin
//  inherited; 
end;

procedure TfGraf_Contas_Receber_Pagar.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfGraf_Contas_Receber_Pagar.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfGraf_Contas_Receber_Pagar.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

procedure TfGraf_Contas_Receber_Pagar.btnFiltrarClick(Sender: TObject);

{$REGION 'C. Receber'}
  function RecJaneiro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 01');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 01');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecJaneiro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecFevereiro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 02');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 02');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecFevereiro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
         
  function RecMarco : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 03');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 03');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecMarco',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecAbril : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 04');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 04');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecAbril',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecMaio : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 05');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 05');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecMaio',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecJunho : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 06');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 06');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecJunho',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecJulho : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 07');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 07');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecJulho',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;   
  
  function RecAgosto : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 08');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 08');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecAgosto',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecSetembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 09');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 09');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecSetembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecOutubro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 10');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 10');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecOutubro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecNovembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 11');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 11');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecNovembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function RecDezembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACRE_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_RECEBER CR');
              sql.Add('ON (AC.ACRE_CREC_ID       = CR.CREC_ID');
              sql.Add('AND AC.ACRE_CREC_EMPR_ID  = CR.CREC_EMPR_ID)');
              sql.Add('WHERE AC.ACRE_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACRE_DTA_CADASTRO) = 12');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACRE_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CR.CREC_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_RECEBER CR');
              sql.Add('WHERE CR.CREC_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CR.CREC_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CR.CREC_DTA_VCTO) = 12');
              sql.Add('AND   EXTRACT(YEAR FROM CR.CREC_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'RecDezembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'C. Pagar'}
  function PagJaneiro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 01');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 01');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagJaneiro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagFevereiro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 02');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 02');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagFevereiro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagMarco : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 03');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 03');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagMarco',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagAbril : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 04');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 04');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagAbril',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagMaio : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 05');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 05');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagMaio',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagJunho : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 06');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 06');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagJunho',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagJulho : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 07');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 07');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagJulho',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagAgosto : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 08');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 08');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagAgosto',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagSetembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 09');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 09');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagSetembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagOutubro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 10');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 10');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagOutubro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagNovembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;
      try
        with qryCons do begin
          Close;                                                    
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 11');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 11');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;                                                  
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagNovembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
  function PagDezembro : Real;
  var
    qryCons : TSQLQuery;
  begin
    try
      Result  := 0;
      qryCons := TSQLQuery.Create(nil);
      qryCons.SQLConnection := funcBasico.Conexao;    
      try
        with qryCons do begin
          Close;
          sql.Clear;
          case rdTipo.ItemIndex of
            0 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(AC.ACPG_VALOR_DOC * -1),0)');
              sql.Add('FROM  CONTAS_PAGAR_ACERTOS AC');
              sql.Add('INNER JOIN CONTAS_PAGAR CP');
              sql.Add('ON (AC.ACPG_CPAG_ID       = CP.CPAG_ID');
              sql.Add('AND AC.ACPG_CPAG_EMPR_ID  = CP.CPAG_EMPR_ID)');
              sql.Add('WHERE AC.ACPG_EMPR_ID                          = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                          <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM AC.ACPG_DTA_CADASTRO) = 12');
              sql.Add('AND   EXTRACT(YEAR FROM AC.ACPG_DTA_CADASTRO)  = ' + cmbAno.Text);
            end;
            1 : begin
              sql.Add('SELECT');
              sql.Add('      COALESCE(SUM(CP.CPAG_VALOR_DOC),0)');
              sql.Add('FROM  CONTAS_PAGAR CP');
              sql.Add('WHERE CP.CPAG_EMPR_ID                      = ' + IntToStr(funcBasico.Empr_ID));
              sql.Add('AND   CP.CPAG_STATUS                      <> ' + QuotedStr('C'));
              sql.Add('AND   EXTRACT(MONTH FROM CP.CPAG_DTA_VCTO) = 12');
              sql.Add('AND   EXTRACT(YEAR FROM CP.CPAG_DTA_VCTO)  = ' + cmbAno.Text);
            end;
          end;
          Open;
        end;
        Result := qryCons.Fields[0].AsFloat;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'PagDezembro',e.Message);
        funcBasico.Alerta('Erro no processo de criação do gráfico.'+#13+'['+e.Message+']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
  floatRec01,
  floatRec02,
  floatRec03,
  floatRec04,
  floatRec05,
  floatRec06,
  floatRec07,
  floatRec08,
  floatRec09,
  floatRec10,
  floatRec11,
  floatRec12,
  floatPag01,
  floatPag02,
  floatPag03,
  floatPag04,
  floatPag05,
  floatPag06,
  floatPag07,
  floatPag08,
  floatPag09,
  floatPag10,
  floatPag11,
  floatPag12 : Real;
begin
  try
    funcBasico.MSGAguarde();
    btnFiltrar.Enabled := false;

    floatRec01 := RecJaneiro;
    floatRec02 := RecFevereiro;
    floatRec03 := RecMarco;
    floatRec04 := RecAbril;
    floatRec05 := RecMaio;
    floatRec06 := RecJunho;
    floatRec07 := RecJulho;
    floatRec08 := RecAgosto;
    floatRec09 := RecSetembro;
    floatRec10 := RecOutubro;
    floatRec11 := RecNovembro;
    floatRec12 := RecDezembro;
    floatPag01 := PagJaneiro;
    floatPag02 := PagFevereiro;
    floatPag03 := PagMarco;
    floatPag04 := PagAbril;
    floatPag05 := PagMaio;
    floatPag06 := PagJunho;
    floatPag07 := PagJulho;
    floatPag08 := PagAgosto;
    floatPag09 := PagSetembro;
    floatPag10 := PagOutubro;
    floatPag11 := PagNovembro;
    floatPag12 := PagDezembro;

    with chartJaneiro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec01 ,'C. Receber',clBlue);
      Series[1].Add(floatPag01 ,'C. Pagar',clRed);
      Label2.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec01);
      Label3.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag01);
    end;
    with chartFevereiro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec02 ,'C. Receber',clBlue);
      Series[1].Add(floatPag02 ,'C. Pagar',clRed);
      Label4.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec02);
      Label5.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag02);
    end;
    with chartMarco do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec03 ,'C. Receber',clBlue);
      Series[1].Add(floatPag03 ,'C. Pagar',clRed);
      Label6.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec03);
      Label7.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag03);
    end;
    with chartAbril do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec04 ,'C. Receber',clBlue);
      Series[1].Add(floatPag04 ,'C. Pagar',clRed);
      Label8.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec04);
      Label9.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag04);
    end;
    with chartMaio do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec05 ,'C. Receber',clBlue);
      Series[1].Add(floatPag05 ,'C. Pagar',clRed);
      Label14.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec05);
      Label15.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag05);
    end;
    with chartJunho do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec06 ,'C. Receber',clBlue);
      Series[1].Add(floatPag06 ,'C. Pagar',clRed);
      Label16.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec06);
      Label17.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag06);
    end;
    with chartJulho do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec07 ,'C. Receber',clBlue);
      Series[1].Add(floatPag07 ,'C. Pagar',clRed);
      Label18.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec07);
      Label19.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag07);
    end;
    with chartAgosto do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec08 ,'C. Receber',clBlue);
      Series[1].Add(floatPag08 ,'C. Pagar',clRed);
      Label20.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec08);
      Label21.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag08);
    end;
    with chartSetembro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec09 ,'C. Receber',clBlue);
      Series[1].Add(floatPag09 ,'C. Pagar',clRed);
      Label22.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec09);
      Label23.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag09);
    end;
    with chartOutubro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec10 ,'C. Receber',clBlue);
      Series[1].Add(floatPag10 ,'C. Pagar',clRed);
      Label24.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec10);
      Label25.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag10);
    end;
    with chartNovembro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec11 ,'C. Receber',clBlue);
      Series[1].Add(floatPag11 ,'C. Pagar',clRed);
      Label26.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec11);
      Label27.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag11);
    end;
    with chartDezembro do begin
      Series[0].Clear;
      Series[1].Clear;
      Series[0].Add(floatRec12 ,'C. Receber',clBlue);
      Series[1].Add(floatPag12 ,'C. Pagar',clRed);
      Label28.Caption := 'C. Receber: ' + FormatFloat('###,###,##0.00',floatRec12);
      Label29.Caption := 'C. Pagar: ' + FormatFloat('###,###,##0.00',floatPag12);
    end;
  finally
    btnFiltrar.Enabled := true;
    funcBasico.MSGAguarde(false);
  end;
end;

procedure TfGraf_Contas_Receber_Pagar.CarregaCombo;
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

initialization
  RegisterClass(TfGraf_Contas_Receber_Pagar);
finalization
  UnRegisterClass(TfGraf_Contas_Receber_Pagar);

end.
