unit ufPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, frxClass, frxDBSet, frxDesgn, Menus, Funcoes, ExtCtrls, DB,
  Grids, DBGrids, StdCtrls, Buttons, ComCtrls, SQLExpr;

type
  TfPatrimonio = class(TfBasico)
    treeMenu: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure grdBasicoDblClick(Sender: TObject);
    procedure grdBasicoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdBasicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdBasicoTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure treeMenuClick(Sender: TObject);
    procedure treeMenuDblClick(Sender: TObject);
    procedure treeMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure treeMenuCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure CriaMenu;
    procedure CriarSubMenus(strMenu: String; treeItem: TTreeNode; intTam : Integer);
    procedure OpenClientDataSet;
    function  SomaSub(strMenu: String): Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPatrimonio: TfPatrimonio;

implementation

uses udmPatrimonio, ufCadPatrimonio;

{$R *.dfm}

procedure TfPatrimonio.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral := dmPatrimonio.cdsPatrimonio;
  cdsGeral.Open;
  Inherited;
  OpenClientDataSet;
  formCadastro := fCadPatrimonio;
  with fCadPatrimonio do begin
    cdsLocal  := dmPatrimonio.cdsPatrimonio;
    funcLocal := Self.funcBasico;
  end;
end;

procedure TfPatrimonio.OpenClientDataSet;
begin
  with dmPatrimonio.cdsPatrimonio do begin
    Close;
    Params.ParamByName('EMPR_ID').AsInteger := funcBasico.Empr_ID;
    Open;
  end;
end;

procedure TfPatrimonio.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
end;

procedure TfPatrimonio.FormShow(Sender: TObject);
begin
  inherited;
  CriaMenu;
end;

procedure TfPatrimonio.btnNovoClick(Sender: TObject);

procedure DeleteRegistro(strCodigo : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM PATRIMONIO');
      sql.Add(' WHERE PATR_ID      = ' + strCodigo);
      sql.Add('   AND PATR_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      ExecSQL();
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure DeleteVinculo(strCodigo : String);
var
  qryCons : TSQLQuery;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT PATR_ID');
      sql.Add('  FROM PATRIMONIO');
      sql.Add(' WHERE PATR_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
      sql.Add('   AND PATR_PATR_ID      = ' + strCodigo);
      sql.Add('   AND PATR_PATR_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
      Open;
      First;
      while not Eof do begin
        DeleteVinculo(FieldByName('PATR_ID').AsString);
        DeleteRegistro(FieldByName('PATR_ID').AsString);
        Next;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

begin
  {if not funcBasico.Privado then begin
    funcBasico.Alerta('I M P O R T A N T E ! ! !'+#13+#13+
                      'Opção não disponível a usuários FREE.',0);
    Exit;
  end;}
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then begin
    inherited;
  end else begin
    if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
      if (btnExcluir.Enabled) then begin
        if funcBasico.Alerta('Confirma a exclusão do registro selecionado?',1,true) = 6 then begin
          try
            funcBasico.MSGAguarde();
            try
              try
                funcBasico.StartCommit;
              except
              end;
              DeleteVinculo(cdsGeral.FieldByName('PATR_ID').AsString);
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
          finally
            funcBasico.MSGAguarde(false);
          end;
        end;
      end;
    end;
  end;
  CriaMenu;
end;

procedure TfPatrimonio.CriaMenu;
var
  qryCons   : TSQLQuery;
  treeItem,
  treeItemI : TTreeNode;
  intTam    : Integer;
begin
  try
    treeMenu.Items.Clear; intTam := 100;
    treeItemI := treeMenu.Items.Add(nil,'CONTROLE PATRIMONIAL');
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('       PT.PATR_ID,');
        sql.Add('       PT.PATR_EMPR_ID,');
        sql.Add('       PT.PATR_DESCRICAO,');
        sql.Add('       PT.PATR_VLR_COMPRA,');
        sql.Add('       COALESCE(PT.PATR_VLR_VENDA,0) AS PATR_VLR_VENDA,');
        sql.Add('       PT.PATR_PATR_ID,');
        sql.Add('       PT.PATR_PATR_EMPR_ID,');
        sql.Add('       PT.PATR_DTA_CADASTRO,');
        sql.Add('       PT.PATR_USER_ID');
        sql.Add('  FROM PATRIMONIO PT');
        sql.Add(' WHERE PT.PATR_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('   AND PT.PATR_PATR_ID IS NULL');
        sql.Add(' ORDER BY PT.PATR_DESCRICAO');
        Open;
        while not Eof do begin
          treeItem      := treeMenu.Items.AddChild(treeItemI,qryCons.Fields[2].AsString +
                                          funcBasico.Repetir(100-Length(qryCons.Fields[2].AsString),'.')+
                                          funcBasico.Padl('R$ ' + FormatFloat('###,###,##0.00',qryCons.Fields[3].AsFloat),14)
                                          + ' / ' +
                                          funcBasico.Padl('R$ ' + FormatFloat('###,###,##0.00',(qryCons.Fields[3].AsFloat+SomaSub(qryCons.Fields[0].AsString))),14));
          treeItem.StateIndex := funcBasico.Se(qryCons.FieldByName('PATR_VLR_VENDA').AsFloat > 0,1,0);
          treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
          CriarSubMenus(qryCons.Fields[0].AsString,treeItem,(intTam -3));
          Next;
        end;
      end;
    except on e: exception do
      funcBasico.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

function TfPatrimonio.SomaSub(strMenu : String) : Real;
var
  qryCons : TSQLQuery;
begin
  Result := 0;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    with qryCons do begin
      Close;
      sql.Clear;
      sql.Add('SELECT');
      sql.Add('       PATR_ID,');
      sql.Add('       COALESCE(PATR_VLR_COMPRA,0) AS PATR_VLR_COMPRA');
      sql.Add('  FROM PATRIMONIO');
      sql.Add(' WHERE PATR_EMPR_ID               = ' + IntToStr(funcBasico.Empr_ID));
      sql.Add('   AND PATR_PATR_ID               = ' + strMenu);
      sql.Add('   AND PATR_PATR_EMPR_ID          = ' + IntToStr(funcBasico.Empr_ID));
      sql.Add('   AND COALESCE(PATR_VLR_VENDA,0) = 0');
      Open;
      First;
      while not Eof do begin
        Result := Result + FieldByName('PATR_VLR_COMPRA').AsFloat + SomaSub(FieldByName('PATR_ID').AsString);
        Next;
      end;
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPatrimonio.CriarSubMenus(strMenu: String; treeItem: TTreeNode; intTam : Integer);
var
  qryCons : TSQLQuery;
  treeNew : TTreeNode;
begin
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('       PT.PATR_ID,');
        sql.Add('       PT.PATR_EMPR_ID,');
        sql.Add('       PT.PATR_DESCRICAO,');
        sql.Add('       PT.PATR_VLR_COMPRA,');
        sql.Add('       COALESCE(PT.PATR_VLR_VENDA,0) AS PATR_VLR_VENDA,');
        sql.Add('       PT.PATR_PATR_ID,');
        sql.Add('       PT.PATR_PATR_EMPR_ID,');
        sql.Add('       PT.PATR_DTA_CADASTRO,');
        sql.Add('       PT.PATR_USER_ID,');
        sql.Add('       PT.PATR_MARCA,');
        sql.Add('       PT.PATR_MODELO');
        sql.Add('  FROM PATRIMONIO PT');
        sql.Add(' WHERE PT.PATR_EMPR_ID      = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add('   AND PT.PATR_PATR_ID      = ' + strMenu);
        sql.Add('   AND PT.PATR_PATR_EMPR_ID = ' + IntToStr(funcBasico.Empr_ID));
        sql.Add(' ORDER BY PT.PATR_DESCRICAO');
        Open;
        while not eof do begin
          treeNew := treeMenu.Items.AddChild(treeItem,qryCons.Fields[2].AsString +
                                             funcBasico.Repetir(intTam-Length(qryCons.Fields[2].AsString),'.') +
                                             funcBasico.Padl('R$ ' + FormatFloat('###,###,##0.00',qryCons.Fields[3].AsFloat),14)
                                             + ' / ' +
                                             funcBasico.Padl('R$ ' + FormatFloat('###,###,##0.00',(qryCons.Fields[3].AsFloat+SomaSub(qryCons.Fields[0].AsString))),14));
          treeNew.StateIndex := funcBasico.Se(qryCons.FieldByName('PATR_VLR_VENDA').AsFloat > 0,1,0);
          treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
          CriarSubMenus(qryCons.Fields[0].AsString,treeNew,(intTam-3));
          Next;
        end;
      end;
    except on e: exception do
      funcBasico.Alerta(e.Message,1);
    end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfPatrimonio.grdBasicoDblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfPatrimonio.grdBasicoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  inherited;
end;

procedure TfPatrimonio.grdBasicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
end;

procedure TfPatrimonio.grdBasicoTitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TfPatrimonio.treeMenuClick(Sender: TObject);
begin
  inherited;
  try
    cdsGeral.Locate('PATR_ID',Integer(treeMenu.Selected.Data),[])
  except
  end;
end;

procedure TfPatrimonio.treeMenuCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;
  if Node.Level in [0,1] then begin
    Sender.Canvas.Font.Style := [fsBold];
    Sender.Canvas.Font.Color := clBlue;
  end else begin
    Sender.Canvas.Font.Style := [fsItalic];
  end;
  if Node.StateIndex = 1 then
    Sender.Canvas.Font.Color := clSilver;
end;

procedure TfPatrimonio.treeMenuDblClick(Sender: TObject);
begin
  inherited;
  btnEditar.Click;
end;

procedure TfPatrimonio.treeMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 116 then CriaMenu;
end;

initialization
  RegisterClass(TfPatrimonio);
finalization
  UnRegisterClass(TfPatrimonio);

end.
