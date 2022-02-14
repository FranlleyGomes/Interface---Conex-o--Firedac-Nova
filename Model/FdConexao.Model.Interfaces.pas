unit FdConexao.Model.Interfaces;

interface

type

   iConexao = Interface
   ['{0F83084F-51F8-434F-AE36-9CD90B78A6DF}']

   function NomeDoIni(Value : String) : iConexao;
   function NomeTituloIni (Value : String) : iConexao;
   function NumeroPorta(Value : String): iConexao;
   function NumeroIP (Value : String) : iConexao;
   function NomeCaminho (Value : String) : iConexao;
   function VerificarEdit(Value : String) : iConexao;
   function NomeDoEdit (Value : String) : iConexao;
   End;


   iConexaoFactory = interface
     ['{A76FB169-653B-4589-8FCB-03F5ABD3A450}']
     function  GravaConexao : iConexao;
     function  LerConexao : iConexao;
     function  GravarConnectionDefs : iConexao;
   end;

implementation

end.
