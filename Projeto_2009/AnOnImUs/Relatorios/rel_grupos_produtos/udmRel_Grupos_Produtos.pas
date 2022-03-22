unit udmRel_Grupos_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Grupos_Produtos = class(TdmBasico)
    qryRelGrupos: TSQLQuery;
    dspRelGrupos: TDataSetProvider;
    cdsRelGrupos: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsRelGrupos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Grupos_Produtos: TdmRel_Grupos_Produtos;

implementation

{$R *.dfm}

initialization
  dmRel_Grupos_Produtos := TdmRel_Grupos_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Grupos_Produtos);

end.
