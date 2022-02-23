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
    EditIP1: TEdit;
    EditIP2: TEdit;
    EditIP3: TEdit;
    EditIP4: TEdit;
    EditIP5: TEdit;
    EditIP6: TEdit;
    EditIP7: TEdit;
    Edit8: TEdit;
    EditIP8: TEdit;
    EditIP9: TEdit;
    Edit9: TEdit;
    EditIP10: TEdit;
    Edit10: TEdit;
    EditIP11: TEdit;
    Edit11: TEdit;
    EditIP12: TEdit;
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
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtnEscolherArquivo: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnEscolherArquivoClick(Sender: TObject);
  private
    { Private declarations }
    FConexao : iConexao;
    procedure LerIni;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  key : integer;


implementation

{$R *.dfm}

uses uSenha, FdConexao.Cotroller, FdConexao.Controller.Interfaces;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
 i : Integer;
 Const  NamePrefix = 'Editip';
begin
    for i := 2 to 12 do
      TEdit(FindComponent(NamePrefix + IntToStr(i))).Text := Editip1.Text;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
var
 i : Integer;
 Const  NamePrefix = 'EdtNrPorta';
begin
    for i := 2 to 12 do
      TEdit(FindComponent(NamePrefix + IntToStr(i))).Text := EdtNrPorta1.Text;

end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
var
 i : Integer;
 Const  NamePrefix = 'Edit';
begin
    for i := 2 to 12 do
      TEdit(FindComponent(NamePrefix + IntToStr(i))).Text := StringReplace(Edit1.Text, '1', IntToStr(i), [rfReplaceAll]);

end;

procedure TfrmPrincipal.BitBtnEscolherArquivoClick(Sender: TObject);
Var
arq : String;
begin
if opendialog1.Execute
then arq := opendialog1.FileName;
Edit1.Text := Arq;

frmPrincipal.Repaint;
end;

procedure TfrmPrincipal.LerIni;
var
  j: Integer;
begin

  FConexao := TControllerConexao.New.Conexao(tpLerConexao);

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  for j := 1 to 12 do
  begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'Paramsfiredac' + IntTostr(j) + '.txt') then
      FConexao.NomeDoIni('Paramsfiredac' + IntTostr(j) + '.txt')
              .NumeroIP(TEdit(FindComponent('Editip' + inttostr(j))).Text)
              .VerificarEdit('Editip').NomeDoEdit('Editip' + IntToStr(j))
              .NumeroPorta(TEdit(FindComponent('EdtNrPorta' + inttostr(j))).Text)
              .VerificarEdit('EdtNrPorta').NomeDoEdit('EdtNrPorta' + IntToStr(j))
              .NomeCaminho(TEdit(FindComponent('Edit' + inttostr(j))).Text)
              .VerificarEdit('Edit').NomeDoEdit('Edit' + IntToStr(j));
  end;
  Screen.Cursor := crDefault;
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
begin
  LerIni;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
var
  j , i : integer;
  Texto : String;
begin

  Texto := 'Paramsfiredac';

Formsenha := TFormsenha.create(self);
Formsenha.showmodal;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  FConexao := TControllerConexao.New.Conexao(tpGravaConexao);


  try
     for i := 1 to 2 do
       for j := 1 to  12 do
        begin
        if i=2 then
            Texto := 'MultFiredac';
        FConexao
          .NomeDoEdit(TEdit(FindComponent('Editip' + inttostr(j))).Name)
          .NomeTituloIni('InterfaceFire'+IntTostr(j))
          .NomeDoIni(Texto+IntTostr(j)+'.txt')
          .NumeroIP(TEdit(FindComponent('Editip' + inttostr(j))).Text)
          .NumeroPorta(TEdit(FindComponent('EdtNrPorta' + inttostr(j))).Text)
          .NomeCaminho(TEdit(FindComponent('Edit' + inttostr(j))).Text);

        end;


    LerIni;

    FConexao := TControllerConexao.New.Conexao(tpGravaDefs);

    FConexao
        .NomeDoIni('Paramsfiredac');

  except on E: Exception do
    Screen.Cursor := crDefault;
  end;



  Screen.Cursor := crDefault;

end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

end.
