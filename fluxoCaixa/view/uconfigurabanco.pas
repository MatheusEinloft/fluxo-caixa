unit uconfigurabanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, IniFiles;

type

  { TfrmConfiguraBanco }

  TfrmConfiguraBanco = class(TForm)
    btnCancela: TSpeedButton;
    edtUsuario: TEdit;
    edtPorta: TEdit;
    edtBanco: TEdit;
    edtServidor: TEdit;
    edtSenha: TEdit;
    l1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    l: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    btnSalva: TSpeedButton;
    procedure btnCancelaClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure edtPortaChange(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
         procedure salva_ini;
         procedure ler_ini;
  public

  end;

var
  frmConfiguraBanco: TfrmConfiguraBanco;

implementation
 uses uprincipal;
{$R *.lfm}

{ TfrmConfiguraBanco }

procedure TfrmConfiguraBanco.FormCreate(Sender: TObject);
begin

end;

procedure TfrmConfiguraBanco.FormShow(Sender: TObject);
begin
  ler_ini;
end;

procedure TfrmConfiguraBanco.btnCancelaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConfiguraBanco.btnSalvaClick(Sender: TObject);
begin
  salva_ini;
  close;
end;

procedure TfrmConfiguraBanco.edtPortaChange(Sender: TObject);
begin

end;

procedure TfrmConfiguraBanco.edtSenhaChange(Sender: TObject);
begin

end;

procedure TfrmConfiguraBanco.salva_ini;
var
   arquivoIni : TIniFile;
   begin
     arquivoIni := TIniFile.Create(cfg_arquivoIni);
     try
       arquivoIni.WriteString('ConexaoDB','Banco', edtBanco.Text);
       arquivoIni.WriteString('ConexaoDB','Servidor', edtServidor.Text);
       arquivoIni.WriteInteger('ConexaoDB','Porta', StrToIntDef(edtPorta.Text,3306));
       arquivoIni.WriteString('ConexaoDB','Usuario', edtUsuario.Text);
       arquivoIni.WriteString('ConexaoDB','Senha', edtSenha.Text);
     finally
       arquivoIni.Free
     end;
   end;

procedure TfrmConfiguraBanco.ler_ini;
   var
      arquivoIni : TIniFile;
   begin
        arquivoIni := TIniFile.Create(cfg_arquivoIni);
        try
          edtBanco.Text := arquivoIni.ReadString('ConexaoDB','Banco', '');
          edtServidor.Text := arquivoIni.ReadString('ConexaoDB','Servidor', '');
          edtPorta.Text := IntToStr(arquivoIni.ReadInteger('ConexaoDB', 'Porta', 3306));
          edtUsuario.Text := arquivoIni.ReadString('ConexaoDB','Usuario', '');
          edtSenha.Text := arquivoIni.ReadString('ConexaoDB','Senha', '');
        finally
          arquivoIni.Free
        end;
   end;

end.










