unit FdConexao.GravarConnectionDefs;


interface

uses
  Vcl.StdCtrls, System.SysUtils, System.Classes,
  Winapi.Windows, Winapi.Messages,  System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FdConexao.Model.Interfaces,
  StrUtils;

type

  TConexaoDefs = class (TInterfacedObject, iConexao)
  private
    FNomeDoIni : String;

   function NomeDoIni(Value : String) : iConexao;
   function NomeTituloIni (Value : String) : iConexao; virtual; abstract;
   function NumeroPorta(Value : String): iConexao;  virtual; abstract;
   function NumeroIP (Value : String) : iConexao;  virtual; abstract;
   function NomeCaminho (Value : String) : iConexao; virtual; abstract;
   function VerificarEdit(Value : String) : iConexao;  virtual; abstract;
   function NomeDoEdit (Value : String) : iConexao;  virtual; abstract;

  public
    Memo : TMemo;
    MemoFinal : TMemo;
    constructor create;
    destructor Destroy ; override;
    class function New : iConexao;

    procedure GravarArquivoIni; virtual; abstract;
    procedure GravarArquivoDefsIni; virtual; abstract;

    procedure LerArquivoIni;

  end;


implementation

uses
  uPrincipal;

{ TPreencherMemo }

constructor TConexaoDefs.create;
begin
  Memo := TMemo.Create(Application);
  MemoFinal  := TMemo.Create(Application);
end;

destructor TConexaoDefs.Destroy;
begin


   inherited;
end;


procedure TConexaoDefs.LerArquivoIni;
var
  I : integer;
begin
      for I := 1 to 12 do
      begin
      Memo.Parent :=  TForm(Application.MainForm);   // Screen.ActiveForm;
      Memo.Width := 310;
      Memo.Height := 160;
      Memo.Lines.Clear;
      Memo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+FNomeDoIni+IntTostr(I)+'.txt');

      MemoFINAL.Parent :=  TForm(Application.MainForm);
      MemoFINAL.Width := 310;
      MemoFINAL.Height := 160;
      MemoFINAL.Lines.Add(Memo.Text);
      end;

      MemoFINAL.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'FDConnectionDefs.ini');
      FreeandNil(MemoFinal);
      FreeandNil(Memo);
end;

class function TConexaoDefs.New: iConexao;
begin
  Result := Self.create;
end;


function TConexaoDefs.NomeDoIni(Value: String): iConexao;
begin
   Result := Self;
   FNomeDoIni  := Value;
   LerArquivoIni;
end;


end.
