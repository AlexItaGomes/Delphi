unit ufEntradaNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  SQLExpr, Menus, Mask, rxToolEdit, uFrPesqIndividual, frxClass, frxDBSet,
  frxDesgn;

type
  TfEntradaNotaFiscal = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    rdStatus: TRadioGroup;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    frPesqFornec: TfrPesqIndividual;
    GroupBox1: TGroupBox;
    edtDtCadInicial: TDateEdit;
    edtDtCadFim: TDateEdit;
    GroupBox2: TGroupBox;
    edtDtEmissaoInicial: TDateEdit;
    edtDtEmissaoFim: TDateEdit;
    GroupBox3: TGroupBox;
    edtDtEntrInicial: TDateEdit;
    edtDtEntrFim: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    procedure OpenClientDataSet(intPos: Integer);
    procedure CancelaTitulo(intPos: Integer);
    function  EstornaEstoque : boolean;
    function  EstornaFinanceiro : Boolean;
    function CancelarTitulo(strCPAG_ID: String) : Boolean;
    procedure RetornaQtdeEstoque;
    function GerarFilter: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEntradaNotaFiscal: TfEntradaNotaFiscal;

implementation

uses udmEntradaNotaFiscal, ufCad_EntradaNotaFiscal;

{$R *.dfm}

procedure TfEntradaNotaFiscal.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
  end;
  rdStatus.ItemIndex := 3;
  frPesqFornec.SetFocus;
  cdsGeral.Filtered := false;
  frPesqFornec.Limpar;
end;

procedure TfEntradaNotaFiscal.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  with dmEntradaNotaFiscal.cdsEntradaNotaFiscal do begin
    Filtered := false;
    Filter   := GerarFilter;
    Filtered := true;
  end;
end;

function TfEntradaNotaFiscal.GerarFilter : String;
var
  strFilter : String;
begin
  strFilter := 'NFEN_ID > 0';
  if frPesqFornec.TemRegistro then
    strFilter := strFilter + ' AND NFEN_FORN_ID ' + frPesqFornec.InGrid();
  if edtDtCadInicial.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_CADASTRO >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtCadInicial.Date));
  if edtDtCadFim.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_CADASTRO <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtCadFim.Date));
  if edtDtEmissaoInicial.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtEmissaoInicial.Date));
  if edtDtEmissaoFim.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtEmissaoFim.Date));
  if edtDtEntrInicial.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_ENTRADA >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtEntrInicial.Date));
  if edtDtEntrFim.Date > 0 then
    strFilter := strFilter + ' AND NFEN_DTA_ENTRADA <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDtEntrFim.Date));
  case rdStatus.ItemIndex of
    0 : strFilter := strFilter + ' AND NFEN_CONCILIADO = 1';
    1 : strFilter := strFilter + ' AND NFEN_CONCILIADO = 0';
    2 : strFilter := strFilter + ' AND NFEN_CONCILIADO = 2';
  end;
  Result := strFilter;
end;

procedure TfEntradaNotaFiscal.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27   : begin
      panelFiltros.Height := 155;
      btnFlat.Caption      := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqFornec.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption      := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfEntradaNotaFiscal.btnNovoClick(Sender: TObject);

function ReturnMsg(intTipo : Integer) : String;
begin
  case intTipo of
    0 : Result := 'A T E N Ç Ã O ! ! !'+#13+#13+
                  'Você optou pelo definitivo cancelamento do registro, após esta etapa o registro não poderá mais ser utilizado.'+#13+#13+
                  'Deseja continuar?';

    1 : Result := 'I M P O R T A N T E ! ! !'+#13+#13+
                  'Você optou por realizar o cancelamento '+
                  'de um registro já conciliado, se você continuar o sistema também '+
                  'cancelará os lançamento realizados pelo registro como Estoque/Financeiro.'+#13+#13+
                  'OBS.: Após o cancelamento desta etapa o registro voltará a consta como '+
                  'aberto podendo ser alterado quando você achar necessário ou se preferir '+
                  'o seu definitivo cancelamento, basta realizar o mesmo procedimento de cancelamento novamente.'+#13+#13+
                  'Deseja continuar?';
  end;
end;

begin
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then begin
    inherited;
  end else begin
    try
      if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
        if (btnExcluir.Enabled) then begin
          if formCadastro <> nil then begin
            if (cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger in [0,1]) then begin
              if funcBasico.Alerta('Confirma o cancelamento do registro selecionado?',1,true) = 6 then begin
                if funcBasico.Alerta(ReturnMsg(cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger),1,true) = 6 then begin
                  if cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger = 1 then begin
                    if not EstornaEstoque then begin
                      funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                                        'Não será possível o cancelamento do registro.'+#13+
                                        'Algum(ns) produto(s) não contém estoque suficiente para realizar o estorno.',1);
                      Exit;
                    end else begin
                      RetornaQtdeEstoque;
                    end;
                    if not EstornaFinanceiro then begin
                      funcBasico.Alerta('A T E N Ç Ã O ! ! ! '+#13+#13+
                                        'Não foi possível realizar o cancelamento de '+
                                        'todos os títulos vinculados ao registro, verifique a '+
                                        'possibilidade de cancelamento manual dos títulos.',1);
                      Exit;
                    end;
                  end;
                  CancelaTitulo(cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger);
                end;
              end;
            end else funcBasico.Alerta('Registro já cancelado!',1);
          end;
        end;
      end else funcBasico.Alerta('Não há registro a ser cancelado!',1);
    except on e: exception do
      funcBasico.ReportaErro(Caption,'btnExcluir',e.Message);
    end;
  end;
  OpenClientDataSet(1);
end;

{*******************************************************************************
Data:       19/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para realizar o estorno dos estoque do produto.

Historico
Data          Autor             Descrição
19/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
procedure TfEntradaNotaFiscal.RetornaQtdeEstoque;
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
        sql.Add('SELECT');
        sql.Add('      NFIT_PROD_ID,');
        sql.Add('      NFIT_QTDE');
        sql.Add('FROM  NOTA_FISCAL_ITENS');
        sql.Add('WHERE NFIT_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   NFIT_NFEN_ID      = ' + cdsGeral.FieldByName('NFEN_ID').AsString);
        sql.Add('AND   NFIT_NFEN_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Open;
        First;
        while not eof do begin
          funcBasico.MovimentaEstoque(qryCons.Fields[0].AsString,(qryCons.Fields[1].AsFloat * -1),1,'2');
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'RetornaQtdeEstoque',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Data:       17/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para o cancelamento dos titulos lançados no contas a pagar,
            gerados automaticamente pela entrada da nota fiscal.

Historico
Data          Autor             Descrição
17/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
function TfEntradaNotaFiscal.EstornaFinanceiro : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      CPAG_ID,');
        sql.Add('      CPAG_VALOR_PAGO');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_EMPR_ID           = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CPAG_NFAC_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CPAG_NFAC_NFEN_ID      = ' + cdsGeral.FieldByName('NFEN_ID').AsString);
        sql.Add('AND   CPAG_NFAC_NFEN_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CPAG_STATUS           <> ' + QuotedStr('C'));
//        showmessage(qrycons.text);
        Open;
        if not IsEmpty then begin
          First;
          while not eof do begin
            try
              if qryCons.Fields[1].AsFloat > 0 then begin
                funcBasico.LancamentoLivroCaixa('146','3',qryCons.Fields[0].AsString,IntToStr(funcBasico.Empr_ID),'0','0','11','3',qryCons.Fields[1].AsFloat);
              end;
              Result := CancelarTitulo(qryCons.Fields[0].AsString);
              if not Result then begin
                Exit;
              end;
            except
              Result := false;
              Exit;
            end;
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'EstornaFinanceiro',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento dos títulos.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Data:       19/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para setar os valores do titulo do contas a pagar ao
            cancela-lo

Historico
Data          Autor             Descrição
19/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
function TfEntradaNotaFiscal.CancelarTitulo(strCPAG_ID : String) : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
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
        sql.Add('UPDATE CONTAS_PAGAR');
        sql.Add('SET    CPAG_STATUS           = ' + QuotedStr('C'));
        sql.Add('      ,CPAG_VALOR_PAGO       = 0');
        sql.Add('      ,CPAG_USER_ID_CANC     = ' + IntToStr(funcBasico.User_ID));
        sql.Add('      ,CPAG_DTA_CANC         = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))));
        sql.Add('      ,CPAG_MOTIVO_CANC      = ' + QuotedStr('CANCELAMENTO AUTOMATICO PELA ENTRADA NOTA FISCAL'));
        sql.Add('WHERE CPAG_ID                = ' + strCPAG_ID);
        sql.Add('AND   CPAG_EMPR_ID           = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CPAG_NFAC_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   CPAG_NFAC_NFEN_ID      = ' + cdsGeral.FieldByName('NFEN_ID').AsString);
        sql.Add('AND   CPAG_NFAC_NFEN_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        ExecSQL;
        try
          funcBasico.Commit;
        except
        end;
      end;
    except on e: exception do begin
      Result := false;
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'CancelarTitulo',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamentos dos títulos.'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Data:       17/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para a verificação de estoque disponivel para o cancelamento
            dos itens lançados na nota fiscal.

Historico
Data          Autor             Descrição
17/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
function TfEntradaNotaFiscal.EstornaEstoque : Boolean;
var
  qryCons : TSQLQuery;
begin
  try
    Result  := true;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      NFIT_PROD_ID,');
        sql.Add('      NFIT_QTDE');
        sql.Add('FROM  NOTA_FISCAL_ITENS');
        sql.Add('WHERE NFIT_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND   NFIT_NFEN_ID      = ' + cdsGeral.FieldByName('NFEN_ID').AsString);
        sql.Add('AND   NFIT_NFEN_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Open;
        First;
        while not eof do begin
          if not funcBasico.ProdutoTemEstoque(qryCons.Fields[0].AsString,qryCons.Fields[1].AsFloat,3) then begin
            Result := false;
            Exit;
          end;
          Next;
        end;
      end;
    except on e: exception do begin
      funcBasico.ReportaErro(Caption,'EstornaEstoque',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

{*******************************************************************************
Data:       17/03/2010
Autor:      Alex Itamar Gomes
Descrição:  Metodo para alterar o status do registro de nota fiscal

Parametros: intPos - 0 - Nota não conciliada, passa para o valor 2 - Cancelada
                     1 - Nota já conciliada, passa para o valor 0 - Ñ Conciliada

Historico
Data          Autor             Descrição
17/03/2010    Alex I. Gomes     Inclusão do Cabeçalho
*******************************************************************************}
procedure TfEntradaNotaFiscal.CancelaTitulo(intPos : Integer);
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
        sql.Add('UPDATE NOTA_FISCAL');
        case intPos of
          0 : sql.Add('SET    NFEN_CONCILIADO = 2');
          1 : sql.Add('SET    NFEN_CONCILIADO = 0');
        end;
        sql.Add('WHERE  NFEN_ID         = ' + cdsGeral.FieldByName('NFEN_ID').AsString);
        sql.Add('AND    NFEN_EMPR_ID    = ' + IntToStr(funcBasico.Empr_ID));
        ExecSQL;
        try
          funcBasico.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'CancelaTitulo',e.Message);
      funcBasico.Alerta('Erro no processo de cancelamento do registro.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfEntradaNotaFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral         := dmEntradaNotaFiscal.cdsEntradaNotaFiscal;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  formCadastro      := fCad_EntradaNotaFiscal;
  with fCad_EntradaNotaFiscal do begin
    cdsLocal        := dmEntradaNotaFiscal.cdsEntradaNotaFiscal;
    funcLocal       := Self.funcBasico;
  end;
  btnImprimir.Tag     := 428;
  panelFiltros.Height := 27;
end;

procedure TfEntradaNotaFiscal.FormShow(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfEntradaNotaFiscal.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('NFEN_CONCILIADO') then begin
    if cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger = 0 then begin
      grdBasico.Canvas.Brush.Color := $006666FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Não Conciliado   ');
    end;
    if cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger = 1 then begin
      grdBasico.Canvas.Brush.Color := $008CFF8C;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Conciliado       ');
    end;
    if cdsGeral.FieldByName('NFEN_CONCILIADO').AsInteger = 2 then begin
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

procedure TfEntradaNotaFiscal.OpenClientDataSet(intPos : Integer);
begin
  with dmEntradaNotaFiscal do begin
    with cdsEntradaNotaFiscal do begin
      Close;
      Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
      Open;
    end;
  end;
end;

initialization
  RegisterClass(TfEntradaNotaFiscal);
finalization
  UnRegisterClass(TfEntradaNotaFiscal);

end.
