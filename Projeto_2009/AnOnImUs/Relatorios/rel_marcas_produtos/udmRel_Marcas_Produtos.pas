unit udmRel_Marcas_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBasico, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmRel_Marcas_Produtos = class(TdmBasico)
    qryRelMarcas: TSQLQuery;
    dspRelMarcas: TDataSetProvider;
    cdsRelMarcas: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsRelMarcas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel_Marcas_Produtos: TdmRel_Marcas_Produtos;

implementation

{$R *.dfm}

initialization
  dmRel_Marcas_Produtos := TdmRel_Marcas_Produtos.Create(nil);
finalization
  FreeAndNil(dmRel_Marcas_Produtos);

end.
