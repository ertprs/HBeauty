unit Model.Terceirizada.HBeauty;

interface

uses
    ACBRValidador,
    Model.Endereco.HBeauty,
    FMX.Forms,
    FMX.Platform.Win, Units.Utils.HBeauty;

type
    TModelTerceirizada = class
        private
            FID_TERCEIRIZADA: Integer;
            FIE_TERCEIRIZADA: String;
            FDATACADASTRO_TERCEIRIZADA: TDate;
            FENDERECO_TERCEIRIZADA: TModelEndereco;
            FRAZAO_TERCEIRIZADA: String;
            FFANTASIA_TERCEIRIZADA: String;
            FCNPJ_TERCEIRIZADA: String;
            FValidador : TACBRValidador;
            FForm : TForm;
            FCODIGO_TERCEIRIZADA: Integer;
            procedure SetCNPJ_TERCEIRIZADA(const Value: String);
            procedure SetDATACADASTRO_TERCEIRIZADA(const Value: TDate);
            procedure SetENDERECO_TERCEIRIZADA(const Value: TModelEndereco);
            procedure SetFANTASIA_TERCEIRIZADA(const Value: String);
            procedure SetID_TERCEIRIZADA(const Value: Integer);
            procedure SetIE_TERCEIRIZADA(const Value: String);
            procedure SetRAZAO_TERCEIRIZADA(const Value: String);
            procedure SetCODIGO_TERCEIRIZADA(const Value: Integer);

        public
            property ID_TERCEIRIZADA           : Integer        read FID_TERCEIRIZADA           write SetID_TERCEIRIZADA;
            property CNPJ_TERCEIRIZADA         : String         read FCNPJ_TERCEIRIZADA         write SetCNPJ_TERCEIRIZADA;
            property IE_TERCEIRIZADA           : String         read FIE_TERCEIRIZADA           write SetIE_TERCEIRIZADA;
            property RAZAO_TERCEIRIZADA        : String         read FRAZAO_TERCEIRIZADA        write SetRAZAO_TERCEIRIZADA;
            property FANTASIA_TERCEIRIZADA     : String         read FFANTASIA_TERCEIRIZADA     write SetFANTASIA_TERCEIRIZADA;
            property ENDERECO_TERCEIRIZADA     : TModelEndereco read FENDERECO_TERCEIRIZADA     write SetENDERECO_TERCEIRIZADA;
            property DATACADASTRO_TERCEIRIZADA : TDate          read FDATACADASTRO_TERCEIRIZADA write SetDATACADASTRO_TERCEIRIZADA;
            property CODIGO_TERCEIRIZADA       : Integer        read FCODIGO_TERCEIRIZADA       write SetCODIGO_TERCEIRIZADA;
            constructor create(AForm : TForm);
    end;


implementation

{ TModelTerceirizada }

uses
    Units.Strings.HBeauty, Winapi.Windows, Units.Consts.HBeauty,
  System.SysUtils;

constructor TModelTerceirizada.create(AForm : TForm);
begin

     FValidador := TACBrValidador.Create(nil);
     FEndereco_Terceirizada := TModelEndereco.Create(AForm);
     FForm := AForm;

end;

procedure TModelTerceirizada.SetCNPJ_TERCEIRIZADA(const Value: String);
begin

    if validaCNPJCPF(FForm, Value, 'C.N.P.J.') = True  then
        FCNPJ_TERCEIRIZADA := ApenasNumeros(Value);

end;

procedure TModelTerceirizada.SetCODIGO_TERCEIRIZADA(const Value: Integer);
begin
  FCODIGO_TERCEIRIZADA := Value;
end;

procedure TModelTerceirizada.SetDATACADASTRO_TERCEIRIZADA(const Value: TDate);
begin
  FDATACADASTRO_TERCEIRIZADA := Value;
end;

procedure TModelTerceirizada.SetENDERECO_TERCEIRIZADA(const Value: TModelEndereco);
begin
    FENDERECO_TERCEIRIZADA := Value;
end;

procedure TModelTerceirizada.SetFANTASIA_TERCEIRIZADA(const Value: String);
begin
  FFANTASIA_TERCEIRIZADA := Value;
end;

procedure TModelTerceirizada.SetID_TERCEIRIZADA(const Value: Integer);
begin
    FID_TERCEIRIZADA := Value;
end;

procedure TModelTerceirizada.SetIE_TERCEIRIZADA(const Value: String);
var
AMsg : String;
begin
    AMsg := '';
    if ApenasNumeros(Value) <> '' then
        begin
            if Value <> 'ISENTO' then
                begin
                    AMsg := ACBRValidador.ValidarIE(ApenasNumeros(Value), FENDERECO_TERCEIRIZADA.UFLOG);
                    AMsg := AMsg + #13#13 + 'Caso seja isento preencha "ISENTO" no campo I.E.';
                    if AMsg <> '' then
                        begin
                            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                                       pChar(AMsg), apTitulo, MB_OK + MB_ICONWARNING);
                                       Abort;
                        end
                    else
                       begin
                           FIE_TERCEIRIZADA := ApenasNumeros(Value);
                       end;
                end
            else
                begin
                     FIE_TERCEIRIZADA := Value;
                end;
        end;
end;

procedure TModelTerceirizada.SetRAZAO_TERCEIRIZADA(const Value: String);
begin

    if validaCampoVazio(FForm, Value, 'raz�o social', 5) = True then
        FRAZAO_TERCEIRIZADA := Value;

end;

end.

