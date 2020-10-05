unit Model.Controle.ServerHBeauty;

interface

uses Model.Metodos.ServerHBeauty, Data.FireDACJSONReflect, Utils.Query.HBeautyServer;


function CarregaControle : TFDJSONDataSets;


var
   FQuery : TUtilsQuery;

implementation

uses
  System.SysUtils;



function CarregaControle : TFDJSONDataSets;
begin

    try
        FQuery := TUtilsQuery.Create;
        FQuery.Close;
        FQuery.SQL.Clear;
        FQuery.SQL.Add('SELECT * FROM HBCONTROLE');

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, FQuery);
        FQuery.Active := True;
    finally
        FreeAndNil(FQuery);
    end;

end;




end.
