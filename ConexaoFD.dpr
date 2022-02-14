program ConexaoFD;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {frmPrincipal},
  FdConexao.Model.Interfaces in 'Model\FdConexao.Model.Interfaces.pas',
  FdConexao.LerConexao in 'Model\FdConexao.LerConexao.pas',
  FDConexao.GravarConexao in 'Model\FDConexao.GravarConexao.pas',
  uSenha in 'View\uSenha.pas' {FormSenha},
  FdConexao.GravarConnectionDefs in 'Model\FdConexao.GravarConnectionDefs.pas',
  FdConexaoFactory in 'Model\FdConexaoFactory.pas',
  FdConexao.Cotroller in 'Controller\FdConexao.Cotroller.pas',
  FdConexao.Controller.Interfaces in 'Controller\FdConexao.Controller.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Configurador de acesso ao banco de dados';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
