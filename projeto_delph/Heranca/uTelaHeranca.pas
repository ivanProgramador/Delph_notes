unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,uEnum,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    lblIndice: TLabel;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
  private

    EstadoDoCadastro: TEstadoDoCadastro;

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,
                          btnApagar:TBitBtn;btnNavigator:TDBNavigator;
                          pgcPrincipal:TPageControl;Flag:Boolean);

    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: integer);
    function retornarCampoTraduzido(Campo:string):string;

  public
    { essa varivel vai ser publica pra ficar acessivel as telas filhas }

    IndiceAtual:string;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uDtmDados;


//procedimentos de controle de tela



procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal:TPageControl;Indice:integer);
  begin
    if (pgcPrincipal.Pages[Indice].TabVisible) then
     begin
         pgcPrincipal.TabIndex := Indice;
     end;

  end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
   qryListagem.Connection := dtmDados.conexao;
   dtsListagem.DataSet := qryListagem;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
  begin

    if (qryListagem.SQL.Text <> EmptyStr) then
      begin
         qryListagem.Open;
      end;

  end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);

begin

   // Pegando o nome do indice da coluna
   IndiceAtual := Column.FieldName;

   //passando ele para a qry
   //a função "IndexFieldNames" serve pra ordenar com base no valor od indice recebido

   qryListagem.IndexFieldNames := IndiceAtual;
   lblIndice.Caption := retornarCampoTraduzido(IndiceAtual);

end;




function TfrmTelaHeranca.retornarCampoTraduzido(Campo: string): string;
var
  i:integer;
begin
  for I := 0 to qryListagem.Fields.Count -1 do
     begin
         if qryListagem.Fields[i].FieldName = Campo then
           begin
             Result := qryListagem.Fields[i].DisplayLabel;
             Break;
           end;
     end;
end;

{
  Essa procedure vai receber um valor atraves da Flag que pode ser true
  ou pode ser false e abseado nisso ela vai inativar ou ativar os botões
}
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,
                          btnApagar:TBitBtn;btnNavigator:TDBNavigator;
                          pgcPrincipal:TPageControl;Flag:Boolean);
   begin

        btnNovo.Enabled := Flag;
        btnApagar.Enabled := Flag;
        btnNavigator.Enabled := Flag;
        pgcPrincipal.Pages[0].TabVisible := Flag;
        btnCancelar.Enabled := not(Flag);
        btnGravar.Enabled := not(Flag);
        btnAlterar.Enabled := Flag;
   end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
   //usando a procedure pra controlar o estado dos outros botões
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
   EstadoDoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,False);
     EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
    ControlarIndiceTab(pgcPrincipal,0);
    EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
     ControlarIndiceTab(pgcPrincipal,0);
     EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
  begin
     try
       ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
       ControlarIndiceTab(pgcPrincipal,0);

       if(EstadoDoCadastro=ecInserir)then
         begin
           showMessage('Inserir');
         end
       else if (EstadoDoCadastro=ecInserir) then
         begin
           showMessage('Alterado');
         end
       else
       showMessage('Nada conteceu');



     finally
        EstadoDoCadastro := ecNenhum;
     end;
  end;

end.
