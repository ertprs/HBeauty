unit
Model.Metodos.Genericos.ServerHBeauty;

interface

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;
function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdUsuario, AIdRegistro : Integer; ACampoID, ATabela : String) : Boolean;


implementation


uses
  Controller.Conexao.HBeautyServer, System.SysUtils, Units.Utils.ServerBeauty;


function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdUsuario, AIdRegistro : Integer; ACampoID, ATabela : String) : Boolean;
var
ARes : Boolean;
begin
     try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT LOCK FROM ' + ATabela);
        ControllerConexao.qryQuery.SQL.Add('WHERE ' + ACampoID + ' = ' + AIdRegistro.ToString);
        ControllerConexao.qryQuery.Open;

        ARes := StrToBolValue(ControllerConexao.qryQuery.FieldByName('LOCK').AsString,'T','F');

        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('UPDATE ' + ATabela + ' SET');
        ControllerConexao.qryQuery.SQL.Add('LOCK = ' + QuotedStr(BoolToStrValue(ABloqueia,'F','T')) + ',');
        ControllerConexao.qryQuery.SQL.Add('IDUSULOCK = ' + AIDUsuario.ToString);
        ControllerConexao.qryQuery.SQL.Add('WHERE ' + ACampoID + ' = ' + AIdRegistro.ToString);
        ControllerConexao.qryQuery.ExecSQL;
        Result := ARes;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT ' + ACampoNome + ' FROM ' + ATabela);
         ControllerConexao.qryQuery.SQL.Add('WHERE ' + ACampoDocumento + ' = ' + QuotedStr(ADocumento));
         ControllerConexao.qryQuery.Open;

         Result := ControllerConexao.qryQuery.FieldByName(ACampoNome).AsString;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;


end.