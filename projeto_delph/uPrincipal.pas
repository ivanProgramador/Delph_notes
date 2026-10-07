unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,Enter,uFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATORIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    PRODUTO2: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    mnFechar: TMenuItem;
    procedure mnFecharClick(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
  private
    { Private declarations }

    //criando uma instancia
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm:TfrmAtualizaDB);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias, uDtmDados, cCadCliente, uCadCliente, uCadProduto;


{
  A ideia dessa procedure é que o sistema faça uma checagem
  se as tabelas necessarias parar o cionenbtoi existem antes do sistema iniciar
  a operação a sintaxe sql qua esta dentro das procedures testa se não banco
  as tabelas necessarias existem se não extirem ele vai criar

}
procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
begin

   //acessa o check box do formulario de ataualização
   //aciona ele e atualiza a conexão
   //espera 1 segundo

   aForm.chkConexao.Checked := true;
   aForm.Refresh;
   Sleep(200);

   //exscuta o scrpta de criar tabela categorias se elas não existir
   dtmDados.QryScriptCategorias.ExecSQL;
   //aciona o check box
   aForm.chkCategoria.Checked := true;
   //ataualiza o formalario com o checkbox selecionado
   aForm.Refresh;
   //espra um segundo
   Sleep(200);

   dtmDados.QryScriptProdutos.ExecSQL;
   aForm.chkProduto.Checked := true;
   aForm.Refresh;
   Sleep(200);

   dtmDados.QryScriptClientes.ExecSQL;
   aForm.chkCliente.Checked := true;
   aForm.Refresh;
   Sleep(200);

   dtmDados.QryScriptVendas.ExecSQL;
   aForm.chkVendas.Checked := true;
   aForm.Refresh;
   Sleep(200);

   dtmDados.QryScriptItensVendas.ExecSQL;
   aForm.chkItensVendas.Checked := true;
   aForm.Refresh;
   Sleep(200);

end;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
   //criando na memoria
   frmCadCategoria := TfrmCadCategoria.Create(Self);

   //mostrando a tela
   frmCadCategoria.ShowModal();

   //liberando a memoria
   frmCadCategoria.Release;

end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin

   frmCadCliente := TfrmCadCliente.Create(Self);
   frmCadCliente.ShowModal;
   frmCadCliente.Release;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     frmAtualizaDB := TfrmAtualizaDB.Create(Self);
     frmAtualizaDB.Show;
     frmAtualizaDB.Refresh;


     if not Assigned(dtmDados) then
      dtmDados := TdtmDados.Create(Application);

    //lib enter
    TeclaEnter := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := True;
    TeclaEnter.FocusColor := clInfoBk;

    AtualizacaoBancoDados(frmAtualizaDB);
    frmAtualizaDB.Free;
end;






procedure TfrmPrincipal.mnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
   frmCadProduto := TfrmCadProduto.Create(Self);
   frmCadProduto.ShowModal;
   frmCadProduto.Release;
end;



end.
