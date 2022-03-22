unit ufMenus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, ExtCtrls, Funcoes, DB, Grids, DBGrids, StdCtrls, Buttons,
  ComCtrls, SQLExpr, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfMenus = class(TfBasico)
    treeMenu: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure treeMenuClick(Sender: TObject);
    procedure treeMenuDblClick(Sender: TObject);
    procedure treeMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure OpenClientDataSet;
    procedure CriarMenu;
    procedure CriarSubMenusUsuario(strUser_Id, strEmpr_Id, strMenu: String;
      treeItem: TTreeNode);
    function  DeleteFilhos(strMenu_ID: String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenus: TfMenus;

implementation

uses udmMenus, ufCad_Menus;

{$R *.dfm}

procedure TfMenus.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat  := 'dd/mm/yyyy';
  cdsGeral  := dmMenus.cdsMenu;
  cdsGeral.Open;
  inherited;
  OpenClientDataSet;
  formCadastro  := fCad_Menus;
  with fCad_Menus do begin
    cdsLocal    := dmMenus.cdsMenu;
    funcLocal   := Self.funcBasico;
  end;
end;

procedure TfMenus.FormShow(Sender: TObject);
begin
  inherited;
  CriarMenu;
end;

procedure TfMenus.btnNovoClick(Sender: TObject);

{$REGION 'DeleteVinculo'}
  procedure DeleteVinculo(strMenu_ID : String);
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
          sql.Add('DELETE FROM USUARIO_M');
          sql.Add(' WHERE USRM_MENU_ID = ' + strMenu_ID);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      except on e: exception do begin
        funcBasico.RollBack;
        funcBasico.ReportaErro(Caption,'DeleteMenu',e.Message);
        funcBasico.Alerta('Erro no processo de exclusão do menu.'+#13+'[' + e.Message + ']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
  
{$ENDREGION}

begin
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then
    inherited
  else begin
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
              if not DeleteFilhos(cdsGeral.FieldByName('MENU_ID').AsString) then begin
                funcBasico.RollBack;
                Exit;
              end;
              DeleteVinculo(cdsGeral.FieldByName('MENU_ID').AsString);
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
            CriarMenu;
            funcBasico.MSGAguarde(false);
          end;
        end;
      end;
    end;
  end;
end;

function TfMenus.DeleteFilhos(strMenu_ID : String) : Boolean;

{$REGION 'DeleteMenu'}
  procedure DeleteMenu(strMenu_ID : String);
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
          sql.Add('DELETE FROM USUARIO_M');
          sql.Add('WHERE USRM_MENU_ID = ' + strMenu_ID);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
          try
            funcBasico.StartCommit;
          except
          end;
          sql.Clear;
          sql.Add('DELETE FROM MENU');
          sql.Add('WHERE  MENU_ID = ' + strMenu_ID);
          ExecSQL;
          try
            funcBasico.Commit;
          except
          end;
        end;
      except on e: exception do begin
        Result := false;
        funcBasico.RollBack;
        funcBasico.ReportaErro(Caption,'DeleteMenu',e.Message);
        funcBasico.Alerta('Erro no processo de exclusão do menu.'+#13+'[' + e.Message + ']',1);
      end; end;
    finally
      qryCons.Close;
      FreeAndNil(qryCons);
    end;
  end;
{$ENDREGION}

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
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('      MENU_ID');
        SQL.Add('FROM  MENU');
        SQL.Add('WHERE MENU_MENU_ID = ' + strMenu_ID);
        Open;
        if not IsEmpty then begin
          while not eof do begin
            DeleteFilhos(qryCons.Fields[0].AsString);
            DeleteMenu(qryCons.Fields[0].AsString);
            Next;
          end;
        end;
      end;
    except on e: exception do begin
      Result := false;
      funcBasico.ReportaErro(Caption,'DeleteFilhos',e.Message);
      funcBasico.Alerta('Erro no processo de exclusão do menu.'+#13+'['+e.Message+']',1)
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfMenus.CriarMenu;
var
  qryCons  : TSQLQuery;
  treeItem : TTreeNode;
begin
  try
    treeMenu.Items.Clear;
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcBasico.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('	    M.MENU_ID,');
        sql.Add('     M.MENU_CODIGO,');
        sql.Add('     M.MENU_DESCRICAO');
        sql.Add('FROM	MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('WHERE M.MENU_MENU_ID IS NULL');
        sql.add('AND   M.MENU_ATIVO    = 1');
        sql.Add('AND   M.MENU_NOME_BPL = ' + QuotedStr('CMD'));
        sql.Add('ORDER BY M.MENU_CODIGO,M.MENU_DESCRICAO');
        Open;
        while not Eof do begin
          treeItem      := treeMenu.Items.Add(nil,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
          treeItem.Data := Pointer(qryCons.Fields[0].AsInteger);
          CriarSubMenusUsuario(IntToStr(funcBasico.User_ID),IntToStr(funcBasico.Empr_ID), qryCons.Fields[0].AsString,treeItem);
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

procedure TfMenus.CriarSubMenusUsuario(strUser_Id, strEmpr_Id,
  strMenu: String; treeItem: TTreeNode);
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
        sql.Add('	   M.MENU_ID,');
        sql.Add('    M.MENU_CODIGO,');
        sql.Add('    M.MENU_DESCRICAO,');
        sql.Add('    M.MENU_MENU_ID');
        sql.Add('FROM	MENU M');
        sql.Add('INNER JOIN GENERICA G');
        sql.Add('ON (M.MENU_GENE_EMPR_ID_TP = G.GENE_EMPR_ID');
        sql.Add('AND M.MENU_GENE_TGEN_ID_TP = G.GENE_TGEN_ID');
        sql.Add('AND M.MENU_GENE_ID_TP      = G.GENE_ID)');
        sql.Add('WHERE M.MENU_MENU_ID   = ' + strMenu);
        sql.Add('AND   M.MENU_ATIVO     = 1');
        sql.Add('ORDER BY M.MENU_CODIGO,M.MENU_DESCRICAO');
        Open;
        while not eof do begin
          treeNew := treeMenu.Items.AddChild(treeItem,qryCons.Fields[1].AsString + ' - ' + qryCons.Fields[2].AsString);
          treeNew.Data := Pointer(qryCons.Fields[0].AsInteger);
          CriarSubMenusUsuario(strUser_Id,strEmpr_Id,qryCons.Fields[0].AsString,treeNew);
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

procedure TfMenus.OpenClientDataSet;
begin
  with dmMenus do begin
    with cdsMenu do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfMenus.treeMenuClick(Sender: TObject);
begin
  inherited;
  try
    cdsGeral.Locate('MENU_ID',Integer(treeMenu.Selected.Data),[])
  except
  end;
end;

procedure TfMenus.treeMenuDblClick(Sender: TObject);
begin
  inherited;
  btnEditar.Click;
end;

procedure TfMenus.treeMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 116 then CriarMenu;
end;

initialization
  RegisterClass(TfMenus);

finalization
  UnRegisterClass(TfMenus);

end.
