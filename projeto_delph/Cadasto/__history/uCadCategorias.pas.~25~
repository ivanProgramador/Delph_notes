unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,cCadCategoria;

type
  {
    Esse formulario é uma extenção do formulario de heranção então ele pode usar
    todos os metodos disponiveis na tela de herança
  }

  TfrmCadCategoria = class(TfrmTelaHeranca)
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCategoria :TCategoria;

  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

uses uDtmDados;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
   begin
       FreeAndNil(oCategoria);
   end;
end;




procedure TfrmCadCategoria.FormCreate(Sender: TObject);

begin
  inherited;
  oCategoria := Tcategoria.Create;
  IndiceAtual := 'descricao';

end;

end.
