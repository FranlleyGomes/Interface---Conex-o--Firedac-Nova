unit uSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uPrincipal;

type
  TFormSenha = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSenha: TFormSenha;

implementation

{$R *.dfm}

procedure TFormSenha.SpeedButton1Click(Sender: TObject);
begin
  key := 0;
  if (Edit1.text = 'ADM') or
     (Edit1.text = 'adm')then
  begin
  key := 1;
  close;
  end else begin
  key := 0;
  MessageBox(Handle, 'Senha incorreta.', 'Erro!', 4112);
  end;
end;

procedure TFormSenha.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
