unit Units.Utils.HBeauty;

interface

uses Units.Consts.HBeauty, FMX.Objects, FMX.Forms, FMX.Layouts, Units.Enumerados.HBeauty,
  FMX.Edit, FMX.ListBox, FMX.NumberBox, FMX.Memo, ACBrValidador;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
function PrefixoTabela(ATabela : TTabelaCadastrada) : String;
function ExtraiTextoGrid(AValue : String) : String;
function validaCNPJCPF(AForm : TForm; AValue, ACampo : String) : Boolean;
function validaCampoVazio(AForm : TForm; AValue, ACampo : String; ATamanho : Integer = 0) : Boolean;

procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);
procedure ControlaBotoes(AForm : TForm; AOpcao: Boolean);

procedure NextField(Key : Word; ANext : TEdit); overload;
procedure NextField(Key : Word; ANext : TComboBox); overload;
procedure NextField(Key : Word; ANext : TNumberBox); overload;
procedure NextField(Key : Word; ANext : TMemo); overload;

var
FValidador : TACBRValidador;

implementation

uses
  Winapi.Windows, System.Classes, FMX.TMSButton, System.UITypes,
  FMX.Platform.Win, Units.Strings.HBeauty, System.SysUtils;

function validaCampoVazio(AForm : TForm; AValue, ACampo : String; ATamanho : Integer = 0) : Boolean;
var
AMsg : String;
begin

    if ATamanho <= 0 then
       AMsg := 'O campo ' + ACampo + ' n�o pode ser nulo, corrija!' else
       AMsg := 'O campo ' + ACampo + ' deve conter no minimo ' + (ATamanho + 1).ToString + ' caracteres!';

    if Length(AValue) <= ATamanho then
        begin
            Result := False;
            MessageBox(WindowHandleToPlatform(AForm.Handle).Wnd,
                       pChar(AMsg), apTitulo, MB_OK + MB_ICONWARNING);
            Abort;
       end
   else
       begin
           Result := True;
       end;

end;

function validaCNPJCPF(AForm : TForm; AValue, ACampo : String) : Boolean;
var
AValor, ADoc : String;
begin
     AValor := ApenasNumeros(AValue);
     FValidador := TACBrValidador.Create(nil);
     case Length(AValor) of
          11 : begin
                   ADoc := 'C.P.F.';
                   FValidador.TipoDocto := docCPF;
               end;
          14 : begin
                   ADoc := 'C.N.P.J.';
                   FValidador.TipoDocto := docCNPJ;
               end;
     end;

     FValidador.Documento := AValor;

     case FValidador.Validar of
          True : Result := True;
         False : begin
                     MessageBox(WindowHandleToPlatform(AForm.Handle).Wnd,
                                pChar(FValidador.MsgErro), apTitulo, MB_OK + MB_ICONWARNING);
                     Abort;
                 end;
     end;

end;

function ExtraiTextoGrid(AValue : String) : String;
var
    AIndex : Integer;
    ARes   : String;
    ACopia : Boolean;
begin
    ARes   := '';
    ACopia := False;

    for AIndex := 0 to Length(AValue) - 1 do
        begin
            if (ACopia = True) or (AValue[AIndex - 1] = '>') and (AValue[AIndex] <> '<') then
               begin
                    ACopia := True;
                    if ACopia then
                       if AValue[AIndex] <> '<' then
                          ARes := ARes + AValue[AIndex] else
                          Break;
               end;
        end;

    Result := ARes;

end;

function PrefixoTabela(ATabela : TTabelaCadastrada) : String;
begin

     case ATabela of
         tcProfissionais  : Result := 'PROFIS';
         tcFornecedores   : Result := 'FORNEC';
         tcClientes       : Result := 'CLIENT';
         tcTercerizadas   : Result := 'EMPTER';
         tcTelefones      : Result := 'TELEFO';
         tcEmails         : Result := 'EMAILS';
     end;

end;

procedure NextField(Key : Word; ANext : TEdit);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

procedure NextField(Key : Word; ANext : TNumberBox);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

procedure NextField(Key : Word; ANext : TMemo);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

procedure NextField(Key : Word; ANext : TComboBox);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
var
ARes : Boolean;
begin
     ARes := False;
     if AValue = ATrue  then ARes := True;
     if AValue = AFalse then ARes := False;

     Result := ARes;
end;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
var
ARes : String;
begin
     ARes := '';
     case AValue of
          True : ARes := ATrue;
         False : ARes := AFalse;
     end;

     Result := ARes;

end;

procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);
var
InStream: TResourceStream;
begin

   InStream := TResourceStream.Create(HInstance, NomeImagem, RT_RCDATA);
   try
      Image.Bitmap.LoadFromStream(InStream);
   finally
      InStream.Free;
   end;

end;

procedure ControlaBotoes(AForm : TForm; AOpcao: Boolean);
begin

         try
             TTMSFMXButton(AForm.FindComponent('btnIncluir')).Visible   := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnAlterar')).Visible   := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnAtualizar')).Visible := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnFechar')).Visible    := AOpcao;
         except

         end;

         try
             TTMSFMXButton(AForm.FindComponent('btnSalvar')).Visible    := not AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnCancelar')).Visible  := not AOpcao;
         except

         end;

end;


end.
