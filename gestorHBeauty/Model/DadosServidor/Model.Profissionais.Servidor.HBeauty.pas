unit Model.Profissionais.Servidor.HBeauty;

interface

uses
  Model.Profissionais.HBeauty;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
function CadastraProfissional(AProfissional : TModelProfissionais) : Integer;

implementation

uses
  Controller.ClientModule.HBeauty, Data.FireDACJSONReflect,
  Model.Dados.Server.HBeauty;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
var
   PesquisaProfissionais : TFDJSONDataSets;
begin

   PesquisaProfissionais := ControllerClientModule.ModelMetodosClient.ListaProfissionais(ANome, ACPF, ATipoPesquisa, AID);
   Assert(TFDJSONDataSetsReader.GetListCount(PesquisaProfissionais) = 1);
   ModelConexaoDados.memProfissionais.Active := False;
   ModelConexaoDados.memProfissionais.AppendData(TFDJSONDataSetsReader.GetListValue(PesquisaProfissionais, 0));
   ModelConexaoDados.memProfissionais.Active := True;


end;

function CadastraProfissional(AProfissional : TModelProfissionais) : Integer;
begin

    Result := ControllerClientModule.ModelMetodosClient.CadastraProfissional(AProfissional.TERC_PROFIS, AProfissional.IDCARGO_PROFISS, AProfissional.IDEMPTER_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.NRLOG, AProfissional.CODIGO_PROFIS, AProfissional.NOME_PROFIS,
                                                                             AProfissional.SOBRENOME_PROFIS, AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.LOGRADOURO, AProfissional.ENDERECO_PROFIS.COMPLLOG,
                                                                             AProfissional.ENDERECO_PROFIS.BAIRROLOG, AProfissional.ENDERECO_PROFIS.CIDADELOG,
                                                                             AProfissional.ENDERECO_PROFIS.UFLOG, AProfissional.ENDERECO_PROFIS.CEP,
                                                                             AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

end.
