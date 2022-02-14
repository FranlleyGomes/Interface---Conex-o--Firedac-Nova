unit FdConexao.Controller.Interfaces;

interface

uses
  FdConexao.Model.Interfaces;

type

  TTypeConexao = (tpLerConexao, tpGravaConexao, tpGravaDefs);


   iControllerConexao = interface
     ['{2B60CD08-FA93-47CD-84E3-B3C1FD2F804F}']
     function Conexao(Value : TTypeConexao): iConexao;
   end;

implementation

end.
