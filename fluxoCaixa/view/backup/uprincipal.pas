unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, IniFiles;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    btnCfg: TSpeedButton;
    Label1: TLabel;
    pnpEsquerda: TPanel;
    Shape1: TShape;
    btnContas: TSpeedButton;
    btnSair: TSpeedButton;
    btnPlanos: TSpeedButton;
    btnLancamento: TSpeedButton;
    procedure btnCfgClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure pnpEsquerdaClick(Sender: TObject);
    procedure btnPlanosClick(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
  private
    procedure ler_ini;
  public

  end;

var
  frmprincipal: Tfrmprincipal;
  cfg_arquivoINI, cfg_pathApp : string;
  cfg_banco, cfg_servidor, cfg_usuario, cfg_senha : string;
  cfg_porta : integer;

implementation
  uses uconfigurabanco, utabela;

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
     cfg_arquivoINI := ChangeFileExt(ParamStr(0), '.ini' );
     cfg_pathApp    := ExtractFilePath(ParamStr(0));
end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
  if not FileExists(cfg_arquivoIni) then
     btnCfg.Click;
  ler_ini;
  try
    TabGlobal.conexao.connect;
    ShowMessage('Conectado!');
  except
    on e: exception do

      ShowMessage('Erro ao conectar no banco de dados'+sLineBreak+e.ClassName+sLineBreak+e.Message);
  end;
end;

procedure Tfrmprincipal.Label1Click(Sender: TObject);
begin

end;

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
     ShowMessage('ate breve');
     Application.Terminate;
end;

procedure Tfrmprincipal.btnCfgClick(Sender: TObject);
begin
      frmConfiguraBanco := tfrmConfiguraBanco.Create(self);
      try
        frmConfiguraBanco.ShowModal;
      finally
        FreeAndNil(frmConfiguraBanco);
      end;
end;

procedure Tfrmprincipal.pnpEsquerdaClick(Sender: TObject);
begin

end;

procedure Tfrmprincipal.btnPlanosClick(Sender: TObject);
begin

end;

procedure Tfrmprincipal.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TfrmPrincipal.ler_ini;
   var
      arquivoIni : TIniFile;
   begin
        arquivoIni := TIniFile.Create(cfg_arquivoIni);
        try
          cfg_banco    := arquivoIni.ReadString('ConexaoDB','Banco', '');
          cfg_servidor := arquivoIni.ReadString('ConexaoDB','Servidor', '');
          cfg_porta    := arquivoIni.ReadInteger('ConexaoDB', 'Porta', 3306);
          cfg_usuario  := arquivoIni.ReadString('ConexaoDB','Usuario', '');
          cfg_senha    := arquivoIni.ReadString('ConexaoDB','Senha', '');
        finally
          arquivoIni.Free
        end;
   end;

end.

