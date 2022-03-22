unit ufrm_GeradorKey;

interface

uses
  System.SysUtils, System.Classes, ufBasico, frxClass, frxDBSet, frxDesgn,
  Vcl.Menus, Funcoes, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Buttons, Vcl.Mask, RxToolEdit,
  frxExportPDF;

type
  TfGeradorKey = class(TfBasico)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    lblCliente: TLabel;
    lblCNPJ: TLabel;
    edtChave: TEdit;
    Label4: TLabel;
    edtDtFim: TDateEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGeradorKey: TfGeradorKey;

implementation

{$R *.dfm}

uses uDmGeradorKey, Data.SqlExpr;

procedure TfGeradorKey.btnNovoClick(Sender: TObject);
var
  strKey : String;
  Cnpj   : String;
  Chave  : Array[1..22] of String;
  intI   : Integer;
begin
  Cnpj  := StringReplace(StringReplace(StringReplace(lblCNPJ.Caption+edtDtFim.Text,'.','',[rfReplaceAll]),'/','',[rfReplaceAll]),'-','',[rfReplaceAll]);
  Chave[1]  := Copy(Cnpj,1,1);
  Chave[5]  := Copy(Cnpj,2,1);
  Chave[2]  := Copy(Cnpj,3,1);
  Chave[8]  := Copy(Cnpj,4,1);
  Chave[9]  := Copy(Cnpj,5,1);
  Chave[6]  := Copy(Cnpj,6,1);
  Chave[3]  := Copy(Cnpj,7,1);
  Chave[11] := Copy(Cnpj,8,1);
  Chave[4]  := Copy(Cnpj,9,1);
  Chave[7]  := Copy(Cnpj,10,1);
  Chave[18] := Copy(Cnpj,11,1);
  Chave[16] := Copy(Cnpj,12,1);
  Chave[17] := Copy(Cnpj,13,1);
  Chave[15] := Copy(Cnpj,14,1);
  Chave[14] := Copy(Cnpj,15,1);
  Chave[12] := Copy(Cnpj,16,1);
  Chave[21] := Copy(Cnpj,17,1);
  Chave[22] := Copy(Cnpj,18,1);
  Chave[19] := Copy(Cnpj,19,1);
  Chave[20] := Copy(Cnpj,20,1);
  Chave[13] := Copy(Cnpj,21,1);
  Chave[10] := Copy(Cnpj,22,1);


  strKey := '';
  for intI := 1 to 22 do begin
    strKey := strKey + Chave[intI];
  end;

  strKey := funcBasico.Criptografar2(Copy(strKey,1,5) +'.'+
                                     Copy(strKey,6,5) +'.'+
                                     Copy(strKey,11,5)+'.'+
                                     Copy(strKey,16,5)+'.'+
                                     Copy(strKey,21,2));


  edtChave.Text := Copy(strKey,1,5)+'-'+Copy(strKey,6,10)+'-'+Copy(strKey,16,3)+'-'+Copy(strKey,19,5)+'-'+Copy(strKey,24,3);
end;

procedure TfGeradorKey.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  lblCliente.Caption := dmGeradorKey.cdsRelClientesCLIE_RAZAO_SOCIAL.AsString;
  lblCNPJ.Caption    := dmGeradorKey.cdsRelClientesCLIE_CNPJ_CPF.AsString;
end;

procedure TfGeradorKey.FormCreate(Sender: TObject);
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  inherited;
end;

initialization
  RegisterClass(TfGeradorKey);
finalization
  UnRegisterClass(TfGeradorKey);

end.
