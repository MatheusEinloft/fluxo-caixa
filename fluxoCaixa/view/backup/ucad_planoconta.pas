unit ucad_planoconta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, cad_padrao;

type

  { Tfrmcad_plano }

  Tfrmcad_plano = class(Tfrmcad_padrao)
    edtTipo: TComboBox;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure edtTipoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmcad_plano: Tfrmcad_plano;

implementation

{$R *.lfm}

{ Tfrmcad_plano }

procedure Tfrmcad_plano.FormCreate(Sender: TObject);
begin

end;

procedure Tfrmcad_plano.edtTipoChange(Sender: TObject);
begin

end;

end.

