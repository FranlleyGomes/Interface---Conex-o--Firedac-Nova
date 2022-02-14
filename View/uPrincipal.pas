unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdBaseComponent,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FdConexao.Model.Interfaces;


type
  TfrmPrincipal = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Editip1: TEdit;
    Editip2: TEdit;
    Editip3: TEdit;
    Editip4: TEdit;
    Editip5: TEdit;
    Editip6: TEdit;
    Editip7: TEdit;
    Edit8: TEdit;
    Editip8: TEdit;
    Editip9: TEdit;
    Edit9: TEdit;
    Editip10: TEdit;
    Edit10: TEdit;
    Editip11: TEdit;
    Edit11: TEdit;
    Editip12: TEdit;
    Edit12: TEdit;
    EdtNrPorta1: TEdit;
    EdtNrPorta2: TEdit;
    EdtNrPorta3: TEdit;
    EdtNrPorta4: TEdit;
    EdtNrPorta5: TEdit;
    EdtNrPorta6: TEdit;
    EdtNrPorta7: TEdit;
    EdtNrPorta8: TEdit;
    EdtNrPorta9: TEdit;
    EdtNrPorta10: TEdit;
    EdtNrPorta11: TEdit;
    EdtNrPorta12: TEdit;
    ImageList1: TImageList;
    IdAntiFreeze1: TIdAntiFreeze;
    IdFTP: TIdFTP;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FConexao : iConexao;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  key : integer;




implementation

{$R *.dfm}

uses uSenha, FdConexao.Cotroller, FdConexao.Controller.Interfaces;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FConexao := TControllerConexao.New.Conexao(tpLerConexao);
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  j : integer;
begin

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  for j := 1 to 12 do
  begin

      if  FileExists(ExtractFilePath(Application.ExeName)+'Paramsfiredac'+IntTostr(j)+'.txt')then
      FConexao
        .NomeDoIni('Paramsfiredac'+IntTostr(j)+'.txt')
        .NumeroIP(TEdit(FindComponent('Editip' + inttostr(j))).Text)
        .VerificarEdit('Editip')
        .NomeDoEdit('Editip'+IntToStr(j))
        .NumeroPorta(TEdit(FindComponent('EdtNrPorta' + inttostr(j))).Text)
        .VerificarEdit('EdtNrPorta')
        .NomeDoEdit('EdtNrPorta'+IntToStr(j))
        .NomeCaminho(TEdit(FindComponent('Edit' + inttostr(j))).Text)
        .VerificarEdit('Edit')
        .NomeDoEdit('Edit'+IntToStr(j))

  end;

  Screen.Cursor := crDefault;

end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
var
  j : integer;
begin
Formsenha := TFormsenha.create(self);
Formsenha.showmodal;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  FConexao := TControllerConexao.New.Conexao(tpGravaConexao);


  try
     for j := 1 to  12 do
      begin
      FConexao
        .NomeTituloIni('InterfaceFire'+IntTostr(j)+'.txt')
        .NomeDoIni('Paramsfiredac'+IntTostr(j)+'.txt')
        .NumeroIP(TEdit(FindComponent('Editip' + inttostr(j))).Text)
        .NumeroPorta(TEdit(FindComponent('EdtNrPorta' + inttostr(j))).Text)
        .NomeCaminho(TEdit(FindComponent('Edit' + inttostr(j))).Text);
      end;
    FConexao := TControllerConexao.New.Conexao(tpGravaDefs);

    FConexao
        .NomeDoIni('Paramsfiredac');

  except on E: Exception do
    Screen.Cursor := crDefault;
  end;



  Screen.Cursor := crDefault;

end;

end.
