unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  {
    Esse formulario é uma extenção do formulario de heranção então ele pode usar
    todos os metodos disponiveis na tela de herança
  }

  TfrmCadCategoria = class(TfrmTelaHeranca)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

uses uDtmDados;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  IndiceAtual := 'descricao';
end;

end.
