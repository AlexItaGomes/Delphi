unit ufCad_Transf_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, Grids, DBGrids, ImgList, rxCurrEdit;

type
  TfCad_Transf_Servicos = class(TfCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBDateEdit1: TDBDateEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtCodOS: TDBEdit;
    btnPesqOS: TSpeedButton;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    edtCodTec: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    btnPesqTec: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ImageList1: TImageList;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    Label27: TLabel;
    DBEdit23: TDBEdit;
    Label28: TLabel;
    DBEdit24: TDBEdit;
    Label29: TLabel;
    DBEdit25: TDBEdit;
    Label30: TLabel;
    DBEdit26: TDBEdit;
    btnAdic: TBitBtn;
    btnRet: TBitBtn;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtComissaoInterna: TRxDBCalcEdit;
    edtComissaoExterna: TRxDBCalcEdit;
    edtComissaoBalcao: TRxDBCalcEdit;
    procedure edtCodOSKeyPress(Sender: TObject; var Key: Char);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtCodTecExit(Sender: TObject);
    procedure btnPesqTecClick(Sender: TObject);
    procedure edtCodOSExit(Sender: TObject);
    procedure btnPesqOSClick(Sender: TObject);
    procedure pageCadastroChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnRetClick(Sender: TObject);
    procedure btnAdicClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    sltMarcados : TStringList;
    procedure OpenClientDataSet(intPos: Integer = 99);
    function ValidaDados: Boolean;
    function ValidaComissao: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Transf_Servicos: TfCad_Transf_Servicos;

implementation

uses udmTransf_Servicos;

{$R *.dfm}

procedure TfCad_Transf_Servicos.btnPesqTecClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(1);
  strTMP := funcLocal.Busca_Registro(dmTranf_Servicos.cdsPesqTecnico,'','USER_ID;USER_NOME_COMPLETO','');
  if strTMP <> '' then begin
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_DEST').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('USER_NOME_COMPLETO_DEST').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    edtCodTec.Modified := true;
  end else begin
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_DEST').AsString   := '';
    cdsLocal.FieldByName('USER_NOME_COMPLETO_DEST').AsString := '';
  end;
  edtCodTec.SetFocus;
end;

procedure TfCad_Transf_Servicos.btnRetClick(Sender: TObject);
begin
  inherited;
  if not dmTranf_Servicos.cdsItensTransf.IsEmpty then begin
    try
      sltMarcados.Delete(sltMarcados.IndexOf(dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_PROD_ID').AsString+';'+
                                             dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ID').AsString));
    except
    end;
    dmTranf_Servicos.cdsItensTransf.Delete;
  end;
  DBGrid1.Refresh;
end;

procedure TfCad_Transf_Servicos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  with dmTranf_Servicos do begin
    cdsItensTransf.Cancel;
    if cdsItensTransf.Locate('OSTI_ODIT_TPIT_ID;OSTI_ODIT_TPIT_PROD_ID',
                             VarArrayOf([cdsOrdemServicoItensODIT_TPIT_ID.AsInteger,
                             cdsOrdemServicoItensODIT_TPIT_PROD_ID.AsInteger]),[]) then begin
      cdsItensTransf.Edit;
    end else begin
      cdsItensTransf.Append;
    end;
  end;
end;

procedure TfCad_Transf_Servicos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  try
    If odd(DBGrid1.DataSource.DataSet.RecNo) then begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := $00FFDFDF;
    end else begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    if gdSelected in state then begin
      DBGrid1.Canvas.Brush.Color := clSilver;
      DBGrid1.Canvas.Font.Style  := [fsBold];
    end;
     DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  except
  end;
  if Column.Field = DBGrid1.DataSource.DataSet.FieldByName('SELEC') then begin
    DBGrid1.Canvas.FillRect(Rect);
    ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
    if sltMarcados.IndexOf(dmTranf_Servicos.cdsOrdemServicoItens.FieldByName('ODIT_TPIT_PROD_ID').AsString+';'+
                           dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ID').AsString) >= 0 then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
  end;
end;

procedure TfCad_Transf_Servicos.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfCad_Transf_Servicos.edtCodOSExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodOS.Modified then Exit;
  if edtCodOS.Text <> '' then begin
    OpenClientDataSet(2);
    strTMP := funcLocal.Busca_Registro(dmTranf_Servicos.cdsPesqOS,'','ORDS_ID;'+             //1
                                                                     'ORDS_CLIE_ID;'+        //2
                                                                     'CLIE_RAZAO_SOCIAL;'+   //3
                                                                     'ORDS_DTA_INSTALACAO;'+ //4
                                                                     'ORDS_USER_ID_TEC;'+    //5
                                                                     'USER_NOME_COMPLETO;'+  //6
                                                                     'ORDS_PROD_ID_EQUIP;'+  //7
                                                                     'PROD_DESCRICAO;'+      //8
                                                                     'PROD_UNIDADE;'+        //9
                                                                     'MARCA_PROD;'+          //10
                                                                     'MODELO_PROD;'+         //11
                                                                     'ORDS_VLR_TOTAL_OS;'+   //12
                                                                     'ORDS_VLR_DESCONTO;'+   //13
                                                                     'ORDS_VLR_PAGO','ORDS_ID = ' + edtCodOS.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('OSTF_ORDS_ID').AsString             := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsString        := funcLocal.Buscar_Coluna(strTMP,2);
      cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
      cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime    := StrToDate(funcLocal.Buscar_Coluna(strTMP,4));
      cdsLocal.FieldByName('OSTF_USER_ID_TEC_ORIG').AsString    := funcLocal.Buscar_Coluna(strTMP,5);
      cdsLocal.FieldByName('USER_NOME_COMPLETO_ORIG').AsString  := funcLocal.Buscar_Coluna(strTMP,6);
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString       := funcLocal.Buscar_Coluna(strTMP,7);
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString           := funcLocal.Buscar_Coluna(strTMP,8);
      cdsLocal.FieldByName('PROD_UNIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,9);
      cdsLocal.FieldByName('MARCA_PROD').AsString               := funcLocal.Buscar_Coluna(strTMP,10);
      cdsLocal.FieldByName('MODELO_PROD').AsString              := funcLocal.Buscar_Coluna(strTMP,11);
      cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsString        := funcLocal.Buscar_Coluna(strTMP,12);
      cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsString        := funcLocal.Buscar_Coluna(strTMP,13);
      cdsLocal.FieldByName('ORDS_VLR_PAGO').AsString            := funcLocal.Buscar_Coluna(strTMP,14);
    end else begin
      cdsLocal.FieldByName('OSTF_ORDS_ID').AsString             := '';
      cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsString        := '';
      cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString        := '';
      cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsString      := '';
      cdsLocal.FieldByName('OSTF_USER_ID_TEC_ORIG').AsString    := '';
      cdsLocal.FieldByName('USER_NOME_COMPLETO_ORIG').AsString  := '';
      cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString       := '';
      cdsLocal.FieldByName('PROD_DESCRICAO').AsString           := '';
      cdsLocal.FieldByName('PROD_UNIDADE').AsString             := '';
      cdsLocal.FieldByName('MARCA_PROD').AsString               := '';
      cdsLocal.FieldByName('MODELO_PROD').AsString              := '';
      cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsString        := '';
      cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsString        := '';
      cdsLocal.FieldByName('ORDS_VLR_PAGO').AsString            := '';
    end;
  end else begin
    cdsLocal.FieldByName('OSTF_ORDS_ID').AsString             := '';
    cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsString        := '';
    cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString        := '';
    cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsString      := '';
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_ORIG').AsString    := '';
    cdsLocal.FieldByName('USER_NOME_COMPLETO_ORIG').AsString  := '';
    cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString       := '';
    cdsLocal.FieldByName('PROD_DESCRICAO').AsString           := '';
    cdsLocal.FieldByName('PROD_UNIDADE').AsString             := '';
    cdsLocal.FieldByName('MARCA_PROD').AsString               := '';
    cdsLocal.FieldByName('MODELO_PROD').AsString              := '';
    cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsString        := '';
    cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsString        := '';
    cdsLocal.FieldByName('ORDS_VLR_PAGO').AsString            := '';
  end;
end;

procedure TfCad_Transf_Servicos.edtCodOSKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key,['0'..'9',#8])) then key := #0;
end;

procedure TfCad_Transf_Servicos.edtCodTecExit(Sender: TObject);
var
  strTMP : String;
begin
  if not edtCodTec.Modified then Exit;
  if edtCodTec.Text <> '' then begin
    OpenClientDataSet(1);
    strTMP := funcLocal.Busca_Registro(dmTranf_Servicos.cdsPesqTecnico,'','USER_ID;USER_NOME_COMPLETO','USER_ID = ' + edtCodTec.Text);
    if strTMP <> '' then begin
      cdsLocal.FieldByName('OSTF_USER_ID_TEC_DEST').AsString   := funcLocal.Buscar_Coluna(strTMP,1);
      cdsLocal.FieldByName('USER_NOME_COMPLETO_DEST').AsString := funcLocal.Buscar_Coluna(strTMP,2);
    end else begin
      cdsLocal.FieldByName('OSTF_USER_ID_TEC_DEST').AsString   := '';
      cdsLocal.FieldByName('USER_NOME_COMPLETO_DEST').AsString := '';
    end;
  end else begin
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_DEST').AsString   := '';
    cdsLocal.FieldByName('USER_NOME_COMPLETO_DEST').AsString := '';
  end;
end;

procedure TfCad_Transf_Servicos.FormShow(Sender: TObject);
begin
  inherited;
  if sltMarcados = nil then
    sltMarcados := TStringList.Create;
  edtCodOS.SetFocus;
end;

procedure TfCad_Transf_Servicos.Label2Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(445);
end;

procedure TfCad_Transf_Servicos.OpenClientDataSet(intPos : Integer = 99);
begin
  with dmTranf_Servicos do begin
    case intPos of
      1 : begin
        with cdsPesqTecnico do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      2 : begin
        with cdsPesqOS do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      3 : begin
        with cdsOrdemServicoItens do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('ORDS_ID').AsInteger := cdsLocal.FieldByName('OSTF_ORDS_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('CLIE_ID').AsInteger := cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
        end;
      end;
      4 : begin
        with cdsItensTransf do begin
          Close;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Params.ParamByName('OSTF_ID').AsInteger := cdsLocal.FieldByName('OSTF_ID').AsInteger;
          Params.ParamByName('EMPR_ID').AsInteger := funcLocal.Empr_ID;
          Open;
          Append;
        end;
      end
      else begin
        OpenClientDataSet(1);
        OpenClientDataSet(2);
        OpenClientDataSet(3);
        OpenClientDataSet(4);
      end;
    end;
  end;
end;

procedure TfCad_Transf_Servicos.pageCadastroChange(Sender: TObject);
begin
  inherited;
  if pageCadastro.TabIndex = 1 then begin
    if edtCodOS.Text = '' then begin
      funcLocal.Alerta('Informe a ordem de serviço a ser realizada a transferência antes de continuar.',0);
      pageCadastro.Pages[0].Show;
      edtCodOS.SetFocus;
      Abort;
    end;
    if edtCodTec.Text = '' then begin
      funcLocal.Alerta('Informe o técnico a quem será destinado os produtos/servicos antes de continuar.',0);
      pageCadastro.Pages[0].Show;
      edtCodTec.SetFocus;
      Abort;
    end;
  end;
end;

procedure TfCad_Transf_Servicos.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  funcLocal.UnPrintLabel(Sender);
end;

procedure TfCad_Transf_Servicos.Label2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  funcLocal.PrintLabel(Sender);
end;

procedure TfCad_Transf_Servicos.Label7Click(Sender: TObject);
begin
  inherited;
  funcLocal.ExecutaRotina(12);
end;

procedure TfCad_Transf_Servicos.btnAdicClick(Sender: TObject);
begin
  if ValidaComissao then begin
    try
      inherited;
      with dmTranf_Servicos do begin
        if not cdsOrdemServicoItens.IsEmpty then begin
          cdsItensTransf.Edit;
          cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_ID').AsInteger         := cdsOrdemServicoItensODIT_TPIT_ID.AsInteger;
          cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_TPRC_ID').AsInteger    := cdsOrdemServicoItensODIT_TPIT_TPRC_ID.AsInteger;
          cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_PROD_ID').AsInteger    := cdsOrdemServicoItensODIT_TPIT_PROD_ID.AsInteger;
          cdsItensTransf.FieldByName('PROD_DESCRICAO').AsString             := cdsOrdemServicoItensPROD_DESCRICAO.AsString;
          cdsItensTransf.FieldByName('PROD_UNIDADE').AsString               := cdsOrdemServicoItensPROD_UNIDADE.AsString;
          cdsItensTransf.FieldByName('MARCA_PROD').AsString                 := cdsOrdemServicoItensMARCA_PROD.AsString;
          cdsItensTransf.FieldByName('MODELO_PROD').AsString                := cdsOrdemServicoItensMODELO_PROD.AsString;
          cdsItensTransf.FieldByName('OSTI_ODIT_VLR_UNITARIO').AsFloat      := cdsOrdemServicoItensODIT_VLR_UNITARIO.AsFloat;
          cdsItensTransf.FieldByName('OSTI_ODIT_QTDE').AsFloat              := cdsOrdemServicoItensODIT_QTDE.AsFloat;
          cdsItensTransf.FieldByName('OSTI_ODIT_VLR_TOTAL').AsFloat         := cdsOrdemServicoItensODIT_VLR_TOTAL.AsFloat;
          cdsItensTransf.Post;
          if sltMarcados.IndexOf(dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_PROD_ID').AsString+';'+
                                 dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ID').AsString) < 0 then begin
            sltMarcados.Add(dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_PROD_ID').AsString+';'+
                            dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ID').AsString);
          end else begin
            sltMarcados.Delete(sltMarcados.IndexOf(dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ODIT_TPIT_PROD_ID').AsString+';'+
                                                   dmTranf_Servicos.cdsItensTransf.FieldByName('OSTI_ID').AsString));
          end;
          DBGrid1.Refresh;
          cdsItensTransf.Append;
        end;
      end;
    except
      DBGrid1.Refresh;
    end;
  end;
end;

function TfCad_Transf_Servicos.ValidaComissao : Boolean;
begin
  Result := true;
  if edtComissaoInterna.Value < 0 then
    edtComissaoInterna.Value := 0;
  if edtComissaoExterna.Value < 0 then
    edtComissaoExterna.Value := 0;
  if edtComissaoBalcao.Value < 0 then
    edtComissaoBalcao.Value := 0;
end;

procedure TfCad_Transf_Servicos.btnOkClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    dmTranf_Servicos.cdsItensTransf.ApplyUpdates(-1);
  end;
end;

function TfCad_Transf_Servicos.ValidaDados : Boolean;
begin
  Result := true;
  dmTranf_Servicos.cdsItensTransf.Cancel;
  if edtCodOS.Text = '' then begin
    funcLocal.Alerta('Informe os dados da ordem de serviço antes de continuar.',0);
    pageCadastro.Pages[0].Show;
    edtCodOS.SetFocus;
    Result := false;
    Exit;
  end;
  if edtCodTec.Text = '' then begin
    funcLocal.Alerta('Informe o técnico de destino dos produtos/servicos antes de continuar.',0);
    pageCadastro.Pages[0].Show;
    edtCodTec.SetFocus;
    Result := false;
    Exit;
  end;
  if dmTranf_Servicos.cdsItensTransf.IsEmpty then begin
    funcLocal.Alerta('Transferencia sem itens lançados, verifique o lançamento dos itens antes de continuar.',0);
    pageCadastro.Pages[1].Show;
    Result := false;
    Exit;
  end;
end;

procedure TfCad_Transf_Servicos.btnPesqOSClick(Sender: TObject);
var
  strTMP : String;
begin
  OpenClientDataSet(2);
  strTMP := funcLocal.Busca_Registro(dmTranf_Servicos.cdsPesqOS,'','ORDS_ID;'+             //1
                                                                   'ORDS_CLIE_ID;'+        //2
                                                                   'CLIE_RAZAO_SOCIAL;'+   //3
                                                                   'ORDS_DTA_INSTALACAO;'+ //4
                                                                   'ORDS_USER_ID_TEC;'+    //5
                                                                   'USER_NOME_COMPLETO;'+  //6
                                                                   'ORDS_PROD_ID_EQUIP;'+  //7
                                                                   'PROD_DESCRICAO;'+      //8
                                                                   'PROD_UNIDADE;'+        //9
                                                                   'MARCA_PROD;'+          //10
                                                                   'MODELO_PROD;'+         //11
                                                                   'ORDS_VLR_TOTAL_OS;'+   //12
                                                                   'ORDS_VLR_DESCONTO;'+   //13
                                                                   'ORDS_VLR_PAGO','');    //14
  if strTMP <> '' then begin
    cdsLocal.FieldByName('OSTF_ORDS_ID').AsString             := funcLocal.Buscar_Coluna(strTMP,1);
    cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsString        := funcLocal.Buscar_Coluna(strTMP,2);
    cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString        := funcLocal.Buscar_Coluna(strTMP,3);
    cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsDateTime    := StrToDate(funcLocal.Buscar_Coluna(strTMP,4));
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_ORIG').AsString    := funcLocal.Buscar_Coluna(strTMP,5);
    cdsLocal.FieldByName('USER_NOME_COMPLETO_ORIG').AsString  := funcLocal.Buscar_Coluna(strTMP,6);
    cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString       := funcLocal.Buscar_Coluna(strTMP,7);
    cdsLocal.FieldByName('PROD_DESCRICAO').AsString           := funcLocal.Buscar_Coluna(strTMP,8);
    cdsLocal.FieldByName('PROD_UNIDADE').AsString             := funcLocal.Buscar_Coluna(strTMP,9);
    cdsLocal.FieldByName('MARCA_PROD').AsString               := funcLocal.Buscar_Coluna(strTMP,10);
    cdsLocal.FieldByName('MODELO_PROD').AsString              := funcLocal.Buscar_Coluna(strTMP,11);
    cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsString        := funcLocal.Buscar_Coluna(strTMP,12);
    cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsString        := funcLocal.Buscar_Coluna(strTMP,13);
    cdsLocal.FieldByName('ORDS_VLR_PAGO').AsString            := funcLocal.Buscar_Coluna(strTMP,14);
    edtCodOS.Modified := true;
  end else begin
    cdsLocal.FieldByName('OSTF_ORDS_ID').AsString             := '';
    cdsLocal.FieldByName('OSTF_ORDS_CLIE_ID').AsString        := '';
    cdsLocal.FieldByName('CLIE_RAZAO_SOCIAL').AsString        := '';
    cdsLocal.FieldByName('ORDS_DTA_INSTALACAO').AsString      := '';
    cdsLocal.FieldByName('OSTF_USER_ID_TEC_ORIG').AsString    := '';
    cdsLocal.FieldByName('USER_NOME_COMPLETO_ORIG').AsString  := '';
    cdsLocal.FieldByName('ORDS_PROD_ID_EQUIP').AsString       := '';
    cdsLocal.FieldByName('PROD_DESCRICAO').AsString           := '';
    cdsLocal.FieldByName('PROD_UNIDADE').AsString             := '';
    cdsLocal.FieldByName('MARCA_PROD').AsString               := '';
    cdsLocal.FieldByName('MODELO_PROD').AsString              := '';
    cdsLocal.FieldByName('ORDS_VLR_TOTAL_OS').AsString        := '';
    cdsLocal.FieldByName('ORDS_VLR_DESCONTO').AsString        := '';
    cdsLocal.FieldByName('ORDS_VLR_PAGO').AsString            := '';
  end;
  edtCodOS.SetFocus;
end;

procedure TfCad_Transf_Servicos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label7Click(Sender);
  edtCodTec.SetFocus;
end;

procedure TfCad_Transf_Servicos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Label2Click(Sender);
  edtCodOS.SetFocus;
end;

procedure TfCad_Transf_Servicos.TabSheet1Show(Sender: TObject);
begin
  inherited;

  if cdsLocal.FieldByName('OSTF_ID').IsNull then Exit;

  OpenClientDataSet(3);
  OpenClientDataSet(4);
  with dmTranf_Servicos,cdsItensTransf do begin
    First;
    while not eof do begin
      sltMarcados.Add(cdsItensTransfOSTI_ODIT_TPIT_PROD_ID.AsString+';'+
                      cdsItensTransf.FieldByName('OSTI_ID').AsString);
      Next;
    end;
  end;
  DBGrid1.Refresh;
end;

initialization
  if fCad_Transf_Servicos = nil then
    fCad_Transf_Servicos := TfCad_Transf_Servicos.Create(nil);
finalization
  FreeAndNil(fCad_Transf_Servicos);

end.
