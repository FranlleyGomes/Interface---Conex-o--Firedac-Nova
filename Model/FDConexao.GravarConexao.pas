unit FDConexao.GravarConexao;


interface

uses
  Vcl.StdCtrls, System.SysUtils, System.Classes,
  Winapi.Windows, Winapi.Messages,  System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FdConexao.Model.Interfaces;

type

  TGravarConexao = class (TInterfacedObject, iConexao)
  private
    FNomeDoIni : String;
    FNomeTituloIni : String;
    FNumeroPorta: String;
    FNumeroIp: String;
    FNomeCaminho: String;
    FNomeDoEdit : String;

   function NomeDoIni(Value : String) : iConexao;
   function NomeTituloIni (Value : String) : iConexao;
   function NumeroPorta(Value : String): iConexao;
   function NumeroIP (Value : String) : iConexao;
   function NomeCaminho (Value : String) : iConexao;
   function VerificarEdit(Value : String) : iConexao; virtual;
   function NomeDoEdit (Value : String) : iConexao;
   function IsValidIPFormat(const aIP: string): Boolean;

  public
    memo : TMemo;
    constructor create;
    destructor Destroy ; override;
    class function New : iConexao;
    procedure GravarArquivoIni;
  end;




implementation

uses
   uPrincipal;

{ TPreencherMemo }

constructor TGravarConexao.create;
begin
  memo := TMemo.Create(Application);
  memo.Visible := False;
end;

destructor TGravarConexao.destroy;
begin
   FreeandNil(memo);
  inherited;
end;


procedure TGravarConexao.GravarArquivoIni;
begin

       with memo do
         begin

          Parent := Screen.ActiveForm ;
          Lines.Clear;
          Lines.Add('['+FNomeTituloIni+']');
          Lines.Add('Database='+FNomeCaminho);
          Lines.Add('User_Name=SYSDBA');
          Lines.Add('Password=masterkey');
          Lines.Add('CharacterSet=WIN1252');
          Lines.Add('Port='+FNumeroPorta);
          Lines.Add('Protocol=TCPIP');
          Lines.Add('Server='+FNumeroIp);
          Lines.Add('PageSize=4096');
          Lines.Add('DriverID=FB');
          Lines.SaveToFile(ExtractFilePath(Application.ExeName)+FNomeDoIni);
         end;

end;


class function TGravarConexao.New: iConexao;
begin
  Result := Self.create;
end;

function TGravarConexao.NomeCaminho(Value: String): iConexao;
begin
  Result := Self;
  FNomeCaminho := Value;
  GravarArquivoIni;
end;

function TGravarConexao.NomeDoEdit(Value: String): iConexao;
begin
   Result := Self;
   FNomeDoEdit := Value;
end;

function TGravarConexao.NomeDoIni(Value: String): iConexao;
begin
  Result := Self;
  FNomeDoIni := Value;
end;

function TGravarConexao.NomeTituloIni(Value: String): iConexao;
begin
 Result := Self;
 FNomeTituloIni := Value;
end;

function TGravarConexao.NumeroIP(Value: String): iConexao;
begin
  Result := Self;

  if Value = '' then
     Value := '127.0.0.1';



    if (IsValidIPFormat(Value)) then
      FNumeroIp := Value
    else
    begin
      ShowMessage('IP com formato inválido no '+FNomeDoEdit+'.'+#13+'Será colocado o Nr. do Ip Local'+#13+'127.0.0.1 no '+FNomeDoIni);
      FNumeroIp := '127.0.0.1';
    end;


end;

function TGravarConexao.NumeroPorta(Value: String): iConexao;
begin
 Result := Self;

   if Value = '' then
    FNumeroPorta := '3050'
  else
    FNumeroPorta := Value;
end;


function TGravarConexao.VerificarEdit(Value: String): iConexao;
begin

end;

function TGravarConexao.IsValidIPFormat(const aIP: string): Boolean;
var
  vAux : TStrings;
  I: Integer;
begin
  vAux := TStringList.Create;
  vAux.Delimiter := '.';
  vAux.DelimitedText := aIP;

  Result := True;

  if (vAux.Count = 4) then
  begin
    for I := 0 to vAux.Count - 1 do
      if not ( StrToInt(vAux[i]) in [0..255]) then
      begin
        Result := False;
        Break;
      end;
  end
  else
    Result := False;
  //
  vAux.Destroy;
end;


end.
