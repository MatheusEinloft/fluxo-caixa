unit cad_padrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls;

type

  //cb = cliequebotao
  TCliqueBotao = (cbIncluir, cbAlterar, cbNome);
  { Tfrmcad_padrao }

  Tfrmcad_padrao = class(TForm)
    btnAlterar: TSpeedButton;
    btnApagar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnPesquisa: TSpeedButton;
    btnSalvar: TSpeedButton;
    edtPesquisa: TEdit;
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnpRodape: TPanel;
    pnpTitulo: TPanel;
    SpeedButton5: TSpeedButton;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnpTituloClick(Sender: TObject);
  private
    procedure botao_edicao(lFlag:boolean);
  public

  end;

var
  frmcad_padrao: Tfrmcad_padrao;
  cliqueBotao : TCliqueBotao;

implementation

{$R *.lfm}

{ Tfrmcad_padrao }

procedure Tfrmcad_padrao.botao_edicao(lFlag: boolean);
begin
  btnIncluir.visible  := not lFlag;
  btnAlterar.visible  := not lFlag;
  btnApagar.visible   := not lFlag;
  btnSalvar.visible   :=  lFlag;
  btnCancelar.visible :=  lFlag;

end;

procedure Tfrmcad_padrao.pnpTituloClick(Sender: TObject);
begin

end;



procedure Tfrmcad_padrao.btnSalvarClick(Sender: TObject);
begin
  botao_edicao(false);
end;

procedure Tfrmcad_padrao.btnIncluirClick(Sender: TObject);
begin
  botao_edicao(true);
  cliqueBotao := cbIncluir;
end;

procedure Tfrmcad_padrao.btnAlterarClick(Sender: TObject);
begin
  botao_edicao(true);
  cliqueBotao := cbAlterar;
end;

procedure Tfrmcad_padrao.btnApagarClick(Sender: TObject);
begin
  botao_edicao(false);
end;

procedure Tfrmcad_padrao.btnCancelarClick(Sender: TObject);
begin
  botao_edicao(false);
end;

procedure Tfrmcad_padrao.FormShow(Sender: TObject);
begin
  botao_edicao(false);
end;

end.

