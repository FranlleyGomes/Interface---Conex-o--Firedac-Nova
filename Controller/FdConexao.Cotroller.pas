unit FdConexao.Cotroller;

interface

uses
  FdConexao.Controller.Interfaces, FdConexao.Model.Interfaces;

Type
  TControllerConexao = class (TInterfacedObject, iControllerConexao)
  private
  function Conexao (Value : TTypeConexao):  iConexao;
  public
    constructor create;
    destructor Destroy ; override;
    class function New : iControllerConexao;
  end;



implementation

uses
  FdConexaoFactory;

{ TControllerConexao }

function TControllerConexao.Conexao(Value: TTypeConexao): iConexao;
begin
  case Value of
    tpLerConexao: Result:= TConexaoFactory.New.LerConexao;
    tpGravaConexao: Result := TConexaoFactory.New.GravaConexao ;
    tpGravaDefs: Result := TConexaoFactory.New.GravarConnectionDefs;
  end;

end;

constructor TControllerConexao.create;
begin

end;

destructor TControllerConexao.Destroy;
begin

  inherited;
end;

class function TControllerConexao.New: iControllerConexao;
begin
   Result := Self.create;
end;

end.
