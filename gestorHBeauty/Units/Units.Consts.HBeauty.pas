unit Units.Consts.HBeauty;

interface

uses
  System.UITypes;

const

     AurlXMLGetIdCidade    : String = 'http://servicos.cptec.inpe.br/XML/listaCidades?city=%s';
     AurlXMLGetTemperatura : String = 'http://servicos.cptec.inpe.br/XML/Cidade/%s/previsao.xml';


     //grid do Form de Profissionais
     AFieldsProfissionais  : Array [0..10] of  String = ('ID_PROFIS', 'CPF_PROFIS','NOME_PROFIS','SOBRENOME_PROFIS','LOGRADOURO_PROFIS', 'NRLOG_PROFIS',
                                                         'COMPLLOG_PROFIS','BAIRROLOG_PROFIS','CEP_PROFIS','CIDADELOG_PROFIS','UFLOG_PROFIS');
     ACaptionProfissionais : Array [0..10] of String = ('C�digo','CPF','Nome','SobreNome','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');

     //grid do Form de cadastro de telefones
     AFieldsTelefones  : Array [0..4] of  String = ('ID_FONE','NR_FONE','CONTATO_FONE','WHATS_FONE','RESTRITO_FONE');
     ACaptionTelefones : Array [0..4] of String = ('C�digo','Telefone','Contato','ZAP','Restrito');

     //Status da a��o do form
     stInclusao  : String = 'Inclusao';
     stAlteracao : String = 'Alteracao';
     stNula      : String = 'Nulo';

var
   ctrCOR_BOTOES_POSITIVO  : TAlphaColor;
   ctrCOR_BOTOES_NEGATIVO  : TAlphaColor;
   ctrCOR_RODAPE_FORMS     : TAlphaColor;
   ctrCOR_CABECARIO_FORMS  : TAlphaColor;

   ctrLOGO_EMPRESA         : String;
   ctrIMG_FUNDO_PRINCIPAL  : String;
   ctrIMG_FUNDO_LOGIN      : String;
   ctrPATH_IMAGENS         : String;
   ctrPATH_LOGOS           : String;
   ctrMINI_LOGO_EMPRESA    : String;

   ctrFULL_SCREEN          : Boolean;
implementation


end.
