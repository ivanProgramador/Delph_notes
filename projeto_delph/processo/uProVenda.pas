unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,uDtmDados,uDtmVenda,
  RxToolEdit, RxCurrEdit,uEnum,cProVenda;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    qryListagemvendaId: TZIntegerField;
    qryListagemclienteId: TZIntegerField;
    qryListagemnome: TZUnicodeStringField;
    qryListagemdataVenda: TZDateTimeField;
    qryListagemtotalVenda: TZFMTBCDField;
    edtVendaId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    Label4: TLabel;
    edtDataVenda: TDateEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtValorTotal: TCurrencyEdit;
    Label1: TLabel;
    grdItensVenda: TDBGrid;
    Label2: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure grdItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure grdItensVendaDblClick(Sender: TObject);
    procedure lkpProdutoCloseUp(Sender: TObject);

  private

    { Private declarations }
    dtmVenda :TdtmVenda;
    oVenda:TVenda;
    function Apagar:Boolean; Override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; Override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function TotalizarVenda: Double;


  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

{$region 'Override'}

function TfrmProVenda.Apagar: Boolean;
begin
     if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVenda) then
       begin
         Result := oVenda.Apagar(QryListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVenda);
       end;

end;



function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin

    if edtVendaId.Text <> EmptyStr then
       begin
         oVenda.VendaId := StrToInt(edtVendaId.Text);
       end
    else

      oVenda.VendaId :=0;
      oVenda.clienteId := lkpCliente.KeyValue;
      oVenda.dataVenda := edtDataVenda.Date;
      oVenda.totalVenda := edtValorTotal.Value;

    if (EstadoDoCadastro = ecInserir) then
      begin
         Result := oVenda.Inserir(dtmVenda.cdsItensVenda);
      end
    else if(EstadoDoCadastro = ecAlterar) then
      begin
         Result := oVenda.Atualizar;
      end;
end;


{$endregion}

{$region 'Convencional'}

procedure TfrmProVenda.grdItensVendaDblClick(Sender: TObject);
begin
  inherited;
  carregarRegistroSelecionado;
end;

procedure TfrmProVenda.grdItensVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    BloqueiaCTRL_DEL_DBGrid(key,Shift);
end;




procedure TfrmProVenda.lkpProdutoCloseUp(Sender: TObject);
begin
  inherited;
  if not VarIsNull(lkpProduto.KeyValue) then
    begin
      { apontando  a query no id selecionado e fazendo a busca }

      if dtmVenda.QryProdutos.Locate('produtoId', lkpProduto.KeyValue, []) then
      begin

        { se char o id ele preeche logo o valor unitario do porduto que esta selecionado }
        edtValorUnitario.Value := dtmVenda.QryProdutos.FieldByName('valor').AsFloat;

        { coloca a quantidade minima de 1 como um padrão }
        edtQuantidade.Value    := 1;

        { coloca o total do produto com base na quantiodade atual  }
        edtTotalProduto.Value  := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
      end;
    end;
end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(Sender).KeyValue <> Null  then
     begin
       edtValorUnitario.Value := dtmVenda.QryProdutos.FieldByName('Valor').AsFloat;
       edtQuantidade.Value := 1;
       edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value,edtQuantidade.Value);
     end;

end;






procedure TfrmProVenda.btnAdicionarClick(Sender: TObject);
begin
  inherited;


     { Valida os parametros necessarios pra entrara na venda  }
      if (lkpProduto.KeyValue = Null) or VarIsNull(lkpProduto.KeyValue) then
      begin
        MessageDlg('Produto é um campo obrigatório', mtInformation, [mbOK], 0);
        lkpProduto.SetFocus;
        Abort;
      end;

      if edtValorUnitario.Value <= 0 then
      begin
        MessageDlg('O valor unitário não pode ser zero', mtInformation, [mbOK], 0);
        edtValorUnitario.SetFocus;
        Abort;
      end;

      if edtQuantidade.Value <= 0 then
      begin
        MessageDlg('A quantidade não pode ser zero', mtInformation, [mbOK], 0);
        edtQuantidade.SetFocus;
        Abort;
      end;

      { Produto duplicado ainda precisa ser tratado }
      if dtmVenda.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, []) then
      begin
        MessageDlg('Esse produto já foi selecionado', mtInformation, [mbOK], 0);
        lkpProduto.SetFocus;
        Abort;
      end;

      { SINCRONIZAÇÃO CRITICA: coloca a QryProdutos no ID do Lookup }

      if not dtmVenda.QryProdutos.Locate('produtoId', lkpProduto.KeyValue, []) then
      begin
        MessageDlg('Erro ao localizar os dados do produto selecionado.', mtError, [mbOK], 0);
        Exit;
      end;

      { Calcula do total do item }
      edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

      { coloca no ClientDataSet os valores corretos dos edts }

      dtmVenda.cdsItensVenda.Append;
      dtmVenda.cdsItensVenda.FieldByName('produtoId').AsString         := lkpProduto.KeyValue;
      dtmVenda.cdsItensVenda.FieldByName('nomeProduto').AsString       := dtmVenda.QryProdutos.FieldByName('nome').AsString;
      dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat         := edtQuantidade.Value;
      dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat      := edtValorUnitario.Value;
      dtmVenda.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat := edtTotalProduto.Value;
      dtmVenda.cdsItensVenda.Post;

      {calculando o total da venda }

      edtValorTotal.Value := TotalizarVenda;

      { Limpeza dos campos }
      LimparComponenteItem;
      lkpProduto.SetFocus;


end;

procedure TfrmProVenda.LimparComponenteItem;
 begin
    lkpProduto.KeyValue    := null;
    edtQuantidade.Value    := 0;
    edtValorUnitario.Value := 0;
    edtTotalProduto.Value  := 0;
 end;

 {totalizando o produto}

function TfrmProVenda.TotalizarProduto(valorUnitario,Quantidade:Double):Double;
 begin
   result := valorUnitario * Quantidade;
 end;


{
  limpando o cache
   Isso evita que os produtos fiquem na lista quando uma nnova venda for feita
   ou quando uma venda for cancelada, nesse while eu faço um loop que percorre
   a lista do meu cds e enquanto ele não cehgar no final da lista elçe sai deletando
   tudo oque ele achar dentro do cache, ate chegar no final.
}

procedure TfrmProVenda.LimparCds;
begin
  dtmVenda.cdsItensVenda.First;
  while not dtmVenda.cdsItensVenda.Eof do
     dtmVenda.cdsItensVenda.Delete;


end;

{
 Selecionar item
  A remoção de um item da venda vai funcionar em 2 etapas
  1 - ao selecionar o sistema traz os dados do produto de volta para os campos
  2 - o usuario clieca no botão remover eo produto sai da venda
}

procedure TfrmProVenda.CarregarRegistroSelecionado;
  begin
     lkpProduto.KeyValue    := dtmVenda.cdsItensVenda.FieldByName('produtoId').AsString;
     edtQuantidade.Value    := dtmVenda.cdsItensVenda.FieldByName('quantidade').AsFloat;
     edtValorUnitario.Value := dtmVenda.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
     edtTotalProduto.Value  := dtmVenda.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
  end;

{Totaliza a venda }
function TfrmProVenda.TotalizarVenda:Double;
  begin
     {primeiro o result dessa função recebe 0 como valor inicial}
     result := 0;

     {depois eu pego o primeiro indice pora começar o loop isso funciona pra prosicionar o cursor do processador }
     dtmVenda.cdsItensVenda.First;

     {aqui o while começa a percorrer as linhas de registro e enquanto o arquivo não terminar  }
     while not dtmVenda.cdsItensVenda.Eof do
       begin
       {ele pega o campo "ValorTotalProduto" como float e vai somando linha a linha }

         result := result + dtmVenda.cdsItensVenda.FieldByName('ValorTotalProduto').AsFloat;

       {essa linha serve pra sair do loop depois que a ultima linha for lida }
         dtmVenda.cdsItensVenda.Next;
       end;
  end;


procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin

  if oVenda.Selecionar(QryListagem.FieldByName('VendaId').AsInteger,dtmVenda.cdsItensVenda) then
    begin

      edtVendaId.Text     := IntToStr(oVenda.VendaId);
      lkpCliente.KeyValue := oVenda.clienteId;
      edtDataVenda.Date   := oVenda.dataVenda;
      edtValorTotal.Value := oVenda.totalVenda;

    end
  else
    begin
      btnCancelar.Click;
      Abort;
    end;

   inherited;



end;



procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := Date;
  lkpCliente.SetFocus;
  LimparCds;
end;



procedure TfrmProVenda.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue = null then
     begin
       MessageDlg('Selecione o produto a ser excluido !',mtInformation,[mbOK],0);
       grdItensVenda.SetFocus;
       abort;
     end;

  {
     O locate vai comparara o id dos porduto que esta selecionado atualmente
     com o id que existe salvo dentro da tabela cds se esse id existir
     ele apaga o produto e limpa os campos do formulario.
   }

  if dtmVenda.cdsItensVenda.Locate('produtoId',lkpProduto.KeyValue,[]) then
     begin
       dtmVenda.cdsItensVenda.Delete;
       edtValorTotal.Value := TotalizarVenda;
       LimparComponenteItem;
     end;

end;




procedure TfrmProVenda.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
     begin
          FreeAndNil(dtmVenda);
     end;

  if Assigned(oVenda) then
     begin
          FreeAndNil(oVenda);
     end;
end;






procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda := TdtmVenda.Create(Self);
  oVenda   := TVenda.Create(dtmDados.conexao);
  IndiceAtual := 'clienteId';
  //fazendo referencia ao meu dts logo noi inicio do formulario
  grdItensVenda.DataSource := dtmVenda.dtsItensVenda;
end;




{$endregion}
end.
