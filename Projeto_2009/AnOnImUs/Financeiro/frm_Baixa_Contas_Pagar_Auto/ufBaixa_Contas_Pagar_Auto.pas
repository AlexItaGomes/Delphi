unit ufBaixa_Contas_Pagar_Auto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  Mask, rxToolEdit, SQLExpr, ImgList, rxCurrEdit, DateUtils, Menus,
  uFrPesqIndividual, frxClass, frxDBSet, frxDesgn;

type
  TfBaixa_Contas_Pagar_Auto = class(TfBasico)
    panelFiltros: TPanel;
    btnFlat: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    GroupBox2: TGroupBox;
    edtDt_Vcto_Inicio: TDateEdit;
    edtDt_Vcto_Fim: TDateEdit;
    btnFiltrar: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    edtTotal: TRxCalcEdit;
    Label9: TLabel;
    GroupBox5: TGroupBox;
    edtDt_Emissao_Inicio: TDateEdit;
    edtDt_Emissao_Fim: TDateEdit;
    ImageList2: TImageList;
    N1: TMenuItem;
    Alterardatadevencimentodosttulosselecionados2: TMenuItem;
    AlterarValordosTtulos2: TMenuItem;
    frPesqFornec: TfrPesqIndividual;
    frPesqPlanoContas: TfrPesqIndividual;
    frPesqTipoDoc: TfrPesqIndividual;
    mmAlterPlano: TMenuItem;
    mmAlterFornecedor: TMenuItem;
    frPesqContaBancaria: TfrPesqIndividual;
    ckMarca: TCheckBox;
    mmAlterContaBancaria: TMenuItem;
    ckPrevisoes: TCheckBox;
    ReverterTtuloPrevisoSlido1: TMenuItem;
    N2: TMenuItem;
    lbTotal: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdBasicoCellClick(Column: TColumn);
    procedure Timer1Timer(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Alterardatadevencimentodosttulosselecionados2Click(
      Sender: TObject);
    procedure AlterarValordosTtulos2Click(Sender: TObject);
    procedure mmAlterFornecedorClick(Sender: TObject);
    procedure ckMarcaClick(Sender: TObject);
    procedure ReverterTtuloPrevisoSlido1Click(Sender: TObject);
    procedure frPesqTipoDocedtCodigoExit(Sender: TObject);
    procedure frPesqTipoDocckOmitirClick(Sender: TObject);
    procedure frPesqContaBancariabtnPesquisarClick(Sender: TObject);
  private
    floatValor  : Real;
    sltMarcados : TStringList;
    procedure OpenClientDataSet(intPos : Integer = 99);
    function  GeraFilter: String;
    procedure BaixaTitulos(strCPAG_ID: String);
    procedure BaixaTitulosBanco(strCPAG_ID: String);
    procedure SetaValoresFrames;
    procedure BaixaTitulosPrevisao(strCPAG_ID: String);
    procedure LancaDadosCartao(strTMP: String);
  public
    { Public declarations }
  end;

var
  fBaixa_Contas_Pagar_Auto: TfBaixa_Contas_Pagar_Auto;

implementation

uses udmBaixa_Contas_Pagar_Auto, ufAlterTitulo;

{$R *.dfm}

procedure TfBaixa_Contas_Pagar_Auto.BitBtn2Click(Sender: TObject);
var
  intI : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TEdit) then
      (Components[intI] as TEdit).Clear;
    if (Components[intI] is TDateEdit) then
      (Components[intI] as TDateEdit).Clear;
    if (Components[intI] is TfrPesqIndividual) then
      (Components[intI] as TfrPesqIndividual).Limpar;
  end;
  frPesqFornec.SetFocus;
  cdsGeral.Filtered := false;
  frPesqTipoDoc.edtCodigo.Modified := true;
  frPesqTipoDocedtCodigoExit(Sender);
end;

procedure TfBaixa_Contas_Pagar_Auto.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  sltMarcados.Clear;
  ckMarca.Checked := false;
  floatValor      := 0;
  edtTotal.Value  := floatValor;
  OpenClientDataSet(1);
end;

procedure TfBaixa_Contas_Pagar_Auto.btnFlatClick(Sender: TObject);
begin
  inherited;
  case panelFiltros.Height of
    27 : begin
      panelFiltros.Height := 155;
      btnFlat.Caption     := '<< Clique aqui para recolher';
      btnFlat.Glyph       := Image4.Picture.Bitmap;
      frPesqFornec.SetFocus;
    end;
    155 : begin
      panelFiltros.Height := 27;
      btnFlat.Caption     := '<< Clique aqui para expandir';
      btnFlat.Glyph       := Image3.Picture.Bitmap;
    end;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.btnNovoClick(Sender: TObject);

{$REGION 'ViaLivro'}
  function ViaLivro(strCPAG_ID : String) : Boolean;
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
          sql.Add('      CPAG_VIA_BANCO');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_ID      = ' + strCPAG_ID);
          sql.Add('AND   CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger = 0);
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'ViaLivro',funcBasico.User_Login,e.Message);
        funcBasico.Alerta('Erro no processo de verificação do saldo disponível para baixa dos título(s).'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'TemSaldo'}
  function TemSaldo(sltTMP : TStringList) : Boolean;
  var
    qryCons    : TSQLQuery;
    intI       : Integer;
    strTMP     : String;
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
          sql.Add('      SUM(CPAG_VALOR_DOC - CPAG_VALOR_PAGO)');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          for intI := 0 to sltTMP.Count - 1 do
            strTMP := strTMP + sltTMP.Strings[intI] + ',';
          strTMP   := Copy(strTMP,1,length(strTMP)-1);
          sql.Add('AND   CPAG_ID     IN ('+strTMP+')');
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          Open;
        end;
        Result := funcBasico.TemSaldoLivroCaixa(qryCons.Fields[0].AsFloat);
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'TemSaldo',funcBasico.User_Login,e.Message);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'TemSaldoEmConta'}
  function TemSaldoEmConta(sltTMP : TStringList) : Boolean;
  var
    qryCons    : TSQLQuery;
    intI       : Integer;
    strTMP     : String;
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
          sql.Add('      CPAG_CBCO_ID,');
          sql.Add('      SUM(CPAG_VALOR_DOC - CPAG_VALOR_PAGO)');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          for intI := 0 to sltTMP.Count - 1 do
            strTMP := strTMP + sltTMP.Strings[intI] + ',';
          strTMP   := Copy(strTMP,1,length(strTMP)-1);
          sql.Add('AND   CPAG_ID     IN ('+strTMP+')');
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          sql.Add('GROUP BY');
          sql.Add('      CPAG_CBCO_ID');
          Open;
          First;
          while not eof do begin
            if not funcBasico.TemSaldoEmConta(Fields[0].AsString,Fields[1].AsFloat) then begin
              Result := false;
              Exit;
            end;
            Next;
          end;
        end;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'TemSaldo',funcBasico.User_Login,e.Message);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'ContaBancariaAtiva'}
 function ContaBancariaAtiva(sltTMP : TStringList) : Boolean;
  var
    qryCons    : TSQLQuery;
    intI       : Integer;
    strTMP     : String;
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
          sql.Add('      CPAG_CBCO_ID');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
          for intI := 0 to sltTMP.Count - 1 do
            strTMP := strTMP + sltTMP.Strings[intI] + ',';
          strTMP   := Copy(strTMP,1,length(strTMP)-1);
          sql.Add('AND   CPAG_ID     IN ('+strTMP+')');
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          sql.Add('GROUP BY');
          sql.Add('      CPAG_CBCO_ID');
          Open;
          First;
          while not eof do begin
            if not funcBasico.ContaBancariaAtiva(Fields[0].AsString) then begin
              Result := false;
              Exit;
            end;
            Next;
          end;
        end;
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'ContaBancariaAtiva',funcBasico.User_Login,e.Message);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

{$REGION 'BancoInformado'}
  function BancoInformado(strCPAG_ID : String) : Boolean;
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
          sql.Add('      COALESCE(CPAG_CBCO_ID,0)');
          sql.Add('FROM  CONTAS_PAGAR');
          sql.Add('WHERE CPAG_ID                   = ' + strCPAG_ID);
          sql.Add('AND   CPAG_EMPR_ID              = ' + IntToStr(funcBasico.Empr_ID));
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          Open;
        end;
        Result := (qryCons.Fields[0].AsInteger > 0);
      except on e: exception do begin
        funcBasico.ReportaErro(Caption,'BancoInformado',funcBasico.User_Login,e.Message);
        funcBasico.Alerta('Erro no processo de verificação de conta bancária vinculada ao título.'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

var
  intI     : Integer;
  lstLivro,
  lstBanco : TStringList;
begin
  if sltMarcados.Count > 0 then begin
    if funcBasico.Alerta('Confirma a baixa do(s) título(s) selecionado(s)?',1,true) = 6 then begin
      try
        funcBasico.MSGAguarde();
        lstLivro := TStringList.Create;
        lstBanco := TStringList.Create;
        {Realizando a separação dos titulos Livro Caixa/ Banco}
        try
          for intI := 0 to sltMarcados.Count - 1 do
            //BaixaTitulosPrevisao(sltMarcados.Strings[intI]);

            if ViaLivro(sltMarcados.Strings[intI]) then begin
              lstLivro.Add(sltMarcados.Strings[intI]);
            end else begin
              if BancoInformado(sltMarcados.Strings[intI]) then begin
                lstBanco.Add(sltMarcados.Strings[intI]);
              end else begin
                funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                                  'Um dos títulos selecionados informa que sua baixa e via banco, mas não há um banco vinculado a este título!',0);
                Exit;
              end;
            end;
        except
        end;
        {Verificando o Saldo disponivel em Caixa para baixa dos titulos}
        if lstLivro.Count > 0 then begin
          try
            if not TemSaldo(lstLivro) then begin
              funcBasico.Alerta('Você não possui saldo em caixa suficiente para a baixa do(s) título(s) selecionado(s).',1);
              Exit;
            end;
          except
          end;
        end;
        {Verificando o saldo disponivel em banco para a baixa dos titulos}
        if lstBanco.Count > 0 then begin
          try
            if not ContaBancariaAtiva(lstBanco) then begin
              funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                                'Conta bancária informada no título encontra-se inativa, verifique sua(s) conta(s) bancária(s) antes de continuar!',1);
              Exit;
            end;
            if not TemSaldoEmConta(lstBanco) then begin
              funcBasico.Alerta('Você não possui saldo bancário suficiente para a baixa do(s) título(s) selecionado(s).',1);
              Exit;
            end;
          except
          end;
        end;
        try
          if lstLivro.Count > 0 then
            for intI := 0 to lstLivro.Count - 1 do
              BaixaTitulos(lstLivro.Strings[intI]);
        except
        end;
        try
          if lstBanco.Count > 0 then
            for intI := 0 to lstBanco.Count - 1 do
              BaixaTitulosBanco(lstBanco.Strings[intI]);
        except
        end;
      finally
        funcBasico.MSGAguarde(false);
        FreeAndNil(sltMarcados);
        FreeAndNil(lstLivro);
        FreeAndNil(lstBanco);
        sltMarcados := TStringList.Create;
        OpenClientDataSet;
        try
          btnFiltrar.Click;
        except
        end;
      end;
    end;
  end else funcBasico.Alerta('Não há títulos selecionados para baixa.',1);
end;

procedure TfBaixa_Contas_Pagar_Auto.ckMarcaClick(Sender: TObject);
begin
  inherited;
  try
    if cdsGeral.IsEmpty then ckMarca.Checked := false;    
    cdsGeral.DisableControls;
    cdsGeral.First;
    while not cdsGeral.Eof do begin
      if (Sender as TCheckBox).Checked then begin
        if sltMarcados.IndexOf(cdsGeral.FieldByName('CPAG_ID').AsString) < 0 then begin
          sltMarcados.Add(cdsGeral.FieldByName('CPAG_ID').AsString);
          floatValor := floatValor + cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
        end;
      end else begin
        try
          sltMarcados.Delete(sltMarcados.IndexOf(cdsGeral.FieldByName('CPAG_ID').AsString));
        except
        end;
        floatValor := 0;
      end;
      cdsGeral.Next;
    end;
  finally
    cdsGeral.EnableControls;
    edtTotal.Value := floatValor;
    grdBasico.Refresh;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.BaixaTitulosBanco(strCPAG_ID : String);

{$REGION 'GeraAcerto'}
  procedure GeraAcerto(strPLCT_ID, strGene_ID, strCPAG_ID : String; floatValor : Real);
  var
    qryCons : TSQLQuery;
  begin
    try
      FormatSettings.DecimalSeparator := '.';
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
          sql.Add('INSERT INTO CONTAS_PAGAR_ACERTOS');
          sql.Add('VALUES(' + funcBasico.ObterSequencia('CONTAS_PAGAR_ACERTOS',IntToStr(funcBasico.Empr_ID)) + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + strCPAG_ID                            + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + '0'                                   + ','
                            + '5'                                   + ','
                            + strGene_ID                            + ','
                            + FormatFloat('0.00',(floatValor * -1)) + ','
                            + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))) + ','
                            + IntToStr(funcBasico.User_ID) + ')');
//          ShowMessage(qryCons.Text);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcBasico.RollBack;
        funcBasico.ReportaErro(Caption,'GeraAcerto',funcBasico.User_Login,e.Message);
        funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
      FormatSettings.DecimalSeparator := ',';
    end;
  end;
{$ENDREGION}

var
  qryConsI,
  qryCons  : TSQLQuery;
begin
  try
    qryCons  := TSQLQuery.Create(nil);
    qryConsI := TSQLQuery.Create(nil);
    qryCons.SQLConnection  := funcBasico.Conexao;
    qryConsI.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(CPAG_VALOR_DOC - CPAG_VALOR_PAGO,0) VALOR,');
        sql.Add('      CPAG_PLCT_ID,');
        sql.Add('      CPAG_GENE_ID_TIPO_DOC,');
        SQL.Add('      CPAG_CBCO_ID');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_ID      = ' + strCPAG_ID);
        sql.Add('AND   CPAG_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        Open;
        GeraAcerto(Fields[1].AsString,Fields[2].AsString,strCPAG_ID,Fields[0].AsFloat);
        funcBasico.RegistraMovBancario(Trim(Fields[3].AsString),(Fields[0].AsFloat * -1));
        funcBasico.RegistraMovConta(Fields[3].AsString,'1001','1',strCPAG_ID,(Fields[0].AsFloat * -1));
        with qryConsI do begin
          Close;
          sql.Clear;
          try
            funcBasico.StartCommit;
          except
          end;
          sql.Add('UPDATE CONTAS_PAGAR');
          sql.Add('SET    CPAG_VALOR_PAGO  = CPAG_VALOR_DOC');
          sql.Add('      ,CPAG_STATUS      = ' + QuotedStr('F'));
          sql.Add('      ,CPAG_DTA_PGTO    = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))));
          sql.Add('      ,CPAG_DTA_EFETIVO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))));
          sql.Add('WHERE CPAG_ID           = ' + strCPAG_ID);
          sql.Add('AND   CPAG_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'BaixaTitulosBanco',e.Message);
      funcBasico.Alerta('Erro na baixa do(s) título(s) selecionados.',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.Alterardatadevencimentodosttulosselecionados2Click(
  Sender: TObject);
var
  strTMP     : String;
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  try
    boolCancel := false;
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar a data de vencimento do(s) título(s) selecionado(s),'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if InputQuery('Alterar data de vencimento em X dias','Informe a quantidade de dias que deseja alterar:'+#13+'(Ex.: -5, +5)',strTMP) then begin
            try
              StrToInt(strTMP);
              if funcBasico.AtualizaDtaVectoTitulos(strID,strTMP) then begin
                boolCancel := true;
                OpenClientDataSet;
                btnFiltrar.Click;
                Exit;
              end;
            except
              funcBasico.Alerta('Valor informado inválido!',0);
            end;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else begin
      funcBasico.Alerta('Selecione um título antes de continuar.',0);
      Exit;
    end;
  except
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.AlterarValordosTtulos2Click(
  Sender: TObject);
var
  strTMP     : String;
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  try
    boolCancel := false;
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar o valor do(s) título(s) selecionado(s),'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if InputQuery('Alterar valor do(s) título(s) selecionado(s)','Informe o novo valor do(s) título(s):'+#13+'(Ex.: 150,00)',strTMP) then begin
            try
              StrToFloat(strTMP);
              if funcBasico.AtualizaValorTitulos(strID,strTMP) then begin
                boolCancel := true;
                OpenClientDataSet;
                btnFiltrar.Click;
                Exit;
              end;
            except
              funcBasico.Alerta('Valor informado inválido!',0);
            end;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else Exit;
  except
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.BaixaTitulosPrevisao(strCPAG_ID : String);
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
        sql.Add('UPDATE CONTAS_PAGAR');
        sql.Add('SET    CPAG_PREVISAO             = 0');
        sql.Add('WHERE  CPAG_ID                   = ' + strCPAG_ID);
        sql.Add('AND    CPAG_EMPR_ID              = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('AND    COALESCE(CPAG_PREVISAO,0) = 1');
        ExecSQL;
        try
          funcBasico.Commit;
        except
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'BaixaTitulos',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.BaixaTitulos(strCPAG_ID : String);

{$REGION 'GeraAcerto'}
  procedure GeraAcerto(strPLCT_ID, strGene_ID, strCPAG_ID : String; floatValor : Real);
  var
    qryCons : TSQLQuery;
  begin
    try
      FormatSettings.DecimalSeparator := '.';
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
          sql.Add('INSERT INTO CONTAS_PAGAR_ACERTOS');
          sql.Add('VALUES(' + funcBasico.ObterSequencia('CONTAS_PAGAR_ACERTOS',IntToStr(funcBasico.Empr_ID)) + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + strCPAG_ID                            + ','
                            + IntToStr(funcBasico.Empr_ID)          + ','
                            + '0'                                   + ','
                            + '5'                                   + ','
                            + strGene_ID                            + ','
                            + FormatFloat('0.00',(floatValor * -1)) + ','
                            + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))) + ','
                            + IntToStr(funcBasico.User_ID) + ')');
//          ShowMessage(qryCons.Text);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcBasico.RollBack;
        funcBasico.ReportaErro(Caption,'GeraAcerto',funcBasico.User_Login,e.Message);
        funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1)
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
      FormatSettings.DecimalSeparator := ',';
    end;
  end;
{$ENDREGION}

var
  qryConsI,
  qryCons  : TSQLQuery;
begin
  try
    qryCons  := TSQLQuery.Create(nil);
    qryConsI := TSQLQuery.Create(nil);
    qryCons.SQLConnection  := funcBasico.Conexao;
    qryConsI.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COALESCE(CPAG_VALOR_DOC - CPAG_VALOR_PAGO,0) VALOR,');
        sql.Add('      CPAG_PLCT_ID,');
        sql.Add('      CPAG_GENE_ID_TIPO_DOC');
        sql.Add('FROM  CONTAS_PAGAR');
        sql.Add('WHERE CPAG_ID                    = ' + strCPAG_ID);
        sql.Add('AND   CPAG_EMPR_ID               = ' + IntToStr(funcBasico.Empr_ID));
        //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
        Open;
        GeraAcerto(Fields[1].AsString,Fields[2].AsString,strCPAG_ID,Fields[0].AsFloat);
        funcBasico.LancamentoLivroCaixa(qryCons.Fields[1].AsString,
                                        '2',
                                        strCPAG_ID,
                                        IntToStr(funcBasico.Empr_ID),
                                        '0',
                                        '0',
                                        '11',
                                        '3',
                                        (qryCons.Fields[0].AsFloat * -1));
        with qryConsI do begin
          Close;
          sql.Clear;
          try
            funcBasico.StartCommit;
          except
          end;
          sql.Add('UPDATE CONTAS_PAGAR');
          sql.Add('SET    CPAG_VALOR_PAGO          = CPAG_VALOR_DOC');
          sql.Add('      ,CPAG_STATUS              = ' + QuotedStr('F'));
          sql.Add('      ,CPAG_DTA_PGTO            = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))));
          sql.Add('      ,CPAG_DTA_EFETIVO         = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',funcBasico.DataServidor(funcBasico.Conexao))));
          sql.Add('WHERE CPAG_ID                   = ' + strCPAG_ID);
          sql.Add('AND   CPAG_EMPR_ID              = ' + IntToStr(funcBasico.Empr_ID));
          //sql.Add('AND   COALESCE(CPAG_PREVISAO,0) = 0');
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      end;
    except on e: exception do begin
      funcBasico.RollBack;
      funcBasico.ReportaErro(Caption,'BaixaTitulos',funcBasico.User_Login,e.Message);
      funcBasico.Alerta('Erro no processo de baixa do(s) título(s) selecionado(s).'+#13+'['+e.Message+']',1);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfBaixa_Contas_Pagar_Auto.GeraFilter : String;
var
  strFilter : String;
begin
  strFilter := dmBaixa_Contas_Pagar_Auto.InstrucaoSQL;
  if not ckPrevisoes.Checked then
    strFilter := strFilter + ' AND COALESCE(CP.CPAG_PREVISAO,0) = 0';
  if frPesqFornec.TemRegistro then
    strFilter := strFilter + ' AND CPAG_FORN_ID ' + frPesqFornec.InGrid();
  if frPesqPlanoContas.TemRegistro then
    strFilter := strFilter + ' AND CPAG_PLCT_ID ' + frPesqPlanoContas.InGrid();
  if frPesqTipoDoc.TemRegistro then
    strFilter := strFilter + ' AND CPAG_GENE_ID_TIPO_DOC ' + frPesqTipoDoc.InGrid();
  if frPesqContaBancaria.TemRegistro then
    strFilter := strFilter + ' AND CPAG_CBCO_ID ' + frPesqContaBancaria.InGrid();
  if edtDt_Emissao_Inicio.Date > 0 then
    strFilter := strFilter + ' AND CPAG_DTA_EMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Inicio.Date));
  if edtDt_Emissao_Fim.Date > 0 then
    strFilter := strFilter + ' AND CPAG_DTA_EMISSAO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Emissao_Fim.Date));
  if edtDt_Vcto_Inicio.Date > 0 then
    strFilter := strFilter + ' AND CPAG_DTA_VCTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Inicio.Date));
  if edtDt_Vcto_Fim.Date > 0 then
    strFilter := strFilter + ' AND CPAG_DTA_VCTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',edtDt_Vcto_Fim.Date));

  strFilter := strFilter + ' ORDER BY CP.CPAG_PREVISAO DESC, CP.CPAG_DTA_VCTO, CP.CPAG_STATUS';

  Result := strFilter;
end;

procedure TfBaixa_Contas_Pagar_Auto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(sltMarcados);
end;

procedure TfBaixa_Contas_Pagar_Auto.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmBaixa_Contas_Pagar_Auto.cdsContas_Pagar;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet(1);
  sltMarcados := TStringList.Create;
  panelFiltros.Height := 27;
//  edtDt_Vcto_Inicio.Date := StartOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  edtDt_Vcto_Fim.Date    := EndOfTheMonth(funcBasico.DataServidor(funcBasico.Conexao));
  sltMarcados.Clear;
  SetaValoresFrames();
  btnFiltrar.Click;
end;

procedure TfBaixa_Contas_Pagar_Auto.frPesqContaBancariabtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frPesqContaBancaria.btnPesquisarClick(Sender);

end;

procedure TfBaixa_Contas_Pagar_Auto.frPesqTipoDocckOmitirClick(Sender: TObject);
begin
  inherited;
  if funcBasico.VinculaCartaoCredito then begin
   case frPesqTipoDoc.ckOmitir.Checked of
     true : frPesqContaBancaria.Habilita := true;
     false: frPesqContaBancaria.Habilita := false;
   end;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.frPesqTipoDocedtCodigoExit(Sender: TObject);
var
  strTMP : String;
begin
  inherited;
  if not frPesqTipoDoc.edtCodigo.Modified then Exit;
  if (funcBasico.VinculaCartaoCredito) then begin
    if (not frPesqTipoDoc.TemRegistro) or (StrToInt(frPesqTipoDoc.edtCodigo.Text) in [4,5]) then begin
      frPesqContaBancaria.Habilita := true;
      frPesqContaBancaria.Limpar;
    end else if (not frPesqContaBancaria.Habilita) then begin
      frPesqContaBancaria.Habilita := true;
      frPesqContaBancaria.Limpar;
    end;
  end;
  frPesqTipoDoc.edtCodigoExit(Sender);
  if not frPesqTipoDoc.TemRegistro then Exit;
  frPesqTipoDoc.edtCodigo.Modified := false;
  try
    if funcBasico.VinculaCartaoCredito then begin
      strTMP := funcBasico.RetornaCartaoCredito(StrToInt(frPesqTipoDoc.edtCodigo.Text),0,'C');
      LancaDadosCartao(strTMP);
    end;
  except
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.LancaDadosCartao(strTMP : String);
begin
  if Trim(strTMP) <> '' then begin
    CCRE_ID := funcBasico.Buscar_Coluna(strTMP,1);
    frPesqContaBancaria.BuscarRegistro(funcBasico.Buscar_Coluna(strTMP,3));
    frPesqContaBancaria.Habilita := false;
  end else begin
    frPesqTipoDoc.Limpar;
    frPesqContaBancaria.Limpar;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.SetaValoresFrames;
var
  intI  : Integer;
begin
  for intI := 0 to ComponentCount - 1 do begin
    if (Components[intI] is TfrPesqIndividual) then begin
      (Components[intI] as TfrPesqIndividual).Limpar;
      (Components[intI] as TfrPesqIndividual).funcLocal := Self.funcBasico;
      (Components[intI] as TfrPesqIndividual).ckPlanoContas.Checked := funcBasico.FiltrarPlanoContasPAI;
    end;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.grdBasicoCellClick(Column: TColumn);
begin
  inherited;
  if Column.Field = grdBasico.DataSource.DataSet.FieldByName('SELECT') then begin
    if cdsGeral.FieldByName('CPAG_ID').AsString <> '' then begin
      if sltMarcados.IndexOf(cdsGeral.FieldByName('CPAG_ID').AsString) < 0 then begin
        sltMarcados.Add(cdsGeral.FieldByName('CPAG_ID').AsString);
        floatValor := floatValor + cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
      end else begin
        floatValor := floatValor - cdsGeral.FieldByName('VALOR_APAGAR').AsFloat;
        try
          sltMarcados.Delete(sltMarcados.IndexOf(cdsGeral.FieldByName('CPAG_ID').AsString));
        except
        end;
      end;
    end;
  end;
  edtTotal.Value := floatValor;
  grdBasico.Refresh;
end;

procedure TfBaixa_Contas_Pagar_Auto.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfBaixa_Contas_Pagar_Auto.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsGeral.FieldByName('STATUS') then begin
    if cdsGeral.FieldByName('CPAG_STATUS').AsString = 'A' then begin
      grdBasico.Canvas.Brush.Color := $00ACFBB8;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if cdsGeral.FieldByName('CPAG_STATUS').AsString = 'F' then begin
      grdBasico.Canvas.Brush.Color := $00FFC184;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if cdsGeral.FieldByName('CPAG_STATUS').AsString = 'C' then begin
      grdBasico.Canvas.Brush.Color := clYellow;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
    if (cdsGeral.FieldByName('CPAG_DTA_VCTO').AsDateTime <= now) and
       (cdsGeral.FieldByName('CPAG_STATUS').AsString <> 'F')     and
       (cdsGeral.FieldByName('CPAG_STATUS').AsString <> 'C')     then begin
      grdBasico.Canvas.Brush.Color := $006262FF;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Vencimento     ');
    end;
    if cdsGeral.IsEmpty then begin
      grdBasico.Canvas.Brush.Color := clWhite;
      grdBasico.Canvas.Font.Style := [fsBold];
      grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
      grdBasico.Canvas.TextOut(Rect.Left + Font.Size, Rect.Top + 2,'Sem Reg.       ');
    end;
  end;
  if cdsGeral.FieldByName('CPAG_PREVISAO').AsInteger = 1 then begin
    grdBasico.Canvas.Brush.Color := clPurple;
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = cdsGeral.FieldByName('CPAG_VALOR_DOC') then begin
    grdBasico.Canvas.Font.Style := [fsBold];
    grdBasico.DefaultDrawDataCell(Rect,Column.Field,State);
  end;
  if Column.Field = grdBasico.DataSource.DataSet.FieldByName('SELECT') then begin
    grdBasico.Canvas.FillRect(Rect);
   ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
   if sltMarcados.IndexOf(cdsGeral.FieldByName('CPAG_ID').AsString) >= 0 then
     ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
   else ImageList1.Draw(grdBasico.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.grdBasicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 32 then begin
    grdBasicoCellClick(grdBasico.Columns[0]);
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.mmAlterFornecedorClick(Sender: TObject);
var
  strID  : String;
  intI   : Integer;
  chrTMP : Char;
begin
  if sltMarcados.Count > 0 then begin
    try
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      fCadAlterTitulo := TfCadAlterTitulo.Create(nil);
      with fCadAlterTitulo do begin
        frPesquisa.edtOpcao.Enabled   := true;
        frPesquisa.edtOpcao1.Enabled  := true;
        frPesquisa.edtOpcao.Visible   := true;
        frPesquisa.edtOpcao1.Visible  := true;
        frPesquisa.Label3.Enabled     := true;
        frPesquisa.Label4.Enabled     := true;
        frPesquisa.Label3.Visible     := true;
        frPesquisa.Label4.Visible     := true;
        if TMenuItem(Sender as TObject).Name = 'mmAlterPlano' then begin
          frPesquisa.rdOpcoes.ItemIndex := 6;
          frPesquisa.Label3.Caption     := 'Cód. Simpl.';
          frPesquisa.Label4.Caption     := 'Tipo';
          frPesquisa.edtDescricao.Width := 290;
        end else if TMenuItem(Sender as TObject).Name = 'mmAlterFornecedor' then begin
          frPesquisa.rdOpcoes.ItemIndex := 1;
          frPesquisa.edtOpcao.Enabled   := false;
          frPesquisa.edtOpcao1.Enabled  := false;
          frPesquisa.edtOpcao.Visible   := false;
          frPesquisa.edtOpcao1.Visible  := false;
          frPesquisa.Label3.Enabled     := false;
          frPesquisa.Label4.Enabled     := false;
          frPesquisa.Label3.Visible     := false;
          frPesquisa.Label4.Visible     := false;
          frPesquisa.edtDescricao.Width := 448;
        end else if TMenuItem(Sender as TObject).Name = 'mmAlterContaBancaria' then begin
          frPesquisa.rdOpcoes.ItemIndex := 8;
          frPesquisa.Label3.Caption     := 'Saldo Atual';
          frPesquisa.Label4.Caption     := 'Limite';
          frPesquisa.edtDescricao.Width := 290;
        end;
        ShowModal;
        if frPesquisa.TemRegistro() then begin
          chrTMP := Copy(String(TMenuItem(Sender as TObject).Name),8,1)[1];
          funcBasico.AlteraTitulos(strID,frPesquisa.InGrid,Char(chrTMP));
        end;
      end;
    finally
      FreeAndNil(fCadAlterTitulo);
      OpenClientDataSet;
      btnFiltrar.Click;
    end;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.OpenClientDataSet(intPos : Integer = 99);
begin
  floatValor := 0;
  edtTotal.Value := floatValor;
  with dmBaixa_Contas_Pagar_Auto do begin
    case intPos of
      1 : begin
        with cdsContas_Pagar do begin
          Close;
          CommandText := GeraFilter;
          Open;
        end;
        try
          cdsContas_Pagar.DisableControls;
          cdsContas_Pagar.First;
          while not cdsContas_Pagar.Eof do begin
            floatValor := floatValor + cdsContas_PagarVALOR_APAGAR.AsFloat;
            cdsContas_Pagar.Next;
          end;
          lbTotal.Caption := 'Total em Títulos R$ ' + FormatFloat('###,###,##0.00',floatValor);
          floatValor:=0;
        finally
          cdsContas_Pagar.EnableControls;
        end;
      end else begin
        OpenClientDataSet(1);
      end;
    end;
  end;
end;

procedure TfBaixa_Contas_Pagar_Auto.ReverterTtuloPrevisoSlido1Click(
  Sender: TObject);
var
  strID      : String;
  boolCancel : Boolean;
  intI       : Integer;
begin
  boolCancel := false;
  try
    if sltMarcados.Count > 0 then begin
      strID := '';
      for intI := 0 to sltMarcados.Count - 1 do
        strID := strID + sltMarcados.Strings[intI] + ',';
      strID   := Copy(strID,1,length(strID)-1);
      while not boolCancel do begin
        if funcBasico.Alerta('A T E N Ç Ã O ! ! !'+#13+#13+
                             'Você optou por alterar o tipo do(s) título(s) selecionado(s),'+
                             ' se continuar este processo realizará a alteração '+
                             'em todos os títulos selecionados.'+#13+#13+
                             'Deseja Continuar?',1,true) = 6 then begin
          if funcBasico.AtualizarPrevisaoTitulos(strID) then begin
            boolCancel := true;
            OpenClientDataSet;
            btnFiltrar.Click;
            Exit;
          end;
        end else begin
          boolCancel := true;
        end;
      end;
    end else Exit;
  except
  end;
  if boolCancel then Exit;  
end;

procedure TfBaixa_Contas_Pagar_Auto.Timer1Timer(Sender: TObject);
begin
//  inherited;
end;

initialization
  RegisterClass(TfBaixa_Contas_Pagar_Auto);
finalization
  UnRegisterClass(TfBaixa_Contas_Pagar_Auto);

end.
