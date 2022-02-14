unit FdConexao.LerConexao;


interface

uses
  Vcl.StdCtrls, System.SysUtils, System.Classes,
  Winapi.Windows, Winapi.Messages,  System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FdConexao.Model.Interfaces,
  StrUtils;

type

  TLerConexao = class (TInterfacedObject, iConexao)
  private
    FNomeDoIni : String;
    FNumeroPorta: String;
    FNumeroIp: String;
    FNomeCaminho: String;
    FVerificarEdit : String;
    FNomeDoEdit : String;

   function NomeDoIni(Value : String) : iConexao;
   function NomeTituloIni (Value : String) : iConexao; virtual; abstract;
   function NumeroPorta(Value : String): iConexao;
   function NumeroIP (Value : String) : iConexao;
   function NomeCaminho (Value : String) : iConexao;
   function VerificarEdit(Value : String) : iConexao;
   function NomeDoEdit (Value : String) : iConexao;

  public
    Memo : TMemo;
    constructor create;
    destructor Destroy ; override;
    class function New : iConexao;

    function TextoEntre(Texto, Delimitador1,
    Delimitador2: String; CaseSensitive : boolean = false): string;

    procedure GravarArquivoIni; virtual; abstract;
    procedure GravarArquivoDefsIni; virtual; abstract;

    procedure LerArquivoIni;
    procedure LerArquivoDefsIni;

  end;


implementation

uses
  uPrincipal;

{ TPreencherMemo }

constructor TLerConexao.create;
begin
 // Memo := TMemo.Create(Application);
end;

destructor TLerConexao.Destroy;
begin

   inherited;
end;


procedure TLerConexao.LerArquivoDefsIni;
begin

end;

procedure TLerConexao.LerArquivoIni;
begin
      Memo := TMemo.Create(Application);

      Memo.Parent :=  TForm(Application.MainForm);   // Screen.ActiveForm ;
      Memo.Width := 310;
      Memo.Height := 160;
      Memo.Lines.Clear;
      Memo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+FNomeDoIni);

      if FVerificarEdit = 'Editip' then
        TEdit(frmPrincipal.FindComponent(FNomeDoEdit)).Text :=   TextoEntre(Memo.Lines.Strings[7], '=', '');
      if FVerificarEdit = 'EdtNrPorta' then
        TEdit(frmPrincipal.FindComponent(FNomeDoEdit)).Text :=   TextoEntre(Memo.Lines.Strings[5], '=', '');
      if FVerificarEdit = 'Edit' then
        TEdit(frmPrincipal.FindComponent(FNomeDoEdit)).Text :=   TextoEntre(Memo.Lines.Strings[1], '=', '');
     if Memo <> Nil then
        FreeandNil(Memo);
end;

class function TLerConexao.New: iConexao;
begin
  Result := Self.create;
end;

function TLerConexao.NomeCaminho(Value: String): iConexao;
begin
  Result := Self;
  FNomeCaminho := Value;
end;

function TLerConexao.NomeDoEdit(Value: String): iConexao;
begin
  Result := Self;
  FNomeDoEdit := Value;
  LerArquivoIni;
end;

function TLerConexao.NomeDoIni(Value: String): iConexao;
begin
   Result := Self;
   FNomeDoIni  := Value;
end;

function TLerConexao.NumeroIP(Value: String): iConexao;
begin
  Result := Self;
  FNumeroIp := Value
end;

function TLerConexao.NumeroPorta(Value: String): iConexao;
begin
 Result := Self;
 FNumeroPorta := Value;
end;

function TLerConexao.VerificarEdit(Value: String): iConexao;
begin
 Result := Self;
 FVerificarEdit := Value;
end;

function TLerConexao.TextoEntre(Texto, Delimitador1, Delimitador2: String;
  CaseSensitive: boolean): string;
  var Inicio, Fim : Integer;
      Saida : string;
begin
  // Passar o texto para variável temporária
  Saida := Texto;
  // Verificar se é sensível ao caso
  // Pegar o início
  if CaseSensitive then
    Inicio := Pos(Delimitador1, Saida)
  else
    Inicio := Pos(ansiUpperCase(Delimitador1), ansiLowerCase(Saida));
  // Verificar se localizou
  if Inicio > 0 then
    Saida := Copy(Saida, Inicio + Length(Delimitador1), Length(Saida));

  // Pegar o fim
  if CaseSensitive then
    Fim := Pos(Delimitador2, Saida)
  else
    Fim := Pos(ansiUpperCase(Delimitador2), ansiUpperCase(Saida));

  // Verificar se localizou
  if Fim > 0 then
    Saida := Copy(Saida, 1, Fim - 1);

  // retornar o resultado
  Result := Saida;

end;



end.
