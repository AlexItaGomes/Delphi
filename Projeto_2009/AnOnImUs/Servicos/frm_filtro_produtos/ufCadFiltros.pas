unit ufCadFiltros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufCadastro, StdCtrls, Buttons, ExtCtrls, ComCtrls, rxToolEdit,
  RXDBCtrl, Mask, DBCtrls, SQLExpr, ExtDlgs;

type
  TfCadFiltros = class(TfCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    edtFiltro: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    OpenPictureDialog: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function JaExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadFiltros: TfCadFiltros;

implementation

uses udmFiltros;

{$R *.dfm}

procedure TfCadFiltros.btnOKClick(Sender: TObject);
begin
  if ValidaDados then begin
    inherited;
    edtFiltro.SetFocus;
  end else IsValidData;
end;

function TfCadFiltros.ValidaDados : Boolean;
begin
  Result := true;
  if edtFiltro.Text = '' then begin
    funcLocal.Alerta('Informe a descrição para a modelo do produto antes de continuar.',1);
    edtFiltro.SetFocus;
    Result := false;
    Exit;
  end;
  if JaExiste then begin
    funcLocal.Alerta('já consta outro registro para esta descrição.',1);
    edtFiltro.SetFocus;
    Result := false;
    Exit;
  end;
end;

function TfCadFiltros.JaExiste : Boolean;
var
  qryCons : TSQLQuery;
begin
  Result := true;
  try
    qryCons := TSQLQuery.Create(nil);
    qryCons.SQLConnection := funcLocal.Conexao;
    try
      with qryCons do begin
        Close;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('      COUNT(*)');
        sql.Add('FROM  GENERICA');
        sql.Add('WHERE GENE_EMPR_ID = ' + IntToStr(funcLocal.Empr_ID));
        sql.Add('AND   GENE_TGEN_ID = 520');
        sql.Add('AND   GENE_ID     <> ' + cdsLocal.FieldByName('GENE_ID').AsString);
        sql.Add('AND   GENE_DESCR   = ' + QuotedStr(cdsLocal.FieldByName('GENE_DESCR').AsString));
        Open;
      end;
      Result := (qryCons.Fields[0].AsInteger > 0)
    except on e: exception do begin
      funcLocal.Alerta('Erro no processo de validação do registro.'+#13+'['+e.Message+']',1);
      funcLocal.ReportaErro(Caption,'JaExiste',e.Message);
    end; end;
  finally
    qryCons.Close;
    FreeAndNil(qryCons);
  end;
end;

procedure TfCadFiltros.DBImage1DblClick(Sender: TObject);
var
  imgLogo : TBitmap;
begin
  try
    imgLogo := TBitmap.Create;
    if OpenPictureDialog.Execute then begin
      imgLogo.LoadFromFile(OpenPictureDialog.FileName);
      cdsLocal.FieldByName('GENE_IMAGE').Assign(imgLogo);
    end;
  except on e: exception do begin
    funcLocal.ReportaErro(Caption,(Sender as TComponent).Name,funcLocal.User_Login,e.Message);
    funcLocal.Alerta(e.Message,1);
  end; end;
end;

procedure TfCadFiltros.FormShow(Sender: TObject);
begin
  inherited;
  edtFiltro.SetFocus;
end;

initialization
  fCadFiltros := TfCadFiltros.Create(nil);
finalization
  FreeAndNil(fCadFiltros);


end.
