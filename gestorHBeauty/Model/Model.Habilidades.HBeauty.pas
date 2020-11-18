unit Model.Habilidades.HBeauty;

interface

uses
    FMX.Forms;

type
    TModelHabilidades = class
    private
        FNomeHabilidade: String;
        FDescricaoHabilidade: String;
        FIdabilidade: Integer;
        FForm : TForm;
        procedure SetDescricaoHabilidade(const Value: String);
        procedure SetNomeHabilidade(const Value: String);
        procedure SetIdHabilidade(const Value: Integer);
    public
        property IdHabilidade        : Integer read FIdabilidade         write SetIdHabilidade;
        property NomeHabilidade      : String  read FNomeHabilidade      write SetNomeHabilidade;
        property DescricaoHabilidade : String  read FDescricaoHabilidade write SetDescricaoHabilidade;
    end;

implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty;

{ TModelHabilidades }

procedure TModelHabilidades.SetDescricaoHabilidade(const Value: String);
begin
    if Value = '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'A descri��o da habilidade n�o pode ser vazio!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Exit;
        end
    else
        begin
            FDescricaoHabilidade := Value;
        end;
end;

procedure TModelHabilidades.SetIdHabilidade(const Value: Integer);
begin
  FIdabilidade := Value;
end;

procedure TModelHabilidades.SetNomeHabilidade(const Value: String);
begin
    if Value = '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'A habilidade n�o pode ser vazio!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Exit;
        end
    else
        begin
            FNomeHabilidade := Value;
        end;
end;

end.
