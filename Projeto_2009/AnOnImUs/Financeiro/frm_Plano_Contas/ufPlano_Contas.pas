unit ufPlano_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufBasico, Funcoes, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  ComCtrls, SQLExpr, Menus, frxClass, frxDBSet, frxDesgn;

type
  TfPlano_Contas = class(TfBasico)
    treePlano: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure treePlanoClick(Sender: TObject);
    procedure treePlanoDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure treePlanoCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    procedure OpenClientDataSet;
    procedure MontaTreeView;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlano_Contas: TfPlano_Contas;

implementation

uses udmPlano_Contas, ufCad_Plano_Contas;

{$R *.dfm}

procedure TfPlano_Contas.btnNovoClick(Sender: TObject);
begin
  if (Sender as TSpeedButton).Name <> 'btnExcluir' then
    inherited
  else begin
    {if (grdBasico.DataSource <> nil) and (not cdsGeral.IsEmpty) then begin
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
    end;}
  end;
  MontaTreeView;
end;

procedure TfPlano_Contas.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  cdsGeral     := dmPlano_Contas.cdsPlano_Contas;
  inherited;
  OpenClientDataSet;
  formCadastro   := fCad_Plano_Contas;
  with fCad_Plano_Contas do begin
    cdsLocal     := dmPlano_Contas.cdsPlano_Contas;
    funcLocal    := Self.funcBasico;
  end;
  btnImprimir.Tag := 273;
end;

procedure TfPlano_Contas.FormShow(Sender: TObject);
begin
  inherited;
  MontaTreeView;
  btnNovo.Enabled := funcBasico.GetLicenca(1) or
                     funcBasico.GetLicenca(2) or
                     funcBasico.GetLicenca(3) or
                     funcBasico.GetLicenca(4) or
                     funcBasico.GetLicenca(5);
  btnEditar.Enabled := btnNovo.Enabled;
end;

procedure TfPlano_Contas.MontaTreeView;

{$REGION 'AdicionaFilhos'}
  procedure AdicionaFilhos(treeItem : TTreeNode; strPLCT_ID : String);
  var
    qryConsI  : TSQLQuery;
    treeNew  : TTreeNode;
  begin
    try
      qryConsI := TSQLQuery.Create(nil);
      qryConsI.SQLConnection := funcBasico.Conexao;
      try
        with qryConsI do begin
          Close;
          sql.Clear;
          sql.Add('SELECT');
          sql.Add('      PLCT_ID,');
          sql.Add('      PLCT_COD_SIMPLIFICADO,');
          sql.Add('      PLCT_DESCRICAO,');
          sql.Add('      PLCT_ATIVO');
          sql.Add('FROM  PLANO_CONTAS');
          sql.Add('WHERE PLCT_EMPR_ID      = 0');
          sql.Add('AND   PLCT_PLCT_ID      = ' + strPLCT_ID);
          sql.Add('AND   PLCT_PLCT_EMPR_ID = 0');
          SQL.Add('AND   PLCT_SISTEMA      = 0');
          sql.Add('ORDER BY PLCT_COD_SIMPLIFICADO');
          Open;
          First;
          while not eof do begin
            treeNew            := treePlano.Items.AddChild(treeItem,Trim(qryConsI.Fields[1].AsString) + ' - ' + Trim(qryConsI.Fields[2].AsString));
            treeNew.StateIndex := qryConsI.FieldByName('PLCT_ATIVO').AsInteger;
            treeNew.Data       := Pointer(qryConsI.FieldByName('PLCT_ID').AsInteger);
            AdicionaFilhos(treeNew,qryConsI.Fields[0].AsString);
            Next;
          end;
        end;
      except
      end;
    finally
      qryConsI.Close;
      FreeAndNil(qryConsI);
    end;
  end;
{$ENDREGION}

var
  qryConsII  : TSQLQuery;
  treeItem : TTreeNode;
begin
  try
    treePlano.Items.Clear;
    qryConsII := TSQLQuery.Create(nil);
    qryConsII.SQLConnection := funcBasico.Conexao;
    try
      with qryConsII do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      PLCT_ID,');
        sql.Add('      PLCT_COD_SIMPLIFICADO,');
        sql.Add('      PLCT_DESCRICAO,');
        sql.Add('      PLCT_ATIVO');
        sql.Add('FROM  PLANO_CONTAS');
        sql.Add('WHERE PLCT_EMPR_ID = 0');
        sql.Add('AND   PLCT_PLCT_ID IS NULL');
        sql.Add('AND   PLCT_SISTEMA = 0');
        sql.Add('ORDER BY PLCT_COD_SIMPLIFICADO');
        Open;
        First;
        while not eof do begin
          treeItem            := treePlano.Items.Add(nil,Trim(qryConsII.Fields[1].AsString) + ' - ' + Trim(qryConsII.Fields[2].AsString));
          treeItem.StateIndex := qryConsII.FieldByName('PLCT_ATIVO').AsInteger;
          treeItem.Data       := Pointer(qryConsII.FieldByName('PLCT_ID').AsInteger);
          AdicionaFilhos(treeItem,qryConsII.Fields[0].AsString);
          Next;
        end;
      end;
    except
    end;
  finally
    qryConsII.Close;
    FreeAndNil(qryConsII);
  end;
end;

procedure TfPlano_Contas.OpenClientDataSet;
begin
  with dmPlano_Contas do begin
    with cdsPlano_Contas do begin
      Close;
      Open;
    end;
  end;
end;

procedure TfPlano_Contas.treePlanoClick(Sender: TObject);
begin
  try
    cdsGeral.Locate('PLCT_ID',Integer(treePlano.Selected.Data),[]);
  except
  end;
end;

procedure TfPlano_Contas.treePlanoCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;
  if Node.StateIndex = 0 then
    Sender.Canvas.Font.Color := clSilver;
end;

procedure TfPlano_Contas.treePlanoDblClick(Sender: TObject);
begin
  inherited;
  btnEditar.Click;
end;

initialization
  RegisterClass(TfPlano_Contas);
finalization
  RegisterClass(TfPlano_Contas);

end.
