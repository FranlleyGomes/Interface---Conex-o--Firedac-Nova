unit FdConexaoFactory;

interface

uses
  FdConexao.Model.Interfaces;

type


  TConexaoFactory = class (TInterfacedObject, iConexaoFactory)
  private

     function  GravaConexao : iConexao;
     function  LerConexao : iConexao;
     function  GravarConnectionDefs : iConexao;
  public
    constructor create;
    destructor Destroy ; override;
    class function New : iConexaoFactory;
  end;



implementation

uses
  FDConexao.GravarConexao, FdConexao.GravarConnectionDefs,
  FdConexao.LerConexao;

{ TMyClass }

constructor TConexaoFactory.create;
begin

end;

destructor TConexaoFactory.Destroy;
begin

  inherited;
end;

function TConexaoFactory.GravaConexao: iConexao;
begin
   Result := TGravarConexao.New;
end;

function TConexaoFactory.GravarConnectionDefs: iConexao;
begin
   Result := TConexaoDefs.New;
end;

function TConexaoFactory.LerConexao: iConexao;
begin
  Result := TLerConexao.New;
end;

class function TConexaoFactory.New: iConexaoFactory;
begin
   Result := Self.create;
end;

end.
