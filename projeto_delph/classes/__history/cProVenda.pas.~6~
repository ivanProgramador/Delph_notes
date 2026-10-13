unit cProVenda;

interface
    uses
        System.Classes,
        Vcl.Controls,
        Vcl.ExtCtrls,
        Vcl.Dialogs,
        ZAbstractConnection,
        ZConnection,
        ZAbstractRODataset,
        ZAbstractDataset,
        ZDataset,
        System.SysUtils;

type
   TVenda = class

   private
     ConexaoDB:TZConnection;
     F_vendaId:Integer;
     F_clienteId:Integer;
     F_dataVenda:TDateTime;
     F_totalVenda:Double;

   public

     constructor Create(aConexao:TZConnection);
     destructor Destroy; override;
     function Inserir:Boolean;
     function Atualizar:Boolean;
     function Apagar(id:Integer):Boolean;
     function Selecionar(id:Integer):Boolean;

    published

     property VendaId:Integer     read F_vendaId    write F_vendaId;
     property clienteId:Integer   read F_clienteId  write F_clienteId;
     property dataVenda:TDateTime read F_dataVenda  write F_dataVenda;
     property totalVenda:Double   read F_totalVenda write F_totalVenda;

   end;

implementation
{$region 'constructor e destructor'}

constructor TVenda.Create(aConexao: TZConnection);
   begin
      ConexaoDB := aConexao;
   end;

destructor TVenda.Destroy;
   begin
      inherited;
   end;

{$endregion}

function TVenda.Apagar(id: Integer): Boolean;

 var Qry:TZQuery;

  begin
    if MessageDlg('Apagar registro ' +#13+#13+
                  'Venda numero : ' +IntToStr(VendaId),mtConfirmation,[mbYes,mbNo],0)=mrNo then
    begin
      Result := False;
      abort;
    end;

    try
      Result := true;
      Qry := TZQuery.Create(nil);
      Qry.Connection := ConexaoDB;
      //apagando primeiro os itens da venda

      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM vendasItens ' +
                  ' WHERE vendaId = :vendaId ');
      Qry.ParamByName('vendaId').AsInteger := id;

          try
            Qry.ExecSQL;
             //apagando a venda
             Qry.SQL.Clear;
             Qry.SQL.Add('DELETE FROM vendas ' +
                      ' WHERE vendaId = :vendaId ');
             Qry.ParamByName('vendaId').AsInteger := id;
             Qry.ExecSQL;


             Except
             Result := false;
          End;

       finally
         if Assigned(Qry) then
            begin
               FreeAndNil(Qry);
            end;
    end;
  end;






end.
