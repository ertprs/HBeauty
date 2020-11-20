unit View.Habilidades.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBitmap, ACBrBase, ACBrValidador, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Layouts, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, Units.Enumerados.HBeauty, Model.Profissionais.HBeauty, View.Profissionais.HBeauty, Model.Profissionais.Servidor.HBeauty,
  Model.Habilidades.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty;

type
  TfrmCadastroHabilidades = class(TForm)
    recRodapeHabilidades: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    StyleBook2: TStyleBook;
    recCabecarioTelefones: TRectangle;
    imgIconeForm: TTMSFMXImage;
    Line1: TLine;
    lblTituloForm: TLabel;
    Label1: TLabel;
    grdListaHabilidade: TTMSFMXGrid;
    lytCadastraHabilidade: TLayout;
    Rectangle15: TRectangle;
    edtTelefone: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Memo1: TMemo;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FStatus : TAcaoBotao;
    FidHabilidadeSelecionada : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroHabilidades: TfrmCadastroHabilidades;

implementation

uses
  Units.Classes.HBeauty,
  Controller.Manipula.Design.HBeauty, Model.Dados.Server.HBeauty,
  Units.Consts.HBeauty;

{$R *.fmx}

procedure TfrmCadastroHabilidades.btnAlterarClick(Sender: TObject);
begin
    FStatus := abAlterar;

    if FidHabilidadeSelecionada > 0 then
       begin
            //Carrega a classe
            lytCadastraHabilidade.Visible := True;

            //Carrega as informações nos campos
            with ModelConexaoDados.memContatos do
                begin
                    edtTelefone.Text := FieldByName('NR_FONE').AsString;
//                    edtContato.Text  := FieldByName('CONTATO_FONE').AsString;
//                    chkWhatsApp.IsChecked := StringToBool('T','F',FieldByName('WHATS_FONE').AsString);
//                    chkTelefoneRestrito.IsChecked := StringToBool('T','F',FieldByName('RESTRITO_FONE').AsString);
//                    chkInativarFone.IsChecked := StringToBool('T','F',FieldByName('INATIVO_FONE').AsString);
//                    BloqueiaRegistro(True, FIdContatoSelecionado, tcTelefones);
                end;
       end;
end;

procedure TfrmCadastroHabilidades.btnFecharClick(Sender: TObject);
begin
     //Fecha o Form
     Close;
end;

procedure TfrmCadastroHabilidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroHabilidades.FormCreate(Sender: TObject);
begin
    CarregaPersonalizacaoCabecarioRodape(Self);

    //Cria a classe de habilidades e exibe o layout com os campos referidos
    gclHabilidade := TModelHabilidades.Create;

    grdListaHabilidade.Cells[0,0] := 'Habilidade';
    grdListaHabilidade.Cells[1,0] := 'Descrição';

    carregaHabilidades;

    CarregaGrid(ModelConexaoDados.memHabilidades,grdListaHabilidade, AFieldsHabilidades, ACaptionHabilidades, ASizeColHabilidades);

    if ModelConexaoDados.memProfissionais.RecordCount > 0 then
        FidHabilidadeSelecionada :=  ExtraiTextoGrid(grdListaHabilidade.Cells[0, 1]).ToInteger;

end;

end.
