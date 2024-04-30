unit utabela;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LR_DB_Zeos, ZConnection;

type

  { TTabGlobal }

  TTabGlobal = class(TDataModule)
    conexao: TZConnection;
    procedure conexaoBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation
   uses uprincipal;

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.conexaoBeforeConnect(Sender: TObject);
begin
  //padrao para quem usa linux
  conexao.Database := cfg_banco;
  conexao.HostName := cfg_servidor;
  conexao.User     := cfg_usuario;
  conexao.password := cfg_senha;
  conexao.Port     := cfg_porta;
  conexao.AutoCommit:= true;
  {$IfDef windows}
  //padrao para quem usa windows
     if cfg_odbc = EmptyStr then
        conexao.LibraryLocation := cfg_pathApp+'libmariadb.dll'
     else
         begin
              conexao.Protocol :='ado';
              conexao.Database :='Driver={'+cfg_odbc+'}; server='+cfg_servidor+'; Database='+cfg_banco+'; User='+cfg_usuario+'; password='+cfg_senha+'; option=3;
         end;

  {$EndIf}
end;

end.

